"""DCT32 8-lane fused quarter op DAG (width-independent spec).

Mirrors tools/emit_dct32_vl128.py --pass1 fused --pass2 fused (the
validated SVE2 8421 / NEON 12245 fused_uop candidates):
  - per 4-row group: two rowpairs' leaves (O s16 8-lane x2 per row,
    EO per row, EEO/EEE per row, EEEE/EEEO per rowpair);
  - odd k (1..31): two dot segments per row (GT32A + GT32B accumulate);
  - k2 (2 mod 4): sdot over per-row EO (pass1) / vmul+vmla over s32 EO
    (pass2);
  - k4 (4 mod 8): vmul over EEO;
  - even k0/8/16/24: vmul/vpadd over EEEE/EEEO.

This is the width-independent spec layer; the emitter consumes it in a
later increment (same neon8 loop-re-rolling machinery as dct16).
"""

from __future__ import annotations

from typing import Dict, List, Tuple

from lane_defuse import annotate  # noqa: E402
from op_ir import Op
from width_expr import PERMUTES as WIDTH_PERMUTES, resolve as resolve_permute


ODD_K = tuple(range(1, 32, 2))
K2_K = tuple(range(2, 32, 4))
K4_K = tuple(range(4, 32, 8))
K0_K = (0, 8, 16, 24)
ALL_K = tuple(range(32))


def _g(k, j):
    return "G[%d][%d]" % (k, j)


class _Builder:
    """Sequential op-DAG builder with a monotonic op_id counter."""

    def __init__(self, prefix: str):
        self.ops: List[Op] = []
        self.prefix = prefix
        self.n = 0

    def new(self, kind: str, tile_id: str, out: str = "", ins=(),
            attrs=None) -> Op:
        self.n += 1
        op = Op("%s%04d" % (self.prefix, self.n), kind, tile_id, out,
                tuple(ins), dict(attrs if attrs is not None else {}))
        self.ops.append(op)
        return op


