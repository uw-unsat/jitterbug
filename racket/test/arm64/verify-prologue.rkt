#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../arm64/spec.rkt" check-jit))

(module+ test
  (time (verify-prologue "arm64-prologue tests" check-jit)))
