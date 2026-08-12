"""Lane-tracking linearization over the dynamic asm-trace IR.

Each asm node gets a symbolic form: a list of per-lane dicts mapping a data
leaf lane (node id, lane) to a coefficient. Constant .rodata loads (g_t16
entries, resolved by asm_ir.resolve_constants) contribute numeric
coefficients; data loads are leaves; data x data products are opaque.

Ops covered by the DCT16 dynamic flow: rev64, tbl (byte->element lane
permutation), zip1/zip2, mov, add/sub, mul by a resolved constant, the
widening sshll/sshll2/saddw/saddw2/smull2/smlal family, addp, rshrn, and the
partial-write rshrn2 (low half from the register's previous writer).
"""

import re
from collections import defaultdict


REV64 = {
    "8h": [3, 2, 1, 0, 7, 6, 5, 4],
    "4s": [1, 0, 3, 2],
    "2d": [1, 0],
}


def _arr(node):
    m = re.search(r"\.(\d+)([shbd])", node["ops"])
    if not m:
        return None
    lanes = {"b": 16, "h": 8, "s": 4, "d": 2}[m.group(2)]
    return lanes


def _identity(n):
    return n["id"]


def _add(a, b, sign=1.0):
    out = dict(a)
    for k, v in b.items():
        out[k] = out.get(k, 0.0) + sign * v
    return {k: v for k, v in out.items() if v != 0.0}


def _is_const_form(f):
    """A form over numeric values (resolved constants), not data leaves."""
    return f is not None and all(
        isinstance(k, tuple) and k[0] == "const" for t in f for k in t)


def _const_values(n):
    """Decode a resolved .rodata load into little-endian s16 values."""
    b = n.get("const_bytes")
    if not b:
        return None
    return [int.from_bytes(b[i:i + 2], "little", signed=True)
            for i in range(0, min(len(b), 16), 2)]


def _scale(form, values):
    return [{k: v * values[i] if i < len(values) else v
             for k, v in form[i].items()} for i in range(len(form))]


def _const_of(nid, consts):
    return consts.get(nid) if nid in consts else None


