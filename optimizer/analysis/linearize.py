"""Lane-tracking linearization analysis for the constant-rearrangement rewrite.

Every vector value gets a symbolic form: for each lane, a dict mapping a
LEAF lane (a boundary value the codegen can multiply directly, e.g. the
s32 result of `sext(load)` or a constant load) to a coefficient. Elementwise
add/sub/mul-by-constant and pure-permutation shuffles propagate exactly;
nonlinear ops (mul of two non-constant values) stop propagation and mark the
node opaque (a new leaf).

This is the analysis half of `fold_shuffles_into_constants`: once a narrow
output's form is a sparse linear combination of leaf lanes, the rewrite can
emit `mul(pre-permuted constant, leaf)` terms and delete the runtime
shuffles. The DCT16/DCT32 internal kernels (user input 2026-08-13) achieve
30-60% this way on SVE256, where tbl/splice permutes are relatively more
expensive than on NEON128.
"""

import re
from collections import defaultdict


def _add_terms(a, b, sign=1.0):
    out = dict(a)
    for k, v in b.items():
        out[k] = out.get(k, 0.0) + sign * v
    return {k: v for k, v in out.items() if v != 0.0}


def _type_lanes(t):
    m = re.match(r"<(\d+) x i\d+>", t or "")
    return int(m.group(1)) if m else None


def resolve_const_loads(ir, const_tables=None):
    """Map constant-load nodes (const_name/const_off) to numeric values.

    const_tables: {symbol_name: {byte_offset: [i16 values...]}}. Row values
    are sliced to the load's lane count. Without tables this is a no-op
    (returns {}), which keeps the MachineIR line independent of any concrete
    constant source.
    """
    out = {}
    if not const_tables:
        return out
    for n in ir.nodes:
        if n.get("op") != "load" or not n.get("const_name"):
            continue
        tbl = const_tables.get(n["const_name"])
        if not tbl:
            continue
        vals = tbl.get(n.get("const_off"))
        if not vals:
            continue
        nl = _type_lanes(n.get("type"))
        out[str(n["dst"])] = list(vals[:nl]) if nl else list(vals)
    return out


