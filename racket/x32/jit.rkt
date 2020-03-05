#lang rosette

(require
  "../lib/bpf-common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in x32: serval/x32))

(provide (all-defined-out))

(struct context (insns offset len) #:mutable #:transparent)

(define SCRATCH_SIZE 96)
(define STACK_SIZE SCRATCH_SIZE)

(define (STACK_OFFSET k) k)

(define bpf2ia32_map (vector
  (cons (STACK_OFFSET 0) (STACK_OFFSET 4)) ; R0
  (cons (STACK_OFFSET 8) (STACK_OFFSET 12)) ; R1
  (cons (STACK_OFFSET 16) (STACK_OFFSET 20)) ; R2
  (cons (STACK_OFFSET 24) (STACK_OFFSET 28)) ; R3
  (cons (STACK_OFFSET 32) (STACK_OFFSET 36)) ; R4
  (cons (STACK_OFFSET 40) (STACK_OFFSET 44)) ; R5
  (cons (STACK_OFFSET 48) (STACK_OFFSET 52)) ; R6
  (cons (STACK_OFFSET 56) (STACK_OFFSET 60)) ; R7
  (cons (STACK_OFFSET 64) (STACK_OFFSET 68)) ; R8
  (cons (STACK_OFFSET 72) (STACK_OFFSET 76)) ; R9
  (cons (STACK_OFFSET 80) (STACK_OFFSET 84)) ; FP
))

(define (bpf2ia32 r)
  (if (integer? r)
    (vector-ref bpf2ia32_map r)
    (vector-ref bpf2ia32_map (bpf:reg-idx r))))

(define lo car)
(define hi cdr)

(define IA32_EAX 'eax)
(define IA32_ECX 'ecx)
(define IA32_EDX 'edx)
(define IA32_EBX 'ebx)
(define IA32_ESP 'esp)
(define IA32_EBP 'ebp)
(define IA32_ESI 'esi)
(define IA32_EDI 'edi)

; List of x86 cond jumps opcodes (. + s8)
; Add 0x10 (and an extra 0x0f) to generate far jumps (. + s32)
(define IA32_JB  '0x72)
(define IA32_JAE '0x73)
(define IA32_JE  '0x74)
(define IA32_JNE '0x75)
(define IA32_JBE '0x76)
(define IA32_JA  '0x77)
(define IA32_JL  '0x7C)
(define IA32_JGE '0x7D)
(define IA32_JLE '0x7E)
(define IA32_JG  '0x7F)

(define (STACK_VAR off) (bv off 8))

(define-syntax-rule (add_1reg mod+opcode r/m)
  (@add_1reg 'mod+opcode r/m))

(define-syntax-rule (add_2reg mod r/m reg)
  (@add_2reg 'mod r/m reg))

(define-syntax-rule (EMIT2 b1 b2 pprog)
  (@EMIT2 'b1 b2 pprog))

(define-syntax-rule (EMIT3 b1 b2 b3 pprog)
  (@EMIT3 'b1 b2 b3 pprog))

(define-syntax-rule (EMIT4 b1 b2 b3 b4 pprog)
  (@EMIT4 'b1 'b2 b3 b4 pprog))

(define-syntax-rule (EMIT1_off32 b1 off pprog)
  (emit_code (decode (list 'b1 off) 5) pprog))

(define-syntax-rule (EMIT2_off32 b1 b2 off pprog)
  (emit_code (decode (list 'b1 b2 off) 6) pprog))

(define-syntax-rule (EMIT3_off32 b1 b2 b3 off pprog)
  (emit_code (decode (list 'b1 b2 b3 off) 7) pprog))

(define (@add_1reg mod+opcode r/m)
  (x32:ModOpcodeR/M mod+opcode r/m))

(define (@add_2reg mod r/m reg)
  (x32:ModR/M mod r/m reg))

(define (@EMIT2 b1 b2 pprog)
  (emit_code (decode (list b1 b2) 2) pprog))

(define (@EMIT3 b1 b2 b3 pprog)
  (emit_code (decode (list b1 b2 b3) 3) pprog))

(define (@EMIT4 b1 b2 b3 b4 pprog)
  (emit_code (decode (list b1 b2 b3 b4) 4) pprog))

(define (emit_code insn ctx)
  (define insn-size (integer->bitvector (x32:instruction-size insn) (bitvector 32)))
  (for/all ([i (context-insns ctx) #:exhaustive])
    (set-context-insns! ctx (vector-append i (vector insn))))
  (set-context-len! ctx (bvadd insn-size (context-len ctx))))

(define (decode code size)
  (define insn (x32:decode code))
  (core:bug-on (! (equal? code (x32:instruction-encode insn)))
   #:dbg code
   #:msg "instruction decode-encode mismatch!")
  (core:bug-on (! (equal? size (x32:instruction-size insn)))
   #:dbg code
   #:msg (format "instruction size mismatch: ~a" size))
  insn)

(define (is_imm8 imm32)
  (&& (bvsle imm32 (bv 127 32))
      (bvsge imm32 (bv -128 32))))

(define (is_imm32 imm64)
  (bveq imm64 (sign-extend ((extract 31 0) imm64) (bitvector 64))))

(define (emit_ia32_mov_i dst val dstk pprog)
  (cond
    [dstk
     (cond
       [(equal? val (bv 0 32))
        ; xor eax,eax
        (EMIT2 0x33 (add_2reg 0xC0 IA32_EAX IA32_EAX) pprog)
        ; mov dword ptr [ebp+off],eax
        (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog)]
       [else
        (EMIT3_off32 0xC7 (add_1reg 0x40 IA32_EBP) (STACK_VAR dst) val pprog)])]
    [else
     (cond
       [(equal? val (bv 0 32))
        (EMIT2 0x33 (add_2reg 0xC0 dst dst) pprog)]
       [else
        (EMIT2_off32 0xC7 (add_1reg 0xC0 dst) val pprog)])]))


(define (emit_ia32_mov_r dst src dstk sstk pprog)
  (define sreg (if sstk IA32_EAX src))
  (when sstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR src) pprog))
  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 0x89 (add_2reg 0x40 IA32_EBP sreg) (STACK_VAR dst) pprog)]
    [else
     ; mov dst,sreg
     (EMIT2 0x89 (add_2reg 0xC0 dst sreg) pprog)]))


(define (emit_ia32_mov_r64 is64 dst src dstk sstk pprog)
  (emit_ia32_mov_r (lo dst) (lo src) dstk sstk pprog)
  (cond
    [is64
     ; complete 8 byte move
     (emit_ia32_mov_r (hi dst) (hi src) dstk sstk pprog)]
    [else
     ; zero out high 4 bytes
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)]))


(define (emit_ia32_mov_i64 is64 dst val dstk pprog)
  (define hival (bv 0 32))
  (when (&& is64 (core:bitvector->bool (bvand val (bvshl (bv 1 32) (bv 31 32)))))
    (set! hival (bvnot (bv 0 32))))
  (emit_ia32_mov_i (lo dst) val dstk pprog)
  (emit_ia32_mov_i (hi dst) hival dstk pprog))


; dst = -dst (64 bit)
(define (emit_ia32_neg64 dst dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  ; neg dreg_lo
  (EMIT2 0xF7 (add_1reg 0xD8 dreg_lo) pprog)
  ; adc dreg_hi,0x0
  (EMIT3 0x83 (add_1reg 0xD0 dreg_hi) (bv 0 8) pprog)
  ; neg dreg_hi
  (EMIT2 0xF7 (add_1reg 0xD8 dreg_hi) pprog)

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst << src
(define (emit_ia32_lsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)) pprog)]
    [else
     ; mov ecx,src_lo
     (EMIT2 0x8B (add_2reg 0xC0 (lo src) IA32_ECX) pprog)])

  ; shld dreg_hi,dreg_lo,cl
  (@EMIT3 '0x0F '0xA5 (add_2reg 0xC0 dreg_hi dreg_lo) pprog)
  ; shl dreg_lo,cl
  (EMIT2 0xD3 (add_1reg 0xE0 dreg_lo) pprog)

  ; if ecx >= 32, mov dreg_lo into dreg_hi and clear dreg_lo

  ; cmp ecx,32
  (EMIT3 0x83 (add_1reg 0xF8 IA32_ECX) (bv 32 8) pprog)
  ; skip the next two instructions (4 bytes) when < 32
  (@EMIT2 IA32_JB (bv 4 8) pprog)

  ; mov dreg_hi,dreg_lo
  (EMIT2 0x89 (add_2reg 0xC0 dreg_hi dreg_lo) pprog)
  ; xor dreg_lo,dreg_lo
  (EMIT2 0x33 (add_2reg 0xC0 dreg_lo dreg_lo) pprog)

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst >> src
(define (emit_ia32_rsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)) pprog)]
    [else
     ; mov ecx,src_lo
     (EMIT2 0x8B (add_2reg 0xC0 (lo src) IA32_ECX) pprog)])

  ; shrd dreg_lo,dreg_hi,cl
  (@EMIT3 '0x0F '0xAD (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
  ; shr dreg_hi,cl
  (EMIT2 0xD3 (add_1reg 0xE8 dreg_hi) pprog)

  ; if ecx >= 32, mov dreg_hi to dreg_lo and clear dreg_hi

  ; cmp ecx,32
  (EMIT3 0x83 (add_1reg 0xF8 IA32_ECX) (bv 32 8) pprog)
  ; skip the next two instructions (4 bytes) when < 32
  (@EMIT2 IA32_JB (bv 4 8) pprog)

  ; mov dreg_lo,dreg_hi
  (EMIT2 0x89 (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
  ; xor dreg_hi,dreg_hi
  (EMIT2 0x33 (add_2reg 0xC0 dreg_hi dreg_hi) pprog)

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst >> src (signed)
(define (emit_ia32_arsh_r64 dst src dstk sstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR (lo src)) pprog)]
    [else
     ; mov ecx,src_lo
     (EMIT2 0x8B (add_2reg 0xC0 (lo src) IA32_ECX) pprog)])

  ; shrd dreg_lo,dreg_hi,cl
  (@EMIT3 '0x0F '0xAD (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
  ; sar dreg_hi,cl
  (EMIT2 0xD3 (add_1reg 0xF8 dreg_hi) pprog)

  ; if ecx >= 32, mov dreg_hi to dreg_lo and set/clear dreg_hi
  ; depending on the sign

  ; cmp ecx,32
  (EMIT3 0x83 (add_1reg 0xF8 IA32_ECX) (bv 32 8) pprog)
  ; skip the next two instructions (5 bytes) when < 32
  (@EMIT2 IA32_JB (bv 5 8) pprog)

  ; mov dreg_lo,dreg_hi
  (EMIT2 0x89 (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
  ; sar dreg_hi,31
  (EMIT3 0xC1 (add_1reg 0xF8 dreg_hi) (bv 31 8) pprog)

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst << val
(define (emit_ia32_lsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [(bvult val (bv 32 32))
     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.

     ; shld dreg_hi,dreg_lo,imm8
     (EMIT4 0x0F 0xA4 (add_2reg 0xC0 dreg_hi dreg_lo) (extract 7 0 val) pprog)
     ; shl dreg_lo,imm8
     (EMIT3 0xC1 (add_1reg 0xE0 dreg_lo) (extract 7 0 val) pprog)]

    ;  ; shl dreg_hi,imm8
    ;  (EMIT3 0xC1 (add_1reg 0xE0 dreg_hi) val pprog)
    ;  ; mov ebx,dreg_lo
    ;  (EMIT2 0x8B (add_2reg 0xC0 dreg_lo IA32_EBX) pprog)
    ;  ; shl dreg_lo,imm8
    ;  (EMIT3 0xC1 (add_1reg 0xE0 dreg_lo) val pprog)

    ;  ; IA32_ECX = 32 - val
    ;  ; mov ecx,val
    ;  (EMIT2 0xB1 val pprog)
    ;  ; movzx ecx,ecx
    ;  (@EMIT3 0x0F 0xB6 (add_2reg 0xC0 IA32_ECX IA32_ECX) pprog)
    ;  ; neg ecx
    ;  (EMIT2 0xF7 (add_1reg 0xD8 IA32_ECX) pprog)
    ;  ; add ecx,32
    ;  (EMIT3 0x83 (add_1reg 0xC0 IA32_ECX) (bv 32 32) pprog)

    ;  ; shr ebx,cl
    ;  (EMIT2 0xD3 (add_1reg 0xE8 IA32_EBX) pprog)
    ;  ; or dreg_hi,ebx
    ;  (EMIT2 0x09 (add_2reg 0xC0 dreg_hi IA32_EBX) pprog)]
    [else
     (define value (bvsub val (bv 32 32)))

     ; shl dreg_lo,imm8
     (EMIT3 0xC1 (add_1reg 0xE0 dreg_lo) (extract 7 0 value) pprog)
     ; mov dreg_hi,dreg_lo
     (EMIT2 0x89 (add_2reg 0xC0 dreg_hi dreg_lo) pprog)
     ; xor dreg_lo,dreg_lo
     (EMIT2 0x33 (add_2reg 0xC0 dreg_lo dreg_lo) pprog)])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst >> val
(define (emit_ia32_rsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [(bvult val (bv 32 32))
     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.

     ; shrd dreg_lo,dreg_hi,imm8
     (EMIT4 0x0F 0xAC (add_2reg 0xC0 dreg_lo dreg_hi) (extract 7 0 val) pprog)
     ; shr dreg_hi,imm8
     (EMIT3 0xC1 (add_1reg 0xE8 dreg_hi) (extract 7 0 val) pprog)]
    [else
     (define value (bvsub val (bv 32 32)))

     ; shr dreg_hi,imm8
     (EMIT3 0xC1 (add_1reg 0xE8 dreg_hi) (extract 7 0 value) pprog)
     ; mov dreg_lo,dreg_hi
     (EMIT2 0x89 (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
     ; xor dreg_hi,dreg_hi
     (EMIT2 0x33 (add_2reg 0xC0 dreg_hi dreg_hi) pprog)])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


; dst = dst >> val (signed)
(define (emit_ia32_arsh_i64 dst val dstk pprog)
  (define dreg_lo (if dstk IA32_EAX (lo dst)))
  (define dreg_hi (if dstk IA32_EDX (hi dst)))

  (when dstk
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
           (STACK_VAR (lo dst)) pprog)
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
           (STACK_VAR (hi dst)) pprog))

  (cond
    [(bvult val (bv 32 32))
     ; PATCH: the old code is unnecessarily complicated and
     ; incorrect when val == 0.

     ; shrd dreg_lo,dreg_hi,imm8
     (EMIT4 0x0F 0xAC (add_2reg 0xC0 dreg_lo dreg_hi) (extract 7 0 val) pprog)
     ; sar dreg_hi,imm8
     (EMIT3 0xC1 (add_1reg 0xF8 dreg_hi) (extract 7 0 val) pprog)]
    [else
     (define value (bvsub val (bv 32 32)))

     ; sar dreg_hi,imm8
     (EMIT3 0xC1 (add_1reg 0xF8 dreg_hi) (extract 7 0 value) pprog)
     ; mov dreg_lo,dreg_hi
     (EMIT2 0x89 (add_2reg 0xC0 dreg_lo dreg_hi) pprog)
     ; sar dreg_hi,imm8
     (EMIT3 0xC1 (add_1reg 0xF8 dreg_hi) (bv 31 8) pprog)])

  (when dstk
    ; mov dword ptr [ebp+off],dreg_lo
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_lo)
           (STACK_VAR (lo dst)) pprog)
    ; mov dword ptr [ebp+off],dreg_hi
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg_hi)
           (STACK_VAR (hi dst)) pprog)))


(define (emit_ia32_shift_r op dst src dstk sstk pprog)
  (define dreg (if dstk IA32_EAX dst))
  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog))
  (cond
   [sstk
    ; mov ecx,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR src) pprog)]
   [(! (equal? src IA32_ECX))
    ; mov ecx,src
    (EMIT2 0x8B (add_2reg 0xC0 src IA32_ECX) pprog)])
  (define b2
    (case op
      [(BPF_LSH) '0xE0]
      [(BPF_RSH) '0xE8]
      [(BPF_ARSH) '0xF8]))
  (EMIT2 0xD3 (@add_1reg b2 dreg) pprog)

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg) (STACK_VAR dst) pprog)))


(define (emit_ia32_alu_r is64 hi? op dst src dstk sstk pprog)
  (define sreg (if sstk IA32_EAX src))
  (define dreg (if dstk IA32_EDX dst))

  (when sstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR src) pprog))
  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX) (STACK_VAR dst) pprog))

  (case op
    [(BPF_ADD)
     (cond
       [(&& hi? is64)
        (EMIT2 0x11 (add_2reg 0xC0 dreg sreg) pprog)]
       [else
        (EMIT2 0x01 (add_2reg 0xC0 dreg sreg) pprog)])]
    [(BPF_SUB)
     (cond
       [(&& hi? is64)
        (EMIT2 0x19 (add_2reg 0xC0 dreg sreg) pprog)]
       [else
        (EMIT2 0x29 (add_2reg 0xC0 dreg sreg) pprog)])]
    [(BPF_OR)
     (EMIT2 0x09 (add_2reg 0xC0 dreg sreg) pprog)]
    [(BPF_AND)
     (EMIT2 0x21 (add_2reg 0xC0 dreg sreg) pprog)]
    [(BPF_XOR)
     (EMIT2 0x31 (add_2reg 0xC0 dreg sreg) pprog)])

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg) (STACK_VAR dst) pprog)))


(define (emit_ia32_alu_r64 is64 op dst src dstk sstk pprog)
  (emit_ia32_alu_r is64 #f op (lo dst) (lo src) dstk sstk pprog)
  (cond
    [is64
     (emit_ia32_alu_r is64 #t op (hi dst) (hi src) dstk sstk pprog)]
    [else
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)]))


(define (emit_ia32_alu_i is64 hi? op dst val dstk pprog)
  (define dreg (if dstk IA32_EAX dst))
  (define sreg IA32_EDX)

  (when dstk
    ; mov eax,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog))
  (when (! (is_imm8 val))
    ; mov edx,imm32
    (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EDX) val pprog))

  (case op
    [(BPF_ADD)
     (if (&& hi? is64)
         (if (is_imm8 val)
             (EMIT3 0x83 (add_1reg 0xD0 dreg) (extract 7 0 val) pprog)
             (EMIT2 0x11 (add_2reg 0xC0 dreg sreg) pprog))
         (if (is_imm8 val)
             (EMIT3 0x83 (add_1reg 0xC0 dreg) (extract 7 0 val) pprog)
             (EMIT2 0x01 (add_2reg 0xC0 dreg sreg) pprog)))]
    [(BPF_SUB)
     (if (&& hi? is64)
         (if (is_imm8 val)
             (EMIT3 0x83 (add_1reg 0xD8 dreg) (extract 7 0 val) pprog)
             (EMIT2 0x19 (add_2reg 0xC0 dreg sreg) pprog))
         (if (is_imm8 val)
             (EMIT3 0x83 (add_1reg 0xE8 dreg) (extract 7 0 val) pprog)
             (EMIT2 0x29 (add_2reg 0xC0 dreg sreg) pprog)))]
    [(BPF_AND)
     (if (is_imm8 val)
         (EMIT3 0x83 (add_1reg 0xE0 dreg) (extract 7 0 val) pprog)
         (EMIT2 0x21 (add_2reg 0xC0 dreg sreg) pprog))]
    [(BPF_OR)
     (if (is_imm8 val)
         (EMIT3 0x83 (add_1reg 0xC8 dreg) (extract 7 0 val) pprog)
         (EMIT2 0x09 (add_2reg 0xC0 dreg sreg) pprog))]
    [(BPF_XOR)
     (if (is_imm8 val)
         (EMIT3 0x83 (add_1reg 0xF0 dreg) (extract 7 0 val) pprog)
         (EMIT2 0x31 (add_2reg 0xC0 dreg sreg) pprog))]
    [(BPF_NEG)
     (EMIT2 0xF7 (add_1reg 0xD8 dreg) pprog)])

  (when dstk
    ; mov dword ptr [ebp+off],dreg
    (EMIT3 0x89 (add_2reg 0x40 IA32_EBP dreg) (STACK_VAR dst) pprog)))


(define (emit_ia32_alu_i64 is64 op dst val dstk pprog)
  (define hival (bv 0 32))
  (when (&& is64 (! (core:bvzero? (bvand val (bv (arithmetic-shift 1 31) 32)))))
    (set! hival (bv -1 32)))

  (emit_ia32_alu_i is64 #f op (lo dst) val dstk pprog)
  (if is64
      (emit_ia32_alu_i is64 #t op (hi dst) hival dstk pprog)
      (emit_ia32_mov_i (hi dst) (bv 0 32) dstk pprog)))


(define (emit_ia32_mul_r dst src dstk sstk pprog)
  (define sreg (if sstk IA32_ECX src))

  (when sstk
    ; mov ecx,dword ptr [ebp+off]
    (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR src) pprog))

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog)
      ; mov eax,dst
      (EMIT2 0x8B (add_2reg 0xC0 dst IA32_EAX) pprog))

  ; mul sreg
  (EMIT2 0xF7 (add_1reg 0xE0 sreg) pprog)

  (if dstk
      ; mov dword ptr [ebp+off],eax
      (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog)
      ; mov dst,eax
      (EMIT2 0x89 (add_2reg 0xC0 dst IA32_EAX) pprog)))


(define (emit_ia32_mul_r64 dst src dstk sstk pprog)
  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR (hi dst)) pprog)
      ; mov eax,dst_hi
      (EMIT2 0x8B (add_2reg 0xC0 (hi dst) IA32_EAX) pprog))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (lo src)) pprog)
      ; mul src_lo
      (EMIT2 0xF7 (add_1reg 0xE0 (lo src)) pprog))

  ; mov ecx,eax
  (EMIT2 0x89 (add_2reg 0xC0 IA32_ECX IA32_EAX) pprog)

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)) pprog)
      ; mov eax,dst_lo
      (EMIT2 0x8B (add_2reg 0xC0 (lo dst) IA32_EAX) pprog))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (hi src)) pprog)
      ; mul src_hi
      (EMIT2 0xF7 (add_1reg 0xE0 (hi src)) pprog))

  ; add ecx,eax
  (EMIT2 0x01 (add_2reg 0xC0 IA32_ECX IA32_EAX) pprog)

  (if dstk
      ; mov eax,dword ptr [ebp+off]
      (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)) pprog)
      ; mov eax,dst_lo
      (EMIT2 0x8B (add_2reg 0xC0 (lo dst) IA32_EAX) pprog))

  (if sstk
      ; mul dword ptr [ebp+off]
      (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (lo src)) pprog)
      ; mul src_lo
      (EMIT2 0xF7 (add_1reg 0xE0 (lo src)) pprog))

  ; add ecx,edx
  (EMIT2 0x01 (add_2reg 0xC0 IA32_ECX IA32_EDX) pprog)

  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)) pprog)
     ; mov dword ptr [ebp+off],ecx
     (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR (hi dst)) pprog)]
     [else
      ; mov dst_lo,eax
      (EMIT2 0x89 (add_2reg 0xC0 (lo dst) IA32_EAX) pprog)
      ; mov dst_hi,ecx
      (EMIT2 0x89 (add_2reg 0xC0 (hi dst) IA32_ECX) pprog)]))


(define (emit_ia32_mul_i64 dst val dstk pprog)
  (define hival (if (! (core:bvzero? (bvand val (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
  ; movl eax,imm32
  (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EAX) val pprog)
  (if dstk
    ; mul dword ptr [ebp+off]
    (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (hi dst)) pprog)
    ; mul dst_hi
    (EMIT2 0xF7 (add_1reg 0xE0 (hi dst)) pprog))

  ; mov ecx,eax
  (EMIT2 0x89 (add_2reg 0xC0 IA32_ECX IA32_EAX) pprog)

  ; movl eax,imm32
  (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EAX) hival pprog)
  (if dstk
      ; mul dword ptr [ebp+off]
      (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (lo dst)) pprog)
      ; mul dst_lo
      (EMIT2 0xF7 (add_1reg 0xE0 (lo dst)) pprog))
  ; add ecx,eax
  (EMIT2 0x01 (add_2reg 0xC0 IA32_ECX IA32_EAX) pprog)

  ; movl eax,imm32
  (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EAX) val pprog)
  (if dstk
      ; mul dword ptr [ebp+off]
      (EMIT3 0xF7 (add_1reg 0x60 IA32_EBP) (STACK_VAR (lo dst)) pprog)
      ; mul dst_lo
      (EMIT2 0xF7 (add_1reg 0xE0 (lo dst)) pprog))

  ; add ecx,edx
  (EMIT2 0x01 (add_2reg 0xC0 IA32_ECX IA32_EDX) pprog)

  (cond
    [dstk
     ; mov dword ptr [ebp+off],eax
     (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR (lo dst)) pprog)
     ; mov dword ptr [ebp+off],ecx
     (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR (hi dst)) pprog)]
    [else
     ; mov dword ptr [ebp+off],eax
     (EMIT2 0x89 (add_2reg 0xC0 (lo dst) IA32_EAX) pprog)
     ; mov dword ptr [ebp+off],ecx
     (EMIT2 0x89 (add_2reg 0xC0 (hi dst) IA32_ECX) pprog)]))


(define (emit_ia32_div_mod_r op dst src dstk sstk pprog)
  (cond
    [sstk
     ; mov ecx,dword ptr [ebp+off]
     (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX) (STACK_VAR src) pprog)]
    [(! (equal? src IA32_ECX))
     ; mov ecx,src
     (EMIT2 0x8B (add_2reg 0xC0 src IA32_ECX) pprog)])

  (cond
    [dstk
     ; mov eax,dword ptr [ebp+off]
     (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog)]
    [else
     ; mov eax,dst
     (EMIT2 0x8B (add_2reg 0xC0 dst IA32_EAX) pprog)])

  ; xor edx,edx */
  (EMIT2 0x31 (add_2reg 0xC0 IA32_EDX IA32_EDX) pprog)
  ; div ecx
  (EMIT2 0xF7 (add_1reg 0xF0 IA32_ECX) pprog)

  (cond
    [(equal? op 'BPF_MOD)
     (cond
       [dstk
        (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EDX) (STACK_VAR dst) pprog)]
       [else
        (EMIT2 0x89 (add_2reg 0xC0 dst IA32_EDX) pprog)])]
    [else
     (cond
       [dstk
        (EMIT3 0x89 (add_2reg 0x40 IA32_EBP IA32_EAX) (STACK_VAR dst) pprog)]
       [else
        (EMIT2 0x89 (add_2reg 0xC0 dst IA32_EAX) pprog)])]))


(define (get_cond_jmp_opcode op is_cmp_lo)
  (case op
    [(BPF_JEQ)
     IA32_JE]
    [(BPF_JSET BPF_JNE)
     IA32_JNE]
    [(BPF_JGT)
     IA32_JA]
    [(BPF_JLT)
     IA32_JB]
    [(BPF_JGE)
     IA32_JAE]
    [(BPF_JLE)
     IA32_JBE]
    [(BPF_JSGT)
     (if (! is_cmp_lo) IA32_JG IA32_JA)]
    [(BPF_JSLT)
     (if (! is_cmp_lo) IA32_JL IA32_JB)]
    [(BPF_JSGE)
     (if (! is_cmp_lo) IA32_JGE IA32_JAE)]
    [(BPF_JSLE)
     (if (! is_cmp_lo) IA32_JLE IA32_JBE)]
    [else
     (exit 1)]))

(define (far_jmp opcode)
  (when (term? opcode)
    (exit 1))
  (define old (string->number (substring (symbol->string opcode) 2) 16))
  (define new (+ old #x10))
  (string->symbol (string-append "0x" (string-upcase (number->string new 16)))))

(define (emit_cond_jmp i code off addrs &prog)
  (define jmp_cond (get_cond_jmp_opcode (BPF_OP code) #f))
  (define off32 (sign-extend off (bitvector 32)))
  (define jmp_offset (bvsub (addrs (bvadd i off32)) (addrs i)))
  (cond
    [(is_imm8 jmp_offset)
     (@EMIT2 jmp_cond (extract 7 0 jmp_offset) &prog)]
    [else
     (EMIT2_off32 0x0F (far_jmp jmp_cond) jmp_offset &prog)]))

(define (emit_cond_jmp_signed i code off addrs &prog)
  (define off32 (sign-extend off (bitvector 32)))
  ; check the condition for low 32-bit comparison
  (let ([jmp_cond (get_cond_jmp_opcode (BPF_OP code) #t)]
        [jmp_offset (bvadd (bvsub (addrs (bvadd i off32)) (addrs i)) (bv 8 32))])
    (EMIT2_off32 0x0F (far_jmp jmp_cond) jmp_offset &prog)
    (EMIT2 0xEB (bv 6 8) &prog))

  ; check the condition for high 32-bit comparison
  (let ([jmp_cond (get_cond_jmp_opcode (BPF_OP code) #f)]
        [jmp_offset (bvsub (addrs (bvadd i off32)) (addrs i))])
    (EMIT2_off32 0x0F (far_jmp jmp_cond) jmp_offset &prog)))


(define (run-jit i code dst_reg src_reg off imm32 &prog)
  (define addrs (context-offset &prog))
  (define is64 (equal? (BPF_CLASS code) 'BPF_ALU64))
  (define dstk #t)
  (define sstk #t)
  (define dst (if dst_reg (bpf2ia32 dst_reg) #f))
  (define src (if src_reg (bpf2ia32 src_reg) #f))

  (match code
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOV 'BPF_X)
     (emit_ia32_mov_r64 is64 dst src dstk sstk &prog)]

    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_MOV 'BPF_K)
     (emit_ia32_mov_i64 is64 dst imm32 dstk &prog)]

    [(list (or 'BPF_ALU 'BPF_ALU64) (or 'BPF_ADD 'BPF_SUB 'BPF_OR 'BPF_AND 'BPF_XOR) 'BPF_X)
     (emit_ia32_alu_r64 is64 (BPF_OP code) dst src dstk sstk &prog)]

    [(list (or 'BPF_ALU 'BPF_ALU64) (or 'BPF_ADD 'BPF_SUB 'BPF_OR 'BPF_AND 'BPF_XOR) 'BPF_K)
     (emit_ia32_alu_i64 is64 (BPF_OP code) dst imm32 dstk &prog)]

    [(list 'BPF_ALU 'BPF_MUL 'BPF_X)
     (emit_ia32_mul_r (lo dst) (lo src) dstk sstk &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]
    [(list 'BPF_ALU 'BPF_MUL 'BPF_K)
     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     (emit_ia32_mul_r (lo dst) IA32_ECX dstk #f &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]

    [(list 'BPF_ALU (or 'BPF_DIV 'BPF_MOD) 'BPF_X)
     (emit_ia32_div_mod_r (BPF_OP code) (lo dst) (lo src) dstk sstk &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]
    [(list 'BPF_ALU (or 'BPF_DIV 'BPF_MOD) 'BPF_K)
     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     (emit_ia32_div_mod_r (BPF_OP code) (lo dst) IA32_ECX dstk #f &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]

    [(list 'BPF_ALU (or 'BPF_LSH 'BPF_RSH 'BPF_ARSH) 'BPF_X)
     (emit_ia32_shift_r (BPF_OP code) (lo dst) (lo src) dstk sstk &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]

    [(list 'BPF_ALU (or 'BPF_LSH 'BPF_RSH 'BPF_ARSH) 'BPF_K)
     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     (emit_ia32_shift_r (BPF_OP code) (lo dst) IA32_ECX dstk #f &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]

    ; dst = dst << imm
    [(list 'BPF_ALU64 'BPF_LSH 'BPF_K)
     (emit_ia32_lsh_i64 dst imm32 dstk &prog)]
    ; dst = dst >> imm
    [(list 'BPF_ALU64 'BPF_RSH 'BPF_K)
     (emit_ia32_rsh_i64 dst imm32 dstk &prog)]
    ; dst = dst >> imm (signed)
    [(list 'BPF_ALU64 'BPF_ARSH 'BPF_K)
     (emit_ia32_arsh_i64 dst imm32 dstk &prog)]

    ; dst = dst << src
    [(list 'BPF_ALU64 'BPF_LSH 'BPF_X)
     (emit_ia32_lsh_r64 dst src dstk sstk &prog)]
    ; dst = dst >> src
    [(list 'BPF_ALU64 'BPF_RSH 'BPF_X)
     (emit_ia32_rsh_r64 dst src dstk sstk &prog)]
    ; dst = dst >> src (signed)
    [(list 'BPF_ALU64 'BPF_ARSH 'BPF_X)
     (emit_ia32_arsh_r64 dst src dstk sstk &prog)]

    ; dst = -dst
    [(list 'BPF_ALU 'BPF_NEG)
     (emit_ia32_alu_i is64 #f (BPF_OP code) (lo dst) (bv 0 32) dstk &prog)
     (emit_ia32_mov_i (hi dst) (bv 0 32) dstk &prog)]
    [(list 'BPF_ALU64 'BPF_NEG)
     (emit_ia32_neg64 dst dstk &prog)]

    [(list 'BPF_ALU64 'BPF_MUL 'BPF_X)
     (emit_ia32_mul_r64 dst src dstk sstk &prog)]
    [(list 'BPF_ALU64 'BPF_MUL 'BPF_K)
     (emit_ia32_mul_i64 dst imm32 dstk &prog)]

    [(or
       (list 'BPF_JMP (or 'BPF_JEQ 'BPF_JNE 'BPF_JGT 'BPF_JLT 'BPF_JGE 'BPF_JLE) 'BPF_X)
       (list 'BPF_JMP32 (or 'BPF_JEQ 'BPF_JNE 'BPF_JGT 'BPF_JLT 'BPF_JGE 'BPF_JLE 'BPF_JSGT 'BPF_JSLT 'BPF_JSGE 'BPF_JSLE) 'BPF_X))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (lo src)))

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)) &prog)))

     (when sstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EBX)
                (STACK_VAR (hi src)) &prog)))

     (when is_jmp64
       ; cmp dreg_hi,sreg_hi
       (EMIT2 0x39 (add_2reg 0xC0 dreg_hi sreg_hi) &prog)
       (@EMIT2 IA32_JNE (bv 2 8) &prog))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 0x39 (add_2reg 0xC0 dreg_lo sreg_lo) &prog)
     (emit_cond_jmp i code off addrs &prog)]

    [(list 'BPF_JMP (or 'BPF_JSGT 'BPF_JSLE 'BPF_JSLT 'BPF_JSGE) 'BPF_X)
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (lo src)))

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
              (STACK_VAR (hi dst)) &prog))

     (when sstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)) &prog)
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EBX)
              (STACK_VAR (hi src)) &prog))

     ; cmp dreg_hi,sreg_hi
     (EMIT2 0x39 (add_2reg 0xC0 dreg_hi sreg_hi) &prog)
     (@EMIT2 IA32_JNE (bv 10 8) &prog)
     ; cmp dreg_lo,sreg_lo
     (EMIT2 0x39 (add_2reg 0xC0 dreg_lo sreg_lo) &prog)
     (emit_cond_jmp_signed i code off addrs &prog)]

    [(list (or 'BPF_JMP 'BPF_JMP32) 'BPF_JSET 'BPF_X)
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo (if sstk IA32_ECX (lo src)))
     (define sreg_hi (if sstk IA32_EBX (lo src)))

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)) &prog)))

     (when sstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_ECX)
              (STACK_VAR (lo src)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EBX)
                (STACK_VAR (hi src)) &prog)))
     ; and dreg_lo,sreg_lo
     (EMIT2 0x23 (add_2reg 0xC0 sreg_lo dreg_lo) &prog)
     ; PATCH: don't test for high bits for JMP32
     (when is_jmp64
       ; and dreg_hi,sreg_hi
       (EMIT2 0x23 (add_2reg 0xC0 sreg_hi dreg_hi) &prog)
       ; or dreg_lo,dreg_hi
       (EMIT2 0x09 (add_2reg 0xC0 dreg_lo dreg_hi) &prog))
     (emit_cond_jmp i code off addrs &prog)]

    [(list (or 'BPF_JMP 'BPF_JMP32) 'BPF_JSET 'BPF_K)
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)) &prog)))

     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     ; and dreg_lo,sreg_lo
     (EMIT2 0x23 (add_2reg 0xC0 sreg_lo dreg_lo) &prog)
     (when is_jmp64
       (define hival (if (! (core:bvzero? (bvand imm32 (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
       ; mov ebx,imm32
       (EMIT2_off32 0xC7 (add_1reg 0xC0 sreg_hi) hival &prog)
       ; and dreg_hi,sreg_hi
       (EMIT2 0x23 (add_2reg 0xC0 sreg_hi dreg_hi) &prog)
       ; or dreg_lo,dreg_hi
       (EMIT2 0x09 (add_2reg 0xC0 dreg_lo dreg_hi) &prog))

     (emit_cond_jmp i code off addrs &prog)]

    [(or
       (list 'BPF_JMP (or 'BPF_JEQ 'BPF_JNE 'BPF_JGT 'BPF_JLT 'BPF_JGE 'BPF_JLE) 'BPF_K)
       (list 'BPF_JMP32 (or 'BPF_JEQ 'BPF_JNE 'BPF_JGT 'BPF_JLT 'BPF_JGE 'BPF_JLE 'BPF_JSGT 'BPF_JSLT 'BPF_JSGE 'BPF_JSLE) 'BPF_K))
     (define is_jmp64 (equal? (BPF_CLASS code) 'BPF_JMP))
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (when is_jmp64
         (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
                (STACK_VAR (hi dst)) &prog)))

     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     (when is_jmp64
       (define hival (if (! (core:bvzero? (bvand imm32 (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
       ; mov ebx,imm32
       (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EBX) hival &prog)
       ; cmp dreg_hi,sreg_hi
       (EMIT2 0x39 (add_2reg 0xC0 dreg_hi sreg_hi) &prog)
       (@EMIT2 IA32_JNE (bv 2 8) &prog))
     ; cmp dreg_lo,sreg_lo
     (EMIT2 0x39 (add_2reg 0xC0 dreg_lo sreg_lo) &prog)

     (emit_cond_jmp i code off addrs &prog)]

    [(list 'BPF_JMP (or 'BPF_JSGT 'BPF_JSLT 'BPF_JSGE 'BPF_JSLE) 'BPF_K)
     (define dreg_lo (if dstk IA32_EAX (lo dst)))
     (define dreg_hi (if dstk IA32_EDX (hi dst)))
     (define sreg_lo IA32_ECX)
     (define sreg_hi IA32_EBX)

     (when dstk
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EAX)
              (STACK_VAR (lo dst)) &prog)
       (EMIT3 0x8B (add_2reg 0x40 IA32_EBP IA32_EDX)
              (STACK_VAR (hi dst)) &prog))

     ; mov ecx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_ECX) imm32 &prog)
     (define hival (if (! (core:bvzero? (bvand imm32 (bv (arithmetic-shift 1 31) 32)))) (bv -1 32) (bv 0 32)))
     ; mov ebx,imm32
     (EMIT2_off32 0xC7 (add_1reg 0xC0 IA32_EBX) hival &prog)
     ; cmp dreg_hi,sreg_hi
     (EMIT2 0x39 (add_2reg 0xC0 dreg_hi sreg_hi) &prog)
     (@EMIT2 IA32_JNE (bv 10 8) &prog)
     ; cmp dreg_lo,sreg_lo
     (EMIT2 0x39 (add_2reg 0xC0 dreg_lo sreg_lo) &prog)

     (emit_cond_jmp_signed i code off addrs &prog)]

    [(list 'BPF_JMP 'BPF_JA)
     (define off32 (sign-extend off (bitvector 32)))
     (define jmp_offset
       (if (bveq off32 (bv -1 32))
           (bv -2 32)
           (bvsub (addrs (bvadd i off32))
                  (addrs i))))
     ; Optimize out nop jumps
     (unless (core:bvzero? jmp_offset)
       (cond
         [(is_imm8 jmp_offset)
          (EMIT2 0xEB (extract 7 0 jmp_offset) &prog)]
         [else
          (EMIT1_off32 0xE9 jmp_offset &prog)]))]
  )

  (context-insns &prog))
