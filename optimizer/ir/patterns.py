"""Extract semantic instruction patterns from MachineIR.

Patterns are the interface between the current kernel IR and the AArch64
instruction selector: {op, lanes, bits, ...}. This module also fuses common
LLVM-IR pairs (zext+sub -> usubl) and classifies shuffle masks into
trn/zip/fold forms so the selector can match instructions at the right
abstraction level.
"""

import re


SHUFFLE_FORMS = {
    "<8 x i16>": {
        (0, 8, 2, 10, 4, 12, 6, 14): ("trn1", 16),
        (1, 9, 3, 11, 5, 13, 7, 15): ("trn2", 16),
        (0, 8, 1, 9, 2, 10, 3, 11): ("zip1", 16),
        (4, 12, 5, 13, 6, 14, 7, 15): ("zip2", 16),
    },
    "<4 x i32>": {
        (0, 4, 2, 6): ("trn1", 32),
        (1, 5, 3, 7): ("trn2", 32),
    },
    "<2 x i64>": {
        (0, 2): ("fold-lo", 64),
        (1, 3): ("fold-hi", 64),
    },
}


def _vec_type(t):
    m = re.match(r"<(\d+) x i(\d+)>", t)
    return (int(m.group(1)), int(m.group(2))) if m else None


def extract_patterns(machine_ir):
    """Return ordered list of pattern dicts from MachineIR nodes."""
    zext_src = {}
    patterns = []
    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "load":
            n, b = _vec_type(node["type"])
            patterns.append({"op": "load", "lanes": n, "bits": b})
        elif op == "zext":
            zext_src[dst] = node["src"]
        elif op in ("add", "sub"):
            vt = _vec_type(node["type"])
            if vt is None:
                patterns.append({"op": op, "lanes": 1, "bits": 32})
                continue
            n, b = vt
            srcs = node.get("src", [])
            if op == "sub" and len(srcs) == 2 and \
               srcs[0] in zext_src and srcs[1] in zext_src:
                patterns.append({"op": "usubl", "lanes": n, "bits": 8})
            else:
                patterns.append({"op": op, "lanes": n, "bits": b})
        elif op == "shuffle":
            vtype = node["type"]
            key = tuple(node["mask"])
            form = SHUFFLE_FORMS.get(vtype, {}).get(key)
            if form:
                name, bits = form
                if name in ("fold-lo", "fold-hi"):
                    # folds operate on the 16-bit elements inside 64-bit lanes
                    patterns.append({"op": name, "lanes": 8, "bits": 16})
                else:
                    n, _ = _vec_type(vtype)
                    patterns.append({"op": name, "lanes": n, "bits": bits})
            else:
                patterns.append({"op": "shuffle", "lanes": 8,
                                 "bits": 16, "mask": list(key)})
        elif op == "intrinsic":
            name = node["intrinsic"]
            patterns.append({"op": name, "lanes": 8, "bits": 16})
        elif op == "lshr":
            patterns.append({"op": "lshr", "lanes": 1, "bits": 32})
    return patterns


def summarize(patterns):
    out = {}
    for p in patterns:
        key = (p["op"], p.get("lanes"), p.get("bits"))
        out[key] = out.get(key, 0) + 1
    return out
