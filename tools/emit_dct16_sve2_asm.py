#!/usr/bin/env python3
"""Assembly-kernel path for the tool-generated SVE2 DCT16 candidate.

Motivation (user 2026-08-13): the kernel -> optimize -> kernel -> evaluate
loop should not need the intermediate C/C++ ACLE layer for every candidate.
This module bootstraps the generated C++ intrinsic source ONCE into a
self-contained GNU asm file (`.S`) via `g++ -S`; from then on, building and
evaluating a candidate is pure `as` + link, with no ACLE compilation in the
loop. Later optimization passes can then edit/emit the `.S` directly.

Usage:
  python3 tools/emit_dct16_sve2_asm.py --bootstrap [out.S]
  python3 tools/emit_dct16_sve2_asm.py --assemble in.S out.o
"""

import argparse
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from emit_dct16_sve2_shared import emit  # noqa: E402

CC = "aarch64-linux-gnu-g++"
AS = "aarch64-linux-gnu-as"
LD = "aarch64-linux-gnu-gcc"
MARCH = "armv8.2-a+sve2"


def bootstrap_cpp(cpp_path, out_s):
    """One-time ACLE -> GNU asm bootstrap (the only ACLE step in the path)."""
    subprocess.run(
        [CC, "-O2", "-std=c++11", "-march=" + MARCH, "-S", cpp_path,
         "-o", out_s],
        check=True)
    return out_s


def assemble(s_path, o_path):
    subprocess.run([AS, "-march=" + MARCH, "-o", o_path, s_path], check=True)
    return o_path


def link(o_path, driver_o, exe_path):
    subprocess.run([LD, "-no-pie", "-static", "-o", exe_path,
                    o_path, driver_o], check=True)
    return exe_path


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bootstrap", action="store_true")
    ap.add_argument("--assemble", nargs=2, metavar=("IN.S", "OUT.O"))
    ap.add_argument("--cpp", default=os.path.join(
        ROOT, "kernels/dct16/candidates/sve2_shared.cpp"))
    ap.add_argument("--out-s", default=os.path.join(
        ROOT, "kernels/dct16/candidates/sve2_shared.S"))
    args = ap.parse_args()

    if args.bootstrap:
        # regenerate the C++ from the emitter, then lower once to asm
        with open(args.cpp, "w") as f:
            f.write(emit(pass2_layout="odd-quarter"))
        bootstrap_cpp(args.cpp, args.out_s)
        print("bootstrapped %s -> %s" % (args.cpp, args.out_s))
        return 0
    if args.assemble:
        assemble(*args.assemble)
        print("assembled %s -> %s" % tuple(args.assemble))
        return 0
    ap.print_help()
    return 2


if __name__ == "__main__":
    sys.exit(main())
