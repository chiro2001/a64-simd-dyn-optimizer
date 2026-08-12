#!/usr/bin/env python3
"""Differential test: imported MachineIR interpreter vs canonical spec.

Usage:
  python3 kernels/sa8d/test_interp.py <machine-ir.json> [cases]
"""

import json
import random
import sys

from optimizer.ir.interp import run_machine_ir
from kernels.sa8d import spec as specmod


def make_plane(shape, stride, off, values):
    rows = []
    for r in range(shape):
        rows.append(values[r * shape:(r + 1) * shape] + b"\xaa" * (stride - shape))
    return b"\xbb" * off + b"".join(rows)


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    path = sys.argv[1]
    cases = int(sys.argv[2]) if len(sys.argv) > 2 else 2000
    with open(path) as f:
        ir_doc = json.load(f)
    from optimizer.ir.machine_ir import MachineIR
    ir = MachineIR(function=ir_doc["function"], nodes=ir_doc["nodes"])
    rng = random.Random(0x5A8D2026)
    shape = 8
    bad = 0
    for i in range(cases):
        sa = rng.choice((8, 16, 17, 64, 65))
        sb = rng.choice((8, 16, 17, 64, 65))
        oa = rng.choice((0, 1, 3, 7))
        ob = rng.choice((0, 1, 3, 7))
        va = rng.randbytes(shape * shape)
        vb = rng.randbytes(shape * shape)
        pa = make_plane(shape, sa, oa, va)
        pb = make_plane(shape, sb, ob, vb)
        got = run_machine_ir(ir, pa[oa:], pb[ob:], sa, sb)
        want = specmod.sa8d(shape, pa[oa:], pb[ob:], sa, sb)
        if got != want:
            bad += 1
            if bad <= 3:
                print("mismatch", i, sa, sb, oa, ob, got, want)
    print("cases=%d mismatches=%d" % (cases, bad))
    return 0 if bad == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
