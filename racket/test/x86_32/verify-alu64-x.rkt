#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "x86_32-alu64-x tests" check-jit
         #:selector skip-div+mod)))
