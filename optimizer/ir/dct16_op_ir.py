"""DCT16 op IR (cross-kernel migration, first slice).

Design (docs/25): lower DCT16 into the same Op DAG as DCT32 so the
rewrite engine and sequence search can be reused. This module currently
holds the kernel constants and the lowering contract; the first concrete
slice will lower pass1-quarter + pass2-odd-quarter (legacy best 704) with
provenance, then compare counts against the grouped emitter.
"""

from __future__ import annotations

from typing import Dict, List, Tuple

from op_ir import Op


# DCT16 k families (16x16): odd k=1..15, k2=2,6,10,14, k4=4,12, k0=0,8.
ODD_K = tuple(range(1, 16, 2))
K2_K = tuple(range(2, 16, 4))
K4_K = tuple(range(4, 16, 8))
K0_K = (0, 8)


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


def dct16_constants() -> Dict[str, object]:
    """DCT16 butterfly/constant metadata consumed by the lowering."""
    return {
        "n": 16,
        "passes": 2,
        "k_families": {"odd": ODD_K, "k2": K2_K, "k4": K4_K, "k0": K0_K},
    }