def lane_forms_asm(nodes):
    """Return {node_id: [[(leaf, coeff), ...] per lane]}."""
    forms = {}
    consts = {}

    def form_of(nid):
        return forms.get(nid)

    for n in nodes:
        nid = n["id"]
        mn = n["mn"]
        if mn in ("ldr", "ldp", "ldur", "ld1", "ld1r"):
            if "const_bytes" in n:
                lanes = _arr(n) or 4
                consts[nid] = _const_values(n) or n["const_bytes"]
                forms[nid] = [{(nid, i): 1.0} for i in range(lanes)]
            else:
                lanes = _arr(n) or 8   # 16-byte q loads default to 8 x s16
                forms[nid] = [{(nid, i): 1.0} for i in range(lanes)]
            continue
        if mn in ("mov", "movi", "dup"):
            src = n["read_ids"][0] if n["read_ids"] else None
            f = form_of(src)
            if f is not None:
                forms[nid] = f
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(_arr(n) or 4)]
            continue
        if mn == "rev64":
            m = re.search(r"\.(\d+[shd])", n["ops"])
            mask = REV64.get(m.group(1) if m else "")
            src = form_of(n["read_ids"][0])
            if mask and src is not None:
                forms[nid] = [src[i] for i in mask]
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(_arr(n) or 4)]
            continue
        if mn == "tbl":
            # byte mask -> element lanes (mask bytes must be aligned s16
            # pairs for the .8h view; the data's element view is .8h here)
            data = form_of(n["read_ids"][0])
            mask = n.get("mask")
            if data is not None and mask is not None and len(data) == 8:
                lanes = []
                for i in range(8):
                    b0, b1 = mask[2 * i], mask[2 * i + 1]
                    if b0 == 2 * i and b1 == 2 * i + 1:
                        lanes.append(data[i])
                    else:
                        j = b1 // 2 if b0 % 2 == 0 and b1 == b0 + 1 else None
                        if j is None or b0 != 2 * j:
                            forms[nid] = [{(nid, i): 1.0}
                                          for i in range(8)]
                            break
                        lanes.append(data[j])
                else:
                    forms[nid] = lanes
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(8)]
            continue
        if mn in ("zip1", "zip2", "uzp1", "uzp2", "trn1", "trn2"):
            a = form_of(n["read_ids"][0])
            b = form_of(n["read_ids"][1]) if len(n["read_ids"]) > 1 else None
            lanes = _arr(n) or 4
            if a is not None and b is not None and len(a) == len(b) == lanes:
                half = lanes // 2
                out = []
                for i in range(lanes):
                    src = a if i % 2 == 0 else b
                    out.append(src[i // 2 if mn in ("zip1", "trn1")
                                  else half + i // 2])
                forms[nid] = out
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(lanes)]
            continue
        if mn in ("add", "sub"):
            a = form_of(n["read_ids"][0])
            b = form_of(n["read_ids"][1]) if len(n["read_ids"]) > 1 else None
            if a is not None and b is not None and len(a) == len(b):
                sign = -1.0 if mn == "sub" else 1.0
                forms[nid] = [_add(x, y, sign) for x, y in zip(a, b)]
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(_arr(n) or 4)]
            continue
        if mn == "mul":
            a = form_of(n["read_ids"][0])
            b = form_of(n["read_ids"][1]) if len(n["read_ids"]) > 1 else None
            if a is not None and b is not None and len(a) == len(b):
                vals = _const_of(n["read_ids"][1], consts) \
                    if n["read_ids"][1] is not None else None
                if vals and len(vals) >= len(a) \
                        and not _is_const_form(a):
                        forms[nid] = _scale(a, vals)
                        continue
                vals = _const_of(n["read_ids"][0], consts) \
                    if n["read_ids"][0] is not None else None
                if vals and len(vals) >= len(b) \
                        and not _is_const_form(b):
                        forms[nid] = _scale(b, vals)
                        continue
            forms[nid] = [{(nid, i): 1.0} for i in range(_arr(n) or 4)]
            continue
        if mn in ("sshll", "sshll2", "saddw", "saddw2", "smull2", "smlal",
                  "smlal2",
                  "rshrn", "rshrn2", "saddl"):
            forms[nid] = _widen_narrow_form(n, forms, consts)
            continue
        if mn == "addp":
            a = form_of(n["read_ids"][0])
            b = form_of(n["read_ids"][1]) if len(n["read_ids"]) > 1 else None
            if a is not None and b is not None:
                out = []
                for i in range(0, len(a), 2):
                    out.append(_add(a[i], a[i + 1]))
                for i in range(0, len(b), 2):
                    out.append(_add(b[i], b[i + 1]))
                forms[nid] = out
            else:
                forms[nid] = [{(nid, i): 1.0} for i in range(4)]
            continue
        forms[nid] = [{(nid, i): 1.0} for i in range(_arr(n) or 4)]
    return forms


def shared_constant_matrix_outputs(nodes, forms):
    """Detect narrow outputs with the shared-constant-matrix shape.

    out[i] = sum_j C[j] * leaf_i[j], where the coefficient pattern C is the
    same for every output lane and each lane uses its own leaf vector. This
    is the shape the internal DCT16/DCT32 kernels optimize by pre-permuting
    C and deleting the runtime data permutes.

    Returns [{node_id, const, leaf_ids}] for every matching narrow output.
    """
    out = []
    for n in nodes:
        if n["mn"] not in ("rshrn", "rshrn2"):
            continue
        f = forms.get(n["id"])
        if not f or len(f) != 4:
            continue
        # coefficients per output lane: {leaf: [coeff by leaf lane]}
        pats = []
        ok = True
        for lane in f:
            by_leaf = defaultdict(list)
            for (leaf, j), coeff in lane.items():
                by_leaf[leaf].append((j, coeff))
            if len(by_leaf) != 1:
                ok = False
                break
            leaf, terms = next(iter(by_leaf.items()))
            terms.sort()
            pats.append((leaf, [c for _, c in terms],
                          [j for j, _ in terms]))
        if not ok:
            continue
        leaves = {p[0] for p in pats}
        consts = {tuple(p[1]) for p in pats}
        lanes = {tuple(p[2]) for p in pats}
        if len(consts) == 1 and len(lanes) == 1 \
                and len(leaves) == len(pats):
            out.append({"node_id": n["id"], "mn": n["mn"],
                        "const": list(next(iter(consts))),
                        "leaf_ids": sorted(leaves)})
    return out


