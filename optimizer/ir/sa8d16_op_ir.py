"""SA8D 16x16 width-independent op DAG (hadamard_8x8 blocks).

Mirrors kernels/sa8d16/candidates/best_sve1.cpp and upstream
pixel_sa8d_16x16_neon: 4 blocks of 8x8 hadamard
(hadamard_8_v + hadamard_8_h with trn s16/s32/s64, abs/sumsub, vmax),
u16 accumulation across blocks, vaddlv reduce with (x+1)>>1.
"""

from __future__ import annotations

from typing import Callable, List

from lane_defuse import annotate  # noqa: E402
from op_ir import Op
from satd8_op_ir import _builder, _hadamard4_v


def _load_block(fresh, rows, xo, yo):
    d = {}
    for y in rows:
        d[y] = fresh("load_diff", "a.load.r%d" % y,
                     attrs={"arch": "neon", "elem": "s16", "row": y,
                            "base": "pix", "index": "y*sp",
                            "xo": xo, "yo": yo}).out
    return d


def _hadamard4_h(fresh, ins, base):
    t0 = fresh("permute", base, (ins[0], ins[1]),
               attrs={"kind": "trn1q_s16", "arch": "neon"})
    t1 = fresh("permute", base, (ins[0], ins[1]),
               attrs={"kind": "trn2q_s16", "arch": "neon"})
    t2 = fresh("permute", base, (ins[2], ins[3]),
               attrs={"kind": "trn1q_s16", "arch": "neon"})
    t3 = fresh("permute", base, (ins[2], ins[3]),
               attrs={"kind": "trn2q_s16", "arch": "neon"})
    s0 = fresh("add", base, (t0.out, t1.out),
               attrs={"elem": "s16", "arch": "neon"})
    d0 = fresh("sub", base, (t0.out, t1.out),
               attrs={"elem": "s16", "arch": "neon"})
    s1 = fresh("add", base, (t2.out, t3.out),
               attrs={"elem": "s16", "arch": "neon"})
    d1 = fresh("sub", base, (t2.out, t3.out),
               attrs={"elem": "s16", "arch": "neon"})
    o0 = fresh("permute", base, (s0.out, s1.out),
               attrs={"kind": "trn1q_s32", "arch": "neon"})
    o1 = fresh("permute", base, (s0.out, s1.out),
               attrs={"kind": "trn2q_s32", "arch": "neon"})
    o2 = fresh("permute", base, (d0.out, d1.out),
               attrs={"kind": "trn1q_s32", "arch": "neon"})
    o3 = fresh("permute", base, (d0.out, d1.out),
               attrs={"kind": "trn2q_s32", "arch": "neon"})
    return (o0.out, o1.out, o2.out, o3.out)


def _hadamard8_v(fresh, ins, base):
    t = _hadamard4_v(fresh, ins[0:4], base + ".a")
    t += _hadamard4_v(fresh, ins[4:8], base + ".b")
    out = []
    for i in range(4):
        out.append(fresh("add", base, (t[i], t[i + 4]),
                         attrs={"elem": "s16", "arch": "neon"}).out)
        out.append(fresh("sub", base, (t[i], t[i + 4]),
                         attrs={"elem": "s16", "arch": "neon"}).out)
    # out order: [o0,o4, o1,o5, o2,o6, o3,o7]
    return (out[0], out[2], out[4], out[6],
            out[1], out[3], out[5], out[7])


def _hadamard8_h(fresh, coefs, base):
    t = _hadamard4_h(fresh, coefs[0:4], base + ".a")
    t += _hadamard4_h(fresh, coefs[4:8], base + ".b")
    sd = []
    for i in range(4):
        sa = fresh("add", base, (t[2 * i], t[2 * i + 1]),
                   attrs={"elem": "s16", "arch": "neon"})
        sd.append(fresh("abs", base, (sa.out,), attrs={"elem": "s16"}))
        sd.append(fresh("abd", base, (t[2 * i], t[2 * i + 1]),
                        attrs={"elem": "s16"}))
    # sd = [s0,d0, s1,d1, s2,d2, s3,d3]
    def tr64(pair_a, pair_b, base2):
        x0 = fresh("permute", base2, (pair_a[0].out, pair_b[0].out),
                   attrs={"kind": "trn1q_s64", "arch": "neon"})
        x1 = fresh("permute", base2, (pair_a[0].out, pair_b[0].out),
                   attrs={"kind": "trn2q_s64", "arch": "neon"})
        x2 = fresh("permute", base2, (pair_a[1].out, pair_b[1].out),
                   attrs={"kind": "trn1q_s64", "arch": "neon"})
        x3 = fresh("permute", base2, (pair_a[1].out, pair_b[1].out),
                   attrs={"kind": "trn2q_s64", "arch": "neon"})
        return (x0.out, x1.out, x2.out, x3.out)

    tmp01 = tr64((sd[0], sd[1]), (sd[4], sd[5]), base + ".t01")
    tmp23 = tr64((sd[2], sd[3]), (sd[6], sd[7]), base + ".t23")
    sums = [fresh("max", base, (tmp01[0], tmp01[1]),
                  attrs={"elem": "u16"}),
            fresh("max", base, (tmp01[2], tmp01[3]),
                  attrs={"elem": "u16"}),
            fresh("max", base, (tmp23[0], tmp23[1]),
                  attrs={"elem": "u16"}),
            fresh("max", base, (tmp23[2], tmp23[3]),
                  attrs={"elem": "u16"})]
    return [s.out for s in sums]


def _hadamard8x8(fresh, diff, base):
    t = _hadamard8_v(fresh, [diff[y] for y in range(8)], base)
    sums = _hadamard8_h(fresh, t, base)
    r0 = fresh("add", base, (sums[0], sums[1]),
               attrs={"elem": "u16", "arch": "neon"})
    r1 = fresh("add", base, (sums[2], sums[3]),
               attrs={"elem": "u16", "arch": "neon"})
    return r0.out, r1.out


def sa8d16_dag() -> List[Op]:
    ops, fresh = _builder()
    tot = None
    for b, (xo, yo) in enumerate(((0, 0), (8, 0), (0, 8), (8, 8))):
        diff = _load_block(fresh, list(range(8)), xo, yo)
        r0, r1 = _hadamard8x8(fresh, diff, "a.b%d" % b)
        if tot is None:
            tot = r0
            tot1 = r1
        else:
            tot = fresh("add", "a.acc%d" % b, (tot, r0),
                        attrs={"elem": "u16", "arch": "neon"}).out
            tot1 = fresh("add", "a.acc%d" % b, (tot1, r1),
                         attrs={"elem": "u16", "arch": "neon"}).out
    t = fresh("add", "a.acc", (tot, tot1),
              attrs={"elem": "u16", "arch": "neon"})
    fresh("vaddlv", "a.reduce", (t.out,),
          attrs={"from": "u16", "to": "s32", "add1_shift1": True})
    return annotate(ops)
