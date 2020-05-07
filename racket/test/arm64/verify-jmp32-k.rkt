#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-k "arm64-jmp32-k tests" check-jit)))
