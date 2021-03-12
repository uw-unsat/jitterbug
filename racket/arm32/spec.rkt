#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/spec/proof.rkt"
  "../lib/spec/bpf.rkt"
  (only-in "bpf_jit.rkt" ARM_FP ARM_SP ARM_LR ARM_R0 ARM_R1)
  "bpf_jit_comp.rkt"
  "bpf_jit.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in arm32: serval/arm32))

(provide (all-defined-out))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* ninsns epilogue-offset (bitvector 32))

  (define-symbolic* stack_size (bitvector 32))

  (define ctx (context (vector) ninsns epilogue-offset offsets program-length stack_size aux))
  ctx)

(define (arm32-epilogue-offset target-pc-base ctx)
  (bvadd target-pc-base (bvshl (context-epilogue-offset ctx) (bv 2 32))))

(define (arm32-ctx-valid? ctx insn-idx)
  (define offsets (context-offsets ctx))
  (define aux (context-aux ctx))
  (define program-length (context-program-length ctx))
  (&&
      (equal? (context-stack_size ctx) (STACK_SIZE aux))

      (equal? (context-idx ctx)
              (if (bvzero? insn-idx)
                  (bv 0 32)
                  (offsets (bvsub1 insn-idx))))
      (equal? (offsets (bvsub1 program-length)) (context-epilogue-offset ctx))))

(define (cpu-abstract-regs cpu)
  (define mm (arm32:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define (loadreg i)
    (if (is_stacked i)
      (core:memmgr-load mm
                        (bvadd (arm32:cpu-gpr-ref cpu ARM_FP)
                               (sign-extend (EBPF_SCRATCH_TO_ARM_FP i) (bitvector 32)))
                        (bv 0 32) (bv 4 32))
      (arm32:cpu-gpr-ref cpu i)))
  (apply bpf:regs
    (for/list [(i (in-range MAX_BPF_JIT_REG))]
      (define k (bpf:idx->reg i))
      (define p (bpf2a32 k))
      (concat (loadreg (car p)) (loadreg (cdr p))))))

(define (init-arm32-cpu ctx target-pc memmgr)
  (define arm32-cpu (arm32:init-cpu memmgr))
  (arm32:cpu-pc-set! arm32-cpu target-pc)
  arm32-cpu)

(define (run-jitted-code base arm32-cpu insns)
  (for/all ([insns insns #:exhaustive])
    (interpret-program base arm32-cpu insns)))

(define (fetch insns base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 (type-of pc)))))
  (cond
    [(term? n) #f]
    [(< n (vector-length insns)) (vector-ref insns n)]
    [else #f]))

(define (interpret-program base cpu insns)
  (for/all ([pc (arm32:cpu-pc cpu) #:exhaustive])
    (begin
      (arm32:cpu-pc-set! cpu pc)
      (define insn (fetch insns base pc))
      (when insn
        (arm32:interpret-insn cpu insn)
        (interpret-program base cpu insns)))))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offsets ctx))
  (define (prev-offset insn)
    (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))
  (bvadd
    target-pc-base
    (bvmul (prev-offset bpf-pc) (bv 4 32))))

(define (code-size vec)
  (* 4 (vector-length vec)))

(define (arm32-arch-invariants ctx initial-cpu cpu)
  (define mm (arm32:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define (loadsavedreg off)
    (core:memmgr-load mm stackbase (bv (- off 4) 32) (bv 4 32)))

  (&&
    ; PC is aligned.
    (core:bvaligned? (arm32:cpu-pc cpu) (bv 4 32))
    ; SP is aligned
    (core:bvaligned? (arm32:cpu-gpr-ref cpu ARM_SP) (bv 4 32))
    ; Callee-saved regs on stack.
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_LR) (loadsavedreg (- 4)))
    ; NB: ARM_IP is saved, but is used before push so the value is not the same as in the initial cpu. Doesn't matter since IP is not callee-saved.
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_FP) (loadsavedreg (- 12)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R9) (loadsavedreg (- 16)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R8) (loadsavedreg (- 20)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R7) (loadsavedreg (- 24)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R6) (loadsavedreg (- 28)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R5) (loadsavedreg (- 32)))
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R4) (loadsavedreg (- 36)))

    ; Unused callee-save registers do not change values.
    (equal? (arm32:cpu-gpr-ref initial-cpu ARM_R10) (arm32:cpu-gpr-ref cpu ARM_R10))

    ; Invariant registers hold their values.
    (apply &&
      (for/list ([inv (arm32-cpu-invariant-registers ctx cpu)])
        (equal? (arm32:cpu-gpr-ref cpu (car inv)) (cdr inv))))))

