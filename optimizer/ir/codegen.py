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
           "i_pix1": 1, "i_pix2": 1,
           # numbered LLVM args (clang >= 21 uses %0..%3 without names)
           "0": ("pix1", 0), "1": 1, "2": ("pix2", 0), "3": 1}
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
            if vtype == "<8 x i16>" and \
                    node["mask"] == [0, 1, 2, 3, 8, 9, 10, 11]:
                # concat low halves (clang >= 21 emits this directly)
                lines.append("    %s %s = vcombine_s16(vget_low_s16(%s),"
                             " vget_low_s16(%s));"
                             % (types[dst], cid(dst), cid(node["src"][0]),
                                cid(node["src"][1])))
            else:
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


def _sve_flat_indices(node):
    """Convert a NEON shuffle mask to flat s16-lane tbl2 indices."""
    m = re.match(r"<(\d+) x i(\d+)>", node["type"])
    lanes = int(m.group(1))
    factor = 8 // lanes
    out = []
    for mask_entry in node["mask"]:
        for j in range(factor):
            if mask_entry < lanes:
                out.append(mask_entry * factor + j)
            else:
                out.append(8 + (mask_entry - lanes) * factor + j)
    return out


DCT8_TYPE_MAP = {
    "<8 x i16>": "int16x8_t",
    "<4 x i16>": "int16x4_t",
    "<4 x i32>": "int32x4_t",
    "<2 x i64>": "int64x2_t",
    "i64": "int64_t",
    "i32": "int32_t",
    "i16": "int16_t",
}

DCT8_SHUFFLES = {
    ("<4 x i16>", (3, 2, 1, 0)): "vrev64_s16",
    ("<4 x i32>", (1, 0, 3, 2)): "vrev64q_s32",
}

DCT8_TRNS = {
    ("<4 x i32>", (0, 4, 2, 6)): "vtrn1q_s32",
    ("<4 x i32>", (1, 5, 3, 7)): "vtrn2q_s32",
}

# concat(a[0:2], b[0:2]) / concat(a[2:4], b[2:4]) -- the mask [0,1,4,5] is
# the 64-bit lane interleave that the source wrote as vzip1q_s64 (NOT the
# 32-bit vzip1q_s32 lane order).
DCT8_COMBINES = {
    ("<4 x i32>", (0, 1, 4, 5)): ("low", "low"),
    ("<4 x i32>", (2, 3, 6, 7)): ("high", "high"),
}

# g_t8 copied from x265 common/constants.cpp at pinned commit b81f650; the
# DCT8 seed loads rows 1/3/5/7 as multiply constants. Kept verbatim so the
# roundtrip stays bit-exact with the C oracle.
G_T8_ROWS = (
    "    { 64, 64, 64, 64, 64, 64, 64, 64 },",
    "    { 89, 75, 50, 18, -18, -50, -75, -89 },",
    "    { 83, 36, -36, -83, -83, -36, 36, 83 },",
    "    { 75, -18, -89, -50, 50, 89, 18, -75 },",
    "    { 64, -64, -64, 64, 64, -64, -64, 64 },",
    "    { 50, -89, 18, 75, -75, -18, 89, -50 },",
    "    { 36, -83, 83, -36, -36, 83, -83, 36 },",
    "    { 18, -50, 75, -89, 89, -75, 50, -18 },",
)


def _dct8_ptr(env, node):
    """Resolve a DCT8 address node to (base, byte_offset) or scalar."""
    rhs = node["rhs"]
    m = re.match(
        r"getelementptr\s+inbounds\s+(?:nuw\s+)?(i8|i16),\s*ptr\s+"
        r"%([A-Za-z0-9._]+),\s*(?:i64\s+)?(%[A-Za-z0-9._]+|\d+)", rhs)
    if m:
        elem, base, off = m.group(1), m.group(2), m.group(3)
        scale = 2 if elem == "i16" else 1
        if off.startswith("%"):
            off = env[off[1:]]
        else:
            off = int(off)
        base_val = env[base]
        if isinstance(base_val, tuple) and base_val[0] == "ptr":
            if isinstance(off, int):
                delta = off * scale
            else:
                delta = off if scale == 1 else "(%d * (%s))" % (scale, off)
            cur = base_val[2]
            if isinstance(cur, int) and cur == 0:
                cur = delta
            elif isinstance(cur, int) and isinstance(delta, int):
                cur = cur + delta
            elif isinstance(delta, int) and delta == 0:
                pass
            else:
                cur = "(%s + %s)" % (cur, delta)
            return ("ptr", base_val[1], cur)
        raise ValueError("unsupported DCT8 base: %r" % rhs)
    g = re.match(
        r"getelementptr\s+inbounds\s+nuw\s+\(i8,\s*ptr\s+"
        r"@([A-Za-z0-9._]+),\s*i64\s+(\d+)\)", rhs)
    if g:
        return ("ptr", "g_t8:" + g.group(1), int(g.group(2)))
    raise ValueError("unsupported DCT8 addr form: %r" % rhs)


def emit_dct8_c_intrinsics(machine_ir,
                           func_name="dynopt_dct8_neon_candidate"):
    """Emit a C++ NEON roundtrip for the DCT8 seed MachineIR.

    Covers the exact op set of the clang-extracted dct8_neon seed: vector
    loads/stores, i8/i16 getelementptr addressing, scalar i64 address math,
    sext (vmovl), add/sub (vadd/vsub), per-lane constant vector multiply
    (vmulq_s32 from a constant pool), shl (vshlq_n_s32 / scalar), the four
    shuffle masks (vrev64/vzip), and the smull/addp/rshrn intrinsic family.
    """
    lines = [
        "// generated by optimizer/ir/codegen.py emit_dct8_c_intrinsics",
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "static const int16_t dct8_g_t8[8][8] =",
        "{",
    ]
    lines.extend(G_T8_ROWS)
    lines.extend([
        "};",
        "",
        "extern \"C\" void %s(const int16_t* src, int16_t* dst,"
        " intptr_t srcStride)" % func_name,
        "{",
    ])
    env = {"0": ("ptr", "src", 0), "1": ("ptr", "dst", 0),
           "2": "srcStride"}
    types = {}
    cname = {}
    const_pool = {}   # tuple const -> ("cN", int32_t)

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def const_vec_id(vec):
        key = tuple(vec)
        if key not in const_pool:
            ident = "c%d" % len(const_pool)
            const_pool[key] = ident
            # emit the pool entry lazily at the end via a header block
        return const_pool[key]

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "addr":
            env[dst] = _dct8_ptr(env, node)
        elif op in ("shl", "mul", "mla"):
            src = node["src"]
            if node["type"] and node["type"].startswith("<"):
                types[dst] = DCT8_TYPE_MAP[node["type"]]
                if op == "shl":
                    lines.append("    %s %s = vshlq_n_s32(%s, %d);"
                                 % (types[dst], cid(dst), cid(src[0]),
                                    node["amt"]))
                elif node.get("const_vec"):
                    vec = node["const_vec"]
                    splat = vec[0] == vec[1] == vec[2] == vec[3]
                    if op == "mla" and splat:
                        lines.append("    %s %s = vmlaq_n_s32(%s, %s, %d);"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        cid(src[1]), vec[0]))
                    elif op == "mla":
                        cidn = const_vec_id(vec)
                        lines.append("    %s %s = vmlaq_s32(%s, %s,"
                                     " vld1q_s32((const int32_t*)%s));"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        cid(src[1]), cidn))
                    elif splat:
                        lines.append("    %s %s = vmulq_n_s32(%s, %d);"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        vec[0]))
                    else:
                        cidn = const_vec_id(vec)
                        lines.append("    %s %s = vmulq_s32(%s,"
                                     " vld1q_s32((const int32_t*)%s));"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        cidn))
                else:
                    fn = "vmlaq_s32" if op == "mla" else "vmulq_s32"
                    lines.append("    %s %s = %s(%s, %s);"
                                 % (types[dst], cid(dst), fn, cid(src[0]),
                                    cid(src[1])))
            else:
                a = env[src[0]]
                if op == "shl":
                    env[dst] = a << node["amt"] if isinstance(a, int) \
                        else "((%s) << %d)" % (a, node["amt"])
                elif node.get("const") is not None:
                    env[dst] = a * node["const"] if isinstance(a, int) \
                        else "((%s) * %d)" % (a, node["const"])
                else:
                    b = env[src[1]]
                    env[dst] = a * b if isinstance(a, int) \
                        and isinstance(b, int) else "((%s) * (%s))" % (a, b)
        elif op in ("add", "sub"):
            vtype = node["type"]
            if vtype and vtype.startswith("<"):
                types[dst] = DCT8_TYPE_MAP[vtype]
                lanes = int(vtype[1:].split(" x ")[0])
                width = int(vtype.split("i")[1].rstrip(">"))
                suffix = "q" if lanes * width >= 128 else ""
                lines.append("    %s %s = v%s%s_s%d(%s, %s);"
                             % (types[dst], cid(dst), op, suffix, width,
                                cid(node["src"][0]), cid(node["src"][1])))
            else:
                a = env[node["src"][0]]
                if len(node["src"]) == 2:
                    b = env[node["src"][1]]
                    if isinstance(a, int) and isinstance(b, int):
                        env[dst] = a + b if op == "add" else a - b
                    else:
                        env[dst] = "(%s %s %s)" % (a, "+" if op == "add"
                                                   else "-", b)
                else:
                    c = node.get("const", 0)
                    env[dst] = (a + c if op == "add" else a - c) \
                        if isinstance(a, int) \
                        else "((%s) %s %d)" % (a, "+" if op == "add"
                                               else "-", c)
        elif op == "sext":
            types[dst] = "int32x4_t"
            srcs = node["src"] if isinstance(node["src"], list) \
                else [node["src"]]
            lines.append("    %s %s = vmovl_s16(%s);"
                         % (types[dst], cid(dst), cid(srcs[0])))
        elif op == "shuffle":
            key = (node["type"], tuple(node["mask"]))
            if key not in DCT8_SHUFFLES and key not in DCT8_COMBINES \
                    and key not in DCT8_TRNS:
                raise ValueError("DCT8 unknown shuffle %r" % (key,))
            types[dst] = DCT8_TYPE_MAP[node["type"]]
            if key in DCT8_SHUFFLES:
                fn = DCT8_SHUFFLES[key]
                lines.append("    %s %s = %s(%s);"
                             % (types[dst], cid(dst), fn,
                                cid(node["src"][0])))
            elif key in DCT8_TRNS:
                fn = DCT8_TRNS[key]
                lines.append("    %s %s = %s(%s, %s);"
                             % (types[dst], cid(dst), fn,
                                cid(node["src"][0]), cid(node["src"][1])))
            else:
                lo, hi = DCT8_COMBINES[key]
                lines.append("    %s %s = vcombine_s32(vget_%s_s32(%s),"
                             " vget_%s_s32(%s));"
                             % (types[dst], cid(dst), lo,
                                cid(node["src"][0]), hi,
                                cid(node["src"][1])))
        elif op == "load":
            types[dst] = DCT8_TYPE_MAP[node["type"]]
            wide = node["type"] == "<8 x i16>"
            if node.get("const_name"):
                fn = "vld1q_s16" if wide else "vld1_s16"
                lines.append("    %s %s = %s(&dct8_g_t8[0][0] + %d);"
                             % (types[dst], cid(dst), fn,
                                node["const_off"] // 2))
            else:
                base_val = env[node["ptr"]]
                if not (isinstance(base_val, tuple) and base_val[0] == "ptr"):
                    raise ValueError("DCT8 load from non-pointer")
                base, off = base_val[1], base_val[2]
                if base == "src":
                    off_s = str(off) if isinstance(off, int) else off
                    fn = "vld1q_s16" if wide else "vld1_s16"
                    lines.append("    %s %s = %s((const int16_t*)"
                                 "((const char*)src + (%s)));"
                                 % (types[dst], cid(dst), fn, off_s))
                else:
                    raise ValueError("DCT8 unknown load base %r" % (base,))
        elif op == "half":
            types[dst] = "int16x4_t"
            fn = "vget_%s_s16" % node["half"]
            lines.append("    %s %s = %s(%s);"
                         % (types[dst], cid(dst), fn, cid(node["src"])))
        elif op == "store":
            base_val = env[node["ptr"]]
            base, off = base_val[1], base_val[2]
            off_s = str(off) if isinstance(off, int) else off
            src = node["src"] if isinstance(node["src"], str) \
                else node["src"][0]
            lines.append("    vst1_s16((int16_t*)((char*)dst + (%s)), %s);"
                         % (off_s, cid(src)))
        elif op == "intrinsic":
            name = node["intrinsic"]
            a = cid(node["args"][0]["ref"])
            if name == "smull":
                b = cid(node["args"][1]["ref"])
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vmull_s16(%s, %s);"
                             % (types[dst], cid(dst), a, b))
            elif name == "addp":
                b = cid(node["args"][1]["ref"])
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vpaddq_s32(%s, %s);"
                             % (types[dst], cid(dst), a, b))
            elif name == "rshrn":
                imm = next(x["imm"] for x in node["args"] if "imm" in x)
                types[dst] = "int16x4_t"
                lines.append("    %s %s = vrshrn_n_s32(%s, %d);"
                             % (types[dst], cid(dst), a, imm))
            else:
                raise ValueError("DCT8 codegen unknown intrinsic %r" % name)
        elif op == "ret":
            lines.append("    (void)0;")
        else:
            raise ValueError("DCT8 codegen unsupported op %r" % op)
    lines.append("}")
    head = lines
    body = "\n".join(head)
    if const_pool:
        decls = []
        for vec, ident in const_pool.items():
            decls.append("static const int32_t %s[4] = {%d, %d, %d, %d};"
                         % (ident, vec[0], vec[1], vec[2], vec[3]))
        anchor = body.index("static const int16_t dct8_g_t8")
        body = body[:anchor] + "\n".join(decls) + "\n" + body[anchor:]
    return body + "\n"


