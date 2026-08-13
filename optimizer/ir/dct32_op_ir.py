"""DCT32 OpIR vertical slice (round-0013 E1-B first increment).

The grouped C++ emitter is kept as an oracle; this module is the first
backend-independent lowering: a typed plan is expanded into an explicit
op DAG (load/rev/unpk/permute/dot-segment/mul-reduce/round/narrow/store)
where every op carries tile_id, lane ownership and proof obligations.
`provenance_report()` verifies output-lane bijection, dot-term coverage,
round epochs and contiguous stores.

This is not yet a code generator: the next increment attaches an ACLE/asm
emitter to the op DAG and requires it to rediscover <= 8292 full-call
fused_uop (docs/20 §1) without importing the grouped C++ blocks.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Dict, List, Tuple

from layout_ir import Plan


@dataclass(frozen=True)
class Op:
    op_id: str
    kind: str
    tile_id: str
    out: str = ""
    inputs: Tuple[str, ...] = ()
    attrs: Dict = field(default_factory=dict)


ODD_K = tuple(range(1, 32, 2))       # 16 odd k
K2_K = tuple(range(2, 32, 4))        # 8 k = 2 mod 4
K4_K = tuple(range(4, 32, 8))        # 4 k = 4 mod 8
K0_K = (0, 8, 16, 24)


def _g(k, j):
    return "G[%d][%d]" % (k, j)


def lower_plan_to_ops(plan: Plan) -> List[Op]:
    """Expand a valid DCT32 plan into a semantic op DAG.

    Mirrors the grouped v3.1 structure (4-row groups, odd lane-per-output
    sdot.d, pass1 k2 EX slice, per-row s32 mul for pass2 k2/k4, contiguous
    stores). The result is generated from the plan's tiles/lowering only;
    no grouped C++ block is consulted.
    """
    lo = plan.lowering
    odd_sdot = lo.get("odd_lowering", "sdot.d") == "sdot.d"
    narrow4 = lo.get("narrow_batch", 4) == 4
    k2_slice = bool(lo.get("pass1_k2_slice", 0))
    const_layout = lo.get("constant_layout", "derived-replicated")
    ops: List[Op] = []
    n = 0

    def new(kind, tile_id, out="", inputs=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("op%04d" % n, kind, tile_id, out, tuple(inputs),
                attrs if attrs is not None else {})
        ops.append(op)
        return op

    for pass_id in (1, 2):
        shift = 4 if pass_id == 1 else 11
        for g in range(8):
            rows = tuple(g * 4 + r for r in range(4))
            # ---- leaf per row ----
            o = {}
            eo16 = {}
            eo = {}
            eeo = {}
            eeee = {}
            eeeo = {}
            for r in rows:
                tid = "p%d.leaf.row%d" % (pass_id, r)
                lo_v = new("load", tid, "lo_%d" % r,
                           attrs={"base": "src", "index": "i*stride+j",
                                  "elem": "s16"})
                hi = new("load", tid, "hi_%d" % r,
                         attrs={"base": "src", "index": "i*stride+j+16",
                                "elem": "s16"})
                rv = new("rev", tid, "rv_%d" % r, (hi.out,),
                         attrs={"elem": "s16"})
                O = new("sub", tid, "O_%d" % r, (lo_v.out, rv.out),
                        attrs={"elem": "s16", "lane_owner": "output"})
                o[r] = O.out
                loa = new("unpk", tid, "loa_%d" % r, (lo_v.out,),
                          attrs={"which": "lo", "elem": "s32"})
                lob = new("unpk", tid, "lob_%d" % r, (lo_v.out,),
                          attrs={"which": "hi", "elem": "s32"})
                rva = new("unpk", tid, "rva_%d" % r, (rv.out,),
                          attrs={"which": "lo", "elem": "s32"})
                rvb = new("unpk", tid, "rvb_%d" % r, (rv.out,),
                          attrs={"which": "hi", "elem": "s32"})
                Ea = new("add", tid, "Ea_%d" % r, (loa.out, rva.out),
                         attrs={"elem": "s32"})
                Eb = new("add", tid, "Eb_%d" % r, (lob.out, rvb.out),
                         attrs={"elem": "s32"})
                Erb = new("rev", tid, "Erb_%d" % r, (Eb.out,),
                          attrs={"elem": "s32"})
                EE = new("add", tid, "EE_%d" % r, (Ea.out, Erb.out),
                         attrs={"elem": "s32"})
                eo[r] = new("sub", tid, "EO_%d" % r, (Ea.out, Erb.out),
                            attrs={"elem": "s32", "lane_owner": "partial"}).out
                if k2_slice and pass_id == 1:
                    E16 = new("add", tid, "E16_%d" % r, (lo_v.out, rv.out),
                              attrs={"elem": "s16"})
                    E16r = new("rev", tid, "E16r_%d" % r, (E16.out,),
                               attrs={"elem": "s16"})
                    eo16[r] = new(
                        "sub", tid, "EO16_%d" % r, (E16.out, E16r.out),
                        attrs={"elem": "s16", "lane_owner": "partial"}).out
                EEr = new("rev", tid, "EEr_%d" % r, (EE.out,),
                          attrs={"elem": "s32"})
                EEE = new("add", tid, "EEE_%d" % r, (EE.out, EEr.out),
                          attrs={"elem": "s32"})
                eeo[r] = new("sub", tid, "EEO_%d" % r, (EE.out, EEr.out),
                             attrs={"elem": "s32", "lane_owner": "partial"}).out
                EEEr = new("permute", tid, "EEEr_%d" % r, (EEE.out,),
                           attrs={"kind": "tbl", "idx": "rev4s"})
                eeee[r] = new("add", tid, "EEEE_%d" % r, (EEE.out, EEEr.out),
                              attrs={"elem": "s32"}).out
                eeeo[r] = new("sub", tid, "EEEO_%d" % r, (EEE.out, EEEr.out),
                              attrs={"elem": "s32"}).out

            # ---- odd k: lane-per-output sdot.d (4 rows per 4 s64 lanes) ----
            if odd_sdot:
                tid = "p%d.odd.slice" % pass_id
                xs = []
                for m in range(4):
                    p = new("permute", tid, "p%d" % m,
                            (o[rows[0]], o[rows[1]]),
                            attrs={"kind": "tbl2", "idx": "i%d" % m,
                                   "lane_owner": "output"})
                    q = new("permute", tid, "q%d" % m,
                            (o[rows[2]], o[rows[3]]),
                            attrs={"kind": "tbl2", "idx": "i%d" % m,
                                   "lane_owner": "output"})
                    x = new("permute", tid, "X%d" % m, (p.out, q.out),
                            attrs={"kind": "tbl2", "idx": "ilo",
                                   "lane_owner": "output"})
                    xs.append(x.out)
                for k in ODD_K:
                    tid = "p%d.odd.k%d" % (pass_id, k)
                    terms = []
                    for m in range(4):
                        t = new("dot_segment", tid, "t_%d_%d" % (k, m),
                                (xs[m],),
                                attrs={"acc_bits": 64,
                                       "lane_owner": "output",
                                       "terms": tuple(
                                           _g(k, 4 * m + j) for j in range(4)),
                                       "const_src": ("CODD[%d][%d]"
                                                     % ((k // 2), m)
                                                     if const_layout
                                                     == "derived-replicated"
                                                     else "C32[%d]" % k)})
                        terms.append(t.out)
                    acc = terms[0]
                    for m in range(1, 4):
                        acc = new("accumulate", tid, "acc_%d_%d" % (k, m),
                                  (acc, terms[m]),
                                  attrs={"acc_bits": 64}).out
                    rnd = new("round_shift", tid, "rnd_%d" % k, (acc,),
                              attrs={"shift": shift, "epoch": pass_id,
                                     "mode": "half-up"})
                    nar = new("narrow", tid, "nar_%d" % k, (rnd.out,),
                              attrs={"from": "s64", "to": "s16",
                                     "kind": "uzp+rshrnb+uzp"})
                    new("store", tid, "", (nar.out,),
                        attrs={"base": "dst", "index": "k*32+i",
                               "lanes": tuple((pass_id, k, r) for r in rows),
                               "topology": "contiguous"})
            # ---- k2 ----
            if pass_id == 1 and k2_slice:
                tid = "p%d.k2.slice" % pass_id
                ex = []
                for m in range(2):
                    e = new("permute", tid, "e%d" % m,
                            (eo16[rows[0]], eo16[rows[1]]),
                            attrs={"kind": "tbl2", "idx": "i%d" % m,
                                   "lane_owner": "output"})
                    f = new("permute", tid, "f%d" % m,
                            (eo16[rows[2]], eo16[rows[3]]),
                            attrs={"kind": "tbl2", "idx": "i%d" % m,
                                   "lane_owner": "output"})
                    ex.append(new("permute", tid, "EX%d" % m, (e.out, f.out),
                                  attrs={"kind": "tbl2", "idx": "ilo",
                                         "lane_owner": "output"}).out)
                for k in K2_K:
                    tid = "p%d.k2.k%d" % (pass_id, k)
                    t0 = new("dot_segment", tid, "k2t0_%d" % k, (ex[0],),
                             attrs={"acc_bits": 64, "lane_owner": "output",
                                    "terms": tuple(_g(k, j) for j in range(4)),
                                    "const_src": "K2S[%d][0]" % (k // 4)})
                    t1 = new("dot_segment", tid, "k2t1_%d" % k, (ex[1],),
                             attrs={"acc_bits": 64, "lane_owner": "output",
                                    "terms": tuple(_g(k, 4 + j)
                                                   for j in range(4)),
                                    "const_src": "K2S[%d][1]" % (k // 4)})
                    acc = new("accumulate", tid, "k2acc_%d" % k,
                              (t0.out, t1.out), attrs={"acc_bits": 64})
                    rnd = new("round_shift", tid, "k2rnd_%d" % k,
                              (acc.out,),
                              attrs={"shift": shift, "epoch": pass_id,
                                     "mode": "half-up"})
                    nar = new("narrow", tid, "k2nar_%d" % k, (rnd.out,),
                              attrs={"from": "s64", "to": "s16",
                                     "kind": "uzp+rshrnb+uzp"})
                    new("store", tid, "", (nar.out,),
                        attrs={"base": "dst", "index": "k*32+i",
                               "lanes": tuple((pass_id, k, r) for r in rows),
                               "topology": "contiguous"})
            else:
                for k in K2_K:
                    for r in rows:
                        tid = "p%d.k2.k%d.row%d" % (pass_id, k, r)
                        t = new("mul_reduce", tid, "k2m_%d_%d" % (k, r),
                                (eo[r],),
                                attrs={"elem": "s32",
                                       "terms": tuple(_g(k, j) for j in range(8)),
                                       "reduce": "saddv",
                                       "lane_owner": "partial"})
                        rnd = new("round_shift", tid, "k2mr_%d_%d" % (k, r),
                                  (t.out,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        new("store", tid, "", (rnd.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": ((pass_id, k, r),),
                                   "topology": "contiguous"})
            # ---- k4 ----
            for k in K4_K:
                for r in rows:
                    tid = "p%d.k4.k%d.row%d" % (pass_id, k, r)
                    t = new("mul_reduce", tid, "k4m_%d_%d" % (k, r),
                            (eeo[r],),
                            attrs={"elem": "s32",
                                   "terms": tuple(_g(k, j) for j in range(4)),
                                   "reduce": "saddv",
                                   "lane_owner": "partial"})
                    rnd = new("round_shift", tid, "k4mr_%d_%d" % (k, r),
                              (t.out,),
                              attrs={"shift": shift, "epoch": pass_id,
                                     "mode": "half-up"})
                    new("store", tid, "", (rnd.out,),
                        attrs={"base": "dst", "index": "k*32+i",
                               "lanes": ((pass_id, k, r),),
                               "topology": "contiguous"})
            # ---- k0 ----
            for k in K0_K:
                for r in rows:
                    tid = "p%d.k0.k%d.row%d" % (pass_id, k, r)
                    t = new("mul_reduce", tid, "k0m_%d_%d" % (k, r),
                            (eeee[r], eeeo[r]),
                            attrs={"elem": "s32",
                                   "terms": (_g(k, 0), _g(k, 1)),
                                   "reduce": "scalar",
                                   "lane_owner": "partial"})
                    rnd = new("round_shift", tid, "k0mr_%d_%d" % (k, r),
                              (t.out,),
                              attrs={"shift": shift, "epoch": pass_id,
                                     "mode": "half-up"})
                    new("store", tid, "", (rnd.out,),
                        attrs={"base": "dst", "index": "k*32+i",
                               "lanes": ((pass_id, k, r),),
                               "topology": "contiguous"})
    return ops


def provenance_report(plan: Plan, ops: List[Op]) -> Dict:
    """Check output-lane bijection, dot-term coverage, round epochs,
    contiguous stores and op provenance coverage."""
    issues: List[str] = []
    stores: Dict[Tuple[int, int, int], Op] = {}
    dot_terms: Dict[Tuple[int, int, int], set] = {}
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
            terms = op.attrs.get("terms", ())
            # dot segment owns the 4 output lanes of its tile; record term
            # coverage per (pass, k) from the tile id.
            tid = op.tile_id
            # parse "p<pass>.odd.k<k>" or "p<pass>.k2.k<k>"
            parts = tid.split(".")
            pass_id = int(parts[0][1:])
            k = int(parts[-1][1:])
            dot_terms.setdefault((pass_id, k), set()).update(terms)
    expected_lanes = set()
    for pass_id in (1, 2):
        for r in range(32):
            for k in ODD_K + K2_K + K4_K + K0_K:
                expected_lanes.add((pass_id, k, r))
    missing = expected_lanes - set(stores)
    if missing:
        issues.append("missing output lanes: %d (e.g. %s)"
                      % (len(missing), sorted(missing)[:3]))
    # dot term coverage: odd k needs 16 terms, k2-slice pass1 needs 8.
    expected_dot = {}
    for k in ODD_K:
        expected_dot[(1, k)] = 16
        expected_dot[(2, k)] = 16
    for k in K2_K:
        expected_dot[(1, k)] = 8
    for key, want in sorted(expected_dot.items()):
        terms = dot_terms.get(key, ())
        if len(terms) != want:
            issues.append("dot pass%d k=%d covers %d/%d terms"
                          % (key[0], key[1], len(terms), want))
    # round epochs
    for op in ops:
        if op.kind == "round_shift":
            epoch = op.attrs.get("epoch")
            shift = op.attrs.get("shift")
            want = 4 if epoch == 1 else 11
            if shift != want:
                issues.append("%s: round shift %d at epoch %d (want %d)"
                              % (op.op_id, shift, epoch, want))
    op_tiles = set()
    for op in ops:
        parts = op.tile_id.split(".")
        op_tiles.add(".".join(parts[:2]))
    plan_tiles = {"p%d.%s" % (t.pass_id, t.k_family)
                  for t in plan.tiles}
    uncovered = plan_tiles - op_tiles
    if uncovered:
        issues.append("plan tiles without ops: %s" % sorted(uncovered))
    return {
        "op_count": len(ops),
        "store_count": len(stores),
        "expected_lanes": len(expected_lanes),
        "dot_families": len(dot_terms),
        "coverage": len(stores) / len(expected_lanes)
        if expected_lanes else 0.0,
        "issues": issues,
        "ok": not issues,
    }
