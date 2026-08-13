"""Op-level atomic rewrites for the DCT16 op DAG (cross-kernel port).

Same contract as dct32_rewrites: named rewrites transform an existing
op DAG (list of Op) into a new one, keeping downstream op names valid so
consumers stay wired. Rewrites must keep dct16_op_ir provenance
checkable (512 output lanes, dot terms, round epochs).

First increment (2026-08-13):
  - tbl2_to_zip: pass2 odd-quarter pack chain
    (PO01/PO23 tbl2 + QO0/QO1 tbl2) -> zip transpose chain, same QO names.
  - merge_narrow8: pass2 odd-k pairs of narrow8+store (store_merge16=0)
    -> one narrow16 + 16-lane store.
"""

from __future__ import annotations

import re
from typing import Dict, List, Optional, Tuple

from op_ir import Op


def _op_id_base(ops: List[Op]) -> int:
    mx = 0
    for o in ops:
        m = re.match(r"^(?:d16|rw)(\d+)$", o.op_id)
        if m:
            mx = max(mx, int(m.group(1)))
    return mx + 1


def rewrite_tbl2_to_zip(ops: List[Op]) -> List[Op]:
    """Replace the pass2 odd-quarter tbl2 pack chain with zip packs.

    Chain per group g (inputs zO[4g..4g+3]):
      PO01 = tbl2(zO0, zO1, iloq); PO23 = tbl2(zO2, zO3, iloq)
      QO0  = tbl2(PO01, PO23, q0q); QO1 = tbl2(PO01, PO23, q1q)
    Zip form (same QO0/QO1 outs):
      pa0..pa3 = view_s64(zO0..zO3)
      pt0 = zip1d(pa0,pa2); pt1 = zip2d(pa0,pa2)
      pt2 = zip1d(pa1,pa3); pt3 = zip2d(pa1,pa3)
      pp0 = zip1d(pt0,pt2); pp1 = zip2d(pt0,pt2)
      QO0 = view_s16(pp0); QO1 = view_s16(pp1)
    """
    by_out: Dict[str, Op] = {o.out: o for o in ops}
    packs: Dict[int, Dict[str, Op]] = {}
    for op in ops:
        if not (op.kind == "permute" and op.attrs.get("kind") == "tbl2"):
            continue
        m = re.match(r"^p2\.pack\.g(\d+)$", op.tile_id)
        if not m:
            continue
        g = int(m.group(1))
        idx = op.attrs.get("idx")
        if idx == "iloq":
            packs.setdefault(g, {})[
                "po01" if "PO01" in op.out else "po23"] = op
        elif idx == "q0q":
            packs.setdefault(g, {})["qo0"] = op
        elif idx == "q1q":
            packs.setdefault(g, {})["qo1"] = op
    groups = {}
    for g, d in packs.items():
        if all(k in d for k in ("po01", "po23", "qo0", "qo1")):
            po01, po23 = d["po01"], d["po23"]
            if po01.inputs and po23.inputs and \
                    po01.inputs[0] != po23.inputs[0]:
                groups[g] = (po01, po23, d["qo0"], d["qo1"])
    if not groups:
        return ops

    counter = [_op_id_base(ops)]

    def fresh(kind, tile_id, ins, attrs):
        counter[0] += 1
        return Op("rw%04d" % counter[0], kind, tile_id,
                  "rw_%s" % counter[0], tuple(ins), dict(attrs))

    prep_by_g: Dict[int, Tuple[List[Op], List[Op], List[Op]]] = {}
    prep_done = set()
    result = []
    for op in ops:
        is_pack = op.kind == "permute" and op.attrs.get("kind") == "tbl2" \
            and re.match(r"^p2\.pack\.g\d+$", op.tile_id) \
            and op.attrs.get("idx") in ("iloq", "q0q", "q1q")
        if is_pack:
            g = int(re.match(r"^p2\.pack\.g(\d+)$", op.tile_id).group(1))
            if g not in groups:
                result.append(op)
                continue
            po01, po23, qo0, qo1 = groups[g]
            if op.op_id in (po01.op_id, po23.op_id):
                if op.op_id == po01.op_id and g not in prep_done:
                    # build prep now (zO inputs are defined earlier)
                    a, b, c, d = po01.inputs[0], po01.inputs[1], \
                        po23.inputs[0], po23.inputs[1]
                    pa = [fresh("permute", op.tile_id, (x,),
                                {"kind": "view_s64", "arch": "sve"})
                          for x in (a, b, c, d)]
                    pt0 = fresh("permute", op.tile_id,
                                (pa[0].out, pa[2].out),
                                {"kind": "zip1d", "arch": "sve"})
                    pt1 = fresh("permute", op.tile_id,
                                (pa[0].out, pa[2].out),
                                {"kind": "zip2d", "arch": "sve"})
                    pt2 = fresh("permute", op.tile_id,
                                (pa[1].out, pa[3].out),
                                {"kind": "zip1d", "arch": "sve"})
                    pt3 = fresh("permute", op.tile_id,
                                (pa[1].out, pa[3].out),
                                {"kind": "zip2d", "arch": "sve"})
                    pp0 = fresh("permute", op.tile_id, (pt0.out, pt2.out),
                                {"kind": "zip1d", "arch": "sve"})
                    pp1 = fresh("permute", op.tile_id, (pt0.out, pt2.out),
                                {"kind": "zip2d", "arch": "sve"})
                    prep_by_g[g] = (pa, [pt0, pt1, pt2, pt3], [pp0, pp1])
                    result.extend(pa)
                    result.extend([pt0, pt1, pt2, pt3])
                    result.extend([pp0, pp1])
                    prep_done.add(g)
                continue
            # QO0/QO1 replacement
            if g not in prep_by_g:
                result.append(op)
                continue
            _, pts, pps = prep_by_g[g]
            qop = qo0 if op.attrs.get("idx") == "q0q" else qo1
            nq = Op(qop.op_id, "permute", qop.tile_id, qop.out,
                    (pps[0].out if op.attrs.get("idx") == "q0q"
                     else pps[1].out,),
                    dict(qop.attrs, kind="view_s16"))
            result.append(nq)
            continue
        else:
            result.append(op)
    return result


