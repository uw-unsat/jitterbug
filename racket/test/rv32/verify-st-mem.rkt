#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-st-mem "riscv32-st-mem tests" check-jit)))
