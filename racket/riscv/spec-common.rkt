#lang rosette

(require "../lib/hybrid-memory.rkt"
         "../lib/bpf-common.rkt"
         "impl-common.rkt"
         "../lib/spec/bpf.rkt"
         (prefix-in bpf: serval/bpf)
         (prefix-in riscv: serval/riscv/interp)
         (prefix-in core: serval/lib/core))

(provide (all-defined-out))

(define (code-size vec)
  (* 2 (vector-length vec)))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (define (prev-offset insn)
    (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))
  (define ty (type-of target-pc-base))
  (bvadd
    target-pc-base
    (bvshl (zero-extend (prev-offset bpf-pc) ty) (bv 1 ty))))

(define (riscv-arch-safety Tinitial Tfinal)
  (define memmgr (riscv:cpu-memmgr Tfinal))
  (define xlen (riscv:cpu-xlen Tinitial))
  (&&
    ; Return address is correct.
    (equal? (bvand (bvnot (bv 1 xlen)) (riscv:gpr-ref Tinitial 'ra))
            (riscv:cpu-pc Tfinal))
    ; The stack is restored.
    (equal? (riscv:gpr-ref Tfinal 'sp) (hybrid-memmgr-stackbase memmgr))
    ; Callee-save registers are restored.
    (apply &&
      (for/list ([reg '(ra gp tp fp s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11)])
        (equal? (riscv:gpr-ref Tinitial reg)
                (riscv:gpr-ref Tfinal reg))))))


(define (riscv-init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* seen (~> (bitvector 5) boolean?))

  (define-symbolic* ninsns (bitvector 32))

  (define-symbolic* epilogue-offset (bitvector 32))

  ; Some stack size
  (define-symbolic* stack_size (bitvector 32))

  (define ctx (context program-length (vector) insns-addr ninsns epilogue-offset stack_size offsets
                       seen aux))
  ctx)

(define (riscv-epilogue-offset target-pc-base ctx)
  (define ty (type-of target-pc-base))
  (define ep (context-epilogue-offset ctx))
  (bvadd target-pc-base (bvshl (zero-extend ep ty) (bv 1 ty))))

(define (riscv-ctx-valid? ctx insn-idx)
  (define ninsns (context-ninsns ctx))
  (define offset (context-offset ctx))
  (define epilogue-offset (context-epilogue-offset ctx))
  (define program-length (context-program-length ctx))
  (define base (context-insns-addr ctx))

  (&&
    (core:bvaligned? base (bv 4 (type-of base)))

    (equal? epilogue-offset (offset (bvsub1 program-length)))

    (equal? ninsns
            (if (bvzero? insn-idx)
                (bv 0 32)
                (offset (bvsub1 insn-idx))))))

(define (run-jitted-code base riscv-cpu insns)
  (for/all ([insns insns #:exhaustive])
    (interpret-program base riscv-cpu insns)))

(define (interpret-program base cpu insns)
  ; cpu -> riscv cpu
  ; intrs -> vector of instructions
  (for/all ([pc (riscv:cpu-pc cpu) #:exhaustive])
    (begin
      (riscv:set-cpu-pc! cpu pc)
      (define insn (fetch insns base pc))
      (when insn
        (riscv:interpret-insn cpu insn)
        (interpret-program base cpu insns)))))

(define (fetch instrs base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 2 (type-of pc)))))
  (cond
    [(term? n) #f]
    [(< n (vector-length instrs)) (vector-ref instrs n)]
    [else #f]))

(define ((riscv-init-cpu xlen) ctx riscv-pc memmgr)
  (define riscv-cpu (riscv:init-cpu null null (lambda a memmgr) #:xlen xlen))
  (riscv:set-cpu-pc! riscv-cpu riscv-pc)
  riscv-cpu)

(define ((riscv-abstract-regs rv_get_bpf_reg) rv_cpu)
  (apply bpf:regs
    (for/list ([i (in-range MAX_BPF_JIT_REG)])
      (rv_get_bpf_reg rv_cpu (bpf:idx->reg i)))))

(define (riscv-copy-cpu cpu)
  (struct-copy riscv:cpu cpu
    [csrs (struct-copy riscv:csrs (riscv:cpu-csrs cpu))]
    [gprs (struct-copy riscv:gprs (riscv:cpu-gprs cpu))]))
