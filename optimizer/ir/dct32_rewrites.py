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
from dot_ir import canonicalize_dot_ops, dot_summary, legal_lowerings


def _parse_m(out: str) -> int:
    """Extract slice index m from an X out name."""
    for pat in (r"^(?:k2EX|EX|X)(\d+)(?:_\d+)?_b\d+$",
                r"^(?:k2EX|EX|X)(\d+)$"):
        m = re.match(pat, out)
        if m:
            return int(m.group(1))
    return 0


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


def _op_id_base(ops: List[Op]) -> int:
    mx = 0
    for o in ops:
        m = re.match(r"^(?:op|rw)(\d+)$", o.op_id)
        if m:
            mx = max(mx, int(m.group(1)))
    return mx + 1


def rewrite_legacy_k2(ops: List[Op]) -> List[Op]:
    """Pass2 k2: replace per-row s32 mul_reduce with EX slices + sdot.d.

    Adds EO16 (s16) to the pass2 leaf when missing, builds tbl2 EX slices
    per 4-row group, and replaces each k2 row chain
    (mul_reduce -> round_shift -> scalar store) with
    (dot_segment x2 -> accumulate -> round_shift -> narrow -> store4).
    Only row_group=4 is handled; row8 pass2 k2 is already EX under legacy.
    """
    pid = 2
    counter = [_op_id_base(ops)]
    created = set()

    def fresh(kind, tile_id, out, ins, attrs):
        counter[0] += 1
        op = Op("rw%04d" % counter[0], kind, tile_id, out,
                tuple(ins), dict(attrs))
        created.add(op.op_id)
        return op

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
                            and o.tile_id.startswith("p2.") \
                            and o.attrs.get("g", 0) == g:
                        rnd_o = o
                    if o.kind == "store" and o.inputs and rnd_o \
                            and o.tile_id.startswith("p2.") \
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


K4_K = tuple(range(4, 32, 8))


