#lang rosette

(require
  "../../lib/tests.rkt"
  (only-in "../../riscv/rv64/spec.rkt" check-jit)
  (prefix-in bpf: serval/bpf)
  serval/lib/unittest)

(define (check-alu32 info)
  (define insn (dict-ref info 'bpf-insn))
  (define final-bpf-regs (dict-ref info 'final-bpf-regs))
  (define dst (bpf:insn-dst insn))
  (define dstval (bpf:@reg-ref final-bpf-regs dst))
  ; The bug is triggered when the upper half of the result is zero in BPF
  ; but non-zero in target (which we are not checking yet).
  (check-equal? (extract 63 32 dstval) (bv 0 32)))

(module+ test
  (time (test-bugs "rv64 bugs" check-jit
    ; https://git.kernel.org/linus/1e692f09e091
    ['(BPF_ALU BPF_ADD BPF_X) check-alu32]
    ['(BPF_ALU BPF_SUB BPF_X) check-alu32]
    ['(BPF_ALU BPF_LSH BPF_X) check-alu32]
    ['(BPF_ALU BPF_RSH BPF_X) check-alu32]
    ['(BPF_ALU BPF_ARSH BPF_X) check-alu32]
    ['(BPF_ALU BPF_NEG) check-alu32]
    ['(BPF_ALU BPF_LSH BPF_K) check-alu32]
    ['(BPF_ALU BPF_RSH BPF_K) check-alu32]
    ['(BPF_ALU BPF_ARSH BPF_K) check-alu32]
    ; https://git.kernel.org/linus/fe121ee531d1
    ['(BPF_ALU BPF_AND BPF_X) check-alu32]
    ['(BPF_ALU BPF_OR BPF_X) check-alu32]
    ['(BPF_ALU BPF_XOR BPF_X) check-alu32]
)))
