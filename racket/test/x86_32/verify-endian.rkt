#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_32/spec.rkt" check-jit))

(module+ test
  (time (verify-endian "x86_32-endian tests" check-jit)))
