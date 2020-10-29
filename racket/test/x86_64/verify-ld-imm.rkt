#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_64/spec.rkt" check-jit))

(module+ test
  (time (verify-ld-imm "x86_64-ld-imm tests" check-jit)))
