
#include <unistd.h>
#include <hash.h>
#include "decodeP.h"
#include <globals.h>
#include <array.h>
#include <arrayP.h>
#include "arithP.h"
#include "strP.h"
#include "heap.h"
#include "signature.h"
#include "labelsP.h"
#include "streamDecode.h"

/*
 * Decode a structure from an input stream
 */

static retCode estimate(ioPo in, integer *amnt);
static retCode decodeRecLbl(ioPo in, encodePo S, termPo *tgt, bufferPo tmpBuffer, char *errorMsg, integer msgSize);
static retCode decodeListCount(ioPo in, integer *count, char *errorMsg, integer msgSize);

retCode decodeTerm(ioPo in, heapPo H, termPo *tgt, char *errorMsg, long msgSize) {
  EncodeSupport support = {errorMsg, msgSize, H};
  logical isBlocked = False;
  logical isAsynched = False;

  if (objectHasClass(O_OBJECT(in), fileClass)) {
    if (!isFileBlocking(O_FILE(in))) {
      isBlocked = True;
      configureIo(O_FILE(in), turnOnBlocking);
    }
    if (isFileAsynch(O_FILE(in))) {
      isAsynched = True;
      configureIo(O_FILE(in), disableAsynch);
    }
  }

  codePoint ch;

  again:
  switch (inChar(in, &ch)) {
    case Eof:
      return Eof;
    default:
      strMsg(errorMsg, msgSize, "stream prematurely ended");
      return Error;
    case Interrupt:
      goto again;
    case Ok: {
      if (ch != strTrm) {
        strMsg(errorMsg, msgSize, "invalid lead-in in code sequence");
        goto error_exit;
      } else {
        codePoint delim;

        switch (inChar(in, &delim)) {
          case Ok: {
            bufferPo buffer = newStringBuffer();
            while (True) {
              switch (inChar(in, &ch)) {
                case Ok:
                  if (ch == delim) {
                    rewindBuffer(buffer);

                    integer amnt;

                    retCode res = estimate(O_IO(buffer), &amnt);

                    //logMsg(logFile,"Estimate of space requirements: %d heap, %d permanent",perm);


                    if (res == Ok)
                      res = reserveSpace(H, amnt);

                    if (res == Ok) {
                      rewindBuffer(buffer); /* re-read from string buffer */
                      bufferPo tmpBuffer = newStringBuffer();

                      res = decode(O_IO(buffer), &support, H, tgt, tmpBuffer);

                      closeFile(O_IO(buffer));
                      closeFile(O_IO(tmpBuffer));
                    }

                    if (objectHasClass(O_OBJECT(in), fileClass)) {
                      if (isBlocked)
                        configureIo(O_FILE(in), turnOffBlocking);
                      if (isAsynched)
                        configureIo(O_FILE(in), enableAsynch);
                    }
                    return res;
                  } else {
                    outChar(O_IO(buffer), ch);
                    continue;
                  }
                case Eof:
                  strMsg(errorMsg, msgSize, "unexpected eof");
                  goto error_exit;
                case Error:
                default:
                  strMsg(errorMsg, msgSize, "stream prematurely ended");
                  goto error_exit;
              }
            }
          }
          default:
            strMsg(errorMsg, msgSize, "stream prematurely ended");
            goto error_exit;
        }
      }
    }
  }
  error_exit:
  if (objectHasClass(O_OBJECT(in), fileClass)) {
    if (isBlocked)
      configureIo(O_FILE(in), turnOffBlocking);
    if (isAsynched)
      configureIo(O_FILE(in), enableAsynch);
  }
  return Error;
}

/*
 Estimate amount of heap space needed
 */

typedef struct {
  integer amnt;
} Estimation;

static retCode nullEstimate(void *cl) {
  return Ok;
}

static retCode estimateVoid(void *cl) {
  return Ok;
}

static retCode estimateInt(integer _, void *cl) {
  Estimation *info = (Estimation *) cl;
  info->amnt += IntegerCellCount;
  return Ok;
}

static retCode estimateFlt(double dx, void *cl) {
  Estimation *info = (Estimation *) cl;
  info->amnt += FloatCellCount;
  return Ok;
}

