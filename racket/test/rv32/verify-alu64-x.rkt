#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "rv32-alu64-x tests" check-jit
         #:selector skip-div+mod)))