def lane_forms(ir, const_values=None):
    """Return {dst: [[(leaf, coeff), ...] per lane]} and the leaf set."""
    nodes = ir.nodes
    bydst = {str(n.get("dst")): n for n in nodes}
    forms = {}
    opaque = set()
    symbolic = set()   # forms whose coefficients went through a constant
                       # smull (numeric value not tracked yet)
    const_values = const_values or {}

    def lanes_of(node):
        t = node.get("type") or ""
        m = re.match(r"<(\d+) x i(\d+)>", t)
        if not m:
            if node.get("op") == "intrinsic":
                if node.get("intrinsic") in ("smull", "addp"):
                    return 4, 32
                if node.get("intrinsic") == "rshrn":
                    return 4, 16
            return None, None
        return int(m.group(1)), int(m.group(2))

    def get(dst):
        if dst in forms:
            return forms[dst]
        if dst in opaque:
            return "opaque"
        return None

    # first pass: identify leaves and opaque nodes
    users = defaultdict(list)
    for n in nodes:
        for s in (n.get("src") or []):
            for r in (s if isinstance(s, list) else [s]):
                users[str(r)].append(n)

    # A node is opaque if it is a mul of two non-constant values (product of
    # two data-dependent forms). Everything else propagates.
    for n in nodes:
        if n["op"] == "mul" and len(n.get("src") or []) == 2 \
                and "const_vec" not in n:
            opaque.add(str(n["dst"]))

    def leaf_key(dst, lane):
        return (dst, lane)

    # second pass: propagate in order
    for n in nodes:
        dst = str(n["dst"]) if n.get("dst") is not None else None
        op = n["op"]
        nl, width = lanes_of(n)
        if dst is None or nl is None:
            continue
        if dst in opaque:
            continue
        srcs = n.get("src") or []
        if op == "load":
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op == "sext":
            a = get(srcs[0])
            if a is None or a == "opaque":
                forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
                continue
            forms[dst] = a
            continue
        if op == "shuffle":
            mask = n.get("mask")
            a = get(srcs[0])
            if len(srcs) == 1 and mask is not None and a not in (None,
                                                                 "opaque"):
                # result lane i <- source lane mask[i]
                n_a = len(a)
                out = []
                for m in mask:
                    if m < n_a:
                        out.append(a[m])
                    else:
                        # out-of-range (undef/poison) lanes become their
                        # own leaf so analysis never crashes and never
                        # attributes wrong data to them.
                        out.append({leaf_key(dst, len(out)): 1.0})
                forms[dst] = out
                continue
            if len(srcs) == 2 and mask is not None:
                a = get(srcs[0])
                b = get(srcs[1])
                if a not in (None, "opaque") and b not in (None, "opaque"):
                    n_a = len(a)
                    out = []
                    for m in mask:
                        out.append(a[m] if m < n_a else b[m - n_a])
                    forms[dst] = out
                    continue
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op in ("add", "sub"):
            if len(srcs) == 2:
                a, b = get(srcs[0]), get(srcs[1])
                if a not in (None, "opaque") and b not in (None, "opaque"):
                    sign = 1.0 if op == "add" else -1.0
                    forms[dst] = [_add_terms(x, y, sign)
                                  for x, y in zip(a, b)]
                    continue
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op == "mul" and "const_vec" in n:
            a = get(srcs[0])
            cv = n["const_vec"]
            if a not in (None, "opaque") and len(cv) == len(a):
                forms[dst] = [{k: v * cv[i] for k, v in a[i].items()}
                              for i in range(len(a))]
                continue
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op == "intrinsic" and n.get("intrinsic") == "smull":
            # Structured imports record the constant operand as imm_vec
            # instead of a const-leaf ref (dct32 body: args = [imm_vec,
            # ref]); src is authoritative for the data operand(s).
            imm = next((a["imm_vec"] for a in (n.get("args") or [])
                        if isinstance(a, dict) and "imm_vec" in a), None)
            refs = [a["ref"] for a in (n.get("args") or [])
                    if isinstance(a, dict) and "ref" in a]
            data = srcs or refs
            a = get(data[0]) if data else None
            b = get(data[1]) if len(data) > 1 else None
            if imm is not None and a not in (None, "opaque"):
                if len(imm) == len(a):
                    forms[dst] = [{k: v * imm[i] for k, v in a[i].items()}
                                  for i in range(len(a))]
                    continue
                forms[dst] = [{leaf_key(dst, i): 1.0}
                              for i in range(nl)]
                continue
            # widening is 1:1 on lanes. If one side is an identity leaf
            # (a constant table load), the other side's leaf terms survive
            # unchanged (the constant scaling folds into the precomputed
            # coefficients). Both data-dependent: nonlinear -> new leaf.
            def is_const_leaf(f):
                return f is not None and f != "opaque" and all(
                    len(t) == 1 and list(t.values())[0] == 1.0 for t in f)

            def const_leaf_values(f):
                """Per-lane numeric scale if f is an identity const leaf.

                Honors the leaf's lane mapping: form lane i may come from
                const leaf lane mask[i] after a shuffle, so the value is
                const_values[leaf_dst][lane_index], not slot i.
                """
                if not is_const_leaf(f):
                    return None
                leaf_dst = next(iter(f[0]))[0]
                cv = const_values.get(leaf_dst)
                if cv is None:
                    return None
                out = []
                for lane_form in f:
                    (leaf, lane) = next(iter(lane_form))
                    out.append(cv[lane] if lane < len(cv) else 1.0)
                return out

            cva = const_leaf_values(a)
            cvb = const_leaf_values(b)
            if cva is not None and b not in (None, "opaque"):
                # numeric constant row: scale the data side elementwise
                forms[dst] = [{k: v * cva[i] for k, v in b[i].items()}
                              for i in range(len(b))]
            elif cvb is not None and a not in (None, "opaque"):
                forms[dst] = [{k: v * cvb[i] for k, v in a[i].items()}
                              for i in range(len(a))]
            elif is_const_leaf(a) and b not in (None, "opaque"):
                forms[dst] = b
                symbolic.add(dst)
            elif is_const_leaf(b) and a not in (None, "opaque"):
                forms[dst] = a
                symbolic.add(dst)
            else:
                forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op == "intrinsic" and n.get("intrinsic") == "addp":
            a = get(n["args"][0]["ref"])
            b = get(n["args"][1]["ref"])
            if a not in (None, "opaque") and b not in (None, "opaque"):
                n_a = len(a)
                out = []
                for i in range(0, n_a, 2):
                    out.append(_add_terms(a[i], a[i + 1]))
                for i in range(0, len(b), 2):
                    out.append(_add_terms(b[i], b[i + 1]))
                forms[dst] = out
                continue
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        if op == "intrinsic" and n.get("intrinsic") == "rshrn":
            a = get(n["args"][0]["ref"])
            if a not in (None, "opaque"):
                forms[dst] = a
                continue
            forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
            continue
        # unknown / anything else: new leaf
        forms[dst] = [{leaf_key(dst, i): 1.0} for i in range(nl)]
    return forms, symbolic


