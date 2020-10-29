#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_64/spec.rkt" check-jit))

(module+ test
  (time (verify-stx-xadd "x86_64-stx-xadd tests" check-jit)))
