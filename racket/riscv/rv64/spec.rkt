#lang rosette

(require
  "bpf_jit_comp64.rkt"
  "../../common.rkt"
  "../../lib/hybrid-memory.rkt"
  "../../lib/bpf-common.rkt"
  "../impl-common.rkt"
  "../spec-common.rkt"
  "../../lib/spec/bpf.rkt"
  "../../lib/spec/proof.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp))

(provide (all-defined-out))

(define (rv64_put_bpf_reg rv_cpu bpf_reg value)
  (riscv:gpr-set! rv_cpu (regmap bpf_reg) value))

(define (rv64_get_bpf_reg rv_cpu bpf_reg)
  (riscv:gpr-ref rv_cpu (regmap bpf_reg)))

(define (rv64-simulate-call cpu call-addr call-fn)
  (define memmgr (riscv:cpu-memmgr cpu))

 (define args (list
    (riscv:gpr-ref cpu 'a0)
    (riscv:gpr-ref cpu 'a1)
    (riscv:gpr-ref cpu 'a2)
    (riscv:gpr-ref cpu 'a3)
    (riscv:gpr-ref cpu 'a4)))

  ; Compute result.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn result args))

  ; Execute a "ret" (pseudo)instruction.
  (riscv:interpret-insn cpu (rv_jalr RV_REG_ZERO RV_REG_RA 0))
  (riscv:kill-jalr-mask cpu)

  ; Havoc caller-saved registers according to RISC-V calling convention
  (riscv:havoc-caller-saved! cpu)

  ; Set return value
  (riscv:gpr-set! cpu RV_REG_A0 result))

(define (rv64-init-arch-invariants! ctx cpu)
  (for ([inv (rv64-cpu-invariant-registers ctx cpu)])
    (riscv:gpr-set! cpu (car inv) (cdr inv))))

(define (rv64-arch-invariants ctx initial-cpu cpu)
  (define pc (riscv:cpu-pc cpu))
  (define aux (context-aux ctx))
  (define mm (riscv:cpu-memmgr cpu))
  (define bpf_stack_depth (bpf-prog-aux-stack_depth aux))
  (define (loadsavedreg off)
    (core:memmgr-load mm (hybrid-memmgr-stackbase mm)
                      (bv off 64)
                      (bv 8 64) #:dbg 'rv64-arch-invariants))

  (&&
    ; Upper bits of tail-call counter are sign extension of lower
    (equal? (riscv:gpr-ref cpu RV_REG_TCC_SAVED)
            (sign-extend (extract 31 0 (riscv:gpr-ref cpu RV_REG_TCC_SAVED))
                         (bitvector 64)))
    ; Program counter is aligned.
    (core:bvaligned? pc (bv 2 (type-of pc)))
    ; Stack size correct
    (equal? (context-stack_size ctx)
      (bvadd (round_up bpf_stack_depth (bv 16 32)) ; BPF stack size
             (bv (* 8 8) 32))) ; Space for saved regs
    ; Saved regs correct
    (equal? (riscv:gpr-ref initial-cpu 'ra) (loadsavedreg (- 8)))
    (equal? (riscv:gpr-ref initial-cpu 'fp) (loadsavedreg (- 16)))
    (equal? (riscv:gpr-ref initial-cpu 's1) (loadsavedreg (- 24)))
    (equal? (riscv:gpr-ref initial-cpu 's2) (loadsavedreg (- 32)))
    (equal? (riscv:gpr-ref initial-cpu 's3) (loadsavedreg (- 40)))
    (equal? (riscv:gpr-ref initial-cpu 's4) (loadsavedreg (- 48)))
    (equal? (riscv:gpr-ref initial-cpu 's5) (loadsavedreg (- 56)))
    (equal? (riscv:gpr-ref initial-cpu 's6) (loadsavedreg (- 64)))
    (apply && (for/list ([reg '(gp tp s7 s8 s9 s10 s11)])
      (equal? (riscv:gpr-ref initial-cpu reg)
              (riscv:gpr-ref cpu reg))))
    ; Registers have the correct values.
    (apply &&
      (for/list ([inv (rv64-cpu-invariant-registers ctx cpu)])
        (equal? (riscv:gpr-ref cpu (car inv)) (cdr inv))))))

(define (rv64-cpu-invariant-registers ctx cpu)
  (define memmgr (riscv:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons 'fp stackbase)
        (cons 'sp (bvsub stackbase
                         (zero-extend (context-stack_size ctx) (bitvector 64))))))

(define (rv64-max-stack-usage ctx)
  (define aux (context-aux ctx))
  (define bpf_stack_depth (bpf-prog-aux-stack_depth aux))
  (bvadd (zero-extend (round_up bpf_stack_depth (bv 16 32)) (bitvector 64))
         (bv (* 8 8) 64)))

(define (rv64-bpf-stack-range ctx)
  (define bpf_stack_depth (zero-extend (bpf-prog-aux-stack_depth (context-aux ctx)) (bitvector 64)))

  (define top (bvneg (bv (* 8 8) 64)))
  (define bottom (bvsub top (round_up bpf_stack_depth (bv 16 64))))

  (cons bottom top))

(define (rv64-initial-state? ctx input cpu)
  (define pc (riscv:cpu-pc cpu))
  (define memmgr (riscv:cpu-memmgr cpu))
  (&&
    ; PC equals start of instructions
    (equal? (riscv:cpu-pc cpu) (context-insns-addr ctx))
    ; Stack pointer is aligned.
    (core:bvaligned? (riscv:gpr-ref cpu 'sp) (bv 16 64))
    ; Stack pointer points to base of stack.
    (equal? (riscv:gpr-ref cpu 'sp) (hybrid-memmgr-stackbase memmgr))

    ; Program input matches
    (equal? (rv64_get_bpf_reg cpu BPF_REG_1) (program-input-r1 input))))

(define rv64-target (make-bpf-target
  #:target-bitwidth 64
  #:init-cpu (riscv-init-cpu 64)
  #:abstract-regs (riscv-abstract-regs rv64_get_bpf_reg)
  #:abstract-tail-call-cnt (lambda (cpu) (bvsub (bv MAX_TAIL_CALL_CNT 32) (extract 31 0 (riscv:gpr-ref cpu RV_REG_TCC_SAVED))))
  #:simulate-call rv64-simulate-call
  #:arch-invariants rv64-arch-invariants
  #:init-arch-invariants! rv64-init-arch-invariants!
  #:run-code run-jitted-code
  #:emit-insn emit_insn
  #:init-ctx riscv-init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-target-size #x8000000
  #:max-stack-usage rv64-max-stack-usage
  #:have-efficient-unaligned-access #f
  #:function-alignment 2
  #:ctx-valid? riscv-ctx-valid?
  #:copy-target-cpu riscv-copy-cpu
  #:epilogue-offset riscv-epilogue-offset
  #:bpf-stack-range rv64-bpf-stack-range
  #:initial-state? rv64-initial-state?
  #:arch-safety riscv-arch-safety
  #:abstract-return-value (lambda (cpu) (core:trunc 32 (riscv:gpr-ref cpu 'a0)))
  #:emit-prologue (lambda (ctx)
    (parameterize ([CONFIG_RISCV_ISA_C #f]) (bpf_jit_build_prologue ctx)) (context-insns ctx))
  #:emit-epilogue (lambda (ctx)
    (parameterize ([CONFIG_RISCV_ISA_C #f]) (bpf_jit_build_epilogue ctx)) (context-insns ctx))
))

(define (check-jit code)
  (parameterize ([riscv:XLEN 64])
    (verify-bpf-jit/64 code rv64-target)))
