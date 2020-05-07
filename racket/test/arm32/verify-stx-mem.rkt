#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit))

(module+ test
  (time (verify-stx-mem "arm32-stx-mem tests" check-jit)))