def rewrite_merge_narrow8(ops: List[Op]) -> List[Op]:
    """Pass2 odd-k: merge two narrow8+store pairs into one narrow16+
    16-lane store (store_merge16=0 -> 1). For each odd k the op DAG has
    d0..d3 (4 group dots), nn_01=narrow8(d0,d1), st(8 lanes at 16*k),
    nn_23=narrow8(d2,d3), st(8 lanes at 16*k+8).
    """
    by_out: Dict[str, Op] = {o.out: o for o in ops}
    pairs: Dict[int, List[Op]] = {}
    for op in ops:
        if op.kind != "narrow8" or not op.tile_id.startswith("p2.odd.k"):
            continue
        k = int(re.match(r"^p2\.odd\.k(\d+)$", op.tile_id).group(1))
        pairs.setdefault(k, []).append(op)
    targets = {}
    for k, nns in pairs.items():
        if len(nns) != 2:
            continue
        nns = sorted(nns, key=lambda o: _store_base(o, by_out))
        b0 = _store_base(nns[0], by_out)
        b1 = _store_base(nns[1], by_out)
        if (b0, b1) == (4 * k, 4 * k + 8):
            targets[k] = (nns[0], nns[1])
    if not targets:
        return ops

    counter = [_op_id_base(ops)]

    def fresh(kind, tile_id, ins, attrs):
        counter[0] += 1
        return Op("rw%04d" % counter[0], kind, tile_id,
                  "rw_%s" % counter[0], tuple(ins), dict(attrs))

    remove = set()
    insert_at = {}
    for k, (nn0, nn1) in targets.items():
        st0 = _store_of(nn0, by_out)
        st1 = _store_of(nn1, by_out)
        if not (st0 and st1):
            continue
        dots = (nn0.inputs[0], nn0.inputs[1], nn1.inputs[0], nn1.inputs[1])
        nn = fresh("narrow16", "p2.odd.k%d" % k, dots,
                   {"shift": nn0.attrs.get("shift", 10),
                    "mode": nn0.attrs.get("mode", "rshrn")})
        st = fresh("store", "p2.odd.k%d" % k, (nn.out,),
                   {"arch": "sve", "base": "dst", "index": "16*k",
                    "lanes": tuple((2, k, r) for r in range(16)),
                    "topology": "contiguous", "n_lanes": 16})
        remove.update({nn0.op_id, nn1.op_id, st0.op_id, st1.op_id})
        insert_at[st1.op_id] = [nn, st]
    result = []
    for op in ops:
        if op.op_id in insert_at:
            result.extend(insert_at[op.op_id])
        if op.op_id in remove:
            continue
        result.append(op)
    return result


