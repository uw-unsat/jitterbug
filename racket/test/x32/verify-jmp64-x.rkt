#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../x32/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-x "x32-jmp64-x tests" check-jit)))
