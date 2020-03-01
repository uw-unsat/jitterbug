#lang rosette

(require
  (prefix-in core: serval/lib/core))

(provide assumptions bvmulhu-uf bvmul-uf bvudiv-uf bvurem-uf)

; Replace bvmul/bvudiv/bvurem with UFs, as they are expensive to
; reason about in SMT.

(define assumptions (make-parameter null))

(define (commute f x y)
  (define e (equal? (f x y) (f y x)))
  (assumptions (cons e (assumptions)))
  (f x y))

; Axiomatize bvmul using theorems (proved in lemmas.lean).

(define (bvmulhu-uf x y)
  (define-symbolic bvmulhu32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; bvmulhu is commutative
    [(32) (commute bvmulhu32 x y)]
    [else (exit 1)]))

(define (bvmul-uf x y)
  (define-symbolic bvmul32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; 64-bit bvmul can be decomposed into 32-bit operations
    [(64) (concat (bvadd (bvmulhu-uf (extract 31 0 x) (extract 31 0 y))
                         (bvmul-uf (extract 31 0 x) (extract 63 32 y))
                         (bvmul-uf (extract 63 32 x) (extract 31 0 y)))
                  (bvmul-uf (extract 31 0 x) (extract 31 0 y)))]
    ; bvmul is commutative
    [(32) (commute bvmul32 x y)]
    [else (exit 1)]))

(define (bvudiv-uf x y)
  (define-symbolic bvudiv32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; no 64-bit bvudiv
    [(32) (bvudiv32 x y)]
    [else (exit 1)]))

(define (bvurem-uf x y)
  (define-symbolic bvurem32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    ; no 64-bit bvurem
    [(32) (bvurem32 x y)]
    [else (exit 1)]))
