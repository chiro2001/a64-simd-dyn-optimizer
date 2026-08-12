"""Codegen from seed MachineIR to C++ NEON intrinsics (roundtrip).

The emitter is intentionally narrow: it covers exactly the op/intrinsic set
that appears in the SA8D 8x8 seed. Unknown patterns raise ValueError so a
roundtrip can never silently drop semantics.
"""

import re

TYPE_MAP = {
    "<8 x i8>": "uint8x8_t",
    "<8 x i16>": "int16x8_t",
    "<4 x i32>": "int32x4_t",
    "<2 x i64>": "int64x2_t",
    "i32": "uint32_t",
}


def _resolve_addr(env, node):
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
            raise ValueError("non-coefficient offset")
    else:
        off = int(off)
    if ptr in ("pix1", "pix2"):
        return ptr, off
    base, coef = env[ptr]
    return base, coef + off


def _shuffle_intrinsic(vtype, mask):
    patterns = {
        "<8 x i16>": {
            "vtrn1q_s16": [0, 8, 2, 10, 4, 12, 6, 14],
            "vtrn2q_s16": [1, 9, 3, 11, 5, 13, 7, 15],
            "vzip1q_s16": [0, 8, 1, 9, 2, 10, 3, 11],
            "vzip2q_s16": [4, 12, 5, 13, 6, 14, 7, 15],
        },
        "<4 x i32>": {
            "vtrn1q_s32": [0, 4, 2, 6],
            "vtrn2q_s32": [1, 5, 3, 7],
            "vzip1q_s32": [0, 4, 1, 5],
            "vzip2q_s32": [2, 6, 3, 7],
        },
        "<2 x i64>": {
            "vtrn1q_s64": [0, 2],
            "vtrn2q_s64": [1, 3],
            "vzip1q_s64": [0, 2],
            "vzip2q_s64": [1, 3],
        },
    }
    if vtype not in patterns:
        raise ValueError("shuffle type %s unsupported" % vtype)
    for name, pat in patterns[vtype].items():
        if mask == pat:
            return name
    raise ValueError("unhandled shuffle mask %r for %s" % (mask, vtype))


def _bitcast_intrinsic(src_type, dst_type):
    m = lambda t: re.match(r"<(\d+) x i(\d+)>", t)
    a, b = m(src_type), m(dst_type)
    if not a or not b:
        raise ValueError("bitcast %s -> %s" % (src_type, dst_type))
    return "vreinterpretq_s%d_s%d" % (int(b.group(2)), int(a.group(2)))


def _vector_suffix(vtype):
    m = re.match(r"<(\d+) x i(\d+)>", vtype)
    if not m:
        raise ValueError("not a vector type: %r" % vtype)
    return "s%s" % m.group(2)


def emit_c_intrinsics(machine_ir, func_name="dynopt_sa8d_8x8_neon_roundtrip"):
    lines = [
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t stride_pix1,"
        " const uint8_t* pix2, intptr_t stride_pix2)" % func_name,
        "{",
    ]
    env = {"pix1": ("pix1", 0), "pix2": ("pix2", 0),
           "i_pix1": 1, "i_pix2": 1}
    types = {}
    cname = {}

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "shl":
            env[dst] = env[node["src"][0]] << node["amt"]
        elif op == "addr":
            env[dst] = _resolve_addr(env, node)
        elif op == "load":
            base, coef = env[node["ptr"]]
            types[dst] = "uint8x8_t"
            stride = "stride_pix1" if base == "pix1" else "stride_pix2"
            lines.append("    %s %s = vld1_u8((const uint8_t*)%s +"
                         " (size_t)(%d) * %s);"
                         % (types[dst], cid(dst), base, coef, stride))
        elif op == "zext":
            src = node["src"]
            types[dst] = "int16x8_t"
            lines.append("    %s %s = vreinterpretq_s16_u16(vmovl_u8(%s));"
                         % (types[dst], cid(dst), cid(src)))
        elif op in ("add", "sub"):
            vtype = node["type"]
            types[dst] = TYPE_MAP[vtype]
            if len(node["src"]) == 2:
                lines.append("    %s %s = v%sq_%s(%s, %s);"
                             % (types[dst], cid(dst), op,
                                _vector_suffix(vtype),
                                cid(node["src"][0]), cid(node["src"][1])))
            else:
                lines.append("    %s %s = %s + %d;"
                             % (types[dst], cid(dst), cid(node["src"][0]),
                                node.get("const", 0)))
        elif op == "shuffle":
            vtype = node["type"]
            types[dst] = TYPE_MAP[vtype]
            intrinsic = _shuffle_intrinsic(vtype, node["mask"])
            lines.append("    %s %s = %s(%s, %s);"
                         % (types[dst], cid(dst), intrinsic,
                            cid(node["src"][0]), cid(node["src"][1])))
        elif op == "bitcast":
            src = node["src"]
            src_type = node.get("src_type")
            dst_type = node["type"]
            types[dst] = TYPE_MAP[dst_type]
            if src_type and src_type != dst_type:
                intrinsic = _bitcast_intrinsic(src_type, dst_type)
                lines.append("    %s %s = %s(%s);"
                             % (types[dst], cid(dst), intrinsic, cid(src)))
            else:
                lines.append("    %s %s = %s;"
                             % (types[dst], cid(dst), cid(src)))
        elif op == "intrinsic":
            name = node["intrinsic"]
            if name == "abs":
                types[dst] = "int16x8_t"
                lines.append("    %s %s = vabsq_s16(%s);"
                             % (types[dst], cid(dst), cid(node["src"][0])))
            elif name == "sabd":
                types[dst] = "int16x8_t"
                lines.append("    %s %s = vabdq_s16(%s, %s);"
                             % (types[dst], cid(dst), cid(node["src"][0]),
                                cid(node["src"][1])))
            elif name == "umax":
                types[dst] = "int16x8_t"
                lines.append("    %s %s = vreinterpretq_s16_u16(vmaxq_u16("
                             "vreinterpretq_u16_s16(%s),"
                             " vreinterpretq_u16_s16(%s)));"
                             % (types[dst], cid(dst), cid(node["src"][0]),
                                cid(node["src"][1])))
            elif name == "uaddlv":
                types[dst] = "uint32_t"
                lines.append("    %s %s = vaddlvq_u16("
                             "vreinterpretq_u16_s16(%s));"
                             % (types[dst], cid(dst), cid(node["src"][0])))
            else:
                raise ValueError("codegen unknown intrinsic %r" % name)
        elif op == "lshr":
            types[dst] = "uint32_t"
            lines.append("    %s %s = %s >> %d;"
                         % (types[dst], cid(dst), cid(node["src"][0]),
                            node["amt"]))
        elif op == "ret":
            lines.append("    return %s;" % cid(node["operand"]))
        else:
            raise ValueError("codegen unsupported op %r" % op)
    lines.append("}")
    return "\n".join(lines) + "\n"
