#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "opcodes.h"
#include "ooio.h"
#include "formioP.h"
#include "template.h"
#include <stringBuffer.h>
#include "formexts.h"

/* Generate a header file containing specification of intructions to be implemented by an assembler */

char *templateFn = "assem.h.plate";
char date[MAXLINE] = "";

int getOptions(int argc, char **argv) {
  int opt;

  while ((opt = getopt(argc, argv, "t:d:")) >= 0) {
    switch (opt) {
      case 't':
        templateFn = optarg;
        break;
      case 'd':
        uniCpy(date, NumberOf(date), optarg);
        break;
      default:;
    }
  }
  return optind;
}

static char *dot(opAndSpec A);
static char *capitalize(char *str);
static retCode genInsHedder(ioPo out, char *mnem, int op, opAndSpec A1, int delta, char *cmt);

int main(int argc, char **argv) {
  initLogfile("-");
  installMsgProc('P', genQuotedStr);
  int narg = getOptions(argc, argv);

  if (narg < 0) {
    fprintf(stdout, "bad args");
    exit(1);
  } else {
    if (uniStrLen(date) == 0) {
      time_t rawtime;
      time(&rawtime);
      struct tm *timeinfo = localtime(&rawtime);

      strftime(date, NumberOf(date), "%c", timeinfo);
    }
    ioPo plate = openInFile(templateFn, utf8Encoding);

    if (plate == Null) {
      outMsg(logFile, "cannot find template file %s\n", templateFn);
      exit(1);
    }

    ioPo out;

    if (narg < argc)
      out = openOutFile(argv[narg], utf8Encoding);
    else
      out = Stdout();

    // Template variables
    hashPo vars = NewHash(8, (hashFun) uniHash, (compFun) uniCmp, NULL);
    hashPut(vars, "Date", date);

    // Set up the assembler proper
    bufferPo buff = newStringBuffer();

#undef instruction
#define instruction(M, A1, Dl, cmt) genInsHedder(O_IO(buff),#M,M,A1,Dl,cmt);

#include "instructions.h"

    integer tpLen;
    char *hedderCode = getTextFromBuffer(buff, &tpLen);
    hashPut(vars, "JitHedder", hedderCode);

    processTemplate(out, plate, vars, NULL, NULL);

    closeFile(out);
    exit(0);
  }
}

retCode genInsHedder(ioPo out, char *mnem, int op, opAndSpec A1, int delta, char *cmt) {
  return outMsg(out, "extern retCode do%s();         // %s\n", mnem, cmt);
}

static char *genArg(ioPo out, char *sep, opAndSpec A) {
  switch (A) {
    case nOp:                             // No operand
    case tOs:
      return sep;
    case lit:
    case sym:
    case lne:
    case glb:
    case Es:
    case i32:
    case art:
    case arg:
    case lcl:
    case lcs:
    case off:
    default:
      printf("Problem in generating opcode type\n");
      exit(11);
  }
}

static char *capitalize(char *str) {
  static char buffer[128];
  strcpy(buffer, str);
  if (buffer[0] >= 'a' && buffer[0] <= 'z') {
    buffer[0] = (char) ('A' + (buffer[0] - 'a'));
  }
  return buffer;
}

char *dot(opAndSpec A) {
  switch (A) {
    case nOp:
    case tOs:
      return ".";
    default:
      return "";
  }
}