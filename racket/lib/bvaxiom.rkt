#lang rosette

(require
  (prefix-in core: serval/lib/core))

(provide (all-defined-out))


; Replace bvmul/bvudiv/bvurem with UFs and theorems (proved in lemmas.lean),
; as they are expensive to reason about in SMT.

(define assumptions (make-parameter null))

(define (assume x) (assumptions (cons x (assumptions))))

(define (commute f x y)
  (define e (equal? (f x y) (f y x)))
  (assumptions (cons e (assumptions)))
  (f x y))

; Axiom for __ffs

(define (ffs-uf x)
  (define-symbolic ffs (~> (bitvector 64) (bitvector 64)))
  ; __ffs(x) is undefined when x == 0
  (assert (! (bvzero? x)))
  (define res (ffs x))
  ; __ffs(x) < 64
  (assume (bvult (ffs x) (bv 64 64)))
  ; ((x >> __ffs(x)) << __ffs(x)
  (assume (bveq (bvshl (bvlshr x (ffs x)) (ffs x)) x))
  ; the ffs bit is non-zero
  (assume (! (bvzero? (core:bv-bit (ffs x) x))))
  (ffs x))

; Axiom shared by 32- and 64-bit JITs.

; x % y = x - (x / y) * y
; needed by ISAs without a modulo instruction (e.g., arm64)
(define (bvurem-uf x y)
  (bvsub x ((core:bvmul-proc) ((core:bvudiv-proc) x y) y)))


; Axioms for 64-bit JITs.

(define (bvmulhu-uf/64 x y)
  (define-symbolic bvmulhu64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvmulhu32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (commute bvmulhu64 x y)]
    [(32) (commute bvmulhu32 x y)]
    [else (exit 1)]))

(define (bvmul-uf/64 x y)
  (define-symbolic bvmul64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvmul32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (commute bvmul64 x y)]
    [(32) (commute bvmul32 x y)]
    [else (exit 1)]))

(define (bvudiv-uf/64 x y)
  (define-symbolic bvudiv64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvudiv32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (bvudiv64 x y)]
    [(32) (bvudiv32 x y)]
    [else (exit 1)]))


; Axioms for 32-bit JITs.

(define (bvmulhu-uf/32 x y)
  (define-symbolic bvmulhu32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; bvmulhu is commutative
    [(32) (commute bvmulhu32 x y)]
    [else (exit 1)]))

(define (bvmul-uf/32 x y)
  (define-symbolic bvmul32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; 64-bit bvmul can be decomposed into 32-bit operations
    [(64) (concat (bvadd ((core:bvmulhu-proc) (extract 31 0 x) (extract 31 0 y))
                         ((core:bvmul-proc) (extract 31 0 x) (extract 63 32 y))
                         ((core:bvmul-proc) (extract 63 32 x) (extract 31 0 y)))
                  ((core:bvmul-proc) (extract 31 0 x) (extract 31 0 y)))]
    ; bvmul is commutative
    [(32) (commute bvmul32 x y)]
    [else (exit 1)]))

(define (bvudiv-uf/32 x y)
  (define-symbolic bvudiv32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; no 64-bit bvudiv
    [(32) (bvudiv32 x y)]
    [else (exit 1)]))
