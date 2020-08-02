#lang racket/base

(require
  "../lib/tests.rkt"
  (only-in "../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-alu64-x "rv32 alu64 lsh x benchmark" check-jit
         #:selector (verify-only-in '(BPF_LSH)))))
