#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-x "arm32-jmp64-x tests" check-jit)))