static retCode estimateString(char *nm, integer size, void *cl) {
  Estimation *info = (Estimation *) cl;

  info->amnt += CellCount(sizeof(StringRecord) + (size + 1) * sizeof(char));
  return Ok;
}

static retCode estimateLbl(char *nm, integer arity, void *cl) {
  return Ok;
}

static retCode estimateRecLbl(char *nm, integer arity, FieldRec fields[], void *cl) {
  return Ok;
}

static retCode estimateCns(integer arity, void *cl) {
  Estimation *info = (Estimation *) cl;

  info->amnt += arity + 1;
  return Ok;
}

static retCode endEstimateCns(void *cl) {
  return Ok;
}

static retCode estimateLst(integer count, void *cl) {
  Estimation *info = (Estimation *) cl;

  info->amnt += ListCellCount + BaseCellCount(count);
  return Ok;
}

static retCode endEstimateLst(void *cl) {
  return Ok;
}

/*
 Estimate amount of heap space needed
 */
retCode estimate(ioPo in, integer *amnt) {
  Estimation info = {0};

  DecodeCallBacks estimateCB = {
    nullEstimate,           // startDecoding
    nullEstimate,           // endDecoding
    estimateVoid,           // decVoid
    estimateInt,            // decInt
    estimateFlt,            // decFlt
    estimateLbl,           // decLbl
    estimateRecLbl,         // record label
    estimateString,         // decString
    estimateCns,            // decCon
    endEstimateCns,         // End of constructor
    estimateLst,            // Start of list
    endEstimateLst          // End of list
  };

  retCode ret = streamDecode(in, &estimateCB, &info, NULL, 0);

  if (ret == Ok) {
    *amnt = info.amnt;
  }

  return ret;
}

/*
 Warning: caller assumes responsibility for ensuring that tgt is a valid root
 */


retCode decode(ioPo in, encodePo S, heapPo H, termPo *tgt, bufferPo tmpBuffer) {
  codePoint ch;
  retCode res = inChar(in, &ch);

  if (res == Eof)
    return Eof;
  switch (ch) {
    case vodTrm: {
      *tgt = (termPo) voidEnum;
      return Ok;
    }
    case intTrm: {
      integer i;
      if ((res = decInt(in, &i)) != Ok)
        return res;
      *tgt = (termPo) allocateInteger(H, i);
      return Ok;
    }
    case fltTrm: {
      double dx;
      if ((res = decFlt(in, &dx)) != Ok)
        return res;
      *tgt = (termPo) allocateFloat(H, dx);
      return Ok;
    }
    case enuTrm: {
      if ((res = decodeText(in, tmpBuffer)) == Ok) {
        integer len;
        *tgt = (termPo) declareLbl(getTextFromBuffer(tmpBuffer, &len), 0);
      }
      return res;
    }
    case lblTrm: {
      integer arity;

      if ((res = decInt(in, &arity)) != Ok) /* How many arguments in the class */
        return res;

      if ((res = decodeText(in, tmpBuffer)) == Ok) {
        integer len;
        *tgt = (termPo) declareLbl(getTextFromBuffer(tmpBuffer, &len), arity);
      }
      return res;
    }
    case recTrm: {
      return decodeRecLbl(in, S, tgt, tmpBuffer, S->errorMsg, S->msgSize);
    }
    case strTrm: {
      if ((res = decodeText(in, tmpBuffer)) == Ok) {
        integer len;
        const char *txt = getTextFromBuffer(tmpBuffer, &len);
        *tgt = (termPo) allocateString(H, txt, len);
      }
      return res;
    }
    case dtaTrm: {
      termPo lbl;
      integer arity;

      if ((res = decInt(in, &arity)) != Ok) /* How many arguments in the class */
        return res;

      if ((res = decode(in, S, H, &lbl, tmpBuffer)) != Ok)
        return res;

      if (res == Ok) {
        if (labelArity(C_LBL(lbl)) != arity)
          res = Error;
      }

      if (res == Ok) {
        int root = gcAddRoot(H, &lbl);
        normalPo obj = allocateStruct(H, C_LBL(lbl));
        *tgt = (termPo) (obj);

        termPo el = voidEnum;
        gcAddRoot(H, &el);
        gcAddRoot(H, (ptrPo) &obj);

        // In case of GC, we mark all the elements as void before doing any decoding
        for (integer ix = 0; ix < arity; ix++)
          setArg(obj, ix, voidEnum);

        for (integer i = 0; res == Ok && i < arity; i++) {
          res = decode(in, S, H, &el, tmpBuffer); /* read each element of term */
          if (res == Ok)
            setArg(obj, i, el);
        }

        gcReleaseRoot(H, root);
      }

      return res;
    }

    case lstTrm: {
      termPo lbl;
      integer count;

      if ((res = decInt(in, &count)) != Ok) /* How many elements in the list */
        return res;

      if (res == Ok) {
        int root = gcAddRoot(H, &lbl);
        arrayPo lst = allocateArray(H, count);
        *tgt = (termPo) (lst);

        termPo el = voidEnum;
        gcAddRoot(H, &el);

        for (integer i = 0; res == Ok && i < count; i++) {
          res = decode(in, S, H, &el, tmpBuffer); /* read each element of term */
          if (res == Ok)
            lst = appendToArray(H, lst, el);
        }

        gcReleaseRoot(H, root);
      }

      return res;
    }

    default: {
      strMsg(S->errorMsg, S->msgSize, "invalid encoding");
      return Error;
    }
  }
}