def rewrite_legacy_even_sve(ops: List[Op]) -> List[Op]:
    """Replace the pass2 NEON even path with the pure-SVE even_sve block
    (the 699/704 family): zip quarters q0..q3 -> QO (kept) + QEOW
    (saddlb/saddlt + zip/revw + uzp1_wide) + EEp/EOp
    (uzp1d/revw_d64 + s32 add/sub) -> T8E8 mul + addp32 -> qrshrn +
    uzp1 + st1d_scatter for k=0/4/8/12; legacy QEOW single-const SDOT
    loop for k=2/6/10/14. Also flips every narrow op to qrshrn (legacy
    semantics) and marks pass2 odd narrow16 stores qrshrn.
    """
    by_out: Dict[str, Op] = {o.out: o for o in ops}
    # pass1/pass2 narrow ops -> qrshrn (legacy saturation)
    narrow_kinds = ("narrow4", "narrow8", "narrow16", "narrow4_sve")
    ops = [Op(o.op_id, o.kind, o.tile_id, o.out, o.inputs,
              dict(o.attrs, mode="qrshrn")) if o.kind in narrow_kinds
           else o for o in ops]
    by_out = {o.out: o for o in ops}

    p2 = [o for o in ops if o.tile_id.startswith("p2.")]
    even_stores = [o for o in p2 if o.kind == "store"
                   and re.match(r"^p2\.(?:k2\.k\d+|k\d+\.k\d+)\.g\d+$",
                                o.tile_id)]
    if not even_stores:
        return ops
    first_even = min(ops.index(o) for o in even_stores)
    # butterfly chain to remove (feeders of even stores), keeping z/rev/zO
    remove = set(o.op_id for o in even_stores)
    for o in p2:
        if o.tile_id.startswith("p2.leaf."):
            if o.kind == "load" or (o.kind == "permute"
                                    and o.attrs.get("kind") == "rev_sve") \
                    or (o.kind == "sub" and o.attrs.get("elem") == "s16"):
                continue
            remove.add(o.op_id)
        elif o.kind in ("neon_mul", "neon_padd", "neon_narrow") \
                and re.match(r"^p2\.(?:k2\.k\d+|k\d+\.k\d+)\.g\d+$",
                             o.tile_id):
            remove.add(o.op_id)
        elif o.kind == "load" and o.attrs.get("arch") == "neon-const" \
                and re.match(r"^p2\.(?:k2\.k\d+|k\d+\.k\d+)\.g\d+$",
                             o.tile_id):
            remove.add(o.op_id)
    # z loads and pack QO names
    z = {}
    qo0 = {}
    qo1 = {}
    for o in p2:
        m = re.match(r"^p2\.leaf\.row(\d+)$", o.tile_id)
        if m and o.kind == "load" and o.attrs.get("arch") == "sve":
            z[int(m.group(1))] = o.out
        m = re.match(r"^p2\.pack\.g(\d+)$", o.tile_id)
        if m and o.kind == "permute":
            if o.out.startswith("QO0"):
                qo0[int(m.group(1))] = o.out
            elif o.out.startswith("QO1"):
                qo1[int(m.group(1))] = o.out
    if len(z) != 16 or len(qo0) != 4 or len(qo1) != 4:
        return ops
    # The pack section (tbl2 or zip) is replaced by the even_sve block's
    # own quarters; old QO outputs are rebuilt from q0..q3 with the same
    # names so the odd dots stay wired (zO/rev become dead and DCE'd).
    remove |= {o.op_id for o in p2
               if re.match(r"^p2\.pack\.g\d+$", o.tile_id)}

    counter = [_op_id_base(ops)]
    new_ops: List[Op] = []

    def fresh(kind, tile_id, ins, attrs, out=None):
        counter[0] += 1
        op = Op("rw%04d" % counter[0], kind, tile_id,
                out or "rw_%s" % counter[0], tuple(ins), dict(attrs))
        new_ops.append(op)
        return op

    qeow = {}
    for g in range(4):
        tid = "p2.evensve.g%d" % g
        base = 4 * g
        a = [fresh("permute", tid, (z[base + m],),
                   {"kind": "view_s64", "arch": "sve"}) for m in range(4)]
        t = [fresh("permute", tid, (a[0].out, a[2].out),
                   {"kind": "zip1d", "arch": "sve"}),
             fresh("permute", tid, (a[0].out, a[2].out),
                   {"kind": "zip2d", "arch": "sve"}),
             fresh("permute", tid, (a[1].out, a[3].out),
                   {"kind": "zip1d", "arch": "sve"}),
             fresh("permute", tid, (a[1].out, a[3].out),
                   {"kind": "zip2d", "arch": "sve"})]
        p0 = fresh("permute", tid, (t[0].out, t[2].out),
                   {"kind": "zip1d", "arch": "sve"})
        p1 = fresh("permute", tid, (t[0].out, t[2].out),
                   {"kind": "zip2d", "arch": "sve"})
        p2_ = fresh("permute", tid, (t[1].out, t[3].out),
                    {"kind": "zip1d", "arch": "sve"})
        p3 = fresh("permute", tid, (t[1].out, t[3].out),
                   {"kind": "zip2d", "arch": "sve"})
        q0 = fresh("permute", tid, (p0.out,),
                   {"kind": "view_s16", "arch": "sve"})
        q1 = fresh("permute", tid, (p1.out,),
                   {"kind": "view_s16", "arch": "sve"})
        q2 = fresh("permute", tid,
                   (fresh("permute", tid, (p2_.out,),
                          {"kind": "view_s16", "arch": "sve"}).out,),
                   {"kind": "revh_d", "arch": "sve"})
        q3 = fresh("permute", tid,
                   (fresh("permute", tid, (p3.out,),
                          {"kind": "view_s16", "arch": "sve"}).out,),
                   {"kind": "revh_d", "arch": "sve"})
        fresh("sub", tid, (q0.out, q3.out),
              {"elem": "s16", "arch": "sve"}, out=qo0[g])
        fresh("sub", tid, (q1.out, q2.out),
              {"elem": "s16", "arch": "sve"}, out=qo1[g])
        e = [fresh("widen_add_sve", tid, (q0.out, q3.out), {"kind": "lb"}),
             fresh("widen_add_sve", tid, (q0.out, q3.out), {"kind": "lt"}),
             fresh("widen_add_sve", tid, (q1.out, q2.out), {"kind": "lb"}),
             fresh("widen_add_sve", tid, (q1.out, q2.out), {"kind": "lt"})]
        w0 = fresh("permute", tid, (e[0].out, e[1].out),
                   {"kind": "zip1s", "arch": "sve"})
        w1 = fresh("permute", tid, (e[0].out, e[1].out),
                   {"kind": "zip2s", "arch": "sve"})
        u2 = fresh("permute", tid, (e[2].out,),
                   {"kind": "revw_d32", "arch": "sve"})
        u3 = fresh("permute", tid, (e[3].out,),
                   {"kind": "revw_d32", "arch": "sve"})
        w2 = fresh("permute", tid, (u3.out, u2.out),
                   {"kind": "zip1s", "arch": "sve"})
        w3 = fresh("permute", tid, (u3.out, u2.out),
                   {"kind": "zip2s", "arch": "sve"})
        s0 = fresh("sub", tid, (w0.out, w2.out),
                   {"elem": "s32", "arch": "sve"})
        s1 = fresh("sub", tid, (w1.out, w3.out),
                   {"elem": "s32", "arch": "sve"})
        s2 = fresh("add", tid, (w0.out, w2.out),
                   {"elem": "s32", "arch": "sve"})
        s3 = fresh("add", tid, (w1.out, w3.out),
                   {"elem": "s32", "arch": "sve"})
        qeow[g] = fresh("permute", tid, (s0.out, s1.out),
                        {"kind": "uzp1_wide", "arch": "sve"}).out
        v0 = fresh("permute", tid, (s2.out, s3.out),
                   {"kind": "uzp1d", "arch": "sve"})
        v1 = fresh("permute", tid, (s2.out, s3.out),
                   {"kind": "uzp2d", "arch": "sve"})
        v1r = fresh("permute", tid, (v1.out,),
                    {"kind": "revw_d64", "arch": "sve"})
        eep = fresh("add", tid, (v0.out, v1r.out),
                    {"elem": "s32", "arch": "sve", "view": "s64"})
        eop = fresh("sub", tid, (v0.out, v1r.out),
                    {"elem": "s32", "arch": "sve", "view": "s64"})
        m = []
        for i, (src, cexpr) in enumerate(
                ((eep, "T8E8[0]"), (eop, "T8E8[1]"),
                 (eep, "T8E8[2]"), (eop, "T8E8[3]"))):
            fresh("load", tid, (),
                  {"arch": "sve-const", "elem": "s32", "const": cexpr})
            m.append(fresh("mul", tid, (src.out,),
                           {"elem": "s32", "arch": "sve",
                            "const_src": cexpr}))
        pa = fresh("addp32", tid, (m[0].out, m[2].out), {})
        pb = fresh("addp32", tid, (m[1].out, m[3].out), {})
        xa = fresh("permute", tid, (pa.out, pb.out),
                   {"kind": "uzp1s", "arch": "sve"})
        xb = fresh("permute", tid, (pa.out, pb.out),
                   {"kind": "uzp2s", "arch": "sve"})
        na = fresh("narrow4_sve", tid, (xa.out,),
                   {"shift": 10, "mode": "qrshrn"})
        nb = fresh("narrow4_sve", tid, (xb.out,),
                   {"shift": 10, "mode": "qrshrn"})
        n16 = fresh("permute", tid, (na.out, nb.out),
                    {"kind": "uzp1_wide", "arch": "sve",
                     "inputs_s16": True})
        fresh("store", tid, (n16.out,),
              {"arch": "sve-scatter", "base": "dst",
               "index": "scatter 4*g",
               "lanes": tuple((2, k, 4 * g + j)
                              for k in (0, 4, 8, 12) for j in range(4)),
               "topology": "scatter", "n_lanes": 4, "evoffs": "EVEN_OFFS"})
    # legacy QEOW SDOT loop for k = 2,6,10,14
    for k in (2, 6, 10, 14):
        tid = "p2.legacy.k%d" % k
        clo = "CQ_LO[%d]" % k
        fresh("load", tid, (),
              {"arch": "sve-const", "elem": "s16", "const": clo})
        dots = []
        for g in range(4):
            dots.append(fresh(
                "dot_segment", "p2.legacy.k%d.g%d" % (k, g), (qeow[g],),
                {"arch": "sve", "acc_bits": 64, "lane_owner": "output",
                 "terms": tuple("G[%d][%d]" % (k, j) for j in range(8)),
                 "const_src": clo}))
        nn = fresh("narrow16", tid, tuple(d.out for d in dots),
                   {"shift": 10, "mode": "qrshrn"})
        fresh("store", tid, (nn.out,),
              {"arch": "sve", "base": "dst", "index": "16*k",
               "lanes": tuple((2, k, r) for r in range(16)),
               "topology": "contiguous", "n_lanes": 16})

    # Split new_ops into per-group blocks + trailing QEOW loop, inserted
    # at each group's first even-store position (closer to the layout's
    # interleaved order).
    blocks: Dict[int, List[Op]] = {g: [] for g in range(4)}
    tail: List[Op] = []
    for o in new_ops:
        m = re.match(r"^p2\.evensve\.g(\d+)$", o.tile_id)
        if m:
            blocks[int(m.group(1))].append(o)
        else:
            tail.append(o)
    even_pos = {}
    for g in range(4):
        pos = [ops.index(o) for o in even_stores
               if int(re.match(r"^p2\.(?:k2\.k\d+|k\d+\.k\d+)\.g(\d+)$",
                               o.tile_id).group(1)) == g]
        if pos:
            even_pos[g] = min(pos)
    result = []
    inserted_g = set()
    tail_done = False
    for i, op in enumerate(ops):
        for g in sorted(even_pos):
            if even_pos[g] == i and g not in inserted_g:
                result.extend(blocks[g])
                inserted_g.add(g)
        if inserted_g and inserted_g == set(even_pos) and not tail_done:
            result.extend(tail)
            tail_done = True
        if op.op_id in remove:
            continue
        result.append(op)
    if not tail_done:
        result = ops
    return result


