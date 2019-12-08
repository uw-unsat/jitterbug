#lang rosette

(require
  (prefix-in bpf: serval/bpf)
  rosette/solver/smt/boolector
  rosette/lib/angelic
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

(define (emit insn ctx)
  (set-context-insns! ctx (vector-append (context-insns ctx) (vector insn)))
  (set-context-ninsns! ctx (bvadd (bv 1 32) (context-ninsns ctx))))

(define (alu64? code)
  (equal? (BPF_CLASS code) 'BPF_ALU64))

(define (alu32? code)
  (equal? (BPF_CLASS code) 'BPF_ALU))

(define (jump? code)
  (equal? (BPF_CLASS code) 'BPF_JMP))

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

; Top-level definition for BPF Jit correctness.
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
    #:max-insn [max-insn (bv 2048 32)])

    ; (define dst (apply choose* (range 5)))
    ; (define src (apply choose* (range 5)))
    ; Assume dst == 0 and src == 1 for debugging right now.
    (define dst 6)
    (define src 7)

    ; (for/all ([dst dst #:exhaustive])
    ;   (for/all ([src src #:exhaustive])
      (begin

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

        ; Base of the generated target program
        (define-symbolic* target-pc-base (bitvector target-bitwidth))

        ; Construct target pc from BPF pc
        (define (make-target-pc insn)
          (bvadd
            target-pc-base
            (bvmul (zero-extend (offsets (bvsub insn (bv 1 32))) (bitvector target-bitwidth))
                   target-insn-size)))

        ; The initial target pc is offsets[insn-1] / N
        ; where N is the size of instructions in the target language
        (define target-pc-start (make-target-pc insn))

        ; Create target CPU with starting program counter
        (define target-cpu (init-cpu target-pc-start bpf-cpu))

        ; Verify initial states match. This should be guaranteed by init-target-cpu
        (check-unsat? (verify (assert (cpu-equal? bpf-cpu target-cpu))))

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
        (define ctx (context (vector) (bv 0 32) offsets (list->vector seen)))
        (run-jit insn code dst src off imm ctx)
        (define insns (context-insns ctx))
        (define ninsns (context-ninsns ctx))

        ; Names for quantified variables in precondition
        (define-symbolic X Y (bitvector 32))

        ; Programs accepted by checker should satisfy these preconditions
        (define pre (&&
                        ; dst and src registers are in-bounds
                        (>= dst 0) (< dst 10)
                        (>= src 0) (<= src 10)

                        ; No more than 2048 instructions
                        (bvult insn max-insn)

                        ; Jump target in-bounds
                        (bvult (bvadd insn (sign-extend off (bitvector 32))) max-insn)

                        ; The first instruction starts at 0
                        ; This is needed because unlike uninterpreted functions,
                        ; the C code has to avoid evaluating ctx->offset[-1]
                        ; and instead use 0 directly.
                        (bveq (offsets (bv -1 32)) (bv 0 32))

                        ; Offset[i] inbounds for all i inbounds
                        (forall (list X)
                          (=> (bvult X max-insn)
                              (bvult (offsets X) max-target-size)))

                        ; The next instruction is in the right place
                        (for/all ([i (vector-length insns) #:exhaustive])
                          (bveq (offsets insn)
                                (bvadd (offsets (bvsub insn (bv 1 32))) (integer->bitvector i (bitvector 32)))))

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
                        ; (=> (endian? code) (|| (equal? imm (bv 16 32)) (equal? imm (bv 32 32)) (equal? imm (bv 64 32))))
                        (=> (endian? code) (equal? imm (bv 16 32)))
                        ; Assume the mov32 variant imm 1 implies src == dst
                        ; For debugging, make sure that src and dst are the same value
                        (=> (&& (equal? (BPF_OP code) 'BPF_MOV) (src-x? code) (bveq imm (bv 1 32)))
                            (&& (equal? dst src) (alu32? code)))
        ))

        (let ([asserted (asserts)])
          (clear-asserts!)
          (for ([e asserted])
            (let ([model (verify (assert (=> pre e)))])
              (when (sat? model)
                (printf "Could not prove assert: ~a\n" e))
              (check-unsat? model))))

        ; Check that the preconditions are satisfiable.
        ; Technically not needed but rules out stupid verification bugs.
        (check-sat? (solve (assert pre)))

        ; Run the BPF interpreter on the symbolic BPF instruction
        (bpf:interpret-instr bpf-cpu code dst src off imm)

        ; Run the target interpreter on the JITed instructions
        (run-jitted-code target-cpu insns)

        ; Prove that the final states match
        (check-unsat? (verify (assert (=> pre (cpu-equal? bpf-cpu target-cpu)))))

        ; Prove that the final program counters correspond:
        ; offsets[bpf-pc-end - bpf-pc-base - 1] == (target-pc-end - target-pc-base) / N
        ; where N is the target instruction size.
        (let ([model (verify (assert
          (=> pre
            (bveq (make-target-pc (extract 31 0 (bpf:cpu-pc bpf-cpu)))
                  (target-cpu-pc target-cpu)))))])
          (when (sat? model)
            (displayln `(insns . ,(evaluate insns model))))
          (check-unsat? model))

        ; Prove no undefined behavior, i.e., all assertions are unsatisfiable
        ; given the preconditions.
        (define asserted (asserts))
        (clear-asserts!)
        (for ([e asserted])
          (check-unsat? (verify (assert (=> pre e)))))))