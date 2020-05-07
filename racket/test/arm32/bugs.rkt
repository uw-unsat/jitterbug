#lang rosette

(require
  "../../lib/tests.rkt"
  (only-in "../../arm32/spec.rkt" check-jit)
  (prefix-in bpf: serval/bpf)
  serval/lib/unittest)

(define (check-shift info)
  (define insn (dict-ref info 'bpf-insn))
  (define imm (bpf:insn-imm insn))
  ; The bug is triggered when the shifting amount is zero.
  (check-equal? imm (bv 0 32)))

(module+ test
  (time (test-bugs "arm32 bugs" check-jit
    ; https://git.kernel.org/linus/bb9562cf5c67
    ['(BPF_ALU64 BPF_RSH BPF_K) check-shift]
    ['(BPF_ALU64 BPF_ARSH BPF_K) check-shift])))
