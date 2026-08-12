"""PackIR: abstract data-layout projection of MachineIR.

PackIR removes opcodes, intrinsics, concrete registers and instruction order.
It only records value identities and per-lane provenance. The verifier
rejects any schema violation so search candidates cannot smuggle in
instruction details.
"""

import json
import re

SCHEMA_VERSION = "0.1"
FORBIDDEN_KEYS = ("op", "opcode", "intrinsic", "register", "reg", "seq")


def verify_pack_ir(doc):
    """Return list of violations; empty means the document is PackIR-clean."""
    violations = []
    if doc.get("schema_version") != SCHEMA_VERSION:
        violations.append("schema_version mismatch")
    for val in doc.get("values", []):
        for k in FORBIDDEN_KEYS:
            if k in val:
                violations.append("value %s contains forbidden key %r"
                                  % (val.get("id"), k))
        lanes = val.get("lanes", [])
        if not isinstance(lanes, list) or not lanes:
            violations.append("value %s has no lane list" % val.get("id"))
        for lane in lanes:
            if not isinstance(lane, dict) or \
               not ("element" in lane or "kind" in lane):
                violations.append("value %s lane is not provenance-annotated"
                                  % val.get("id"))
    if not violations:
        # order-independence check: document must not contain instruction
        # sequence list.
        if "instructions" in doc or "schedule" in doc:
            violations.append("PackIR must not contain instruction order")
    return violations


def projection_ok(machine_ir_doc, pack_ir_doc):
    """Cheap sanity: every MachineIR value has a PackIR counterpart."""
    mvalues = set()
    for node in machine_ir_doc.get("nodes", []):
        t = node.get("type", "")
        is_vector = "<" in t or node.get("op") == "intrinsic"
        if "dst" in node and is_vector:
            mvalues.add(node["dst"])
    pvalues = {v["id"] for v in pack_ir_doc.get("values", [])}
    return mvalues <= pvalues, sorted(mvalues - pvalues)


def _resolve_addr_sym(env, node):
    """Resolve an addr node to (root_base, stride_coefficient).

    Restricted to the seed shape where every byte offset is a multiple of the
    row stride (i_pix1/i_pix2). Returns (base, coef); raises on unknown forms.
    """
    rhs = node["rhs"]
    m = re.match(
        r"getelementptr\s+inbounds\s+i8,\s*ptr\s+%([A-Za-z0-9._]+),\s*"
        r"i64\s+(%[A-Za-z0-9._]+|\d+)", rhs)
    if not m:
        raise ValueError("unsupported addr form: %r" % rhs)
    ptr, off = m.group(1), m.group(2)
    if off.startswith("%"):
        off = env[off[1:]]
        if not isinstance(off, int):
            raise ValueError("non-coefficient offset for %r" % rhs)
    else:
        off = int(off)
    if ptr in ("pix1", "pix2"):
        return ptr, off
    base, coef = env[ptr]
    return base, coef + off


def project_full(machine_ir, shape=8):
    """Propagate lane provenance through the seed MachineIR -> PackIR values."""
    if shape != 8:
        raise NotImplementedError("full projection implemented for 8x8 seed")
    prov = {}
    env = {"pix1": ("pix1", 0), "pix2": ("pix2", 0),
           "i_pix1": 1, "i_pix2": 1}
    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "shl":
            env[dst] = env[node["src"][0]] << node["amt"]
        elif op == "addr":
            env[dst] = _resolve_addr_sym(env, node)
        elif op == "load":
            if node["ptr"] in ("pix1", "pix2"):
                base, coef = node["ptr"], 0
            else:
                base, coef = env[node["ptr"]]
            lanes = []
            for i in range(8):
                lanes.append({"kind": "pixel", "base": base,
                              "row": coef, "col": i})
            prov[dst] = lanes
        elif op == "zext":
            prov[dst] = list(prov[node["src"]])
        elif op in ("add", "sub"):
            a = prov[node["src"][0]]
            b = prov[node["src"][1]] if len(node["src"]) == 2 else None
            lanes = []
            for i in range(len(a)):
                if b is None:
                    lanes.append({"kind": "arith", "arith": op,
                                  "a": a[i], "const": node.get("const")})
                else:
                    lanes.append({"kind": "arith", "arith": op,
                                  "a": a[i], "b": b[i]})
            prov[dst] = lanes
        elif op == "shuffle":
            a = prov[node["src"][0]]
            b = prov[node["src"][1]]
            lanes = int(re.search(r"<(\d+) x", node["type"]).group(1))
            factor = len(a) // lanes
            out = []
            for m in node["mask"]:
                if m < lanes:
                    out.extend(a[m * factor:(m + 1) * factor])
                else:
                    out.extend(b[(m - lanes) * factor:(m - lanes + 1) * factor])
            prov[dst] = out
        elif op == "bitcast":
            prov[dst] = list(prov[node["src"]])
        elif op == "intrinsic":
            name = node["intrinsic"]
            srcs = [prov[s] for s in node["src"]]
            if name in ("abs",):
                prov[dst] = [{"kind": "arith", "arith": name, "a": p}
                             for p in srcs[0]]
            elif name in ("sabd", "umax"):
                prov[dst] = [{"kind": "arith", "arith": name, "a": x, "b": y}
                             for x, y in zip(srcs[0], srcs[1])]
            elif name == "uaddlv":
                prov[dst] = [{"kind": "reduce", "reduce": "uaddlv",
                              "src": srcs[0]}]
            else:
                raise ValueError("unknown intrinsic %r" % name)
    values = [{"id": vid, "lanes": lanes}
              for vid, lanes in prov.items() if isinstance(lanes, list)]
    return {
        "schema_version": SCHEMA_VERSION,
        "kernel": "sa8d_8x8_neon",
        "shape": shape,
        "values": values,
    }
