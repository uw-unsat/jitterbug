#lang rosette

(require
  rosette/solver/smt/boolector
  serval/lib/unittest
  serval/lib/solver
  racket/control
  (prefix-in bpf: serval/bpf)
  (prefix-in riscv: serval/riscv/base)
  (prefix-in riscv: serval/riscv/interp)
  (prefix-in core: serval/lib/core)
  rosette/lib/synthax
  rosette/lib/angelic
  "bpf-common.rkt"
  "riscv-common.rkt"
)

(provide (all-defined-out))

(define src-regs (make-parameter null))
(define dst-regs (make-parameter null))
(define interpret-reg (make-parameter #f))

(define (choose-imm)
  (define-symbolic* imm12 (bitvector 12))
  imm12)

(struct insn-template (op rd rs1 rs2 imm) #:transparent)

(define (make-insn insn-template bpf-dst bpf-src bpf-imm)
  (define op (insn-template-op insn-template))
  (define rd (insn-template-rd insn-template))
  (define rs1 (insn-template-rs1 insn-template))
  (define rs2 (insn-template-rs2 insn-template))
  (define imm (insn-template-imm insn-template))
  (case op
    [(add sub sll srl sra or and xor slt sltu addw subw sllw srlw)
      (riscv:rv_r_insn op
        ((interpret-reg) rd bpf-dst bpf-src)
        ((interpret-reg) rs1 bpf-dst bpf-src)
        ((interpret-reg) rs2 bpf-dst bpf-src))]
    [else
      (riscv:rv_i_insn op
        ((interpret-reg) rd bpf-dst bpf-src)
        ((interpret-reg) rs1 bpf-dst bpf-src)
        (interpret-imm imm bpf-imm))]))

(define (choose-insn)
  (define rv_ops '(add addi sub sll slli srl srli sra or and xor sltu))
  (when (= (riscv:XLEN) 64)
    (set! rv_ops (append rv_ops '(addw subw sllw srlw))))

  (insn-template
    (apply choose* rv_ops)
    (apply choose* (dst-regs))
    (apply choose* (src-regs))
    (apply choose* (src-regs))
    (choose-imm)))

(define (interpret-imm imm-template bpf-imm)
  imm-template)


(define (synthesize-op op #:size size #:target target)

  (printf "Synthesizing for op ~v with size ~v\n" op size)

  ; Make a JIT of length "size"
  (define jit (vector-map (lambda (i) (choose-insn)) (list->vector (range size))))

  (define (run-jit insn code bpf-dst bpf-src off bpf-imm ctx)
    ; For each instruction in our JIT template,
    ; interpret it and then emit it.
    (for ([i jit])
      (emit (make-insn i bpf-dst bpf-src bpf-imm) ctx))
    (context-insns ctx))

  ; "bpf-jit-specification" will fill s with symbolics it defines,
  ; this hack lets us use them in the #:forall argument to
  ; synthesize
  (define s null)

  ; Get JIT correctness definition.
  (define asserted (with-asserts-only
    (bpf-jit-specification
      op
      (struct-copy bpf-target target [jit-function run-jit])
      #:synthesis #t
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
