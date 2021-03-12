#lang rosette

(require
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  "../lib/spec/proof.rkt"
  "../lib/spec/bpf.rkt"
  "../common.rkt"
  "bpf_jit_comp.rkt"
  "bpf_jit.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in arm64: serval/arm64))

(provide (all-defined-out))

(define (init-ctx insns-addr insn-idx program-length aux)
  (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))
  (define-symbolic* epilogue-offset stack-size ninsns (bitvector 32))
  (define ctx (context (vector) ninsns epilogue-offset offsets program-length stack-size aux))
  ctx)

(define (arm64-epilogue-offset target-pc-base ctx)
  (define ep (context-epilogue-offset ctx))
  (bvadd target-pc-base (bvshl (zero-extend ep (bitvector 64)) (bv 2 64))))

(define (arm64-ctx-valid? ctx insn-idx)
  (define offsets (context-offset ctx))
  (define program-length (context-program-length ctx))
  (&& (equal? (context-idx ctx) (offsets insn-idx))
      (equal? (offsets program-length) (context-epilogue-offset ctx))))

(define (cpu-abstract-regs cpu)
  (apply bpf:regs
    (for/list [(i (in-range MAX_BPF_JIT_REG))]
      (define k (bpf:idx->reg i))
      (arm64:cpu-gpr-ref cpu (bpf2a64 k)))))

(define (init-arm64-cpu ctx target-pc memmgr)
  (define arm64-cpu (arm64:init-cpu memmgr))
  (arm64:cpu-pc-set! arm64-cpu target-pc)
  arm64-cpu)

(define (run-jitted-code base arm64-cpu insns)
  (for/all ([insns insns #:exhaustive])
    (interpret-program base arm64-cpu insns)))

(define (fetch insns base pc)
  (define n (bitvector->natural (bvudiv (bvsub pc base) (bv 4 64))))
  (cond
    [(term? n) #f]
    [(< n (vector-length insns)) (vector-ref insns n)]
    [else #f]))

(define (interpret-program base cpu insns)
  (for/all ([pc (arm64:cpu-pc-ref cpu) #:exhaustive])
    (begin
      (arm64:cpu-pc-set! cpu pc)
      (define insn (fetch insns base pc))
      (when insn
        (arm64:interpret-insn cpu insn)
        (interpret-program base cpu insns)))))

(define (bpf-to-target-pc ctx target-pc-base bpf-pc)
  (define offsets (context-offset ctx))
  (bvadd
    target-pc-base
    (bvmul (zero-extend (offsets bpf-pc) (bitvector 64)) (bv 4 64))))

(define (code-size vec)
  (* 4 (vector-length vec)))

(define (arm64-arch-invariants ctx initial-cpu cpu)
  (define pc (arm64:cpu-pc cpu))
  (define mm (arm64:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (define (loadfromstack off)
    (core:memmgr-load mm stackbase (bv off 64) (bv 8 64)))

  (&&
    (core:bvaligned? (arm64:cpu-sp-ref cpu) (bv 16 64))
    (equal? (context-stack-size ctx) (STACK_ALIGN stack_depth))
    (equal? (arm64:cpu-gpr-ref cpu A64_FP) (bvsub stackbase (bv 16 64)))
    (equal? (arm64:cpu-sp-ref cpu)
            (bvsub stackbase
                   (bv 64 64)
                   (zero-extend (STACK_ALIGN stack_depth) (bitvector 64))))
    (core:bvaligned? pc (bv 4 (type-of pc)))

    ; Saved registers
    ; A64_FP
    (equal? (arm64:cpu-gpr-ref initial-cpu A64_FP) (loadfromstack (- 16)))
    ; A64_LR
    (equal? (arm64:cpu-gpr-ref initial-cpu A64_LR) (loadfromstack (- 8)))

    ; BPF_REG_6
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 19)) (loadfromstack (- 32)))
    ; BPF_REG_7
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 20)) (loadfromstack (- 24)))

    ; BPF_REG_8
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 21)) (loadfromstack (- 48)))
    ; BPF_REG_9
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 22)) (loadfromstack (- 40)))

    ; BPF_REG_FP
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 25)) (loadfromstack (- 64)))
    ; TCALL_CNT
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 26)) (loadfromstack (- 56)))

    ; Unused registers
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 18))
            (arm64:cpu-gpr-ref cpu (A64_R 18)))
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 23))
            (arm64:cpu-gpr-ref cpu (A64_R 23)))
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 27))
            (arm64:cpu-gpr-ref cpu (A64_R 27)))
    (equal? (arm64:cpu-gpr-ref initial-cpu (A64_R 28))
            (arm64:cpu-gpr-ref cpu (A64_R 28)))

  ))

