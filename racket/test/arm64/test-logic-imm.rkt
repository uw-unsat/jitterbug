#lang rosette

(require
  (only-in rackunit check-equal? check-not-false)
  serval/lib/unittest
  (only-in serval/arm64/interp/common decode-bit-masks)
  (only-in "../../arm64/insn.rkt" encode-logical-immediate)
  "logic-imm.rkt")

(define (check-decode)
  (for ([e data])
    (match-define (list exp-val (list n immr imms)) e)
    (define (proc m)
      (define-values (act-val _) (decode-bit-masks m (bv n 1) (bv imms 6) (bv immr 6) #t))
      (check-equal? act-val (bv exp-val m)))
    (proc 64)
    (when (zero? n)
      (proc 32))))

(define (check-encode)
  (for ([e data])
    (match-define (list x (list exp-n exp-immr exp-imms)) e)
    (define (proc m)
      (define lst (encode-logical-immediate (zero-extend (bv x m) (bitvector 64)) (bool->bitvector (= m 64))))
      (check-not-false lst)
      (match-define (list act-n act-immr act-imms) lst)
      (check-equal? act-n (bv exp-n 1) "n")
      (check-equal? act-immr (bv exp-immr 6) "immr")
      (check-equal? act-imms (bv exp-imms 6) "imms"))
    (proc 64)
    (when (zero? exp-n)
      (proc 32))))

(define tests
  (test-suite+ "arm64-logic-imm tests"
    (test-case+
      "decode"
      (check-decode))
    (test-case+
      "encode"
      (check-encode))))

(module+ test
  (time (run-tests tests)))
