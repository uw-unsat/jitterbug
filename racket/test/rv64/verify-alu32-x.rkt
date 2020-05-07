#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-alu32-x "riscv64-alu32-x tests" check-jit)))
