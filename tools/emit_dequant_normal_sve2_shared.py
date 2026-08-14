"""SVE2 dequant_normal (256 elements, VL=256) candidate emitter (docs/44).

Search axes (structure family: widening-mul + rounding-shift +
saturating-narrow):
  compute: smull     -- ld1 s16 + smullb/t (upstream SVE2 shape)
           ld1sh-mul -- sign-extending load + svmul_s32
Both are straight-line (16 groups x 16 elements) so static instruction
counts equal the dynamic stream at fixed VL=256.
"""


def emit_256(func_name="dynopt_dequant_normal_256_sve2",
             compute="smull"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "static inline svint32_t srshl32(svint32_t a, svint32_t b)",
        "{",
        "    svint32_t r = a;",
        "    asm volatile(\"srshl %[r].s, %[p]/m, %[r].s, %[b].s\"",
        "                 : [r] \"+w\" (r)",
        "                 : [p] \"Upl\" (svptrue_b32()),"
        "                   [b] \"w\" (b));",
        "    return r;",
        "}",
        "",
        "extern \"C\" void %s("
        "const int16_t* q, int16_t* c, int scale, int shift)" % func_name,
        "{",
        "    svbool_t pg16 = svptrue_b16();",
        "    svbool_t pg32 = svptrue_b32();",
        "    svint32_t nshift = svdup_n_s32(-shift);",
    ]
    if compute == "smull":
        lines.append("    svint16_t scalev = svdup_n_s16((int16_t)scale);")
        body = (
            "    svint16_t v = svld1_s16(pg16, q + %d);\n"
            "    svint32_t lo = svmullb_s32(v, scalev);\n"
            "    svint32_t hi = svmullt_s32(v, scalev);\n"
            "    lo = srshl32(lo, nshift);\n"
            "    hi = srshl32(hi, nshift);\n"
            "    svint16_t out = svqxtnt_s32(svqxtnb_s32(lo), hi);\n"
            "    svst1_s16(pg16, c + %d, out);\n")
    elif compute == "ld1sh-mul":
        lines.append("    svint32_t scalev = svdup_n_s32(scale);")
        body = (
            "    svint32_t a0 = svld1sh_s32(pg32, q + %d);\n"
            "    svint32_t a1 = svld1sh_s32(pg32, q + %d + 8);\n"
            "    a0 = svmul_s32_x(pg32, a0, scalev);\n"
            "    a1 = svmul_s32_x(pg32, a1, scalev);\n"
            "    a0 = srshl32(a0, nshift);\n"
            "    a1 = srshl32(a1, nshift);\n"
            "    svint16_t out = svuzp1_s16(svqxtnb_s32(a0),"
            " svqxtnb_s32(a1));\n"
            "    svst1_s16(pg16, c + %d, out);\n")
    else:
        raise ValueError("unknown dequant compute %r" % compute)
    for i in range(16):
        off = i * 16
        args = (off, off, off) if compute == "ld1sh-mul" else (off, off)
        lines.append("    {")
        for l in (body % args).splitlines():
            lines.append("    " + l)
        lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit(combo):
    return emit_256(compute=combo.get("compute", "smull"))
