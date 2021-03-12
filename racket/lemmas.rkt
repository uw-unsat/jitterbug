#lang rosette

(require
  "common.rkt"
  serval/lib/bvarith
  serval/lib/solver)

(provide (all-defined-out))

(current-solver (get-prefer-boolector))
(printf "Using solver ~v\n" (current-solver))

(define-symbolic x y (bitvector 64))

(define (bvmulhu x y)
  (define n (bitvector-size (type-of x)))
  (extract (sub1 (+ n n)) n (bvmul (zero-extend x (bitvector (+ n n))) (zero-extend y (bitvector (+ n n))))))

; x != 0 ==> (x >> __ffs(x)) << __ffs(x) == x && __ffs(x) < 64
(verify (assert
  (implies (! (bvzero? x))
    (&& (bveq (bvshl (bvlshr x (__ffs x)) (__ffs x)) x)
        (! (bvzero? (bv-bit (__ffs x) x)))
        (bvzero? (bvand x (bvsub1 (bvshl (bv 1 64) (__ffs x)))))
        (! (bvzero? (bvand x (bvshl (bv 1 64) (__ffs x)))))
        (bvult (__ffs x) (bv 64 64))))))

; bvmul is commutative
(verify (assert
  (bveq (bvmul x y)
        (bvmul y x))))

; bvmulhu is commutative
(verify (assert
  (bveq (bvmulhu x y)
        (bvmulhu y x))))

; x % y = x - (x / y) * y
(verify (assert
  (bveq (bvurem x y)
        (bvsub x (bvmul (bvudiv x y) y)))))

; bvmul decomposition
#|
(verify (assert
  (bveq (concat (bvadd (bvmulhu (extract 31 0 x) (extract 31 0 y))
                       (bvmul (extract 31 0 x) (extract 63 32 y))
                       (bvmul (extract 63 32 x) (extract 31 0 y)))
                (bvmul (extract 31 0 x) (extract 31 0 y)))
        (bvmul x y))))
|#
