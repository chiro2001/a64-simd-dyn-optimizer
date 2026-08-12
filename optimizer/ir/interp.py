"""Interpreter for the restricted MachineIR emitted by the seed importer.

Executes the imported SA8D 8x8 MachineIR on explicit A/B memory planes and
compares against the canonical interpreter. This validates that the importer
preserved semantics before any search/rewrite is allowed.
"""

import re

S16 = 0xFFFF


def _s16(x):
    x &= S16
    return x - 0x10000 if x & 0x8000 else x


def _mask16(v):
    return [_s16(x) for x in v]


def _resolve_addr(env, node):
    """Evaluate an addr node's RHS into (base_name, byte_offset)."""
    rhs = node["rhs"]
    m = re.match(
        r"getelementptr\s+inbounds\s+i8,\s*ptr\s+%([A-Za-z0-9._]+),\s*"
        r"i64\s+(%[A-Za-z0-9._]+|\d+)", rhs)
    if not m:
        raise ValueError("unsupported addr form: %r" % rhs)
    base = m.group(1)
    offs = m.group(2)
    if offs.startswith("%"):
        offs = env[offs[1:]]
    else:
        offs = int(offs)
    if base in ("pix1", "pix2"):
        return base, offs
    root, base_offs = env[base]
    return root, base_offs + offs


def _load(env, mem, base_name, offset, stride):
    out = []
    for i in range(8):
        idx = offset + i
        out.append(mem[base_name][(idx // stride) * stride + (idx % stride)])
    return out


def run_machine_ir(ir, plane_a, plane_b, stride_a, stride_b):
    """Execute MachineIR; plane_a/plane_b are row-major byte sequences."""
    mem = {
        "pix1": list(plane_a),
        "pix2": list(plane_b),
    }
    env = {
        "pix1": 0,
        "pix2": 0,
        "i_pix1": stride_a,
        "i_pix2": stride_b,
    }
    result = None
    for node in ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "load":
            if node["ptr"] in ("pix1", "pix2"):
                base, offs = node["ptr"], 0
            else:
                base, offs = env[node["ptr"]]
            stride = stride_a if base == "pix1" else stride_b
            env[dst] = _load(env, mem, base, offs, stride)
        elif op == "addr":
            base, offs = _resolve_addr(env, node)
            env[dst] = (base, offs)
        elif op == "shl":
            env[dst] = env[node["src"][0]] << node["amt"]
        elif op == "zext":
            env[dst] = [x & 0xFF for x in env[node["src"]]]
        elif op in ("add", "sub"):
            a = env[node["src"][0]]
            if len(node["src"]) == 2:
                b = env[node["src"][1]]
            else:
                b = node.get("const", 0)
            if isinstance(a, list):
                env[dst] = _mask16([x + y for x, y in zip(a, b)]) if op == "add" \
                    else _mask16([x - y for x, y in zip(a, b)])
            else:
                env[dst] = (a + b) if op == "add" else (a - b)
        elif op == "shuffle":
            a = env[node["src"][0]]
            b = env[node["src"][1]]
            lanes = int(re.search(r"<(\d+) x", node["type"]).group(1))
            factor = len(a) // lanes
            out = []
            for m in node["mask"]:
                if m < lanes:
                    out.extend(a[m * factor:(m + 1) * factor])
                else:
                    out.extend(b[(m - lanes) * factor:(m - lanes + 1) * factor])
            env[dst] = out
        elif op == "bitcast":
            env[dst] = list(env[node["src"]])
        elif op == "intrinsic":
            name = node["intrinsic"]
            srcs = [env[s] for s in node["src"]]
            if name == "abs":
                env[dst] = _mask16([abs(x) for x in srcs[0]])
            elif name == "sabd":
                env[dst] = _mask16([abs(x - y) for x, y in zip(srcs[0], srcs[1])])
            elif name == "umax":
                env[dst] = [max(x, y) for x, y in zip(srcs[0], srcs[1])]
            elif name == "uaddlv":
                env[dst] = sum(srcs[0])
            else:
                raise ValueError("unknown intrinsic %r" % name)
        elif op == "lshr":
            env[dst] = env[node["src"][0]] >> node["amt"]
        elif op == "ret":
            result = env[node["operand"]]
        else:
            raise ValueError("unsupported op %r" % op)
    return result
