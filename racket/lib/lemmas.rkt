#lang rosette

(require
  serval/lib/solver)

(provide (all-defined-out))

(current-solver (get-prefer-boolector))
(printf "Using solver ~v\n" (current-solver))

(define-symbolic x y (bitvector 64))

(define (bvmulhu x y)
  (define n (bitvector-size (type-of x)))
  (extract (sub1 (+ n n)) n (bvmul (zero-extend x (bitvector (+ n n))) (zero-extend y (bitvector (+ n n))))))

; bvmul is commutative
(verify (assert
  (bveq (bvmul x y)
        (bvmul y x))))

; bvmulhu is commutative
(verify (assert
  (bveq (bvmulhu x y)
        (bvmulhu y x))))

; bvmul decomposition
#|
(verify (assert
  (bveq (concat (bvadd (bvmulhu (extract 31 0 x) (extract 31 0 y))
                       (bvmul (extract 31 0 x) (extract 63 32 y))
                       (bvmul (extract 63 32 x) (extract 31 0 y)))
                (bvmul (extract 31 0 x) (extract 31 0 y)))
        (bvmul x y))))
|#
