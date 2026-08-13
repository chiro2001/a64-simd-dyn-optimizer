"""DCT16 op IR (cross-kernel migration).

Design (docs/25): lower DCT16 into the same Op DAG as DCT32 so the
rewrite engine and sequence search can be reused.

Current slices:
  - pass1 per-row upstream: leaf (load -> full-rev -> E/O SVE) + one
    lane-per-row SDOT per k + NEON bridge narrow/store. This mirrors
    `pass<shift>` / `group_block` in the grouped shared emitter and is
    the first op-backend baseline (target fused_uop 1511).
  - pass2 upstream: row-pair E/EO/EEE/EEO butterfly chain (NEON s32,
    `rowpair_block_named` without the SVE O bridge), odd k per-row
    NEON-bridge SDOT + narrow/store, even k vmul/vpadd/vrshrn path
    (`pass2_cpp("upstream")`). Target fused_uop 1511 total.
  - The legacy/odd-quarter forms (704 family) are the next slice; they
    reuse the same op kinds plus s16 legacy dot segments and packed
    quarters.
"""

from __future__ import annotations

from typing import Dict, List, Tuple

from op_ir import Op


# DCT16 k families (16x16): odd k=1..15, k2=2,6,10,14, k4=4,12, k0=0,8.
ODD_K = tuple(range(1, 16, 2))
K2_K = tuple(range(2, 16, 4))
K4_K = tuple(range(4, 16, 8))
K0_K = (0, 8)
ALL_K = tuple(range(16))

# First half of g_t16 row k (the second half is [C|C]-duplicated in the
# pass1 load and only the first 8 lanes are consumed by the narrow).
G16 = [
    [64, 64, 64, 64, 64, 64, 64, 64],
    [90, 87, 80, 70, 57, 43, 25, 9],
    [89, 75, 50, 18, -18, -50, -75, -89],
    [87, 57, 9, -43, -80, -90, -70, -25],
    [83, 36, -36, -83, -83, -36, 36, 83],
    [80, 9, -70, -87, -25, 57, 90, 43],
    [75, -18, -89, -50, 50, 89, 18, -75],
    [70, -43, -87, 9, 90, 25, -80, -57],
    [64, -64, -64, 64, 64, -64, -64, 64],
    [57, -80, -25, 90, -9, -87, 43, 70],
    [50, -89, 18, 75, -75, -18, 89, -50],
    [43, -90, 57, 25, -87, 70, 9, -80],
    [36, -83, 83, -36, -36, 83, -83, 36],
    [25, -70, 90, -80, 43, 9, -57, 87],
    [18, -50, 75, -89, 89, -75, 50, -18],
    [9, -25, 43, -57, 70, -80, 87, -90],
]

T8E = [
    [64, 64, 64, 64],
    [83, 36, 83, 36],
    [64, -64, 64, -64],
    [36, -83, 36, -83],
]

GT16_S32 = [G16[k][:4] for k in (2, 6, 10, 14)]


def lower_pass1_leaf() -> Tuple[List[Op], Dict[int, str]]:
    """First slice: DCT16 pass1 E/O leaf as an op DAG.

    Per row: load 16 s16, rev-segment TBL (reverse within each 8-lane
    half), then E = add(s, rev8(s)) and O = sub(s, rev8(s)) on the low
    8 lanes (matches the shared-leaf form in the emitter).
    """
    ops: List[Op] = []
    leaves: Dict[int, str] = {}
    n = 0

    def fresh(kind, tile, out, ins, attrs=None):
        nonlocal n
        n += 1
        op = Op("d16%04d" % n, kind, tile, out, tuple(ins),
                {"g": 0, **(attrs or {})})
        ops.append(op)
        return op

    for r in range(16):
        tid = "p1.leaf.row%d" % r
        s = fresh("load", tid, "s_%d" % r, (),
                  attrs={"base": "src", "index": "i*stride+j",
                         "elem": "s16"})
        rev = fresh("permute", tid, "rev_%d" % r, (s.out,),
                    attrs={"kind": "tbl", "idx": "rev8"})
        e = fresh("add", tid, "E_%d" % r, (s.out, rev.out),
                  attrs={"elem": "s16"})
        o = fresh("sub", tid, "O_%d" % r, (s.out, rev.out),
                  attrs={"elem": "s16"})
        leaves[r] = (e.out, o.out)
    return ops, leaves


def dct16_leaf_provenance(ops: List[Op], leaves: Dict[int, Tuple[str, str]]
                          ) -> Dict:
    """Minimal first-slice provenance: 16 E/O leaves, no scatter."""
    issues = []
    if len(leaves) != 16:
        issues.append("expected 16 rows of E/O leaves, got %d" % len(leaves))
    eo = 0
    for op in ops:
        if op.kind in ("add", "sub") and op.tile_id.startswith("p1.leaf."):
            eo += 1
        if op.kind == "store" and "scatter" in op.attrs.get("index", ""):
            issues.append("scatter store")
    if eo != 32:
        issues.append("expected 32 E/O leaf ops, got %d" % eo)
    return {"leaf_ops": eo, "rows": len(leaves), "ok": not issues,
            "issues": issues}


def lower_pass1_odd(leaves: Dict[int, Tuple[str, str]]) -> List[Op]:
    """Odd-k dot segments: one 8-term sdot per (k, row) on O leaves.

    Matches the shared-leaf form: sdot against the duplicated constant
    [C|C] yields 2 useful s64 partial lanes per row (upstream-exact pass1).
    """
    ops: List[Op] = []
    n = 0

    def fresh(out, k, r):
        nonlocal n
        n += 1
        op = Op("d16%04d" % n, "dot_segment", "p1.odd.k%d.row%d" % (k, r),
                out, (leaves[r][1],),
                {"acc_bits": 64, "lane_owner": "partial", "slice": 0,
                 "terms": tuple("G[%d][%d]" % (k, j) for j in range(8)),
                 "const_src": "C16[%d]" % k, "g": 0})
        ops.append(op)
        return op

    for k in ODD_K:
        for r in range(16):
            fresh("odd_%d_%d" % (k, r), k, r)
    return ops


def neon_pack_op(sve_out: str, tile: str, out: str = "npack") -> Op:
    """SVE->NEON bridge op (low 128-bit view of an s32 vector)."""
    return Op("d16npack", "neon_pack", tile, out, (sve_out,),
              {"g": 0, "from": "svint32_t", "to": "int32x4_t"})


def neon_reduce_narrow_op(partials, shift: int, tile: str,
                          out: str = "nnarrow") -> Op:
    """vpaddq tree + vrshrn bridge op (validated by neon_bridge_probe)."""
    return Op("d16nnarrow", "neon_reduce_narrow", tile, out,
              tuple(partials), {"g": 0, "shift": shift,
                                "from": "int32x4_t", "to": "int16x4_t"})


