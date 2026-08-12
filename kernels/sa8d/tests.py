#!/usr/bin/env python3
"""SA8D M1 differential gate: SpecIR interpreter vs x265 oracle.

Usage:
  python3 kernels/sa8d/tests.py <oracle> <outdir> [--quick]

Writes to <outdir>/:
  spec.json / spec.sha256     canonical SpecIR doc + hash
  corpus-<shape>.bin          batch input for oracle
  oracle-<shape>.txt          oracle output
  summary.json                per-shape pass/fail and case counts
"""

import hashlib
import json
import os
import random
import struct
import subprocess
import sys
import time

from optimizer.ir.spec_ir import canonical_hash, make_sa8d_spec
from kernels.sa8d import spec as specmod


def make_plane(shape, stride, off, values):
    """values: bytes of shape*shape (row-major). Returns plane bytes."""
    rows = []
    pad = b"\xaa" * (stride - shape)
    for r in range(shape):
        rows.append(values[r * shape:(r + 1) * shape] + pad)
    return b"\xbb" * off + b"".join(rows)


def fixed_cases(shape):
    n = shape * shape
    all0 = bytes(n)
    all255 = b"\xff" * n
    rnd = bytes((i * 37 + 11) & 0xFF for i in range(n))
    rnd2 = bytes((i * 53 + 7) & 0xFF for i in range(n))
    check_a = bytes(((i // shape + i % shape) & 1) * 255 for i in range(n))
    check_b = bytes((((i // shape + i % shape) & 1) ^ 1) * 255 for i in range(n))
    hstrip_a = bytes(((i // shape) & 1) * 255 for i in range(n))
    hstrip_b = bytes((((i // shape) & 1) ^ 1) * 255 for i in range(n))
    vstrip_a = bytes(((i % shape) & 1) * 255 for i in range(n))
    vstrip_b = bytes((((i % shape) & 1) ^ 1) * 255 for i in range(n))
    ramp = bytes(i & 0xFF for i in range(n))
    cases = [
        ("all-zero", all0, all0),
        ("all-max", all255, all255),
        ("a==b-random", rnd, rnd),
        ("a-zero-b-max", all0, all255),
        ("a-max-b-zero", all255, all0),
        ("checker", check_a, check_b),
        ("hstrip", hstrip_a, hstrip_b),
        ("vstrip", vstrip_a, vstrip_b),
        ("ramp", ramp, rnd2),
    ]
    for pos in range(n):
        for delta in (1, 255):
            imp_a = bytearray(all0)
            imp_b = bytearray(all0)
            imp_a[pos] = delta
            cases.append(("impulse-%d-%d" % (pos, delta), bytes(imp_a), bytes(imp_b)))
    for bit in range(8):
        v = 1 << bit
        pat = bytes(v for _ in range(n))
        cases.append(("bit-%d" % bit, pat, all0))
        cases.append(("bit-%d-max" % bit, pat, all255))
    return cases


def build_corpus(shape, random_cases, seed):
    cases = []
    for name, a, b in fixed_cases(shape):
        cases.append((name, a, b, shape, shape, 0, 0))
    rng = random.Random(seed)
    valid_strides = {
        8: (8, 16, 17, 64, 65),
        16: (16, 17, 32, 64, 65),
        32: (32, 33, 64, 65, 80),
        64: (64, 65, 80, 96, 128),
    }
    strides = valid_strides[shape]
    offsets = [0, 1, 3, 7, 15]
    for i in range(random_cases):
        a = rng.randbytes(shape * shape)
        b = rng.randbytes(shape * shape)
        cases.append(("random-%d" % i, a, b,
                      rng.choice(strides), rng.choice(strides),
                      rng.choice(offsets), rng.choice(offsets)))
    return cases


def run_batch(oracle, shape, cases, outdir):
    path = os.path.join(outdir, "corpus-%d.bin" % shape)
    records = []
    with open(path, "wb") as f:
        f.write(struct.pack("<I", len(cases)))
        for name, a, b, sa, sb, oa, ob in cases:
            pa = make_plane(shape, sa, oa, a)
            pb = make_plane(shape, sb, ob, b)
            records.append((pa[oa:], pb[ob:], sa, sb))
            f.write(struct.pack("<qqii", sa, sb, oa, ob))
            f.write(pa)
            f.write(pb)
    t0 = time.time()
    out = subprocess.run(
        [oracle, "batch", str(shape), path],
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    dt = time.time() - t0
    lines = out.stdout.decode().strip().splitlines()
    with open(os.path.join(outdir, "oracle-%d.txt" % shape), "wb") as f:
        f.write(out.stdout)
    triplets = []
    for line in lines:
        parts = line.split()
        if len(parts) != 3:
            raise RuntimeError("unexpected oracle line: %r" % line)
        triplets.append(tuple(int(x) for x in parts))
    return triplets, records, dt


def python_results(shape, records):
    res = []
    for pa, pb, sa, sb in records:
        res.append(specmod.sa8d(shape, pa, pb, sa, sb))
    return res


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    oracle = sys.argv[1]
    outdir = sys.argv[2]
    quick = "--quick" in sys.argv[3:]
    os.makedirs(outdir, exist_ok=True)

    counts = {8: 1000000, 16: 1000000, 32: 200000, 64: 100000}
    if quick:
        counts = {8: 20000, 16: 20000, 32: 5000, 64: 2000}

    summary = {}
    all_ok = True
    cross_check = 1000
    for shape in (8, 16, 32, 64):
        doc = make_sa8d_spec(shape)
        cases = build_corpus(shape, counts[shape], seed=0x5A8D0000 + shape)
        oracle_res, records, dt = run_batch(oracle, shape, cases, outdir)
        n = len(cases)
        cc = min(cross_check, n)
        py_res = python_results(shape, records[:cc])
        mism = [i for i in range(cc)
                if py_res[i] != oracle_res[i][1]]  # canon column
        ok = (len(mism) == 0 and n == len(oracle_res)
              and all(t[0] == t[1] == t[2] for t in oracle_res))
        summary[shape] = {
            "cases": n,
            "fixed": len(fixed_cases(shape)),
            "random": counts[shape],
            "oracle_seconds": round(dt, 3),
            "cross_checked_python": cc,
            "cross_check_mismatches": len(mism),
            "ok": ok,
            "first_mismatch": mism[:5] if mism else None,
        }
        all_ok = all_ok and ok
        print("shape=%d cases=%d cross=%d ok=%s oracle_time=%.2fs"
              % (shape, n, cc, ok, dt))

    for shape in (8, 16, 32, 64):
        proc = subprocess.run([oracle, "guard", str(shape)],
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        summary[shape]["guard"] = {"exit": proc.returncode,
                                   "out": proc.stdout.decode().strip()}
        all_ok = all_ok and proc.returncode == 0
        print("shape=%d guard exit=%d" % (shape, proc.returncode))

    spec_doc = {"sa8d": [make_sa8d_spec(s) for s in (8, 16, 32, 64)],
                "interpreter": "kernels/sa8d/spec.py"}
    with open(os.path.join(outdir, "spec.json"), "w") as f:
        json.dump(spec_doc, f, indent=2, sort_keys=True)
    with open(os.path.join(outdir, "spec.sha256"), "w") as f:
        f.write(canonical_hash(spec_doc) + "\n")
    with open(os.path.join(outdir, "summary.json"), "w") as f:
        json.dump(summary, f, indent=2, sort_keys=True)
    print("summary: %s" % ("ALL OK" if all_ok else "FAILURES PRESENT"))
    return 0 if all_ok else 1


if __name__ == "__main__":
    sys.exit(main())
