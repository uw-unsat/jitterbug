#lang rosette

(require
  rosette/solver/smt/boolector
  serval/lib/unittest
  racket/control
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in core: serval/lib/core)
  rosette/lib/synthax
  rosette/lib/angelic
  "../lib/bpf-common.rkt"
  "spec.rkt")

(provide (all-defined-out))

; A JIT compiler is a vector of instruction templates
(struct instr-template (op rd rs1 rs2 imm) #:transparent)

; Choose register to operate on
(define (choose-reg)
  (choose*
    'tmp ; A temporary register
    'tmp2 ; another tmp register
    'zero ; The RISC-V x0 register
    'src ; Source operand
    'dst ; Desination operand
  ))

; Choose an immediate
(define (choose-imm)
  (define-symbolic* imm12 (bitvector 12))
    imm12 ; a fresh 12-bit int
  )

; Choose an instruction
(define (choose-instr)
  (instr-template
    (choose* 'add 'addi 'sub 'sll 'slli 'srl 'srli 'sra 'srai 'or 'ori 'and 'andi 'xor 'xori 'slt 'sltu) ; op
    (choose* 'tmp 'tmp2 'dst) ; rd
    (choose-reg) ; rs1
    (choose-reg) ; rs2
    (choose-imm) ; imm
  ))

; Interpret an immediate
; NB: immediates are literals for now so nothing to do.
(define (interpret-imm imm-template imm)
  (cond
    [#t imm-template]))

; Register mappping
(define regmap '(a5 a0))

; Interpret a register template, given a concrete source and destination register.
(define (interpret-reg reg-template dst src)
  (case reg-template
    [(zero) 'zero]
    [(tmp) 't0]
    [(tmp2) 't1]
    [(src) (list-ref regmap src)]
    [(dst) (list-ref regmap dst)]))

; Interpret a RISC-V instruction template into a concrete
; instruction given the dst, src, and imm parameters of the
; BPF instruction.
(define (interpret-instr template dst src imm)
  (riscv:instr
    (instr-template-op template)
    (interpret-reg (instr-template-rd template) dst src)
    (interpret-reg (instr-template-rs1 template) dst src)
    (interpret-reg (instr-template-rs2 template) dst src)
    (interpret-imm (instr-template-imm template) imm)
    4))

; Takes a BPF instruction class and yields a JIT for that
; class to RV64.
(define (synthesize-op op #:size size)

  (printf "Synthesizing for op ~v with size ~v\n" op size)

  ; Make a JIT of length "size"
  (define jit (vector-map (lambda (i) (choose-instr)) (list->vector (range size))))

  (define (run-jit insn code dst src off imm ctx)
    ; For each instruction in our JIT template,
    ; interpret it and then emit it.
    (for ([i jit])
      (emit (interpret-instr i dst src imm) ctx))
    (context-insns ctx))

  ; "assert-jit-correct" will fill s with symbolics it defines,
  ; this hack lets us use them in the #:forall argument to
  ; synthesize
  (define s null)

  ; Get JIT correctness definition.
  (define asserted (with-asserts-only
    (assert-jit-correct
      op
      #:target-bitwidth 64
      #:target-insn-size (bv 4 64)
      #:equiv cpu-equal?
      #:run-jit run-jit
      #:run-code run-jitted-code
      #:init-cpu init-rv64-cpu
      #:max-insn (bv #x100000 32)
      #:max-target-size (bv #x800000 32)
      #:target-cpu-pc riscv:cpu-pc
      #:add-symbolics (lambda (n) (set! s (append s n)))
      #:assumptions (thunk null))))

  ; Sanity check
  (check-equal? (asserts) null)

  (define sol
    (synthesize
    #:forall s
    #:guarantee (assert (apply && asserted))))

  (if (sat? sol)
    (evaluate jit (complete-solution sol (symbolics jit)))
    #f))

(define (render-reg r)
  (case r
    [(tmp) "RV_REG_T0"]
    [(tmp2) "RV_REG_T1"]
    [(zero) "RV_REG_ZERO"]
    [(src) "src"]
    [(dst) "dst"]))

(define (render-immediate immediate)
  (format "0x~x" (bitvector->natural immediate)))

(define (render-instr i)
  (define op (instr-template-op i))
  (define rd (render-reg (instr-template-rd i)))
  (define rs1 (render-reg (instr-template-rs1 i)))
  (define rs2 (render-reg (instr-template-rs2 i)))
  (define imm (render-immediate (instr-template-imm i)))
  (case (instr-template-op i)
    [(addi slli srli srai andi ori xori) (format "    emit(rv_~s(~a, ~a, ~a), ctx);" op rd rs1 imm)]
    [(add sub sll srl sra and or xor) (format "    emit(rv_~s(~a, ~a, ~a), ctx);" op rd rs1 rs2)]
    [(sltu slt) (format "    emit(rv_~s(~a, ~a, ~a), ctx);" op rd rs1 rs2)]

    [else (assert #f (format "Unknown instruction to render: ~v" (instr-template-op i)))]))

(define (render-jit jit)
  (define instrs (string-join (map render-instr (vector->list jit)) "\n" #:after-last "\n"))
  (format "void emit_op(u8 dst, u8 src, s32 imm, struct rv_jit_context *ctx) {\n~a}" instrs))

(define (synth-jit-loop op #:maxsize maxsize)
  (let/ec k
    (for ([size (in-range maxsize)])
      (define j (synthesize-op op #:size size))
      (when j (k j)))
    #f))


(define (synth-and-print op)
  (define jit (synth-jit-loop op #:maxsize 8))
  (if jit
    (printf "\nSolution found for ~v:\n~a\n\n" op (render-jit jit))
    (printf "No solution.\n")))


(define-syntax-rule (jit-synthesize-case code)
  (test-case+ (format "SYNTHESIZE ~s" code)
    (begin
      (define boolector-path (getenv "BOOLECTOR"))
      (define solver (if boolector-path (boolector #:path boolector-path) (current-solver)))
      (parameterize
         ([riscv:XLEN 64]
          [current-bitwidth #f]
          [core:target-endian 'little]
          [core:target-pointer-bitwidth 64]
          [core:bvmul-proc bvmul-uf]
          [core:bvudiv-proc bvudiv-uf]
          [core:bvurem-proc bvurem-uf]
          [current-solver solver])

        (displayln (format "synthesizing using ~a" (current-solver)))
        (synth-and-print code)))))
