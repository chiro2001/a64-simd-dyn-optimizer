"""interp8 horizontal 8-tap width-independent op DAG.

Mirrors upstream interp_horiz_pp_neon<8,W,H> (filter-prim.cpp):
per row, per 16-byte column chunk, 8 shifted u8x16 windows
(src - 3 + i + col), per-coeff filter forms
(coeffIdx 1/2/3 differ structurally - docs/66), saturating narrow,
combine + store. The per-coeff lowering is the filter family's
width-independent representation.
"""

from __future__ import annotations

from typing import List

from lane_defuse import annotate  # noqa: E402
from op_ir import Op


def _builder():
    ops: List[Op] = []
    n = 0

    def fresh(kind, tile, ins=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("f%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def _vget(fresh, v, which, tile):
    name = v.out if hasattr(v, "out") else v
    return fresh("vget", tile, (name,),
                 attrs={"which": which, "elem": "u8"})


def _phase1(fresh, s, row, half, tile):
    if half is not None:
        lo = lambda i: _vget(fresh, s[i], half, tile)
    else:
        lo = lambda i: s[i]
    c4 = fresh("dup_u8", tile, attrs={"value": 4})
    c10 = fresh("dup_u8", tile, attrs={"value": 10})
    c58 = fresh("dup_u8", tile, attrs={"value": 58})
    c17 = fresh("dup_u8", tile, attrs={"value": 17})
    c5 = fresh("dup_u8", tile, attrs={"value": 5})
    t = fresh("vsubl_u8", tile, (lo(6).out, lo(0).out),
              attrs={"elem": "u8"})
    z = fresh("dup16", tile, attrs={"value": 0})
    t = fresh("vadd_u16", tile, (z.out, t.out), attrs={"elem": "u16"})
    t = fresh("vmlal_u8", tile, (t.out, lo(1).out, c4.out),
              attrs={"const": 4, "elem": "u8"})
    t = fresh("vmlsl_u8", tile, (t.out, lo(2).out, c10.out),
              attrs={"const": 10, "elem": "u8"})
    t = fresh("vmlal_u8", tile, (t.out, lo(3).out, c58.out),
              attrs={"const": 58, "elem": "u8"})
    t = fresh("vmlal_u8", tile, (t.out, lo(4).out, c17.out),
              attrs={"const": 17, "elem": "u8"})
    t = fresh("vmlsl_u8", tile, (t.out, lo(5).out, c5.out),
              attrs={"const": 5, "elem": "u8"})
    r = fresh("reinterpret_s16", tile, (t.out,), attrs={"elem": "u16"})
    return r.out


def _phase2(fresh, s, row, half, tile):
    if half is not None:
        lo = lambda i: _vget(fresh, s[i], half, tile)
    else:
        lo = lambda i: s[i]
    t0 = fresh("vaddl_u8", tile, (lo(3).out, lo(4).out),
               attrs={"elem": "u8"})
    t1 = fresh("vaddl_u8", tile, (lo(2).out, lo(5).out),
               attrs={"elem": "u8"})
    t2 = fresh("vaddl_u8", tile, (lo(1).out, lo(6).out),
               attrs={"elem": "u8"})
    t3 = fresh("vaddl_u8", tile, (lo(0).out, lo(7).out),
               attrs={"elem": "u8"})
    z = fresh("dup16", tile, attrs={"value": 0})
    d = fresh("reinterpret_s16", tile, (z.out,), attrs={"elem": "u16"})
    d = fresh("vmlaq_n_s16", tile, (d.out, t0.out),
              attrs={"const": 40, "elem": "s16"})
    d = fresh("vmlaq_n_s16", tile, (d.out, t1.out),
              attrs={"const": -11, "elem": "s16"})
    d = fresh("vmlaq_n_s16", tile, (d.out, t2.out),
              attrs={"const": 4, "elem": "s16"})
    d = fresh("vmlaq_n_s16", tile, (d.out, t3.out),
              attrs={"const": -1, "elem": "s16"})
    return d.out


def _phase3(fresh, s, row, half, tile):
    if half is not None:
        lo = lambda i: _vget(fresh, s[i], half, tile)
    else:
        lo = lambda i: s[i]
    c4 = fresh("dup_u8", tile, attrs={"value": 4})
    c10 = fresh("dup_u8", tile, attrs={"value": 10})
    c58 = fresh("dup_u8", tile, attrs={"value": 58})
    c17 = fresh("dup_u8", tile, attrs={"value": 17})
    c5 = fresh("dup_u8", tile, attrs={"value": 5})
    t = fresh("vsubl_u8", tile, (lo(1).out, lo(7).out),
              attrs={"elem": "u8"})
    z = fresh("dup16", tile, attrs={"value": 0})
    t = fresh("vadd_u16", tile, (z.out, t.out), attrs={"elem": "u16"})
    t = fresh("vmlal_u8", tile, (t.out, lo(6).out, c4.out),
              attrs={"const": 4, "elem": "u8"})
    t = fresh("vmlsl_u8", tile, (t.out, lo(5).out, c10.out),
              attrs={"const": 10, "elem": "u8"})
    t = fresh("vmlal_u8", tile, (t.out, lo(4).out, c58.out),
              attrs={"const": 58, "elem": "u8"})
    t = fresh("vmlal_u8", tile, (t.out, lo(3).out, c17.out),
              attrs={"const": 17, "elem": "u8"})
    t = fresh("vmlsl_u8", tile, (t.out, lo(2).out, c5.out),
              attrs={"const": 5, "elem": "u8"})
    r = fresh("reinterpret_s16", tile, (t.out,), attrs={"elem": "u16"})
    return r.out


def interp8_hpp_dag(width: int = 16, height: int = 16) -> List[Op]:
    ops, fresh = _builder()
    if width == 8:
        for row in range(height):
            w = []
            for i in range(8):
                v = fresh("load_u8x8", "f.r%d.w%d" % (row, i),
                          attrs={"row": row, "col": 0, "off": i - 3})
                w.append(v)
            for ph, fn in ((1, _phase1), (2, _phase2), (3, _phase3)):
                d = fn(fresh, w, row, None,
                       "f.ph%d.r%d" % (ph, row))
                n = fresh("vqrshrun", "f.ph%d.r%d.n" % (ph, row), (d,),
                          attrs={"shift": 6, "elem": "s16"})
                fresh("store_u8x8", "f.ph%d.r%d.st" % (ph, row), (n.out,),
                      attrs={"base": "dst", "row": row, "col": 0,
                             "phase": ph})
        return annotate(ops)
    chunks = (width + 15) // 16
    windows = {}
    for row in range(height):
        w = []
        for c in range(chunks):
            for i in range(8):
                v = fresh("load_u8x16", "f.r%d.c%d.w%d" % (row, c, i),
                          attrs={"row": row, "col": c * 16, "off": i - 3})
                w.append(v)
        windows[row] = w
    for ph, fn in ((1, _phase1), (2, _phase2), (3, _phase3)):
        for row in range(height):
            for c in range(chunks):
                w = windows[row][c * 8:(c + 1) * 8]
                d0 = fn(fresh, w, row, "lo",
                        "f.ph%d.r%d.c%d.lo" % (ph, row, c))
                d1 = fn(fresh, w, row, "hi",
                        "f.ph%d.r%d.c%d.hi" % (ph, row, c))
                n0 = fresh("vqrshrun", "f.ph%d.r%d.c%d.n0" % (ph, row, c),
                           (d0,), attrs={"shift": 6, "elem": "s16"})
                n1 = fresh("vqrshrun", "f.ph%d.r%d.c%d.n1" % (ph, row, c),
                           (d1,), attrs={"shift": 6, "elem": "s16"})
                cc = fresh("combine_u8", "f.ph%d.r%d.c%d.c" % (ph, row, c),
                           (n0.out, n1.out), attrs={"elem": "u8"})
                fresh("store_u8x16", "f.ph%d.r%d.c%d.st" % (ph, row, c),
                      (cc.out,),
                      attrs={"base": "dst", "row": row, "col": c * 16,
                             "phase": ph})
    return annotate(ops)


def interp8_hpp_16x8_dag() -> List[Op]:
    return interp8_hpp_dag(16, 8)


def interp8_hpp_8x8_dag() -> List[Op]:
    return interp8_hpp_dag(8, 8)


def interp8_hpp_8x16_dag() -> List[Op]:
    return interp8_hpp_dag(8, 16)


def interp8_hpp_16x16_dag() -> List[Op]:
    return interp8_hpp_dag(16, 16)


def interp8_hpp_16x32_dag() -> List[Op]:
    return interp8_hpp_dag(16, 32)


def interp8_hpp_32x16_dag() -> List[Op]:
    return interp8_hpp_dag(32, 16)


def interp8_hpp_32x32_dag() -> List[Op]:
    return interp8_hpp_dag(32, 32)


def interp8_hpp_64x32_dag() -> List[Op]:
    return interp8_hpp_dag(64, 32)


def interp8_hpp_64x64_dag() -> List[Op]:
    return interp8_hpp_dag(64, 64)