def expand_to_raw(output_form, nodes, forms):
    """Recursively expand a form down to raw data-load lanes.

    Returns per-lane dicts {(raw_node_id, lane): coeff}. A node is a raw
    leaf when it is a load of the kernel input (ldr/ldp/ld1 without a
    resolved .rodata constant).
    """
    def expand(terms, seen=frozenset()):
        out = defaultdict(float)
        for (leaf, lane), coeff in terms.items():
            if leaf in seen:
                out[(leaf, lane)] += coeff
                continue
            n = nodes[leaf]
            is_const = "const_bytes" in n
            is_load = n["mn"] in ("ldr", "ldp", "ldur", "ld1", "ld1r")
            if is_load and not is_const:
                out[(leaf, lane)] += coeff
                continue
            f = forms.get(leaf)
            if f is not None and lane < len(f) \
                    and not _is_const_form(f):
                for (l2, lane2), c2 in expand(f[lane],
                                              seen | {leaf}).items():
                    out[(l2, lane2)] += coeff * c2
                continue
            # constants or opaque values stay as terms (numeric if const)
            out[(leaf, lane)] += coeff
        return dict(out)

    return [expand(t) for t in output_form]


def _widen_narrow_form(n, forms, consts):
    nid = n["id"]
    mn = n["mn"]
    if mn == "rshrn":
        src = forms.get(n["read_ids"][0])
        return src[:4] if src is not None else [{(nid, i): 1.0}
                                                for i in range(4)]
    if mn == "rshrn2":
        src = forms.get(n["read_ids"][0])
        prev = forms.get(n["prev"].get(n["dst"][0]))
        lo = prev[:4] if prev is not None else [{(nid, i): 1.0}
                                                for i in range(4)]
        hi = src[:4] if src is not None else [{(nid, i): 1.0}
                                              for i in range(4)]
        return lo + hi
    if mn == "addp":
        return [{(nid, i): 1.0} for i in range(4)]
    if mn in ("sshll", "sshll2", "saddl"):
        src = forms.get(n["read_ids"][0])
        return src[:4] if src is not None else [{(nid, i): 1.0}
                                                for i in range(4)]
    if mn in ("saddw", "saddw2", "smlal", "smlal2", "smull2"):
        if mn == "saddw":
            acc = forms.get(n["read_ids"][0])
            b = forms.get(n["read_ids"][1]) if len(n["read_ids"]) > 1 \
                else None
            if acc is not None and b is not None:
                return [_add(x, y) for x, y in zip(acc[:4], b[:4])]
        if mn == "saddw2":
            acc = forms.get(n["read_ids"][0])
            b = forms.get(n["read_ids"][1]) if len(n["read_ids"]) > 1 \
                else None
            if acc is not None and b is not None:
                return [_add(x, y) for x, y in zip(acc[:4], b[4:])]
        if mn == "smull2":
            a = forms.get(n["read_ids"][0])
            b = forms.get(n["read_ids"][1])
            if a is not None and b is not None:
                for cidx, didx in ((0, 1), (1, 0)):
                    vals = _const_of(n["read_ids"][cidx], consts) \
                        if n["read_ids"][cidx] is not None else None
                    data = forms.get(n["read_ids"][didx])
                    if vals and data is not None \
                            and not _is_const_form(data):
                        # smull2 uses the TOP 4 s16 lanes of both operands
                        return _scale(data[4:8], vals[4:8])
                return [{(nid, i): 1.0} for i in range(4)]
        if mn == "smlal":
            # read order after RMW modeling: acc, constant, data
            if len(n["read_ids"]) >= 3:
                acc = forms.get(n["read_ids"][0])
                vals = _const_of(n["read_ids"][1], consts) \
                    if n["read_ids"][1] is not None else None
                data = forms.get(n["read_ids"][2])
                if vals and data is not None and acc is not None \
                        and not _is_const_form(data):
                    scaled = _scale(data[:4], vals)
                    return [_add(x, y) for x, y in zip(acc[:4], scaled)]
            return [{(nid, i): 1.0} for i in range(4)]
        if mn == "smlal2":
            # acc + c_top . x_top
            if len(n["read_ids"]) >= 3:
                acc = forms.get(n["read_ids"][0])
                vals = _const_of(n["read_ids"][1], consts) \
                    if n["read_ids"][1] is not None else None
                data = forms.get(n["read_ids"][2])
                if vals and data is not None and acc is not None \
                        and not _is_const_form(data):
                    scaled = _scale(data[4:8], vals[4:8])
                    return [_add(x, y) for x, y in zip(acc[:4], scaled)]
            return [{(nid, i): 1.0} for i in range(4)]
    return [{(nid, i): 1.0} for i in range(4)]
