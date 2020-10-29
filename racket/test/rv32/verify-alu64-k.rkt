#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-k "riscv32-alu64-k tests" check-jit
         #:selector skip-div+mod)))
