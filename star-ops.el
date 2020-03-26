;;; starops.el -- Automatically generated -- Do not edit  -*- lexical-binding: t; -*-

(require 'star-util)

(defconst star-ops
  '(  ("all" ( (prefix 1010 1009)))
  ("^=" ( (infix 899 900 899)))
  ("&&" ( (infix 910 910 909)))
  ("pure" ( (prefix 300 299)))
  ("~>" ( (infix 1230 1231 1230)))
  ("throw" ( (prefix 930 929)))
  (".|." ( (infix 720 720 719)))
  ("do" ( (prefix 200 199) (infix 1199 1200 1199)))
  ("import" ( (prefix 900 899)))
  ("catch" ( (infix 1198 1199 1198)))
  ("of" ( (infix 399 400 399)))
  ("valis" ( (prefix 930 929)))
  (",.." ( (infix 999 1000 999)))
  ("for" ( (prefix 1175 1174)))
  ("**" ( (infix 600 600 599)))
  ("->" ( (infix 889 890 889)))
  (".+." ( (prefix 700 699)))
  ("<$" ( (infix 719 720 720)))
  ("then" ( (infix 1179 1180 1179)))
  ("!" ( (prefix 905 904)))
  ("->>" ( (infix 1199 1200 1199)))
  ("=!=" ( (infix 899 900 899)))
  ("default" ( (postfix 939 940)))
  ("#" ( (prefix 1750 1749) (infix 759 760 759)))
  ("%" ( (infix 700 700 699)))
  ("<-" ( (infix 904 905 904)))
  (".>>>." ( (infix 600 600 599)))
  ("<<-" ( (infix 974 975 974)))
  ("*" ( (postfix 699 700) (infix 700 700 699)))
  ("+" ( (postfix 699 700) (infix 720 720 719)))
  (".>>." ( (infix 600 600 599)))
  ("*>" ( (infix 904 905 904)))
  ("," ( (infix 999 1000 1000)))
  ("contract" ( (prefix 1260 1259)))
  ("\\/" ( (infix 720 720 719)))
  ("-" ( (prefix 300 299) (infix 720 720 719)))
  ("." ( (prefix 10 9) (infix 100 100 99)))
  ("/" ( (infix 700 700 699)))
  ("<*>" ( (infix 949 950 950)))
  ("val" ( (prefix 900 899)))
  ("try" ( (prefix 1200 1199)))
  ("exists" ( (prefix 1010 1009)))
  ("if" ( (prefix 1175 1174)))
  ("background" ( (prefix 950 949)))
  (":" ( (infix 1249 1250 1249)))
  (";" ( (infix 1250 1251 1251)))
  ("<" ( (infix 899 900 899)))
  (".=" ( (infix 899 900 899)))
  ("=" ( (infix 974 975 974)))
  ("|:" ( (infix 1234 1235 1234)))
  ("show" ( (prefix 1240 1239)))
  ("++" ( (infix 719 720 720)))
  (">" ( (infix 899 900 899)))
  ("return" ( (prefix 930 929)))
  ("?" ( (infix 919 920 920)))
  ("@" ( (prefix 400 399) (infix 399 400 400)))
  ("in" ( (infix 899 900 900)))
  ("^|" ( (infix 1248 1249 1249)))
  ("open" ( (prefix 900 899)))
  ("~~" ( (infix 1239 1240 1240)))
  ("assert" ( (prefix 1240 1239)))
  ("!!" ( (postfix 99 100)))
  (".^." ( (infix 720 720 719)))
  ("//" ( (infix 960 960 959)))
  ("public" ( (prefix 1700 1699)))
  ("ref" ( (prefix 900 899)))
  (".~." ( (prefix 650 649)))
  ("where" ( (infix 910 911 910)))
  ("=<" ( (infix 899 900 899)))
  ("case" ( (prefix 901 900)))
  ("==" ( (infix 899 900 899)))
  ("\\" ( (infix 700 700 699)))
  ("=>" ( (infix 949 950 950)))
  ("^" ( (prefix 100 99) (infix 99 100 99)))
  ("<=>" ( (infix 949 950 949)))
  ("valof" ( (prefix 300 299)))
  ("while" ( (prefix 1175 1174)))
  ("private" ( (prefix 1200 1199)))
  ("•" ( (infix 450 450 449)))
  (".&." ( (infix 700 700 699)))
  ("///" ( (infix 960 960 959)))
  ("::" ( (infix 399 400 399)))
  ("+++" ( (infix 719 720 720)))
  (":=" ( (infix 974 975 974)))
  (".<<." ( (infix 600 600 599)))
  ("^." ( (infix 450 450 449)))
  (">>=" ( (infix 949 950 950)))
  ("^/" ( (infix 960 960 959)))
  ("<~" ( (infix 1230 1231 1230)))
  ("type" ( (prefix 1251 1250)))
  ("implementation" ( (prefix 1260 1259)))
  ("|" ( (infix 1248 1248 1247)))
  (".#." ( (infix 600 600 599)))
  ("^//" ( (infix 800 800 799)))
  ("||" ( (infix 919 920 920)))
  ("else" ( (infix 1199 1200 1200)))
  ("::=" ( (infix 1249 1250 1249)))
  ("/\\" ( (infix 700 700 699)))
  (">=" ( (infix 899 900 899)))
  (">>" ( (infix 949 950 950)))
)
  "Table of standard star operators"
)

