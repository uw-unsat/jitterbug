#include <sys/mman.h>
#include <assert.h>
#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include "jit.h"

#define CODE_SIZE	4096
#define STACK_NR_WORDS	256

static int stack[STACK_NR_WORDS];

static void dump_stack(int *sp)
{
	int *end = stack + STACK_NR_WORDS - 1;

	for (; end > sp; --end)
		printf("  %p: %d\n", end, *end);
}

__attribute__((naked))
static int run(int *sp, void *code)
{
	__asm__(
		"mov 4(%rdi), %eax\n\t"
		"lea return(%rip), %rdx\n\t"
		"jmp *%rsi\n\t"
		"return:\n\t"
		"mov %eax, 4(%rdi)\n\t"
		"ret\n\t"
	);
}

int main(int argc, char **argv)
{
	struct jit_context ctx = { 0 };
	char *prog;
	int cnt, *end, *sp;
	size_t i, n;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s prog args ...\n", argv[0]);
		exit(1);
	}

	prog = argv[1];
	printf("Executing JIT compiler on program:\n  %s\n", prog);

	n = strlen(prog);
	ctx.addrs = calloc(n, sizeof(int));
	if (!ctx.addrs)
		err(1, "calloc");

	ctx.insns = mmap(NULL, CODE_SIZE, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
	if (ctx.insns == MAP_FAILED)
		err(1, "mmap");

	/* initialize addrs */
	ctx.ninsns = 0;
	for (i = 0, cnt = 0; i < n; ++i, ++cnt) {
		assert(ctx.ninsns < CODE_SIZE);
		ctx.addrs[cnt] = ctx.ninsns;
		emit_insn(cnt, &prog[i], ctx.addrs, &ctx);
		if (has_imm(prog[i]))
			++i;
	}

	ctx.ninsns = 0;
	for (i = 0, cnt = 0; i < n; ++i, ++cnt) {
		emit_insn(cnt, &prog[i], ctx.addrs, &ctx);
		if (has_imm(prog[i]))
			++i;
	}

	printf("\nGenerated x86 code:");
	for (i = 0; i < ctx.ninsns; ++i) {
		if (!(i % 8))
			printf("\n ");
		printf(" 0x%02x", ctx.insns[i]);
	}
	printf("\n");

	if (mprotect(ctx.insns, CODE_SIZE, PROT_READ|PROT_EXEC))
		err(1, "mprotect");

	/* initialize stack */
	end = &stack[STACK_NR_WORDS - 1];
	sp = end;
	for (i = 2; i < argc; ++i, --sp)
		*sp = atoi(argv[i]);

	printf("\nInitial state of stack:\n");
	dump_stack(sp);

	run(end - 1, ctx.insns);

	printf("\nFinal state of stack:\n");
	dump_stack(sp);

	printf("\nTop of stack on exit:\n  %d\n", *end);

	/* too lazy to free memory */
	return 0;
}
