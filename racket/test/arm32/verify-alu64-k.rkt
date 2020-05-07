#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "arm32-alu64-k tests" check-jit
         #:selector skip-div+mod)))