def term_count_report(ir):
    """Per-rshrn term counts, for choosing the rewrite budget."""
    forms, _ = lane_forms(ir)
    out = []
    for n in ir.nodes:
        if n["op"] == "intrinsic" and n.get("intrinsic") == "rshrn":
            f = forms.get(str(n["dst"]), [])
            if f:
                out.append(max(len(x) for x in f))
    return out


def fold_shuffles_into_constants(ir, max_terms=16):
    """Rewrite sparse narrow outputs as dots of raw leaf lanes with
    pre-permuted constants (the constant-rearrangement rule).

    For every rshrn whose symbolic form has <= max_terms terms per lane and
    purely numeric (integer) coefficients, emit the dense equivalent:
    one `mul(const_vec, leaf)` per contributing leaf vector, elementwise
    adds, then the same rshrn. Consumers of the old rshrn are retargeted to
    the new value; the old shuffle/addp chain is left in place and removed
    by the C++ compiler's dead-code elimination.
    """
    forms, symbolic = lane_forms(ir)
    bydst = {str(n.get("dst")): n for n in ir.nodes}
    nodes = list(ir.nodes)
    retarget = {}
    added = []
    idc = [max((n.get("id") or 0) for n in nodes) + 1]

    def next_id():
        v = idc[0]
        idc[0] += 1
        return v

    def numeric_int(d):
        return all(float(v).is_integer() for v in d.values())

    for n in nodes:
        if not (n["op"] == "intrinsic" and n.get("intrinsic") == "rshrn"):
            continue
        src = n["args"][0]["ref"]
        form = forms.get(str(src))
        if not form or len(form) != 4:
            continue
        if str(src) in symbolic:
            continue    # coefficients are unresolved constant-smull values
        if any(not numeric_int(t) for t in form):
            continue
        if max(len(t) for t in form) > max_terms:
            continue
        # group coefficients by leaf vector
        by_leaf = {}
        aligned = True
        for lane, terms in enumerate(form):
            for (leaf, leaf_lane), coeff in terms.items():
                if leaf_lane != lane:
                    aligned = False
                    break
                by_leaf.setdefault(leaf, [0.0, 0.0, 0.0, 0.0])
                by_leaf[leaf][lane] += float(coeff)
            if not aligned:
                break
        if not aligned:
            # lane-permuted or matrix-vector shapes need the shared-constant
            # matrix rewrite (DCT16 even path), not this elementwise fold.
            continue
        # skip the identity case (single leaf, coefficient 1 per lane)
        if len(by_leaf) == 1:
            only = next(iter(by_leaf.values()))
            if all(abs(only[i] - 1.0) < 1e-9 for i in range(4)):
                continue
        if len(by_leaf) > max_terms:
            continue
        acc = None
        for leaf, coeffs in by_leaf.items():
            ivec = [int(round(c)) for c in coeffs]
            if not any(ivec):
                continue
            mid = "lin_%d" % next_id()
            added.append({"op": "mul", "type": "<4 x i32>",
                          "src": [leaf], "const_vec": ivec,
                          "dst": mid, "id": next_id()})
            if acc is None:
                acc = mid
            else:
                aid = "lin_%d" % next_id()
                added.append({"op": "add", "type": "<4 x i32>",
                              "src": [acc, mid], "dst": aid,
                              "id": next_id()})
                acc = aid
        if acc is None:
            continue
        new_dst = "lin_out_%d" % next_id()
        imm = next(a["imm"] for a in n["args"] if "imm" in a)
        added.append({"op": "intrinsic", "intrinsic": "rshrn",
                      "src": [acc], "dst": new_dst,
                      "args": [{"ref": acc}, {"imm": imm}],
                      "id": next_id()})
        retarget[str(n["dst"])] = new_dst

    if not added:
        return ir
    # retarget consumers of the replaced rshrn values
    out = []
    for n in nodes:
        if n["op"] == "intrinsic" and n.get("intrinsic") in ("smull", "addp",
                                                             "rshrn"):
            args = []
            for a in n["args"]:
                if "ref" in a and a["ref"] in retarget:
                    args.append({"ref": retarget[a["ref"]]})
                else:
                    args.append(a)
            n = dict(n)
            n["args"] = args
            out.append(n)
            continue
        if "src" in n:
            srcs = n["src"]
            if isinstance(srcs, list):
                srcs = [retarget.get(s, s) for s in srcs]
            elif srcs in retarget:
                srcs = retarget[srcs]
            n = dict(n)
            n["src"] = srcs
        out.append(n)
    out.extend(added)
    for i, n in enumerate(out):
        n["id"] = i
    ir.nodes = out
    return ir


