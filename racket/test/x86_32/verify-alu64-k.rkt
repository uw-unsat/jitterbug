#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "x86_32-alu64-k tests" check-jit
         #:selector skip-div+mod)))
