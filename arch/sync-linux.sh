#!/usr/bin/env bash
set -euo pipefail;

if [[ "$#" -ne 1 ]]; then
  echo "Usage: $0 [path to linux tree]";
  exit 1;
fi

LINUX="$1"

for ARCH in arm arm64 riscv x86; do
  echo "Syncing $ARCH";
  cp "$LINUX"/arch/"$ARCH"/net/*bpf* ./"$ARCH"/net/;
done

# Also copy arm64 insn.c
cp "$LINUX"/arch/arm64/kernel/insn.c ./arm64/kernel/;
