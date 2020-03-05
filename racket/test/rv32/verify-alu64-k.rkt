#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "rv32-alu64-k tests" check-jit
         #:selector skip-div+mod)))
