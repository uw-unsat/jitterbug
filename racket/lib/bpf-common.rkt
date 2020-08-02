#lang rosette

(require
  serval/lib/bvarith
  (prefix-in bvaxiom: "bvaxiom.rkt")
  (prefix-in bpf: serval/bpf)
  (prefix-in core: serval/lib/core))

(provide (all-defined-out))

(define BPF_CLASS first)
(define BPF_OP second)
(define BPF_SIZE last)
(define BPF_SRC last)
(define BPF_MODE second)

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
(define BPF_REG_AX 'ax)

(define MAX_BPF_JIT_REG bpf:MAX_BPF_JIT_REG)

(define MAX_TAIL_CALL_CNT 32)

(define (alu64? code)
  (equal? (BPF_CLASS code) 'BPF_ALU64))

(define (alu32? code)
  (equal? (BPF_CLASS code) 'BPF_ALU))

(define (alu? code)
  (|| (alu64? code) (alu32? code)))

(define (jump? code)
  (if (member (BPF_CLASS code) '(BPF_JMP BPF_JMP32)) #t #f))

(define (mov? code)
  (equal? (BPF_OP code) 'BPF_MOV))

(define (mem? code)
  (if (member (BPF_CLASS code) '(BPF_STX BPF_ST BPF_LDX)) #t #f))

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
  (|| (equal? (BPF_SRC code) 'BPF_X)
      (equal? (BPF_CLASS code) 'BPF_LDX)
      (equal? (BPF_CLASS code) 'BPF_STX)))

(define (src-k? code)
  (|| (equal? (BPF_SRC code) 'BPF_K)
      (equal? (BPF_CLASS code) 'BPF_ST)))

(define (code+operands->addr+size bitwidth code dst-op src-op off)
  (values (bvadd (trunc bitwidth (if (equal? (BPF_CLASS code) 'BPF_LDX) src-op dst-op))
                 (sign-extend off (bitvector bitwidth)))
          (bv (bpf:bpf-size->integer (BPF_SIZE code)) bitwidth)))

(define-symbolic _bpf-jit-function-fixed? boolean?)
(define bpf-jit-function-fixed? (make-parameter _bpf-jit-function-fixed?))

(define-symbolic _bpf-jit-call-base (bitvector 64))
(define bpf-jit-call-base (make-parameter _bpf-jit-call-base))

(define-symbolic _bpf-jit-pseudo-call-addr (bitvector 64))
(define bpf-jit-pseudo-call-addr (make-parameter _bpf-jit-pseudo-call-addr))

(define (bpf_jit_get_func_addr ctx insn &addr &fixed)
  (cond
    [(bpf-jit-function-fixed?)
      ; Fixed function, i.e., not a PSEUDO_CALL
      (set-box! &addr (bvadd (bpf-jit-call-base) (zero-extend (bpf:insn-imm insn) (bitvector 64))))
      (set-box! &fixed #t)]
    [else
      ; Not a fixed function, target could be any pointer.
      (set-box! &addr (bpf-jit-pseudo-call-addr))
      (set-box! &fixed #f)]))

(struct bpf-prog-aux (verifier_zext stack_depth) #:transparent)
