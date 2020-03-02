
RACO_JOBS ?= 8
RACO_TEST = raco test --jobs $(RACO_JOBS)

verify-all:
	$(RACO_TEST) -- racket/test

verify-%: phony_explicit
	$(RACO_TEST) -- racket/test/$*

gen: arch/riscv/net/bpf_jit.h arch/riscv/net/bpf_jit_comp32.c

arch/riscv/net/bpf_jit.h: racket/rvenc/bpf_jit.generated.rkt
	racket racket/rvenc/gen.rkt | unexpand > $@

arch/riscv/net/bpf_jit_comp32.c: racket/rv32/bpf_jit_comp32.generated.rkt
	racket racket/rv32/gen.rkt | unexpand > $@

%.generated.rkt: %.rkt racket/lib/emit.rkt phony_explicit
	echo "#lang racket/base\n\n(provide (all-defined-out))\n" > $@
	env EMIT=1 racket $< >> $@

phony_explicit:

.PHONY: gen verify-all phony_explicit
