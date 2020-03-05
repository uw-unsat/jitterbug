#lang racket

(require
  "../../lib/tests.rkt"
  (only-in "../../x32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu32-x "x32-alu32-x tests" check-jit)))
