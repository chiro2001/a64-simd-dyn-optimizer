#!/usr/bin/env python3
"""Bounded exact synthesis: minimal instruction count for the half-fold.

Target (per two 8-lane s16 vectors a,b):
  fold(a) || fold(b), where fold(v)[i] = max(v[i], v[i+4]).

Search shape: one u16 max applied to two operands, each operand produced by
at most one single-input permutation (trn/zip/uzp/ext/rev on a or b, or a
two-input permute). Enumerates every combination and keeps those bit-exact on
random data; reports the minimal instruction count and whether the seed's
trn1(a,b)+trn2(a,b)+umax is the unique minimum.
"""

import itertools
import random
import sys


def trn1(a, b):
    return [a[i] if i % 2 == 0 else b[i - 1] for i in range(8)]


def trn2(a, b):
    return [a[i + 1] if i % 2 == 0 else b[i] for i in range(8)]


def zip1(a, b):
    return [a[i // 2] if i % 2 == 0 else b[i // 2] for i in range(8)]


def zip2(a, b):
    return [a[4 + i // 2] if i % 2 == 0 else b[4 + i // 2] for i in range(8)]


def uzp1(a, b):
    return [a[2 * i] if i < 4 else b[2 * (i - 4)] for i in range(8)]


def uzp2(a, b):
    return [a[2 * i + 1] if i < 4 else b[2 * (i - 4) + 1] for i in range(8)]


def ext(a, b, n):
    return [a[n + i] if n + i < 8 else b[n + i - 8] for i in range(8)]


def rev64(v):
    return [v[(i // 2) * 2 + (1 - i % 2)] for i in range(8)]


def trn1_2d(a, b):
    return a[:4] + b[:4]


def trn2_2d(a, b):
    return a[4:] + b[4:]


def identity(v):
    return list(v)


def umax(a, b):
    return [max(x, y) for x, y in zip(a, b)]


def fold(v):
    return [max(v[i], v[i + 4]) for i in range(4)]


UNARY = {"id": identity, "rev64": rev64,
         "ext1": lambda v: ext(v, v, 1), "ext2": lambda v: ext(v, v, 2),
         "ext3": lambda v: ext(v, v, 3), "ext4": lambda v: ext(v, v, 4)}
BINARY = {"trn1": trn1, "trn2": trn2, "zip1": zip1, "zip2": zip2,
          "uzp1": uzp1, "uzp2": uzp2, "trn1_2d": trn1_2d, "trn2_2d": trn2_2d}


def main():
    rng = random.Random(0xF01D)
    vectors = []
    for _ in range(64):
        a = [rng.randint(-30000, 30000) for _ in range(8)]
        b = [rng.randint(-30000, 30000) for _ in range(8)]
        vectors.append((a, b))
    target = [fold(a) + fold(b) for a, b in vectors]

    def matches(res):
        return all(r == t for r, t in zip(res, target))

    # Candidate operands for the final umax: raw a/b or one permute of them.
    def candidates2(a, b):
        base = [("a", a), ("b", b)]
        for n, f in UNARY.items():
            base.append((n + "(a)", f(a)))
            base.append((n + "(b)", f(b)))
        for n, f in BINARY.items():
            base.append((n + "(a,b)", f(a, b)))
            base.append((n + "(b,a)", f(b, a)))
        return base

    names = [n for n, _ in candidates2(vectors[0][0], vectors[0][1])]
    raw = {"a", "b"}

    def perm_count(n1, n2):
        return int(n1 not in raw) + int(n2 not in raw)

    one_permute = []
    two_permute = []
    for n1, n2 in itertools.product(names, repeat=2):
        ok = True
        for (a, b), t in zip(vectors, target):
            cs = dict(candidates2(a, b))
            if umax(cs[n1], cs[n2]) != t:
                ok = False
                break
        if ok:
            (one_permute if perm_count(n1, n2) <= 1
             else two_permute).append((n1, n2))

    current = {("trn1_2d(a,b)", "trn2_2d(a,b)"),
               ("trn2_2d(a,b)", "trn1_2d(a,b)")}
    print("<=1-permute + umax solutions:", one_permute)
    print("2-permute + umax solutions:", two_permute)
    print("minimal_permutes:", 1 if one_permute else 2)
    print("seed_pair_unique:", set(two_permute) == current)
    return 0


if __name__ == "__main__":
    sys.exit(main())
