#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/spec/bpf.rkt"
  (only-in "bpf_jit.rkt" ARM_FP ARM_SP ARM_LR ARM_R0 ARM_R1)
  "bpf_jit_comp.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in arm32: serval/arm32))

(provide (all-defined-out))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define ninsns
    (if (equal? (bv 0 32) insn-idx)
        (bv 0 32)
        (offsets (bvsub insn-idx (bv 1 32)))))
  (define epilogue-offset (offsets (bvsub1 program-length)))

  (define stack_size (STACK_SIZE aux))

  (define ctx (context (vector) ninsns epilogue-offset offsets program-length stack_size aux))
  ctx)

(define (cpu-abstract-regs cpu)
  (define mm (arm32:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define (loadreg i)
    (if (is_stacked i)
      (core:memmgr-load mm (bvadd stackbase (sign-extend i (bitvector 32))) (bv 0 32) (bv 4 32) #:dbg #f)
      (arm32:cpu-gpr-ref cpu i)))
  (apply bpf:regs
    (for/list [(i (in-range MAX_BPF_JIT_REG))]
      (define k (bpf:idx->reg i))
      (define p (bpf2a32 k))
      (concat (loadreg (car p)) (loadreg (cdr p))))))

(define (init-arm32-cpu ctx target-pc memmgr)
  (define arm32-cpu (arm32:init-cpu memmgr))
  (arm32:cpu-pc-set! arm32-cpu target-pc)
  (for ([inv (arm32-cpu-invariant-registers ctx arm32-cpu)])
    (arm32:cpu-gpr-set! arm32-cpu (car inv) (cdr inv)))
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

(define (arm32-cpu-invariants ctx cpu)
  (apply &&
    (cons (core:bvaligned? (arm32:cpu-pc cpu) (bv 4 32))
          (for/list ([inv (arm32-cpu-invariant-registers ctx cpu)])
            (equal? (arm32:cpu-gpr-ref cpu (car inv)) (cdr inv))))))

(define (arm32-cpu-invariant-registers ctx cpu)
  (define memmgr (arm32:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons ARM_FP stackbase)
        (cons ARM_SP (bvsub stackbase (context-stack_size ctx)))))

(define (arm32-init-cpu-invariants! ctx arm32-cpu)
  (for ([inv (arm32-cpu-invariant-registers ctx arm32-cpu)])
    (arm32:cpu-gpr-set! arm32-cpu (car inv) (cdr inv))))

(define (arm32-simulate-call cpu call-addr call-fn)
  (define memmgr (arm32:cpu-memmgr cpu))
  (define (loadfromstack off)
    (core:memmgr-load memmgr (arm32:cpu-gpr-ref cpu ARM_SP) off (bv 4 32) #:dbg 'arm32-simulate-call))

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

(define (arm32-max-stack-usage ctx)
  (bvadd (context-stack_size ctx)
         (bv (* 8 3) 32))) ; Add enough space for pushing BPF_CALL arguments

(define arm32-target (make-bpf-target
  #:target-bitwidth 32
  #:init-cpu init-arm32-cpu
  #:simulate-call arm32-simulate-call
  #:supports-pseudocall #f
  #:cpu-invariants arm32-cpu-invariants
  #:init-cpu-invariants! arm32-init-cpu-invariants!
  #:abstract-regs cpu-abstract-regs
  #:run-code run-jitted-code
  #:run-jit build_insn
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage arm32-max-stack-usage
  #:max-target-size #x800000
  #:function-alignment 4
))

(define (check-jit code)
  (verify-bpf-jit/32 code arm32-target))
