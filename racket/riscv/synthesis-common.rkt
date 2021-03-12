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
  "../lib/bpf-common.rkt"
  "impl-common.rkt"
  "../lib/spec/bpf.rkt"
  "../lib/spec/per-insn.rkt"
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

  (set! rd ((interpret-reg) rd bpf-dst bpf-src))
  (set! rs1 ((interpret-reg) rs1 bpf-dst bpf-src))
  (set! rs2 ((interpret-reg) rs2 bpf-dst bpf-src))
  (set! imm (interpret-imm imm bpf-imm))

  (case op
    [(add) (rv_add rd rs1 rs2)]
    [(sub) (rv_sub rd rs1 rs2)]
    [(sll) (rv_sll rd rs1 rs2)]
    [(srl) (rv_srl rd rs1 rs2)]
    [(sra) (rv_sra rd rs1 rs2)]
    [(or) (rv_or rd rs1 rs2)]
    [(and) (rv_and rd rs1 rs2)]
    [(xor) (rv_xor rd rs1 rs2)]
    [(slt) (rv_slt rd rs1 rs2)]
    [(sltu) (rv_sltu rd rs1 rs2)]
    [(addw) (rv_addw rd rs1 rs2)]
    [(subw) (rv_subw rd rs1 rs2)]
    [(sllw) (rv_sllw rd rs1 rs2)]
    [(srlw) (rv_srlw rd rs1 rs2)]

    [(addi) (rv_addi rd rs1 imm)]
    [(slli) (rv_slli rd rs1 imm)]
    [(srli) (rv_srli rd rs1 imm)]
    [else (assert #f)]))

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

; For scalability only use BPF specification for bpf regs r0 and r1.
(define (synthesis-select-bpf-regs r)
  (list 'r0 'r1))

(struct conditional (condition iftrue iffalse) #:transparent)

(define (interpret-conditional conditional bpf-dst bpf-src bpf-imm ctx)
  (define condition (conditional-condition conditional))
  (define iftrue (conditional-iftrue conditional))
  (define iffalse (conditional-iffalse conditional))
  (case condition
    [(alwaystrue) (for ([i iftrue]) (emit (make-insn i bpf-dst bpf-src bpf-imm) ctx))]
    [(src-dst-alias)
      (if (equal? bpf-dst bpf-src)
          (for ([i iftrue]) (emit (make-insn i bpf-dst bpf-src bpf-imm) ctx))
          (for ([i iffalse]) (emit (make-insn i bpf-dst bpf-src bpf-imm) ctx)))]))

(define (choose-insn-list length)
  (vector-map (lambda (i) (choose-insn)) (list->vector (range length))))

(define (choose-conditional #:size size)
  (define condition (choose* 'alwaystrue 'src-dst-alias))
  (conditional condition
    (choose-insn-list size)
    (choose-insn-list size)))

(define (synthesize-op op #:size size #:target target)

  (printf "Synthesizing for op ~v with size ~v\n" op size)

  ; Make a JIT of a particular size
  (define jit (choose-conditional #:size size))

  (define (emit_insn insn-idx insn next-insn ctx)
    ; For each instruction in our JIT template,
    ; interpret it and then emit it.
    (define code (bpf:insn-code insn))
    (define bpf-dst (bpf:insn-dst insn))
    (define bpf-src (bpf:insn-src insn))
    (define off (bpf:insn-off insn))
    (define bpf-imm (bpf:insn-imm insn))

    (interpret-conditional jit bpf-dst bpf-src bpf-imm ctx)
    (context-insns ctx))

  ; "per-insn-correctness" will fill s with symbolics it defines,
  ; this hack lets us use them in the #:forall argument to
  ; synthesize
  (define s null)

  ; Get JIT correctness definition.
  (define r (with-vc vc-true
    (per-insn-correctness
      op
      (struct-copy bpf-target target [emit-insn emit_insn]
                                     [select-bpf-regs synthesis-select-bpf-regs]))))

  (assert (normal? r))

  (define sol
    (synthesize
    #:forall (bpf-symbolics)
    #:guarantee (assert (vc-asserts (result-state r)))))

  (if (sat? sol)
    (evaluate jit (complete-solution sol (symbolics jit)))
    #f))