def _store_base(nn: Op, by_out: Dict[str, Op]) -> int:
    st = _store_of(nn, by_out)
    if not st:
        return -1
    lanes = st.attrs.get("lanes", ())
    return lanes[0][2] if lanes else -1


def _store_of(nn: Op, by_out: Dict[str, Op]) -> Optional[Op]:
    for o in by_out.values():
        if o.kind == "store" and o.inputs and o.inputs[0] == nn.out:
            return o
    return None


REWRITES = {
    "tbl2_to_zip": rewrite_tbl2_to_zip,
    "merge_narrow8": rewrite_merge_narrow8,
    "legacy_even_sve": rewrite_legacy_even_sve,
}


def apply_rewrites(ops: List[Op], names: List[str]) -> List[Op]:
    # Lowerings each start their op_id counter at d16%04d; renumber the
    # combined DAG once so op_ids are globally unique (rewrites keyed by
    # op_id depend on this).
    ops = [Op("d16%04d" % (i + 1), o.kind, o.tile_id, o.out, o.inputs,
              dict(o.attrs)) for i, o in enumerate(ops)]
    for name in names:
        if name == "none":
            continue
        if name not in REWRITES:
            raise ValueError("unknown DCT16 rewrite %r" % name)
        ops = REWRITES[name](ops)
    return ops
