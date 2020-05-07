#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu32-k "riscv32-alu32-k tests" check-jit)))
