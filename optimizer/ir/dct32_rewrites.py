"""Op-level atomic rewrites for the DCT32 op DAG (P0, first increment).

The plan-level emitters already parameterize mechanisms; this module is the
first step toward *structure-space* search: named rewrites transform an
existing op DAG (list of Op) into a new one, with the same downstream op
names so consumers stay valid. Every rewrite keeps provenance checkable by
dct32_op_ir.provenance_report.
"""

from __future__ import annotations

from collections import defaultdict
import re
from typing import Dict, List, Tuple

from dct32_op_ir import Op


def _parse_m(out: str) -> int:
    """Extract slice index m from an X out name."""
    m = re.match(r"^(?:X|EX)(\d+)(?:_b\d+)?$", out)
    return int(m.group(1)) if m else 0


def rewrite_tbl2_to_zip(ops: List[Op]) -> List[Op]:
    """Replace tbl2 slice chains (p/q/X with i_m/ilo) by zip/trn permutes.

    For one chain (a,b,c,d) the four slices are:
      X0 = zip1(zip1(a,c), zip1(b,d))
      X1 = zip1(trn2(a,c), trn2(b,d))
      X2 = zip2(trn1(a,c), trn1(b,d))
      X3 = zip2(trn2(a,c), trn2(b,d))
    Prep permutes are shared across the m's of the same chain.
    """
    def pid(o: Op) -> int:
        return int(o.tile_id.split(".")[0][1:])

    by_out: Dict[Tuple[int, int, str], Op] = {
        (pid(o), o.attrs.get("g", 0), o.out): o for o in ops}
    # Pass 1: collect ilo-chains (key -> list of (m, X op)).
    chains = defaultdict(list)
    remove_pq = set()
    for op in ops:
        if not (op.kind == "permute" and op.attrs.get("kind") == "tbl2"
                and op.attrs.get("idx") == "ilo"):
            continue
        p = by_out.get((pid(op), op.attrs.get("g", 0), op.inputs[0]))
        q = by_out.get((pid(op), op.attrs.get("g", 0), op.inputs[1]))
        if not (p and q and p.kind == "permute" and q.kind == "permute"
                and p.attrs.get("kind") == "tbl2"
                and q.attrs.get("kind") == "tbl2"):
            continue
        key = (pid(op), op.attrs.get("g", 0),
               p.inputs[0], p.inputs[1], q.inputs[0], q.inputs[1])
        chains[key].append((_parse_m(op.out), op))
        remove_pq.add(p.op_id)
        remove_pq.add(q.op_id)

    counter = [0]

    def fresh(kind: str, tile_id: str, ins: Tuple[str, ...],
              attrs: dict) -> Op:
        counter[0] += 1
        oid = "rw%04d" % counter[0]
        return Op(oid, kind, tile_id, "rw_%s" % oid, ins, dict(attrs))

    emitted_prep: Dict[Tuple[str, str, str, str], Dict[str, Op]] = {}
    result: List[Op] = []

    for op in ops:
        if op.op_id in remove_pq:
            continue
        is_x = (op.kind == "permute" and op.attrs.get("kind") == "tbl2"
                and op.attrs.get("idx") == "ilo")
        if not is_x:
            result.append(op)
            continue
        p = by_out.get((pid(op), op.attrs.get("g", 0), op.inputs[0]))
        q = by_out.get((pid(op), op.attrs.get("g", 0), op.inputs[1]))
        if not (p and q and p.kind == "permute" and q.kind == "permute"
                and p.attrs.get("kind") == "tbl2"
                and q.attrs.get("kind") == "tbl2"):
            result.append(op)
            continue
        key = (pid(op), op.attrs.get("g", 0),
               p.inputs[0], p.inputs[1], q.inputs[0], q.inputs[1])
        if key not in emitted_prep:
            _, _, a, b, c, d = key
            prep: Dict[str, Op] = {}
            g = op.attrs.get("g", 0)
            need = {m for m, _ in chains[key]}
            if 0 in need:
                prep["z1a"] = fresh("permute", op.tile_id, (a, c),
                                    {"kind": "zip1d", "lane_owner": "output",
                                     "g": g})
                prep["z1b"] = fresh("permute", op.tile_id, (b, d),
                                    {"kind": "zip1d", "lane_owner": "output",
                                     "g": g})
            if need & {1, 3}:
                prep["t2a"] = fresh("permute", op.tile_id, (a, c),
                                    {"kind": "trn2d", "lane_owner": "output",
                                     "g": g})
                prep["t2b"] = fresh("permute", op.tile_id, (b, d),
                                    {"kind": "trn2d", "lane_owner": "output",
                                     "g": g})
            if 2 in need:
                prep["t1a"] = fresh("permute", op.tile_id, (a, c),
                                    {"kind": "trn1d", "lane_owner": "output",
                                     "g": g})
                prep["t1b"] = fresh("permute", op.tile_id, (b, d),
                                    {"kind": "trn1d", "lane_owner": "output",
                                     "g": g})
            emitted_prep[key] = prep
            result.extend(prep.values())
        prep = emitted_prep[key]
        m = _parse_m(op.out)
        if m == 0:
            kind, ia, ib = "zip1d", prep["z1a"].out, prep["z1b"].out
        elif m == 1:
            kind, ia, ib = "zip1d", prep["t2a"].out, prep["t2b"].out
        elif m == 2:
            kind, ia, ib = "zip2d", prep["t1a"].out, prep["t1b"].out
        else:
            if "t2a" not in prep:
                raise KeyError("t2a missing for %s tile=%s m=%d prep=%s"
                               % (op.out, op.tile_id, m, sorted(prep)))
            kind, ia, ib = "zip2d", prep["t2a"].out, prep["t2b"].out
        nx = Op(op.op_id, "permute", op.tile_id, op.out, (ia, ib),
                dict(op.attrs, kind=kind))
        result.append(nx)
    return result


REWRITES = {
    "tbl2_to_zip": rewrite_tbl2_to_zip,
}


def apply_rewrites(ops: List[Op], names: List[str]) -> List[Op]:
    """Apply named rewrites in order; unknown names raise."""
    out = list(ops)
    for name in names:
        if name not in REWRITES:
            raise ValueError("unknown op rewrite %r" % name)
        out = REWRITES[name](out)
    return out
