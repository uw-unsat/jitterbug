#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../x32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "x32-alu64-k tests" check-jit
         #:selector skip-div+mod)))
