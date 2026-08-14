"""SVE2 dequant_scaling (256 elements, VL=256) candidate emitter
(docs/44). Two branch kernels (gt: shift+4 > per; le: shift+4 <= per),
each with two widen structures:
  widen=unpk       -- svunpklo/hi s16->s32 + svmul, narrow via
                      qxtnb+qxtnb+uzp1 (consecutive halves)
  widen=smull-ones -- svmullb/t by ones + svmul, narrow via
                      qxtnb+qxtnt (even/odd interleave is native)
Both straight-line (32 groups x 8 elements per group pair? 16 elems per
iteration) so static counts equal the dynamic stream at fixed VL=256.
"""


def emit_256(func_name="dynopt_dequant_scaling_256_sve2",
             branch="gt", widen="unpk"):
    if branch == "gt":
        lines = [
            "#include <arm_sve.h>",
            "#include <stdint.h>",
            "",
            "extern \"C\" void %s("
            "const int16_t* q, const int32_t* dq, int16_t* c,"
            " int shift, int per)" % func_name,
            "{",
            "    svbool_t pg16 = svptrue_b16();",
            "    svbool_t pg32 = svptrue_b32();",
            "    const int add = 1 << ((shift + 4) - per - 1);",
            "    svint32_t addv = svdup_n_s32(add);",
            "    svuint32_t cntv = svdup_n_u32((shift + 4) - per);",
        ]
    else:
        lines = [
            "#include <arm_sve.h>",
            "#include <stdint.h>",
            "",
            "extern \"C\" void %s("
            "const int16_t* q, const int32_t* dq, int16_t* c,"
            " int shift, int per)" % func_name,
            "{",
            "    svbool_t pg16 = svptrue_b16();",
            "    svbool_t pg32 = svptrue_b32();",
            "    svint16_t shv = svdup_n_s16((int16_t)(per - (shift + 4)));",
        ]

    if widen == "unpk":
        per16 = (
            "    svint16_t v = svld1_s16(pg16, q + %d);\n"
            "    svint32_t a0 = svunpklo_s32(v);\n"
            "    svint32_t a1 = svunpkhi_s32(v);\n"
            "    svint32_t d0 = svld1_s32(pg32, dq + %d);\n"
            "    svint32_t d1 = svld1_s32(pg32, dq + %d + 8);\n"
            "    svint32_t p0 = svmul_s32_x(pg32, a0, d0);\n"
            "    svint32_t p1 = svmul_s32_x(pg32, a1, d1);\n")
        if branch == "gt":
            per16 += (
                "    p0 = svadd_s32_x(pg32, p0, addv);\n"
                "    p1 = svadd_s32_x(pg32, p1, addv);\n"
                "    p0 = svasr_s32_x(pg32, p0, cntv);\n"
                "    p1 = svasr_s32_x(pg32, p1, cntv);\n"
                "    svint16_t out = svuzp1_s16(svqxtnb_s32(p0),"
                " svqxtnb_s32(p1));\n")
        else:
            per16 += (
                "    svint16_t out = svuzp1_s16(svqxtnb_s32(p0),"
                " svqxtnb_s32(p1));\n"
                "    out = svqshl_s16_x(pg16, out, shv);\n")
        per16 += "    svst1_s16(pg16, c + %d, out);\n"
        args4 = (0, 0, 0, 0)
    elif widen == "smull-ones":
        lines.append("    svint16_t ones = svdup_n_s16(1);")
        per16 = (
            "    svint16_t v = svld1_s16(pg16, q + %d);\n"
            "    svint32_t e = svmullb_s32(v, ones);\n"
            "    svint32_t o = svmullt_s32(v, ones);\n"
            "    svint32_t d0 = svld1_s32(pg32, dq + %d);\n"
            "    svint32_t d1 = svld1_s32(pg32, dq + %d + 8);\n"
            "    svint32_t deven = svuzp1_s32(d0, d1);\n"
            "    svint32_t dodd = svuzp2_s32(d0, d1);\n"
            "    svint32_t p0 = svmul_s32_x(pg32, e, deven);\n"
            "    svint32_t p1 = svmul_s32_x(pg32, o, dodd);\n")
        if branch == "gt":
            per16 += (
                "    p0 = svadd_s32_x(pg32, p0, addv);\n"
                "    p1 = svadd_s32_x(pg32, p1, addv);\n"
                "    p0 = svasr_s32_x(pg32, p0, cntv);\n"
                "    p1 = svasr_s32_x(pg32, p1, cntv);\n"
                "    svint16_t out = svqxtnt_s32(svqxtnb_s32(p0), p1);\n")
        else:
            per16 += (
                "    svint16_t out = svqxtnt_s32(svqxtnb_s32(p0), p1);\n"
                "    out = svqshl_s16_x(pg16, out, shv);\n")
        per16 += "    svst1_s16(pg16, c + %d, out);\n"
        args4 = (0, 0, 0, 0)
    else:
        raise ValueError("unknown dequant_scaling widen %r" % widen)

    for i in range(16):
        off = i * 16
        lines.append("    {")
        for l in (per16 % (off, off, off, off)).splitlines():
            lines.append("    " + l)
        lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit(combo):
    return emit_256(branch=combo.get("branch", "gt"),
                    widen=combo.get("widen", "unpk"))