(define (arm64-arch-safety Tinitial Tfinal)
  (&&
    (equal? (arm64:cpu-gpr-ref Tinitial A64_LR)
            (arm64:cpu-pc Tfinal))
    (apply &&
      (for/list ([regnum '(18 19 20 21 22 23 25 26 27 28 29 30)])
        (equal? (arm64:cpu-gpr-ref Tinitial (A64_R regnum))
                (arm64:cpu-gpr-ref Tfinal   (A64_R regnum)))))))

(define (arm64-max-stack-usage ctx)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (bvadd (bv 64 64) (zero-extend (STACK_ALIGN stack_depth) (bitvector 64))))

(define (arm64-bpf-stack-range ctx)
  (define aux (context-aux ctx))
  (define stack_depth (bpf-prog-aux-stack_depth aux))

  (define top (bvneg (bv 64 64)))
  (define bottom (bvsub top (zero-extend stack_depth (bitvector 64))))

  (cons bottom top))

(define (arm64-simulate-call cpu call-addr call-fn)
  (define memmgr (arm64:cpu-memmgr cpu))

  (define args (list
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 0))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 1))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 2))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 3))
    (arm64:cpu-gpr-ref cpu (arm64:integer->gpr 4))))

  ; Compute result.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Execute a "return" instruction (br r30).
  (arm64:interpret-insn cpu (arm64:br (arm64:integer->gpr 30)))
  ; FIXME: havoc caller-saved registers
  ; Set result to r0.
  (arm64:cpu-gpr-set! cpu (arm64:integer->gpr 0) result))

(define (arm64-copy-cpu cpu)
  (struct-copy arm64:cpu cpu
    [xn   (vector-copy (arm64:cpu-xn cpu))]
    [nzcv (struct-copy arm64:nzcv (arm64:cpu-nzcv cpu))]))

(define (arm64-initial-state? ctx input cpu)
  (define mm (arm64:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase mm))
  (&&
    (core:bvaligned? (arm64:cpu-pc cpu) (bv 4 64))
    (core:bvaligned? (arm64:cpu-sp-ref cpu) (bv 16 64))
    (equal? (arm64:cpu-sp-ref cpu) stackbase)
    (equal? (arm64:cpu-gpr-ref cpu (bpf2a64 BPF_REG_1)) (program-input-r1 input))))

(define arm64-target (make-bpf-target
  #:target-bitwidth 64
  #:init-cpu init-arm64-cpu
  #:simulate-call arm64-simulate-call
  #:arch-invariants arm64-arch-invariants
  #:abstract-regs cpu-abstract-regs
  #:run-code run-jitted-code
  #:emit-insn build_insn
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-stack-usage arm64-max-stack-usage
  #:max-target-size #x100000 ; 2^20
  #:function-alignment 4
  #:ctx-valid? arm64-ctx-valid?
  #:epilogue-offset arm64-epilogue-offset
  #:arch-safety arm64-arch-safety
  #:bpf-stack-range arm64-bpf-stack-range
  #:emit-prologue (lambda (ctx) (build_prologue ctx #f) (context-insns ctx))
  #:emit-epilogue (lambda (ctx) (build_epilogue ctx) (context-insns ctx))
  #:copy-target-cpu arm64-copy-cpu
  #:initial-state? arm64-initial-state?
  #:abstract-return-value (lambda (cpu) (core:trunc 32 (arm64:cpu-gpr-ref cpu (A64_R 0))))
))

(define (check-jit code)
  (verify-bpf-jit/64 code arm64-target))
