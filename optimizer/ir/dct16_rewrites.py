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
}


def apply_rewrites(ops: List[Op], names: List[str]) -> List[Op]:
    for name in names:
        if name == "none":
            continue
        if name not in REWRITES:
            raise ValueError("unknown DCT16 rewrite %r" % name)
        ops = REWRITES[name](ops)
    return ops
