#lang racket/base

(require
  "../lib/tests.rkt"
  (only-in "../rv32/spec.rkt" check-jit))

(module+ test
  (time (verify-stx-mem "rv32 stx dw benchmark" check-jit
         #:selector (verify-only-in '(BPF_DW)))))
