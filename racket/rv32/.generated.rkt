#lang racket/base

(provide (all-defined-out))

(define SWITCH_emit_rv32_alu_i64 #<<EOD
	switch (op) {
	case BPF_MOV:
		emit_imm32(rd, imm, ctx);
		break;
	case BPF_AND:
		if (is_12b_int(imm)) {
 			emit(rv_andi(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_and(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		if (imm >= 0) {
			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
		}
		break;
	case BPF_OR:
		if (is_12b_int(imm)) {
 			emit(rv_ori(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_or(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		if (imm < 0) {
			emit(rv_ori(hi(rd), RV_REG_ZERO, -1), ctx);
		}
		break;
	case BPF_XOR:
		if (is_12b_int(imm)) {
 			emit(rv_xori(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_xor(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		if (imm < 0) {
			emit(rv_xori(hi(rd), hi(rd), -1), ctx);
		}
		break;
	case BPF_LSH:
		if (imm >= 32) {
 			emit(rv_slli(hi(rd), lo(rd), imm - 32), ctx);
 			emit(rv_addi(lo(rd), RV_REG_ZERO, 0), ctx);
 		} else if (imm == 0) {
 			/* nop */
 		} else {
 			emit(rv_srli(RV_REG_T0, lo(rd), 32 - imm), ctx);
 			emit(rv_slli(hi(rd), hi(rd), imm), ctx);
 			emit(rv_or(hi(rd), RV_REG_T0, hi(rd)), ctx);
 			emit(rv_slli(lo(rd), lo(rd), imm), ctx);
		}
		break;
	case BPF_RSH:
		if (imm >= 32) {
 			emit(rv_srli(lo(rd), hi(rd), imm - 32), ctx);
 			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		} else if (imm == 0) {
 			/* nop */
 		} else {
 			emit(rv_slli(RV_REG_T0, hi(rd), 32 - imm), ctx);
 			emit(rv_srli(lo(rd), lo(rd), imm), ctx);
 			emit(rv_or(lo(rd), RV_REG_T0, lo(rd)), ctx);
 			emit(rv_srli(hi(rd), hi(rd), imm), ctx);
		}
		break;
	case BPF_ARSH:
		if (imm >= 32) {
 			emit(rv_srai(lo(rd), hi(rd), imm - 32), ctx);
 			emit(rv_srai(hi(rd), hi(rd), 31), ctx);
 		} else if (imm == 0) {
 			/* nop */
 		} else {
 			emit(rv_slli(RV_REG_T0, hi(rd), 32 - imm), ctx);
 			emit(rv_srli(lo(rd), lo(rd), imm), ctx);
 			emit(rv_or(lo(rd), RV_REG_T0, lo(rd)), ctx);
 			emit(rv_srai(hi(rd), hi(rd), imm), ctx);
		}
		break;
	}
EOD
)

(define SWITCH_emit_rv32_alu_i32 #<<EOD
	switch (op) {
	case BPF_MOV:
		emit_imm(lo(rd), imm, ctx);
		break;
	case BPF_ADD:
		if (is_12b_int(imm)) {
 			emit(rv_addi(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_add(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_SUB:
		if (is_12b_int(-imm)) {
 			emit(rv_addi(lo(rd), lo(rd), -imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_sub(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_AND:
		if (is_12b_int(imm)) {
 			emit(rv_andi(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_and(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_OR:
		if (is_12b_int(imm)) {
 			emit(rv_ori(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_or(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_XOR:
		if (is_12b_int(imm)) {
 			emit(rv_xori(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_xor(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_LSH:
		if (is_12b_int(imm)) {
 			emit(rv_slli(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_sll(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_RSH:
		if (is_12b_int(imm)) {
 			emit(rv_srli(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_srl(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	case BPF_ARSH:
		if (is_12b_int(imm)) {
 			emit(rv_srai(lo(rd), lo(rd), imm), ctx);
 		} else {
 			emit_imm(RV_REG_T0, imm, ctx);
 			emit(rv_sra(lo(rd), lo(rd), RV_REG_T0), ctx);
		}
		break;
	}
EOD
)

(define SWITCH_emit_rv32_alu_r64 #<<EOD
	switch (op) {
	case BPF_MOV:
		emit(rv_addi(lo(rd), lo(rs), 0), ctx);
		emit(rv_addi(hi(rd), hi(rs), 0), ctx);
		break;
	case BPF_ADD:
		emit(rv_addi(RV_REG_T0, lo(rd), 0), ctx);
		emit(rv_add(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_sltu(RV_REG_T0, lo(rd), RV_REG_T0), ctx);
		emit(rv_add(hi(rd), hi(rd), hi(rs)), ctx);
		emit(rv_add(hi(rd), hi(rd), RV_REG_T0), ctx);
		break;
	case BPF_SUB:
		emit(rv_sub(RV_REG_T1, hi(rd), hi(rs)), ctx);
		emit(rv_sltu(RV_REG_T0, lo(rd), lo(rs)), ctx);
		emit(rv_sub(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_sub(hi(rd), RV_REG_T1, RV_REG_T0), ctx);
		break;
	case BPF_AND:
		emit(rv_and(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_and(hi(rd), hi(rd), hi(rs)), ctx);
		break;
	case BPF_OR:
		emit(rv_or(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_or(hi(rd), hi(rd), hi(rs)), ctx);
		break;
	case BPF_XOR:
		emit(rv_xor(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_xor(hi(rd), hi(rd), hi(rs)), ctx);
		break;
	case BPF_MUL:
		emit(rv_mul(RV_REG_T0, hi(rs), lo(rd)), ctx);
		emit(rv_mul(hi(rd), hi(rd), lo(rs)), ctx);
		emit(rv_mulhu(RV_REG_T1, lo(rd), lo(rs)), ctx);
		emit(rv_add(hi(rd), hi(rd), RV_REG_T0), ctx);
		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_add(hi(rd), hi(rd), RV_REG_T1), ctx);
		break;
	case BPF_LSH:
		emit(rv_addi(RV_REG_T0, lo(rs), -32), ctx);
		emit(rv_blt(RV_REG_T0, RV_REG_ZERO, 8), ctx);
		emit(rv_sll(hi(rd), lo(rd), RV_REG_T0), ctx);
		emit(rv_addi(lo(rd), RV_REG_ZERO, 0), ctx);
		emit(rv_jal(RV_REG_ZERO, 16), ctx);
		emit(rv_addi(RV_REG_T1, RV_REG_ZERO, 31), ctx);
		emit(rv_srli(RV_REG_T0, lo(rd), 1), ctx);
		emit(rv_sub(RV_REG_T1, RV_REG_T1, lo(rs)), ctx);
		emit(rv_srl(RV_REG_T0, RV_REG_T0, RV_REG_T1), ctx);
		emit(rv_sll(hi(rd), hi(rd), lo(rs)), ctx);
		emit(rv_or(hi(rd), RV_REG_T0, hi(rd)), ctx);
		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_RSH:
		emit(rv_addi(RV_REG_T0, lo(rs), -32), ctx);
		emit(rv_blt(RV_REG_T0, RV_REG_ZERO, 8), ctx);
		emit(rv_srl(lo(rd), hi(rd), RV_REG_T0), ctx);
		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
		emit(rv_jal(RV_REG_ZERO, 16), ctx);
		emit(rv_addi(RV_REG_T1, RV_REG_ZERO, 31), ctx);
		emit(rv_slli(RV_REG_T0, hi(rd), 1), ctx);
		emit(rv_sub(RV_REG_T1, RV_REG_T1, lo(rs)), ctx);
		emit(rv_sll(RV_REG_T0, RV_REG_T0, RV_REG_T1), ctx);
		emit(rv_srl(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_or(lo(rd), RV_REG_T0, lo(rd)), ctx);
		emit(rv_srl(hi(rd), hi(rd), lo(rs)), ctx);
		break;
	case BPF_ARSH:
		emit(rv_addi(RV_REG_T0, lo(rs), -32), ctx);
		emit(rv_blt(RV_REG_T0, RV_REG_ZERO, 8), ctx);
		emit(rv_sra(lo(rd), hi(rd), RV_REG_T0), ctx);
		emit(rv_srai(hi(rd), hi(rd), 31), ctx);
		emit(rv_jal(RV_REG_ZERO, 16), ctx);
		emit(rv_addi(RV_REG_T1, RV_REG_ZERO, 31), ctx);
		emit(rv_slli(RV_REG_T0, hi(rd), 1), ctx);
		emit(rv_sub(RV_REG_T1, RV_REG_T1, lo(rs)), ctx);
		emit(rv_sll(RV_REG_T0, RV_REG_T0, RV_REG_T1), ctx);
		emit(rv_srl(lo(rd), lo(rd), lo(rs)), ctx);
		emit(rv_or(lo(rd), RV_REG_T0, lo(rd)), ctx);
		emit(rv_sra(hi(rd), hi(rd), lo(rs)), ctx);
		break;
	case BPF_NEG:
		emit(rv_sub(lo(rd), RV_REG_ZERO, lo(rd)), ctx);
		emit(rv_sltu(RV_REG_T0, RV_REG_ZERO, lo(rd)), ctx);
		emit(rv_sub(hi(rd), RV_REG_ZERO, hi(rd)), ctx);
		emit(rv_sub(hi(rd), hi(rd), RV_REG_T0), ctx);
		break;
	}
EOD
)

(define SWITCH_emit_rv32_alu_r32 #<<EOD
	switch (op) {
	case BPF_MOV:
		emit(rv_addi(lo(rd), lo(rs), 0), ctx);
		break;
	case BPF_ADD:
		emit(rv_add(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_SUB:
		emit(rv_sub(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_AND:
		emit(rv_and(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_OR:
		emit(rv_or(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_XOR:
		emit(rv_xor(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_MUL:
		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_DIV:
		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_MOD:
		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_LSH:
		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_RSH:
		emit(rv_srl(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_ARSH:
		emit(rv_sra(lo(rd), lo(rd), lo(rs)), ctx);
		break;
	case BPF_NEG:
		emit(rv_sub(lo(rd), RV_REG_ZERO, lo(rd)), ctx);
		break;
	}
EOD
)

(define SWITCH_emit_rv32_branch_r32 #<<EOD
	switch (op) {
	case BPF_JEQ:
		emit(rv_bne(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JGT:
		emit(rv_bleu(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JLT:
		emit(rv_bgeu(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JGE:
		emit(rv_bltu(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JLE:
		emit(rv_bgtu(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JNE:
		emit(rv_beq(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JSGT:
		emit(rv_ble(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JSLT:
		emit(rv_bge(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JSGE:
		emit(rv_blt(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JSLE:
		emit(rv_bgt(lo(rs1), lo(rs2), 6), ctx);
		break;
	case BPF_JSET:
		emit(rv_and(RV_REG_T0, lo(rs1), lo(rs2)), ctx);
		emit(rv_beq(RV_REG_T0, RV_REG_ZERO, 6), ctx);
		break;
	}
EOD
)

(define SWITCH_emit_rv32_branch_r64 #<<EOD
	switch (op) {
	case BPF_JEQ:
		emit(rv_bne(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bne(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JGT:
		emit(rv_bgtu(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bltu(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bleu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JLT:
		emit(rv_bltu(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bgtu(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bgeu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JGE:
		emit(rv_bgtu(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bltu(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bltu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JLE:
		emit(rv_bltu(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bgtu(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bgtu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JNE:
		emit(rv_bne(hi(rs1), hi(rs2), JUMP(1)), ctx);
		emit(rv_beq(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JSGT:
		emit(rv_bgt(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_blt(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bleu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JSLT:
		emit(rv_blt(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bgt(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bgeu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JSGE:
		emit(rv_bgt(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_blt(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bltu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JSLE:
		emit(rv_blt(hi(rs1), hi(rs2), JUMP(2)), ctx);
		emit(rv_bgt(hi(rs1), hi(rs2), NO_JUMP(1)), ctx);
		emit(rv_bgtu(lo(rs1), lo(rs2), NO_JUMP(0)), ctx);
		break;
	case BPF_JSET:
		emit(rv_and(RV_REG_T0, hi(rs1), hi(rs2)), ctx);
		emit(rv_bne(RV_REG_T0, RV_REG_ZERO, JUMP(2)), ctx);
		emit(rv_and(RV_REG_T0, lo(rs1), lo(rs2)), ctx);
		emit(rv_beq(RV_REG_T0, RV_REG_ZERO, NO_JUMP(0)), ctx);
		break;
	}
EOD
)

(define BLOCK_emit_rv32_rev16 #<<EOD
	emit(rv_slli(rd, rd, 16), ctx);
	emit(rv_slli(RV_REG_T1, rd, 8), ctx);
	emit(rv_srli(rd, rd, 8), ctx);
	emit(rv_add(RV_REG_T1, rd, RV_REG_T1), ctx);
	emit(rv_srli(rd, RV_REG_T1, 16), ctx);
EOD
)

(define BLOCK_emit_rv32_rev32 #<<EOD
	emit(rv_addi(RV_REG_T1, RV_REG_ZERO, 0), ctx);
	emit(rv_andi(RV_REG_T0, rd, 255), ctx);
	emit(rv_add(RV_REG_T1, RV_REG_T1, RV_REG_T0), ctx);
	emit(rv_slli(RV_REG_T1, RV_REG_T1, 8), ctx);
	emit(rv_srli(rd, rd, 8), ctx);
	emit(rv_andi(RV_REG_T0, rd, 255), ctx);
	emit(rv_add(RV_REG_T1, RV_REG_T1, RV_REG_T0), ctx);
	emit(rv_slli(RV_REG_T1, RV_REG_T1, 8), ctx);
	emit(rv_srli(rd, rd, 8), ctx);
	emit(rv_andi(RV_REG_T0, rd, 255), ctx);
	emit(rv_add(RV_REG_T1, RV_REG_T1, RV_REG_T0), ctx);
	emit(rv_slli(RV_REG_T1, RV_REG_T1, 8), ctx);
	emit(rv_srli(rd, rd, 8), ctx);
	emit(rv_andi(RV_REG_T0, rd, 255), ctx);
	emit(rv_add(RV_REG_T1, RV_REG_T1, RV_REG_T0), ctx);
	emit(rv_addi(rd, RV_REG_T1, 0), ctx);
EOD
)

