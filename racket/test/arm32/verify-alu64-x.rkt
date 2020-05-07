#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "arm32-alu64-x tests" check-jit
         #:selector skip-div+mod)))
