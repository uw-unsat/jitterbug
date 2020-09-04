
# Jitterbug OSDI'20 Artifact

This is the artifact for our OSDI'20 paper "Specification and verification in the field: Applying
formal methods to BPF just-in-time compilers in the Linux kernel"
(previously titled "Specification, implementation, and verification of just-in-time compilers for an in-kernel virtual machine").

## Downloads / Setup

This artifact is provided both as a [Docker image](https://hub.docker.com/repository/docker/unsat/jitterbug-osdi20-artifact) as well as a [branch on
our Jitterbug repository on GitHub](https://github.com/uw-unsat/jitterbug/tree/osdi20-artifact). **We highly recommend using the Docker image
as it comes pre-installed with all necessary tools.** The rest of this guide
assumes you are using the Docker image. You will need an internet connection in order
to download and use this artifact.

The experiments in this artifact are designed to run on a machine with at least 4 cores and at
least 16GB of memory. We tested this artifact on a machine with a 4-core Intel(R) Core(TM) i7-7700K
CPU @ 4.20GHz. Running on a machine with fewer than 4 cores / less than 16GB memory will either
not work, or will take significantly longer to finish.

First, install Docker by following the instructions here: <https://docs.docker.com/install/>.
If you are using macOS, [Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/) is
recommended.

Next, pull the Jitterbug artifact Docker image and run it:

```sh
# Download image (several gigabyte download)
$ docker pull unsat/jitterbug-osdi20-artifact:latest

# Run image
$ docker run -it --name jitterbug unsat/jitterbug-osdi20-artifact:latest
```

This will drop you into a shell inside the container, in the `/jitterbug` directory.
The rest of this guide assumes you are running commands from this directory.

If you leave the container and wish to get back, you will need to either delete
the old container or restart it with `docker start -ia jitterbug` (or create a new container
with a different name).

## Artifact overview

This document describes how to find / replicate the main
results described in the Jitterbug paper. The rest of this document
is organized as follows:

- [A description of the directory structure of this artifact.](#directory-structure)

- [Links to our upstreamed patches in the Linux kernel that add the BPF JIT
   compiler for RV32, fix bugs in existing BPF JITs, and optimize existing
   BPF JITs.](#upstreamed-patches-in-linux)

- [A guide on how to run the BPF JIT verification, and how to inject a bug
   to see verification fail.](#running-bpf-jit-verification)

- [A guide on how to check the Lean proofs of the axiomatizations of bitvector
   operations.](#checking-lean-proofs)

- [A guide on how to generate the code size and verification performance table shown in the "Experience" section of the paper.](#generating-the-code-size-and-verification-performance-table)

## Directory structure

This describes the directory structure of Jitterbug, from the
`/jitterbug` directory in the Docker image.

- `arch/` contains the C code of the BPF JITs from the Linux kernel.
  + `arch/riscv/net/bpf_jit_comp32.c` is the C implementation of the RV32
     JIT, which is generated from the DSL implementation.
- `racket/<arch>/` contains the Racket implementations of the BPF JITs
  that correspond to the C code under `arch/`.

  + `racket/<arch>/spec.rkt` contains the specification for `<arch>`.
  + `racket/<arch>/synthesis.rkt` (if present) contains the synthesis
    infrastructure and sketch for the BPF JIT for `<arch>`.
  + `racket/rv32/bpf_jit_comp32.c.tmpl` is a template used with the
    `racket/rv32/bpf_jit_comp32.rkt` to generate the final C
    implementation.

- `racket/stacklang/` contains the verification of the x86-32 JIT for the stack
  language as described in the "Beyond BPF JITs" section of the Jitterbug paper.

- `racket/lib/` contains the BPF JIT verification infrastructure.
  + `racket/lib/bpf-common.rkt` is common functionality for implementing
    BPF JITs in the DSL.
  + `racket/lib/spec/bpf.rkt` contains the BPF JIT correctness specification.
  + `racket/lib/riscv-common.rkt` provides features specific
     to the JIT for the RISC-V ISA.
  + `racket/lib/spec/riscv.rkt` contains shared specification infrastructure
    specific to the RV32 and RV64 JITs.
  + `racket/lib/bvaxiom.rkt` axiomatizes bvmul/bvudiv/bvurem.
  + `racket/lib/hybrid-memory.rkt` contains the model of memory used for BPF JIT verification.

- `racket/test/` contains verification and synthesis test cases for
  different classes of instructions.

- `lean/src/` contains Lean specifications and proofs for the bitvector axiomatizations
   and end-to-end correctness of the BPF JITs.
  + `lean/src/bvaxioms.lean` is the proof of the axiomatization of bitvector operations.

## Upstreamed patches in Linux

The main result of Jitterbug is the set of patches upstreamed in Linux
that add a verified BPF JIT compiler for RV32, fix bugs in existing BPF JITs,
and optimize existing BPF JITs. Below is a list of links to our patches
in Linus' tree.

- RV32 JIT development
  + [riscv, bpf: Add RV32G eBPF JIT]
  + [riscv, bpf: Factor common RISC-V JIT code]

- Finding bugs in existing BPF JITs / writing new BPF test cases
  + [arm, bpf: Fix bugs with ALU64 {RSH, ARSH} BPF_K shift by 0]
  + [arm, bpf: Fix offset overflow for BPF_MEM BPF_DW]
  + [arm64: insn: Fix two bugs in encoding 32-bit logical immediates]
  + [bpf, riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh]
  + [bpf, riscv: Fix tail call count off by one in RV32 BPF JIT]
  + [bpf, riscv: Fix stack layout of JITed code on RV32]
  + [riscv, bpf: Fix offset range checking for auipc+jalr on RV64]
  + [bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_K shift by 0]
  + [bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_X shift by 0]
  + [bpf, x32: Fix bug with JMP32 JSET BPF_X checking upper bits]
  + [bpf, x86_32: Fix incorrect encoding in BPF_LDX zero-extension]
  + [bpf, x86_32: Fix clobbering of dst for BPF_JSET]
  + [bpf, x86: Fix encoding for lower 8-bit registers in BPF_STX BPF_B]
  + [bpf, selftests: Add test for BPF_STX BPF_B storing R10]
  + [selftests: bpf: Add test for JMP32 JSET BPF_X with upper bits set]
  + [selftests: bpf: add tests for shifts by zero]

- Optimization of existing BPF JITs
  + [bpf, arm: Optimize ALU64 ARSH X using orrpl conditional instruction]
  + [bpf, arm: Optimize ALU ARSH K using asr immediate instruction]
  + [bpf, arm64: Optimize AND,OR,XOR,JSET BPF_K using arm64 logical immediates]
  + [bpf, arm64: Optimize ADD,SUB,JMP BPF_K using arm64 add/sub immediates]
  + [bpf, riscv: Enable zext optimization for more RV64G ALU ops]
  + [Merge branch 'bpf-rv64-jit']
    + [bpf, riscv: Enable missing verifier_zext optimizations on RV64]
    + [bpf, riscv: Optimize FROM_LE using verifier_zext on RV64]
    + [bpf, riscv: Optimize BPF_JMP BPF_K when imm == 0 on RV64]
    + [bpf, riscv: Optimize BPF_JSET BPF_K using andi on RV64]

- Adding RVC support to the RV64 JIT
  + [bpf, riscv: Modify JIT ctx to support compressed instructions]
  + [bpf, riscv: Add encodings for compressed instructions]
  + [bpf, riscv: Use compressed instructions in the rv64 JIT]

### Mailing list discussions

You can find further links to discussions on the RV32 BPF JIT here:

- [\[PATCH bpf-next v5 0/4\] eBPF JIT for RV32G](https://lkml.org/lkml/2020/3/5/1)
- [\[PATCH bpf-next v4 0/4\] eBPF JIT for RV32G](https://lkml.org/lkml/2020/3/2/1266)
- [\[PATCH v3 bpf-next\] RV32G eBPF JIT](https://lkml.org/lkml/2020/2/19/1360)
- [\[PATCH v2 bpf-next\] RV32G eBPF JIT](https://www.lkml.org/lkml/2019/6/26/1051)
- [\[RFC PATCH bpf-next\] RV32G eBPF JIT](https://lkml.org/lkml/2019/6/21/894)

The following are links to mailing list discussions for patches we reviewed using Jitterbug:

- [riscv, bpf: add support for far branching](https://lore.kernel.org/bpf/20191209173136.29615-3-bjorn.topel@gmail.com/T/#u)
- [riscv, bpf: add support for far jumps and exits](https://lore.kernel.org/bpf/20191209173136.29615-4-bjorn.topel@gmail.com/T/#u)

## Running BPF JIT verification

To run all of Jitterbug's verification, run (from the `/jitterbug` directory):

```sh
$ make verify-all
```

This will build all necessary dependencies and run verification for all instructions
for all architectures. On our test machine this takes approximately 2.5 hours. You'll know it has succeeded
when it terminates with something similar to the following (the exact order
may vary between runs):

```
[       OK ] "VERIFY (BPF_JMP32 BPF_JLE BPF_K)" (523157 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JNE BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JNE BPF_K)" (81620 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JSGT BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JSGT BPF_K)" (52390 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JSLT BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JSLT BPF_K)" (201406 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JSGE BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JSGE BPF_K)" (181063 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JSLE BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JSLE BPF_K)" (197293 ms)
[ RUN      ] "VERIFY (BPF_JMP32 BPF_JSET BPF_K)"
[       OK ] "VERIFY (BPF_JMP32 BPF_JSET BPF_K)" (396743 ms)
11 success(es) 0 failure(s) 0 error(s) 11 test(s) run
cpu time: 4637 real time: 4013849 gc time: 209
0
[       OK ] "VERIFY (BPF_LD BPF_IMM BPF_DW)" (7004514 ms)
1 success(es) 0 failure(s) 0 error(s) 1 test(s) run
cpu time: 173152 real time: 7004522 gc time: 3008
0
929 tests passed
```

To run verification for only a single architecture, you can use `make verify-<arch>`,
for example, `make verify-rv32`. This is a subset of what `make verify-all` does, but will finish faster (~ 1 hour for one architecture).
The following values for `<arch>` are allowed:
`rv32`, `rv64`, `arm32`, `arm64`, `x86_32`, and `x86_64`.

### Injecting a bug

Next, let's inject a bug into the RV64 JIT and see that Jitterbug is able to catch it.
The bug we will inject is similar to a real bug we found using Jitterbug and fixed
in the Linux kernel patch "[bpf, riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh]".
Specifically, we will remove the instructions for performing zero-extension
from the RV64 JIT for the `BPF_ALU|BPF_SUB|BPF_X` instruction.

First, navigate (e.g., using vim) to `racket/rv64/bpf_jit_comp64.rkt` line 299:

```racket
[((BPF_ALU BPF_SUB BPF_X)
  (BPF_ALU64 BPF_SUB BPF_X))

  (if is64
    (emit_sub rd rd rs ctx)
    (emit_subw rd rd rs ctx))

  (PATCH (when (&& (! is64) (! (->prog->aux->verifier_zext ctx)))
    (emit_zext_32 rd ctx)))]
```

Next, inject the bug by modifying the code to be the following:

```racket
[((BPF_ALU BPF_SUB BPF_X)
  (BPF_ALU64 BPF_SUB BPF_X))

  (if is64
    (emit_sub rd rd rs ctx)
    (emit_subw rd rd rs ctx))]
```

This code is buggy because the BPF semantics specify that 32-bit ALU instructions
zero-extend their results, but RISC-V `subw` performs sign-extension. By deleting
the lines from the JIT that emit extra code to perform zero-extension, we have
caused the semantics of the BPF instruction and of the code produced by the JIT to differ.

Next, run Jitterbug to attempt to verify the JIT:

```sh
# (~ 2 minutes)
$ raco test racket/test/rv64/verify-alu32-x.rkt
```

When verification reaches the `BPF_ALU|BPF_SUB|BPF_X` case, it will fail with the
following error (truncated for space):

```
[ RUN      ] "VERIFY (BPF_ALU BPF_SUB BPF_X)"
Verifying assert 1 / 42:
Verifying assert 2 / 42:
Verifying assert 3 / 42:
Verifying assert 4 / 42:
<unknown>: <unknown>: bpf-jit-specification: Final registers must match
--------------------
riscv64-alu32-x tests > VERIFY (BPF_ALU BPF_SUB BPF_X)
FAILURE
bpf-insn:
  #(struct:insn (BPF_ALU BPF_SUB BPF_X) ax r10 (bv #x0000 16) (bv #x00000000 32))
bpf-regs:
  #(struct:regs (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff7fffffff 64) (bv #xffffffff7ffffffe 64))
bpf-pc:          (bv #x0000000000000000 64)
final-bpf-regs:
  #(struct:regs (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff00000000 64) (bv #xffffffff7fffffff 64) (bv #x00000000ffffffff 64))
final-bpf-pc:    (bv #x0000000000000001 64)
name:            check-unsat?
location:        /Users/lukenels/repo/jitterbug/racket/lib/spec/bpf.rkt:70:15
```

This indicates that verification has failed because Jitterbug could not prove
the resulting BPF registers match the corresponding RISC-V registers after
execution. Developers can use the concrete BPF instruction and initial state
from the counterexample to help diagnose the bug, and write new Linux BPF selftest
cases to prevent this bug in the future.
As an example, see our patch "[selftests: bpf: add tests for shifts by zero]" which adds new selftest
cases for bugs we found and fixed in "[bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_X shift by 0]".

Make sure to undo your changes or start a fresh copy of the container before moving to other
parts of this guide.

### Generating the RV32 JIT

The RV32 JIT is split into two parts: the DSL implementation in
`racket/rv32/bpf_jit_comp32.rkt` contains the code required for
generating RV32 instruction sequences for a given BPF instruction,
and `racket/rv32/bpf_jit_comp32.c.tmpl` is a template containing
glue C code required to have the JIT interface compile in C and
interface with the rest of the kernel. The template contains holes
that are filled in by extracting the corresponding Racket source
code to C.

One can generate `arch/riscv/net/bpf_jit_comp32.c` and the header
`arch/riscv/net/bpf_jit.h` via:

```sh
# (< 10 seconds)
$ make gen
```

These files can be copied to the Linux kernel source tree for
building and testing.

## Checking Lean proofs

The section "Proving JIT correctness" from the paper describes the axiomatization
of expensive non-linear SMT operations Jitterbug uses to scale verification. We prove that
these axiomatizations are correct separately using the
[Lean theorem prover](https://leanprover.github.io/).
This section describes how to check the axiomatization proofs.

First, run the following commands to configure and build our Lean package containing the
statements and proofs of the theorems.

```sh
# Move to directory containing the Lean package.
$ cd /jitterbug/lean

# Configure and build the Lean package. This requires an internet connection
# to download the Lean "mathlib" library (~ 2 minutes).
$ leanpkg build
```

This requires an internet connection and will take around 2 minutes total.
When it succeeds, you will see output similar to the following:

```
configuring jitterbug 0.1
mathlib: cloning https://github.com/leanprover-community/mathlib to _target/deps/mathlib
> git clone https://github.com/leanprover-community/mathlib _target/deps/mathlib
Cloning into '_target/deps/mathlib'...
remote: Enumerating objects: 204, done.
remote: Counting objects: 100% (204/204), done.
remote: Compressing objects: 100% (152/152), done.
remote: Total 74666 (delta 117), reused 90 (delta 51), pack-reused 74462
Receiving objects: 100% (74666/74666), 31.99 MiB | 10.80 MiB/s, done.
Resolving deltas: 100% (57991/57991), done.
> git checkout --detach 17c4651c593391462d55f7f990dc05e54ec8ee39    # in directory _target/deps/mathlib
HEAD is now at 17c4651c5 feat(algebraic_geometry): structure sheaf on Spec R (#3907)
> lean --make src
[many lines of output]
```

This means that the proofs have been checked and accepted by Lean. You can visually
inspect the theorem statements and proofs in `/jitterbug/lean/src/bvaxioms.lean`.
(Note that vim has a hard time rendering Unicode characters in the container,
so it may be easier to read on the web [here](https://github.com/uw-unsat/jitterbug/blob/osdi20-artifact/lean/src/bvaxioms.lean)).

The theorems in this file correspond to the axioms described in the paper.
For instance, this theorem corresponds to the "decomposition of `mul`" axiom in the paper:

```lean
theorem mul_decomp {n : ℕ} (x y : bv (n + n)) :
  let x₁ : bv n := x.drop n,
      x₀ : bv n := x.take n,
      y₁ : bv n := y.drop n,
      y₀ : bv n := y.take n in
    x * y = concat (mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀) (x₀ * y₀)
```

Last, make sure to switch back to the `/jitterbug` directory before moving to any
other part of this guide:

```
$ cd /jitterbug
```

## Generating the code size and verification performance table

This part of the guide shows how to generate the table depicting code size
and verification performance from the "Experience" section of the paper.

### Code size

This shows how to produce the code size data reported
in the "Experience" section of the paper. Note that
the results shown by the script differ from
those shown in the submission version of the paper; these differences
are caused by changes in the BPF JITs in Linux since submission. The final
version of the paper will reflect the updated data.

To generate the data, first run the following:

```sh
# (< 1 second)
$ ./scripts/loc.py
```

This will produce the following output:

```
### Generic components
Jitterbug library = 1,721 loc
BPF interpreter = 471 loc

### Code size table
\begin{tabular}{lrrrr}
\toprule
JIT impl. (C) & JIT impl. (DSL) & Spec. & Interp. \\
\midrule
riscv32 & 1,964 & 1,421 & 328 & 1,477 \\
riscv64 & 1,862 & 1,169 & 221 & " \\
arm32 & 1,620 & 777 & 117 & 1,236 \\
arm64 & 968 & 610 & 88 & 1,062 \\
x86-32 & 1,683 & 1,021 & 129 & 2,280 \\
x86-64 & 1,382 & 599 & 114 & " \\
\bottomrule
\end{tabular}
```

The results are broken down into two categories.
First is the code size for generic components, the Jitterbug
library and the BPF interpreter.

Next is the data for the table for lines of code,
which shows the sizes of various components broken down
by architecture.

### Verification performance

The verification performance table is generated in two steps. The first step is to run
verification single-threaded for each instruction and measure the performance of each.
This process will take a very long time (several hours on our test machine)
since it does not use any parallelism. Alternatively, you can skip this
step and use the pre-generated `verif-perf.csv` found in `/jitterbug`.

```sh
# Generate verif-perf.csv
$ ./scripts/verif-perf.py verif-perf.csv
```

This will print out the verification time for each instruction and save the results
to the file `verif-perf.csv`.
You'll know it's succeeded when it terminates ending with the following output:

```
[many lines of output]
rv64, BPF_JMP32 BPF_JEQ BPF_K, 353162
rv64, BPF_JMP32 BPF_JGT BPF_K, 288667
rv64, BPF_JMP32 BPF_JLT BPF_K, 273163
rv64, BPF_JMP32 BPF_JGE BPF_K, 364703
rv64, BPF_JMP32 BPF_JLE BPF_K, 369152
rv64, BPF_JMP32 BPF_JNE BPF_K, 80625
rv64, BPF_JMP32 BPF_JSGT BPF_K, 51678
rv64, BPF_JMP32 BPF_JSLT BPF_K, 201366
rv64, BPF_JMP32 BPF_JSGE BPF_K, 183544
rv64, BPF_JMP32 BPF_JSLE BPF_K, 196085
rv64, BPF_JMP32 BPF_JSET BPF_K, 396354
rv64, BPF_LD BPF_IMM BPF_DW, 5943538
```

Next, run a post-processing script to format the data into the table.

```sh
# Print out the performance table given raw data (< 1 second)
$ ./scripts/gen-perf-table.py --file verif-perf.csv
```

If you use the pre-generated `verif-perf.csv`, this will print the following:

```tex
\begin{tabular}{lrrrrr}
\toprule
Arch & Min & Max & Mean & Median \\
\midrule
\riscv32 & 4.1 & 1470.7 & 82.4 & 40.4 \\
\riscv64 & 1.2 & 5943.5 & 102.0 & 11.0 \\
\arm32 & 3.0 & 93.5 & 23.8 & 20.0 \\
\arm64 & 0.6 & 46.4 & 10.0 & 6.2 \\
\x32 & 4.8 & 189.9 & 34.4 & 30.5 \\
\x64 & 1.1 & 42.1 & 12.6 & 12.0 \\
\bottomrule
\end{tabular}
```

Note that if you generated `verif-perf.csv` yourself, your results may vary based
on machine configuration, load, etc. These results differ from those in the paper due
to changes in the BPF JITs in Linux since submission; the final version of the paper will reflect these
updated results.

[riscv, bpf: Add RV32G eBPF JIT]: https://git.kernel.org/linus/5f316b65e99f
[riscv, bpf: Factor common RISC-V JIT code]: https://git.kernel.org/linus/ca6cb5447ceca6a87d6b62c9e5d41042c34f7ffa
[arm, bpf: Fix bugs with ALU64 {RSH, ARSH} BPF_K shift by 0]: https://git.kernel.org/linus/bb9562cf5c67
[arm, bpf: Fix offset overflow for BPF_MEM BPF_DW]: https://git.kernel.org/linus/4178417cc535
[arm64: insn: Fix two bugs in encoding 32-bit logical immediates]: https://git.kernel.org/linus/579d1b3faa3735e781ff74aac0afd598515dbc63
[bpf, riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh]: https://git.kernel.org/linus/1e692f09e091
[bpf, riscv: Fix tail call count off by one in RV32 BPF JIT]: https://git.kernel.org/linus/745abfaa9eafa597d31fdf24a3249e5206a98768
[bpf, riscv: Fix stack layout of JITed code on RV32]: https://git.kernel.org/linus/91f658587a962378a410cc7dc90e122a4ccd7cf3
[riscv, bpf: Fix offset range checking for auipc+jalr on RV64]: https://git.kernel.org/linus/489553dd13a8
[bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_K shift by 0]: https://git.kernel.org/linus/6fa632e719ee
[bpf, x32: Fix bug with ALU64 {LSH, RSH, ARSH} BPF_X shift by 0]: https://git.kernel.org/linus/68a8357ec15b
[bpf, x32: Fix bug with JMP32 JSET BPF_X checking upper bits]: https://git.kernel.org/linus/80f1f8503635
[bpf, x86_32: Fix incorrect encoding in BPF_LDX zero-extension]: https://git.kernel.org/linus/5fa9a98fb103
[bpf, x86_32: Fix clobbering of dst for BPF_JSET]: https://git.kernel.org/linus/50fe7ebb6475
[bpf, x86: Fix encoding for lower 8-bit registers in BPF_STX BPF_B]: https://git.kernel.org/linus/aee194b14dd2
[bpf, selftests: Add test for BPF_STX BPF_B storing R10]: https://git.kernel.org/linus/d2b6c3ab70db
[selftests: bpf: Add test for JMP32 JSET BPF_X with upper bits set]: https://git.kernel.org/linus/93e5fbb18cec
[selftests: bpf: add tests for shifts by zero]: https://git.kernel.org/linus/ac8786c72eba
[bpf, arm: Optimize ALU64 ARSH X using orrpl conditional instruction]: https://git.kernel.org/linus/cf48db69bdfad2930b95fd51d64444e5a7b469ae
[bpf, arm: Optimize ALU ARSH K using asr immediate instruction]: https://git.kernel.org/linus/c648c9c7429e979ca081359f39b6902aed92d490
[bpf, arm64: Optimize AND,OR,XOR,JSET BPF_K using arm64 logical immediates]: https://git.kernel.org/linus/fd49591cb49b72abd1b665222a635ccb17df7923
[bpf, arm64: Optimize ADD,SUB,JMP BPF_K using arm64 add/sub immediates]: https://git.kernel.org/linus/fd868f14818901821699988fdac680ebd80cd360
[bpf, riscv: Enable zext optimization for more RV64G ALU ops]: https://git.kernel.org/linus/46dd3d7d287b
[Merge branch 'bpf-rv64-jit']: https://git.kernel.org/linus/a085a1eeea5ed4ae7aa0c19031449ade145110fc
[bpf, riscv: Enable missing verifier_zext optimizations on RV64]: https://git.kernel.org/linus/0224b2acea0f9e3908d33e27b2dcb4e04686e997
[bpf, riscv: Optimize FROM_LE using verifier_zext on RV64]: https://git.kernel.org/linus/21a099abb765c3754689e1f7ca4536fa560112d0
[bpf, riscv: Optimize BPF_JMP BPF_K when imm == 0 on RV64]: https://git.kernel.org/linus/ca349a6a104e58479defdc08ce56472a48f7cb81
[bpf, riscv: Optimize BPF_JSET BPF_K using andi on RV64]: https://git.kernel.org/linus/073ca6a0369e09c586a103e665f2dd67f1c71444
[bpf, riscv: Modify JIT ctx to support compressed instructions]: https://git.kernel.org/linus/bfabff3cb0fef366086c64f24be8ab316a355b99
[bpf, riscv: Add encodings for compressed instructions]: https://git.kernel.org/linus/804ec72c68c8477b8713a1e8f8eda120d3471031
[bpf, riscv: Use compressed instructions in the rv64 JIT]: https://git.kernel.org/linus/18a4d8c97b841632920c16a6fa9216d1214f3db7
