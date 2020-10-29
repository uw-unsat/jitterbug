#lang rosette

(require
  "../../lib/tests.rkt"
  (only-in "../../x86/x86_32/spec.rkt" check-jit)
  (prefix-in bpf: serval/bpf)
  serval/lib/unittest)

(define (check-shift info)
  (define insn (dict-ref info 'bpf-insn))
  (define imm (bpf:insn-imm insn))
  ; The bug is triggered when the shifting amount is zero.
  (check-equal? imm (bv 0 32)))

(define (check-jset32 info)
  ; 1) ((u32)src & (u32)dst) is zero; and
  ; 2) eax/edx are polluated from previous instructions such that
  ;    (eax & edx) is non-zero (which we don't check here).
  (define bpf-regs (dict-ref info 'bpf-regs))
  (define insn (dict-ref info 'bpf-insn))
  (define dst (bpf:insn-dst insn))
  (define src (bpf:insn-src insn))
  (define dstval (bpf:@reg-ref bpf-regs dst))
  (define srcval (bpf:@reg-ref bpf-regs src))
  (check-equal? (bvand (extract 31 0 dstval) (extract 31 0 srcval)) (bv 0 32)))

(module+ test
  (time (test-bugs "x86_32 bugs" check-jit
    ; https://git.kernel.org/linus/6fa632e719ee
    ['(BPF_ALU64 BPF_LSH BPF_K) check-shift]
    ; https://git.kernel.org/linus/80f1f8503635
    ['(BPF_JMP32 BPF_JSET BPF_X) check-jset32])))
