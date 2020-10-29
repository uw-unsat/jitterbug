#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-ldx-mem "riscv32-ldx-mem tests" check-jit)))
