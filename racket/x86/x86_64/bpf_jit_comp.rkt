#lang rosette

; This file is translated and adapted from arch/x86/net/bpf_jit_comp.c,
; which is licensed under:
;
; SPDX-License-Identifier: GPL-2.0-only
;
; bpf_jit_comp.c: BPF JIT compiler
;
; Copyright (C) 2011-2013 Eric Dumazet (eric.dumazet@gmail.com)
; Internal BPF Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com

(require
  "../../lib/bpf-common.rkt"
  "../../lib/bvaxiom.rkt"
  "../common.rkt"
  "../../common.rkt"
  (prefix-in core: serval/lib/core)
  (prefix-in bpf: serval/bpf)
  (prefix-in x86: serval/x86))

(provide emit_insn emit_prologue emit_epilogue is_ereg reg2hex (struct-out context))

(define current-context (make-parameter #f))

(struct context (insns offset len image aux seen-exit cleanup-addr) #:mutable #:transparent)

(define (emit_code ctx lst)
  (define size (bv (length lst) 32))
  (for ([b lst])
    (for/all ([b b #:exhaustive])
      (for/all ([i (context-insns ctx) #:exhaustive])
        (set-context-insns! ctx (vector-append i (vector b))))))
  (set-context-len! ctx (bvadd size (context-len ctx))))

(define (EMIT v n)
  (define lst
    (cond
      [(list? v) (map (lambda (x) (if (bv? x) (extract 7 0 x) (bv x 8))) v)]
      [(bv? v) (core:bitvector->list/le v)]
      [else (core:bug (format "emit: ~a" v))]))
  (emit_code (current-context) (take lst n)))

(define (EMIT1 b1) (EMIT (list b1) 1))
(define (EMIT2 b1 b2) (EMIT (list b1 b2) 2))
(define (EMIT3 b1 b2 b3) (EMIT (list b1 b2 b3) 3))
(define (EMIT4 b1 b2 b3 b4) (EMIT (list b1 b2 b3 b4) 4))

(define (EMIT1_off32 b1 off)
  (EMIT1 b1)
  (EMIT off 4))

(define (EMIT2_off32 b1 b2 off)
  (EMIT2 b1 b2)
  (EMIT off 4))

(define (EMIT3_off32 b1 b2 b3 off)
  (EMIT3 b1 b2 b3)
  (EMIT off 4))

(define (EMIT4_off32 b1 b2 b3 b4 off)
  (EMIT4 b1 b2 b3 b4)
  (EMIT off 4))

(define (is_imm8 x)
  (define value (sign-extend x (bitvector 32)))
  (&& (bvsle value (bv 127 32)) (bvsge value (bv -128 32))))

(define (is_simm32 value)
  (bveq value (sign-extend (extract 31 0 value) (bitvector 64))))

(define (is_uimm32 value)
  (bveq value (zero-extend (extract 31 0 value) (bitvector 64))))

; mov dst, src
(define (EMIT_mov DST SRC)
  (when (! (equal? DST SRC))
    (EMIT3 (add_2mod #x48 DST SRC) #x89 (add_2reg #xC0 DST SRC))))

(define (bpf_size_to_x86_bytes bpf_size)
  (case bpf_size
    [(BPF_W) 4]
    [(BPF_H) 2]
    [(BPF_B) 1]
    [(BPF_DW) 4]
    [else 0]))

; List of x86 cond jumps opcodes (. + s8)
; Add 0x10 (and an extra 0x0f) to generate far jumps (. + s32)\
(define X86_JB  #x72)
(define X86_JAE #x73)
(define X86_JE  #x74)
(define X86_JNE #x75)
(define X86_JBE #x76)
(define X86_JA  #x77)
(define X86_JL  #x7C)
(define X86_JGE #x7D)
(define X86_JLE #x7E)
(define X86_JG  #x7F)

(define AUX_REG    'bpf-aux)
(define X86_REG_R9 'bpf-x86-r9)

(define regmap (list
  (cons BPF_REG_0 (bv 0 3))  ; RAX
  (cons BPF_REG_1 (bv 7 3))  ; RDI
  (cons BPF_REG_2 (bv 6 3))  ; RSI
  (cons BPF_REG_3 (bv 2 3))  ; RDX
  (cons BPF_REG_4 (bv 1 3))  ; RCX
  (cons BPF_REG_5 (bv 0 3))  ; R8
  (cons BPF_REG_6 (bv 3 3))  ; RBX callee saved
  (cons BPF_REG_7 (bv 5 3))  ; R13 callee saved
  (cons BPF_REG_8 (bv 6 3))  ; R14 callee saved
  (cons BPF_REG_9 (bv 7 3))  ; R15 callee saved
  (cons BPF_REG_FP (bv 5 3)) ; RBP readonly
  (cons BPF_REG_AX (bv 2 3)) ; R10 temp register
  (cons AUX_REG (bv 3 3))    ; R11 temp register
  (cons X86_REG_R9 (bv 1 3)) ; R9 register, 6th function argument
))

(define (reg2hex reg)
  (define e (assoc reg regmap))
  (assert e (format "unknown BPF register: ~a" reg))
  (cdr e))

(define (is_ereg reg)
  (if (member reg (list
    BPF_REG_5 AUX_REG BPF_REG_7 BPF_REG_8 BPF_REG_9 X86_REG_R9 BPF_REG_AX))
    #t #f))

(define (is_ereg_8l reg)
  (|| (is_ereg reg)
    (if (member reg (list
      BPF_REG_1 BPF_REG_2 BPF_REG_FP))
      #t #f)))

(define (is_axreg reg)
  (equal? reg BPF_REG_0))

; Add modifiers if 'reg' maps to x86-64 registers R8..R15
(define (add_1mod byte reg)
  (set! byte (bv byte 8))
  (static-assert (bvzero? (bit 0 byte)) "lowest bit must be clear")
  (define r byte)
  (when (is_ereg reg)
    (set! r (bvor r (bv 1 8))))
  ; Splitting for [AND|OR|XOR]-K to concretize the REX prefix.
  ; The problem is the following:
  ; - the JIT emits the (symbolic) REX prefix _first_;
  ; - the JIT emits a special instruction for is_axreg(dst_reg).
  ;
  ; But the decoding code for the instruction using %rax requires
  ; a _concrete_ REX prefix.
  ;
  ; This doesn't increase the verification time much as there will
  ; be only two cases for the REX prefix.
  ;
  ; We don't do similar things for add_2mod as it's not needed.
  (simplify-with r #:msg "add_1mod"
    (for/all ([b (bool->bitvector (is_ereg reg)) #:exhaustive])
      (concat (extract 7 1 byte) b))))

(define (add_2mod byte r1 r2)
  (set! byte (bv byte 8))
  (static-assert (bvzero? (extract 2 0 byte)) "lowest 3 bits must be clear")
  (define r byte)
  (when (is_ereg r1)
    (set! r (bvor r (bv 1 8))))
  (when (is_ereg r2)
    (set! r (bvor r (bv 4 8))))
  (simplify-with r #:msg "add_2mod"
    (concat (extract 7 3 byte)
            (bool->bitvector (is_ereg r2))    ; R
            (bv #b0 1)                        ; X
            (bool->bitvector (is_ereg r1))))) ; B

; Encode 'dst_reg' register into x86-64 opcode 'byte'
(define (add_1reg byte dst_reg)
  (set! byte (bv byte 8))
  (static-assert (bvzero? (extract 2 0 byte)) "lowest 3 bits must be clear")
  (define r (core:trunc 8 (bvadd (zero-extend byte (bitvector 32))
                                 (zero-extend (reg2hex dst_reg) (bitvector 32)))))
  (simplify-with r #:msg "add_1reg"
    (concat (extract 7 3 byte)
            (reg2hex dst_reg))))

; Encode 'dst_reg' and 'src_reg' registers into x86-64 opcode 'byte'
(define (add_2reg byte dst_reg src_reg)
  (set! byte (bv byte 8))
  (static-assert (bvzero? (extract 5 0 byte)) "lowest 6 bits must be clear")
  (define r (core:trunc 8 (bvadd (zero-extend byte (bitvector 32))
                                 (zero-extend (reg2hex dst_reg) (bitvector 32))
                                 (bvshl (zero-extend (reg2hex src_reg) (bitvector 32)) (bv 3 32)))))
  (simplify-with r #:msg "add_2reg"
    (concat (extract 7 6 byte)
            (reg2hex src_reg)
            (reg2hex dst_reg))))

(define X86_PATCH_SIZE 5)

(define (emit_prologue ctx stack_depth ebpf_from_cbpf)
  ; NB: Ignore the nops at the beginning for trampoline code.
  (parameterize ([current-context ctx])
    (EMIT1 #x55)           ; push rbp
    (EMIT3 #x48 #x89 #xE5) ; mov rbp, rsp
    ; sub rsp, rounded_stack_depth
    (EMIT3_off32 #x48 #x81 #xEC (round_up stack_depth (bv 8 32)))
    (EMIT1 #x53)           ; push rbx
    (EMIT2 #x41 #x55)      ; push r13
    (EMIT2 #x41 #x56)      ; push r14
    (EMIT2 #x41 #x57)      ; push r15
    (when (! ebpf_from_cbpf)
      ; zero init tail_call_cnt
      (EMIT2 #x6A #x00))
    (void)))

(define (emit_epilogue ctx)
  (parameterize ([current-context ctx])
    (EMIT2 #x41 #x5F) ; pop r15
    (EMIT2 #x41 #x5E) ; pop r14
    (EMIT2 #x41 #x5D) ; pop r13
    (EMIT1 #x5B)      ; pop rbx
    (EMIT1 #xC9)      ; leave
    (EMIT1 #xC3)      ; ret
    (void)))

(define (emit_patch pprog func ip opcode)
  (define offset (bvsub func (bvadd ip (bv X86_PATCH_SIZE 64))))
  (assume (is_simm32 offset))
  (EMIT1_off32 opcode offset))

(define (emit_call pprog func ip)
  (emit_patch pprog func ip #xE8))

(define (emit_mov_imm32 pprog sign_propagate dst_reg imm32)
  (cond
    [(&& sign_propagate (bvslt imm32 (bv 0 32)))
     ; 'mov %rax, imm32' sign extends imm32
     (define b1 (add_1mod #x48 dst_reg))
     (define b2 #xC7)
     (define b3 #xC0)
     (EMIT3_off32 b1 b2 (add_1reg b3 dst_reg) imm32)]

     ; Optimization: if imm32 is zero, use 'xor %eax, %eax'
     ; to save 3 bytes.
     [(bveq imm32 (bv 0 32))
      (when (is_ereg dst_reg)
        (EMIT1 (add_2mod #x40 dst_reg dst_reg)))
      (define b2 #x31) ; xor
      (define b3 #xC0)
      (EMIT2 b2 (add_2reg b3 dst_reg dst_reg))]

    ; Optimization: if imm32 is positive, use 'mov %eax, imm32'
    ; (which zero-extends imm32) to save 2 bytes.
    [else
     ; mov %eax, imm32
     (when (is_ereg dst_reg)
       (EMIT1 (add_1mod #x40 dst_reg)))
     (EMIT1_off32 (add_1reg #xB8 dst_reg) imm32)]))


(define (emit_mov_imm64 pprog dst_reg imm32_hi imm32_lo)
  (cond
    [(is_uimm32 (concat imm32_hi imm32_lo))
     ; For emitting plain u32, where sign bit must not be
     ; propagated LLVM tends to load imm64 over mov32
     ; directly, so save couple of bytes by just doing
     ; 'mov %eax, imm32' instead.
     (emit_mov_imm32 pprog #f dst_reg imm32_lo)]
    [else
     ; movabsq %rax, imm64
     (EMIT2 (add_1mod #x48 dst_reg) (add_1reg #xB8 dst_reg))
     (EMIT imm32_lo 4)
     (EMIT imm32_hi 4)]))


(define (emit_mov_reg &prog is64 dst_reg src_reg)
  (cond
    [is64
     ; mov dst, src
     (EMIT_mov dst_reg src_reg)]
    [else
     ; mov32 dst, src
     (when (|| (is_ereg dst_reg) (is_ereg src_reg))
       (EMIT1 (add_2mod #x40 dst_reg src_reg)))
     (EMIT2 #x89 (add_2reg #xC0 dst_reg src_reg))]))


; LDX: dst_reg = *(u8*)(src_reg + off)
(define (emit_ldx pprog size dst_reg src_reg off)
  (case size
    [(BPF_B)
     ; Emit 'movzx rax, byte ptr [rax + off]'
     (EMIT3 (add_2mod #x48 src_reg dst_reg) #x0F #xB6)]
    [(BPF_H)
     ; Emit 'movzx rax, word ptr [rax + off]'
     (EMIT3 (add_2mod #x48 src_reg dst_reg) #x0F #xB7)]
    [(BPF_W)
     ; Emit 'mov eax, dword ptr [rax+0x14]'
     (if (|| (is_ereg dst_reg) (is_ereg src_reg))
         (EMIT2 (add_2mod #x40 src_reg dst_reg) #x8B)
         (EMIT1 #x8B))]
    [(BPF_DW)
     ; Emit 'mov rax, qword ptr [rax+0x14]'
     (EMIT2 (add_2mod #x48 src_reg dst_reg) #x8B)])
  ; If insn->off == 0 we can save one extra byte, but
	; special case of x86 R13 which always needs an offset
	; is not worth the hassle
  (if (is_imm8 off)
      (EMIT2 (add_2reg #x40 src_reg dst_reg) off)
      (EMIT1_off32 (add_2reg #x80 src_reg dst_reg) off)))


; STX: *(u8*)(dst_reg + off) = src_reg
(define (emit_stx pprog size dst_reg src_reg off)
  (case size
    [(BPF_B)
     ; Emit 'mov byte ptr [rax + off], al'
     ; PATCH: BPL
     (if (|| (is_ereg dst_reg)
             (is_ereg_8l src_reg))
         (EMIT2 (add_2mod #x40 dst_reg src_reg) #x88)
         (EMIT1 #x88))]
    [(BPF_H)
     (if (|| (is_ereg dst_reg) (is_ereg src_reg))
         (EMIT3 #x66 (add_2mod #x40 dst_reg src_reg) #x89)
         (EMIT2 #x66 #x89))]
    [(BPF_W)
     (if (|| (is_ereg dst_reg) (is_ereg src_reg))
         (EMIT2 (add_2mod #x40 dst_reg src_reg) #x89)
         (EMIT1 #x89))]
    [(BPF_DW)
     (EMIT2 (add_2mod #x48 dst_reg src_reg) #x89)])
  (if (is_imm8 off)
      (EMIT2 (add_2reg #x40 dst_reg src_reg) off)
      (EMIT1_off32 (add_2reg #x80 dst_reg src_reg) off)))


(define (emit_insn i insn next-insn ctx)
  (parameterize ([current-context ctx])
    (do_jit i insn next-insn ctx)
    (context-insns ctx)))


(define (@emit_cond_jmp code i off addrs)
  ; Convert BPF opcode to x86
  (define jmp_cond
    (case (BPF_OP code)
      [(BPF_JEQ) X86_JE]
      [(BPF_JSET
        BPF_JNE) X86_JNE]
      [(BPF_JGT) X86_JA] ; GT is unsigned '>', JA in x86
      [(BPF_JLT) X86_JB] ; LT is unsigned '<', JB in x86
      [(BPF_JGE) X86_JAE] ; GE is unsigned '>=', JAE in x86
      [(BPF_JLE) X86_JBE] ; LE is unsigned '<=', JBE in x86
      [(BPF_JSGT) X86_JG] ; Signed '>', GT in x86
      [(BPF_JSLT) X86_JL] ; Signed '<', LT in x86
      [(BPF_JSGE) X86_JGE] ; Signed '>=', GE in x86
      [(BPF_JSLE) X86_JLE] ; Signed '<=', LE in x86
    ))
  (define off32 (sign-extend off (bitvector 32)))
  (define jmp_offset (bvsub (addrs (bvadd i off32)) (addrs i)))

  (cond
    [(is_imm8 jmp_offset)
     (EMIT2 jmp_cond jmp_offset)]
    [else
     (EMIT2_off32 #x0F (+ jmp_cond #x10) jmp_offset)]))

(define (emit_jmp jmp_offset)
  (cond
    [(is_imm8 jmp_offset)
     (EMIT2 #xEB jmp_offset)]
    [else
     (EMIT1_off32 #xE9 jmp_offset)]))

(define (do_jit i insn next-insn &prog)
  (set! i (bvadd1 i))
  (define code (bpf:insn-code insn))
  (define dst_reg (bpf:insn-dst insn))
  (define src_reg (bpf:insn-src insn))
  (define off (bpf:insn-off insn))
  (define imm32 (bpf:insn-imm insn))
  (define off32 (sign-extend off (bitvector 32)))

  (define addrs (context-offset &prog))
  (define image (context-image &prog))
  (define is64 (equal? (BPF_CLASS code) 'BPF_ALU64))

  (define emit_cond_jmp (lambda () (@emit_cond_jmp code i off addrs)))

  (define (st)
    (if (is_imm8 off)
        (EMIT2 (add_1reg #x40 dst_reg) off)
        (EMIT1_off32 (add_1reg #x80 dst_reg) off32))
    (EMIT imm32 (bpf_size_to_x86_bytes (BPF_SIZE code))))

  (define (xadd)
    (if (is_imm8 off)
        (EMIT2 (add_2reg #x40 dst_reg src_reg) off)
        (EMIT1_off32 (add_2reg #x80 dst_reg src_reg) off32)))

  (case code
    ; ALU
    [((BPF_ALU BPF_ADD BPF_X)
      (BPF_ALU BPF_SUB BPF_X)
      (BPF_ALU BPF_AND BPF_X)
      (BPF_ALU BPF_OR BPF_X)
      (BPF_ALU BPF_XOR BPF_X)
      (BPF_ALU64 BPF_ADD BPF_X)
      (BPF_ALU64 BPF_SUB BPF_X)
      (BPF_ALU64 BPF_AND BPF_X)
      (BPF_ALU64 BPF_OR BPF_X)
      (BPF_ALU64 BPF_XOR BPF_X))
     (define b2
       (case (BPF_OP code)
         [(BPF_ADD) #x01]
         [(BPF_SUB) #x29]
         [(BPF_AND) #x21]
         [(BPF_OR)  #x09]
         [(BPF_XOR) #x31]))
      (cond
        [is64
         (EMIT1 (add_2mod #x48 dst_reg src_reg))]
        [(|| (is_ereg dst_reg) (is_ereg src_reg))
         (EMIT1 (add_2mod #x40 dst_reg src_reg))])
      (EMIT2 b2 (add_2reg #xC0 dst_reg src_reg))]

    [((BPF_ALU64 BPF_MOV BPF_X)
      (BPF_ALU BPF_MOV BPF_X))
     (emit_mov_reg &prog is64 dst_reg src_reg)]

    ; neg dst
    [((BPF_ALU64 BPF_NEG)
      (BPF_ALU BPF_NEG))
     (cond
       [is64
        (EMIT1 (add_1mod #x48 dst_reg))]
       [(is_ereg dst_reg)
        (EMIT1 (add_1mod #x40 dst_reg))])
     (EMIT2 #xF7 (add_1reg #xD8 dst_reg))]

    [((BPF_ALU BPF_ADD BPF_K)
      (BPF_ALU BPF_SUB BPF_K)
      (BPF_ALU BPF_AND BPF_K)
      (BPF_ALU BPF_OR BPF_K)
      (BPF_ALU BPF_XOR BPF_K)
      (BPF_ALU64 BPF_ADD BPF_K)
      (BPF_ALU64 BPF_SUB BPF_K)
      (BPF_ALU64 BPF_AND BPF_K)
      (BPF_ALU64 BPF_OR BPF_K)
      (BPF_ALU64 BPF_XOR BPF_K))
     (cond
       [is64
        (EMIT1 (add_1mod #x48 dst_reg))]
       [(is_ereg dst_reg)
        (EMIT1 (add_1mod #x40 dst_reg))])
     ; b3 holds 'normal' opcode, b2 short form only valid
     ; in case dst is eax/rax.
     (define-values (b3 b2)
       (case (BPF_OP code)
         [(BPF_ADD) (values #xC0 #x05)]
         [(BPF_SUB) (values #xE8 #x2D)]
         [(BPF_AND) (values #xE0 #x25)]
         [(BPF_OR)  (values #xC8 #x0D)]
         [(BPF_XOR) (values #xF0 #x35)]))
     (cond
       [(is_imm8 imm32)
        (EMIT3 #x83 (add_1reg b3 dst_reg) imm32)]
       [(is_axreg dst_reg)
        (EMIT1_off32 b2 imm32)]
       [else
        (EMIT2_off32 #x81 (add_1reg b3 dst_reg) imm32)])]

    [((BPF_ALU64 BPF_MOV BPF_K)
      (BPF_ALU BPF_MOV BPF_K))
     (emit_mov_imm32 &prog is64 dst_reg imm32)]

    [((BPF_LD BPF_IMM BPF_DW))
     (emit_mov_imm64 &prog dst_reg (bpf:insn-imm next-insn) imm32)]

    ; dst %= src, dst /= src, dst %= imm32, dst /= imm32
    [((BPF_ALU BPF_MOD BPF_X)
      (BPF_ALU BPF_DIV BPF_X)
      (BPF_ALU BPF_MOD BPF_K)
      (BPF_ALU BPF_DIV BPF_K)
      (BPF_ALU64 BPF_MOD BPF_X)
      (BPF_ALU64 BPF_DIV BPF_X)
      (BPF_ALU64 BPF_MOD BPF_K)
      (BPF_ALU64 BPF_DIV BPF_K))

     (EMIT1 #x50) ; push rax
     (EMIT1 #x52) ; push rdx

     (cond
       [(equal? (BPF_SRC code) 'BPF_X)
        ; mov r11, src_reg
        (EMIT_mov AUX_REG src_reg)]
       [else
        ; mov r11, imm32
        (EMIT3_off32 #x49 #xC7 #xC3 imm32)])

      ; mov rax, dst_reg
      (EMIT_mov BPF_REG_0 dst_reg)

      ; xor edx, edx
      ; equivalent to 'xor rdx, rdx', but one byte less
      (EMIT2 #x31 #xd2)

      (cond
        [is64
         ; div r11
         (EMIT3 #x49 #xF7 #xF3)]
        [else
         ; div r11d
         (EMIT3 #x41 #xF7 #xF3)])

     (cond
       [(equal? (BPF_OP code) 'BPF_MOD)
        ; mov r11, rdx
        (EMIT3 #x49 #x89 #xD3)]
       [else
        ; mov r11, rax
        (EMIT3 #x49 #x89 #xC3)])

     (EMIT1 #x5A) ; pop rdx
     (EMIT1 #x58) ; pop rax

     ; mov dst_reg, r11
     (EMIT_mov dst_reg AUX_REG)]

    [((BPF_ALU BPF_MUL BPF_K)
      (BPF_ALU BPF_MUL BPF_X)
      (BPF_ALU64 BPF_MUL BPF_K)
      (BPF_ALU64 BPF_MUL BPF_X))
     (when (! (equal? dst_reg BPF_REG_0))
       ; push rax
       (EMIT1 #x50))
     (when (! (equal? dst_reg BPF_REG_3))
       ; push rdx
       (EMIT1 #x52))

     ; mov r11, dst_reg
     (EMIT_mov AUX_REG dst_reg)

     (cond
       [(equal? (BPF_SRC code) 'BPF_X)
        (emit_mov_reg &prog is64 BPF_REG_0 src_reg)]
       [else
        (emit_mov_imm32 &prog is64 BPF_REG_0 imm32)])

     (cond
       [is64
        (EMIT1 (add_1mod #x48 AUX_REG))]
       [(is_ereg AUX_REG)
        (EMIT1 (add_1mod #x40 AUX_REG))])
     ; mul(q) r11
     (EMIT2 #xF7 (add_1reg #xE0 AUX_REG))

     (when (! (equal? dst_reg BPF_REG_3))
       ; pop rdx
       (EMIT1 #x5A))
     (when (! (equal? dst_reg BPF_REG_0))
       ; mov dst_reg, rax
       (EMIT_mov dst_reg BPF_REG_0)
       ; pop rax
       (EMIT1 #x58))]

    ; Shifts
    [((BPF_ALU BPF_LSH BPF_K)
      (BPF_ALU BPF_RSH BPF_K)
      (BPF_ALU BPF_ARSH BPF_K)
      (BPF_ALU64 BPF_LSH BPF_K)
      (BPF_ALU64 BPF_RSH BPF_K)
      (BPF_ALU64 BPF_ARSH BPF_K))
     (cond
       [is64
        (EMIT1 (add_1mod #x48 dst_reg))]
       [(is_ereg dst_reg)
        (EMIT1 (add_1mod #x40 dst_reg))])

     (define-values (b3)
       (case (BPF_OP code)
         [(BPF_LSH) #xE0]
         [(BPF_RSH) #xE8]
         [(BPF_ARSH) #xF8]))

     (cond
       [(bveq imm32 (bv 1 32))
        (EMIT2 #xD1 (add_1reg b3 dst_reg))]
       [else
        (EMIT3 #xC1 (add_1reg b3 dst_reg) imm32)])]

    [((BPF_ALU BPF_LSH BPF_X)
      (BPF_ALU BPF_RSH BPF_X)
      (BPF_ALU BPF_ARSH BPF_X)
      (BPF_ALU64 BPF_LSH BPF_X)
      (BPF_ALU64 BPF_RSH BPF_X)
      (BPF_ALU64 BPF_ARSH BPF_X))

     (define insn->dst_reg dst_reg)
     ; Check for bad case when dst_reg == rcx
     (when (equal? dst_reg BPF_REG_4)
       ; mov r11, dst_reg
       (EMIT_mov AUX_REG dst_reg)
       (set! dst_reg AUX_REG))

     ; common case
     (when (! (equal? src_reg BPF_REG_4))
       (EMIT1 #x51) ; push rcx
       ; mov rcx, src_reg
       (EMIT_mov BPF_REG_4 src_reg))

      ; shl %rax, %cl | shr %rax, %cl | sar %rax, %cl
      (cond
        [is64
         (EMIT1 (add_1mod #x48 dst_reg))]
        [(is_ereg dst_reg)
         (EMIT1 (add_1mod #x40 dst_reg))])

      (define b3
        (case (BPF_OP code)
          [(BPF_LSH) #xE0]
          [(BPF_RSH) #xE8]
          [(BPF_ARSH) #xF8]))
      (EMIT2 #xD3 (add_1reg b3 dst_reg))

      (when (! (equal? src_reg BPF_REG_4))
        (EMIT1 #x59)) ; pop rcx

      (when (equal? insn->dst_reg BPF_REG_4)
        ; mov dst_reg, r11
        (EMIT_mov insn->dst_reg AUX_REG))]

    [((BPF_ALU BPF_END BPF_FROM_BE))
     (cond
       [(bveq imm32 (bv 16 32))
        ; Emit 'ror %ax, 8' to swap lower 2 bytes
        (EMIT1 #x66)
        (when (is_ereg dst_reg)
          (EMIT1 #x41))
        (EMIT3 #xC1 (add_1reg #xC8 dst_reg) 8)

        ; Emit 'movzwl eax, ax'
        (cond
          [(is_ereg dst_reg)
           (EMIT3 #x45 #x0F #xB7)]
          [else
           (EMIT2 #x0F #xB7)])
        (EMIT1 (add_2reg #xC0 dst_reg dst_reg))]
       [(bveq imm32 (bv 32 32))
        ; Emit 'bswap eax' to swap lower 4 bytes
        (cond
          [(is_ereg dst_reg)
           (EMIT2 #x41 #x0F)]
          [else
           (EMIT1 #x0F)])
        (EMIT1 (add_1reg #xC8 dst_reg))]
       [(bveq imm32 (bv 64 32))
        ; Emit 'bswap rax' to swap 8 bytes
        (EMIT3 (add_1mod #x48 dst_reg) #x0F (add_1reg #xC8 dst_reg))])]

    [((BPF_ALU BPF_END BPF_FROM_LE))
     (cond
       [(bveq imm32 (bv 16 32))
        ; Emit 'movzwl eax, ax' to zero extend 16-bit into 64 bit
        (cond
          [(is_ereg dst_reg)
           (EMIT3 #x45 #x0F #xB7)]
          [else
           (EMIT2 #x0F #xB7)])
        (EMIT1 (add_2reg #xC0 dst_reg dst_reg))]
       [(bveq imm32 (bv 32 32))
        ; Emit 'mov eax, eax' to clear upper 32-bits
        (when (is_ereg dst_reg)
          (EMIT1 #x45))
        (EMIT2 #x89 (add_2reg #xC0 dst_reg dst_reg))]
       [(bveq imm32 (bv 64 32))
        ; nop
        (void)])]

    ; ST: *(u8*)(dst_reg + off) = imm
    [((BPF_ST BPF_MEM BPF_B))
     (if (is_ereg dst_reg)
         (EMIT2 #x41 #xC6)
         (EMIT1 #xC6))
     (st)]
    [((BPF_ST BPF_MEM BPF_H))
     (if (is_ereg dst_reg)
         (EMIT3 #x66 #x41 #xC7)
         (EMIT2 #x66 #xC7))
     (st)]
    [((BPF_ST BPF_MEM BPF_W))
     (if (is_ereg dst_reg)
         (EMIT2 #x41 #xC7)
         (EMIT1 #xC7))
     (st)]
    [((BPF_ST BPF_MEM BPF_DW))
     (EMIT2 (add_1mod #x48 dst_reg) #xC7)
     (st)]

    ; STX: *(u8*)(dst_reg + off) = src_reg
    [((BPF_STX BPF_MEM BPF_B)
      (BPF_STX BPF_MEM BPF_H)
      (BPF_STX BPF_MEM BPF_W)
      (BPF_STX BPF_MEM BPF_DW))
     (emit_stx &prog (BPF_SIZE code) dst_reg src_reg off32)]

    ; LDX: dst_reg = *(u8*)(src_reg + off)
    [((BPF_LDX BPF_MEM BPF_B)
      (BPF_LDX BPF_MEM BPF_H)
      (BPF_LDX BPF_MEM BPF_W)
      (BPF_LDX BPF_MEM BPF_DW))
     (emit_ldx &prog (BPF_SIZE code) dst_reg src_reg off32)]

    ; STX XADD: lock *(u32*)(dst_reg + off) += src_reg
    [((BPF_STX BPF_XADD BPF_W))
     ; Emit 'lock add dword ptr [rax + off], eax'
     (if (|| (is_ereg dst_reg) (is_ereg src_reg))
         (EMIT3 #xF0 (add_2mod #x40 dst_reg src_reg) #x01)
         (EMIT2 #xF0 #x01))
     (xadd)]
    [((BPF_STX BPF_XADD BPF_DW))
     (EMIT3 #xF0 (add_2mod #x48 dst_reg src_reg) #x01)
     (xadd)]

    ; call
    [((BPF_JMP BPF_CALL))
      (define func (bvadd (bpf-jit-call-base) (zero-extend imm32 (bitvector 64))))
      (emit_call &prog func (bvadd image (zero-extend (addrs (bvsub1 i)) (bitvector 64))))]

    ; cond jump
    [((BPF_JMP BPF_JEQ BPF_X)
      (BPF_JMP BPF_JNE BPF_X)
      (BPF_JMP BPF_JGT BPF_X)
      (BPF_JMP BPF_JLT BPF_X)
      (BPF_JMP BPF_JGE BPF_X)
      (BPF_JMP BPF_JLE BPF_X)
      (BPF_JMP BPF_JSGT BPF_X)
      (BPF_JMP BPF_JSLT BPF_X)
      (BPF_JMP BPF_JSGE BPF_X)
      (BPF_JMP BPF_JSLE BPF_X)
      (BPF_JMP32 BPF_JEQ BPF_X)
      (BPF_JMP32 BPF_JNE BPF_X)
      (BPF_JMP32 BPF_JGT BPF_X)
      (BPF_JMP32 BPF_JLT BPF_X)
      (BPF_JMP32 BPF_JGE BPF_X)
      (BPF_JMP32 BPF_JLE BPF_X)
      (BPF_JMP32 BPF_JSGT BPF_X)
      (BPF_JMP32 BPF_JSLT BPF_X)
      (BPF_JMP32 BPF_JSGE BPF_X)
      (BPF_JMP32 BPF_JSLE BPF_X))
     ; cmp dst_reg, src_reg
     (cond
       [(equal? (BPF_CLASS code) 'BPF_JMP)
        (EMIT1 (add_2mod #x48 dst_reg src_reg))]
       [(|| (is_ereg dst_reg) (is_ereg src_reg))
        (EMIT1 (add_2mod #x40 dst_reg src_reg))])
     (EMIT2 #x39 (add_2reg #xC0 dst_reg src_reg))
     (emit_cond_jmp)]

    [((BPF_JMP BPF_JSET BPF_X)
      (BPF_JMP32 BPF_JSET BPF_X))
     ; test dst_reg, src_reg
     (cond
       [(equal? (BPF_CLASS code) 'BPF_JMP)
        (EMIT1 (add_2mod #x48 dst_reg src_reg))]
       [(|| (is_ereg dst_reg) (is_ereg src_reg))
        (EMIT1 (add_2mod #x40 dst_reg src_reg))])
     (EMIT2 #x85 (add_2reg #xC0 dst_reg src_reg))
     (emit_cond_jmp)]

    [((BPF_JMP BPF_JSET BPF_K)
      (BPF_JMP32 BPF_JSET BPF_K))
     ; test dst_reg, imm32
     (cond
       [(equal? (BPF_CLASS code) 'BPF_JMP)
        (EMIT1 (add_1mod #x48 dst_reg))]
       [(is_ereg dst_reg)
        (EMIT1 (add_1mod #x40 dst_reg))])
     (EMIT2_off32 #xF7 (add_1reg #xC0 dst_reg) imm32)
     (emit_cond_jmp)]

    [((BPF_JMP BPF_JEQ BPF_K)
      (BPF_JMP BPF_JNE BPF_K)
      (BPF_JMP BPF_JGT BPF_K)
      (BPF_JMP BPF_JLT BPF_K)
      (BPF_JMP BPF_JGE BPF_K)
      (BPF_JMP BPF_JLE BPF_K)
      (BPF_JMP BPF_JSGT BPF_K)
      (BPF_JMP BPF_JSLT BPF_K)
      (BPF_JMP BPF_JSGE BPF_K)
      (BPF_JMP BPF_JSLE BPF_K)
      (BPF_JMP32 BPF_JEQ BPF_K)
      (BPF_JMP32 BPF_JNE BPF_K)
      (BPF_JMP32 BPF_JGT BPF_K)
      (BPF_JMP32 BPF_JLT BPF_K)
      (BPF_JMP32 BPF_JGE BPF_K)
      (BPF_JMP32 BPF_JLE BPF_K)
      (BPF_JMP32 BPF_JSGT BPF_K)
      (BPF_JMP32 BPF_JSLT BPF_K)
      (BPF_JMP32 BPF_JSGE BPF_K)
      (BPF_JMP32 BPF_JSLE BPF_K))

     ; test dst_reg, dst_reg to save one extra byte
     (cond
       [(equal? imm32 (bv 0 32))
        (cond
          [(equal? (BPF_CLASS code) 'BPF_JMP)
           (EMIT1 (add_2mod #x48 dst_reg dst_reg))]
          [(is_ereg dst_reg)
           (EMIT1 (add_2mod #x40 dst_reg dst_reg))])
        (EMIT2 #x85 (add_2reg #xC0 dst_reg dst_reg))]
       [else
        ; cmp dst_reg, imm8/32
        (cond
          [(equal? (BPF_CLASS code) 'BPF_JMP)
           (EMIT1 (add_1mod #x48 dst_reg))]
          [(is_ereg dst_reg)
           (EMIT1 (add_1mod #x40 dst_reg))])

        (cond
          [(is_imm8 imm32)
           (EMIT3 #x83 (add_1reg #xF8 dst_reg) imm32)]
          [else
           (EMIT2_off32 #x81 (add_1reg #xF8 dst_reg) imm32)])])

     (emit_cond_jmp)]

    [((BPF_JMP BPF_JA))
     (define jmp_offset
       (cond
         [(bveq off32 (bv -1 32))
          ; -1 jmp instructions will always jump
          ; backwards two bytes. Explicitly handling
          ; this case avoids wasting too many passes
          ; when there are long sequences of replaced
          ; dead code.
          (bv -2 32)]
         [else
          (bvsub (addrs (bvadd i off32)) (addrs i))]))

     (when (! (bvzero? jmp_offset)) ; Optimize out nop jumps
       (emit_jmp jmp_offset))]

    [((BPF_JMP BPF_EXIT))
      (cond
        [(context-seen-exit &prog)
          (define jmp_offset (bvsub (context-cleanup-addr &prog) (addrs i)))
          (emit_jmp jmp_offset)]
        [else
          (set-context-seen-exit! &prog #t)
          (set-context-cleanup-addr! &prog (context-len &prog))
          ; Epilogue proved separately.
          (void)])]

    [else (assert #f (format "Unrecognized code: ~v" code))]))
