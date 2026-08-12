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


def emit_sve_intrinsics(machine_ir,
                        func_name="dynopt_sa8d_8x8_neon_sve2",
                        active_lanes=8,
                        pack=1):
    """SVE2 backend over the same seed MachineIR.

    pack=1: `active_lanes` active s16 lanes (default 8), single 8x8 tile.
    pack=2: 16 active s16 lanes, two horizontally adjacent 8x8 tiles packed
    into one vector (tile A in lanes 0-7, tile B in lanes 8-15). The
    per-tile reduction tail is duplicated with half-vector predicates and the
    two rounded results are summed, preserving bit-exact per-tile rounding.

    Permutes use svtbl2 with constant index vectors; the lane offset of the
    upper 8-lane half is derived from the same NEON shuffle mask, so the
    packed candidate is correct for any VL >= 256 (and VL=128 with the low
    16 lanes active).
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
                         " svadd_u16_x(svptrue_b16(),"
                         " svld1_u16(svptrue_b16(), idx%d_lo),"
                         " svmul_u16_x(svptrue_b16(),"
                         " svld1_u16(svptrue_b16(), idx%d_b),"
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
                else:
                    lines.append("    uint64_t %s = svaddv_u16(pg, %s);"
                                 % (cid(dst), cid(node["src"][0])))
            else:
                raise ValueError("SVE codegen unknown intrinsic %r" % name)
        elif op == "lshr":
            if pack == 2 and isinstance(env.get(node["src"][0]), tuple) \
                    and env[node["src"][0]][0] == "pair":
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