# g_t16 copied from x265 common/constants.cpp (pinned b81f650), 16x16.
G_T16_ROWS = (
    "    { 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64 },",
    "    { 90, 87, 80, 70, 57, 43, 25,  9, -9, -25, -43, -57, -70, -80, -87, -90 },",
    "    { 89, 75, 50, 18, -18, -50, -75, -89, -89, -75, -50, -18, 18, 50, 75, 89 },",
    "    { 87, 57,  9, -43, -80, -90, -70, -25, 25, 70, 90, 80, 43, -9, -57, -87 },",
    "    { 83, 36, -36, -83, -83, -36, 36, 83, 83, 36, -36, -83, -83, -36, 36, 83 },",
    "    { 80,  9, -70, -87, -25, 57, 90, 43, -43, -90, -57, 25, 87, 70, -9, -80 },",
    "    { 75, -18, -89, -50, 50, 89, 18, -75, -75, 18, 89, 50, -50, -89, -18, 75 },",
    "    { 70, -43, -87,  9, 90, 25, -80, -57, 57, 80, -25, -90, -9, 87, 43, -70 },",
    "    { 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64 },",
    "    { 57, -80, -25, 90, -9, -87, 43, 70, -70, -43, 87,  9, -90, 25, 80, -57 },",
    "    { 50, -89, 18, 75, -75, -18, 89, -50, -50, 89, -18, -75, 75, 18, -89, 50 },",
    "    { 43, -90, 57, 25, -87, 70,  9, -80, 80, -9, -70, 87, -25, -57, 90, -43 },",
    "    { 36, -83, 83, -36, -36, 83, -83, 36, 36, -83, 83, -36, -36, 83, -83, 36 },",
    "    { 25, -70, 90, -80, 43,  9, -57, 87, -87, 57, -9, -43, 80, -90, 70, -25 },",
    "    { 18, -50, 75, -89, 89, -75, 50, -18, -18, 50, -75, 89, -89, 75, -50, 18 },",
    "    {  9, -25, 43, -57, 70, -80, 87, -90, 90, -87, 80, -70, 57, -43, 25, -9 },",
)