def dct16_pass1_provenance(ops: List[Op]) -> Dict:
    """Extend leaf provenance with odd-k dot term coverage."""
    res = dct16_leaf_provenance(
        ops, {i: ("E_%d" % i, "O_%d" % i) for i in range(16)})
    dots = {}
    for op in ops:
        if op.kind == "dot_segment" and op.tile_id.startswith("p1.odd."):
            parts = op.tile_id.split(".")
            k = int(parts[2][1:])
            r2 = int(parts[3][3:])
            dots.setdefault((k, r2), set()).update(op.attrs["terms"])
    bad = []
    for k in ODD_K:
        for row in range(16):
            if len(dots.get((k, row), ())) != 8:
                bad.append((k, row))
    res["odd_dots"] = len([o for o in ops
                           if o.kind == "dot_segment"
                           and o.tile_id.startswith("p1.odd.")])
    res["odd_ok"] = not bad
    res["issues"] = list(res["issues"]) + (
        ["odd dot term gap"] if bad else [])
    res["ok"] = res["ok"] and res["odd_ok"]
    return res


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


def lower_pass1_perrow(shift: int = 3) -> List[Op]:
    """pass1 per-row upstream: E/O leaf + one SDOT per (k, row) + bridge
    narrow, mirroring `pass<shift>`/`group_block` in
    tools/emit_dct16_sve2_shared.py.

    Op structure per 4-row group g and k:
      load z_r, permute rev16(z_r), E/O = add/sub(z_r, rev16(z_r))
      dot_segment (SVE sdot, [C|C] load, 8 useful terms) per row
      neon_pack (svget_neonq_s64) per row
      neon_reduce_narrow (vmovn+vcombine+vpaddq+vrshrn) across 4 rows
      store (NEON vst1_s16, 4 contiguous lanes)
    """
    b = _Builder("d16")

    def _g(k, j):
        return "G[%d][%d]" % (k, j)

    leaves: Dict[int, Tuple[str, str]] = {}
    for r in range(16):
        tid = "p1.leaf.row%d" % r
        z = b.new("load", tid, "z_%d" % r,
                  attrs={"arch": "sve", "elem": "s16", "row": r,
                         "half": "full", "base": "src",
                         "index": "r*stride"})
        rr = b.new("permute", tid, "rr_%d" % r, (z.out,),
                   attrs={"kind": "tbl", "idx": "rev16", "arch": "sve"})
        e = b.new("add", tid, "E_%d" % r, (z.out, rr.out),
                  attrs={"elem": "s16", "arch": "sve"})
        o = b.new("sub", tid, "O_%d" % r, (z.out, rr.out),
                  attrs={"elem": "s16", "arch": "sve"})
        leaves[r] = (e.out, o.out)
    for k in ALL_K:
        for g in range(4):
            tid = "p1.odd.k%d.g%d" % (k, g)
            rows = tuple(4 * g + m for m in range(4))
            packs = []
            for m, r in enumerate(rows):
                x = leaves[r][0 if k % 2 == 0 else 1]
                d = b.new("dot_segment", tid, "d_%d_%d" % (k, r), (x,),
                          attrs={"arch": "sve", "acc_bits": 64,
                                 "lane_owner": "partial",
                                 "terms": tuple(_g(k, j) for j in range(8)),
                                 "const_src": "C8[%d]" % k})
                np = b.new("neon_pack", tid, "np_%d_%d" % (k, r), (d.out,),
                           attrs={"from": "s64", "to": "int64x2_t"})
                packs.append(np.out)
            nn = b.new("neon_reduce_narrow", tid, "nn_%d_%d" % (k, g),
                       tuple(packs),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "16*k + 4*g",
                         "lanes": tuple((1, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
    return b.ops


def lower_pass2_upstream(shift: int = 10) -> List[Op]:
    """pass2 upstream: row-pair E/EO/EEE/EEO butterfly chain + odd k
    per-row NEON-bridge SDOT + even k vmul/vpadd/vrshrn.

    Mirrors `pass2_cpp("upstream")` op-for-op. All even-path values are
    NEON s32 4-lane; O is NEON s16 8-lane.
    """
    b = _Builder("d16")

    def _g(k, j):
        return "G[%d][%d]" % (k, j)

    # ---- row-pair butterfly chain ----
    o16: Dict[int, str] = {}     # row -> O (NEON s16 8-lane)
    eo: Dict[int, str] = {}      # row -> EO (NEON s32 4-lane)
    eee: Dict[int, str] = {}     # rowpair -> EEE (NEON s32 4-lane)
    eeo: Dict[int, str] = {}     # rowpair -> EEO
    for i in range(0, 16, 2):
        tid = "p2.leaf.rowpair%d" % (i // 2)
        s = {}
        for r in (i, i + 1):
            rtid = "p2.leaf.row%d" % r
            lo = b.new("load", rtid, "s%d_lo" % r,
                       attrs={"arch": "neon", "elem": "s16", "row": r,
                              "half": "lo", "base": "src",
                              "index": "r*line"})
            hi = b.new("load", rtid, "s%d_hi_raw" % r,
                       attrs={"arch": "neon", "elem": "s16", "row": r,
                              "half": "hi", "base": "src",
                              "index": "r*line+8"})
            hi_r = b.new("permute", rtid, "s%d_hi" % r, (hi.out,),
                         attrs={"kind": "rev16", "arch": "neon"})
            s[r] = (lo.out, hi_r.out)
        # vget_low/high + vaddl -> E00/E01/E10/E11 (s32 4-lane)
        E = {}
        for r in (i, i + 1):
            for half, tag in (("lo", "0"), ("hi", "1")):
                a = b.new("vget", "p2.leaf.row%d" % r,
                          "g%s_%d_a" % (tag, r), (s[r][0],),
                          attrs={"which": half, "elem": "s16"})
                c = b.new("vget", "p2.leaf.row%d" % r,
                          "g%s_%d_c" % (tag, r), (s[r][1],),
                          attrs={"which": half, "elem": "s16"})
                E["%s%d" % (tag, r)] = b.new(
                    "widen_add", "p2.leaf.row%d" % r,
                    "E%s_%d" % (tag, r), (a.out, c.out),
                    attrs={"elem": "s32"}).out
        for r in (i, i + 1):
            o16[r] = b.new("sub", "p2.leaf.row%d" % r, "O_%d" % r,
                           (s[r][0], s[r][1]),
                           attrs={"elem": "s16", "arch": "neon"}).out
            er = b.new("permute", "p2.leaf.row%d" % r, "Er_%d" % r,
                       (E["1%d" % r],),
                       attrs={"kind": "rev32", "arch": "neon"})
            eo[r] = b.new("sub", "p2.leaf.row%d" % r, "EO_%d" % r,
                          (E["0%d" % r], er.out),
                          attrs={"elem": "s32", "arch": "neon",
                                 "lane_owner": "partial"}).out
        ee_i = b.new("add", tid, "EE_%d" % i,
                     (E["0%d" % i],
                      b.new("permute", tid, "EEr_%d" % i, (E["1%d" % i],),
                            attrs={"kind": "rev32", "arch": "neon"}).out),
                     attrs={"elem": "s32", "arch": "neon"})
        ee_j = b.new("add", tid, "EE_%d" % (i + 1),
                     (E["0%d" % (i + 1)],
                      b.new("permute", tid, "EEr_%d" % (i + 1),
                            (E["1%d" % (i + 1)],),
                            attrs={"kind": "rev32", "arch": "neon"}).out),
                     attrs={"elem": "s32", "arch": "neon"})
        t0 = b.new("permute", tid, "t0_%d" % i, (ee_i.out, ee_j.out),
                   attrs={"kind": "zip1q", "arch": "neon"})
        z2 = b.new("permute", tid, "z2_%d" % i, (ee_i.out, ee_j.out),
                   attrs={"kind": "zip2q", "arch": "neon"})
        t1 = b.new("permute", tid, "t1_%d" % i, (z2.out,),
                   attrs={"kind": "rev64q", "arch": "neon"})
        eee[i // 2] = b.new("add", tid, "EEE_%d" % (i // 2),
                            (t0.out, t1.out),
                            attrs={"elem": "s32", "arch": "neon",
                                   "lane_owner": "partial"}).out
        eeo[i // 2] = b.new("sub", tid, "EEO_%d" % (i // 2),
                            (t0.out, t1.out),
                            attrs={"elem": "s32", "arch": "neon",
                                   "lane_owner": "partial"}).out
    # ---- odd k + even k per 4-row group ----
    for g in range(4):
        tidg = "p2.g%d" % g
        rows = tuple(4 * g + m for m in range(4))
        for k in ODD_K:
            tid = "p2.odd.k%d.g%d" % (k, g)
            ck = b.new("load", tid, "ck_%d_%d" % (k, g),
                       attrs={"arch": "neon-const", "elem": "s16",
                              "const": "GT16[%d]" % k})
            dots = []
            for r in rows:
                dots.append(b.new("dot_segment", tid, "t_%d_%d" % (k, r),
                                  (o16[r],),
                                  attrs={"arch": "neon-bridge",
                                         "acc_bits": 64,
                                         "lane_owner": "partial",
                                         "terms": tuple(_g(k, j)
                                                        for j in range(8)),
                                         "const_src": "GT16[%d]" % k,
                                         "ck_in": ck.out}).out)
            nn = b.new("neon_reduce_narrow", tid, "nn_%d_%d" % (k, g),
                       tuple(dots),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "16*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        # k2 (2,6,10,14): 4x vmul + vpadd tree + vrshrn
        for k in K2_K:
            tid = "p2.k2.k%d.g%d" % (k, g)
            cexpr = "GT16_S32[%d]" % ((k - 2) // 4)
            c0 = b.new("load", tid, "c0_%d_%d" % (k, g),
                       attrs={"arch": "neon-const", "elem": "s32",
                              "const": cexpr})
            ms = []
            for r in rows:
                ms.append(b.new("neon_mul", tid, "m_%d_%d" % (k, r),
                                (eo[r],),
                                attrs={"const_src": cexpr}).out)
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
                         "index": "16*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        # k0/4/8/12 from EEE/EEO rowpair values
        for k, fam, use_eee in ((0, 0, True), (4, 1, False),
                                (8, 2, True), (12, 3, False)):
            tid = "p2.k%d.k%d.g%d" % (k, fam, g)
            src = eee if use_eee else eeo
            pa, pb = 2 * g, 2 * g + 1   # rowpair indices for rows 4g..4g+3
            ck = b.new("load", tid, "c_%d_%d_%d" % (k, fam, g),
                       attrs={"arch": "neon-const", "elem": "s32",
                              "const": "T8E[%d]" % fam})
            if k == 0:
                pp = b.new("neon_padd", tid, "pp_%d_%d" % (k, g),
                           (src[pa], src[pb]), attrs={}).out
                m = b.new("neon_mul", tid, "m_%d_%d" % (k, g), (pp,),
                          attrs={"const_src": "T8E[%d]" % fam}).out
            else:
                m0 = b.new("neon_mul", tid, "m0_%d_%d" % (k, g),
                           (src[pa],),
                           attrs={"const_src": "T8E[%d]" % fam}).out
                m1 = b.new("neon_mul", tid, "m1_%d_%d" % (k, g),
                           (src[pb],),
                           attrs={"const_src": "T8E[%d]" % fam}).out
                m = b.new("neon_padd", tid, "m_%d_%d" % (k, g),
                          (m0, m1), attrs={}).out
            nn = b.new("neon_narrow", tid, "nn_%d_%d" % (k, g), (m,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "16*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
    return b.ops


def lower_pass2_odd_quarter(pack_zip: bool = True,
                            store_merge16: bool = True,
                            k_tile: int = 1, shift: int = 10) -> List[Op]:
    """pass2 odd-quarter (upstream even path, `narrow_merge=1`):
    rowpair E/EO/EEE/EEO butterfly + SVE zO quarters (zip pack) + odd k
    chained SDOT with merged narrow + per-group NEON even path.

    Mirrors `pass2_odd_quarter_interleaved(legacy=0, even_sve=0,
    store_merge16=store_merge16, pass2_pack_zip=int(pack_zip))`.
    """
    b = _Builder("d16")

    def _g(k, j):
        return "G[%d][%d]" % (k, j)

    # ---- rowpair butterfly (SVE loads + NEON s32 chain) ----
    zO: Dict[int, str] = {}
    eo: Dict[int, str] = {}
    eee: Dict[int, str] = {}
    eeo: Dict[int, str] = {}
    qo0: Dict[int, str] = {}
    qo1: Dict[int, str] = {}
    for i in range(0, 16, 2):
        tid = "p2.leaf.rowpair%d" % (i // 2)
        z, r = {}, {}
        E = {}
        for r0 in (i, i + 1):
            rtid = "p2.leaf.row%d" % r0
            z[r0] = b.new("load", rtid, "z_%d" % r0,
                          attrs={"arch": "sve", "elem": "s16", "row": r0,
                                 "half": "full", "base": "src",
                                 "index": "r*line"}).out
            r[r0] = b.new("permute", rtid, "r_%d" % r0, (z[r0],),
                          attrs={"kind": "rev_sve", "arch": "sve"}).out
            zO[r0] = b.new("sub", rtid, "zO_%d" % r0, (z[r0], r[r0]),
                           attrs={"elem": "s16", "arch": "sve"}).out
            lo_n = b.new("neon_pack", rtid, "nlo_%d" % r0, (z[r0],),
                         attrs={"from": "s16", "to": "int16x8_t"}).out
            hi_n = b.new("neon_pack", rtid, "nhi_%d" % r0, (r[r0],),
                         attrs={"from": "s16", "to": "int16x8_t"}).out
            for half, tag in (("lo", "0"), ("hi", "1")):
                a = b.new("vget", rtid, "g%s_%d_a" % (tag, r0),
                          (lo_n,), attrs={"which": half, "elem": "s16"})
                c = b.new("vget", rtid, "g%s_%d_c" % (tag, r0),
                          (hi_n,), attrs={"which": half, "elem": "s16"})
                E["%s%d" % (tag, r0)] = b.new(
                    "widen_add", rtid, "E%s_%d" % (tag, r0),
                    (a.out, c.out), attrs={"elem": "s32"}).out
            er = b.new("permute", rtid, "Er_%d" % r0, (E["1%d" % r0],),
                       attrs={"kind": "rev32", "arch": "neon"})
            eo[r0] = b.new("sub", rtid, "EO_%d" % r0,
                           (E["0%d" % r0], er.out),
                           attrs={"elem": "s32", "arch": "neon",
                                  "lane_owner": "partial"}).out
        ee_i = b.new("add", tid, "EE_%d" % i,
                     (E["0%d" % i],
                      b.new("permute", tid, "EEr_%d" % i, (E["1%d" % i],),
                            attrs={"kind": "rev32", "arch": "neon"}).out),
                     attrs={"elem": "s32", "arch": "neon"})
        ee_j = b.new("add", tid, "EE_%d" % (i + 1),
                     (E["0%d" % (i + 1)],
                      b.new("permute", tid, "EEr_%d" % (i + 1),
                            (E["1%d" % (i + 1)],),
                            attrs={"kind": "rev32", "arch": "neon"}).out),
                     attrs={"elem": "s32", "arch": "neon"})
        t0 = b.new("permute", tid, "t0_%d" % i, (ee_i.out, ee_j.out),
                   attrs={"kind": "zip1q", "arch": "neon"})
        z2 = b.new("permute", tid, "z2_%d" % i, (ee_i.out, ee_j.out),
                   attrs={"kind": "zip2q", "arch": "neon"})
        t1 = b.new("permute", tid, "t1_%d" % i, (z2.out,),
                   attrs={"kind": "rev64q", "arch": "neon"})
        eee[i // 2] = b.new("add", tid, "EEE_%d" % (i // 2),
                            (t0.out, t1.out),
                            attrs={"elem": "s32", "arch": "neon",
                                   "lane_owner": "partial"}).out
        eeo[i // 2] = b.new("sub", tid, "EEO_%d" % (i // 2),
                            (t0.out, t1.out),
                            attrs={"elem": "s32", "arch": "neon",
                                   "lane_owner": "partial"}).out
    # ---- quarter packs (zip or tbl2 variant) ----
    for g in range(4):
        tid = "p2.pack.g%d" % g
        base = 4 * g
        if not pack_zip:
            po01 = b.new("permute", tid, "PO01_%d" % g,
                         (zO[base], zO[base + 1]),
                         attrs={"kind": "tbl2", "idx": "iloq",
                                "arch": "sve"})
            po23 = b.new("permute", tid, "PO23_%d" % g,
                         (zO[base + 2], zO[base + 3]),
                         attrs={"kind": "tbl2", "idx": "iloq",
                                "arch": "sve"})
            qo0[g] = b.new("permute", tid, "QO0_%d" % g,
                           (po01.out, po23.out),
                           attrs={"kind": "tbl2", "idx": "q0q",
                                  "arch": "sve"}).out
            qo1[g] = b.new("permute", tid, "QO1_%d" % g,
                           (po01.out, po23.out),
                           attrs={"kind": "tbl2", "idx": "q1q",
                                  "arch": "sve"}).out
            continue
        a = {}
        for m in range(4):
            a[m] = b.new("permute", tid, "pa%d_%d" % (m, g),
                         (zO[base + m],),
                         attrs={"kind": "view_s64", "arch": "sve"}).out
        t = []
        t.append(b.new("permute", tid, "pt0_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt1_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt2_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt3_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        p0 = b.new("permute", tid, "pp0_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip1d", "arch": "sve"}).out
        p1 = b.new("permute", tid, "pp1_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip2d", "arch": "sve"}).out
        qo0[g] = b.new("permute", tid, "QO0_%d" % g, (p0,),
                       attrs={"kind": "view_s16", "arch": "sve"}).out
        qo1[g] = b.new("permute", tid, "QO1_%d" % g, (p1,),
                       attrs={"kind": "view_s16", "arch": "sve"}).out
    # ---- per-group even NEON path (k2/k0/k4/k8/k12) ----
    for g in range(4):
        tid = "p2.g%d" % g
        rows = tuple(4 * g + m for m in range(4))
        for k in K2_K:
            ktid = "p2.k2.k%d.g%d" % (k, g)
            cexpr = "GT16_S32[%d]" % ((k - 2) // 4)
            b.new("load", ktid, "c0_%d_%d" % (k, g),
                  attrs={"arch": "neon-const", "elem": "s32",
                         "const": cexpr})
            ms = []
            for r in rows:
                ms.append(b.new("neon_mul", ktid, "m_%d_%d" % (k, r),
                                (eo[r],),
                                attrs={"const_src": cexpr}).out)
            t01 = b.new("neon_padd", ktid, "t01_%d_%d" % (k, g),
                        (ms[0], ms[1]), attrs={}).out
            t23 = b.new("neon_padd", ktid, "t23_%d_%d" % (k, g),
                        (ms[2], ms[3]), attrs={}).out
            tt = b.new("neon_padd", ktid, "t_%d_%d" % (k, g),
                       (t01, t23), attrs={}).out
            nn = b.new("neon_narrow", ktid, "nn_%d_%d" % (k, g), (tt,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", ktid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "16*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
        for k, fam, use_eee in ((0, 0, True), (4, 1, False),
                                (8, 2, True), (12, 3, False)):
            ktid = "p2.k%d.k%d.g%d" % (k, fam, g)
            src = eee if use_eee else eeo
            pa, pb = 2 * g, 2 * g + 1
            cexpr = "T8E[%d]" % fam
            b.new("load", ktid, "c_%d_%d_%d" % (k, fam, g),
                  attrs={"arch": "neon-const", "elem": "s32",
                         "const": cexpr})
            if k == 0:
                pp = b.new("neon_padd", ktid, "pp_%d_%d" % (k, g),
                           (src[pa], src[pb]), attrs={}).out
                m = b.new("neon_mul", ktid, "m_%d_%d" % (k, g), (pp,),
                          attrs={"const_src": cexpr}).out
            else:
                m0 = b.new("neon_mul", ktid, "m0_%d_%d" % (k, g),
                           (src[pa],), attrs={"const_src": cexpr}).out
                m1 = b.new("neon_mul", ktid, "m1_%d_%d" % (k, g),
                           (src[pb],), attrs={"const_src": cexpr}).out
                m = b.new("neon_padd", ktid, "m_%d_%d" % (k, g),
                          (m0, m1), attrs={}).out
            nn = b.new("neon_narrow", ktid, "nn_%d_%d" % (k, g), (m,),
                       attrs={"shift": shift, "mode": "rshrn"})
            b.new("store", ktid, "", (nn.out,),
                  attrs={"arch": "neon", "base": "dst",
                         "index": "16*k + 4*g",
                         "lanes": tuple((2, k, r) for r in rows),
                         "topology": "contiguous", "n_lanes": 4})
    # ---- odd k loop: chained SDOT per group + merged narrow ----
    for kb in range(1, 16, 2 * k_tile):
        for t in range(k_tile):
            k = kb + 2 * t
            tid = "p2.odd.k%d" % k
            clo = "CQ_LO[%d]" % k
            chi = "CQ_HI[%d]" % k
            b.new("load", tid, "clo_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16",
                         "const": clo})
            b.new("load", tid, "chi_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16",
                         "const": chi})
            dots = []
            for g in range(4):
                d0 = b.new("dot_segment", "p2.odd.k%d.g%d" % (k, g),
                           "d0_%d_%d" % (k, g), (qo0[g],),
                           attrs={"arch": "sve", "acc_bits": 64,
                                  "lane_owner": "output",
                                  "terms": tuple(_g(k, j) for j in range(4)),
                                  "const_src": clo})
                d1 = b.new("dot_accum", "p2.odd.k%d.g%d" % (k, g),
                           "d1_%d_%d" % (k, g), (d0.out, qo1[g]),
                           attrs={"acc_bits": 64,
                                  "terms": tuple(_g(k, 4 + j)
                                                 for j in range(4)),
                                  "const_src": chi})
                dots.append(d1.out)
            if store_merge16:
                nn = b.new("narrow16", tid, "nn_%d" % k, tuple(dots),
                           attrs={"shift": shift, "mode": "rshrn"})
                b.new("store", tid, "", (nn.out,),
                      attrs={"arch": "sve", "base": "dst",
                             "index": "16*k",
                             "lanes": tuple((2, k, r) for r in range(16)),
                             "topology": "contiguous", "n_lanes": 16})
            else:
                for g0 in (0, 2):
                    nn = b.new("narrow8", tid, "nn_%d_%d" % (k, g0),
                               (dots[g0], dots[g0 + 1]),
                               attrs={"shift": shift, "mode": "rshrn"})
                    b.new("store", tid, "", (nn.out,),
                          attrs={"arch": "sve", "base": "dst",
                                 "index": "16*k + %d" % (4 * g0),
                                 "lanes": tuple((2, k, r)
                                                for r in range(4 * g0,
                                                               4 * g0 + 8)),
                                 "topology": "contiguous", "n_lanes": 8})
    return b.ops


def lower_pass1_quarter(k_tile: int = 4, pack_zip: bool = True,
                        even_factor: bool = True,
                        narrow_merge: bool = True,
                        shift: int = 3) -> List[Op]:
    """pass1 quarter-interleaved (v3, `quarter_pass_cpp`): 4-row groups
    packed into QE0/QE1/QO0/QO1 (zip variant), optional EEF/EOF even
    factoring, even k dots on EEF/EOF (CQ_LO only), odd k chained SDOT on
    QO/QE (CQ_LO+CQ_HI), merged 8-lane narrow/store.
    """
    b = _Builder("d16")

    def _g(k, j):
        return "G[%d][%d]" % (k, j)

    qe0: Dict[int, str] = {}
    qe1: Dict[int, str] = {}
    qo0: Dict[int, str] = {}
    qo1: Dict[int, str] = {}
    eef: Dict[int, str] = {}
    eof: Dict[int, str] = {}
    for g in range(4):
        tid = "p1.pack.g%d" % g
        base = 4 * g
        z = {}
        for m in range(4):
            z[m] = b.new("load", tid, "z_%d" % (base + m),
                         attrs={"arch": "sve", "elem": "s16",
                                "row": base + m, "half": "full",
                                "base": "src", "index": "r*stride"}).out
        a = {}
        for m in range(4):
            a[m] = b.new("permute", tid, "pa%d_%d" % (m, g), (z[m],),
                         attrs={"kind": "view_s64", "arch": "sve"}).out
        t = []
        t.append(b.new("permute", tid, "pt0_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt1_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt2_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt3_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        p0 = b.new("permute", tid, "pp0_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip1d", "arch": "sve"}).out
        p1 = b.new("permute", tid, "pp1_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip2d", "arch": "sve"}).out
        p2 = b.new("permute", tid, "pp2_%d" % g, (t[1], t[3]),
                   attrs={"kind": "zip1d", "arch": "sve"}).out
        p3 = b.new("permute", tid, "pp3_%d" % g, (t[1], t[3]),
                   attrs={"kind": "zip2d", "arch": "sve"}).out
        q0 = b.new("permute", tid, "q0_%d" % g, (p0,),
                   attrs={"kind": "view_s16", "arch": "sve"}).out
        q1 = b.new("permute", tid, "q1_%d" % g, (p1,),
                   attrs={"kind": "view_s16", "arch": "sve"}).out
        q2 = b.new("permute", tid, "q2_%d" % g,
                   (b.new("permute", tid, "v2_%d" % g, (p2,),
                          attrs={"kind": "view_s16", "arch": "sve"}).out,),
                   attrs={"kind": "revh_d", "arch": "sve"}).out
        q3 = b.new("permute", tid, "q3_%d" % g,
                   (b.new("permute", tid, "v3_%d" % g, (p3,),
                          attrs={"kind": "view_s16", "arch": "sve"}).out,),
                   attrs={"kind": "revh_d", "arch": "sve"}).out
        qo0[g] = b.new("sub", tid, "QO0_%d" % g, (q0, q3),
                       attrs={"elem": "s16", "arch": "sve"}).out
        qo1[g] = b.new("sub", tid, "QO1_%d" % g, (q1, q2),
                       attrs={"elem": "s16", "arch": "sve"}).out
        qe0[g] = b.new("add", tid, "QE0_%d" % g, (q0, q3),
                       attrs={"elem": "s16", "arch": "sve"}).out
        qe1[g] = b.new("add", tid, "QE1_%d" % g, (q1, q2),
                       attrs={"elem": "s16", "arch": "sve"}).out
        if even_factor:
            qr1 = b.new("permute", tid, "QR1_%d" % g, (qe1[g],),
                        attrs={"kind": "revh_d", "arch": "sve"})
            eef[g] = b.new("add", tid, "EEF_%d" % g, (qe0[g], qr1.out),
                           attrs={"elem": "s16", "arch": "sve"}).out
            eof[g] = b.new("sub", tid, "EOF_%d" % g, (qe0[g], qr1.out),
                           attrs={"elem": "s16", "arch": "sve"}).out

    def merged_stores(k: int, dots: List[str], tid: str) -> None:
        if narrow_merge:
            for g0 in (0, 2):
                nn = b.new("narrow8", tid, "nn_%d_%d" % (k, g0),
                           (dots[g0], dots[g0 + 1]),
                           attrs={"shift": shift, "mode": "rshrn"})
                b.new("store", tid, "", (nn.out,),
                      attrs={"arch": "sve", "base": "dst",
                             "index": "16*k + %d" % (4 * g0),
                             "lanes": tuple((1, k, r)
                                            for r in range(4 * g0,
                                                           4 * g0 + 8)),
                             "topology": "contiguous", "n_lanes": 8})
        else:
            for g in range(4):
                nn = b.new("narrow4", tid, "nn_%d_%d" % (k, g), (dots[g],),
                           attrs={"shift": shift, "mode": "rshrn"})
                b.new("store", tid, "", (nn.out,),
                      attrs={"arch": "sve", "base": "dst",
                             "index": "16*k + %d" % (4 * g),
                             "lanes": tuple((1, k, r)
                                            for r in range(4 * g, 4 * g + 4)),
                             "topology": "contiguous", "n_lanes": 4})

    def even_pair_loop(kb, fam):
        for k in range(kb, 16, 4):
            tid = "p1.even.k%d" % k
            clo = "CQ_LO[%d]" % k
            b.new("load", tid, "clo_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16", "const": clo})
            dots = []
            for g in range(4):
                dots.append(b.new(
                    "dot_segment", "p1.even.k%d.g%d" % (k, g),
                    "d_%d_%d" % (k, g), (fam[g],),
                    attrs={"arch": "sve", "acc_bits": 64,
                           "lane_owner": "output",
                           "terms": tuple(_g(k, j) for j in range(4)),
                           "const_src": clo}).out)
            merged_stores(k, dots, tid)

    def all_k_loop():
        for kb in range(0, 16, k_tile):
            for t in range(k_tile):
                k = kb + t
                tid = "p1.odd.k%d" % k
                clo = "CQ_LO[%d]" % k
                chi = "CQ_HI[%d]" % k
                b.new("load", tid, "clo_%d" % k,
                      attrs={"arch": "sve-const", "elem": "s16",
                             "const": clo})
                b.new("load", tid, "chi_%d" % k,
                      attrs={"arch": "sve-const", "elem": "s16",
                             "const": chi})
                dots = []
                for g in range(4):
                    x0 = qo0[g] if k % 2 else qe0[g]
                    x1 = qo1[g] if k % 2 else qe1[g]
                    d0 = b.new("dot_segment", "p1.odd.k%d.g%d" % (k, g),
                               "d0_%d_%d" % (k, g), (x0,),
                               attrs={"arch": "sve", "acc_bits": 64,
                                      "lane_owner": "output",
                                      "terms": tuple(_g(k, j)
                                                     for j in range(4)),
                                      "const_src": clo})
                    d1 = b.new("dot_accum", "p1.odd.k%d.g%d" % (k, g),
                               "d1_%d_%d" % (k, g), (d0.out, x1),
                               attrs={"acc_bits": 64,
                                      "terms": tuple(_g(k, 4 + j)
                                                     for j in range(4)),
                                      "const_src": chi})
                    dots.append(d1.out)
                merged_stores(k, dots, tid)

    if even_factor:
        even_pair_loop(0, eef)
        even_pair_loop(2, eof)
        odd_kb = range(1, 16, 2 * k_tile)
        odd_t = range(k_tile)
        for kb in odd_kb:
            for t in odd_t:
                k = kb + 2 * t
                tid = "p1.odd.k%d" % k
                clo = "CQ_LO[%d]" % k
                chi = "CQ_HI[%d]" % k
                b.new("load", tid, "clo_%d" % k,
                      attrs={"arch": "sve-const", "elem": "s16",
                             "const": clo})
                b.new("load", tid, "chi_%d" % k,
                      attrs={"arch": "sve-const", "elem": "s16",
                             "const": chi})
                dots = []
                for g in range(4):
                    d0 = b.new("dot_segment", "p1.odd.k%d.g%d" % (k, g),
                               "d0_%d_%d" % (k, g), (qo0[g],),
                               attrs={"arch": "sve", "acc_bits": 64,
                                      "lane_owner": "output",
                                      "terms": tuple(_g(k, j)
                                                     for j in range(4)),
                                      "const_src": clo})
                    d1 = b.new("dot_accum", "p1.odd.k%d.g%d" % (k, g),
                               "d1_%d_%d" % (k, g), (d0.out, qo1[g]),
                               attrs={"acc_bits": 64,
                                      "terms": tuple(_g(k, 4 + j)
                                                     for j in range(4)),
                                      "const_src": chi})
                    dots.append(d1.out)
                merged_stores(k, dots, tid)
    else:
        all_k_loop()
    return b.ops


def lower_pass2_odd_quarter_legacy_even_sve(k_tile: int = 2,
                                            store_merge16: bool = True,
                                            shift: int = 10) -> List[Op]:
    """pass2 odd-quarter legacy + even_sve (the 704 family):
    `sve_even_group_block(g, legacy=1)` per group (zip quarters + QEOW +
    EEp/EOp mul/addp + rshrn + scatter store for k=0/4/8/12), odd k
    chained SDOT on QO packs, then legacy QEOW SDOT loop for
    k=2/6/10/14 (single const, merged narrow).
    """
    b = _Builder("d16")

    def _g(k, j):
        return "G[%d][%d]" % (k, j)

    qo0: Dict[int, str] = {}
    qo1: Dict[int, str] = {}
    qeow: Dict[int, str] = {}
    for g in range(4):
        tid = "p2.evensve.g%d" % g
        base = 4 * g
        z = {}
        for m in range(4):
            z[m] = b.new("load", tid, "z_%d" % (base + m),
                         attrs={"arch": "sve", "elem": "s16",
                                "row": base + m, "half": "full",
                                "base": "src", "index": "r*line"}).out
        a = {}
        for m in range(4):
            a[m] = b.new("permute", tid, "pa%d_%d" % (m, g), (z[m],),
                         attrs={"kind": "view_s64", "arch": "sve"}).out
        t = []
        t.append(b.new("permute", tid, "pt0_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt1_%d" % g, (a[0], a[2]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt2_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip1d", "arch": "sve"}).out)
        t.append(b.new("permute", tid, "pt3_%d" % g, (a[1], a[3]),
                       attrs={"kind": "zip2d", "arch": "sve"}).out)
        p0 = b.new("permute", tid, "pp0_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip1d", "arch": "sve"}).out
        p1 = b.new("permute", tid, "pp1_%d" % g, (t[0], t[2]),
                   attrs={"kind": "zip2d", "arch": "sve"}).out
        p2 = b.new("permute", tid, "pp2_%d" % g, (t[1], t[3]),
                   attrs={"kind": "zip1d", "arch": "sve"}).out
        p3 = b.new("permute", tid, "pp3_%d" % g, (t[1], t[3]),
                   attrs={"kind": "zip2d", "arch": "sve"}).out
        q0 = b.new("permute", tid, "q0_%d" % g, (p0,),
                   attrs={"kind": "view_s16", "arch": "sve"}).out
        q1 = b.new("permute", tid, "q1_%d" % g, (p1,),
                   attrs={"kind": "view_s16", "arch": "sve"}).out
        q2 = b.new("permute", tid, "q2_%d" % g,
                   (b.new("permute", tid, "v2_%d" % g, (p2,),
                          attrs={"kind": "view_s16", "arch": "sve"}).out,),
                   attrs={"kind": "revh_d", "arch": "sve"}).out
        q3 = b.new("permute", tid, "q3_%d" % g,
                   (b.new("permute", tid, "v3_%d" % g, (p3,),
                          attrs={"kind": "view_s16", "arch": "sve"}).out,),
                   attrs={"kind": "revh_d", "arch": "sve"}).out
        qo0[g] = b.new("sub", tid, "QO0_%d" % g, (q0, q3),
                       attrs={"elem": "s16", "arch": "sve"}).out
        qo1[g] = b.new("sub", tid, "QO1_%d" % g, (q1, q2),
                       attrs={"elem": "s16", "arch": "sve"}).out
        # widening adds -> s32 pairs
        e = []
        e.append(b.new("widen_add_sve", tid, "e0_%d" % g, (q0, q3),
                       attrs={"kind": "lb"}).out)
        e.append(b.new("widen_add_sve", tid, "e1_%d" % g, (q0, q3),
                       attrs={"kind": "lt"}).out)
        e.append(b.new("widen_add_sve", tid, "e2_%d" % g, (q1, q2),
                       attrs={"kind": "lb"}).out)
        e.append(b.new("widen_add_sve", tid, "e3_%d" % g, (q1, q2),
                       attrs={"kind": "lt"}).out)
        w0 = b.new("permute", tid, "w0_%d" % g, (e[0], e[1]),
                   attrs={"kind": "zip1s", "arch": "sve"}).out
        w1 = b.new("permute", tid, "w1_%d" % g, (e[0], e[1]),
                   attrs={"kind": "zip2s", "arch": "sve"}).out
        u2 = b.new("permute", tid, "u2_%d" % g, (e[2],),
                   attrs={"kind": "revw_d32", "arch": "sve"}).out
        u3 = b.new("permute", tid, "u3_%d" % g, (e[3],),
                   attrs={"kind": "revw_d32", "arch": "sve"}).out
        w2 = b.new("permute", tid, "w2_%d" % g, (u3, u2),
                   attrs={"kind": "zip1s", "arch": "sve"}).out
        w3 = b.new("permute", tid, "w3_%d" % g, (u3, u2),
                   attrs={"kind": "zip2s", "arch": "sve"}).out
        s0 = b.new("sub", tid, "s0_%d" % g, (w0, w2),
                   attrs={"elem": "s32", "arch": "sve"}).out
        s1 = b.new("sub", tid, "s1_%d" % g, (w1, w3),
                   attrs={"elem": "s32", "arch": "sve"}).out
        s2 = b.new("add", tid, "s2_%d" % g, (w0, w2),
                   attrs={"elem": "s32", "arch": "sve"}).out
        s3 = b.new("add", tid, "s3_%d" % g, (w1, w3),
                   attrs={"elem": "s32", "arch": "sve"}).out
        qeow[g] = b.new("permute", tid, "QEOW_%d" % g, (s0, s1),
                        attrs={"kind": "uzp1_wide", "arch": "sve"}).out
        v0 = b.new("permute", tid, "v0_%d" % g, (s2, s3),
                   attrs={"kind": "uzp1d", "arch": "sve"}).out
        v1 = b.new("permute", tid, "v1_%d" % g, (s2, s3),
                   attrs={"kind": "uzp2d", "arch": "sve"}).out
        v1r = b.new("permute", tid, "v1r_%d" % g, (v1,),
                    attrs={"kind": "revw_d64", "arch": "sve"}).out
        eep = b.new("add", tid, "EEp_%d" % g, (v0, v1r),
                    attrs={"elem": "s32", "arch": "sve", "view": "s64"}).out
        eop = b.new("sub", tid, "EOp_%d" % g, (v0, v1r),
                    attrs={"elem": "s32", "arch": "sve", "view": "s64"}).out
        m = []
        for i, (src, cexpr) in enumerate(
                ((eep, "T8E8[0]"), (eop, "T8E8[1]"),
                 (eep, "T8E8[2]"), (eop, "T8E8[3]"))):
            c = b.new("load", tid, "ct_%d_%d" % (i, g),
                      attrs={"arch": "sve-const", "elem": "s32",
                             "const": cexpr})
            m.append(b.new("mul", tid, "m%d_%d" % (i, g), (src,),
                           attrs={"elem": "s32", "arch": "sve",
                                  "const_src": cexpr}).out)
        pa = b.new("addp32", tid, "pa_%d" % g, (m[0], m[2]), attrs={}).out
        pb = b.new("addp32", tid, "pb_%d" % g, (m[1], m[3]), attrs={}).out
        xa = b.new("permute", tid, "xa_%d" % g, (pa, pb),
                   attrs={"kind": "uzp1s", "arch": "sve"}).out
        xb = b.new("permute", tid, "xb_%d" % g, (pa, pb),
                   attrs={"kind": "uzp2s", "arch": "sve"}).out
        na = b.new("narrow4_sve", tid, "na_%d" % g, (xa,),
                   attrs={"shift": shift, "mode": "rshrn"}).out
        nb = b.new("narrow4_sve", tid, "nb_%d" % g, (xb,),
                   attrs={"shift": shift, "mode": "rshrn"}).out
        n16 = b.new("permute", tid, "n16_%d" % g, (na, nb),
                    attrs={"kind": "uzp1_wide", "arch": "sve",
                           "inputs_s16": True}).out
        b.new("store", tid, "", (n16,),
              attrs={"arch": "sve-scatter", "base": "dst",
                     "index": "scatter 4*g",
                     "lanes": tuple((2, k, 4 * g + j)
                                    for k in (0, 4, 8, 12)
                                    for j in range(4)),
                     "topology": "scatter", "n_lanes": 4,
                     "evoffs": "EVEN_OFFS"})
    # odd k loop (chained SDOT, merged narrow16)
    for kb in range(1, 16, 2 * k_tile):
        for t in range(k_tile):
            k = kb + 2 * t
            tid = "p2.odd.k%d" % k
            clo = "CQ_LO[%d]" % k
            chi = "CQ_HI[%d]" % k
            b.new("load", tid, "clo_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16", "const": clo})
            b.new("load", tid, "chi_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16", "const": chi})
            dots = []
            for g in range(4):
                d0 = b.new("dot_segment", "p2.odd.k%d.g%d" % (k, g),
                           "d0_%d_%d" % (k, g), (qo0[g],),
                           attrs={"arch": "sve", "acc_bits": 64,
                                  "lane_owner": "output",
                                  "terms": tuple(_g(k, j) for j in range(4)),
                                  "const_src": clo})
                d1 = b.new("dot_accum", "p2.odd.k%d.g%d" % (k, g),
                           "d1_%d_%d" % (k, g), (d0.out, qo1[g]),
                           attrs={"acc_bits": 64,
                                  "terms": tuple(_g(k, 4 + j)
                                                 for j in range(4)),
                                  "const_src": chi})
                dots.append(d1.out)
            nn = b.new("narrow16", tid, "nn_%d" % k, tuple(dots),
                       attrs={"shift": shift, "mode": "qrshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "sve", "base": "dst", "index": "16*k",
                         "lanes": tuple((2, k, r) for r in range(16)),
                         "topology": "contiguous", "n_lanes": 16})
    # legacy even k = 2,6,10,14 via QEOW (single const sdot)
    for kb in range(2, 16, 4 * k_tile):
        for t in range(k_tile):
            k = kb + 4 * t
            tid = "p2.legacy.k%d" % k
            clo = "CQ_LO[%d]" % k
            b.new("load", tid, "clo_%d" % k,
                  attrs={"arch": "sve-const", "elem": "s16", "const": clo})
            dots = []
            for g in range(4):
                dots.append(b.new(
                    "dot_segment", "p2.legacy.k%d.g%d" % (k, g),
                    "d_%d_%d" % (k, g), (qeow[g],),
                    attrs={"arch": "sve", "acc_bits": 64,
                           "lane_owner": "output",
                           "terms": tuple(_g(k, j) for j in range(8)),
                           "const_src": clo}).out)
            nn = b.new("narrow16", tid, "nn_%d" % k, tuple(dots),
                       attrs={"shift": shift, "mode": "qrshrn"})
            b.new("store", tid, "", (nn.out,),
                  attrs={"arch": "sve", "base": "dst", "index": "16*k",
                         "lanes": tuple((2, k, r) for r in range(16)),
                         "topology": "contiguous", "n_lanes": 16})
    return b.ops


def dct16_upstream_provenance(ops: List[Op]) -> Dict:
    """Full upstream pass1+pass2 output-lane coverage + dot-term and
    round-epoch checks (analogous to dct32 provenance_report)."""
    issues: List[str] = []
    stores: Dict[Tuple[int, int, int], Op] = {}
    dot_terms: Dict[Tuple[int, int], set] = {}
    scatter = 0
    for op in ops:
        if op.kind == "store":
            topo = op.attrs.get("topology")
            if topo == "scatter":
                scatter += 1
            elif topo != "contiguous":
                issues.append("%s: non-contiguous store" % op.op_id)
            if topo == "contiguous" and "scatter" in op.attrs.get(
                    "index", ""):
                issues.append("%s: scatter store" % op.op_id)
            for lane in op.attrs.get("lanes", ()):
                if lane in stores:
                    issues.append("duplicate output lane %r (%s vs %s)"
                                  % (lane, stores[lane].op_id, op.op_id))
                stores[lane] = op
        if op.kind == "dot_segment":
            tid = op.tile_id
            parts = tid.split(".")
            pass_id = int(parts[0][1:])
            # tile shape: p<pass>.odd.k<k>.g<g> (or p<pass>.<fam>.k<k>...)
            k = next(int(p[1:]) for p in parts if p.startswith("k"))
            dot_terms.setdefault((pass_id, k), set()).update(
                op.attrs.get("terms", ()))
        if op.kind == "dot_accum":
            tid = op.tile_id
            parts = tid.split(".")
            pass_id = int(parts[0][1:])
            k = next(int(p[1:]) for p in parts if p.startswith("k"))
            dot_terms.setdefault((pass_id, k), set()).update(
                op.attrs.get("terms", ()))
    expected = set()
    for pass_id in (1, 2):
        for r in range(16):
            for k in ALL_K:
                expected.add((pass_id, k, r))
    missing = expected - set(stores)
    if missing:
        issues.append("missing output lanes: %d (e.g. %s)"
                      % (len(missing), sorted(missing)[:3]))
    for k in ALL_K:
        terms = dot_terms.get((1, k), ())
        want = 8 if k % 2 == 1 else 4   # even k may use EEF/EOF (CQ_LO)
        if len(terms) < want:
            issues.append("pass1 k=%d covers %d/%d terms"
                          % (k, len(terms), want))
        terms = dot_terms.get((2, k), ())
        if k in ODD_K and len(terms) != 8:
            issues.append("pass2 odd k=%d covers %d/8 terms"
                          % (k, len(terms)))
    for op in ops:
        if op.kind == "neon_narrow" or (
                op.kind == "neon_reduce_narrow"):
            pass_id = int(op.tile_id.split(".")[0][1:])
            want = 3 if pass_id == 1 else 10
            if op.attrs.get("shift") != want:
                issues.append("%s: shift %s at pass %d (want %d)"
                              % (op.op_id, op.attrs.get("shift"),
                                 pass_id, want))
    return {
        "op_count": len(ops),
        "store_count": len(stores),
        "expected_lanes": len(expected),
        "coverage": len(stores) / len(expected) if expected else 0.0,
        "scatter_stores": scatter,
        "issues": issues,
        "ok": not issues,
    }


def dct16_constants() -> Dict[str, object]:
    """DCT16 butterfly/constant metadata consumed by the lowering."""
    return {
        "n": 16,
        "passes": 2,
        "k_families": {"odd": ODD_K, "k2": K2_K, "k4": K4_K, "k0": K0_K},
    }