(defconst star-brackets
  '(  ( "{..}" "{." ".}" 2000)
  ( "[]" "[" "]" 2000)
  ( "()" "(" ")" 2000)
  ( "{}" "{" "}" 2000)
  ( "(||)" "(|" "|)" 2000)
)
  "Table of standard star brackets"
)

(defun star-is-a-word (s)
  (string-match "\\`\\w+\\'" s))

(defvar star-op-regexp nil
  "operator regular expression")

(defvar star-bkt-regexp nil
  "bracket regular expression")

(defconst star-opers
  (let ((l star-ops)
        (b star-brackets)
        (ops (make-hash-table :test 'equal))
        (bs ())
        (syms ())
        (words ()))
      (while l
        (let* ((o (car l))
               (op (1st o))
               (specs (2nd o)))
          (puthash op specs ops)
	      (if (star-is-a-word op)
	        (setq words (cons op words))
	       (setq syms (cons op syms)))
          (setq l (cdr l))))
      (while b
        (let* ((o (car b))
               (left (2nd o))
               (right (3rd o))
               (inner (4th o)))
          (puthash left (list `(left ,right ,inner)) ops)
          (puthash right (list `(right ,left ,inner)) ops)
	      (setq bs (cons left (cons right bs)))
          (setq b (cdr b))))
       (let* ((symregexp (star-one-of syms))
              (wsregexp (concat "\\<" (star-one-of words) "\\>")))
         (setq star-op-regexp (star-compose-regexps (list symregexp wsregexp)))
         (setq star-bkt-regexp (star-one-of bs))
         ops)
        )
   "internal table of star operators"
)

(defun star-is-oper (op table mode)
  (let ((specs (gethash op table)))
    (if specs
      (catch 'star-is-oper
        (while specs
          (let ((sp (car specs)))
            (if (eq (1st sp) mode)
              (throw 'star-is-oper (cdr sp))
              (setq specs (cdr specs)))))
            nil)
       nil)))

(defun star-is-prefixop (op)
  (star-is-oper op star-opers 'prefix))

(defun star-prefix-priority (op)
  (let ((spec (star-is-prefixop op)))
    (if spec
      (1st spec)
      nil)))

(defun star-prefix-arg-priority (op)
  (let ((spec (star-is-prefixop op)))
    (if spec
      (2nd spec)
      nil)))

(defun star-is-infixop (op)
  (star-is-oper op star-opers 'infix))

(defun star-is-postfixop (op)
  (star-is-oper op star-opers 'postfix))

(defun star-is-left (op)
  (star-is-oper op star-opers 'left))

(defun star-is-right (op)
  (star-is-oper op star-opers 'right))

(provide 'star-ops)
