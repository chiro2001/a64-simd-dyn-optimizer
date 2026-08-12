"""Canonical SA8D interpreter mirroring the frozen x265 C reference stages.

The frozen reference is x265 commit b81f650e2, source/common/pixel.cpp:
`_sa8d_8x8`, `sa8d_8x8`, `sa8d_16x16`, `sa8d8`, `sa8d16`, with
`BITS_PER_SUM=16`, `sum_t=uint16_t`, `sum2_t=uint32_t` (8-bit build).

All values are represented as Python ints. Packed 16-bit lanes are kept
explicitly so an unexpected overflow (range-proof violation) raises instead
of silently wrapping.
"""

MASK16 = 0xFFFF
MASK32 = 0xFFFFFFFF


def _pack(lo, hi):
    if not (-0x8000 <= lo <= 0x7FFF and -0x8000 <= hi <= 0x7FFF):
        raise OverflowError("s16 lane out of range: (%d, %d)" % (lo, hi))
    return ((hi & MASK16) << 16) | (lo & MASK16)


def _unpack(a):
    lo = a & MASK16
    hi = (a >> 16) & MASK16
    if lo & 0x8000:
        lo -= 0x10000
    if hi & 0x8000:
        hi -= 0x10000
    return lo, hi


def _add2(a, b):
    lo = _unpack(a)[0] + _unpack(b)[0]
    hi = _unpack(a)[1] + _unpack(b)[1]
    return _pack(lo, hi)


def _sub2(a, b):
    lo = _unpack(a)[0] - _unpack(b)[0]
    hi = _unpack(a)[1] - _unpack(b)[1]
    return _pack(lo, hi)


def _abs2(a):
    lo, hi = _unpack(a)
    return _pack(abs(lo), abs(hi))


def _hadamard4(s0, s1, s2, s3):
    """x265 HADAMARD4 over packed sum2_t values."""
    t0 = _add2(s0, s1)
    t1 = _sub2(s0, s1)
    t2 = _add2(s2, s3)
    t3 = _sub2(s2, s3)
    return _add2(t0, t2), _add2(t1, t3), _sub2(t0, t2), _sub2(t1, t3)


def _row_pass(row):
    """One row of 8 D values -> 4 packed pairs (H_j, H_{j+4}), j=0..3.

    Mirrors x265: d0..d3 each pack two 16-bit Hadamard coefficients, e.g.
    d0=(H0,H4), d1=(H1,H5), d2=(H2,H6), d3=(H3,H7).
    """
    b0 = _pack(row[0] + row[1], row[0] - row[1])
    b1 = _pack(row[2] + row[3], row[2] - row[3])
    b2 = _pack(row[4] + row[5], row[4] - row[5])
    b3 = _pack(row[6] + row[7], row[6] - row[7])
    d0, d1, d2, d3 = _hadamard4(b0, b1, b2, b3)
    return [d0, d1, d2, d3]


def _sa8d8_raw(a, b):
    """Raw unrounded R8 for one 8x8 tile, following x265 _sa8d_8x8."""
    tmp = []
    for r in range(8):
        d = [int(a[r * 8 + c]) - int(b[r * 8 + c]) for c in range(8)]
        tmp.append(_row_pass(d))

    total = 0
    for cg in range(4):  # packed coefficient pair: {cg, cg+4}
        a0, a1, a2, a3 = _hadamard4(*[tmp[r][cg] for r in range(4)])
        a4, a5, a6, a7 = _hadamard4(*[tmp[r][cg] for r in range(4, 8)])
        # Each of these is a pack of the two coefficients in the pair.
        b0 = _add2(_abs2(_add2(a0, a4)), _abs2(_sub2(a0, a4)))
        b0 = _add2(b0, _abs2(_add2(a1, a5)))
        b0 = _add2(b0, _abs2(_sub2(a1, a5)))
        b0 = _add2(b0, _abs2(_add2(a2, a6)))
        b0 = _add2(b0, _abs2(_sub2(a2, a6)))
        b0 = _add2(b0, _abs2(_add2(a3, a7)))
        b0 = _add2(b0, _abs2(_sub2(a3, a7)))
        lo, hi = _unpack(b0)
        total += lo + hi
    return total


def sa8d8x8(a, b, stride_a=8, stride_b=8):
    aa = _read_block(a, stride_a, 0, 0, 8)
    bb = _read_block(b, stride_b, 0, 0, 8)
    return (_sa8d8_raw(aa, bb) + 2) >> 2


def _read_block(plane, stride, r0, c0, size):
    return [plane[r * stride + c0 + c] for r in range(r0, r0 + size) for c in range(size)]


def sa8d16x16(a, b, stride_a, stride_b, oy=0, ox=0):
    raw = 0
    for (dy, dx) in ((0, 0), (0, 8), (8, 0), (8, 8)):
        aa = _read_block(a, stride_a, oy + dy, ox + dx, 8)
        bb = _read_block(b, stride_b, oy + dy, ox + dx, 8)
        raw += _sa8d8_raw(aa, bb)
    return (raw + 2) >> 2


def sa8d(shape, a, b, stride_a, stride_b):
    """Dispatch matching x265 luma CU slots for 8-bit builds."""
    if shape == 8:
        return sa8d8x8(a, b, stride_a, stride_b)
    if shape == 16:
        return sa8d16x16(a, b, stride_a, stride_b)
    if shape == 32:
        total = 0
        for oy in range(0, 32, 16):
            for ox in range(0, 32, 16):
                total += sa8d16x16(a, b, stride_a, stride_b, oy, ox)
        return total
    if shape == 64:
        total = 0
        for oy in range(0, 64, 16):
            for ox in range(0, 64, 16):
                total += sa8d16x16(a, b, stride_a, stride_b, oy, ox)
        return total
    raise ValueError("unsupported shape %r" % (shape,))
