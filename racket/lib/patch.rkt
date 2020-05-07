#lang racket

(provide BUG PATCH PATCH-TEST with-jit-bug)

(define jit-bug (make-parameter #f))

(define-syntax-rule (BUG body ...)
  (when (jit-bug)
    body ...))

(define-syntax-rule (PATCH body ...)
  (unless (jit-bug)
    body ...))

(define-syntax-rule (PATCH-TEST expr)
  (and (not (jit-bug)) expr))

(define-syntax-rule (with-jit-bug body ...)
  (parameterize ([jit-bug #t])
    body ...))
