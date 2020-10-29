#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-x "x86_64-jmp64-x tests" check-jit)))
