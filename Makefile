
RACO_JOBS ?= 8
RACO_TEST = raco test --jobs $(RACO_JOBS)

arch/riscv/net/bpf_jit_comp32.c: racket/rv32/bpf_jit_comp32.rkt phony_explicit
	echo "#lang racket/base\n\n(provide (all-defined-out))\n" > racket/rv32/.generated.rkt
	env EMIT=1 racket $< >> racket/rv32/.generated.rkt
	racket racket/rv32/gen.rkt | unexpand > $@

verify-all:
	$(RACO_TEST) -- racket/test

verify-%: phony_explicit
	$(RACO_TEST) -- racket/test/$*

phony_explicit:

.PHONY: verify-all phony_explicit
