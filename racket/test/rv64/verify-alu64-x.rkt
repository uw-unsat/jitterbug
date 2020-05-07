#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "riscv64-alu64-x tests" check-jit)))
