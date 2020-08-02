#include "jit.h"

void emit_insn(int idx, char *insn, int *addrs, struct jit_context *ctx)
{
	int base = addrs[idx];
	int opcode = opcodeof(insn);

	switch (opcode) {
	case POP:
		/* mov eax,[edi] */
		EMIT2(0x8B, 0x07);
		/* add edi,4 */
		EMIT3(0x83, 0xC7, 0x04);
		break;
	case SUB:
		/* sub eax,[edi] */
		EMIT2(0x2B, 0x07);
		break;
	case SWAP:
		/* xchg [edi],eax */
		EMIT2(0x87, 0x07);
		break;
	case PUSH:
		/* sub edi,4 */
		EMIT3(0x83, 0xEF, 0x04);
		/* mov [edi],eax */
		EMIT2(0x89, 0x07);
		/* mov eax,imm32 */
		EMIT1(0xB8);
		EMIT(immof(insn), 4);
		break;
	case JUMP:
		/* jmp off32 */
		EMIT1(0xE9);
		EMIT(addrs[immof(insn)] - base - 5, 4);
		break;
	case JEQ:
		/* cmp eax,[edi] */
		EMIT2(0x3B, 0x07);
		/* je off32 */
		EMIT2(0x0F, 0x84);
		if (inject_bugs())
			EMIT(addrs[immof(insn)] - base - 5, 4);
		else
			EMIT(addrs[immof(insn)] - base - 8, 4);
		break;
	case JLT:
		/* cmp eax,[edi] */
		EMIT2(0x3B, 0x07);
		/* jb off32 */
		EMIT2(0x0F, 0x82);
		EMIT(addrs[immof(insn)] - base - 8, 4);
		break;
	case STOP:
		/* jmp edx */
		EMIT2(0xFF, 0xE2);
		break;
	}
}
