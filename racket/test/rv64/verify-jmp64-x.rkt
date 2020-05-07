#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-x "riscv64-jmp64-x tests" check-jit)))