(define (arm32-cpu-invariant-registers ctx cpu)
  (define memmgr (arm32:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define scratch-size (bv SCRATCH_SIZE 32))
  (define aux (context-aux ctx))

  (list (cons ARM_FP (bvsub stackbase (bv 4 32)))
        (cons ARM_SP (bvsub stackbase
                            (saved-regs-stack-size)
                            (STACK_SIZE aux)))))

(define (arm32-init-arch-invariants! ctx arm32-cpu)
  (for ([inv (arm32-cpu-invariant-registers ctx arm32-cpu)])
    (arm32:cpu-gpr-set! arm32-cpu (car inv) (cdr inv))))

(define (arm32-simulate-call cpu call-addr call-fn)
  (define memmgr (arm32:cpu-memmgr cpu))
  (define (loadfromstack off)
    (core:memmgr-load memmgr (arm32:cpu-gpr-ref cpu ARM_SP) off (bv 4 32)))

  (define args (list
    (concat (arm32:cpu-gpr-ref cpu (arm32:integer->gpr 1)) (arm32:cpu-gpr-ref cpu (arm32:integer->gpr 0)))
    (concat (arm32:cpu-gpr-ref cpu (arm32:integer->gpr 3)) (arm32:cpu-gpr-ref cpu (arm32:integer->gpr 2)))
    (concat (loadfromstack (bv 4 32)) (loadfromstack (bv 0 32)))
    (concat (loadfromstack (bv 12 32)) (loadfromstack (bv 8 32)))
    (concat (loadfromstack (bv 20 32)) (loadfromstack (bv 16 32)))))

  ; Compute result using calling convention.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Execute a "return" instruction (br r30).
  (arm32:set-cpu-pc! cpu (arm32:cpu-gpr-ref cpu ARM_LR))
  ; FIXME: havoc caller-saved registers
  (arm32:cpu-gpr-set! cpu ARM_R1 (extract 63 32 result))
  (arm32:cpu-gpr-set! cpu ARM_R0 (extract 31 0 result)))

(define (saved-regs-stack-size)
  (if (CONFIG_FRAME_POINTER)
      (bv (* 4 10) 32)
      (bv (* 4 8) 32)))

(define (arm32-max-stack-usage ctx)
  (define aux (context-aux ctx))

  (define call-args (bv (* 3 8) 32))

  (bvadd (saved-regs-stack-size)
         (STACK_SIZE aux)
         call-args))

(define (arm32-bpf-stack-range ctx)
  ; Compute the BPF stack region as offsets from stackbase
  (define aux (context-aux ctx))
  (define bpf-stack-depth (bpf-prog-aux-stack_depth aux))

  (define scratch-size (bv SCRATCH_SIZE 32))

  (define top
    (bvneg
      (bvadd (saved-regs-stack-size) ; Callee-saved registers
             scratch-size)))         ; eBPF JIT scratch space

  (define bottom
    (bvsub top bpf-stack-depth))

  (cons bottom top))

(define (arm32-initial-state? ctx input cpu)
  (define memmgr (arm32:cpu-memmgr cpu))
  (&& (core:bvaligned? (arm32:cpu-pc cpu) (bv 4 32))
      (core:bvaligned? (arm32:cpu-gpr-ref cpu ARM_SP) (bv 8 32))
      (equal? (arm32:cpu-gpr-ref cpu ARM_R0) (core:trunc 32 (program-input-r1 input)))
      (equal? (arm32:cpu-gpr-ref cpu ARM_SP) (hybrid-memmgr-stackbase memmgr))))

(define (arm32-copy-cpu cpu)
  (struct-copy arm32:cpu cpu
    [rs   (vector-copy (arm32:cpu-rs cpu))]
    [cpsr (struct-copy arm32:pstate (arm32:cpu-cpsr cpu))]))

(define (arm32-arch-safety Tinitial Tfinal)
  (&&
    ; Return address is correct.
    (equal? (bvand (bvnot (bv 1 32)) (arm32:cpu-gpr-ref Tinitial ARM_LR))
            (bvsub (arm32:cpu-pc Tfinal) (bv 4 32)))
    ; Callee-saved registers restored.
    (apply &&
      (for/list ([reg (list ARM_R4 ARM_R5 ARM_R6 ARM_R7 ARM_R8 ARM_R9 ARM_R10 ARM_FP)])
        (equal? (arm32:cpu-gpr-ref Tinitial reg) (arm32:cpu-gpr-ref Tfinal reg))))))

(define arm32-target (make-bpf-target
  #:target-bitwidth 32
  #:init-cpu init-arm32-cpu
  #:simulate-call arm32-simulate-call
  #:supports-pseudocall #f
  #:arch-invariants arm32-arch-invariants
  #:init-arch-invariants! arm32-init-arch-invariants!
  #:abstract-regs cpu-abstract-regs
  #:run-code run-jitted-code
  #:emit-insn build_insn
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage arm32-max-stack-usage
  #:max-target-size #x800000
  #:function-alignment 4
  #:ctx-valid? arm32-ctx-valid?
  #:epilogue-offset arm32-epilogue-offset
  #:emit-prologue (lambda (ctx) (build_prologue ctx) (context-target ctx))
  #:emit-epilogue (lambda (ctx) (build_epilogue ctx) (context-target ctx))
  #:initial-state? arm32-initial-state?
  #:copy-target-cpu arm32-copy-cpu
  #:bpf-stack-range arm32-bpf-stack-range
  #:arch-safety arm32-arch-safety
  #:abstract-return-value (lambda (cpu) (arm32:cpu-gpr-ref cpu ARM_R0))
))

(define (check-jit code)
  (verify-bpf-jit/32 code arm32-target))