def emit_dct16_c_intrinsics(machine_ir,
                            func_name="dynopt_dct16_neon_candidate"):
    """NEON roundtrip for the fully-unrolled DCT16 seed (partialButterfly16).

    Same op family as the DCT8 roundtrip plus the DCT16 shuffle set:
    rev16 (8-lane s16 reverse), rev32 (4-lane s32 full reverse), rev64q,
    vget_low/high half extracts, and the vcombine concat masks. All values
    are single NEON registers (8-lane s16 or 4-lane s16/s32).
    """
    lines = [
        "// generated by optimizer/ir/codegen.py emit_dct16_c_intrinsics",
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "static const int16_t dct16_g_t16[16][16] =",
        "{",
    ]
    lines.extend(G_T16_ROWS)
    lines.extend([
        "};",
        "",
        "extern \"C\" void %s(const int16_t* src, int16_t* dst,"
        " intptr_t srcStride)" % func_name,
        "{",
    ])
    env = {"0": ("ptr", "src", 0), "1": ("ptr", "dst", 0),
           "2": "srcStride"}
    types = {}
    cname = {}
    const_pool = {}

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def const_vec_id(vec):
        key = tuple(vec)
        if key not in const_pool:
            const_pool[key] = "c%d" % len(const_pool)
        return const_pool[key]

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "addr":
            env[dst] = _dct8_ptr(env, node)
        elif op in ("shl", "mul"):
            src = node["src"]
            if node["type"] and node["type"].startswith("<"):
                types[dst] = DCT8_TYPE_MAP[node["type"]]
                if op == "shl":
                    lines.append("    %s %s = vshlq_n_s32(%s, %d);"
                                 % (types[dst], cid(dst), cid(src[0]),
                                    node["amt"]))
                elif node.get("const_vec"):
                    vec = node["const_vec"]
                    splat = vec[0] == vec[1] == vec[2] == vec[3]
                    if splat:
                        lines.append("    %s %s = vmulq_n_s32(%s, %d);"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        vec[0]))
                    else:
                        cidn = const_vec_id(vec)
                        lines.append("    %s %s = vmulq_s32(%s,"
                                     " vld1q_s32((const int32_t*)%s));"
                                     % (types[dst], cid(dst), cid(src[0]),
                                        cidn))
                else:
                    lines.append("    %s %s = vmulq_s32(%s, %s);"
                                 % (types[dst], cid(dst), cid(src[0]),
                                    cid(src[1])))
            else:
                a = env[src[0]]
                if op == "shl":
                    env[dst] = a << node["amt"] if isinstance(a, int) \
                        else "((%s) << %d)" % (a, node["amt"])
                elif node.get("const") is not None:
                    env[dst] = a * node["const"] if isinstance(a, int) \
                        else "((%s) * %d)" % (a, node["const"])
                else:
                    b = env[src[1]]
                    env[dst] = a * b if isinstance(a, int) \
                        and isinstance(b, int) else "((%s) * (%s))" % (a, b)
        elif op in ("add", "sub"):
            vtype = node["type"]
            if vtype and vtype.startswith("<"):
                types[dst] = DCT8_TYPE_MAP[vtype]
                lanes = int(vtype[1:].split(" x ")[0])
                width = int(vtype.split("i")[1].rstrip(">"))
                suffix = "q" if lanes * width >= 128 else ""
                lines.append("    %s %s = v%s%s_s%d(%s, %s);"
                             % (types[dst], cid(dst), op, suffix, width,
                                cid(node["src"][0]), cid(node["src"][1])))
            else:
                a = env[node["src"][0]]
                if len(node["src"]) == 2:
                    b = env[node["src"][1]]
                    if isinstance(a, int) and isinstance(b, int):
                        env[dst] = a + b if op == "add" else a - b
                    else:
                        env[dst] = "(%s %s %s)" % (a, "+" if op == "add"
                                                   else "-", b)
                else:
                    c = node.get("const", 0)
                    env[dst] = (a + c if op == "add" else a - c) \
                        if isinstance(a, int) \
                        else "((%s) %s %d)" % (a, "+" if op == "add"
                                               else "-", c)
        elif op == "sext":
            types[dst] = "int32x4_t"
            srcs = node["src"] if isinstance(node["src"], list) \
                else [node["src"]]
            lines.append("    %s %s = vmovl_s16(%s);"
                         % (types[dst], cid(dst), cid(srcs[0])))
        elif op == "shuffle":
            key = (node["type"], tuple(node["mask"]))
            srcs = node["src"]
            if key == ("<8 x i16>", (7, 6, 5, 4, 3, 2, 1, 0)):
                # rev16: reverse 8 s16 lanes (upstream uses a tbl; two ops
                # here: rev64 within halves, then swap the 64-bit halves).
                types[dst] = "int16x8_t"
                if len(srcs) == 2:
                    lines.append("    int16x8_t %s_c = vcombine_s16(%s, %s);"
                                 % (cid(dst), cid(srcs[0]), cid(srcs[1])))
                    a = "%s_c" % cid(dst)
                else:
                    a = cid(srcs[0])
                lines.append("    %s %s = vcombine_s16("
                             "vget_high_s16(vrev64q_s16(%s)),"
                             " vget_low_s16(vrev64q_s16(%s)));"
                             % (types[dst], cid(dst), a, a))
            elif key == ("<8 x i16>", (0, 1, 2, 3, 4, 5, 6, 7)):
                types[dst] = "int16x8_t"
                lines.append("    %s %s = vcombine_s16(%s, %s);"
                             % (types[dst], cid(dst), cid(srcs[0]),
                                cid(srcs[1])))
            elif key == ("<4 x i16>", (0, 1, 2, 3)):
                types[dst] = "int16x4_t"
                lines.append("    %s %s = vget_low_s16(%s);"
                             % (types[dst], cid(dst), cid(srcs[0])))
            elif key == ("<4 x i16>", (4, 5, 6, 7)):
                types[dst] = "int16x4_t"
                lines.append("    %s %s = vget_high_s16(%s);"
                             % (types[dst], cid(dst), cid(srcs[0])))
            elif key == ("<4 x i32>", (1, 0, 3, 2)):
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vrev64q_s32(%s);"
                             % (types[dst], cid(dst), cid(srcs[0])))
            elif key == ("<4 x i32>", (3, 2, 1, 0)):
                # rev32: full 4-lane s32 reverse.
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vcombine_s32("
                             "vget_high_s32(vrev64q_s32(%s)),"
                             " vget_low_s32(vrev64q_s32(%s)));"
                             % (types[dst], cid(dst), cid(srcs[0]),
                                cid(srcs[0])))
            elif key in (("<4 x i32>", (0, 1, 4, 5)),
                         ("<4 x i32>", (2, 3, 6, 7))):
                types[dst] = "int32x4_t"
                lo, hi = ("low", "low") if key[1][:2] == (0, 1) \
                    else ("high", "high")
                lines.append("    %s %s = vcombine_s32(vget_%s_s32(%s),"
                             " vget_%s_s32(%s));"
                             % (types[dst], cid(dst), lo, cid(srcs[0]),
                                hi, cid(srcs[1])))
            else:
                raise ValueError("DCT16 unknown shuffle %r" % (key,))
        elif op == "load":
            types[dst] = DCT8_TYPE_MAP[node["type"]]
            wide = node["type"] == "<8 x i16>"
            if node.get("const_name"):
                fn = "vld1q_s16" if wide else "vld1_s16"
                lines.append("    %s %s = %s(&dct16_g_t16[0][0] + %d);"
                             % (types[dst], cid(dst), fn,
                                node["const_off"] // 2))
            else:
                base_val = env[node["ptr"]]
                if not (isinstance(base_val, tuple) and base_val[0] == "ptr"):
                    raise ValueError("DCT16 load from non-pointer")
                base, off = base_val[1], base_val[2]
                if base == "src":
                    off_s = str(off) if isinstance(off, int) else off
                    fn = "vld1q_s16" if wide else "vld1_s16"
                    lines.append("    %s %s = %s((const int16_t*)"
                                 "((const char*)src + (%s)));"
                                 % (types[dst], cid(dst), fn, off_s))
                else:
                    raise ValueError("DCT16 unknown load base %r" % (base,))
        elif op == "store":
            base_val = env[node["ptr"]]
            base, off = base_val[1], base_val[2]
            off_s = str(off) if isinstance(off, int) else off
            src = node["src"] if isinstance(node["src"], str) \
                else node["src"][0]
            lines.append("    vst1_s16((int16_t*)((char*)dst + (%s)), %s);"
                         % (off_s, cid(src)))
        elif op == "intrinsic":
            name = node["intrinsic"]
            a = cid(node["args"][0]["ref"])
            if name == "smull":
                b = cid(node["args"][1]["ref"])
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vmull_s16(%s, %s);"
                             % (types[dst], cid(dst), a, b))
            elif name == "addp":
                b = cid(node["args"][1]["ref"])
                types[dst] = "int32x4_t"
                lines.append("    %s %s = vpaddq_s32(%s, %s);"
                             % (types[dst], cid(dst), a, b))
            elif name == "rshrn":
                imm = next(x["imm"] for x in node["args"] if "imm" in x)
                types[dst] = "int16x4_t"
                lines.append("    %s %s = vrshrn_n_s32(%s, %d);"
                             % (types[dst], cid(dst), a, imm))
            else:
                raise ValueError("DCT16 codegen unknown intrinsic %r" % name)
        elif op == "ret":
            lines.append("    (void)0;")
        else:
            raise ValueError("DCT16 codegen unsupported op %r" % op)
    lines.append("}")
    body = "\n".join(lines)
    if const_pool:
        decls = []
        for vec, ident in const_pool.items():
            decls.append("static const int32_t %s[4] = {%d, %d, %d, %d};"
                         % (ident, vec[0], vec[1], vec[2], vec[3]))
        anchor = body.index("static const int16_t dct16_g_t16")
        body = body[:anchor] + "\n".join(decls) + "\n" + body[anchor:]
    return body + "\n"


def _sve_trn_spec(node):
    """Return (intrinsic, element-type) if the shuffle is exactly an SVE
    TRN1/TRN2 at the native element width, else None.

    The SA8D seed uses exactly six masks (TRN1/TRN2 at i16/i32/i64), each
    repeated four times. SVE TRN applies the same interleave across the
    whole vector, so at VL=256 the low 8-lane halves (two packed tiles) are
    transformed independently with a single instruction and no index vectors.
    """
    vtype = node["type"]
    mask = tuple(node["mask"])
    patterns = {
        ("<8 x i16>", (0, 8, 2, 10, 4, 12, 6, 14)): ("svtrn1_u16", "u16"),
        ("<8 x i16>", (1, 9, 3, 11, 5, 13, 7, 15)): ("svtrn2_u16", "u16"),
        ("<4 x i32>", (0, 4, 2, 6)): ("svtrn1_u32", "u32"),
        ("<4 x i32>", (1, 5, 3, 7)): ("svtrn2_u32", "u32"),
        ("<2 x i64>", (0, 2)): ("svtrn1_u64", "u64"),
        ("<2 x i64>", (1, 3)): ("svtrn2_u64", "u64"),
    }
    return patterns.get((vtype, mask))


def _dct8_sve_tbl(node):
    """Return (elem, indices) for a DCT8 shuffle expressed as svtbl2.

    All DCT8 vectors are 4 logical lanes (s16 or s32) held in the low 4 lanes
    of a VL=256 register. A NEON shuffle mask entry 0..3 selects the first
    input and 4..7 selects the second. svtbl2 indexes the tuple
    [A lanes, B lanes] over the FULL register width: at VL=256 an s32
    register has 8 lanes and an s16 register has 16, so a mask entry m>=4
    must map to B via `reg_lanes + (m - 4)`.
    """
    vtype = node["type"]
    if vtype == "<4 x i16>":
        lanes = 16
        idx = [m if m < 4 else lanes + (m - 4) for m in node["mask"]]
        return "s16", idx
    if vtype == "<4 x i32>":
        lanes = 8
        idx = [m if m < 4 else lanes + (m - 4) for m in node["mask"]]
        return "s32", idx
    raise ValueError("DCT8 SVE shuffle type %s unsupported" % vtype)


def emit_dct8_sve2_intrinsics(machine_ir,
                              func_name="dynopt_dct8_neon_sve2"):
    """SVE2 backend over the DCT8 seed MachineIR (fixed VL=256).

    All 4-lane values live in the low 4 lanes of VL=256 registers; loads,
    stores and arithmetic use svwhilelt predicates. Shuffles are svtbl2 with
    constant indices (the SVE 128-bit-segment layout never leaks into the
    logical lanes). smull is emitted as unpklo+unpklo+mul and rshrn as
    svrshrnb/svrshrnt + svtbl concat, both bit-exact with the NEON vrshrn
    semantics. Callers must fix VL to 256 bits (svcntb()==32) before calling.
    """
    lines = [
        "// generated by optimizer/ir/codegen.py emit_dct8_sve2_intrinsics",
        "#include <arm_sve.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "static const int16_t dct8_g_t8[8][8] =",
        "{",
    ]
    lines.extend(G_T8_ROWS)
    lines.extend([
        "};",
        "",
        "extern \"C\" void %s(const int16_t* src, int16_t* dst,"
        " intptr_t srcStride)" % func_name,
        "{",
        "    svbool_t pg16_4 = svwhilelt_b16(0, 4);",
        "    svbool_t pg16_8 = svwhilelt_b16(0, 8);",
        "    svbool_t pg32_4 = svwhilelt_b32(0, 4);",
    ])
    env = {"0": ("ptr", "src", 0), "1": ("ptr", "dst", 0),
           "2": "srcStride"}
    types = {}
    cname = {}
    const_pool = {}
    idx_counter = [0]

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def const_vec_id(vec):
        key = tuple(vec)
        if key not in const_pool:
            const_pool[key] = "c%d" % len(const_pool)
        return const_pool[key]

    def elem_type(dst):
        return types.get(dst, "s16")

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "addr":
            env[dst] = _dct8_ptr(env, node)
        elif op in ("shl", "mul"):
            src = node["src"]
            if node["type"] and node["type"].startswith("<"):
                if op == "mul":
                    types[dst] = "s32"
                    a = cid(src[0])
                    if node.get("const_vec"):
                        vec = node["const_vec"]
                        if vec[0] == vec[1] == vec[2] == vec[3]:
                            b = "svdup_n_s32(%d)" % vec[0]
                        else:
                            ident = const_vec_id(vec)
                            b = ("svld1_s32(pg32_4,"
                                 " (const int32_t*)%s)" % ident)
                        lines.append("    svint32_t %s = svmul_s32_x("
                                     "pg32_4, %s, %s);"
                                     % (cid(dst), a, b))
                    else:
                        lines.append("    svint32_t %s = svmul_s32_x("
                                     "pg32_4, %s, %s);"
                                     % (cid(dst), a, cid(src[1])))
                else:
                    types[dst] = "s32"
                    lines.append("    svint32_t %s = svlsl_n_s32_x(pg32_4,"
                                 " %s, %d);"
                                 % (cid(dst), cid(src[0]), node["amt"]))
            else:
                a = env[src[0]]
                if op == "shl":
                    env[dst] = a << node["amt"] if isinstance(a, int) \
                        else "((%s) << %d)" % (a, node["amt"])
                elif node.get("const") is not None:
                    env[dst] = a * node["const"] if isinstance(a, int) \
                        else "((%s) * %d)" % (a, node["const"])
                else:
                    b = env[src[1]]
                    env[dst] = a * b if isinstance(a, int) \
                        and isinstance(b, int) else "((%s) * (%s))" % (a, b)
        elif op == "mla":
            types[dst] = "s32"
            vec = node["const_vec"]
            if vec[0] == vec[1] == vec[2] == vec[3]:
                c = "svdup_n_s32(%d)" % vec[0]
            else:
                ident = const_vec_id(vec)
                c = "svld1_s32(pg32_4, (const int32_t*)%s)" % ident
            lines.append("    svint32_t %s = svmla_s32_x(pg32_4, %s, %s,"
                         " %s);"
                         % (cid(dst), cid(node["src"][0]),
                            cid(node["src"][1]), c))
        elif op in ("add", "sub"):
            vtype = node["type"]
            if vtype and vtype.startswith("<"):
                elem = "s32" if "i32" in vtype else "s16"
                types[dst] = elem
                pg = "pg32_4" if elem == "s32" else "pg16_4"
                fn = ("svadd_%s_x" if op == "add" else "svsub_%s_x") % elem
                lines.append("    svint%d_t %s = %s(%s, %s, %s);"
                             % (32 if elem == "s32" else 16, cid(dst), fn,
                                pg, cid(node["src"][0]),
                                cid(node["src"][1])))
            else:
                a = env[node["src"][0]]
                if len(node["src"]) == 2:
                    b = env[node["src"][1]]
                    if isinstance(a, int) and isinstance(b, int):
                        env[dst] = a + b if op == "add" else a - b
                    else:
                        env[dst] = "(%s %s %s)" % (a, "+" if op == "add"
                                                   else "-", b)
                else:
                    c = node.get("const", 0)
                    env[dst] = (a + c if op == "add" else a - c) \
                        if isinstance(a, int) \
                        else "((%s) %s %d)" % (a, "+" if op == "add"
                                               else "-", c)
        elif op == "sext":
            types[dst] = "s32"
            srcs = node["src"] if isinstance(node["src"], list) \
                else [node["src"]]
            lines.append("    svint32_t %s = svunpklo_s32(%s);"
                         % (cid(dst), cid(srcs[0])))
        elif op == "shuffle":
            elem, idx = _dct8_sve_tbl(node)
            types[dst] = elem
            a = cid(node["src"][0])
            b = cid(node["src"][1]) if len(node["src"]) > 1 else a
            n = idx_counter[0]
            idx_counter[0] += 1
            if elem == "s16":
                lines.append("    static const uint16_t didx%d[4] = "
                             "{ %d, %d, %d, %d };" % (n, *idx))
                lines.append("    svint16_t %s = svtbl2_s16("
                             "svcreate2_s16(%s, %s),"
                             " svld1_u16(pg16_4, didx%d));"
                             % (cid(dst), a, b, n))
            else:
                lines.append("    static const uint32_t didx%d[4] = "
                             "{ %d, %d, %d, %d };" % (n, *idx))
                lines.append("    svint32_t %s = svtbl2_s32("
                             "svcreate2_s32(%s, %s),"
                             " svld1_u32(pg32_4, didx%d));"
                             % (cid(dst), a, b, n))
        elif op == "half":
            types[dst] = "s16"
            n = idx_counter[0]
            idx_counter[0] += 1
            lo = node["half"] == "low"
            vals = "0, 1, 2, 3" if lo else "4, 5, 6, 7"
            lines.append("    static const uint16_t didx%d[4] = { %s };"
                         % (n, vals))
            lines.append("    svint16_t %s = svtbl_s16(%s,"
                         " svld1_u16(pg16_4, didx%d));"
                         % (cid(dst), cid(node["src"]), n))
        elif op == "load":
            wide = node["type"] == "<8 x i16>"
            types[dst] = "s16"
            pg = "pg16_8" if wide else "pg16_4"
            if node.get("const_name"):
                lines.append("    svint16_t %s = svld1_s16(%s,"
                             " &dct8_g_t8[0][0] + %d);"
                             % (cid(dst), pg, node["const_off"] // 2))
            else:
                base_val = env[node["ptr"]]
                if not (isinstance(base_val, tuple) and base_val[0] == "ptr"):
                    raise ValueError("DCT8 SVE load from non-pointer")
                base, off = base_val[1], base_val[2]
                if base != "src":
                    raise ValueError("DCT8 SVE unknown load base %r"
                                     % (base,))
                off_s = str(off) if isinstance(off, int) else off
                lines.append("    svint16_t %s = svld1_s16(%s,"
                             " (const int16_t*)((const char*)src + (%s)));"
                             % (cid(dst), pg, off_s))
        elif op == "store":
            base_val = env[node["ptr"]]
            base, off = base_val[1], base_val[2]
            off_s = str(off) if isinstance(off, int) else off
            src = node["src"] if isinstance(node["src"], str) \
                else node["src"][0]
            lines.append("    svst1_s16(pg16_4,"
                         " (int16_t*)((char*)dst + (%s)), %s);"
                         % (off_s, cid(src)))
        elif op == "intrinsic":
            name = node["intrinsic"]
            a = cid(node["args"][0]["ref"])
            if name == "smull":
                b = cid(node["args"][1]["ref"])
                types[dst] = "s32"
                lines.append("    svint32_t %s = svmul_s32_x(pg32_4,"
                             " svunpklo_s32(%s), svunpklo_s32(%s));"
                             % (cid(dst), a, b))
            elif name == "addp":
                b = cid(node["args"][1]["ref"])
                types[dst] = "s32"
                # SVE2 ADDP interleaves pairs: [a0+a1, b0+b1, a2+a3, b2+b3],
                # while NEON vpaddq is [a0+a1, a2+a3, b0+b1, b2+b3].
                n = idx_counter[0]
                idx_counter[0] += 1
                lines.append("    static const uint32_t didx%d[4] = "
                             "{ 0, 2, 1, 3 };" % n)
                lines.append("    svint32_t %s_p = svaddp_s32_x(pg32_4,"
                             " %s, %s);" % (cid(dst), a, b))
                lines.append("    svint32_t %s = svtbl_s32(%s_p,"
                             " svld1_u32(pg32_4, didx%d));"
                             % (cid(dst), cid(dst), n))
            elif name == "rshrn":
                imm = next(x["imm"] for x in node["args"] if "imm" in x)
                types[dst] = "s16"
                # NEON vrshrn_n == SVE2 SRSHRNB/SRSHRNT (rounding narrow).
                # SHRNB fills even s16 lanes from the bottom s32 half,
                # SHRNT fills odd s16 lanes from all s32 lanes; svshrnt
                # merges its first operand into the even lanes. The bottom
                # four results therefore live in s16 lanes 0,2,4,6.
                lines.append("    svint16_t %s_b = svrshrnb_n_s32(%s, %d);"
                             % (cid(dst), a, imm))
                lines.append("    svint16_t %s = svrshrnt_n_s32(%s_b,"
                             " %s, %d);"
                             % (cid(dst), cid(dst), a, imm))
                # Collapse the duplicated layout back to four contiguous
                # lanes: [n0, n0, n1, n1, n2, n2, n3, n3] -> {0,2,4,6}.
                n = idx_counter[0]
                idx_counter[0] += 1
                lines.append("    static const uint16_t didx%d[4] = "
                             "{ 0, 2, 4, 6 };" % n)
                final = cid(dst) + "_f"
                lines.append("    svint16_t %s = svtbl_s16(%s,"
                             " svld1_u16(pg16_4, didx%d));"
                             % (final, cid(dst), n))
                cname[dst] = final
            else:
                raise ValueError("DCT8 SVE codegen unknown intrinsic %r"
                                 % name)
        elif op == "ret":
            lines.append("    (void)0;")
        else:
            raise ValueError("DCT8 SVE codegen unsupported op %r" % op)
    lines.append("}")
    body = "\n".join(lines)
    if const_pool:
        decls = []
        for vec, ident in const_pool.items():
            decls.append("static const int32_t %s[4] = {%d, %d, %d, %d};"
                         % (ident, vec[0], vec[1], vec[2], vec[3]))
        anchor = body.index("static const int16_t dct8_g_t8")
        body = body[:anchor] + "\n".join(decls) + "\n" + body[anchor:]
    return body + "\n"


def emit_sve_intrinsics(machine_ir,
                        func_name="dynopt_sa8d_8x8_neon_sve2",
                        active_lanes=8,
                        pack=1,
                        raw=False):
    """SVE2 backend over the same seed MachineIR.

    pack=1: `active_lanes` active s16 lanes (default 8), single 8x8 tile.
    pack=2: 16 active s16 lanes, two horizontally adjacent 8x8 tiles packed
    into one vector (tile A in lanes 0-7, tile B in lanes 8-15). The
    per-tile reduction tail is duplicated with half-vector predicates and the
    two rounded results are summed, preserving bit-exact per-tile rounding.

    Permutes use svtbl2 with constant index vectors; the lane offset of the
    upper 8-lane half is derived from the same NEON shuffle mask. Index
    vectors are loaded under the active predicate `pg` (not svptrue), so
    VL=512 never reads past the 16-entry constant arrays.

    Contract: pack=2 requires VL >= 256 (fixed VL=256 or VLA-minimum).
    At VL=128 the low 8 lanes are active and the upper-half sum is silently
    zero, so dispatch must never enable this candidate below VL=256.
    """
    if pack not in (1, 2):
        raise ValueError("pack must be 1 or 2, got %r" % (pack,))
    lanes = 16 if pack == 2 else active_lanes
    lines = [
        "#include <arm_sve.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t stride_pix1,"
        " const uint8_t* pix2, intptr_t stride_pix2)" % func_name,
        "{",
        "    svbool_t pg = svwhilelt_b16(0, %d);" % lanes,
    ]
    env = {"pix1": ("pix1", 0), "pix2": ("pix2", 0),
           "i_pix1": 1, "i_pix2": 1}
    cname = {}
    idx_counter = [0]

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def pair_cid(name):
        """Register a pair of scalar C variables (per-tile results)."""
        if name not in cname:
            cname[name] = "p%d" % len(cname)
        return cname[name] + "_a", cname[name] + "_b"

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "shl":
            env[dst] = env[node["src"][0]] << node["amt"]
        elif op == "addr":
            env[dst] = _resolve_addr(env, node)
        elif op == "load":
            base, coef = env[node["ptr"]]
            stride = "stride_pix1" if base == "pix1" else "stride_pix2"
            lines.append("    svuint16_t %s = svld1ub_u16(pg,"
                         " (const uint8_t*)%s + (size_t)(%d) * %s);"
                         % (cid(dst), base, coef, stride))
        elif op == "zext":
            lines.append("    svuint16_t %s = %s;"
                         % (cid(dst), cid(node["src"])))
        elif op in ("add", "sub"):
            if "<" not in node["type"]:
                opc = "+" if op == "add" else "-"
                srcv = env.get(node["src"][0])
                if pack == 2 and isinstance(srcv, tuple) and \
                        srcv[0] == "pair":
                    if raw:
                        # Raw helper: the reduction tail must be exactly
                        # `+1` then `>>1` (per-tile rounding), which we skip
                        # to return the half-R8 sum. Assert the shape so a
                        # future MachineIR tail change cannot silently mis-
                        # compile.
                        if op != "add" or node.get("const") != 1:
                            raise ValueError(
                                "raw mode: unexpected pair scalar node %r"
                                % (node,))
                        env[dst] = srcv
                        continue
                    _, a, b = srcv
                    na, nb = pair_cid(dst)
                    lines.append("    uint64_t %s = %s %s %d;"
                                 % (na, a, opc, node.get("const", 0)))
                    lines.append("    uint64_t %s = %s %s %d;"
                                 % (nb, b, opc, node.get("const", 0)))
                    env[dst] = ("pair", na, nb)
                else:
                    lines.append("    uint64_t %s = %s %s %d;"
                                 % (cid(dst), cid(node["src"][0]), opc,
                                    node.get("const", 0)))
            else:
                fn = "svadd_u16_x" if op == "add" else "svsub_u16_x"
                if len(node["src"]) == 2:
                    lines.append("    svuint16_t %s = %s(pg, %s, %s);"
                                 % (cid(dst), fn, cid(node["src"][0]),
                                    cid(node["src"][1])))
                else:
                    lines.append("    svuint16_t %s = %s(pg, %s,"
                                 " svdup_u16(%d));"
                                 % (cid(dst), fn, cid(node["src"][0]),
                                    node.get("const", 0)))
        elif op == "shuffle":
            trn = _sve_trn_spec(node)
            if trn is not None:
                intrinsic, elem = trn
                a, b = cid(node["src"][0]), cid(node["src"][1])
                if elem == "u16":
                    lines.append("    svuint16_t %s = %s(%s, %s);"
                                 % (cid(dst), intrinsic, a, b))
                else:
                    lines.append("    svuint16_t %s = svreinterpret_u16_%s("
                                 "%s(svreinterpret_%s_u16(%s),"
                                 " svreinterpret_%s_u16(%s)));"
                                 % (cid(dst), elem, intrinsic, elem, a,
                                    elem, b))
                continue
            flat = _sve_flat_indices(node)
            n = idx_counter[0]
            idx_counter[0] += 1
            lo = []
            bmask = []
            for x in flat:
                if x < 8:
                    lo.append(x)
                    bmask.append(0)
                else:
                    lo.append(x - 8)
                    bmask.append(1)
            if pack == 2:
                lo = lo + [x + 8 for x in lo]
                bmask = bmask + bmask
            arr_lo = ", ".join(str(x) for x in lo)
            arr_b = ", ".join(str(x) for x in bmask)
            lines.append("    static const uint16_t idx%d_lo[16] = { %s };"
                         % (n, arr_lo))
            lines.append("    static const uint16_t idx%d_b[16] = { %s };"
                         % (n, arr_b))
            lines.append("    svuint16_t %s = svtbl2_u16("
                         "svcreate2_u16(%s, %s),"
                         " svadd_u16_x(pg,"
                         " svld1_u16(pg, idx%d_lo),"
                         " svmul_u16_x(pg,"
                         " svld1_u16(pg, idx%d_b),"
                         " svdup_u16((uint16_t)(svcntw() * 2)))));"
                         % (cid(dst), cid(node["src"][0]),
                            cid(node["src"][1]), n, n))
        elif op == "bitcast":
            lines.append("    svuint16_t %s = %s;"
                         % (cid(dst), cid(node["src"])))
        elif op == "intrinsic":
            name = node["intrinsic"]
            if name == "abs":
                lines.append("    svuint16_t %s = svreinterpret_u16_s16("
                             "svabs_s16_x(pg, svreinterpret_s16_u16(%s)));"
                             % (cid(dst), cid(node["src"][0])))
            elif name == "sabd":
                lines.append("    svuint16_t %s = svreinterpret_u16_s16("
                             "svabd_s16_x(pg, svreinterpret_s16_u16(%s),"
                             " svreinterpret_s16_u16(%s)));"
                             % (cid(dst), cid(node["src"][0]),
                                cid(node["src"][1])))
            elif name == "umax":
                lines.append("    svuint16_t %s = svmax_u16_x(pg, %s, %s);"
                             % (cid(dst), cid(node["src"][0]),
                                cid(node["src"][1])))
            elif name == "uaddlv":
                if pack == 2:
                    a, b = pair_cid(dst)
                    lines.append("    uint64_t %s = svaddv_u16("
                                 "svwhilelt_b16(0, 8), %s);"
                                 % (a, cid(node["src"][0])))
                    lines.append("    uint64_t %s = svaddv_u16("
                                 "pg, %s);"
                                 % (b, cid(node["src"][0])))
                    # svwhilelt only yields prefix predicates; the upper
                    # half-sum is the full sum minus the lower half-sum.
                    lines.append("    %s -= %s;" % (b, a))
                    env[dst] = ("pair", a, b)
                    if raw:
                        pass
                else:
                    lines.append("    uint64_t %s = svaddv_u16(pg, %s);"
                                 % (cid(dst), cid(node["src"][0])))
            else:
                raise ValueError("SVE codegen unknown intrinsic %r" % name)
        elif op == "lshr":
            if pack == 2 and isinstance(env.get(node["src"][0]), tuple) \
                    and env[node["src"][0]][0] == "pair":
                if raw:
                    if node.get("amt") != 1:
                        raise ValueError(
                            "raw mode: unexpected pair lshr amt %r"
                            % (node.get("amt"),))
                    env[dst] = env[node["src"][0]]
                    continue
                _, a, b = env[node["src"][0]]
                na, nb = pair_cid(dst)
                lines.append("    uint64_t %s = %s >> %d;" % (na, a, node["amt"]))
                lines.append("    uint64_t %s = %s >> %d;" % (nb, b, node["amt"]))
                env[dst] = ("pair", na, nb)
            else:
                lines.append("    uint64_t %s = %s >> %d;"
                             % (cid(dst), cid(node["src"][0]), node["amt"]))
        elif op == "ret":
            if pack == 2 and isinstance(env.get(node["operand"]), tuple) \
                    and env[node["operand"]][0] == "pair":
                _, a, b = env[node["operand"]]
                lines.append("    return (int)(%s + %s);" % (a, b))
            else:
                lines.append("    return (int)%s;" % cid(node["operand"]))
        else:
            raise ValueError("SVE codegen unsupported op %r" % op)
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_interp8_c_intrinsics(
        machine_ir, func_name="dynopt_interp8_8x8_neon_roundtrip"):
    """NEON roundtrip for the fully-unrolled interp8 8x8 dotprod seed.

    Faithfully re-emits the MachineIR dataflow: 4x16-byte window loads,
    b-128 bias, three tbl1 windows (dotprod_permute_tbl masks), four
    vdotq_s32 with splat(8192) / chained accumulators, concat-narrow,
    vqrshrun_n_s16, row stores. Coefficients come from
    x265::g_lumaFilter[phase] (external symbol), masks are embedded from
    the source's dotprod_permute_tbl.
    """
    lines = [
        "// generated by optimizer/ir/codegen.py "
        "emit_interp8_c_intrinsics",
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "namespace x265 {",
        "extern const int16_t g_lumaFilter[4][8];",
        "extern const int16_t g_chromaFilter[8][4];",
        "}",
        "",
        "static const uint8_t dotprod_permute_tbl[48] = {",
        "    0, 1,  2,  3, 1,  2,  3,  4,  2,  3,  4,  5,  3,  4,  5, 6,",
        "    4, 5,  6,  7, 5,  6,  7,  8,  6,  7,  8,  9,  7,  8,  9, 10,",
        "    8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14",
        "};",
        "",
        "static const uint8_t chroma_abs[8][4] = {",
        "    { 0, 64,  0,  0 }, { 2, 58, 10,  2 },",
        "    { 4, 54, 16,  2 }, { 6, 46, 28,  4 },",
        "    { 4, 36, 36,  4 }, { 4, 28, 46,  6 },",
        "    { 2, 16, 54,  4 }, { 2, 10, 58,  2 }",
        "};",
        "",
        'extern "C" void %s(const uint8_t* src, intptr_t srcStride,'
        " uint8_t* dst, intptr_t dstStride, int coeffIdx)" % func_name,
        "{",
    ]
    env = {"0": "src", "1": "srcStride", "2": "dst", "3": "dstStride",
           "4": "coeffIdx"}
    types = {}
    cname = {}

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def var(name, ctype, expr):
        types[name] = ctype
        lines.append("    %s %s = %s;" % (ctype, cid(name), expr))

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "addr":
            rhs = node["rhs"]
            m = re.match(
                r"getelementptr inbounds (?:nuw )?"
                r"(?:i8|\[8 x i16\]|\[4 x i16\]|\[4 x i8\]), "
                r"ptr (@_ZN4x26512g_lumaFilterE|@_ZN4x26514g_chromaFilterE|"
                r"@_ZN12_GLOBAL__N_118g_chromaFilterAbs8E|%[\w.]+), "
                r"i64 ([%@\-\d]+)", rhs)
            if not m:
                raise ValueError("unhandled addr %r" % rhs)
            ptr = m.group(1)
            if ptr == "@_ZN4x26512g_lumaFilterE":
                env[dst] = "filter"
            elif ptr == "@_ZN4x26514g_chromaFilterE":
                env[dst] = "chroma"
            elif ptr == "@_ZN12_GLOBAL__N_118g_chromaFilterAbs8E":
                env[dst] = "chroma_abs"
            else:
                off = m.group(2)
                offs = env[off[1:]] if off.startswith("%") else off
                env[dst] = "(%s + %s)" % (env[ptr[1:]], offs)
        elif op == "load":
            ptr = env[node["ptr"]]
            if ptr == "filter":
                var(dst, "int16x8_t",
                    "vld1q_s16((const int16_t*)x265::g_lumaFilter"
                    " + ((int64_t)coeffIdx)*8)")
            elif ptr == "chroma":
                var(dst, "int16x4_t",
                    "vld1_s16((const int16_t*)x265::g_chromaFilter"
                    " + ((int64_t)coeffIdx)*4)")
            elif node["type"] == "<16 x i8>":
                var(dst, "uint8x16_t",
                    "vld1q_u8((const uint8_t*)%s)" % ptr)
            elif node["type"] == "<8 x i8>":
                var(dst, "uint8x8_t",
                    "vld1_u8((const uint8_t*)%s)" % ptr)
            else:
                raise ValueError("unhandled load type %r" % node["type"])
        elif op == "extractvalue":
            idx = node["index"]
            st = types.get(node["src"][0], "")
            et = "uint8x8_t" if st == "uint8x8x4_t" else "uint8x16_t"
            var(dst, et, "%s.val[%d]" % (cid(node["src"][0]), idx))
        elif op == "sext":
            env[dst] = "((int64_t)(int32_t)%s)" % env[node["src"]]
        elif op == "zext":
            src = node["src"]
            if node["type"] == "<8 x i16>":
                var(dst, "uint16x8_t", "vmovl_u8(%s)" % cid(src))
            else:
                raise ValueError("unhandled zext type %r" % node["type"])
        elif op == "shl":
            if str(node.get("type", "")).startswith("<"):
                var(dst, "uint16x8_t", "vshlq_n_u16(%s, %d)"
                    % (cid(node["src"][0]), node["amt"]))
            else:
                env[dst] = "((%s) << %d)" % (env[node["src"][0]],
                                             node["amt"])
        elif op == "mul":
            if str(node.get("type", "")).startswith("<"):
                src = node["src"][0]
                c = node.get("const")
                if c is not None:
                    var(dst, "uint16x8_t", "vmulq_n_u16(%s, %d)"
                        % (cid(src), c))
                elif len(node["src"]) == 2:
                    var(dst, "uint16x8_t", "vmulq_u16(%s, %s)"
                        % (cid(node["src"][0]), cid(node["src"][1])))
                else:
                    raise ValueError("unhandled vector mul %r" % node)
            else:
                env[dst] = "((%s) * %d)" % (env[node["src"][0]],
                                            node.get("const", 1))
        elif op in ("add", "sub"):
            if node["type"] == "<8 x i16>":
                fn = "vaddq_u16" if op == "add" else "vsubq_u16"
                var(dst, "uint16x8_t", "%s(%s, %s)"
                    % (fn, cid(node["src"][0]), cid(node["src"][1])))
            elif not str(node.get("type") or "").startswith("<"):
                if len(node["src"]) == 2:
                    fn = "+" if op == "add" else "-"
                    env[dst] = "((%s) %s (%s))" % (
                        env[node["src"][0]], fn, env[node["src"][1]])
                elif node.get("const") is not None:
                    fn = "+" if op == "add" else "-"
                    env[dst] = "((%s) %s %d)" % (
                        env[node["src"][0]], fn, node["const"])
                elif op == "sub" and len(node["src"]) == 1:
                    env[dst] = "(-(%s))" % env[node["src"][0]]
                else:
                    raise ValueError("unhandled scalar %s %r"
                                     % (op, node))
            else:
                raise ValueError("unhandled %s type %r"
                                 % (op, node["type"]))
        elif op == "trunc":
            src = node["src"]
            if node["type"] == "<8 x i8>":
                var(dst, "int8x8_t", "vmovn_s16(%s)" % cid(src))
            elif node["type"] == "<8 x i16>":
                pair = types.get(src)
                if not (isinstance(pair, tuple) and len(pair) == 2):
                    raise ValueError("trunc<8xi16> source not a pair: %r"
                                     % src)
                a, b = pair
                var(dst, "int16x8_t",
                    "vcombine_s16(vmovn_s32(%s), vmovn_s32(%s))"
                    % (cid(a), cid(b)))
            else:
                raise ValueError("unhandled trunc type %r" % node["type"])
        elif op == "xor":
            if node["type"] == "<16 x i8>":
                var(dst, "uint8x16_t",
                    "veorq_u8(%s, vdupq_n_u8(0x80))" % cid(node["src"][0]))
            elif node["type"] == "<8 x i8>":
                var(dst, "uint8x8_t",
                    "veor_u8(%s, vdup_n_u8(0x80))" % cid(node["src"][0]))
            else:
                raise ValueError("unhandled xor type %r" % node["type"])
        elif op == "shuffle":
            vtype = node["type"]
            mask = node["mask"]
            if vtype == "<4 x i32>" and len(set(mask)) == 1:
                src = node["src"][0]
                var(dst, "int32x4_t",
                    "vdupq_n_s32(vget_lane_s32(%s, %d))"
                    % (cid(src), mask[0]))
            elif vtype == "<16 x i8>" and len(node["src"]) == 1 and \
                    mask == list(range(16)):
                # 8-byte load extended to 16 bytes; high lanes are undef in
                # the IR but never selected by the tbl masks -> zero fill.
                var(dst, "uint8x16_t",
                    "vcombine_u8(%s, vdup_n_u8(0))" % cid(node["src"][0]))
            elif vtype == "<8 x i8>" and len(node["src"]) == 1:
                st = types.get(node["src"][0], "")
                if st == "uint8x8_t" and mask == list(range(8)):
                    var(dst, "uint8x8_t", cid(node["src"][0]))  # identity
                elif mask == list(range(8)):
                    var(dst, "uint8x8_t", "vget_low_u8(%s)"
                        % cid(node["src"][0]))
                elif mask == list(range(8, 16)):
                    var(dst, "uint8x8_t", "vget_high_u8(%s)"
                        % cid(node["src"][0]))
                else:
                    raise ValueError("unhandled <8 x i8> shuffle %r" % mask)
            elif vtype == "<16 x i8>" and len(node["src"]) == 2 and \
                    mask == list(range(16)):
                # concat two 8-byte halves into the 16-byte row store
                var(dst, "uint8x16_t",
                    "vcombine_u8(%s, %s)" % (cid(node["src"][0]),
                                             cid(node["src"][1])))
            elif vtype == "<8 x i16>" and len(node["src"]) == 1 and \
                    mask == list(range(8)):
                # 4-lane coeff row extended to 8 lanes (undef high, unused)
                var(dst, "int16x8_t",
                    "vcombine_s16(%s, vdup_n_s16(0))" % cid(node["src"][0]))
            elif vtype == "<8 x i32>" and mask == list(range(8)):
                types[dst] = (node["src"][0], node["src"][1])  # pair
            else:
                raise ValueError("unhandled shuffle %r %r" % (vtype, mask))
        elif op == "bitcast":
            src = node["src"]
            if node.get("src_type") == "<8 x i8>" and \
                    node["type"] == "<2 x i32>":
                var(dst, "int32x2_t", "vreinterpret_s32_s8(%s)" % cid(src))
            elif node.get("src_type") == "<4 x i32>" and \
                    node["type"] == "<16 x i8>":
                var(dst, "uint8x16_t",
                    "vreinterpretq_u8_s32(%s)" % cid(src))
            else:
                raise ValueError("unhandled bitcast %r -> %r"
                                 % (node.get("src_type"), node["type"]))
        elif op == "intrinsic":
            name = node["intrinsic"]
            if name == "ld1x3":
                var(dst, "uint8x16x3_t",
                    "vld1q_u8_x3(dotprod_permute_tbl)")
            elif name == "ld1x2":
                var(dst, "uint8x16x2_t",
                    "vld1q_u8_x2(dotprod_permute_tbl)")
            elif name == "ld4r":
                var(dst, "uint8x8x4_t",
                    "vld4_dup_u8((const uint8_t*)chroma_abs"
                    " + ((int64_t)coeffIdx)*4)")
            elif name == "tbl1":
                a = node["args"][0]["ref"]
                b = node["args"][1]["ref"]
                var(dst, "uint8x16_t",
                    "vqtbl1q_u8(%s, %s)" % (cid(a), cid(b)))
            elif name == "umull":
                a = node["args"][0]["ref"]
                b = node["args"][1]
                if "imm" in b:
                    var(dst, "uint16x8_t", "vmull_u8(%s, vdup_n_u8(%d))"
                        % (cid(a), b["imm"]))
                else:
                    var(dst, "uint16x8_t", "vmull_u8(%s, %s)"
                        % (cid(a), cid(b["ref"])))
            elif name == "sdot":
                a0 = node["args"][0]
                a = node["args"][1]["ref"]
                b = node["args"][2]["ref"]
                acc = ("vdupq_n_s32(%d)" % a0["imm"]
                       if "imm" in a0 else cid(a0["ref"]))
                var(dst, "int32x4_t",
                    "vdotq_s32(%s, vreinterpretq_s8_u8(%s),"
                    " vreinterpretq_s8_u8(%s))" % (acc, cid(a), cid(b)))
            elif name == "sqrshrun":
                a = node["args"][0]["ref"]
                imm = node["args"][1]["imm"]
                src_t = types.get(a, "")
                aexpr = ("vreinterpretq_s16_u16(%s)" % cid(a)
                         if src_t == "uint16x8_t" else cid(a))
                var(dst, "uint8x8_t", "vqrshrun_n_s16(%s, %d)"
                    % (aexpr, imm))
            else:
                raise ValueError("codegen unknown intrinsic %r" % name)
        elif op == "store":
            t = types.get(node["src"], "")
            fn = "vst1q_u8" if t == "uint8x16_t" else (
                "vst1_u8" if t == "uint8x8_t" else "vst1_u8")
            lines.append("    %s((uint8_t*)%s, %s);"
                         % (fn, env[node["ptr"]], cid(node["src"])))
        else:
            raise ValueError("codegen unsupported op %r" % op)
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_structured_neon_intrinsics(
        machine_ir, func_name="dynopt_idct16_neon_roundtrip"):
    """Codegen for the structured CFG MachineIR (docs/42 G2b).

    Linear-size emission: every basic block is emitted exactly once as a C
    label; terminators become `if/else + goto`; SSA values are predeclared
    at function scope; phi values are assigned on the incoming edge. This
    avoids the exponential tail-duplication blowup of the first version
    (16 GB RSS at 40s, docs/42 §10).
    """
    blocks = {n["label"]: n for n in machine_ir.nodes
              if n.get("op") == "block"}
    entry = machine_ir.nodes[0]["label"]
    lines = [
        "// generated by optimizer/ir/codegen.py "
        "emit_structured_neon_intrinsics (linear goto emission)",
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        'extern "C" void %s(const int16_t* src, int16_t* dst,'
        " intptr_t dstStride)" % func_name,
        "{",
    ]
    counter = [0]
    cname = {}

    def cid(dst):
        if dst not in cname:
            cname[dst] = "v%d" % counter[0]
            counter[0] += 1
        return cname[dst]

    def type_of(t):
        return {
            "<4 x i16>": "int16x4_t",
            "<8 x i16>": "int16x8_t",
            "<4 x i32>": "int32x4_t",
            "<2 x i64>": "uint64x2_t",
            "<2 x i32>": "int32x2_t",
            "i64": "uint64_t",
            "i1": "bool",
        }.get(t) or ("int32x4_t" if str(t).startswith("<4") else
                    "int16x8_t")

    def node_c_type(n):
        op = n["op"]
        if op == "intrinsic":
            return "int32x4_t" if n["intrinsic"] == "smull" else "int16x4_t"
        if op in ("alias", "load"):
            return type_of(n.get("type"))
        if op in ("add", "sub", "shl", "sext", "mul"):
            if str(n.get("type", "")).startswith("<"):
                return type_of(n["type"])
            return None  # scalar expr, no variable
        if op == "shuffle":
            return type_of(n["type"])
        if op == "bitcast":
            return "uint64_t" if n["type"] == "i64" else "uint64x2_t"
        if op == "extractelement":
            return "uint64_t"
        if op == "icmp":
            return "bool"
        return None

    # predeclare every SSA variable (dsts of body nodes and phis)
    seen = set()
    for b in blocks.values():
        for dst, p in b["phis"].items():
            if dst in seen:
                continue
            seen.add(dst)
            lines.append("    %s %s;" % (type_of(p["type"]), cid(dst)))
        for n in b["body"]:
            dst = n.get("dst")
            if not dst or dst in seen:
                continue
            ct = node_c_type(n)
            if ct is not None:
                seen.add(dst)
                lines.append("    %s %s;" % (ct, cid(dst)))
    lines.append("")

    def zero_expr(t):
        if t == "<4 x i32>":
            return "vdupq_n_s32(0)"
        if t == "<8 x i16>":
            return "vdupq_n_s16(0)"
        if t == "<4 x i16>":
            return "vdup_n_s16(0)"
        return "0"

    def resolve_value(v, typ):
        if str(v).startswith("%"):
            return cid(v[1:])
        if v in ("0", "zeroinitializer"):
            return zero_expr(typ)
        return v

    def assign_phis(pred, succ_label, indent):
        for dst, p in blocks[succ_label]["phis"].items():
            val = p["incoming"].get(pred)
            if val is None:
                val = next(iter(p["incoming"].values()))
            lines.append("%s    %s = %s;" % (indent, cid(dst),
                                             resolve_value(val, p["type"])))

    def emit_body(nodes, indent):
        for n in nodes:
            op = n["op"]
            dst = n.get("dst")
            if op == "addr":
                m = re.match(
                    r"getelementptr inbounds (?:nuw )?"
                    r"((?:i8|i16|i32|i64|\[\d+ x i\d+\])), "
                    r"ptr (%[\w.]+), i64 ([%@\-\d]+)", n["rhs"])
                if not m:
                    raise ValueError("unhandled addr %r" % n["rhs"])
                et = m.group(1)
                mult = {"i8": 1, "i16": 2, "i32": 4, "i64": 8}.get(
                    et) or (int(re.search(r"\[(\d+) x", et).group(1)) *
                            int(re.search(r"x i(\d+)", et).group(1)) // 8)
                off = m.group(2)
                offs = env[off[1:]] if off.startswith("%") else off
                if off.startswith("%"):
                    env[dst] = "(%s + (%s) * %d)" % (
                        env[m.group(2)[1:]], offs, mult)
                else:
                    env[dst] = "(%s + %d)" % (env[m.group(2)[1:]],
                                              int(offs) * mult)
            elif op == "load":
                if n["type"] == "<4 x i16>":
                    expr = "vld1_s16((const int16_t*)%s)" % env[n["ptr"]]
                elif n["type"] == "<16 x i8>":
                    expr = "vld1q_u8((const uint8_t*)%s)" % env[n["ptr"]]
                elif n["type"] == "<8 x i16>":
                    expr = "vld1q_s16((const int16_t*)%s)" % env[n["ptr"]]
                else:
                    raise ValueError("unhandled load %r" % n["type"])
                env[dst] = cid(dst)
                lines.append("%s    %s = %s;" % (indent, cid(dst), expr))
            elif op == "store":
                tm = re.match(r"(<\d+\s+x\s+i\d+>)", n["type"] or "")
                t = tm.group(1) if tm else "<8 x i16>"
                if t == "<8 x i16>":
                    lines.append("%s    vst1q_s16((int16_t*)%s, %s);"
                                 % (indent, env[n["ptr"]], cid(n["src"])))
                elif t == "<8 x i8>":
                    lines.append("%s    vst1_u8((uint8_t*)%s, %s);"
                                 % (indent, env[n["ptr"]], cid(n["src"])))
                else:
                    raise ValueError("unhandled store %r" % t)
            elif op == "sext":
                env[dst] = cid(dst)
                lines.append("%s    %s = vmovl_s16(%s);"
                             % (indent, cid(dst), cid(n["src"])))
            elif op == "shl":
                if str(n.get("type", "")).startswith("<"):
                    env[dst] = cid(dst)
                    lines.append("%s    %s = vshlq_n_s32(%s, %d);"
                                 % (indent, cid(dst), cid(n["src"][0]),
                                    n["amt"]))
                else:
                    env[dst] = "((%s) << %d)" % (env[n["src"][0]], n["amt"])
            elif op == "mul":
                env[dst] = "((%s) * %d)" % (env[n["src"][0]],
                                            n.get("const", 1))
            elif op in ("add", "sub"):
                fn = "vaddq_s32" if op == "add" else "vsubq_s32"
                env[dst] = cid(dst)
                lines.append("%s    %s = %s(%s, %s);"
                             % (indent, cid(dst), fn, cid(n["src"][0]),
                                cid(n["src"][1])))
            elif op == "shuffle":
                vtype = n["type"]
                mask = n["mask"]
                env[dst] = cid(dst)
                if vtype == "<8 x i16>" and mask == [0, 8, 1, 9, 2, 10,
                                                     3, 11]:
                    lines.append("%s    %s = vzip1q_s16(%s, %s);"
                                 % (indent, cid(dst), cid(n["src"][0]),
                                    cid(n["src"][1])))
                elif vtype == "<8 x i16>" and mask == [4, 12, 5, 13, 6,
                                                       14, 7, 15]:
                    lines.append("%s    %s = vzip2q_s16(%s, %s);"
                                 % (indent, cid(dst), cid(n["src"][0]),
                                    cid(n["src"][1])))
                elif vtype == "<8 x i16>" and mask == [0, 4, 1, 5, 2, 6,
                                                       3, 7]:
                    lines.append("%s    %s = vtrn1q_s16(%s, %s);"
                                 % (indent, cid(dst), cid(n["src"][0]),
                                    cid(n["src"][1])))
                elif vtype == "<4 x i16>" and mask == [0, 1, 2, 3]:
                    lines.append("%s    %s = vget_low_s16(%s);"
                                 % (indent, cid(dst), cid(n["src"][0])))
                elif vtype == "<4 x i16>" and mask == [4, 5, 6, 7]:
                    lines.append("%s    %s = vget_high_s16(%s);"
                                 % (indent, cid(dst), cid(n["src"][0])))
                else:
                    raise ValueError("unhandled shuffle %r %r"
                                     % (vtype, mask))
            elif op == "bitcast":
                env[dst] = cid(dst)
                if n.get("src_type") == "<4 x i16>" and n["type"] == "i64":
                    lines.append("%s    %s = vget_lane_u64("
                                 "vreinterpret_u64_s16(%s), 0);"
                                 % (indent, cid(dst), cid(n["src"])))
                elif n.get("src_type") == "<8 x i16>" and \
                        n["type"] == "<2 x i64>":
                    lines.append("%s    %s = vreinterpretq_u64_s16(%s);"
                                 % (indent, cid(dst), cid(n["src"])))
                else:
                    raise ValueError("unhandled bitcast %r -> %r"
                                     % (n.get("src_type"), n["type"]))
            elif op == "extractelement":
                env[dst] = cid(dst)
                lines.append("%s    %s = vgetq_lane_u64(%s, %d);"
                             % (indent, cid(dst), cid(n["src"][0]),
                                n["index"]))
            elif op == "icmp":
                env[dst] = cid(dst)
                a = cid(n["src"][0])
                b = str(n.get("const", 0)) if len(n["src"]) == 1 \
                    else cid(n["src"][1])
                opmap = {"eq": "==", "ne": "!="}
                lines.append("%s    %s = (%s %s %s);"
                             % (indent, cid(dst), a,
                                opmap.get(n["pred"], "=="), b))
            elif op == "intrinsic":
                name = n["intrinsic"]
                env[dst] = cid(dst)
                if name == "smull":
                    a = n["args"][0]["ref"]
                    b = n["args"][1]
                    if "imm" in b:
                        lines.append("%s    %s = vmull_s16(%s,"
                                     " vdup_n_s16(%d));"
                                     % (indent, cid(dst), cid(a), b["imm"]))
                    else:
                        lines.append("%s    %s = vmull_s16(%s, %s);"
                                     % (indent, cid(dst), cid(a),
                                        cid(b["ref"])))
                elif name == "sqrshrn":
                    a = n["args"][0]["ref"]
                    imm = n["args"][1]["imm"]
                    lines.append("%s    %s = vqrshrn_n_s32(%s, %d);"
                                 % (indent, cid(dst), cid(a), imm))
                else:
                    raise ValueError("unhandled intrinsic %r" % name)
            elif op == "alias":
                env[dst] = cid(dst)
                lines.append("%s    %s = %s;" % (
                    indent, cid(dst),
                    resolve_value(n["src"], n.get("type"))))
            else:
                raise ValueError("structured codegen unsupported op %r" % op)

    def emit_block(label, indent):
        if label in emitted:
            return
        emitted.add(label)
        lines.append("%sb_%s:" % (indent, label))
        emit_body(blocks[label]["body"], indent)
        term = blocks[label]["term"]
        if term is None or term["kind"] == "ret":
            lines.append("%s    return;" % indent)
            return
        if term["kind"] == "jump":
            assign_phis(label, term["target"], indent)
            lines.append("%s    goto b_%s;" % (indent, term["target"]))
            return
        cond = cid(term["cond"])
        lines.append("%s    if (%s) {" % (indent, cond))
        assign_phis(label, term["then"], indent + "    ")
        lines.append("%s        goto b_%s;" % (indent, term["then"]))
        lines.append("%s    } else {" % indent)
        assign_phis(label, term["else"], indent + "    ")
        lines.append("%s        goto b_%s;" % (indent, term["else"]))
        lines.append("%s    }" % indent)

    env = {"0": "src", "1": "dst", "2": "dstStride"}
    emitted = set()
    emit_block(entry, "    ")
    for b in blocks:
        if b not in emitted:
            emit_block(b, "    ")
    lines.append("}")
    if len(lines) > 200000:
        raise ValueError(
            "structured codegen runaway: %d lines (limit 200000); "
            "aborting instead of exhausting memory" % len(lines))
    return "\n".join(lines) + "\n"

def emit_sve_16x16_wrapper(
        func_name="dynopt_sa8d_16x16_neon_sve2",
        raw_name="dynopt_sa8d_8x8x2raw_neon_sve2"):
    """Two-wave 16x16 wrapper over the raw half-R8 x2 helper.

    top    = raw(a, sa, b, sb)                  # (R8_00 + R8_01) / 2
    bottom = raw(a + 8*sa, sa, b + 8*sb, sb)    # (R8_10 + R8_11) / 2
    return (top + bottom + 1) >> 1 == (sum R8 + 2) >> 2
    """
    return (
        "#include <cstdint>\n"
        "\n"
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t stride_pix1,"
        " const uint8_t* pix2, intptr_t stride_pix2);\n"
        "\n"
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t stride_pix1,"
        " const uint8_t* pix2, intptr_t stride_pix2)\n"
        "{\n"
        "    uint64_t top = (uint64_t)%s(pix1, stride_pix1,"
        " pix2, stride_pix2);\n"
        "    uint64_t bottom = (uint64_t)%s(pix1 + 8 * stride_pix1,"
        " stride_pix1, pix2 + 8 * stride_pix2, stride_pix2);\n"
        "    return (int)((top + bottom + 1) >> 1);\n"
        "}\n"
        % (raw_name, func_name, raw_name, raw_name))


INTERP8_LUMA_FILTER = (
    "    {  0, 0,   0, 64,  0,   0, 0,  0 },",
    "    { -1, 4, -10, 58, 17,  -5, 1,  0 },",
    "    { -1, 4, -11, 40, 40, -11, 4, -1 },",
    "    {  0, 1,  -5, 17, 58, -10, 4, -1 },",
)

INTERP8_PERMUTE_TBL = (
    "    0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6,",
    "    4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10,",
    "    8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14,",
)


def _interp8_ptr(env, node):
    """Resolve an i8 getelementptr to (base, off) over the interp8 args."""
    rhs = node["rhs"]
    m = re.match(
        r"getelementptr\s+inbounds\s+(?:nuw\s+)?i8,\s*ptr\s+"
        r"%([A-Za-z0-9._]+),\s*(?:i64\s+)?(%[A-Za-z0-9._]+|-?\d+)", rhs)
    if m:
        base, off = m.group(1), m.group(2)
        if off.startswith("%"):
            off = env[off[1:]]
        else:
            off = int(off)
        bv = env[base]
        if isinstance(bv, tuple) and bv[0] in ("src", "dst"):
            cur = bv[1]
            if isinstance(off, int) and isinstance(cur, int):
                cur = cur + off
            elif isinstance(off, int) and off == 0:
                pass
            elif isinstance(cur, int) and cur == 0:
                cur = off
            else:
                cur = "(%s + %s)" % (cur, off)
            return (bv[0], cur)
        raise ValueError("unsupported interp8 addr base %r" % rhs)
    g = re.match(
        r"getelementptr\s+inbounds\s+\[8 x i16\],\s*ptr\s+"
        r"@_ZN4x26512g_lumaFilterE,\s*i64\s+(%[A-Za-z0-9._]+|\d+)", rhs)
    if g:
        off = g.group(1)
        if off.startswith("%"):
            off = env[off[1:]]
        else:
            off = int(off)
        return ("g_luma", off)
    raise ValueError("unsupported interp8 addr form: %r" % rhs)


def emit_interp8_intrinsics(machine_ir,
                            func_name="dynopt_interp8_hpp_dotprod"):
    """NEON roundtrip for the interp8_horiz_pp_dotprod<8,8> seed.

    Covers the dotprod-family op set: ld1x3 (vld1q_u8_x3) + extractvalue,
    tbl1 (vqtbl1q), sdot (vdotq_s32 with a splat or register accumulator),
    sqrshrun (vqrshrun), i16/i32 narrowing trunc, u8 sign-offset xor,
    and the <2 x i32> lane-broadcast / <4 x i32> concat shuffles.
    """
    lines = [
        "// generated by optimizer/ir/codegen.py emit_interp8_intrinsics",
        "#include <arm_neon.h>",
        "#include <cstddef>",
        "#include <stdint.h>",
        "",
        "static const int16_t g_luma_filter[4][8] =",
        "{",
    ]
    lines.extend(INTERP8_LUMA_FILTER)
    lines.extend([
        "};",
        "",
        "static const uint8_t dotprod_permute_tbl[48] =",
        "{",
    ])
    lines.extend(INTERP8_PERMUTE_TBL)
    lines.extend([
        "};",
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        " uint8_t* dst, intptr_t dstStride, int coeffIdx)" % func_name,
        "{",
    ])
    env = {"0": ("src", 0), "1": "srcStride", "2": ("dst", 0),
           "3": "dstStride", "4": "coeffIdx"}
    cname = {}
    types = {}
    tuple_idx = [0]

    def cid(name):
        if name not in cname:
            cname[name] = "v%d" % len(cname)
        return cname[name]

    def val(dst):
        return env.get(dst)

    for node in machine_ir.nodes:
        op = node["op"]
        dst = node.get("dst")
        if op == "addr":
            env[dst] = _interp8_ptr(env, node)
        elif op == "sext":
            env[dst] = "((int64_t)%s)" % env[node["src"][0]]
        elif op == "shl":
            a = env[node["src"][0]]
            env[dst] = a if isinstance(a, int) \
                else "((%s) << %d)" % (a, node["amt"])
        elif op == "mul":
            a = env[node["src"][0]]
            if node.get("const") is not None:
                env[dst] = a * node["const"] if isinstance(a, int) \
                    else "((%s) * %d)" % (a, node["const"])
            else:
                env[dst] = "((%s) * (%s))" % (a, env[node["src"][1]])
        elif op == "load":
            if node["type"] == "<8 x i16>":
                # filter coefficients: g_lumaFilter[coeffIdx], 8 x i16
                env[dst] = ("filter", None)
                lines.append("    int16x8_t %s = vld1q_s16("
                             "&g_luma_filter[0][0] + coeffIdx * 8);"
                             % cid(dst))
            elif node["type"] == "<16 x i8>":
                base, off = env[node["ptr"]]
                off_s = str(off) if isinstance(off, int) else off
                ptr = ("src + (%s)" % off_s) if base == "src" \
                    else ("dst + (%s)" % off_s)
                lines.append("    uint8x16_t %s = vld1q_u8((const uint8_t*)"
                             "(%s));" % (cid(dst), ptr))
            else:
                raise ValueError("interp8 unknown load type %r"
                                 % node["type"])
        elif op == "trunc":
            src = node["src"]
            if node["type"] == "<8 x i8>":
                lines.append("    int8x8_t %s = vmovn_s16(%s);"
                             % (cid(dst), cid(src)))
            elif node["type"] == "<8 x i16>":
                # The source is the <8 x i32> concat shuffle: narrow the two
                # 4-lane halves and combine, matching upstream
                # vcombine_s16(vmovn_s32(lo), vmovn_s32(hi)).
                pair = env.get(src)
                lo, hi = pair[1], pair[2]
                lines.append("    int16x8_t %s = vcombine_s16("
                             "vmovn_s32(%s), vmovn_s32(%s));"
                             % (cid(dst), cid(lo), cid(hi)))
            else:
                raise ValueError("interp8 unknown trunc type %r"
                                 % node["type"])
        elif op == "bitcast":
            src = node["src"]
            if node["type"] == "<2 x i32>":
                lines.append("    int32x2_t %s = vreinterpret_s32_s8(%s);"
                             % (cid(dst), cid(src)))
            elif node["type"] == "<16 x i8>":
                lines.append("    int8x16_t %s = vreinterpretq_s8_s32(%s);"
                             % (cid(dst), cid(src)))
            else:
                raise ValueError("interp8 unknown bitcast type %r"
                                 % node["type"])
        elif op == "shuffle":
            src = node["src"]
            mask = node["mask"]
            if node["type"] == "<4 x i32>" and len(src) == 1:
                lane = mask[0]
                lines.append("    int32x4_t %s = vdupq_lane_s32(%s, %d);"
                             % (cid(dst), cid(src[0]), lane))
            elif node["type"] == "<8 x i32>" and mask == \
                    [0, 1, 2, 3, 4, 5, 6, 7]:
                env[dst] = ("pair", src[0], src[1])
            else:
                raise ValueError("interp8 unknown shuffle %r %r"
                                 % (node["type"], mask))
        elif op == "xor":
            src = node["src"][0]
            lines.append("    uint8x16_t %s = veorq_u8(%s,"
                         " vdupq_n_u8(128));"
                         % (cid(dst), cid(src)))
        elif op == "extractvalue":
            tup = env[node["src"][0]]
            idx = node["index"]
            lines.append("    uint8x16_t %s = %s.val[%d];"
                         % (cid(dst), tup[1], idx))
            env[dst] = ("tupval", tup[1], idx)
        elif op == "intrinsic":
            name = node["intrinsic"]
            args = node["args"]
            if name == "ld1x3":
                t = "t%d" % tuple_idx[0]
                tuple_idx[0] += 1
                lines.append("    const uint8x16x3_t %s = "
                             "vld1q_u8_x3(&dotprod_permute_tbl[0]);" % t)
                env[dst] = ("tuple", t)
            elif name == "tbl1":
                data = cid(args[0]["ref"])
                tupval = env[args[1]["ref"]]
                lines.append("    uint8x16_t %s = vqtbl1q_u8(%s, %s.val[%d]);"
                             % (cid(dst), data, tupval[1], tupval[2]))
            elif name == "sdot":
                acc = args[0]
                a = cid(args[1]["ref"])
                b = cid(args[2]["ref"])
                if "imm" in acc:
                    acc_id = "%s_a" % cid(dst)
                    lines.append("    int32x4_t %s = vdupq_n_s32(%d);"
                                 % (acc_id, acc["imm"]))
                else:
                    acc_id = cid(acc["ref"])
                lines.append("    int32x4_t %s = vdotq_s32(%s,"
                             " vreinterpretq_s8_u8(%s), %s);"
                             % (cid(dst), acc_id, a, b))
            elif name == "sqrshrun":
                imm = next(x["imm"] for x in args if "imm" in x)
                lines.append("    uint8x8_t %s = vqrshrun_n_s16(%s, %d);"
                             % (cid(dst), cid(args[0]["ref"]), imm))
            else:
                raise ValueError("interp8 unknown intrinsic %r" % name)
        elif op == "store":
            base, off = env[node["ptr"]]
            off_s = str(off) if isinstance(off, int) else off
            ptr = ("dst + (%s)" % off_s) if base == "dst" \
                else "dst + (%s)" % off_s
            lines.append("    vst1_u8((uint8_t*)(%s), %s);"
                         % (ptr, cid(node["src"])))
        elif op == "ret":
            lines.append("    (void)0;")
        else:
            raise ValueError("interp8 codegen unsupported op %r" % op)
    lines.append("}")
    return "\n".join(lines) + "\n"
