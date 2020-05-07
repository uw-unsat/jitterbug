#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm64/spec.rkt" check-jit))

(module+ test
  (time (verify-ldx-mem "arm64-ldx-mem tests" check-jit)))