def rewrite_legacy_k4(ops: List[Op]) -> List[Op]:
    """Both-pass k4: replace per-row s32 mul_reduce with EEO16 slice + sdot.

    Adds E16/EE16/EEO16 to the leaf when missing, builds a tbl2 Xk4 slice
    per 4-row group, and replaces each k4 row chain with
    (dot_segment -> round_shift -> narrow -> store4). row_group=4 only.
    """
    counter = [_op_id_base(ops)]
    created = set()

    def fresh(kind, tile_id, out, ins, attrs):
        counter[0] += 1
        op = Op("rw%04d" % counter[0], kind, tile_id, out,
                tuple(ins), dict(attrs))
        created.add(op.op_id)
        return op

    remove = set()
    insert_at = {}
    group_inserted = set()

    for pid in (1, 2):
        by_out = {(pid, o.attrs.get("g", 0), o.out): o for o in ops}
        leaf = {}
        muls = {}
        for op in ops:
            tid = op.tile_id
            if tid.startswith("p%d.leaf.row" % pid):
                row = int(tid.rsplit("row", 1)[1])
                g = op.attrs.get("g", 0)
                leaf.setdefault((g, row), {})[op.out] = op
            if op.kind == "mul_reduce" and \
                    tid.startswith("p%d.k4.k" % pid):
                parts = tid.split(".")
                k = int(parts[2][1:])
                row = int(parts[3][3:])
                g = op.attrs.get("g", 0)
                muls[(g, k, row)] = op
        groups = {}
        for (g, row) in leaf:
            groups.setdefault(g, []).append(row)
        groups = {g: sorted(rows) for g, rows in groups.items()}
        for g in sorted(groups):
            rows = groups[g]
            if len(rows) != 4:
                continue
            eeo16 = {}
            for r in rows:
                lo = leaf[(g, r)].get("lo_%d" % r)
                rv = leaf[(g, r)].get("rv_%d" % r)
                if lo is None or rv is None:
                    continue
                E16 = leaf[(g, r)].get("E16_%d" % r)
                if E16 is None:
                    E16 = fresh("add", "p%d.leaf.row%d" % (pid, r),
                                "E16_%d" % r, (lo.out, rv.out),
                                {"elem": "s16", "g": g})
                    leaf[(g, r)]["E16_%d" % r] = E16
                E16rr = fresh("permute", "p%d.leaf.row%d" % (pid, r),
                              "E16rr_%d" % r, (E16.out,),
                              {"kind": "rev16", "g": g})
                EE16 = fresh("add", "p%d.leaf.row%d" % (pid, r),
                             "EE16_%d" % r, (E16.out, E16rr.out),
                             {"elem": "s16", "g": g})
                EEr8 = fresh("permute", "p%d.leaf.row%d" % (pid, r),
                             "EEr16_%d" % r, (EE16.out,),
                             {"kind": "tbl", "idx": "rev8", "g": g})
                EEO16 = fresh("sub", "p%d.leaf.row%d" % (pid, r),
                              "EEO16_%d" % r, (EE16.out, EEr8.out),
                              {"elem": "s16", "lane_owner": "partial",
                               "g": g})
                eeo16[r] = EEO16.out
                leaf[(g, r)]["E16rr_%d" % r] = E16rr
                leaf[(g, r)]["EE16_%d" % r] = EE16
                leaf[(g, r)]["EEr16_%d" % r] = EEr8
                leaf[(g, r)]["EEO16_%d" % r] = EEO16
            pk4 = fresh("permute", "p%d.k4.slice" % pid, "pk4",
                        (eeo16[rows[0]], eeo16[rows[1]]),
                        {"kind": "tbl2", "idx": "i0",
                         "lane_owner": "output", "g": g})
            qk4 = fresh("permute", "p%d.k4.slice" % pid, "qk4",
                        (eeo16[rows[2]], eeo16[rows[3]]),
                        {"kind": "tbl2", "idx": "i0",
                         "lane_owner": "output", "g": g})
            xk4 = fresh("permute", "p%d.k4.slice" % pid, "Xk4",
                        (pk4.out, qk4.out),
                        {"kind": "tbl2", "idx": "ilo",
                         "lane_owner": "output", "g": g})
            for k in K4_K:
                row_muls = [muls.get((g, k, r)) for r in rows]
                if not all(row_muls):
                    continue
                anchor = row_muls[0]
                ops_new = []
                if (pid, g) not in group_inserted:
                    for r in rows:
                        for nm in ("E16_%d" % r, "E16rr_%d" % r,
                                   "EE16_%d" % r, "EEr16_%d" % r,
                                   "EEO16_%d" % r):
                            o = leaf[(g, r)][nm]
                            if o.op_id in created:
                                ops_new.append(o)
                    ops_new.extend([pk4, qk4, xk4])
                    group_inserted.add((pid, g))
                t = fresh("dot_segment", "p%d.k4.k%d" % (pid, k),
                          "k4t_%d" % k, (xk4.out,),
                          {"acc_bits": 64, "lane_owner": "output",
                           "slice": 0, "nconst": 1,
                           "terms": tuple("G[%d][%d]" % (k, j)
                                          for j in range(4)),
                           "const_src": "K4S[%d]" % (k // 8), "g": g})
                rnd = fresh("round_shift", "p%d.k4.k%d" % (pid, k),
                            "k4rnd_%d" % k, (t.out,),
                            {"shift": 4 if pid == 1 else 11,
                             "epoch": pid, "mode": "half-up", "g": g})
                nar = fresh("narrow", "p%d.k4.k%d" % (pid, k),
                            "k4nar_%d" % k, (rnd.out,),
                            {"from": "s64", "to": "s16",
                             "kind": "uzp+rshrnb+uzp", "g": g})
                st = fresh("store", "p%d.k4.k%d" % (pid, k), "",
                           (nar.out,),
                           {"base": "dst", "index": "k*32+i",
                            "lanes": tuple((pid, k, r) for r in rows),
                            "topology": "contiguous",
                            "row_group": 4, "base_off": 0, "g": g})
                ops_new.extend([t, rnd, nar, st])
                insert_at[anchor.op_id] = ops_new
                for m in row_muls:
                    remove.add(m.op_id)
                    rnd_o = st_o = None
                    for o in ops:
                        if o.kind == "round_shift" and o.inputs \
                                and o.inputs[0] == m.out \
                                and o.tile_id.startswith("p%d." % pid) \
                                and o.attrs.get("g", 0) == g:
                            rnd_o = o
                        if o.kind == "store" and o.inputs and rnd_o \
                                and o.tile_id.startswith("p%d." % pid) \
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


REWRITES["legacy_k4"] = rewrite_legacy_k4


def rewrite_k0_even_sve(ops: List[Op]) -> List[Op]:
    """Replace the scalar k0 family (extract2 + scalar2 mul) with the
    quarter EEp/EOp structure (k0_even_sve mechanism, docs/20 §5.12).

    Applies to a legacy DAG (E16/EO16/EEO16 present) with the per-row s32
    E-chain whose only consumer is k0. Removes the s32 chain + scalar k0
    ops and inserts per-4-row packs:
      lo/hi packs -> e0..e3 (s32, no s16 wrap) -> w/s/u/v ->
      EEp/EOp -> per k: mul(K0EVEN) + addp + uzp1 + rshrnb +
      uzp1_s16 + st1(pg4h).
    """
    K0EVEN_IDX = {0: 0, 8: 1, 16: 2, 24: 3}
    K0_K = (0, 8, 16, 24)

    def pid(o: Op) -> int:
        return int(o.tile_id.split(".")[0][1:])

    by_out = {o.out: o for o in ops}
    by_id = {o.op_id: o for o in ops}
    k0_stores = [o for o in ops
                 if o.kind == "store"
                 and re.match(r"^p\d\.k0\.k\d+\.row\d+$", o.tile_id)]
    if not k0_stores:
        return ops
    # must be legacy structure: EO16 + EEO16 chains exist
    has_eo16 = any(o.kind == "sub" and o.out.startswith("EO16_")
                   for o in ops)
    has_eeo16 = any(o.kind == "sub" and o.out.startswith("EEO16_")
                    for o in ops)
    if not (has_eo16 and has_eeo16):
        return ops
    if any(".k0es." in o.tile_id for o in ops):
        return ops

    # remove k0 scalar ops + the per-row s32 E-chain (all group copies;
    # out names repeat across groups/passes so a closure is ambiguous).
    S32_CHAIN = re.compile(r"^(?:loa|lob|rva|rvb|Ea|Eb|Erb|EE|EO|EEr|"
                           r"EEE|EEO|EEEr|EEEE|EEEO)_\d+$")
    remove = set()
    for o in ops:
        if o.kind == "store" and \
                re.match(r"^p\d\.k0\.k\d+\.row\d+$", o.tile_id):
            remove.add(o.op_id)
        elif o.kind in ("round_shift", "mul_reduce", "extract2") and \
                re.match(r"^p\d\.k0\.", o.tile_id):
            remove.add(o.op_id)
        elif o.tile_id.startswith(("p1.leaf.", "p2.leaf.")) and \
                S32_CHAIN.match(o.out or ""):
            remove.add(o.op_id)

    # group structure
    groups = {}
    for o in ops:
        if o.kind == "load" and re.match(r"^p\d\.leaf\.row\d+$", o.tile_id):
            g = o.attrs.get("g", 0)
            groups.setdefault(g, set()).add(int(o.tile_id.rsplit("row", 1)[1]))
    row_group = max((len(rs) for rs in groups.values()), default=8)
    counter = [_op_id_base(ops)]
    new_ops_all = []

    def fresh(kind, tile_id, ins, attrs, out=None):
        counter[0] += 1
        op = Op("rw%04d" % counter[0], kind, tile_id,
                out or "rw_%s" % counter[0], tuple(ins), dict(attrs))
        new_ops_all.append(op)
        return op

    insert_at = {}
    for pass_id in (1, 2):
        pstores = [o for o in k0_stores if pid(o) == pass_id]
        if not pstores:
            continue
        del new_ops_all[:]     # per-pass new ops
        anchor = min(ops.index(o) for o in pstores)
        for g in sorted(groups):
            rows = sorted(groups[g])
            if len(rows) != row_group:
                continue
            for b in range(row_group // 4):
                pr = rows[b * 4:(b + 1) * 4]
                tid = "p%d.k0es.pack%d" % (pass_id, b)

                def pack(src, tag):
                    a = [fresh("permute", tid, (src[m],),
                               {"kind": "view_s64", "g": g})
                         for m in range(4)]
                    t = [fresh("permute", tid, (a[0].out, a[2].out),
                               {"kind": "zip1d64", "g": g}),
                         fresh("permute", tid, (a[0].out, a[2].out),
                               {"kind": "zip2d64", "g": g}),
                         fresh("permute", tid, (a[1].out, a[3].out),
                               {"kind": "zip1d64", "g": g}),
                         fresh("permute", tid, (a[1].out, a[3].out),
                               {"kind": "zip2d64", "g": g})]
                    p = [fresh("permute", tid,
                               (t[0].out, t[2].out) if m < 2
                               else (t[1].out, t[3].out),
                               {"kind": "zip1d64" if m % 2 == 0
                                else "zip2d64", "g": g})
                         for m in range(4)]
                    q = [fresh("permute", tid, (p[m].out,),
                               {"kind": "view_s16", "g": g})
                         for m in range(4)]
                    qr = [fresh("permute", tid, (q[m].out,),
                                {"kind": "revh_d", "g": g})
                          for m in (2, 3)]
                    return q[0].out, q[1].out, qr[0].out, qr[1].out

                l0, l1, l2, l3 = pack(["lo_%d" % r for r in pr], "L")
                h0, h1, h2, h3 = pack(["hi_%d" % r for r in pr], "H")
                e = []
                for idx, (a_, b_, kind_) in enumerate(
                        ((l0, h3, "lb"), (l0, h3, "lt"),
                         (l3, h0, "lb"), (l3, h0, "lt"),
                         (l1, h2, "lb"), (l1, h2, "lt"),
                         (l2, h1, "lb"), (l2, h1, "lt"))):
                    w = fresh("widen_add_sve", tid, (a_, b_),
                              {"kind": kind_, "g": g})
                    e.append(w)
                e0 = fresh("add", tid, (e[0].out, e[2].out),
                           {"elem": "s32", "g": g})
                e1 = fresh("add", tid, (e[1].out, e[3].out),
                           {"elem": "s32", "g": g})
                e2 = fresh("add", tid, (e[4].out, e[6].out),
                           {"elem": "s32", "g": g})
                e3 = fresh("add", tid, (e[5].out, e[7].out),
                           {"elem": "s32", "g": g})
                w0 = fresh("permute", tid, (e0.out, e1.out),
                           {"kind": "zip1s", "g": g})
                w1 = fresh("permute", tid, (e0.out, e1.out),
                           {"kind": "zip2s", "g": g})
                u2 = fresh("permute", tid, (e2.out,),
                           {"kind": "revw_d32", "g": g})
                u3 = fresh("permute", tid, (e3.out,),
                           {"kind": "revw_d32", "g": g})
                w2 = fresh("permute", tid, (u3.out, u2.out),
                           {"kind": "zip1s", "g": g})
                w3 = fresh("permute", tid, (u3.out, u2.out),
                           {"kind": "zip2s", "g": g})
                s0 = fresh("sub", tid, (w0.out, w2.out),
                           {"elem": "s32", "g": g})
                s1 = fresh("sub", tid, (w1.out, w3.out),
                           {"elem": "s32", "g": g})
                s2 = fresh("add", tid, (w0.out, w2.out),
                           {"elem": "s32", "g": g})
                s3 = fresh("add", tid, (w1.out, w3.out),
                           {"elem": "s32", "g": g})
                v0 = fresh("permute", tid, (s2.out, s3.out),
                           {"kind": "uzp1d", "g": g})
                v1 = fresh("permute", tid, (s2.out, s3.out),
                           {"kind": "uzp2d", "g": g})
                v1r = fresh("permute", tid, (v1.out,),
                            {"kind": "revw_d64", "g": g})
                eep = fresh("add", tid, (v0.out, v1r.out),
                            {"elem": "s32", "view": "s64", "g": g})
                eop = fresh("sub", tid, (v0.out, v1r.out),
                            {"elem": "s32", "view": "s64", "g": g})
                shift = 4 if pass_id == 1 else 11
                for k in K0_K:
                    ktid = "p%d.k0es.k%d.p%d" % (pass_id, k, b)
                    src = eep if k in (0, 16) else eop
                    m = fresh("mul", ktid, (src.out,),
                              {"elem": "s32",
                               "const_src": "K0EVEN[%d]"
                               % K0EVEN_IDX[k], "g": g})
                    pa = fresh("addp32", ktid, (m.out, m.out), {"g": g})
                    xa = fresh("permute", ktid, (pa.out, pa.out),
                               {"kind": "uzp1s", "g": g})
                    na = fresh("narrow4_sve", ktid, (xa.out,),
                               {"shift": shift, "mode": "rshrn", "g": g})
                    nc = fresh("narrow", ktid, (na.out, na.out),
                               {"from": "s16", "to": "s16", "g": g})
                    fresh("store", ktid, (nc.out,),
                          {"base": "dst", "index": "k*32+i",
                           "lanes": tuple((pass_id, k, r) for r in pr),
                           "topology": "contiguous",
                           "base_off": 4 * b, "g": g})
        insert_at[anchor] = new_ops_all[:]

    result = []
    for i, op in enumerate(ops):
        if i in insert_at:
            result.extend(insert_at[i])
        if op.op_id in remove:
            continue
        result.append(op)
    return result


REWRITES["k0_even_sve"] = rewrite_k0_even_sve


def rewrite_merge_narrow8(ops: List[Op]) -> List[Op]:
    """Merge two 4-row groups into one 8-row super-group (odd path)."""
    base = _op_id_base(ops)
    counter = [base]

    def fresh(kind, tile_id, out, ins, attrs):
        counter[0] += 1
        return Op("rw%04d" % counter[0], kind, tile_id, out,
                  tuple(ins), dict(attrs))

    def pid(o):
        return int(o.tile_id.split(".")[0][1:])

    retagged = [Op(o.op_id, o.kind, o.tile_id, o.out, o.inputs,
                   dict(o.attrs, g=o.attrs.get("g", 0) // 2))
                for o in ops]
    leaf = {}
    for o in retagged:
        if o.tile_id.startswith("p%d.leaf.row" % pid(o)):
            row = int(o.tile_id.rsplit("row", 1)[1])
            leaf.setdefault((pid(o), o.attrs.get("g", 0), row), {})[o.out] = o

    remove = set()
    insert_at = {}
    old_odd = {}
    for o in retagged:
        if o.tile_id.startswith("p") and ".odd.k" in o.tile_id:
            parts = o.tile_id.split(".")
            p = int(parts[0][1:])
            k = int(parts[2][1:])
            g = o.attrs.get("g", 0)
            old_odd.setdefault((p, g, k), []).append(o)

    old_slices = {}
    for o in retagged:
        if o.tile_id.startswith("p") and "odd.slice" in o.tile_id:
            p = pid(o)
            g = o.attrs.get("g", 0)
            old_slices.setdefault((p, g), []).append(o)

    for p in (1, 2):
        for b in range(4):
            rows = sorted(row for (pp, gg, row) in leaf
                          if pp == p and gg == b and
                          b * 8 <= row < b * 8 + 8)
            if len(rows) != 8:
                continue
            even = rows[0::2]
            oddr = rows[1::2]
            banks = (even, oddr)
            xs_per_bank = []
            slice_ops = []
            for bi, bank in enumerate(banks):
                xs = []
                for m in range(4):
                    pm = fresh(
                        "permute", "p%d.odd.slice_b%d" % (p, b),
                        "p%d_%d_b%d" % (m, bi, b),
                        (leaf[(p, b, bank[0])]["O_%d" % bank[0]].out,
                         leaf[(p, b, bank[1])]["O_%d" % bank[1]].out),
                        {"kind": "tbl2", "idx": "i%d" % m,
                         "lane_owner": "output", "g": b})
                    slice_ops.append(pm)
                    qm = fresh(
                        "permute", "p%d.odd.slice_b%d" % (p, b),
                        "q%d_%d_b%d" % (m, bi, b),
                        (leaf[(p, b, bank[2])]["O_%d" % bank[2]].out,
                         leaf[(p, b, bank[3])]["O_%d" % bank[3]].out),
                        {"kind": "tbl2", "idx": "i%d" % m,
                         "lane_owner": "output", "g": b})
                    slice_ops.append(qm)
                    xm = fresh("permute", "p%d.odd.slice_b%d" % (p, b),
                               "X%d_%d_b%d" % (m, bi, b),
                               (pm.out, qm.out),
                               {"kind": "tbl2", "idx": "ilo",
                                "lane_owner": "output", "g": b})
                    xs.append(xm)
                    slice_ops.append(xm)
                xs_per_bank.append(xs)
            inserted_slices = False
            for k in range(1, 32, 2):
                old_all = old_odd.get((p, b, k), [])
                if not old_all:
                    continue
                stores = [o for o in old_all if o.kind == "store"]
                if len(stores) != 2:
                    continue
                stores.sort(key=lambda o: o.attrs["lanes"][0][2])
                anchor = stores[0]
                ops_new = list(slice_ops) if not inserted_slices else []
                inserted_slices = True
                rs = []
                for bi, (bank, xs) in enumerate(zip(banks, xs_per_bank)):
                    terms = []
                    for m in range(4):
                        t = fresh("dot_segment", "p%d.odd.k%d" % (p, k),
                                  "t_%d_%d_b%d" % (k, m, bi),
                                  (xs[m].out,),
                                  {"acc_bits": 64,
                                   "lane_owner": "output", "slice": m,
                                   "terms": tuple("G[%d][%d]"
                                                  % (k, 4 * m + j)
                                                  for j in range(4)),
                                   "const_src": "CODD[%d][%d]"
                                   % (k // 2, m), "g": b})
                        terms.append(t)
                    acc = terms[0].out
                    acc_ops = []
                    for m in range(1, 4):
                        a = fresh("accumulate", "p%d.odd.k%d" % (p, k),
                                  "acc_%d_%d_b%d" % (k, m, bi),
                                  (acc, terms[m].out),
                                  {"acc_bits": 64, "g": b})
                        acc = a.out
                        acc_ops.append(a)
                    rnd = fresh("round_shift", "p%d.odd.k%d" % (p, k),
                                "rnd_%d_b%d" % (k, bi), (acc,),
                                {"shift": 4 if p == 1 else 11,
                                 "epoch": p, "mode": "half-up", "g": b})
                    rs.append(rnd)
                    ops_new.extend(terms)
                    ops_new.extend(acc_ops)
                    ops_new.append(rnd)
                n8 = fresh("narrow8", "p%d.odd.k%d" % (p, k),
                           "n8_%d" % k, (rs[0].out, rs[1].out),
                           {"from": "s64", "to": "s16",
                            "kind": "trn1+uzp", "g": b})
                st = fresh("store", "p%d.odd.k%d" % (p, k), "", (n8.out,),
                           {"base": "dst", "index": "k*32+i",
                            "lanes": tuple((p, k, r) for r in rows),
                            "topology": "contiguous", "row_group": 8,
                            "base_off": 0, "g": b})
                ops_new.extend([n8, st])
                insert_at[anchor.op_id] = ops_new
                remove.update(o.op_id for o in old_all)
                remove.update(o.op_id for o in
                              old_slices.get((p, b), []))
            # ---- k2 EX (dot chains) rebuild: dual bank + merged narrow ----
            k2_dots = [o for o in retagged
                       if o.kind == "dot_segment"
                       and o.tile_id.startswith("p%d.k2.k" % p)
                       and o.attrs.get("g", 0) == b]
            if k2_dots:
                k2_slice_old = [o for o in retagged
                                if o.tile_id.startswith("p%d.k2.slice" % p)
                                and o.attrs.get("g", 0) == b]
                exs = []
                k2_slice_new = []
                for bi, bank in enumerate(banks):
                    e0 = leaf[(p, b, bank[0])]["EO16_%d" % bank[0]]
                    e1 = leaf[(p, b, bank[1])]["EO16_%d" % bank[1]]
                    e2 = leaf[(p, b, bank[2])]["EO16_%d" % bank[2]]
                    e3 = leaf[(p, b, bank[3])]["EO16_%d" % bank[3]]
                    exs_b = []
                    for m in (0, 1):
                        em = fresh("permute", "p%d.k2.slice_b%d" % (p, b),
                                   "k2e%d_%d_b%d" % (m, bi, b),
                                   (e0.out, e1.out),
                                   {"kind": "tbl2", "idx": "i%d" % m,
                                    "lane_owner": "output", "g": b})
                        fm = fresh("permute", "p%d.k2.slice_b%d" % (p, b),
                                   "k2f%d_%d_b%d" % (m, bi, b),
                                   (e2.out, e3.out),
                                   {"kind": "tbl2", "idx": "i%d" % m,
                                    "lane_owner": "output", "g": b})
                        ex = fresh("permute", "p%d.k2.slice_b%d" % (p, b),
                                   "k2EX%d_%d_b%d" % (m, bi, b),
                                   (em.out, fm.out),
                                   {"kind": "tbl2", "idx": "ilo",
                                    "lane_owner": "output", "g": b})
                        exs_b.append(ex)
                        k2_slice_new.extend([em, fm, ex])
                    exs.append(exs_b)
                k2_inserted = False
                for k in K2_K:
                    chains = [o for o in retagged
                              if o.tile_id == "p%d.k2.k%d" % (p, k)
                              and o.attrs.get("g", 0) == b]
                    stores = [o for o in chains if o.kind == "store"]
                    if len(stores) != 2:
                        continue
                    stores.sort(key=lambda o: o.attrs["lanes"][0][2])
                    anchor = stores[0]
                    ops_new = (list(k2_slice_new)
                               if not k2_inserted else [])
                    k2_inserted = True
                    rs = []
                    for bi in (0, 1):
                        t0 = fresh("dot_segment", "p%d.k2.k%d" % (p, k),
                                   "k2t0_%d_b%d" % (k, bi),
                                   (exs[bi][0].out,),
                                   {"acc_bits": 64,
                                    "lane_owner": "output", "slice": 0,
                                    "terms": tuple("G[%d][%d]" % (k, j)
                                                   for j in range(4)),
                                    "const_src": "K2S[%d][0]" % (k // 4),
                                    "g": b})
                        t1 = fresh("dot_segment", "p%d.k2.k%d" % (p, k),
                                   "k2t1_%d_b%d" % (k, bi),
                                   (exs[bi][1].out,),
                                   {"acc_bits": 64,
                                    "lane_owner": "output", "slice": 1,
                                    "terms": tuple("G[%d][%d]" % (k, 4 + j)
                                                   for j in range(4)),
                                    "const_src": "K2S[%d][1]" % (k // 4),
                                    "g": b})
                        acc = fresh("accumulate", "p%d.k2.k%d" % (p, k),
                                    "k2acc_%d_b%d" % (k, bi),
                                    (t0.out, t1.out),
                                    {"acc_bits": 64, "g": b})
                        rnd = fresh("round_shift", "p%d.k2.k%d" % (p, k),
                                    "k2rnd_%d_b%d" % (k, bi),
                                    (acc.out,),
                                    {"shift": 4 if p == 1 else 11,
                                     "epoch": p, "mode": "half-up", "g": b})
                        rs.append(rnd)
                        ops_new.extend([t0, t1, acc, rnd])
                    n8 = fresh("narrow8", "p%d.k2.k%d" % (p, k),
                               "k2n8_%d" % k, (rs[0].out, rs[1].out),
                               {"from": "s64", "to": "s16",
                                "kind": "trn1+uzp", "g": b})
                    st = fresh("store", "p%d.k2.k%d" % (p, k), "",
                               (n8.out,),
                               {"base": "dst", "index": "k*32+i",
                                "lanes": tuple((p, k, r) for r in rows),
                                "topology": "contiguous",
                                "row_group": 8, "base_off": 0, "g": b})
                    ops_new.extend([n8, st])
                    insert_at[anchor.op_id] = ops_new
                    remove.update(o.op_id for o in chains)
                remove.update(o.op_id for o in k2_slice_old)
            # ---- k4 legacy (dot chains) rebuild: dual bank + narrow8 ----
            k4_dots = [o for o in retagged
                       if o.kind == "dot_segment"
                       and o.tile_id.startswith("p%d.k4.k" % p)
                       and o.attrs.get("g", 0) == b]
            if k4_dots:
                k4_slice_old = [o for o in retagged
                                if o.tile_id.startswith("p%d.k4.slice" % p)
                                and o.attrs.get("g", 0) == b]
                xk4s = []
                k4_slice_new = []
                for bi, bank in enumerate(banks):
                    q0 = leaf[(p, b, bank[0])]["EEO16_%d" % bank[0]]
                    q1 = leaf[(p, b, bank[1])]["EEO16_%d" % bank[1]]
                    q2 = leaf[(p, b, bank[2])]["EEO16_%d" % bank[2]]
                    q3 = leaf[(p, b, bank[3])]["EEO16_%d" % bank[3]]
                    pk = fresh("permute", "p%d.k4.slice_b%d" % (p, b),
                               "k4p_%d_b%d" % (bi, b), (q0.out, q1.out),
                               {"kind": "tbl2", "idx": "i0",
                                "lane_owner": "output", "g": b})
                    qk = fresh("permute", "p%d.k4.slice_b%d" % (p, b),
                               "k4q_%d_b%d" % (bi, b), (q2.out, q3.out),
                               {"kind": "tbl2", "idx": "i0",
                                "lane_owner": "output", "g": b})
                    xk = fresh("permute", "p%d.k4.slice_b%d" % (p, b),
                               "k4X_%d_b%d" % (bi, b), (pk.out, qk.out),
                               {"kind": "tbl2", "idx": "ilo",
                                "lane_owner": "output", "g": b})
                    xk4s.append(xk)
                    k4_slice_new.extend([pk, qk, xk])
                k4_inserted = False
                for k in K4_K:
                    chains = [o for o in retagged
                              if o.tile_id == "p%d.k4.k%d" % (p, k)
                              and o.attrs.get("g", 0) == b]
                    stores = [o for o in chains if o.kind == "store"]
                    if len(stores) != 2:
                        continue
                    stores.sort(key=lambda o: o.attrs["lanes"][0][2])
                    anchor = stores[0]
                    ops_new = (list(k4_slice_new)
                               if not k4_inserted else [])
                    k4_inserted = True
                    rs = []
                    for bi in (0, 1):
                        t = fresh("dot_segment", "p%d.k4.k%d" % (p, k),
                                  "k4t_%d_b%d" % (k, bi),
                                  (xk4s[bi].out,),
                                  {"acc_bits": 64,
                                   "lane_owner": "output", "slice": 0,
                                   "nconst": 1,
                                   "terms": tuple("G[%d][%d]" % (k, j)
                                                  for j in range(4)),
                                   "const_src": "K4S[%d]" % (k // 8),
                                   "g": b})
                        rnd = fresh("round_shift", "p%d.k4.k%d" % (p, k),
                                    "k4rnd_%d_b%d" % (k, bi), (t.out,),
                                    {"shift": 4 if p == 1 else 11,
                                     "epoch": p, "mode": "half-up", "g": b})
                        rs.append(rnd)
                        ops_new.extend([t, rnd])
                    n8 = fresh("narrow8", "p%d.k4.k%d" % (p, k),
                               "k4n8_%d" % k, (rs[0].out, rs[1].out),
                               {"from": "s64", "to": "s16",
                                "kind": "trn1+uzp", "g": b})
                    st = fresh("store", "p%d.k4.k%d" % (p, k), "",
                               (n8.out,),
                               {"base": "dst", "index": "k*32+i",
                                "lanes": tuple((p, k, r) for r in rows),
                                "topology": "contiguous",
                                "row_group": 8, "base_off": 0, "g": b})
                    ops_new.extend([n8, st])
                    insert_at[anchor.op_id] = ops_new
                    remove.update(o.op_id for o in chains)
                remove.update(o.op_id for o in k4_slice_old)

    result = []
    emitted = set()
    # Leaf ops first: everything else (slices/dots/stores) depends on them,
    # and a merge rewrite can move 8-row consumers before later leaves.
    for o in retagged:
        if o.op_id in remove or o.op_id in insert_at:
            continue
        if ".leaf." in o.tile_id:
            result.append(o)
            emitted.add(o.op_id)
    for o in retagged:
        if o.op_id in insert_at:
            result.extend(insert_at[o.op_id])
            emitted.add(o.op_id)
            continue
        if o.op_id in emitted or o.op_id in remove:
            continue
        result.append(o)
    return result


REWRITES["merge_narrow8"] = rewrite_merge_narrow8


def rewrite_canonicalize_dot(ops: List[Op]) -> List[Op]:
    """Canonicalize dot_segment/mul_reduce/neon_mul into typed `dot`
    nodes (dot_ir).  The canonical view is lowering-agnostic: SDOT.d,
    SMULLB/SMLALB, VMULL/VMLAL and unpk+SMUL/mul+saddv are one graph
    node; instruction search picks a lowering via legal_lowerings().
    """
    return canonicalize_dot_ops(ops)


REWRITES["canonicalize_dot"] = rewrite_canonicalize_dot


def dot_lowering_report(ops: List[Op]) -> Dict:
    """Per-dot lowering counts plus legal alternatives for reporting."""
    canon = canonicalize_dot_ops(ops)
    report = {"dots": dot_summary(canon)}
    report["alternatives"] = {}
    for op in canon:
        if op.kind != "dot":
            continue
        key = "%s/%s/%s" % (op.attrs["a_ty"], op.attrs["b_ty"],
                            op.attrs["acc_ty"])
        report["alternatives"].setdefault(key, set()).add(
            op.attrs["lowering"])
    report["alternatives"] = {
        k: sorted(v) for k, v in report["alternatives"].items()}
    return report


def apply_rewrites(ops: List[Op], names: List[str]) -> List[Op]:
    """Apply named rewrites in order; unknown names raise."""
    out = list(ops)
    for name in names:
        if name not in REWRITES:
            raise ValueError("unknown op rewrite %r" % name)
        out = REWRITES[name](out)
    return out
