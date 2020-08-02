#lang rosette

(require
  serval/lib/unittest)

(define cmd (find-executable-path "../../stacklang/gcd.sh"))

(define (gcd-jitted x y)
  (define result
    (with-output-to-string (lambda () (system* cmd (~a x) (~a y)))))
  (define act (string->number (last (string-split result))))
  (define exp (gcd x y))
  (check-equal? act exp))

(define-syntax-rule (gcd-case x y)
  (test-case+
    (format "gcd ~a ~a" x y)
    (gcd-jitted x y)))

(define tests
  (test-suite+ "stacklang gcd tests"
    (gcd-case 135 345)
    (gcd-case 2 200000000)
    (gcd-case 200000000 2)
  ))

(module+ test
  (time (run-tests tests)))
