#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../x32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp32-k "x32-jmp32-k tests" check-jit)))
