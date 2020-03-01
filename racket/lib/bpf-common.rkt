#lang rosette

(require
  (prefix-in bpf: serval/bpf)
  rosette/solver/smt/boolector
  rosette/lib/angelic
  rosette/solver/smt/boolector
  rosette/solver/smt/z3
  serval/lib/debug
  serval/lib/unittest)

(provide (all-defined-out))

(define BPF_CLASS first)
(define BPF_OP second)
(define BPF_SRC last)

(define BPF_REG_0 'r0)
(define BPF_REG_1 'r1)
(define BPF_REG_2 'r2)
(define BPF_REG_3 'r3)
(define BPF_REG_4 'r4)
(define BPF_REG_5 'r5)
(define BPF_REG_6 'r6)
(define BPF_REG_7 'r7)
(define BPF_REG_8 'r8)
(define BPF_REG_9 'r9)
(define BPF_REG_FP 'r10)

(define TMP_REG_1 11)
(define TMP_REG_2 12)

(define (alu64? code)
  (equal? (BPF_CLASS code) 'BPF_ALU64))

(define (alu32? code)
  (equal? (BPF_CLASS code) 'BPF_ALU))

(define (jump? code)
  (equal? (BPF_CLASS code) 'BPF_JMP))

(define (mov? code)
  (equal? (BPF_OP code) 'BPF_MOV))

(define (shift? code)
  (case (BPF_OP code)
    [(BPF_LSH BPF_RSH BPF_ARSH) #t]
    [else #f]))

(define (div? code)
  (case (BPF_OP code)
    [(BPF_DIV BPF_MOD) #t]
    [else #f]))

(define (endian? code)
  (equal? (BPF_OP code) 'BPF_END))

(define (src-x? code)
  (equal? (BPF_SRC code) 'BPF_X))

(define (src-k? code)
  (equal? (BPF_SRC code) 'BPF_K))

(define verify? (make-parameter #t))

(define-syntax-rule (check-verify x)
  (begin
    (define asserted (with-asserts-only x))
    (check-equal? (asserts) null)
    (for ([e asserted])
      (let ([model (verify (assert e))])
        (when (sat? model)
          (define bugs (bug-ref e))
          (when (null? bugs)
            (printf "Unknown assert\n"))
          (for ([bug bugs])
            (displayln (bug-format bug model))))
        (check-unsat? model)))))

(struct bpf-target
(
  bitwidth ; bitwidth of target ISA
  pc-alignment ; Alignment of target program counter
  cpu-equal? ; How to compare target CPUs for equality
  jit-function ; Function to run the JIT for the target ISA
  run-jitted-code ; How to run the jitted code on the target isa
  init-cpu ; Create a new cpu from (target_pc, bpf_cpu)
  cpu-pc ; Extract program counter from the CPU
  max-size ; Maximum size of target generated code
  init-ctx ; Initialize JIT context
  bpf-to-target-pc ; Map a BPF program counter to a target program counter
  code-size ; How to go from JIT output to the size of generated code in PC units
))

(define (make-bpf-target
  #:target-bitwidth target-bitwidth
  #:target-pc-alignment target-pc-alignment
  #:equiv cpu-equal?
  #:run-jit run-jit
  #:run-code run-jitted-code
  #:init-cpu init-cpu
  #:target-cpu-pc target-cpu-pc
  #:max-target-size max-target-size
  #:init-ctx init-ctx
  #:bpf-to-target-pc bpf-to-target-pc
  #:code-size code-size)

  (bpf-target target-bitwidth target-pc-alignment cpu-equal?
              run-jit run-jitted-code init-cpu target-cpu-pc max-target-size init-ctx
              bpf-to-target-pc code-size))

(define max-insn (make-parameter (bv #x1000000 32)))

(define (verifier-preconditions insn bpf-cpu code dst src off imm)
  ; Operands for expressing precondition on BPF instruction
  (define dst-op (bpf:reg-ref bpf-cpu dst))
  (define src-op (bpf:reg-ref bpf-cpu src))
  (&&
    (bvult insn (max-insn))

    (=> (&& (alu32? code) (div? code) (src-x? code)) (! (bveq (extract 31 0 src-op) (bv 0 32))))
    (=> (&& (alu64? code) (div? code) (src-x? code)) (! (bveq src-op (bv 0 64))))
    (=> (&& (alu32? code) (div? code) (src-k? code)) (! (bveq imm (bv 0 32))))
    (=> (&& (alu64? code) (div? code) (src-k? code)) (! (bveq imm (bv 0 32))))
    ; Assume the shifting amount is in-bounds
    (=> (&& (alu32? code) (shift? code) (src-x? code)) (bvult src-op (bv 32 64)))
    (=> (&& (alu64? code) (shift? code) (src-x? code)) (bvult src-op (bv 64 64)))
    (=> (&& (alu32? code) (shift? code) (src-k? code)) (bvult imm (bv 32 32)))
    (=> (&& (alu64? code) (shift? code) (src-k? code)) (bvult imm (bv 64 32)))
    ; Assume the endianness imm is one of 16, 32, 64
    (=> (endian? code) (|| (equal? imm (bv 16 32)) (equal? imm (bv 32 32)) (equal? imm (bv 64 32))))
    ; Assume imm in mov64 is 0
    (=> (&& (alu64? code) (mov? code) (src-x? code))
        (bveq imm (bv 0 32)))
    ; Assume imm in mov32 is either 0 or 1; the latter indicates the special variant with src == dst
    (=> (&& (alu32? code) (mov? code) (src-x? code))
        (|| (bveq imm (bv 0 32))
            (&& (bveq imm (bv 1 32)) (equal? dst src))))
  ))


; Top-level definition for BPF Jit correctness.
(define
  (bpf-jit-specification
    code
    target
    #:add-symbolics [add-symbolics (lambda n (void))] ; Accumulate symbolics (for synthesis)
    #:assumptions [assumptions (thunk null)]
    #:synthesis [synthesis #f])

    (define target-bitwidth (bpf-target-bitwidth target))
    (define target-pc-alignment (bpf-target-pc-alignment target))
    (define cpu-equal? (bpf-target-cpu-equal? target))
    (define run-jit (bpf-target-jit-function target))
    (define run-jitted-code (bpf-target-run-jitted-code target))
    (define init-cpu (bpf-target-init-cpu target))
    (define target-cpu-pc (bpf-target-cpu-pc target))
    (define init-ctx (bpf-target-init-ctx target))
    (define bpf-to-target-pc (bpf-target-bpf-to-target-pc target))
    (define code-size (bpf-target-code-size target))
    (define max-target-size (bpf-target-max-size target))

    (define dst (if synthesis (choose* 'r0 'r1) (choose* 'r0 'r6)))
    (define src (if synthesis (choose* 'r0 'r1) (choose* 'r0 'r6)))

    ; Create a symbolic register content for each BPF register
    (define-symbolic* r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 (bitvector 64))
    (define bpf-regs (bpf:regs r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10))

    ; Symbolic index of the current instruction being compiled
    (define-symbolic* insn-idx (bitvector 32))

    ; Initialize the BPF CPU, PC, and registers
    (define bpf-cpu (bpf:init-cpu))
    (bpf:set-cpu-pc! bpf-cpu (zero-extend insn-idx (bitvector 64)))
    (bpf:set-cpu-regs! bpf-cpu
      (if (verify?) (struct-copy bpf:regs bpf-regs) (arbitrary bpf-regs)))

    ; Base of the generated target program
    (define-symbolic* target-pc-base (bitvector target-bitwidth))

    ; Create architecture-dependent context
    (define ctx (init-ctx))

    ; Construct target pc from BPF pc
    (define (make-target-pc insn-idx)
      (bpf-to-target-pc ctx target-pc-base insn-idx))

    ; The initial target pc is offsets[insn-1] / N
    ; where N is the size of instructions in the target language
    (define target-pc-start (make-target-pc insn-idx))

    ; Create target CPU with starting program counter
    (define target-cpu (init-cpu target-pc-start bpf-cpu))

    ; Verify initial states match. This should be guaranteed by init-target-cpu
    (assert (cpu-equal? bpf-cpu target-cpu))

    ; Symbolic offset and immediate for BPF instruction
    (define-symbolic* off (bitvector 16))
    (define-symbolic* imm (bitvector 32))
    (when (! (verify?))
      (set! imm (arbitrary imm)))

    ; Add a list of symbolics we made.
    ; Only useful in program synthesis where we may want to quantify over these variables.
    (add-symbolics (symbolics (list dst src off imm ctx insn-idx target-pc-base bpf-cpu target-cpu)))

    (define pre (&&
      ; Jump target in-bounds
      (bvult (bvadd insn-idx (sign-extend off (bitvector 32))) (max-insn))

      ; Relevant target progam counters in-bounds
      (bvult (make-target-pc (bvadd (bv 1 32) insn-idx (sign-extend off (bitvector 32)))) max-target-size)
      (bvult (make-target-pc insn-idx) max-target-size)
      (bvult (make-target-pc (bvadd insn-idx (bv 1 32))) max-target-size)

      ; Target PC initially is aligned
      (bveq
        (bvurem target-pc-base target-pc-alignment)
        (bv 0 target-bitwidth))

      (verifier-preconditions insn-idx bpf-cpu code dst src off imm)
    ))

    ; Check that the preconditions are satisfiable.
    ; Technically not needed but rules out stupid verification bugs.
    ; (check-sat? (solve (assert pre)))

    ; FIXME: really want "(assume pre)" here to kill the asserts
    ; triggered by division by zero for example. For now it should suffice to guard with "when"
    (when pre

      (define insns
        (for*/all ([src src #:exhaustive]
                   [dst dst #:exhaustive])
          (run-jit insn-idx code dst src off imm ctx)))

      ; The next instruction is in the right place
      (define precondition-next-instruction
        (for/all ([insns insns #:exhaustive])
          (bveq (make-target-pc (bvadd insn-idx (bv 1 32)))
                (bvadd (make-target-pc insn-idx)
                       (integer->bitvector (code-size insns) (bitvector target-bitwidth))))))

      (when precondition-next-instruction

        ; Run the BPF interpreter on the symbolic BPF instruction
        (bpf:interpret-instr bpf-cpu code dst src off imm)

        (for/all ([insns insns #:exhaustive])

          ; Run the target interpreter on the JITed instructions
          (run-jitted-code target-cpu insns)

          ; Add external assumptions (must come after run-jitted-code)
          (when (apply && (assumptions))
            ; The final states match
            (bug-assert (cpu-equal? bpf-cpu target-cpu)
              #:msg "final states must match")

            ; Prove that the final program counters correspond:
            ; offsets[bpf-pc-end - bpf-pc-base - 1] == (target-pc-end - target-pc-base) / N
            ; where N is the target instruction size.

            (bug-assert
              (bveq (make-target-pc (extract 31 0 (bpf:cpu-pc bpf-cpu)))
                    (target-cpu-pc target-cpu))
              #:msg "final PCs must match")
          )))))
