#lang rosette

(require
  rosette/lib/angelic
  serval/lib/solver
  serval/lib/unittest
  "bpf_jit_comp32.rkt"
  "../lib/riscv-common.rkt"
  "../lib/bpf-common.rkt"
  (prefix-in bvaxiom: "../lib/bvaxiom.rkt")
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
  (equal? (bpf:regs->vector (bpf:cpu-regs b)) regs))

(define (init-rv32-cpu riscv-pc bpf-cpu)
  (define bpf-regs (bpf:regs->vector (bpf:cpu-regs bpf-cpu)))
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
          (riscv:interpret-insn cpu i)
          (interpret-program base cpu instrs))))))

(define (run-jitted-code riscv-cpu insns)
  (define base (riscv:cpu-pc riscv-cpu))
  (for/all ([insns insns #:exhaustive])
    (interpret-program base riscv-cpu insns)))


(define rv32-target (make-bpf-target
  #:target-bitwidth 32
  #:target-pc-alignment (bv 4 32)
  #:equiv cpu-equal?
  #:run-jit run-jit
  #:run-code run-jitted-code
  #:init-cpu init-rv32-cpu
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:max-target-size (bv #x800000 32)
  #:target-cpu-pc riscv:cpu-pc
  #:code-size code-size))


(define (check-jit code)
  (parameterize
    ([riscv:XLEN 32]
     [solver-logic 'QF_UFBV]
     [core:target-endian 'little]
     [core:target-pointer-bitwidth 32]
     [max-insn (bv #x100000 32)]
     [core:bvmul-proc bvaxiom:bvmul-uf]
     [core:bvudiv-proc bvaxiom:bvudiv-uf]
     [core:bvurem-proc bvaxiom:bvurem-uf]
     [core:bvmulhu-proc bvaxiom:bvmulhu-uf]
     [bvaxiom:assumptions null])
    (with-default-solver
      (check-verify
        (bpf-jit-specification
          code
          rv32-target
          #:assumptions bvaxiom:assumptions)))))

(define-syntax-rule (jit-verify-case code)
  (test-case+ (format "VERIFY ~s" code) (check-jit code)))

(define-syntax-rule (jit-test-case code)
  (test-case+ (format "TEST ~s" code)
    (parameterize [(verify? #f)]
      (quickcheck (check-jit code)))))
