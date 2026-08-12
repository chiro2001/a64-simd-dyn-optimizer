"""AArch64 NEON lane semantics for the SA8D seed instruction set.

Each function models one instruction form on flat s16/u16 lane lists, with
the exact bit-level behavior required for bit-exact verification. Tests in
test_semantics.py lock these against algebraic identities used by rewrites.
"""


def s16(x):
    x &= 0xFFFF
    return x - 0x10000 if x & 0x8000 else x


def usubl(a, b):
    """u8 widen-diff: s16 lane i = a[i] - b[i] (values 0..255)."""
    return [a[i] - b[i] for i in range(len(a))]


def add(a, b):
    return [s16(a[i] + b[i]) for i in range(len(a))]


def sub(a, b):
    return [s16(a[i] - b[i]) for i in range(len(a))]


def _shuffle(a, b, mask):
    n = len(a)
    return [a[m] if m < n else b[m - n] for m in mask]


TRN1_8 = [0, 8, 2, 10, 4, 12, 6, 14]
TRN2_8 = [1, 9, 3, 11, 5, 13, 7, 15]
ZIP1_8 = [0, 8, 1, 9, 2, 10, 3, 11]
ZIP2_8 = [4, 12, 5, 13, 6, 14, 7, 15]


def trn1(a, b):
    return _shuffle(a, b, TRN1_8[:len(a)] if len(a) < 8 else TRN1_8)


def trn2(a, b):
    return _shuffle(a, b, TRN2_8[:len(a)] if len(a) < 8 else TRN2_8)


def zip1(a, b):
    return _shuffle(a, b, ZIP1_8[:len(a)] if len(a) < 8 else ZIP1_8)


def zip2(a, b):
    return _shuffle(a, b, ZIP2_8[:len(a)] if len(a) < 8 else ZIP2_8)


def sabd(a, b):
    return [abs(s16(a[i]) - s16(b[i])) for i in range(len(a))]


def abs_(a):
    return [abs(s16(x)) for x in a]


def umax(a, b):
    return [max(x & 0xFFFF, y & 0xFFFF) for x, y in zip(a, b)]


def uaddlv(a):
    return sum(x & 0xFFFF for x in a)


def round_sa8d(r8):
    """NEON seed rounding (sum+1)>>1; equals (R8+2)>>2 for all R8."""
    return (r8 + 1) >> 1
