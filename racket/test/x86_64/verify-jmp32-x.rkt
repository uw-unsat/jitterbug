#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-x "x86_64-jmp32-x tests" check-jit)))
