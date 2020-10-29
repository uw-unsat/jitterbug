#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-prologue "riscv32-prologue tests" check-jit)))
