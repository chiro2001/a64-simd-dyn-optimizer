#!/usr/bin/env python3
"""Range proofs for 8-bit SA8D canonical spec, using Z3 where feasible.

Proves, for all valid 8-bit inputs:
  1. row Hadamard outputs H in [-2040, 2040]
  2. 2D coefficients T in [-16320, 16320]
  3. lane |T| < 32768, so s16 abs never touches INT16_MIN
  4. R8 = sum(abs(T)) <= 1044480 and 16x16 raw sum <= 4*R8 (derived)

Outputs experiments/m1-contract/range-report.json.
"""

import json
import os
import sys

try:
    import z3
except ImportError:
    print("z3-solver is required: pip install z3-solver", file=sys.stderr)
    sys.exit(2)


def w8(k, j):
    return 1 if bin(k & j).count("1") % 2 == 0 else -1


def prove_row_bounds(s):
    x = [z3.Int("d%d" % i) for i in range(8)]
    base = [z3.And(d >= -255, d <= 255) for d in x]
    results = []
    for k in range(8):
        h = z3.Sum([w8(k, j) * x[j] for j in range(8)])
        lo = z3.Solver()
        lo.set(timeout=30000)
        lo.add(base)
        lo.add(h < -2040)
        hi = z3.Solver()
        hi.set(timeout=30000)
        hi.add(base)
        hi.add(h > 2040)
        results.append({
            "coefficient": k,
            "lower_ok": lo.check() == z3.unsat,
            "upper_ok": hi.check() == z3.unsat,
        })
    return results


def prove_2d_bounds(s):
    h = [z3.Int("h%d" % i) for i in range(8)]
    base = [z3.And(v >= -2040, v <= 2040) for v in h]
    results = []
    for k in range(8):
        t = z3.Sum([w8(k, j) * h[j] for j in range(8)])
        lo = z3.Solver()
        lo.set(timeout=60000)
        lo.add(base)
        lo.add(t < -16320)
        hi = z3.Solver()
        hi.set(timeout=60000)
        hi.add(base)
        hi.add(t > 16320)
        results.append({
            "coefficient": k,
            "lower_ok": lo.check() == z3.unsat,
            "upper_ok": hi.check() == z3.unsat,
        })
    return results


def main():
    outdir = sys.argv[1] if len(sys.argv) > 1 else "experiments/m1-contract"
    os.makedirs(outdir, exist_ok=True)
    row = prove_row_bounds(None)
    td = prove_2d_bounds(None)
    row_ok = all(r["lower_ok"] and r["upper_ok"] for r in row)
    td_ok = all(r["lower_ok"] and r["upper_ok"] for r in td)
    report = {
        "bit_depth": 8,
        "input_range": "D in [-255, 255]",
        "row_bound": 2040,
        "row_proofs": row,
        "row_proof_ok": row_ok,
        "two_d_bound": 16320,
        "two_d_proofs": td,
        "two_d_proof_ok": td_ok,
        "derived": {
            "abs_lane_max": 16320,
            "int16_min_safe": 16320 < 32768,
            "r8_max": 64 * 16320,
            "r8_min": 0,
            "r8_fits_int32": 64 * 16320 <= 2**31 - 1,
            "raw16_sum_max": 4 * 64 * 16320,
            "raw16_fits_int32": 4 * 64 * 16320 <= 2**31 - 1,
        },
        "note": "10/12-bit ranges must be re-proven; these results do not extend.",
    }
    with open(os.path.join(outdir, "range-report.json"), "w") as f:
        json.dump(report, f, indent=2, sort_keys=True)
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0 if (row_ok and td_ok) else 1


if __name__ == "__main__":
    sys.exit(main())
