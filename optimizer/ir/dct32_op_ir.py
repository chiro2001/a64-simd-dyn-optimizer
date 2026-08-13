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
from op_ir import Op  # noqa: F401  (re-exported for back-compat)


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
    # row16 store merging requires contiguous-bank-compatible slices; the
    # k4 tbl2 slice is tied to even/odd banks (docs/20 §5.13), so normalize
    # row16 to zip (the search's source dedup then collapses the combo).
    if row_group == 16 and slice_kind == "tbl2":
        slice_kind = "zip"
    acc_split = int(lo.get("acc_split", 1))
    const_layout = lo.get("constant_layout", "derived-replicated")
    # k0 even_sve: compute the k0 family (0/8/16/24) per 4-row group via
    # the DCT16-style quarter structure (EEp/EOp + mul + addp). Requires
    # the legacy s16 paths so the per-row s32 E-chain has no other users.
    # pass1/pass2 must both have no other consumers of the per-row s32
    # E-chain: pass1 k2 needs k2_slice, pass2 k2 needs legacy_ex, and
    # both k4 paths need legacy_k4.
    k0_even_sve = bool(lo.get("k0_even_sve", 0)) and k2_slice \
        and legacy_ex and legacy_k4
    # k0_shared_mul: k0/k16 share one mul by 64 (EEp) via uzp1/uzp2 + add/sub;
    # matches the internal reference's 32-mul / 0-addp k0 signature.
    # Only the (0,16) pair is shareable: (8,24) needs (83,36) vs (36,-83)
    # which are not a common factor, so those keep the per-k mul path.
    k0_shared_mul = bool(lo.get("k0_shared_mul", 0)) and k0_even_sve
    # k0_merge8: with row_group=8, merge the two 4-row packs' per-k
    # 4-lane row vectors (svtbl2_s32) before one rshrnb+uzp1+store8.
    # k0_epack: build E = lo + rev(hi) per row first (s16), then pack E
    # once (one 18-op pack instead of lo/hi double packs) and widen with
    # single saddlb/lt terms. PASS1 ONLY: pass1 inputs are [-255,255] so
    # E stays within s16 (exact); pass2 coef pairs can reach ~+-65k and
    # wrap (probe_k0_epack two-pass random 0 mismatch, but TestBenchLite
    # constant/structured vectors FAIL) -- the same trap as k0_even_sdot.
    k0_epack = bool(lo.get("k0_epack", 0)) and k0_even_sve
    # sdot_indexed: pack two k-families' 4-coefficient groups into one
    # 16-lane constant vector ([kA c0..3, kB c0..3, kA c0..3, kB c0..3])
    # and use SVE2 indexed SDOT (Zda.D, Zn.H, Zm.H[0/1]); the index
    # selects the same 64-bit group in each 128-bit segment, so one load
    # serves two k rows. Cuts the per-k constant loads ~2x.
    sdot_indexed = bool(lo.get("sdot_indexed", 0))
    k0_merge8 = bool(lo.get("k0_merge8", 0)) and k0_even_sve \
        and row_group in (8, 16)
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
        for g in range(32 // row_group):
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
            e16 = {}
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
                if not k0_even_sve:
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
                    eo[r] = new("sub", tid, "EO_%d" % r,
                                (Ea.out, Erb.out),
                                attrs={"elem": "s32",
                                       "lane_owner": "partial"}).out
                need_e16 = ((k2_slice and pass_id == 1)
                            or (legacy_ex and pass_id == 2) or legacy_k4)
                if need_e16:
                    E16 = new("add", tid, "E16_%d" % r, (lo_v.out, rv.out),
                              attrs={"elem": "s16"})
                    e16[r] = E16.out
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
                if not k0_even_sve:
                    EEr = new("rev", tid, "EEr_%d" % r, (EE.out,),
                              attrs={"elem": "s32"})
                    EEE = new("add", tid, "EEE_%d" % r,
                              (EE.out, EEr.out), attrs={"elem": "s32"})
                    eeo[r] = new("sub", tid, "EEO_%d" % r,
                                 (EE.out, EEr.out),
                                 attrs={"elem": "s32",
                                        "lane_owner": "partial"}).out
                    EEEr = new("permute", tid, "EEEr_%d" % r, (EEE.out,),
                               attrs={"kind": "tbl", "idx": "rev4s"})
                    eeee[r] = new("add", tid, "EEEE_%d" % r,
                                  (EEE.out, EEEr.out),
                                  attrs={"elem": "s32"}).out
                    eeeo[r] = new("sub", tid, "EEEO_%d" % r,
                                  (EEE.out, EEEr.out),
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
                odd_banks = banks
                all_xs = [build_slices(rb, "_b%d" % b)
                          for b, rb in enumerate(odd_banks)]
                for k in ODD_K:
                    tid = "p%d.odd.k%d" % (pass_id, k)
                    accs = []
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
                        if acc_split >= 2:
                            # balanced tree: (t0+t1)+(t2+t3)
                            lvl = list(terms)
                            depth = 0
                            while len(lvl) > 1:
                                nxt = []
                                for i in range(0, len(lvl), 2):
                                    if i + 1 < len(lvl):
                                        nxt.append(new(
                                            "accumulate", tid,
                                            "acc_%d_d%d_%d_b%d"
                                            % (k, depth, i // 2, b),
                                            (lvl[i], lvl[i + 1]),
                                            attrs={"acc_bits": 64}).out)
                                    else:
                                        nxt.append(lvl[i])
                                lvl = nxt
                                depth += 1
                            acc = lvl[0]
                        else:
                            acc = terms[0]
                            for m in range(1, 4):
                                acc = new("accumulate", tid,
                                          "acc_%d_%d_b%d" % (k, m, b),
                                          (acc, terms[m]),
                                          attrs={"acc_bits": 64}).out
                        accs.append(acc)
                    if row_group == 16:
                        n16 = new("narrow16_merged", tid, "n16_%d" % k,
                                  tuple(accs),
                                  attrs={"shift": shift,
                                         "mode": "rshrn"})
                        new("store", tid, "", (n16.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 16})
                    elif row_group == 8:
                        n8 = new("narrow8_merged", tid, "n8_%d" % k,
                                 (accs[0], accs[1]),
                                 attrs={"shift": shift,
                                        "mode": "rshrn"})
                        new("store", tid, "", (n8.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 8})
                    else:
                        rnd = new("round_shift", tid, "rnd_%d" % k,
                                  (accs[0],),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        nar = new("narrow", tid, "nar_%d" % k,
                                  (rnd.out,),
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
                # k2 slices are zip/trn based -> contiguous-bank
                # compatible with the merged narrow.
                k2k4_banks = banks
                exs = []
                for b, rb in enumerate(k2k4_banks):
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
                    exs.append(ex)
                # k2 uses zip/trn slices (contiguous-bank compatible);
                # keep the merged narrow.
                if row_group in (8, 16):
                    for k in K2_K:
                        tid = "p%d.k2.k%d" % (pass_id, k)
                        accs = []
                        for b in range(len(k2k4_banks)):
                            ex = exs[b]
                            t0 = new("dot_segment", tid,
                                     "k2t0_%d_b%d" % (k, b), (ex[0],),
                                     attrs={"acc_bits": 64,
                                            "lane_owner": "output",
                                            "slice": 0,
                                            "terms": tuple(_g(k, j)
                                                           for j in range(4)),
                                            "const_src": "K2S[%d][0]"
                                            % (k // 4)})
                            t1 = new("dot_segment", tid,
                                     "k2t1_%d_b%d" % (k, b), (ex[1],),
                                     attrs={"acc_bits": 64,
                                            "lane_owner": "output",
                                            "slice": 1,
                                            "terms": tuple(_g(k, 4 + j)
                                                           for j in range(4)),
                                            "const_src": "K2S[%d][1]"
                                            % (k // 4)})
                            acc = new("accumulate", tid,
                                      "k2acc_%d_b%d" % (k, b),
                                      (t0.out, t1.out),
                                      attrs={"acc_bits": 64})
                            accs.append(acc.out)
                        if row_group == 16:
                            n16 = new("narrow16_merged", tid,
                                      "k2n16_%d" % k, tuple(accs),
                                      attrs={"shift": shift,
                                             "mode": "rshrn"})
                            new("store", tid, "", (n16.out,),
                                attrs={"base": "dst", "index": "k*32+i",
                                       "lanes": tuple((pass_id, k, r)
                                                      for r in rows),
                                       "topology": "contiguous",
                                       "row_group": 16})
                        else:
                            n8 = new("narrow8_merged", tid,
                                     "k2n8_%d" % k,
                                     (accs[0], accs[1]),
                                     attrs={"shift": shift,
                                            "mode": "rshrn"})
                            new("store", tid, "", (n8.out,),
                                attrs={"base": "dst", "index": "k*32+i",
                                       "lanes": tuple((pass_id, k, r)
                                                      for r in rows),
                                       "topology": "contiguous",
                                       "row_group": 8})
                else:
                    for k in K2_K:
                        tid = "p%d.k2.k%d" % (pass_id, k)
                        ex = exs[0]
                        t0 = new("dot_segment", tid, "k2t0_%d" % k, (ex[0],),
                                 attrs={"acc_bits": 64,
                                        "lane_owner": "output", "slice": 0,
                                        "terms": tuple(_g(k, j)
                                                       for j in range(4)),
                                        "const_src": "K2S[%d][0]" % (k // 4)})
                        t1 = new("dot_segment", tid, "k2t1_%d" % k, (ex[1],),
                                 attrs={"acc_bits": 64,
                                        "lane_owner": "output", "slice": 1,
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
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 4})
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
            # with slice_kind=zip the k4 slice is contiguous-bank
            # compatible; with tbl2 it is tied to even/odd (kept legacy).
            k4_banks = banks if row_group == 4 \
                else ([rows[b * 4:(b + 1) * 4]
                       for b in range(row_group // 4)]
                      if slice_kind == "zip"
                      else [rows[0::2], rows[1::2]])
            if legacy_k4:
                xk4s = []
                for b, rb in enumerate(k4_banks):
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
                    xk4s.append(xk4)
                # k4 uses a tbl2 slice whose lane mapping is tied to the
                # even/odd bank arrangement; keep the per-bank round +
                # trn1 narrow (no merged narrow here).
                if row_group in (8, 16):
                    for k in K4_K:
                        tid = "p%d.k4.k%d" % (pass_id, k)
                        if slice_kind == "zip":
                            accs = []
                            for b in range(len(k4_banks)):
                                t = new("dot_segment", tid,
                                        "k4t_%d_b%d" % (k, b),
                                        (xk4s[b].out,),
                                        attrs={"acc_bits": 64,
                                               "lane_owner": "output",
                                               "slice": 0, "nconst": 1,
                                               "terms": tuple(
                                                   _g(k, j)
                                                   for j in range(4)),
                                            "const_src": "K4S[%d]"
                                            % (k // 8)})
                                accs.append(t.out)
                            if row_group == 16:
                                n8 = new("narrow16_merged", tid,
                                         "k4n16_%d" % k, tuple(accs),
                                         attrs={"shift": shift,
                                                "mode": "rshrn"})
                            else:
                                n8 = new("narrow8_merged", tid,
                                         "k4n8_%d" % k,
                                         (accs[0], accs[1]),
                                         attrs={"shift": shift,
                                                "mode": "rshrn"})
                        else:
                            rs = []
                            for b in range(len(k4_banks)):
                                t = new("dot_segment", tid,
                                        "k4t_%d_b%d" % (k, b),
                                        (xk4s[b].out,),
                                        attrs={"acc_bits": 64,
                                               "lane_owner": "output",
                                               "slice": 0, "nconst": 1,
                                               "terms": tuple(
                                                   _g(k, j)
                                                   for j in range(4)),
                                               "const_src": "K4S[%d]"
                                               % (k // 8)})
                                rnd = new("round_shift", tid,
                                          "k4rnd_%d_b%d" % (k, b),
                                          (t.out,),
                                          attrs={"shift": shift,
                                                 "epoch": pass_id,
                                                 "mode": "half-up"})
                                rs.append(rnd)
                            n8 = new("narrow8", tid, "k4n8_%d" % k,
                                     (rs[0].out, rs[1].out),
                                     attrs={"from": "s64", "to": "s16",
                                            "kind": "trn1+uzp"})
                        new("store", tid, "", (n8.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 8})
                else:
                    for k in K4_K:
                        tid = "p%d.k4.k%d" % (pass_id, k)
                        t = new("dot_segment", tid, "k4t_%d" % k,
                                (xk4s[0].out,),
                                attrs={"acc_bits": 64,
                                       "lane_owner": "output", "slice": 0,
                                       "nconst": 1,
                                       "terms": tuple(_g(k, j)
                                                      for j in range(4)),
                                       "const_src": "K4S[%d]" % (k // 8)})
                        rnd = new("round_shift", tid, "k4rnd_%d" % k,
                                  (t.out,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        nar = new("narrow", tid, "k4nar_%d" % k, (rnd.out,),
                                  attrs={"from": "s64", "to": "s16",
                                         "kind": "uzp+rshrnb+uzp"})
                        new("store", tid, "", (nar.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": tuple((pass_id, k, r)
                                                  for r in rows),
                                   "topology": "contiguous",
                                   "row_group": 4})
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
            if k0_even_sve:
                # per contiguous 4-row pack: lo/hi quarters -> E in s32
                # (no s16 wrap; E = lo + rev(hi)) -> EEp/EOp ->
                # mul(K0EVEN) + addp + uzp1 + narrow + store4.
                packs = [rows[b * 4:(b + 1) * 4]
                         for b in range(row_group // 4)]
                kvec = {}
                for k in K0_K:
                    kvec[k] = []
                for b, pr in enumerate(packs):
                    tid = "p%d.k0es.pack%d" % (pass_id, b)
                    def pack(src_rows, tag):
                        a = [new("permute", tid,
                                 "%s_a%d_%d_%d" % (tag, m, b, pass_id),
                                 (src_rows[m],),
                                 attrs={"kind": "view_s64"})
                             for m in range(4)]
                        t = [new("permute", tid,
                                 "%s_t0_%d_%d" % (tag, b, pass_id),
                                 (a[0].out, a[2].out),
                                 attrs={"kind": "zip1d64"}),
                             new("permute", tid,
                                 "%s_t1_%d_%d" % (tag, b, pass_id),
                                 (a[0].out, a[2].out),
                                 attrs={"kind": "zip2d64"}),
                             new("permute", tid,
                                 "%s_t2_%d_%d" % (tag, b, pass_id),
                                 (a[1].out, a[3].out),
                                 attrs={"kind": "zip1d64"}),
                             new("permute", tid,
                                 "%s_t3_%d_%d" % (tag, b, pass_id),
                                 (a[1].out, a[3].out),
                                 attrs={"kind": "zip2d64"})]
                        p = [new("permute", tid,
                                 "%s_p%d_%d_%d" % (tag, m, b, pass_id),
                                 (t[0].out, t[2].out) if m < 2
                                 else (t[1].out, t[3].out),
                                 attrs={"kind": "zip1d64"
                                        if m % 2 == 0 else "zip2d64"})
                             for m in range(4)]
                        q = [new("permute", tid,
                                 "%s_q%d_%d_%d" % (tag, m, b, pass_id),
                                 (p[m].out,),
                                 attrs={"kind": "view_s16"})
                             for m in range(4)]
                        qr = [new("permute", tid,
                                  "%s_qr%d_%d_%d" % (tag, m, b, pass_id),
                                  (q[m].out,),
                                  attrs={"kind": "revh_d"})
                              for m in (2, 3)]
                        return q[0].out, q[1].out, qr[0].out, qr[1].out
                    if k0_epack and pass_id == 1:
                        # Reuse the leaf's E16 = lo + rev(hi) (already
                        # computed for the legacy s16 paths) -- the k0
                        # E-pack's own rev+add was redundant.
                        eq0, eq1, eq2, eq3 = pack(
                            [e16[r] for r in pr], "E")
                        e0 = new("widen_add_sve", tid,
                                 "we0_%d_%d" % (b, pass_id),
                                 (eq0, eq3), attrs={"kind": "lb"})
                        e1 = new("widen_add_sve", tid,
                                 "we1_%d_%d" % (b, pass_id),
                                 (eq0, eq3), attrs={"kind": "lt"})
                        e2 = new("widen_add_sve", tid,
                                 "we2_%d_%d" % (b, pass_id),
                                 (eq1, eq2), attrs={"kind": "lb"})
                        e3 = new("widen_add_sve", tid,
                                 "we3_%d_%d" % (b, pass_id),
                                 (eq1, eq2), attrs={"kind": "lt"})
                    else:
                        l0, l1, l2, l3 = pack(
                            ["lo_%d" % r for r in pr], "L")
                        h0, h1, h2, h3 = pack(
                            ["hi_%d" % r for r in pr], "H")
                        # e0 = saddlb(lo0, revh(hi3)) + saddlb(lo3, hi0)
                        e0 = new("add", tid, "e0_%d_%d" % (b, pass_id),
                                 (new("widen_add_sve", tid,
                                      "we0_%d_%d" % (b, pass_id),
                                      (l0, h3), attrs={"kind": "lb"}).out,
                                  new("widen_add_sve", tid,
                                      "we1_%d_%d" % (b, pass_id),
                                      (l3, h0), attrs={"kind": "lb"}).out),
                                 attrs={"elem": "s32"})
                        e1 = new("add", tid, "e1_%d_%d" % (b, pass_id),
                                 (new("widen_add_sve", tid,
                                      "we2_%d_%d" % (b, pass_id),
                                      (l0, h3), attrs={"kind": "lt"}).out,
                                  new("widen_add_sve", tid,
                                      "we3_%d_%d" % (b, pass_id),
                                      (l3, h0), attrs={"kind": "lt"}).out),
                                 attrs={"elem": "s32"})
                        e2 = new("add", tid, "e2_%d_%d" % (b, pass_id),
                                 (new("widen_add_sve", tid,
                                      "we4_%d_%d" % (b, pass_id),
                                      (l1, h2), attrs={"kind": "lb"}).out,
                                  new("widen_add_sve", tid,
                                      "we5_%d_%d" % (b, pass_id),
                                      (l2, h1), attrs={"kind": "lb"}).out),
                                 attrs={"elem": "s32"})
                        e3 = new("add", tid, "e3_%d_%d" % (b, pass_id),
                                 (new("widen_add_sve", tid,
                                      "we6_%d_%d" % (b, pass_id),
                                      (l1, h2), attrs={"kind": "lt"}).out,
                                  new("widen_add_sve", tid,
                                      "we7_%d_%d" % (b, pass_id),
                                      (l2, h1), attrs={"kind": "lt"}).out),
                                 attrs={"elem": "s32"})
                    w0 = new("permute", tid, "w0_%d_%d" % (b, pass_id),
                             (e0.out, e1.out), attrs={"kind": "zip1s"})
                    w1 = new("permute", tid, "w1_%d_%d" % (b, pass_id),
                             (e0.out, e1.out), attrs={"kind": "zip2s"})
                    u2 = new("permute", tid, "u2_%d_%d" % (b, pass_id),
                             (e2.out,), attrs={"kind": "revw_d32"})
                    u3 = new("permute", tid, "u3_%d_%d" % (b, pass_id),
                             (e3.out,), attrs={"kind": "revw_d32"})
                    w2 = new("permute", tid, "w2_%d_%d" % (b, pass_id),
                             (u3.out, u2.out), attrs={"kind": "zip1s"})
                    w3 = new("permute", tid, "w3_%d_%d" % (b, pass_id),
                             (u3.out, u2.out), attrs={"kind": "zip2s"})
                    s0 = new("sub", tid, "s0_%d_%d" % (b, pass_id),
                             (w0.out, w2.out), attrs={"elem": "s32"})
                    s1 = new("sub", tid, "s1_%d_%d" % (b, pass_id),
                             (w1.out, w3.out), attrs={"elem": "s32"})
                    s2 = new("add", tid, "s2_%d_%d" % (b, pass_id),
                             (w0.out, w2.out), attrs={"elem": "s32"})
                    s3 = new("add", tid, "s3_%d_%d" % (b, pass_id),
                             (w1.out, w3.out), attrs={"elem": "s32"})
                    v0 = new("permute", tid, "v0_%d_%d" % (b, pass_id),
                             (s2.out, s3.out), attrs={"kind": "uzp1d"})
                    v1 = new("permute", tid, "v1_%d_%d" % (b, pass_id),
                             (s2.out, s3.out), attrs={"kind": "uzp2d"})
                    v1r = new("permute", tid, "v1r_%d_%d" % (b, pass_id),
                              (v1.out,), attrs={"kind": "revw_d64"})
                    eep = new("add", tid, "EEp_%d_%d" % (b, pass_id),
                              (v0.out, v1r.out),
                              attrs={"elem": "s32", "view": "s64"})
                    eop = new("sub", tid, "EOp_%d_%d" % (b, pass_id),
                              (v0.out, v1r.out),
                              attrs={"elem": "s32", "view": "s64"})
                    if k0_shared_mul:
                        # shared EEp x 64 for k=0 and k=16
                        me = new("mul", "p%d.k0es.shared.p%d" % (pass_id, b),
                                 "k0me_%d_%d" % (b, pass_id),
                                 (eep.out,),
                                 attrs={"elem": "s32",
                                        "const_src": "K0EVEN[0]"})
                        ue = new("permute", "p%d.k0es.shared.p%d"
                                 % (pass_id, b),
                                 "k0ue_%d_%d" % (b, pass_id),
                                 (me.out, me.out),
                                 attrs={"kind": "uzp1s"})
                        ve = new("permute", "p%d.k0es.shared.p%d"
                                 % (pass_id, b),
                                 "k0ve_%d_%d" % (b, pass_id),
                                 (me.out, me.out),
                                 attrs={"kind": "uzp2s"})
                        se = new("add", "p%d.k0es.shared.p%d"
                                 % (pass_id, b),
                                 "k0se_%d_%d" % (b, pass_id),
                                 (ue.out, ve.out),
                                 attrs={"elem": "s32"})
                        de = new("sub", "p%d.k0es.shared.p%d"
                                 % (pass_id, b),
                                 "k0de_%d_%d" % (b, pass_id),
                                 (ue.out, ve.out),
                                 attrs={"elem": "s32"})
                        kvec[0].append(se.out)
                        kvec[16].append(de.out)
                        for k in (8, 24):
                            ktid = "p%d.k0es.k%d.p%d" % (pass_id, k, b)
                            cexpr = "K0EVEN[%d]" % (1 if k == 8 else 3)
                            m = new("mul", ktid,
                                    "k0m_%d_%d_%d" % (k, b, pass_id),
                                    (eop.out,),
                                    attrs={"elem": "s32",
                                           "const_src": cexpr})
                            pa = new("addp32", ktid,
                                     "k0p_%d_%d_%d" % (k, b, pass_id),
                                     (m.out, m.out), attrs={})
                            xa = new("permute", ktid,
                                     "k0x_%d_%d_%d" % (k, b, pass_id),
                                     (pa.out, pa.out),
                                     attrs={"kind": "uzp1s"})
                            kvec[k].append(xa.out)
                    else:
                        for k in K0_K:
                            ktid = "p%d.k0es.k%d.p%d" % (pass_id, k, b)
                            src = eep if k in (0, 16) else eop
                            cexpr = "K0EVEN[%d]" % (0 if k == 0 else
                                                    1 if k == 8 else
                                                    2 if k == 16 else 3)
                            m = new("mul", ktid,
                                    "k0m_%d_%d_%d" % (k, b, pass_id),
                                    (src.out,),
                                    attrs={"elem": "s32",
                                           "const_src": cexpr})
                            pa = new("addp32", ktid,
                                     "k0p_%d_%d_%d" % (k, b, pass_id),
                                     (m.out, m.out), attrs={})
                            xa = new("permute", ktid,
                                     "k0x_%d_%d_%d" % (k, b, pass_id),
                                     (pa.out, pa.out),
                                     attrs={"kind": "uzp1s"})
                            kvec[k].append(xa.out)
                # narrow/store: per k, merge the packs (row8) or store each
                for k in K0_K:
                    vecs = kvec[k]
                    if k0_merge8 and len(vecs) in (2, 4):
                        for pi in range(len(vecs) // 2):
                            ktid = "p%d.k0es.k%d" % (pass_id, k)
                            mg = new("permute", ktid,
                                     "k0mg_%d_%d_%d" % (k, pass_id, pi),
                                     (vecs[2 * pi], vecs[2 * pi + 1]),
                                     attrs={"kind": "tbl2s"})
                            na = new("narrow4_sve", ktid,
                                     "k0n_%d_%d_%d" % (k, pass_id, pi),
                                     (mg.out,),
                                     attrs={"shift": shift,
                                            "mode": "rshrn"})
                            nc = new("narrow", ktid,
                                     "k0c_%d_%d_%d" % (k, pass_id, pi),
                                     (na.out, na.out),
                                     attrs={"from": "s16", "to": "s16"})
                            pair_rows = packs[2 * pi] + packs[2 * pi + 1]
                            new("store", ktid, "", (nc.out,),
                                attrs={"base": "dst", "index": "k*32+i",
                                       "lanes": tuple(
                                           (pass_id, k, r)
                                           for r in pair_rows),
                                       "topology": "contiguous",
                                       "base_off": 8 * pi})
                    else:
                        for b, s in enumerate(vecs):
                            ktid = "p%d.k0es.k%d.p%d" % (pass_id, k, b)
                            na = new("narrow4_sve", ktid,
                                     "k0n_%d_%d_%d" % (k, b, pass_id),
                                     (s,),
                                     attrs={"shift": shift,
                                            "mode": "rshrn"})
                            nc = new("narrow", ktid,
                                     "k0c_%d_%d_%d" % (k, b, pass_id),
                                     (na.out, na.out),
                                     attrs={"from": "s16", "to": "s16"})
                            new("store", ktid, "", (nc.out,),
                                attrs={"base": "dst", "index": "k*32+i",
                                       "lanes": tuple((pass_id, k, r)
                                                      for r in
                                                      packs[b]),
                                       "topology": "contiguous",
                                       "base_off": 4 * b})
            else:
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
                        t = new("mul_reduce", tid,
                                "k0m_%d_%d" % (k, r), (src_val,),
                                attrs={"elem": "s32",
                                       "terms": (_g(k, 0), _g(k, 1)),
                                       "reduce": "scalar2",
                                       "lane_owner": "partial"})
                        rnd = new("round_shift", tid,
                                  "k0mr_%d_%d" % (k, r), (t.out,),
                                  attrs={"shift": shift, "epoch": pass_id,
                                         "mode": "half-up"})
                        new("store", tid, "", (rnd.out,),
                            attrs={"base": "dst", "index": "k*32+i",
                                   "lanes": ((pass_id, k, r),),
                                   "topology": "contiguous"})
    if sdot_indexed:
        for op in ops:
            if op.kind != "dot_segment":
                continue
            cs = op.attrs.get("const_src", "")
            m = op.attrs.get("slice", 0)
            k = int(op.tile_id.split(".")[2][1:])
            if cs.startswith("CODD"):
                op.attrs["const_src"] = "CODDI[%d][%d]" % (m, k // 4)
                op.attrs["index"] = 0 if k % 4 == 1 else 1
            elif cs.startswith("K2S"):
                op.attrs["const_src"] = "K2SI[%d][%d]" % (m, k // 8)
                op.attrs["index"] = 0 if k % 8 == 2 else 1
            elif cs.startswith("K4S"):
                op.attrs["const_src"] = "K4SI[%d]" % (k // 16)
                op.attrs["index"] = 0 if k % 16 == 4 else 1
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
        fam = parts[1]
        if fam == "k0es":
            fam = "k0"
        op_tiles.add("p%d.%s" % (int(parts[0][1:]), fam))
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
