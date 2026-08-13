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


def dct16_upstream_provenance(ops: List[Op]) -> Dict:
    """Full upstream pass1+pass2 output-lane coverage + dot-term and
    round-epoch checks (analogous to dct32 provenance_report)."""
    issues: List[str] = []
    stores: Dict[Tuple[int, int, int], Op] = {}
    dot_terms: Dict[Tuple[int, int], set] = {}
    for op in ops:
        if op.kind == "store":
            if op.attrs.get("topology") != "contiguous":
                issues.append("%s: non-contiguous store" % op.op_id)
            if "scatter" in op.attrs.get("index", ""):
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
        if len(terms) != 8:
            issues.append("pass1 k=%d covers %d/8 terms" % (k, len(terms)))
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
