#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-stx-xadd "riscv64-stx-xadd tests" check-jit)))
