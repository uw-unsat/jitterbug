#lang rosette

(require
  rosette/lib/angelic
  serval/lib/unittest
  "bpf_jit_comp32.rkt"
  "../lib/riscv-common.rkt"
  "../lib/bpf-common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in riscv: serval/riscv/base)
)

(provide (all-defined-out))

(define (rv_get_bpf_reg rv_cpu bpf_reg)
  (define stack-block (core:find-block-by-name (riscv:cpu-mregions rv_cpu) 'stack))
  (define (loadreg i)
    (if (integer? i)
      (core:mblock-iload stack-block (list (bv (- (- STACK_SIZE 1) i) 32)))
      (riscv:gpr-ref rv_cpu i)))
  (define loreg (bpf_to_rv_reg_lo bpf_reg))
  (define hireg (bpf_to_rv_reg_hi bpf_reg))
  (concat (loadreg hireg) (loadreg loreg)))

(define (rv_put_bpf_reg rv_cpu bpf_reg value)
  (define stack-block (core:find-block-by-name (riscv:cpu-mregions rv_cpu) 'stack))
  (define (storereg i val)
    (if (integer? i)
      (core:mblock-istore! stack-block val (list (bv (- (- STACK_SIZE 1) i) 32)))
      (riscv:gpr-set! rv_cpu i val)))

  (define loreg (bpf_to_rv_reg_lo bpf_reg))
  (define hireg (bpf_to_rv_reg_hi bpf_reg))

  (storereg loreg (extract 31 0 value))
  (storereg hireg (extract 63 32 value)))


(define (cpu-equal? b r)
  (define regs
    (for/vector ([i (in-range 11)])
      (rv_get_bpf_reg r i)))
  (equal? (bpf:cpu-regs b) regs))

(define (init-rv32-cpu riscv-pc bpf-cpu)
  (define bpf-regs (bpf:cpu-regs bpf-cpu))
  (define globals (make-hash (list (cons 'stack (thunk (core:marray STACK_SIZE (core:mcell 4)))))))
  (define stack-top (+ #x1000 (* 4 STACK_SIZE)))
  (define symbols `((#x1000 ,stack-top B stack)))
  (define riscv-cpu (riscv:init-cpu symbols globals))
  (riscv:set-cpu-pc! riscv-cpu riscv-pc)
  (riscv:gpr-set! riscv-cpu 'fp (bv stack-top (riscv:XLEN)))
  (define stack-block (core:find-block-by-name (riscv:cpu-mregions riscv-cpu) 'stack))

  (for ([i (in-range (vector-length bpf-regs))])
    (rv_put_bpf_reg riscv-cpu i (vector-ref bpf-regs i)))

  riscv-cpu)


(define (fetch instrs base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 32))))
  (cond
    [(term? n) #f]
    [(< n (vector-length instrs)) (vector-ref instrs n)]
    [#t #f]))

(define (interpret-program base cpu instrs)
  ; cpu -> riscv cpu
  ; intrs -> vector of instructions
  (for/all ([pc (riscv:cpu-pc cpu) #:exhaustive])
    (begin
      (riscv:set-cpu-pc! cpu pc)
      (define instr (fetch instrs base pc))
      (for/all ([i instr #:exhaustive])
        (when i
          (riscv:interpret-instr cpu i)
          (interpret-program base cpu instrs))))))

(define (run-jitted-code riscv-cpu insns)
  (define base (riscv:cpu-pc riscv-cpu))
  (for/all ([insns insns #:exhaustive])
    (interpret-program base riscv-cpu insns)))


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
    [(32) (commute bvmulhu32 x y)]
    [else (exit 1)]))

(define (bvmul-uf x y)
  (define-symbolic bvmul32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (concat (bvadd (bvmulhu-uf (extract 31 0 x) (extract 31 0 y))
                         (bvmul-uf (extract 31 0 x) (extract 63 32 y))
                         (bvmul-uf (extract 63 32 x) (extract 31 0 y)))
                  (bvmul-uf (extract 31 0 x) (extract 31 0 y)))]
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


(define (check-jit code)
  (parameterize
    ([riscv:XLEN 32]
     [core:target-endian 'little]
     [core:target-pointer-bitwidth 32]
     [core:bvmul-proc bvmul-uf]
     [core:bvudiv-proc bvudiv-uf]
     [core:bvurem-proc bvurem-uf]
     [riscv:bvmulhu-proc bvmulhu-uf]
     [assumptions null])

    (verify-jit-refinement
      code
      #:target-bitwidth 32
      #:target-insn-size (bv 4 32)
      #:equiv cpu-equal?
      #:run-jit run-jit
      #:run-code run-jitted-code
      #:init-cpu init-rv32-cpu
      #:max-insn (bv #x100000 32)
      #:max-target-size (bv #x800000 32)
      #:target-cpu-pc riscv:cpu-pc
      #:assumptions assumptions)))

(define-syntax-rule (jit-verify-case code)
  (test-case+ (format "VERIFY ~s" code) (check-jit code)))

(define-syntax-rule (jit-test-case code)
  (test-case+ (format "TEST ~s" code)
    (parameterize [(verify? #f)]
      (quickcheck (check-jit code)))))
