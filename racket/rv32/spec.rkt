#lang rosette

(require
  "bpf_jit_comp32.rkt"
  "../lib/linux.rkt"
  "../lib/spec/bpf.rkt"
  "../lib/riscv-common.rkt"
  "../lib/spec/riscv.rkt"
  "../lib/bpf-common.rkt"
  "../lib/hybrid-memory.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in riscv: serval/riscv/base))

(provide (all-defined-out))

(define (bpf_to_rv_reg_lo r)
  (cdr (bpf2rv32 r)))

(define (bpf_to_rv_reg_hi r)
  (car (bpf2rv32 r)))

(define (rv32_get_bpf_reg rv_cpu bpf_reg)
  (define memmgr (riscv:cpu-memmgr rv_cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define (loadreg i)
    (if (is_stacked i)
      (core:memmgr-load memmgr (bvadd stackbase i) (bv 0 32) (bv 4 32) #:dbg #f)
      (riscv:gpr-ref rv_cpu i)))
  (define loreg (bpf_to_rv_reg_lo bpf_reg))
  (define hireg (bpf_to_rv_reg_hi bpf_reg))
  (concat (loadreg hireg) (loadreg loreg)))

(define (rv32_put_bpf_reg rv_cpu bpf_reg value)
  (define memmgr (riscv:cpu-memmgr rv_cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (define (storereg i val)
    (if (is_stacked i)
      (core:memmgr-store! memmgr (bvadd stackbase i) (bv 0 32) val (bv 4 32) #:dbg #f)
      (riscv:gpr-set! rv_cpu i val)))
  (define loreg (bpf_to_rv_reg_lo bpf_reg))
  (define hireg (bpf_to_rv_reg_hi bpf_reg))
  (storereg loreg (extract 31 0 value))
  (storereg hireg (extract 63 32 value)))

(define (rv32-simulate-call cpu call-addr call-fn)
  (define memmgr (riscv:cpu-memmgr cpu))

  (core:bug-on (! (core:bvaligned? (riscv:gpr-ref cpu 'sp) (bv 16 32)))
               #:msg "rv32-simulate-call: stack pointer must be aligned before function call")

  (define (loadfromstack off)
    (core:memmgr-load memmgr (riscv:gpr-ref cpu 'sp) (bv off 32) (bv 4 32) #:dbg 'rv32-simulate-call))

  (define args (list
    (concat (riscv:gpr-ref cpu 'a1) (riscv:gpr-ref cpu 'a0))
    (concat (riscv:gpr-ref cpu 'a3) (riscv:gpr-ref cpu 'a2))
    (concat (riscv:gpr-ref cpu 'a5) (riscv:gpr-ref cpu 'a4))
    (concat (riscv:gpr-ref cpu 'a7) (riscv:gpr-ref cpu 'a6))
    (concat (loadfromstack 4) (loadfromstack 0))))

  ; Compute result using fresh bytes from memmgr.
  (define result
    (core:list->bitvector/le (hybrid-memmgr-get-fresh-bytes memmgr 8)))

  ; Generate trace event
  (hybrid-memmgr-trace-event! memmgr
    (apply call-event call-fn args))

  ; Execute a "ret" (pseudo)instruction.
  (riscv:interpret-insn cpu (rv_jalr RV_REG_ZERO RV_REG_RA 0))
  (riscv:kill-jalr-mask cpu)

  ; Havoc caller-saved registers according to RISC-V calling convention
  (riscv:havoc-caller-saved! cpu)

  ; Set return value
  (riscv:gpr-set! cpu RV_REG_A0 (extract 31 0 result))
  (riscv:gpr-set! cpu RV_REG_A1 (extract 63 32 result)))

(define (rv32-init-cpu-invariants! ctx cpu)
  (for ([inv (rv32-cpu-invariant-registers ctx cpu)])
    (riscv:gpr-set! cpu (car inv) (cdr inv))))

(define (rv32-cpu-invariants ctx cpu)
  (define bpf_stack_depth (bpf-prog-aux-stack_depth (context-aux ctx)))
  (define pc (riscv:cpu-pc cpu))
  (define memmgr (riscv:cpu-memmgr cpu))
  (define saved-regs (context-saved-regs ctx))
  (define (loadsavedreg off)
    (core:memmgr-load memmgr (hybrid-memmgr-stackbase memmgr)
                      (bv off 32)
                      (bv 4 32) #:dbg 'rv32-cpu-invariants))

  (&&
    ; Program counter is aligned.
    (core:bvaligned? pc (bv 4 (type-of pc)))

    ; Stack pointer is aligned.
    (core:bvaligned? (riscv:gpr-ref cpu 'sp) (bv STACK_ALIGN 32))

    ; Stack size in ctx is correct
    (equal? (context-stack_size ctx)
      (round_up (bvadd (round_up bpf_stack_depth (bv STACK_ALIGN 32)) ; BPF stack size
                      (bv (* NR_SAVED_REGISTERS 4) 32) ; Space for saved regs
                      (bv (* BPF_JIT_SCRATCH_REGS 4) 32)) ; Space for stacked BPF regs
                (bv STACK_ALIGN 32))) ; Round up to align stack to 16 bytes.

    ; Saved registers preserved.
    (equal? (riscv:@gpr-ref saved-regs 'ra) (loadsavedreg (- 4)))
    (equal? (riscv:@gpr-ref saved-regs 'fp) (loadsavedreg (- 8)))
    (equal? (riscv:@gpr-ref saved-regs 's1) (loadsavedreg (- 12)))
    (equal? (riscv:@gpr-ref saved-regs 's2) (loadsavedreg (- 16)))
    (equal? (riscv:@gpr-ref saved-regs 's3) (loadsavedreg (- 20)))
    (equal? (riscv:@gpr-ref saved-regs 's4) (loadsavedreg (- 24)))
    (equal? (riscv:@gpr-ref saved-regs 's5) (loadsavedreg (- 28)))
    (equal? (riscv:@gpr-ref saved-regs 's6) (loadsavedreg (- 32)))
    (equal? (riscv:@gpr-ref saved-regs 's7) (loadsavedreg (- 36)))

    ; Unused callee-saved registers preserved
    (apply && (for/list ([reg '(gp tp s8 s9 s10 s11)])
      (equal? (riscv:@gpr-ref saved-regs reg)
              (riscv:gpr-ref cpu reg))))

    ; Registers have the correct concretized values.
    (apply &&
      (for/list ([inv (rv32-cpu-invariant-registers ctx cpu)])
        (equal? (riscv:gpr-ref cpu (car inv)) (cdr inv))))))

(define (rv32-cpu-invariant-registers ctx cpu)
  (define memmgr (riscv:cpu-memmgr cpu))
  (define stackbase (hybrid-memmgr-stackbase memmgr))
  (list (cons 'fp stackbase)
        (cons 'sp (bvsub stackbase
                         (context-stack_size ctx)))))

; Assumptions on state before prologue entry.
(define (rv32-prologue-assumptions ctx cpu)
  (define pc (riscv:cpu-pc cpu))
  (define memmgr (riscv:cpu-memmgr cpu))
  (&&
    ; PC is aligned.
    (core:bvaligned? pc (bv 4 (type-of pc)))
    ; Registers are initially the values that must be saved.
    (equal? (context-saved-regs ctx) (riscv:cpu-gprs cpu))
    ; Stack pointer is aligned.
    (core:bvaligned? (riscv:gpr-ref cpu 'sp) (bv STACK_ALIGN 32))
    ; Stack pointer points to base of stack.
    (equal? (riscv:gpr-ref cpu 'sp) (hybrid-memmgr-stackbase memmgr))))

; Things guaranteed by epilogue.
(define (rv32-epilogue-guarantees ctx cpu)
  (define pc (riscv:cpu-pc cpu))
  (define saved-regs (context-saved-regs ctx))
  (define memmgr (riscv:cpu-memmgr cpu))
  (&&

    ; Callee-saved registers are preserved by the BPF JITed program.
    (apply && (for/list ([reg '(ra gp tp fp s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11)])
      (equal? (riscv:@gpr-ref saved-regs reg)
              (riscv:gpr-ref cpu reg))))

    ; Stack pointer is aligned.
    (core:bvaligned? (riscv:gpr-ref cpu 'sp) (bv STACK_ALIGN 32))

    ; Stack pointer points to base of stack.
    (equal? (riscv:gpr-ref cpu 'sp) (hybrid-memmgr-stackbase memmgr))))

(define (rv32-max-stack-usage ctx)
  (define bpf_stack_depth (bpf-prog-aux-stack_depth (context-aux ctx)))
  (round_up (bvadd (round_up bpf_stack_depth (bv STACK_ALIGN 32)) ; BPF stack size
                   (bv (* NR_SAVED_REGISTERS 4) 32) ; Space for saved regs
                   (bv (* BPF_JIT_SCRATCH_REGS 4) 32) ; Space for stacked BPF regs
                   (bv 16 32)) ; Space for args to BPF_CALL
            (bv STACK_ALIGN 32))) ; Round up to align stack to 16 bytes.

(define (rv32-init-ctx insns-addr insn-idx program-length aux)
  (define ctx (riscv-init-ctx insns-addr insn-idx program-length aux))
  (define bpf_stack_depth (bpf-prog-aux-stack_depth aux))

  ; Ghost state for the value of registers before the BPF program
  (define-symbolic* saved-regs (bitvector 32) [31])
  (set-context-saved-regs! ctx (apply riscv:gprs saved-regs))

  ctx)

; Give the range of BPF stack addresses as an offset to stackbase.
(define (rv32-bpf-stack-range ctx)
  (define bpf_stack_depth (bpf-prog-aux-stack_depth (context-aux ctx)))

  (define top (bvneg (round_up (bvadd (bv (* NR_SAVED_REGISTERS 4) 32)
                                      (bv (* BPF_JIT_SCRATCH_REGS 4) 32))
                               (bv STACK_ALIGN 32))))
  (define bottom (bvsub top (round_up bpf_stack_depth (bv STACK_ALIGN 32))))
  (cons bottom top))

(define rv32-target (make-bpf-target
  #:cpu-pc riscv:cpu-pc
  #:set-cpu-pc! riscv:set-cpu-pc!
  #:target-bitwidth 32
  #:init-cpu (riscv-init-cpu 32)
  #:abstract-regs (riscv-abstract-regs rv32_get_bpf_reg)
  #:abstract-tail-call-cnt (lambda (cpu) (bvsub (bv MAX_TAIL_CALL_CNT 32) (riscv:gpr-ref cpu RV_REG_TCC)))
  #:cpu-memmgr riscv:cpu-memmgr
  #:simulate-call rv32-simulate-call
  #:cpu-invariants rv32-cpu-invariants
  #:init-cpu-invariants! rv32-init-cpu-invariants!
  #:run-code run-jitted-code
  #:run-jit emit_insn
  #:emit-prologue (lambda (ctx) (bpf_jit_build_prologue ctx) (context-insns ctx))
  #:emit-epilogue (lambda (ctx) (bpf_jit_build_epilogue ctx) (context-insns ctx))
  #:prologue-assumptions rv32-prologue-assumptions
  #:epilogue-guarantees rv32-epilogue-guarantees
  #:init-ctx rv32-init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size
  #:max-target-size #x8000000
  #:max-stack-usage rv32-max-stack-usage
  #:have-efficient-unaligned-access #f
  #:bpf-stack-range rv32-bpf-stack-range
  #:function-alignment 4
  #:abstract-return-value (lambda (ctx cpu) (riscv:gpr-ref cpu 'a0))
))

(define (check-jit code)
  (parameterize ([riscv:XLEN 32])
    (verify-bpf-jit/32 code rv32-target)))