retCode decodeTplCount(ioPo in, integer *count, char *errorMsg, integer msgSize) {
  if (isLookingAt(in, "n") == Ok) {
    char nm[MAXLINE];
    integer ar;
    retCode ret = decInt(in, count);
    if (ret == Ok) {
      ret = decodeLbl(in, nm, NumberOf(nm), &ar, errorMsg, msgSize);
      if (ret == Ok) {
        if (ar != *count) {
          strMsg(errorMsg, msgSize, "invalid tuple arity encoding");
          return Error;
        }
      }
    }
    return ret;
  } else
    return Fail;
}

retCode decodeListCount(ioPo in, integer *count, char *errorMsg, integer msgSize) {
  if (isLookingAt(in, "l") == Ok) {
    return decInt(in, count);
  } else
    return Fail;
}

retCode decodeRecLbl(ioPo in, encodePo S, termPo *tgt, bufferPo tmpBuffer, char *errorMsg, integer msgSize) {
  char lblName[MAX_SYMB_LEN];
  bufferPo pkgB = fixedStringBuffer(lblName, NumberOf(lblName));

  retCode ret = decodeText(in, pkgB);

  if (ret == Ok) {
    integer arity;
    ret = decodeListCount(in, &arity, errorMsg, msgSize);

    if (ret == Ok) {
      integer lblLen;
      char *Nm = getTextFromBuffer(pkgB, &lblLen);
      labelPo lbl = declareLbl(Nm, arity);

      fieldTblPo fieldTbl = newFieldTable(arity);
      declareFields(lbl, fieldTbl);

      for (integer ix = 0; ret == Ok && ix < arity; ix++) {
        if (isLookingAt(in, fieldPreamble) == Ok) {
          char fieldName[MAX_SYMB_LEN];
          integer fieldArity;
          ret = decodeLbl(in, fieldName, NumberOf(fieldName), &fieldArity, errorMsg, msgSize);
          if (ret == Ok) {
            labelPo field = declareLbl(fieldName, fieldArity);
            ret = skipEncoded(in, errorMsg, msgSize); // Field signature
            if (ret == Ok) {
              integer offset, size;
              ret = decodeInteger(in, &offset);
              if (ret == Ok) {
                ret = decodeInteger(in, &size);
                if (ret == Ok)
                  setFieldTblEntry(fieldTbl, field, offset, size);
              }
            }
          }
        } else
          ret = Fail;
      }
      if (ret != Ok) {
        clearFieldTable(lbl);
        *tgt = Null;
      } else
        *tgt = (termPo) lbl;
    }
  }
  closeFile(O_IO(pkgB));

//  outMsg(logFile, "%#T\n", *tgt);
  return ret;
}
