#!/usr/bin/env python3
"""Unit/property tests for optimizer.targets.aarch64.semantics."""

import random
import sys

from optimizer.targets.aarch64 import semantics as S


def main():
    rng = random.Random(0xA64)
    fails = []

    # abs(a+b) + abs(a-b) == 2 * max(|a|, |b|) per lane (s16)
    for _ in range(1000):
        a = [rng.randint(-5000, 5000) for _ in range(8)]
        b = [rng.randint(-5000, 5000) for _ in range(8)]
        lhs = [S.abs_(S.add(a, b))[i] + S.abs_(S.sub(a, b))[i]
               for i in range(8)]
        rhs = [2 * max(abs(x), abs(y)) for x, y in zip(a, b)]
        if lhs != rhs:
            fails.append(("abs_identity", a, b, lhs, rhs))
            break

    # trn1/trn2 and zip1/zip2 are permutations for 2/4/8-lane vectors;
    # composing trn1+trn2 restores the multiset.
    for n in (2, 4, 8):
        for _ in range(100):
            a = list(range(n))
            b = list(range(100, 100 + n))
            if sorted(S.trn1(a, b) + S.trn2(a, b)) != sorted(a + b):
                fails.append(("trn_partition", n, a, b))
                break
            if sorted(S.zip1(a, b) + S.zip2(a, b)) != sorted(a + b):
                fails.append(("zip_partition", n, a, b))
                break
            if len(S.trn1(a, b)) != n or len(S.trn2(a, b)) != n:
                fails.append(("trn_lane_count", n))
                break

    # uaddlv == sum of u16 lanes
    for _ in range(100):
        v = [rng.randint(0, 65535) for _ in range(8)]
        if S.uaddlv(v) != sum(v):
            fails.append(("uaddlv", v))
            break

    # seed rounding equivalence: (floor(R/2)+1)>>1 == (R+2)>>2
    for r in range(0, 200000, 7):
        if S.round_sa8d(r // 2) != (r + 2) >> 2:
            fails.append(("rounding", r))
            break

    # usubl range proof: |lane| <= 255
    for _ in range(1000):
        a = [rng.randint(0, 255) for _ in range(8)]
        b = [rng.randint(0, 255) for _ in range(8)]
        if any(abs(x) > 255 for x in S.usubl(a, b)):
            fails.append(("usubl_range", a, b))
            break

    print("semantics tests:", "FAIL" if fails else "PASS", len(fails))
    for f in fails[:3]:
        print(" ", f[0])
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
