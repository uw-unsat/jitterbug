#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-stx-xadd "riscv32-stx-xadd tests" check-jit
                         #:selector skip-dw-mem)))
