#lang rosette

(require
  (for-syntax (only-in racket/syntax format-id))
  (only-in rosette/lib/angelic choose*)
  serval/lib/unittest
  (prefix-in core: serval/lib/core)
  (prefix-in riscv: serval/riscv/encoder)
  (prefix-in spec: "../../lib/riscv-common.rkt")
  (prefix-in impl: "../../rvenc/bpf_jit.rkt"))


(define (check-enc spec impl . args)
  (define-values (e asserted)
    (with-asserts
      (begin
        (define spec-insn (apply spec args))
        (define spec-bytes (riscv:encode-instr spec-insn))
        (define impl-bytes (apply impl args))
        (equal? spec-bytes impl-bytes))))
  (check-equal? (asserts) null)
  (check-unsat? (verify (assert (apply && asserted))))
  (check-unsat? (verify (assert e))))

(define (choose-reg)
  (choose* 'x0 'x1 'x2 'x3 'x4 'x5 'x6 'x7 'x8 'x9
           'x10 'x11 'x12 'x13 'x14 'x15 'x16 'x17 'x18 'x19
           'x20 'x21 'x22 'x23 'x24 'x25 'x26 'x27 'x28 'x29
           'x30 'x31))

(define (choose-imm11_0)
  (core:make-arg (bitvector 12)))

(define (choose-imm12_1)
  (core:make-arg (bitvector 12)))

(define (choose-imm31_12)
  (core:make-arg (bitvector 20)))

(define (choose-shamt32)
  (zero-extend (core:make-arg (bitvector 5)) (bitvector 12)))

(define (choose-shamt64)
  (zero-extend (core:make-arg (bitvector 6)) (bitvector 12)))

(define-syntax (enc-verify-case stx)
  (syntax-case stx ()
    [(_ op args ...)
      (with-syntax ([spec-op (format-id stx "spec:~a" (syntax-e #'op))]
                    [impl-op (format-id stx "impl:~a" (syntax-e #'op))])
        (syntax/loc stx
          (test-case+
            (format "VERIFY ~s" (syntax->datum #'op))
            (check-enc spec-op impl-op args ...))))]))

(define tests
  (test-suite+
    "rv encoding tests"
    (enc-verify-case rv_add (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_addi (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_sub (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_and (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_andi (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_or (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_ori (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_xor (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_xori (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_mul (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_mulhu (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_sll (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_slli (choose-reg) (choose-reg) (choose-shamt32))
    (enc-verify-case rv_srl (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_srli (choose-reg) (choose-reg) (choose-shamt32))
    (enc-verify-case rv_sra (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_srai (choose-reg) (choose-reg) (choose-shamt32))
    (enc-verify-case rv_divu (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_remu (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_sltu (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_lui (choose-reg) (choose-imm31_12))
    (enc-verify-case rv_auipc (choose-reg) (choose-imm31_12))
    (enc-verify-case rv_jal (choose-reg) (choose-imm31_12))
    (enc-verify-case rv_jalr (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_beq (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bltu (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bgtu (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bgeu (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bleu (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bne (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_blt (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bgt (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_bge (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_ble (choose-reg) (choose-reg) (choose-imm12_1))
    (enc-verify-case rv_sb (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_sh (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_sw (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_lbu (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_lhu (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_lw (choose-reg) (choose-imm11_0) (choose-reg))
    ; (enc-verify-case rv_amoadd_w (choose-reg) (choose-reg) (choose-reg) (choose-aq) (choose-rl))

    ; RV64-only instructions
    (enc-verify-case rv_slli (choose-reg) (choose-reg) (choose-shamt64))
    (enc-verify-case rv_srli (choose-reg) (choose-reg) (choose-shamt64))
    (enc-verify-case rv_srai (choose-reg) (choose-reg) (choose-shamt64))
    (enc-verify-case rv_addiw (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_addw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_subw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_mulw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_divuw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_remuw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_sllw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_srlw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_sraw (choose-reg) (choose-reg) (choose-reg))
    (enc-verify-case rv_slliw (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_srliw (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_sraiw (choose-reg) (choose-reg) (choose-imm11_0))
    (enc-verify-case rv_sd (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_lwu (choose-reg) (choose-imm11_0) (choose-reg))
    (enc-verify-case rv_ld (choose-reg) (choose-imm11_0) (choose-reg))
    ; (enc-verify-case rv_amoadd_d (choose-reg) (choose-reg) (choose-reg) (choose-aq) (choose-rl))
))

(module+ test
  (time (run-tests tests)))