def _row_leaf(b: _Builder, pass_id: int, r: int,
              index_expr: str) -> Tuple[Dict[str, str], Dict[int, str],
                                        Dict[int, str], Dict[int, str]]:
    """Load one 32-sample row (4x8 lanes), rev16 halves, O/E/EO/EEO/EEE.

    Returns (E names E0..E3, O[0]/O[1], EO, EEO/EEE per row).
    """
    rtid = "p%d.leaf.row%d" % (pass_id, r)
    v = {}
    for h in range(4):
        v[h] = b.new("load", rtid, "r%d_v%d" % (r, h),
                     attrs={"arch": "neon", "elem": "s16", "row": r,
                            "half": "q%d" % h, "base": "src",
                            "index": index_expr + "+%d" % (8 * h)}).out
    hi2 = b.new("permute", rtid, "r%d_v2r" % r, (v[2],),
                attrs={"kind": "rev16", "arch": "neon",
                       "idx": "rev8", "seg": 1}).out
    hi3 = b.new("permute", rtid, "r%d_v3r" % r, (v[3],),
                attrs={"kind": "rev16", "arch": "neon",
                       "idx": "rev8", "seg": 1}).out
    O = {
        0: b.new("sub", rtid, "O_%d_0" % r, (v[0], hi3),
                 attrs={"elem": "s16", "arch": "neon"}).out,
        1: b.new("sub", rtid, "O_%d_1" % r, (v[1], hi2),
                 attrs={"elem": "s16", "arch": "neon"}).out,
    }
    E: Dict[str, str] = {}
    for h, tag in ((0, "0"), (1, "1"), (2, "2"), (3, "3")):
        a = b.new("vget", rtid, "g%s_%d_a" % (tag, r), (v[h // 2],),
                  attrs={"which": "lo" if h % 2 == 0 else "hi",
                         "elem": "s16"})
        c = b.new("vget", rtid, "g%s_%d_c" % (tag, r),
                  (hi3 if h < 2 else hi2,),
                  attrs={"which": "lo" if h % 2 == 0 else "hi",
                         "elem": "s16"})
        E[tag] = b.new("widen_add", rtid, "E%s_%d" % (tag, r),
                       (a.out, c.out), attrs={"elem": "s32"}).out
    return E, O


def _row_eo(b: _Builder, pass_id: int, r: int, E: Dict[str, str],
            s16_combined: bool):
    """EO per row: 8-lane s16 (pass1) or two 4-lane s32 (pass2)."""
    rtid = "p%d.leaf.row%d" % (pass_id, r)
    er3 = b.new("permute", rtid, "Er_%d_3" % r, (E["3"],),
                attrs={"kind": "rev32", "arch": "neon"}).out
    er2 = b.new("permute", rtid, "Er_%d_2" % r, (E["2"],),
                attrs={"kind": "rev32", "arch": "neon"}).out
    if s16_combined:
        lo = b.new("neon_narrow4", rtid, "EOn_%d_lo" % r,
                   (b.new("sub", rtid, "EOx_%d_lo" % r, (E["0"], er3),
                          attrs={"elem": "s32", "arch": "neon"}).out,),
                   attrs={"mode": "vmovn"})
        hi = b.new("neon_narrow4", rtid, "EOn_%d_hi" % r,
                   (b.new("sub", rtid, "EOx_%d_hi" % r, (E["1"], er2),
                          attrs={"elem": "s32", "arch": "neon"}).out,),
                   attrs={"mode": "vmovn"})
        return b.new("neon_combine", rtid, "EO_%d" % r,
                     (lo.out, hi.out),
                     attrs={"elem": "s16", "n_lanes": 8}).out
    eo0 = b.new("sub", rtid, "EO_%d_0" % r, (E["0"], er3),
                attrs={"elem": "s32", "arch": "neon",
                       "lane_owner": "partial"}).out
    eo1 = b.new("sub", rtid, "EO_%d_1" % r, (E["1"], er2),
                attrs={"elem": "s32", "arch": "neon",
                       "lane_owner": "partial"}).out
    return {"0": eo0, "1": eo1}


def _row_eeo(b: _Builder, pass_id: int, r: int,
             E: Dict[str, str]) -> Tuple[str, str]:
    """EEO/EEE per row (s32 4-lane)."""
    rtid = "p%d.leaf.row%d" % (pass_id, r)
    er3 = b.new("permute", rtid, "EEr_%d_3" % r, (E["3"],),
                attrs={"kind": "rev32", "arch": "neon"}).out
    er2 = b.new("permute", rtid, "EEr_%d_2" % r, (E["2"],),
                attrs={"kind": "rev32", "arch": "neon"}).out
    ee0 = b.new("add", rtid, "EE_%d_0" % r, (E["0"], er3),
                attrs={"elem": "s32", "arch": "neon"}).out
    ee1 = b.new("add", rtid, "EE_%d_1" % r, (E["1"], er2),
                attrs={"elem": "s32", "arch": "neon"}).out
    re1 = b.new("permute", rtid, "EEr2_%d" % r, (ee1,),
                attrs={"kind": "rev32", "arch": "neon"}).out
    eee = b.new("add", rtid, "EEE_%d" % r, (ee0, re1),
                attrs={"elem": "s32", "arch": "neon",
                       "lane_owner": "partial"}).out
    eeo = b.new("sub", rtid, "EEO_%d" % r, (ee0, re1),
                attrs={"elem": "s32", "arch": "neon",
                       "lane_owner": "partial"}).out
    return eee, eeo


def _rowpair_eeee(b: _Builder, pass_id: int, p: int, eee_a: str,
                  eee_b: str) -> Tuple[str, str]:
    """EEEE/EEEO per rowpair (zip1q/zip2q/rev64q chain)."""
    tid = "p%d.leaf.rowpair%d" % (pass_id, p)
    t0 = b.new("permute", tid, "t0_%d" % p, (eee_a, eee_b),
               attrs={"kind": "zip1q", "arch": "neon"})
    z2 = b.new("permute", tid, "z2_%d" % p, (eee_a, eee_b),
               attrs={"kind": "zip2q", "arch": "neon"})
    t1 = b.new("permute", tid, "t1_%d" % p, (z2.out,),
               attrs={"kind": "rev64q", "arch": "neon"})
    eeee = b.new("add", tid, "EEEE_%d" % p, (t0.out, t1.out),
                 attrs={"elem": "s32", "arch": "neon",
                        "lane_owner": "partial"}).out
    eeeo = b.new("sub", tid, "EEEO_%d" % p, (t0.out, t1.out),
                 attrs={"elem": "s32", "arch": "neon",
                        "lane_owner": "partial"}).out
    return eeee, eeeo


def lower_pass1_fused8(shift: int = 4) -> List[Op]:
    """8-lane fused pass1 (mirror of emit_dct32_vl128 --pass1 fused)."""
    b = _Builder("d32")
    for g in range(8):
        rows = tuple(4 * g + m for m in range(4))
        E: Dict[int, Dict[str, str]] = {}
        O: Dict[int, Dict[int, str]] = {}
        EO: Dict[int, str] = {}
        EEE: Dict[int, str] = {}
        EEO: Dict[int, str] = {}
        EEEE: Dict[int, str] = {}
        EEEO: Dict[int, str] = {}
        for r in rows:
            E[r], O[r] = _row_leaf(b, 1, r, "r*stride")
            EO[r] = _row_eo(b, 1, r, E[r], s16_combined=True)
            EEE[r], EEO[r] = _row_eeo(b, 1, r, E[r])
        for p, (ra, rb) in enumerate(((rows[0], rows[1]),
                                      (rows[2], rows[3]))):
            EEEE[2 * g + p], EEEO[2 * g + p] = _rowpair_eeee(
                b, 1, 2 * g + p, EEE[ra], EEE[rb])
        for k in ODD_K:
            tid = "p1.odd.k%d.g%d" % (k, g)
            dots = []
            for r in rows:
                d = b.new("dot_segment", tid, "t_%d_%d" % (k, r),
                          (O[r][0],),
                          attrs={"arch": "neon-bridge", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j) for j in range(8)),
                                 "const_src": "GT32A[%d]" % k}).out
                d = b.new("dot_accum", tid, "t_%d_%d" % (k, r), (d, O[r][1]),
                          attrs={"arch": "neon-bridge", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j)
                                                for j in range(8, 16)),
                                 "const_src": "GT32B[%d]" % k}).out
                dots.append(d)
            nn = b.new("neon_reduce_narrow", tid, "nn_%d_%d" % (k, g),
                       tuple(dots), attrs={"shift": shift,
                                           "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((1, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k in K2_K:
            tid = "p1.f2.k%d.g%d" % (k, g)
            dots = [b.new("dot_segment", tid, "t_%d_%d" % (k, r),
                          (EO[r],),
                          attrs={"arch": "neon-bridge", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j)
                                                for j in range(8)),
                                 "const_src": "GT32A[%d]" % k}).out
                    for r in rows]
            nn = b.new("neon_reduce_narrow", tid, "nn_%d_%d" % (k, g),
                       tuple(dots), attrs={"shift": shift,
                                           "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((1, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k in K4_K:
            tid = "p1.f4.k%d.g%d" % (k, g)
            terms = tuple(_g(k, j) for j in range(4))
            ms = [b.new("neon_mul", tid, "m_%d_%d" % (k, r), (EEO[r],),
                        attrs={"const_src": "GT32S32A4[%d]"
                               % ((k - 4) // 8),
                               "terms": terms}).out
                  for r in rows]
            t01 = b.new("neon_padd", tid, "t01_%d_%d" % (k, g),
                        (ms[0], ms[1]), attrs={}).out
            t23 = b.new("neon_padd", tid, "t23_%d_%d" % (k, g),
                        (ms[2], ms[3]), attrs={}).out
            tt = b.new("neon_padd", tid, "t_%d_%d" % (k, g),
                       (t01, t23), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (tt,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((1, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k, fam, use_eeee in ((0, 0, True), (8, 1, False),
                                 (16, 2, True), (24, 3, False)):
            tid = "p1.k%d.k%d.g%d" % (k, fam, g)
            src = EEEE if use_eeee else EEEO
            pa, pb = 2 * g, 2 * g + 1
            terms = tuple(_g(k, j) for j in range(4))
            if k == 0:
                pp = b.new("neon_padd", tid, "pp_%d_%d" % (k, g),
                           (src[pa], src[pb]), attrs={}).out
                m = b.new("neon_mul", tid, "m_%d_%d" % (k, g), (pp,),
                          attrs={"const_src": "T8E[%d]" % fam,
                                 "terms": terms}).out
            else:
                m0 = b.new("neon_mul", tid, "m0_%d_%d" % (k, g),
                           (src[pa],),
                           attrs={"const_src": "T8E[%d]" % fam,
                                  "terms": terms}).out
                m1 = b.new("neon_mul", tid, "m1_%d_%d" % (k, g),
                           (src[pb],),
                           attrs={"const_src": "T8E[%d]" % fam,
                                  "terms": terms}).out
                m = b.new("neon_padd", tid, "m_%d_%d" % (k, g),
                          (m0, m1), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (m,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((1, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
    return annotate(b.ops)


def lower_pass2_fused8(shift: int = 11) -> List[Op]:
    """8-lane fused pass2 (mirror of emit_dct32_vl128 --pass2 fused)."""
    b = _Builder("d32")
    for g in range(8):
        rows = tuple(4 * g + m for m in range(4))
        E: Dict[int, Dict[str, str]] = {}
        O: Dict[int, Dict[int, str]] = {}
        EO: Dict[int, Dict[str, str]] = {}
        EEE: Dict[int, str] = {}
        EEO: Dict[int, str] = {}
        EEEE: Dict[int, str] = {}
        EEEO: Dict[int, str] = {}
        for r in rows:
            E[r], O[r] = _row_leaf(b, 2, r, "r*line")
            EO[r] = _row_eo(b, 2, r, E[r], s16_combined=False)
            EEE[r], EEO[r] = _row_eeo(b, 2, r, E[r])
        for p, (ra, rb) in enumerate(((rows[0], rows[1]),
                                      (rows[2], rows[3]))):
            EEEE[2 * g + p], EEEO[2 * g + p] = _rowpair_eeee(
                b, 2, 2 * g + p, EEE[ra], EEE[rb])
        for k in ODD_K:
            tid = "p2.odd.k%d.g%d" % (k, g)
            dots = []
            for r in rows:
                d = b.new("dot_segment", tid, "t_%d_%d" % (k, r),
                          (O[r][0],),
                          attrs={"arch": "neon-bridge", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j) for j in range(8)),
                                 "const_src": "GT32A[%d]" % k}).out
                d = b.new("dot_accum", tid, "t_%d_%d" % (k, r), (d, O[r][1]),
                          attrs={"arch": "neon-bridge", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j)
                                                for j in range(8, 16)),
                                 "const_src": "GT32B[%d]" % k}).out
                dots.append(d)
            nn = b.new("neon_reduce_narrow", tid, "nn_%d_%d" % (k, g),
                       tuple(dots), attrs={"shift": shift,
                                           "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k in K2_K:
            tid = "p2.f2.k%d.g%d" % (k, g)
            idx = (k - 2) // 4
            terms_a = tuple(_g(k, j) for j in range(4))
            terms_b = tuple(_g(k, j) for j in range(4, 8))
            ts = []
            for r in rows:
                t = b.new("neon_mul", tid, "m_%d_%d" % (k, r), (EO[r]["0"],),
                          attrs={"const_src": "GT32S32A[%d]" % idx,
                                 "terms": terms_a}).out
                t = b.new("neon_mla", tid, "m_%d_%d" % (k, r), (t, EO[r]["1"]),
                          attrs={"const_src": "GT32S32B[%d]" % idx,
                                 "terms": terms_b}).out
                ts.append(t)
            t01 = b.new("neon_padd", tid, "t01_%d_%d" % (k, g),
                        (ts[0], ts[1]), attrs={}).out
            t23 = b.new("neon_padd", tid, "t23_%d_%d" % (k, g),
                        (ts[2], ts[3]), attrs={}).out
            tt = b.new("neon_padd", tid, "t_%d_%d" % (k, g),
                       (t01, t23), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (tt,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k in K4_K:
            tid = "p2.f4.k%d.g%d" % (k, g)
            terms = tuple(_g(k, j) for j in range(4))
            ms = [b.new("neon_mul", tid, "m_%d_%d" % (k, r), (EEO[r],),
                        attrs={"const_src": "GT32S32A4[%d]"
                               % ((k - 4) // 8),
                               "terms": terms}).out
                  for r in rows]
            t01 = b.new("neon_padd", tid, "t01_%d_%d" % (k, g),
                        (ms[0], ms[1]), attrs={}).out
            t23 = b.new("neon_padd", tid, "t23_%d_%d" % (k, g),
                        (ms[2], ms[3]), attrs={}).out
            tt = b.new("neon_padd", tid, "t_%d_%d" % (k, g),
                       (t01, t23), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (tt,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k, fam, use_eeee in ((0, 0, True), (8, 1, False),
                                 (16, 2, True), (24, 3, False)):
            tid = "p2.k%d.k%d.g%d" % (k, fam, g)
            src = EEEE if use_eeee else EEEO
            pa, pb = 2 * g, 2 * g + 1
            terms = tuple(_g(k, j) for j in range(4))
            if k == 0:
                pp = b.new("neon_padd", tid, "pp_%d_%d" % (k, g),
                           (src[pa], src[pb]), attrs={}).out
                m = b.new("neon_mul", tid, "m_%d_%d" % (k, g), (pp,),
                          attrs={"const_src": "T8E[%d]" % fam,
                                 "terms": terms}).out
            else:
                m0 = b.new("neon_mul", tid, "m0_%d_%d" % (k, g),
                           (src[pa],),
                           attrs={"const_src": "T8E[%d]" % fam,
                                  "terms": terms}).out
                m1 = b.new("neon_mul", tid, "m1_%d_%d" % (k, g),
                           (src[pb],),
                           attrs={"const_src": "T8E[%d]" % fam,
                                  "terms": terms}).out
                m = b.new("neon_padd", tid, "m_%d_%d" % (k, g),
                          (m0, m1), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (m,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "32*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
    return annotate(b.ops)


def fused8_provenance(ops: List[Op], vl_bits: int = 128) -> Dict:
    """2048 output-lane bijection, dot-term coverage, shifts, width."""
    issues: List[str] = []
    stores: Dict[Tuple[int, int, int], Op] = {}
    dot_terms: Dict[Tuple[int, int], set] = {}
    scatter = 0
    for op in ops:
        if op.kind == "store":
            if op.attrs.get("topology") != "contiguous":
                issues.append("%s: non-contiguous store" % op.op_id)
            if "scatter" in op.attrs.get("index", ""):
                scatter += 1
            for lane in op.attrs.get("lanes", ()):
                if lane in stores:
                    issues.append("duplicate output lane %r (%s vs %s)"
                                  % (lane, stores[lane].op_id, op.op_id))
                stores[lane] = op
        if op.kind in ("dot_segment", "dot_accum", "neon_mul", "neon_mla"):
            tid = op.tile_id
            parts = tid.split(".")
            pass_id = int(parts[0][1:])
            k = next(int(p[1:]) for p in parts if p.startswith("k"))
            dot_terms.setdefault((pass_id, k), set()).update(
                op.attrs.get("terms", ()))
        if op.kind == "permute" and op.attrs.get("idx") in WIDTH_PERMUTES:
            try:
                resolve_permute(op.attrs["idx"], vl_bits)
            except (KeyError, ValueError) as e:
                issues.append("%s: permute %s unresolved at VL=%d: %s"
                              % (op.op_id, op.attrs["idx"], vl_bits, e))
    present_passes = {lane[0] for op in ops if op.kind == "store"
                      for lane in op.attrs.get("lanes", ())}
    expected = set()
    for pass_id in present_passes:
        for r in range(32):
            for k in ALL_K:
                expected.add((pass_id, k, r))
    missing = expected - set(stores)
    if missing:
        issues.append("missing output lanes: %d (e.g. %s)"
                      % (len(missing), sorted(missing)[:3]))
    want_odd = 16
    for k in ODD_K:
        for pass_id in present_passes:
            if len(dot_terms.get((pass_id, k), ())) != want_odd:
                issues.append("odd pass%d k=%d covers %d/%d terms"
                              % (pass_id, k,
                                 len(dot_terms.get((pass_id, k), ())),
                                 want_odd))
    for k in K2_K:
        for pass_id in present_passes:
            want = 8
            if len(dot_terms.get((pass_id, k), ())) != want:
                issues.append("k2 pass%d k=%d covers %d/%d terms"
                              % (pass_id, k,
                                 len(dot_terms.get((pass_id, k), ())),
                                 want))
    for op in ops:
        if op.kind in ("neon_narrow", "neon_reduce_narrow"):
            pass_id = int(op.tile_id.split(".")[0][1:])
            want = 4 if pass_id == 1 else 11
            if op.attrs.get("shift") != want:
                issues.append("%s: shift %s at pass %d (want %d)"
                              % (op.op_id, op.attrs.get("shift"),
                                 pass_id, want))
    return {
        "op_count": len(ops),
        "store_count": len(stores),
        "expected_lanes": len(expected),
        "scatter_stores": scatter,
        "issues": issues,
        "ok": not issues,
    }
