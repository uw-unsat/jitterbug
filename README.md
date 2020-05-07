# Linux eBPF JIT verification

This repository contains a tool for formally verifying the Linux
kernel BPF JITs that builds on our verification framework [Serval].
We have used this tool to aid the development in the following ways:

- develop the RV32 JIT:
  + [riscv, bpf: Add RV32G eBPF JIT](https://git.kernel.org/linus/5f316b65e99f)

- review the patches that add support for far jumps and branching in RV64:
  + [riscv, bpf: add support for far branching](https://lore.kernel.org/bpf/20191209173136.29615-3-bjorn.topel@gmail.com/T/#u)
  + [riscv, bpf: add support for far jumps and exits](https://lore.kernel.org/bpf/20191209173136.29615-4-bjorn.topel@gmail.com/T/#u)

- find bugs, validate patches, and write test cases:
  + [arm, bpf: Fix bugs with ALU64 {RSH, ARSH} BPF_K shift by 0](https://git.kernel.org/linus/bb9562cf5c67)
  + [arm, bpf: Fix offset overflow for BPF_MEM BPF_DW](https://git.kernel.org/linus/4178417cc535)
  + [bpf, riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh](https://git.kernel.org/linus/1e692f09e091)
  + [bpf, riscv: Fix tail call count off by one in RV32 BPF JIT](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=3f2eaebb5450b417aa119f47c9b805db311ad3b8)
  + [bpf, riscv: Fix stack layout of JITed code on RV32](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=91f658587a962378a410cc7dc90e122a4ccd7cf3)
  + [riscv, bpf: Fix offset range checking for auipc+jalr on RV64](https://git.kernel.org/linus/489553dd13a8)
  + [bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_K shift by 0](https://git.kernel.org/linus/6fa632e719ee)
  + [bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_X shift by 0](https://git.kernel.org/linus/68a8357ec15b)
  + [bpf, x32: Fix bug with JMP32 JSET BPF_X checking upper bits](https://git.kernel.org/linus/80f1f8503635)
  + [bpf, x86_32: Fix incorrect encoding in BPF_LDX zero-extension](https://git.kernel.org/linus/5fa9a98fb103)
  + [bpf, x86_32: Fix clobbering of dst for BPF_JSET](https://git.kernel.org/linus/50fe7ebb6475)
  + [bpf, x86: Fix encoding for lower 8-bit registers in BPF_STX BPF_B](https://git.kernel.org/linus/aee194b14dd2)
  + [bpf, selftests: Add test for BPF_STX BPF_B storing R10](https://git.kernel.org/linus/d2b6c3ab70db)
  + [selftests: bpf: Add test for JMP32 JSET BPF_X with upper bits set](https://git.kernel.org/linus/93e5fbb18cec)
  + [selftests: bpf: add tests for shifts by zero](https://git.kernel.org/linus/ac8786c72eba)

- add optimizations:
  + [bpf, arm: Optimize ALU64 ARSH X using orrpl conditional instruction](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=cf48db69bdfad2930b95fd51d64444e5a7b469ae)
  + [bpf, arm: Optimize ALU ARSH K using asr immediate instruction](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=c648c9c7429e979ca081359f39b6902aed92d490)
  + [bpf, riscv: Enable zext optimization for more RV64G ALU ops](https://git.kernel.org/linus/46dd3d7d287b)
  + [Merge branch 'bpf-rv64-jit'](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=a085a1eeea5ed4ae7aa0c19031449ade145110fc)
    + [bpf, riscv: Enable missing verifier_zext optimizations on RV64](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=0224b2acea0f9e3908d33e27b2dcb4e04686e997)
    + [bpf, riscv: Optimize FROM_LE using verifier_zext on RV64](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=21a099abb765c3754689e1f7ca4536fa560112d0)
    + [bpf, riscv: Optimize BPF_JMP BPF_K when imm == 0 on RV64](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=ca349a6a104e58479defdc08ce56472a48f7cb81)
    + [bpf, riscv: Optimize BPF_JSET BPF_K using andi on RV64](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=073ca6a0369e09c586a103e665f2dd67f1c71444)

## How to install dependencies

- Download and install [Racket] (tested on v7.6 and v7.6-cs).

- Uninstall any previous versions of Serval:

```sh
raco pkg remove serval
```

- Clone the repository and install a good version of Serval with
BPF JIT verification and synthesis:

```sh
git clone --recursive 'https://github.com/uw-unsat/serval-bpf.git'
cd serval-bpf
raco pkg install --auto ./serval
```

## Directory structure

- `arch/` contains the C code of the BPF JITs from the Linux kernel.

- `racket/<arch>/` contains the Racket implementations of the BPF JITs
  that correspond to the C code under `arch/`.
  + `racket/<arch>/spec.rkt` contains the specification for `<arch>`.
  + `racket/<arch>/synthesis.rkt` (if present) contains the synthesis
    infrastructure and sketch for the BPF JIT for `<arch>`.
  + `racket/rv32/bpf_jit_comp32.c.tmpl` is a template used with the
    `racket/rv32/bpf_jit_comp32.rkt` to generate the final C
    implementation.

- `racket/lib/` contains the BPF JIT verification infrastructure.
  + `racket/lib/bpf-common.rkt` contains the BPF JIT correctness
     specification and other common BPF functionality.
  + `racket/lib/riscv-common.rkt` provides features specific
     to the JIT for the RISC-V ISA.
  + `racket/lib/bvaxiom.rkt` axiomatizes bvmul/bvudiv/bvurem.
  + `racket/lib/lemmas.lean` contains the axiomatization of bitvector
     operations in Lean.

- `racket/test/` contains verification and synthesis test cases for
  different classes of instructions.

## Running verification

Run all of the verification test cases in parallel using 8 jobs:

```sh
raco test --jobs 8 racket/test
```

You can also run individual files for a specific class of instructions:

```sh
raco test racket/test/rv64/verify-alu32-x.rkt
```

## Finding bugs via verification

As an example, let's inject a bug fixed in commit [1e692f09e091].
Specifically, remove the zero extension for `BPF_ALU|BPF_ADD|BPF_X`
in `racket/rv64/bpf_jit_comp64.rkt`:

```
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ADD 'BPF_X)
     (emit (if is64 (rv_add rd rd rs) (rv_addw rd rd rs)) ctx)
     (when (! is64)
       (emit_zext_32 rd ctx))]
```

Now we have a buggy JIT implementation:

```
    [(list (or 'BPF_ALU 'BPF_ALU64) 'BPF_ADD 'BPF_X)
     (emit (if is64 (rv_add rd rd rs) (rv_addw rd rd rs)) ctx)]
```

Run the verification:

```sh
raco test racket/test/rv64/verify-alu32-x.rkt
```

Verification will fail with a counterexample:

```
Running test "VERIFY (BPF_ALU BPF_ADD BPF_X)"
--------------------
riscv64-alu32-x tests > VERIFY (BPF_ALU BPF_ADD BPF_X)
FAILURE
name:       check-unsat?
location:   [...]/bpf-common.rkt:218:4
params:
  '((model
   [x?$0 #f]
   [r0$0 (bv #x0000000080000000 64)]
   [r1$0 (bv #x0000000000000000 64)]
   [insn$0 (bv #x00800000 32)]
   [offsets$0 (fv (bitvector 32)~>(bitvector 32))]
   [target-pc-base$0 (bv #x0000000000000000 64)]
   [off$0 (bv #x8000 16)]))
--------------------
```

The counterexample produced by the tool gives BPF register values
that will trigger the bug: it chooses `r0` to be `0x0000000080000000`
and `r1` to be `0x0000000000000000`. This demonstrates the bug
because the RISC-V instructions sign extend the result of the 32-bit
addition, where the BPF instruction performs zero extension.

## Verification

The verification works by proving equivalence between a BPF instruction
and the RISC-V instructions generated by the JIT for that instruction.

As a concrete example, consider verifying the `BPF_ALU|BPF_ADD|BPF_X`
instruction. The verification starts by constructing a _symbolic_ BPF
instruction where the destination and source register fields can
take on any legit value:

```
BPF_ALU32_REG(BPF_ADD, {{rd}}, {{rs}})
```

Next, the verifier symbolically evaluates the JIT on the BPF
instruction, producing a set of possible sequences of symbolic
RISC-V instructions:

```
addw {{rv_reg(rd)}} {{rv_reg(rd)}} {{rv_reg(rs)}}
slli {{rv_reg(rd)}} {{rv_reg(rd)}} 32
srli {{rv_reg(rd)}} {{rv_reg(rd)}} 32
```

Here, `rv_reg` denotes the RISC-V register associated
with a particular BPF register.

Next, the tool proves that every possible sequence of generated
RISC-V instructions has the equivalent behavior as the original BPF
instruction, for all possible choices of registers `rd` and `rs`,
and for all initial values of all RISC-V general-purpose registers.
To do so, it leverages automated verifiers provided by the [Serval]
verification framework, as follows.

The verifier starts with a symbolic BPF state and symbolic RISC-V
state, called `bpf-state` and `riscv-state`, assuming that the two
initial states match, e.g., `riscv-state[rv_reg(reg)] == bpf-state[reg]`
for all `reg`.  Next, it runs the Serval BPF and RISC-V verifiers
on the BPF instruction over `bpf-state` and every possible sequence
of generated RISC-V instructions over `riscv-state`, respectively.
It then proves that the final BPF and RISC-V states still match.

Support for more complex instructions, such as jumps and branches,
requires additional care. For the details, you can see the JIT
correctness definition in `lib/bpf-common.rkt:verify-jit-refinement`.
This complexity comes from having to prove that the generated
instructions preserve a correspondence between the BPF program
counter and the RISC-V program counter.

## Synthesis for the RV32 JIT

To help develop and optimize the RV32 JIT, we used Rosette's program
synthesis feature to synthesize per-instruction compilers for a
subset of BPF instructions.

The synthesis process takes as input the BPF and RISC-V interpreters
from Serval, the BPF JIT correctness specification, and a program
sketch which describes the structure of the code to search for.
Synthesis then exhaustively searches increasingly large candidate
sequences in the search space until it finds one that satisfies the
JIT correctness specification.

You can try this feature out by running the following:

```sh
raco test racket/test/rv32/synthesize-alu64-x.rkt
```

Note that this test will attempt to use the [Boolector] SMT solver
first; if you do not have it installed it will fall back to Rosette's
provided Z3, which may take significantly longer (more than 10x
slower on my laptop).  It will produce output similar to the
following:

```
riscv32-alu64-x synthesis
Running test "SYNTHESIZE (BPF_ALU64 BPF_SUB BPF_X)"
Using solver #<boolector>
Synthesizing for op '(BPF_ALU64 BPF_SUB BPF_X) with size 0
Synthesizing for op '(BPF_ALU64 BPF_SUB BPF_X) with size 1
Synthesizing for op '(BPF_ALU64 BPF_SUB BPF_X) with size 2
Synthesizing for op '(BPF_ALU64 BPF_SUB BPF_X) with size 3
Synthesizing for op '(BPF_ALU64 BPF_SUB BPF_X) with size 4

Solution found for '(BPF_ALU64 BPF_SUB BPF_X):
void emit_op(u8 rd, u8 rs, s32 imm, struct rv_jit_context *ctx) {
    emit(rv_sub(RV_REG_T1, hi(rd), hi(rs)), ctx);
    emit(rv_sltu(RV_REG_T0, lo(rd), lo(rs)), ctx);
    emit(rv_sub(hi(rd), RV_REG_T1, RV_REG_T0), ctx);
    emit(rv_sub(lo(rd), lo(rd), lo(rs)), ctx);
}

cpu time: 3513 real time: 141078 gc time: 324
```

In this example, synthesis was able to find a sequence of four RV32
instructions that correctly emulate the behavior of a `BPF_ALU64
BPF_SUB BPF_X` instruction. This solution is printed out as a C
function `emit_op`.  You can see how this is integrated into the
final JIT in `arch/riscv/net/bpf_jit_comp32.c`, in the `emit_rv32_alu_r64`
function, in the `BPF_SUB` case. Note that the instructions in the
JIT may be different than the solution the solver on your machine
happens to find.

You can play around with synthesizing other instructions by looking
in the other `racket/test/rv32/synthesize-*.rkt` files, and
uncommenting cases for other instructions in those files.

Not every instruction sequence in the final JIT was found using
synthesis.  Many synthesis queries either take extremely long or
do not produce any results: especially those that require very long
instruction sequences (e.g., 64-bit shifts), or those that use
non-linear arithmetic (multiplication, division, etc.) For these
instructions, we manually write an implementation and verify the
correctness using the other techniques described in this guide.

## Generating the RV32 JIT

The RV32 JIT is split in two parts: the Racket implementation in
`racket/rv32/bpf_jit_comp32.rkt` contains the code required for
generating RV32 instruction sequences for a given BPF instruction,
and `racket/rv32/bpf_jit_comp32.c.tmpl` is a template containing
glue C code required to have the JIT interface compile in C and
interface with the rest of the kernel. The template contains holes
that are filled in by extracting the corresponding Racket source
code to C.

One can generate `arch/riscv/net/bpf_jit_comp32.c` with the header
`arch/riscv/net/bpf_jit.h` via:

```sh
make gen
```

These files can be copied to the Linux kernel source tree for
building and testing.

## Caveats / limitations

The test cases under `racket/test/` show which instructions the JIT
is currently verified for. For those instructions, it proves that
the JIT is correct for all possible initial register values, for
all jump offsets, for all immediate values, etc.

The verification proves the JIT correct for individual BPF instructions
at a time.  There are several properties of the JIT that are currently
not specified or verified:

- JIT prologue and epilogue.

- Limited support for call/exit instructions:
  + `BPF_CALL`, `BPF_TAIL_CALL`, and `BPF_EXIT` are supported on riscv32 and riscv64;
  + `BPF_CALL` and `BPF_EXIT` are supported on arm32 and arm64.

The verification makes the following assumptions:

- The `ctx->offset` mapping has been correctly constructed.

- The BPF program has passed the kernel's BPF verifier: e.g., it
  assumes no divide-by-zero or out-of-range shifts.

- The number of BPF instructions is less than 16M and the generated
  RISC-V image is smaller than 128MB.  These bounds can be increased
  but will increase overall verification time for jumps.

- The translation between the verified JIT in Racket and the C code
  is trusted. Any mismatches in this translation can mean there are
  bugs in the C version not present in the verified one.

[Boolector]: https://boolector.github.io
[Racket]: https://racket-lang.org
[Serval]: https://unsat.cs.washington.edu/projects/serval/
[1e692f09e091]: https://git.kernel.org/linus/1e692f09e091