def shared_constant_matrix_outputs(nodes, forms):
    """MachineIR-side detection of narrow outputs with the shape
    out[i] = sum_j C[j] * leaf_i[j] (shared C across output lanes).

    Port of the asm-trace detector (asm_linearize.py) to the MachineIR node
    schema (op/intrinsic/dst/args). Returns
    [{node_id, mn, consts, leaves}].
    """
    out = []
    for n in nodes:
        if n.get("op") != "intrinsic" or n.get("intrinsic") not in (
                "rshrn", "rshrn2"):
            continue
        f = forms.get(str(n.get("dst")))
        if not f or len(f) != 4:
            continue
        pats = []
        for lane in f:
            by_leaf = defaultdict(list)
            for (leaf, j), coeff in lane.items():
                by_leaf[leaf].append((j, coeff))
            vecs = []
            for leaf, terms in by_leaf.items():
                terms.sort()
                vecs.append((leaf, [c for _, c in terms],
                             [j for j, _ in terms]))
            pats.append(vecs)
        sigs = [tuple(sorted(tuple(v) for _, v, _ in vec)) for vec in pats]
        if len(set(sigs)) != 1:
            continue
        lane_pats = [tuple(sorted(tuple(l) for _, _, l in vec))
                     for vec in pats]
        if len(set(lane_pats)) != 1:
            continue
        shared = pats[0]
        const_vectors = [list(v) for _, v, _ in shared]
        leaves = []
        for vec in pats:
            lane_leaves = []
            for leaf, vec_c, lane_c in vec:
                for k, (s_leaf, s_vec, s_lane) in enumerate(shared):
                    if s_vec == vec_c and s_lane == lane_c:
                        lane_leaves.append((leaf, k))
                        break
            leaves.append(lane_leaves)
        out.append({"node_id": n["id"], "mn": n["intrinsic"],
                    "consts": const_vectors, "leaves": leaves})
    return out
