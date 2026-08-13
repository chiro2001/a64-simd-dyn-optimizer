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
    legacy_ex = bool(lo.get("legacy_ex", 0))
    legacy_k4 = bool(lo.get("legacy_k4", 0))
    slice_kind = lo.get("slice_kind", "tbl2")
    row_group = int(lo.get("row_group", 4))
    const_layout = lo.get("constant_layout", "derived-replicated")
    ops: List[Op] = []
    n = 0
    cur = {"g": 0}

    def new(kind, tile_id, out="", inputs=(), attrs=None):
        nonlocal n
        n += 1
        attrs = dict(attrs if attrs is not None else {})
        attrs.setdefault("g", cur["g"])
        op = Op("op%04d" % n, kind, tile_id, out, tuple(inputs),
                attrs)
        ops.append(op)
        return op

    for pass_id in (1, 2):
        shift = 4 if pass_id == 1 else 11
        for g in range(8 if row_group == 4 else 4):
            cur["g"] = g
            rows = tuple(g * row_group + r for r in range(row_group))
            banks = [rows[b * 4:(b + 1) * 4]
                     for b in range(row_group // 4)]
            # ---- leaf per row ----
            o = {}
            eo16 = {}
            eo = {}
            eeo = {}
            eeo16 = {}
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
                need_e16 = ((k2_slice and pass_id == 1)
                            or (legacy_ex and pass_id == 2) or legacy_k4)
                if need_e16:
                    E16 = new("add", tid, "E16_%d" % r, (lo_v.out, rv.out),
                              attrs={"elem": "s16"})
                    if (k2_slice and pass_id == 1) or \
                            (legacy_ex and pass_id == 2):
                        E16r = new("rev", tid, "E16r_%d" % r, (E16.out,),
                                   attrs={"elem": "s16"})
                        eo16[r] = new(
                            "sub", tid, "EO16_%d" % r, (E16.out, E16r.out),
                            attrs={"elem": "s16", "lane_owner": "partial"}).out
                    if legacy_k4:
                        # EE16 = E16 + rev16(E16); EEO16 = EE16 - rev8(EE16)
                        E16rr = new("permute", tid, "E16rr_%d" % r,
                                    (E16.out,),
                                    attrs={"kind": "rev16"})
                        EE16 = new("add", tid, "EE16_%d" % r,
                                   (E16.out, E16rr.out),
                                   attrs={"elem": "s16"})
                        EEr = new("permute", tid, "EEr16_%d" % r,
                                  (EE16.out,), attrs={"kind": "tbl",
                                                      "idx": "rev8"})
                        eeo16[r] = new(
                            "sub", tid, "EEO16_%d" % r, (EE16.out, EEr.out),
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

            # ---- odd k: lane-per-output sdot.d ----
            if odd_sdot:
                def build_slices(rb, suffix):
                    tid = "p%d.odd.slice%s" % (pass_id, suffix)
                    xs = []
                    if slice_kind == "zip":
                        p01 = new("permute", tid, "z01%s" % suffix,
                                  (o[rb[0]], o[rb[2]]),
                                  attrs={"kind": "zip1d",
                                         "lane_owner": "output"})
                        p02 = new("permute", tid, "z02%s" % suffix,
                                  (o[rb[1]], o[rb[3]]),
                                  attrs={"kind": "zip1d",
                                         "lane_owner": "output"})
                        t11 = new("permute", tid, "t11%s" % suffix,
                                  (o[rb[0]], o[rb[2]]),
                                  attrs={"kind": "trn1d",
                                         "lane_owner": "output"})
                        t12 = new("permute", tid, "t12%s" % suffix,
                                  (o[rb[1]], o[rb[3]]),
                                  attrs={"kind": "trn1d",
                                         "lane_owner": "output"})
                        t21 = new("permute", tid, "t21%s" % suffix,
                                  (o[rb[0]], o[rb[2]]),
                                  attrs={"kind": "trn2d",
                                         "lane_owner": "output"})
                        t22 = new("permute", tid, "t22%s" % suffix,
                                  (o[rb[1]], o[rb[3]]),
                                  attrs={"kind": "trn2d",
                                         "lane_owner": "output"})
                        combos = ((p01, p02, "zip1d"), (t21, t22, "zip1d"),
                                  (t11, t12, "zip2d"), (t21, t22, "zip2d"))
                        for m, (sa, sb, kd) in enumerate(combos):
                            x = new("permute", tid, "X%d%s" % (m, suffix),
                                    (sa.out, sb.out),
                                    attrs={"kind": kd,
                                           "lane_owner": "output"})
                            xs.append(x.out)
                    else:
                        for m in range(4):
                            p = new("permute", tid, "p%d%s" % (m, suffix),
                                    (o[rb[0]], o[rb[1]]),
                                    attrs={"kind": "tbl2", "idx": "i%d" % m,
                                           "lane_owner": "output"})
                            q = new("permute", tid, "q%d%s" % (m, suffix),
                                    (o[rb[2]], o[rb[3]]),
                                    attrs={"kind": "tbl2", "idx": "i%d" % m,
                                           "lane_owner": "output"})
                            x = new("permute", tid, "X%d%s" % (m, suffix),
                                    (p.out, q.out),
                                    attrs={"kind": "tbl2", "idx": "ilo",
                                           "lane_owner": "output"})
                            xs.append(x.out)
                    return xs
                odd_banks = banks if row_group == 4 \
                    else [rows[0::2], rows[1::2]]
                all_xs = [build_slices(rb, "_b%d" % b)
                          for b, rb in enumerate(odd_banks)]
                for k in ODD_K:
                    tid = "p%d.odd.k%d" % (pass_id, k)
                    rs = []
                    for b in range(len(banks)):
                        xs = all_xs[b]
                        terms = []
                        for m in range(4):
                            t = new("dot_segment", tid,
                                    "t_%d_%d_b%d" % (k, m, b), (xs[m],),
                                    attrs={"acc_bits": 64,
                                           "lane_owner": "output",
                                           "slice": m,
                                           "terms": tuple(
                                               _g(k, 4 * m + j)
                                               for j in range(4)),
                                           "const_src": (
                                               "CODD[%d][%d]"
                                               % ((k // 2), m)
                                               if const_layout
                                               == "derived-replicated"
                                               else "C32[%d]" % k)})
                            terms.append(t.out)
                        acc = terms[0]
                        for m in range(1, 4):
                            acc = new("accumulate", tid,
                                      "acc_%d_%d_b%d" % (k, m, b),
                                      (acc, terms[m]),
                                      attrs={"acc_bits": 64}).out
                        rnd = new("round_shift", tid, "rnd_%d_b%d" % (k, b),
                                  (acc,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        rs.append(rnd)
                    if row_group == 8:
                        n8 = new("narrow8", tid, "n8_%d" % k,
                                 (rs[0].out, rs[1].out),
                                 attrs={"from": "s64", "to": "s16",
                                        "kind": "zip+rshrnb+uzp"})
                        new("store", tid, "", (n8.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 8})
                    else:
                        nar = new("narrow", tid, "nar_%d" % k,
                                  (rs[0].out,),
                                  attrs={"from": "s64", "to": "s16",
                                         "kind": "uzp+rshrnb+uzp"})
                        new("store", tid, "", (nar.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 4})
            # ---- k2 ----
            if (pass_id == 1 and k2_slice) or (pass_id == 2 and legacy_ex):
                for b in range(len(banks)):
                    rb = banks[b]
                    suffix = "_b%d" % b
                    tid = "p%d.k2.slice%s" % (pass_id, suffix)
                    ex = []
                    if slice_kind == "zip":
                        z1 = new("permute", tid, "k2z1%s" % suffix,
                                 (eo16[rb[0]], eo16[rb[2]]),
                                 attrs={"kind": "zip1d",
                                        "lane_owner": "output"})
                        z2 = new("permute", tid, "k2z2%s" % suffix,
                                 (eo16[rb[1]], eo16[rb[3]]),
                                 attrs={"kind": "zip1d",
                                        "lane_owner": "output"})
                        t1 = new("permute", tid, "k2t1%s" % suffix,
                                 (eo16[rb[0]], eo16[rb[2]]),
                                 attrs={"kind": "trn2d",
                                        "lane_owner": "output"})
                        t2 = new("permute", tid, "k2t2%s" % suffix,
                                 (eo16[rb[1]], eo16[rb[3]]),
                                 attrs={"kind": "trn2d",
                                        "lane_owner": "output"})
                        ex.append(new("permute", tid, "EX0%s" % suffix,
                                      (z1.out, z2.out),
                                      attrs={"kind": "zip1d",
                                             "lane_owner": "output"}).out)
                        ex.append(new("permute", tid, "EX1%s" % suffix,
                                      (t1.out, t2.out),
                                      attrs={"kind": "zip1d",
                                             "lane_owner": "output"}).out)
                    else:
                        for m in range(2):
                            e = new("permute", tid, "e%d%s" % (m, suffix),
                                    (eo16[rb[0]], eo16[rb[1]]),
                                    attrs={"kind": "tbl2", "idx": "i%d" % m,
                                           "lane_owner": "output"})
                            f = new("permute", tid, "f%d%s" % (m, suffix),
                                    (eo16[rb[2]], eo16[rb[3]]),
                                    attrs={"kind": "tbl2", "idx": "i%d" % m,
                                           "lane_owner": "output"})
                            ex.append(new("permute", tid, "EX%d%s" % (m, suffix),
                                          (e.out, f.out),
                                          attrs={"kind": "tbl2", "idx": "ilo",
                                                 "lane_owner": "output"}).out)
                    for k in K2_K:
                        tid = "p%d.k2.k%d" % (pass_id, k)
                        t0 = new("dot_segment", tid,
                                 "k2t0_%d%s" % (k, suffix), (ex[0],),
                                 attrs={"acc_bits": 64,
                                        "lane_owner": "output", "slice": 0,
                                        "terms": tuple(_g(k, j)
                                                       for j in range(4)),
                                        "const_src": "K2S[%d][0]" % (k // 4)})
                        t1 = new("dot_segment", tid,
                                 "k2t1_%d%s" % (k, suffix), (ex[1],),
                                 attrs={"acc_bits": 64,
                                        "lane_owner": "output", "slice": 1,
                                        "terms": tuple(_g(k, 4 + j)
                                                       for j in range(4)),
                                        "const_src": "K2S[%d][1]" % (k // 4)})
                        acc = new("accumulate", tid,
                                  "k2acc_%d%s" % (k, suffix),
                                  (t0.out, t1.out), attrs={"acc_bits": 64})
                        rnd = new("round_shift", tid, "k2rnd_%d%s" % (k, suffix),
                                  (acc.out,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        nar = new("narrow", tid, "k2nar_%d%s" % (k, suffix),
                                  (rnd.out,),
                                  attrs={"from": "s64", "to": "s16",
                                         "kind": "uzp+rshrnb+uzp"})
                        new("store", tid, "", (nar.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rb),
                                   "topology": "contiguous",
                                   "row_group": row_group,
                                   "base_off": b * 4})
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
            if legacy_k4:
                for b in range(len(banks)):
                    rb = banks[b]
                    suffix = "_b%d" % b
                    tid = "p%d.k4.slice%s" % (pass_id, suffix)
                    if slice_kind == "zip":
                        kz1 = new("permute", tid, "k4z1%s" % suffix,
                                  (eeo16[rb[0]], eeo16[rb[2]]),
                                  attrs={"kind": "zip1d",
                                         "lane_owner": "output"})
                        kz2 = new("permute", tid, "k4z2%s" % suffix,
                                  (eeo16[rb[1]], eeo16[rb[3]]),
                                  attrs={"kind": "zip1d",
                                         "lane_owner": "output"})
                        xk4 = new("permute", tid, "Xk4%s" % suffix,
                                  (kz1.out, kz2.out),
                                  attrs={"kind": "zip1d",
                                         "lane_owner": "output"})
                    else:
                        pk4 = new("permute", tid, "pk4%s" % suffix,
                                  (eeo16[rb[0]], eeo16[rb[1]]),
                                  attrs={"kind": "tbl2", "idx": "i0",
                                         "lane_owner": "output"})
                        qk4 = new("permute", tid, "qk4%s" % suffix,
                                  (eeo16[rb[2]], eeo16[rb[3]]),
                                  attrs={"kind": "tbl2", "idx": "i0",
                                         "lane_owner": "output"})
                        xk4 = new("permute", tid, "Xk4%s" % suffix,
                                  (pk4.out, qk4.out),
                                  attrs={"kind": "tbl2", "idx": "ilo",
                                         "lane_owner": "output"})
                    for k in K4_K:
                        tid = "p%d.k4.k%d" % (pass_id, k)
                        t = new("dot_segment", tid, "k4t_%d%s" % (k, suffix),
                                (xk4.out,),
                                attrs={"acc_bits": 64,
                                       "lane_owner": "output", "slice": 0,
                                       "nconst": 1,
                                       "terms": tuple(_g(k, j)
                                                      for j in range(4)),
                                       "const_src": "K4S[%d]" % (k // 8)})
                        rnd = new("round_shift", tid,
                                  "k4rnd_%d%s" % (k, suffix), (t.out,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        nar = new("narrow", tid, "k4nar_%d%s" % (k, suffix),
                                  (rnd.out,),
                                  attrs={"from": "s64", "to": "s16",
                                         "kind": "uzp+rshrnb+uzp"})
                        new("store", tid, "", (nar.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rb),
                                   "topology": "contiguous",
                                   "row_group": row_group,
                                   "base_off": b * 4})
            else:
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
            k0e = {}
            k0o = {}
            for r in rows:
                tid = "p%d.k0.extract.row%d" % (pass_id, r)
                k0e[r] = new("extract2", tid, "k0e_%d" % r, (eeee[r],),
                             attrs={"which": "e", "elem": "s32"}).out
                k0o[r] = new("extract2", tid, "k0o_%d" % r, (eeeo[r],),
                             attrs={"which": "o", "elem": "s32"}).out
            for k in K0_K:
                for r in rows:
                    tid = "p%d.k0.k%d.row%d" % (pass_id, k, r)
                    src_val = k0e[r] if k in (0, 16) else k0o[r]
                    t = new("mul_reduce", tid, "k0m_%d_%d" % (k, r),
                            (src_val,),
                            attrs={"elem": "s32",
                                   "terms": (_g(k, 0), _g(k, 1)),
                                   "reduce": "scalar2",
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
