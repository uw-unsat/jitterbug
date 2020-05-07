#lang racket/base

(require
  "../../lib/tests.rkt"
  (only-in "../../rv64/spec.rkt" check-jit))

(module+ test
  (time (verify-jmp64-k "riscv64-jmp64-k tests" check-jit)))
