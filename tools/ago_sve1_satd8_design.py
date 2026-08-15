#!/usr/bin/env python3
"""SVE1 satd8 layout explorer (2026-08-16).

Simulates SVE1 TBL semantics (16 u16 lanes, single-source table lookup)
to validate candidate layouts against the exact x265 satd8 oracle
before spending target time. Current result: the two-stage TBL
horizontal-Hadamard is CORRECT (5000/5000) but costs ~184 instructions
vs 92 for the CADD90-emulation pack-2 candidate -- not a win, so the
SVE1 satd8 direction is stopped (evidence-based).

Usage: python3 tools/ago_sve1_satd8_design.py [cases=5000]
"""

from __future__ import annotations

import random
import sys


def tbl(v, idx):
    return [v[i] for i in idx]


def h4_values(y):
    """Two-stage TBL horizontal 4-point hadamard over 8 columns
    (TL cols 0-3, TR cols 4-7). Returns the 8 distinct values
    (TL q0..q3, TR q0..q3) sampled from lanes 0 and 4 of each out."""
    idx1 = [1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14]
    idx2 = [2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13]
    t1 = tbl(y, idx1)
    s = [a + b for a, b in zip(y, t1)]
    d = [a - b for a, b in zip(y, t1)]
    t2 = tbl(s, idx2)
    o0 = [a + b for a, b in zip(s, t2)]
    o1 = [a - b for a, b in zip(s, t2)]
    t3 = tbl(d, idx2)
    o2 = [a + b for a, b in zip(d, t3)]
    o3 = [a - b for a, b in zip(d, t3)]
    return [o0[0], o0[4], o1[0], o1[4], o2[0], o2[4], o3[0], o3[4]]


def v4(rows):
    """Vertical 4-point hadamard per column (lane-wise, no permute)."""
    a01 = [rows[0][i] + rows[1][i] for i in range(16)]
    b01 = [rows[0][i] - rows[1][i] for i in range(16)]
    a23 = [rows[2][i] + rows[3][i] for i in range(16)]
    b23 = [rows[2][i] - rows[3][i] for i in range(16)]
    return ([a01[i] + a23[i] for i in range(16)],
            [b01[i] + b23[i] for i in range(16)],
            [a01[i] - a23[i] for i in range(16)],
            [b01[i] - b23[i] for i in range(16)])


H = [[1, 1, 1, 1], [1, -1, 1, -1], [1, 1, -1, -1], [1, -1, -1, 1]]


def oracle(p1, p2):
    want = 0
    for br in (0, 4):
        for bc in (0, 4):
            s = 0
            for pr in range(4):
                for pc in range(4):
                    coef = 0
                    for i in range(4):
                        for j in range(4):
                            coef += H[pr][i] * H[pc][j] * (
                                p1[(br + i) * 8 + bc + j] -
                                p2[(br + i) * 8 + bc + j])
                    s += abs(coef)
            want += s >> 1
    return want


def main():
    cases = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
    random.seed(7)
    bad = 0
    for t in range(cases):
        p1 = [random.randrange(256) for _ in range(64)]
        p2 = [random.randrange(256) for _ in range(64)]
        d = []
        for r in range(8):
            d.append([p1[r * 8 + c] - p2[r * 8 + c] for c in range(8)] +
                     [0] * 8)
        total = 0
        for y in v4(d[0:4]) + v4(d[4:8]):
            for v in h4_values(y):
                total += abs(v)
        if (total >> 1) != oracle(p1, p2):
            bad += 1
    print("sve1 satd8 tbl-design verify bad=%d/%d" % (bad, cases))
    return 0 if bad == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
