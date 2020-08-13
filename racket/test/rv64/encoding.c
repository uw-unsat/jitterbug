#include <linux/bpf.h>
#include <linux/filter.h>

#include "arch/riscv/net/bpf_jit.h"

u16 insns[128];
int offset[128];
struct rv_jit_context ctx;

/* Make the linker happy. */
void vfree(const void *ptr) {}
int printk(const char *fmt, ...) {return 0;}
void *__vmalloc_node_range(unsigned long size, unsigned long align,
    unsigned long start, unsigned long end, gfp_t gfp_mask,
    pgprot_t prot, unsigned long vm_flags, int node,
    const void *caller) {return NULL;}
int bpf_jit_get_func_addr(const struct bpf_prog *prog,
			  const struct bpf_insn *insn, bool extra_pass,
			  u64 *func_addr, bool *func_addr_fixed)
{return -1;}

struct bpf_insn *make_add_x(u8 dst, u8 src)
{
    static struct bpf_insn insn;
    insn = BPF_ALU64_REG(BPF_ADD, dst, src);
    return &insn;
}

struct rv_jit_context *get_ctx(void)
{
    ctx.insns = insns;
    ctx.ninsns = 0;
    ctx.offset = offset;
    return &ctx;
}

/* Force static inline functions to be emitted. */
void *funcs[] = {
    &bpf_jit_emit_insn,
    &emit_addi,
    &emit_srli,
    &rv_add,
    &rv_addi,
    &rv_addiw,
    &rv_addw,
    &rv_amoadd_d,
    &rv_amoadd_w,
    &rv_and,
    &rv_andi,
    &rv_auipc,
    &rv_beq,
    &rv_bge,
    &rv_bgeu,
    &rv_blt,
    &rv_bltu,
    &rv_bne,
    &rv_divu,
    &rv_divuw,
    &rv_jal,
    &rv_jalr,
    &rv_lbu,
    &rv_ld,
    &rv_lhu,
    &rv_lui,
    &rv_lw,
    &rv_lwu,
    &rv_mul,
    &rv_mulhu,
    &rv_mulw,
    &rv_or,
    &rv_ori,
    &rv_remu,
    &rv_remuw,
    &rv_sb,
    &rv_sd,
    &rv_sh,
    &rv_sll,
    &rv_slli,
    &rv_slliw,
    &rv_sllw,
    &rv_sltu,
    &rv_sra,
    &rv_srai,
    &rv_sraiw,
    &rv_sraw,
    &rv_srl,
    &rv_srli,
    &rv_srliw,
    &rv_srlw,
    &rv_sub,
    &rv_subw,
    &rv_sw,
    &rv_xor,
    &rv_xori,
    &rvc_add,
    &rvc_addi,
    &rvc_addi16sp,
    &rvc_addi4spn,
    &rvc_addiw,
    &rvc_and,
    &rvc_andi,
    &rvc_jalr,
    &rvc_jr,
    &rvc_ld,
    &rvc_ldsp,
    &rvc_li,
    &rvc_lui,
    &rvc_lw,
    &rvc_lwsp,
    &rvc_mv,
    &rvc_or,
    &rvc_sd,
    &rvc_sdsp,
    &rvc_slli,
    &rvc_srai,
    &rvc_srli,
    &rvc_sub,
    &rvc_subw,
    &rvc_sw,
    &rvc_swsp,
    &rvc_xor,
};
