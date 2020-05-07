#lang rosette

(require (prefix-in core: serval/lib/debug) serval/lib/bvarith)

(provide (all-defined-out))

(define (__round_mask x y)
  (bvsub1 y))

; Round x down to multiple of y.
; y must be power of 2.
; x and y must be the same size.
(define (round_down x y)
  (bvand x (bvnot (__round_mask x y))))

; Round x up to multiple of y;
; y must be power of 2.
; x and y must be the same size.
(define (round_up x y)
  (bvadd1 (bvor (bvsub1 x) (__round_mask x y))))

; (Signed) max of two bitvectors.
; We need to specify signedness explicitly in Racket since bitvectors do not carry around signedness
; in their types.
(define (smax x y)
  (if (bvsge x y) x y))

; From kernel documentation: https://www.kernel.org/doc/htmldocs/kernel-api/API---ffs.html
;   __ffs — find first set bit in word
;   Undefined if no bit exists, so code should check against 0 first.
(define (__ffs val)
  (define size (bitvector-size (type-of val)))
  (define (loop n)
    (cond
      [(>= n size) (core:bug #:msg "__ffs: all zeros")]
      [(! (bvzero? (bit n val)))
        (bv n size)]
      [else (loop (+ n 1))]))
  (loop 0))

(define __ffs64 __ffs)

; ffs returns a one-based index; for example, ffs(0) returns 0 and ffs(1) returns 1.
(define (ffs x)
  (define n (bitvector-size (type-of x)))
  (define r (ormap (lambda (i) (if (bitvector->bool (bit i x)) (bv (add1 i) 32) #f)) (range n)))
  (if r r (bv 0 32)))

; From kernel documentation: https://www.kernel.org/doc/htmldocs/kernel-api/API-fls64.html
;   fls64(value) returns 0 if value is 0 or the position of the last set bit if value is nonzero.
;   The last (most significant) bit is at position 64.
(define (fls64 val64)
  (define (loop n)
    (cond
      [(< n 0) (bv 0 64)]
      [(! (bvzero? (bit n val64)))
        (bv (+ n 1) 64)]
      [else (loop (- n 1))]))
  (loop 63))

(define (fls x)
  (extract 31 0 (fls64 (zero-extend x (bitvector 64)))))

(define rol32 bvrol)
(define ror32 bvror)

(define (GENMASK n m)
  (define size (type-of n))
  (define N (bitvector-size size))
  (apply bvor
    (for/list ([i (in-range N)])
      (if (&& (bvule (bv i size) n) (bvuge (bv i size) m))
          (bvshl (bv 1 size) (bv i size))
          (bv 0 size)))))
