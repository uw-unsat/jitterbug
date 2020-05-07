#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-x "arm32-jmp32-x tests" check-jit)))
