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
        elif op in ("shl", "mul"):
            src = node["src"]
            if node["type"] and node["type"].startswith("<"):
                types[dst] = DCT8_TYPE_MAP[node["type"]]
                if op == "shl":
                    lines.append("    %s %s = vshlq_n_s32(%s, %d);"
                                 % (types[dst], cid(dst), cid(src[0]),
                                    node["amt"]))
                else:
                    cidn = const_vec_id(node["const_vec"])
                    lines.append("    %s %s = vmulq_s32(%s,"
                                 " vld1q_s32((const int32_t*)%s));"
                                 % (types[dst], cid(dst), cid(src[0]), cidn))
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
            if key not in DCT8_SHUFFLES and key not in DCT8_COMBINES:
                raise ValueError("DCT8 unknown shuffle %r" % (key,))
            types[dst] = DCT8_TYPE_MAP[node["type"]]
            if key in DCT8_SHUFFLES:
                fn = DCT8_SHUFFLES[key]
                lines.append("    %s %s = %s(%s);"
                             % (types[dst], cid(dst), fn,
                                cid(node["src"][0])))
            else:
                lo, hi = DCT8_COMBINES[key]
                lines.append("    %s %s = vcombine_s32(vget_%s_s32(%s),"
                             " vget_%s_s32(%s));"
                             % (types[dst], cid(dst), lo,
                                cid(node["src"][0]), hi,
                                cid(node["src"][1])))
        elif op == "load":
            types[dst] = "int16x4_t"
            if node.get("const_name"):
                lines.append("    %s %s = vld1_s16(&dct8_g_t8[0][0]"
                             " + %d);"
                             % (types[dst], cid(dst), node["const_off"] // 2))
            else:
                base_val = env[node["ptr"]]
                if not (isinstance(base_val, tuple) and base_val[0] == "ptr"):
                    raise ValueError("DCT8 load from non-pointer")
                base, off = base_val[1], base_val[2]
                if base == "src":
                    off_s = str(off) if isinstance(off, int) else off
                    lines.append("    %s %s = vld1_s16((const int16_t*)"
                                 "((const char*)src + (%s)));"
                                 % (types[dst], cid(dst), off_s))
                else:
                    raise ValueError("DCT8 unknown load base %r" % (base,))
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
