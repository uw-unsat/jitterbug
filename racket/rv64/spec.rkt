#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/riscv-common.rkt"
  "bpf_jit_riscv64.rkt"
  rosette/lib/angelic
  serval/lib/unittest
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp))

(provide (all-defined-out))

(define (cpu-equal? b r)
  (define bpf-regs (bpf:cpu-regs b))
  (define regs
    (for/vector [(i (in-range (vector-length bpf-regs)))]
      (riscv:gpr-ref r (vector-ref regmap i))))
  (equal? (bpf:cpu-regs b) regs))

(define (init-rv64-cpu target-pc bpf-cpu)
  (define bpf-regs (bpf:cpu-regs bpf-cpu))
  (define riscv-cpu (riscv:init-cpu))
  (riscv:set-cpu-pc! riscv-cpu target-pc)
  (for ([i (in-range (vector-length bpf-regs))])
    (riscv:gpr-set! riscv-cpu (vector-ref regmap i) (vector-ref bpf-regs i)))
  riscv-cpu)

(define (run-jitted-code riscv-cpu insns)
  (define base (riscv:cpu-pc riscv-cpu))
  (for/all ([insns insns #:exhaustive])
    (interpret-program base riscv-cpu insns)))

(define (fetch instrs base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 64))))
  (cond
    [(term? n) #f]
    [(< n (vector-length instrs)) (vector-ref instrs n)]
    [else #f]))

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

; Replace bvmul/bvudiv/bvurem with UFs, as they are expensive to
; reason about in SMT.

(define (bvmul-uf x y)
  (define-symbolic bvmul64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvmul32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (bvmul64 x y)]
    [(32) (bvmul32 x y)]
    [else (exit 1)]))

(define (bvudiv-uf x y)
  (define-symbolic bvudiv64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvudiv32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (bvudiv64 x y)]
    [(32) (bvudiv32 x y)]
    [else (exit 1)]))

(define (bvurem-uf x y)
  (define-symbolic bvurem64 (~> (bitvector 64) (bitvector 64) (bitvector 64)))
  (define-symbolic bvurem32 (~> (bitvector 32) (bitvector 32) (bitvector 32)))
  (case (core:bv-size x)
    [(64) (bvurem64 x y)]
    [(32) (bvurem32 x y)]
    [else (exit 1)]))

(define (check-jit code)
  (parameterize ([core:bvmul-proc bvmul-uf]
                 [core:bvudiv-proc bvudiv-uf]
                 [core:bvurem-proc bvurem-uf])
    (verify-jit-refinement
      code
      #:target-cpu-pc riscv:cpu-pc
      #:target-insn-size (bv 4 64)
      #:target-bitwidth 64
      #:init-cpu init-rv64-cpu
      #:equiv cpu-equal?
      #:run-code run-jitted-code
      #:run-jit emit_insn
      #:max-insn (bv #x1000000 32)
      #:max-target-size (bv #x8000000 32))))

(define-syntax-rule (jit-verify-case code)
  (test-case+ (format "VERIFY ~s" code) (check-jit code)))

(define-syntax-rule (jit-test-case code)
  (test-case+ (format "TEST ~s" code)
    (parameterize [(verify? #f)]
      (quickcheck (check-jit code)))))
