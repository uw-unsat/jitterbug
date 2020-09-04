#!/usr/bin/env python3

# Generate verification performance table

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

import argparse
import pandas
import os


parser = argparse.ArgumentParser()
parser.add_argument("--debug", action="store_true")
parser.add_argument("--file", type=str)
args = parser.parse_args()
debug = args.debug

DATA = args.file

data = pandas.read_csv(DATA, sep="\\s*,\\s*", engine="python")

# Compute min and max rows (with corresponding instruction)
arch = data.groupby("arch", as_index=False)

mins = arch["time(ms)"].min()
maxs = arch["time(ms)"].max()

# Drop instr column for aggregate data and group by architecture
aggregate = data.drop(columns="instr").groupby("arch")
means = aggregate.mean().reset_index()
medians = aggregate.median().reset_index()
stds = aggregate.std().reset_index()


def extract(table, arch):
    t = table[table["arch"] == arch]["time(ms)"].item()
    # Convert ms to s and round to 1
    return str(round(t / 1000.0, 1))


archmap = {
    "x86_64": "\\x64",
    "x86_32": "\\x32",
    "arm64": "\\arm64",
    "arm32": "\\arm32",
    "rv64": "\\riscv64",
    "rv32": "\\riscv32",
}


def makerow(arch):
    if arch is None:
        return "Arch & Min & Max & Mean & Median \\\\"
    min = extract(mins, arch)
    max = extract(maxs, arch)
    mean = extract(means, arch)
    # stddev = extract(stds, arch)
    median = extract(medians, arch)
    return f"{archmap[arch]} & {min} & {max} & {mean} & {median} \\\\"


print("\\begin{tabular}{lrrrrr}")
print("\\toprule")
print(makerow(None))
print("\\midrule")
for arch in ["rv32", "rv64", "arm32", "arm64", "x86_32", "x86_64"]:
    print(makerow(arch))
print("\\bottomrule")
print("\\end{tabular}")
