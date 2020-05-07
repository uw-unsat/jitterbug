#!/usr/bin/env python3

import argparse, subprocess


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--validate", help="use llvm-mc for validation", action="store_true")
    args = parser.parse_args()

    count = 0

    print("#lang racket/base\n\n(provide (all-defined-out))\n\n(define data '(")
    print("  ; (<val> (<n> <immr> <imms>))")

    for esize in [2, 4, 8, 16, 32, 64]:
        n = 1 if esize == 64 else 0
        for i in range(esize - 1):
            val = ('1' * (i+1)).zfill(esize) * (64 // esize)
            for immr in range(esize):
                imms = ((0b1111 << esize.bit_length()) % 64) | i
                print(f"  (#x{int(val, 2):016x} ({n} {immr:2d} {imms:2d}))")
                if args.validate:
                    validate(val, n, immr, imms)
                count = count + 1
                val = val[-1] + val[0:-1]
    print("))")

    # 5,334 unique 64-bit patterns
    assert count == 5334


def validate(val, n, immr, imms):
    def check(sf, val):
        cmd = ["llvm-mc", "--disassemble", "--triple=aarch64"]
        # and x0, x0, imm (use w0 if sf == 0)
        insn = (sf << 31) | (0b00100100 << 23) | (n << 22) | (immr << 16) | (imms << 10)
        input = b" ".join([b"0x%x" % b for b in insn.to_bytes(4, byteorder="little")])
        output = subprocess.run(cmd, stdout=subprocess.PIPE, input=input).stdout
        act = int(output.split()[-1].strip(b'#'), 0)
        exp = int(val, 2)
        assert act == exp
    # 64-bit imm
    check(1, val)
    # 32-bit imm
    if n == 0:
        assert val[0:32] == val[-32:]
        check(0, val[0:32])


if __name__ == "__main__":
    main()
