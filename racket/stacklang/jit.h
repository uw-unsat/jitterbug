#pragma once

#include <stdint.h>
#include <string.h>

#define INJECT_BUGS		0

#define EMIT(v, n)		emit_code(ctx, v, n)
#define EMIT1(b0)		EMIT(b0, 1)
#define EMIT2(b0, b1)		EMIT((b0) + (b1 << 8), 2)
#define EMIT3(b0, b1, b2)	EMIT((b0) + ((b1) << 8) + ((b2) << 16), 3)

struct jit_context {
	size_t ninsns;
	uint8_t *insns;
	int *addrs;
};

enum {
	POP = 'p',
	SUB = '-',
	SWAP = 's',
	PUSH = 'c',
	JUMP = 'j',
	JEQ = '=',
	JLT = '<',
	STOP = '.',
};

static inline int opcodeof(char *insn)
{
	return insn[0];
}

static inline int immof(char *insn)
{
	return insn[1] - '0';
}

static inline int has_imm(char opcode)
{
	switch (opcode) {
	case PUSH:
	case JUMP:
	case JEQ:
	case JLT:
		return 1;
	default:
		return 0;
	}
}

static inline int inject_bugs(void)
{
	return INJECT_BUGS;
}

static inline void emit_code(struct jit_context *ctx, uint32_t v, size_t len)
{
	memcpy(ctx->insns + ctx->ninsns, &v, len);
	ctx->ninsns += len;
}

void emit_insn(int idx, char *insn, int *addrs, struct jit_context *ctx);
