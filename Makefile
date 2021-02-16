-include ../scripts/Makefile.lib
-include Makefile.lib

RACO_JOBS ?= 8
RACO_TEST = raco test --jobs $(RACO_JOBS)

SERVAL_PREFIX := $(shell racket -e '(begin (require pkg/lib) (display (path->string (pkg-directory "serval"))))')/
SERVAL_LLVM := racket $(SERVAL_PREFIX)serval/bin/serval-llvm.rkt

VERIFY_DEPS := \
	racket/test/rv64/jit.ll.rkt \
	racket/test/rv64/jit.map.rkt \
	racket/test/rv64/jit.globals.rkt \

CFLAGS += -O2 -g -fno-discard-value-names
CFLAGS += -fno-stack-protector -D_FORTIFY_SOURCE=0
CONFIG_DRAM_START := 0x80000000
LDFLAGS :=

#ifndef TOOLPREFIX
RISCV_TOOLPREFIX      := $(shell \
        if which riscv64-unknown-elf-ld > /dev/null; \
        then echo "riscv64-unknown-elf-"; \
        elif which riscv64-linux-gnu-ld > /dev/null; \
        then echo "riscv64-linux-gnu-"; \
        else \
        echo "error: cannot find binutils for $(ARCH)" 1>&2; exit 1; fi)
#endif

verify-all: $(VERIFY_DEPS)
	$(RACO_TEST) -- racket/test

# Makefile does not let % patterns contain /
# Subst : for / so we can run, e.g.:
#  make verify-rv64:verify-alu64-x.rkt
verify-%: $(VERIFY_DEPS) phony_explicit
	$(RACO_TEST) -- racket/test/$(subst :,/,$*)

%.ll.rkt: %.ll
	$(QUIET_GEN)$(SERVAL_LLVM) < $< > $@~
	$(Q)mv $@~ $@

%.map.rkt: %.map
	$(QUIET_GEN)echo "#lang reader serval/lang/nm" > $@~ && \
		cat $< >> $@~
	$(Q)mv "$@~" "$@"

%.globals.rkt: %.elf
	$(Q)echo "#lang reader serval/lang/dwarf" > $@~
	$(QUIET_GEN)$(RISCV_TOOLPREFIX)objdump --dwarf=info $< >> $@~
	$(Q)mv $@~ $@

%.map: %.elf
	$(QUIET_GEN)$(RISCV_TOOLPREFIX)nm --print-size --numeric-sort "$<" > "$@"

racket/test/rv64/jit.elf: racket/test/rv64/encoding.o arch/riscv/net/bpf_jit_comp64.o
	$(QUIET_LD)$(RISCV_TOOLPREFIX)ld -g -o $@ -e $(CONFIG_DRAM_START) -Ttext $(CONFIG_DRAM_START) \
		$(filter-out --gc-sections,$(LDFLAGS)) $^

racket/test/rv64/jit.ll: racket/test/rv64/encoding.ll arch/riscv/net/bpf_jit_comp64.ll
	$(QUIET_GEN)$(LLVM_PREFIX)llvm-link -S $^ -o $@

gen: \
    arch/riscv/net/bpf_jit_comp32.c \
    arch/riscv/net/bpf_jit.h \
    racket/stacklang/jit.c \

arch/riscv/net/bpf_jit.h: racket/riscv/encoding/bpf_jit.generated.c.rkt
	$(QUIET_GEN)racket racket/riscv/encoding/gen.rkt | unexpand > $@

arch/riscv/net/bpf_jit_comp32.c: racket/riscv/rv32/bpf_jit_comp32.c
	$(Q)mv $< $@

%.c: %.generated.c
	$(QUIET_GEN)sed -e '/ clang-format /d' $< > $@

%.generated.c: %.generated.c.rkt
	$(QUIET_GEN)racket $(@D)/gen.rkt | unexpand | $(LLVM_CLANG_FORMAT) > $@

%.generated.c.rkt: %.rkt racket/lib/extraction/c.rkt phony_explicit
	@echo "#lang racket/base\n\n(provide (all-defined-out))\n" > $@
	$(QUIET_GEN)env EMIT=1 racket $< >> $@

racket/stacklang/jit: racket/stacklang/jit.o racket/stacklang/main.o

LINUX_CFLAGS :=  \
	-nostdinc \
	-isystem $(shell $(LLVM_CONFIG) --prefix)/lib/clang/$(shell $(LLVM_CONFIG) --version)/include \
	-Iarch/riscv/include \
	-Iarch/riscv/include/generated \
	-Iinclude \
	-Iarch/riscv/include/uapi \
	-Iarch/riscv/include/generated/uapi \
	-Iinclude/uapi \
	-Iinclude/generated/uapi \
	-include include/linux/kconfig.h \
	-include include/linux/compiler_types.h \
	-I. \
	-D__KERNEL__ \
	-DKBUILD_MODNAME='"test"' \
	-Qunused-arguments \
	-mno-global-merge \
	-fno-omit-frame-pointer \
	-fno-strict-overflow \
	-fshort-wchar \
	-fno-strict-aliasing \
	-fno-PIE \
	-fno-common \
	-fno-delete-null-pointer-checks \
	-fno-optimize-sibling-calls \
	-fno-stack-check \
	-std=gnu89 --target=riscv64-linux-gnu -mabi=lp64 -march=rv64imac \
	-Wno-gnu \
	-O2 \

LINUX_CFLAGS_EXTRA = $(LINUX_CFLAGS) -fno-PIE -ffunction-sections -fdata-sections -fno-PIC

%.o: %.c arch/riscv/net/bpf_jit.h
	$(QUIET_CC)$(LLVM_CC) $(LINUX_CFLAGS_EXTRA) -mcmodel=medany -g -c $< -o $@

%.ll: %.c arch/riscv/net/bpf_jit.h
	$(QUIET_CC)$(LLVM_CC) $(LINUX_CFLAGS_EXTRA) -S -emit-llvm $< -o $@

phony_explicit:

.PHONY: verify-all gen gen-llvm phony_explicit
