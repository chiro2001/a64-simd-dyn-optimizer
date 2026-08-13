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


K2_K = tuple(range(2, 32, 4))


def rewrite_legacy_k2(ops: List[Op]) -> List[Op]:
    """Pass2 k2: replace per-row s32 mul_reduce with EX slices + sdot.d.

    Adds EO16 (s16) to the pass2 leaf when missing, builds tbl2 EX slices
    per 4-row group, and replaces each k2 row chain
    (mul_reduce -> round_shift -> scalar store) with
    (dot_segment x2 -> accumulate -> round_shift -> narrow -> store4).
    Only row_group=4 is handled; row8 pass2 k2 is already EX under legacy.
    """
    pid = 2
    counter = [0]

    def fresh(kind, tile_id, out, ins, attrs):
        counter[0] += 1
        return Op("rw%04d" % counter[0], kind, tile_id, out,
                  tuple(ins), dict(attrs))

    by_out = {(pid, o.attrs.get("g", 0), o.out): o for o in ops}

    # Per-group leaf inputs and existing k2 mul chains.
    leaf = {}
    muls = {}
    for op in ops:
        if op.tile_id.startswith("p2.leaf.row"):
            row = int(op.tile_id.rsplit("row", 1)[1])
            g = op.attrs.get("g", 0)
            leaf.setdefault((g, row), {})[op.out] = op
        if op.kind == "mul_reduce" and op.tile_id.startswith("p2.k2.k"):
            parts = op.tile_id.split(".")
            k = int(parts[2][1:])
            row = int(parts[3][3:])
            g = op.attrs.get("g", 0)
            muls[(g, k, row)] = op

    groups = {}
    for (g, row) in leaf:
        groups.setdefault(g, []).append(row)
    groups = {g: sorted(rows) for g, rows in groups.items()}

    remove = set()
    insert_at = {}          # first-mul op_id -> list of ops to insert
    group_inserted = set()

    for g in sorted(groups):
        rows = groups[g]
        if len(rows) != 4:
            continue
        eo16 = {}
        for r in rows:
            lo = leaf[(g, r)].get("lo_%d" % r)
            rv = leaf[(g, r)].get("rv_%d" % r)
            if lo is None or rv is None:
                continue
            E16 = fresh("add", "p2.leaf.row%d" % r, "E16_%d" % r,
                        (lo.out, rv.out), {"elem": "s16", "g": g})
            E16r = fresh("rev", "p2.leaf.row%d" % r, "E16r_%d" % r,
                         (E16.out,), {"elem": "s16", "g": g})
            EO16 = fresh("sub", "p2.leaf.row%d" % r, "EO16_%d" % r,
                         (E16.out, E16r.out),
                         {"elem": "s16", "lane_owner": "partial", "g": g})
            eo16[r] = EO16.out
            leaf[(g, r)]["E16_%d" % r] = E16
            leaf[(g, r)]["E16r_%d" % r] = E16r
            leaf[(g, r)]["EO16_%d" % r] = EO16

        ex_e = []
        ex_f = []
        for m in (0, 1):
            ex_e.append(fresh(
                "permute", "p2.k2.slice", "e%d" % m,
                (eo16[rows[0]], eo16[rows[1]]),
                {"kind": "tbl2", "idx": "i%d" % m,
                 "lane_owner": "output", "g": g}))
            ex_f.append(fresh(
                "permute", "p2.k2.slice", "f%d" % m,
                (eo16[rows[2]], eo16[rows[3]]),
                {"kind": "tbl2", "idx": "i%d" % m,
                 "lane_owner": "output", "g": g}))
        ex = [fresh("permute", "p2.k2.slice", "EX%d" % m,
                    (ex_e[m].out, ex_f[m].out),
                    {"kind": "tbl2", "idx": "ilo",
                     "lane_owner": "output", "g": g})
              for m in (0, 1)]

        for k in K2_K:
            row_muls = [muls.get((g, k, r)) for r in rows]
            if not all(row_muls):
                continue
            anchor = row_muls[0]
            ops_new = []
            if g not in group_inserted:
                for r in rows:
                    ops_new.extend(
                        [leaf[(g, r)]["E16_%d" % r],
                         leaf[(g, r)]["E16r_%d" % r],
                         leaf[(g, r)]["EO16_%d" % r]])
                ops_new.extend(ex_e)
                ops_new.extend(ex_f)
                ops_new.extend(ex)
                group_inserted.add(g)
            t0 = fresh("dot_segment", "p2.k2.k%d" % k, "k2t0_%d" % k,
                       (ex[0].out,),
                       {"acc_bits": 64, "lane_owner": "output", "slice": 0,
                        "terms": tuple("G[%d][%d]" % (k, j)
                                       for j in range(4)),
                        "const_src": "K2S[%d][0]" % (k // 4), "g": g})
            t1 = fresh("dot_segment", "p2.k2.k%d" % k, "k2t1_%d" % k,
                       (ex[1].out,),
                       {"acc_bits": 64, "lane_owner": "output", "slice": 1,
                        "terms": tuple("G[%d][%d]" % (k, 4 + j)
                                       for j in range(4)),
                        "const_src": "K2S[%d][1]" % (k // 4), "g": g})
            acc = fresh("accumulate", "p2.k2.k%d" % k, "k2acc_%d" % k,
                        (t0.out, t1.out), {"acc_bits": 64, "g": g})
            rnd = fresh("round_shift", "p2.k2.k%d" % k, "k2rnd_%d" % k,
                        (acc.out,),
                        {"shift": 11, "epoch": 2, "mode": "half-up", "g": g})
            nar = fresh("narrow", "p2.k2.k%d" % k, "k2nar_%d" % k,
                        (rnd.out,),
                        {"from": "s64", "to": "s16",
                         "kind": "uzp+rshrnb+uzp", "g": g})
            st = fresh("store", "p2.k2.k%d" % k, "",
                       (nar.out,),
                       {"base": "dst", "index": "k*32+i",
                        "lanes": tuple((2, k, r) for r in rows),
                        "topology": "contiguous",
                        "row_group": 4, "base_off": 0, "g": g})
            ops_new.extend([t0, t1, acc, rnd, nar, st])
            insert_at[anchor.op_id] = ops_new
            for m in row_muls:
                remove.add(m.op_id)
                rnd_o = None
                st_o = None
                for o in ops:
                    if o.kind == "round_shift" and o.inputs \
                            and o.inputs[0] == m.out \
                            and o.attrs.get("g", 0) == g:
                        rnd_o = o
                    if o.kind == "store" and o.inputs and rnd_o \
                            and o.inputs[0] == rnd_o.out:
                        st_o = o
                if rnd_o:
                    remove.add(rnd_o.op_id)
                if st_o:
                    remove.add(st_o.op_id)

    result = []
    for op in ops:
        if op.op_id in insert_at:
            result.extend(insert_at[op.op_id])
        if op.op_id in remove:
            continue
        result.append(op)
    return result


REWRITES["legacy_k2"] = rewrite_legacy_k2


def apply_rewrites(ops: List[Op], names: List[str]) -> List[Op]:
    """Apply named rewrites in order; unknown names raise."""
    out = list(ops)
    for name in names:
        if name not in REWRITES:
            raise ValueError("unknown op rewrite %r" % name)
        out = REWRITES[name](out)
    return out
