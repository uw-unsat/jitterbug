#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_32/spec.rkt" check-jit))

(module+ test
  (time (verify-st-mem "x86_32-st-mem tests" check-jit)))
