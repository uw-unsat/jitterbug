#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm64/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "arm64-alu64-k tests" check-jit)))
