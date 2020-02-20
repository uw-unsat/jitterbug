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

(define BPF_REG_0 0)
(define BPF_REG_1 1)
(define BPF_REG_2 2)
(define BPF_REG_3 3)
(define BPF_REG_4 4)
(define BPF_REG_5 5)
(define BPF_REG_6 6)
(define BPF_REG_7 7)
(define BPF_REG_8 8)
(define BPF_REG_9 9)
(define BPF_REG_FP 10)
(define TMP_REG_1 11)
(define TMP_REG_2 12)

(struct context (insns ninsns offset flags) #:mutable #:transparent)

(define (get-offset ctx idx)
  (bug-assert (bvsge idx (bv 0 32)) #:msg "offset arg must be in bounds")
  ((context-offset ctx) idx))

(define (emit insn ctx)
  (set-context-insns! ctx (vector-append (context-insns ctx) (vector insn)))
  (set-context-ninsns! ctx (bvadd (bv 1 32) (context-ninsns ctx))))

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

(define
  (verify-jit-refinement
    code
    #:target-bitwidth target-bitwidth ; The target bitwidth, as an integer
    #:target-insn-size target-insn-size ; The target instruction size, as (bitvector target-bitwidth)
    #:equiv cpu-equal? ; A function (bpf_cpu, target_cpu) -> bool relating bpf and target state
    #:run-jit run-jit ; Function to run jit, (insn, offsets, code, dst, src, off, imm) -> vector of insns
    #:run-code run-jitted-code ; Function to run jitted code (target_cpu, vector of insns) -> void
    #:init-cpu init-cpu ; Constructor for target cpu, (target_pc, bpf_cpu) -> target_cpu
    #:target-cpu-pc target-cpu-pc ; Accessor for target pc, (target_cpu) -> (bitvector target-bitwidth)
    #:max-target-size [max-target-size (bv 8192 32)]
    #:max-insn [max-insn (bv 2048 32)]
    #:assumptions [assumptions (thunk null)])

  (define asserted (with-asserts-only
    (assert-jit-correct
      code
      #:target-bitwidth target-bitwidth
      #:target-insn-size target-insn-size
      #:equiv cpu-equal?
      #:run-jit run-jit
      #:run-code run-jitted-code
      #:init-cpu init-cpu
      #:target-cpu-pc target-cpu-pc
      #:max-target-size max-target-size
      #:max-insn max-insn
      #:assumptions assumptions)))
  (check-equal? (asserts) null)
  (for ([e asserted])
    (let ([model (verify (assert e))])
      (when (sat? model)
        (define bugs (bug-ref e))
        (when (null? bugs)
          (printf "Unknown assert\n"))
        (for ([bug bugs])
          (displayln (bug-format bug model))))
      (check-unsat? model))))

; Top-level definition for BPF Jit correctness.
(define
  (assert-jit-correct
    code
    #:target-bitwidth target-bitwidth ; The target bitwidth, as an integer
    #:target-insn-size target-insn-size ; The target instruction size, as (bitvector target-bitwidth)
    #:equiv cpu-equal? ; A function (bpf_cpu, target_cpu) -> bool relating bpf and target state
    #:run-jit run-jit ; Function to run jit, (insn, offsets, code, dst, src, off, imm) -> vector of insns
    #:run-code run-jitted-code ; Function to run jitted code (target_cpu, vector of insns) -> void
    #:init-cpu init-cpu ; Constructor for target cpu, (target_pc, bpf_cpu) -> target_cpu
    #:target-cpu-pc target-cpu-pc ; Accessor for target pc, (target_cpu) -> (bitvector target-bitwidth)
    #:max-target-size [max-target-size (bv 8192 32)]
    #:max-insn [max-insn (bv 2048 32)]
    #:add-symbolics [add-symbolics (lambda n (void))] ; Accumulate symbolics (for synthesis)
    #:assumptions [assumptions (thunk null)]
    #:synthesis [synthesis #f])

    (define dst (if synthesis (choose* 0 1) (choose* 0 6)))
    (define src (if synthesis (choose* 0 1) (choose* 0 6)))

    ; Create a symbolic register content for each BPF register
    (define-symbolic* r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 (bitvector 64))
    (define bpf-regs (vector r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10))

    ; Symbolic index of the current instruction being compiled
    (define-symbolic* insn (bitvector 32))

    ; Initialize the BPF CPU, PC, and registers
    (define bpf-cpu (bpf:init-cpu))
    (bpf:set-cpu-pc! bpf-cpu (zero-extend insn (bitvector 64)))
    (bpf:set-cpu-regs! bpf-cpu
      (if (verify?) (vector-copy bpf-regs) (arbitrary bpf-regs)))

    ; Offset table mapping each bpf instruction index to the
    ; index of the target instruction after the corresponding target instructions
    ; This is how we relate BPF program counter to target program counter
    (define-symbolic* offsets (~> (bitvector 32) (bitvector 32)))

    (define (prev-offset insn)
      (if (bveq insn (bv 0 32)) (bv 0 32) (offsets (bvsub insn (bv 1 32)))))

    ; Base of the generated target program
    (define-symbolic* target-pc-base (bitvector target-bitwidth))

    ; Construct target pc from BPF pc
    (define (make-target-pc insn)
      (bvadd
        target-pc-base
        (bvmul (zero-extend (prev-offset insn) (bitvector target-bitwidth))
                target-insn-size)))

    ; The initial target pc is offsets[insn-1] / N
    ; where N is the size of instructions in the target language
    (define target-pc-start (make-target-pc insn))

    ; Create target CPU with starting program counter
    (define target-cpu (init-cpu target-pc-start bpf-cpu))

    ; Verify initial states match. This should be guaranteed by init-target-cpu
    (assert (cpu-equal? bpf-cpu target-cpu))

    ; Symbolic offset and immediate for BPF instruction
    (define-symbolic* off (bitvector 16))
    (define-symbolic* imm (bitvector 32))
    (when (! (verify?))
      (set! imm (arbitrary imm)))

    ; Operands for expressing precondition on BPF instruction
    (define dst-op (vector-ref bpf-regs dst))
    (define src-op (vector-ref bpf-regs src))

    ; Run the jit to produce vector of target instructions
    (define-symbolic* seen boolean? [32])
    (define-symbolic* ninsns (bitvector 32))
    (define ctx (context (vector) ninsns offsets (list->vector seen)))

    ; Add a list of symbolics we made.
    ; Only useful in program synthesis where we may want to quantify over these variables.
    (add-symbolics (symbolics (list dst src off imm seen offsets ninsns insn target-pc-base bpf-cpu target-cpu)))

    ; Programs accepted by checker should satisfy these preconditions
    (define pre (&&
                    ; dst and src registers are in-bounds
                    (>= dst 0) (< dst 10)
                    (>= src 0) (<= src 10)

                    ; No more than 2048 instructions
                    (bvult insn max-insn)

                    (bvult ninsns max-target-size)

                    ; Jump target in-bounds
                    (bvult (bvadd insn (sign-extend off (bitvector 32))) max-insn)

                    (bveq ninsns (prev-offset insn))

                    (bvult (offsets (bvadd insn (sign-extend off (bitvector 32)))) max-target-size)
                    (bvult (offsets insn) max-target-size)

                    ; Target PC initially is aligned
                    (bveq
                      (bvurem target-pc-base target-insn-size)
                      (bv 0 target-bitwidth))

                    ; Assume divisor is non-zero
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

    ; Check that the preconditions are satisfiable.
    ; Technically not needed but rules out stupid verification bugs.
    ; (check-sat? (solve (assert pre)))

    ; FIXME: really want "(assume pre)" here to kill the asserts
    ; triggered by division by zero for example. For now it should suffice to guard with "when"
    (when pre

      (for/all ([src src #:exhaustive])
        (for/all ([dst dst #:exhaustive])
          (run-jit insn code dst src off imm ctx)))
      (define insns (context-insns ctx))

      ; The next instruction is in the right place
      (define pre2
        (for/all ([i (vector-length insns) #:exhaustive])
          (bveq (offsets insn)
                (bvadd (prev-offset insn) (integer->bitvector i (bitvector 32))))))
      (when pre2

        ; Run the BPF interpreter on the symbolic BPF instruction
        (bpf:interpret-instr bpf-cpu code dst src off imm)

        (for/all ([insns insns #:exhaustive])

          (bug-assert (bveq (bv (vector-length insns) 32) (bvsub (context-ninsns ctx) ninsns))
            #:msg "ninsns must match")

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
              #:msg "final PCs must match"))))))
