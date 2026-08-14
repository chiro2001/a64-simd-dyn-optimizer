"""SVE2 nquant (256 elements, VL=256) candidate emitter (docs/44).

Semantics: level = (abs(coef)*quantCoeff + add) >> qBits;
qCoef = |level|; return #nonzero(level). No deltaU.
"""


def emit_256(func_name="dynopt_nquant_256_sve2", widen="unpk"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "extern \"C\" uint32_t %s("
        "const int16_t* coef, const int32_t* qc, int16_t* qo,"
        " int qBits, int add)" % func_name,
        "{",
        "    svbool_t pg16 = svptrue_b16();",
        "    svbool_t pg32 = svptrue_b32();",
        "    svint32_t addv = svdup_n_s32(add);",
        "    svuint32_t qbitsv = svdup_n_u32(qBits);",
        "    uint32_t nz = 0;",
    ]
    if widen == "unpk":
        per16 = (
            "    svint16_t v = svld1_s16(pg16, coef + %d);\n"
            "    svint32_t a0 = svabs_s32_x(pg32, svunpklo_s32(v));\n"
            "    svint32_t a1 = svabs_s32_x(pg32, svunpkhi_s32(v));\n"
            "    svint32_t q0 = svld1_s32(pg32, qc + %d);\n"
            "    svint32_t q1 = svld1_s32(pg32, qc + %d + 8);\n"
            "    svint32_t p0 = svmul_s32_x(pg32, a0, q0);\n"
            "    svint32_t p1 = svmul_s32_x(pg32, a1, q1);\n"
            "    svint32_t l0 = svasr_s32_x(pg32, svadd_s32_x(pg32, p0,"
            " addv), qbitsv);\n"
            "    svint32_t l1 = svasr_s32_x(pg32, svadd_s32_x(pg32, p1,"
            " addv), qbitsv);\n"
            "    svint16_t lv = svuzp1_s16(svqxtnb_s32(l0),"
            " svqxtnb_s32(l1));\n"
            "    svst1_s16(pg16, qo + %d, lv);\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l0, 0));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l1, 0));\n")
        nargs = 4
    elif widen == "smull-ones":
        lines.append("    svint16_t ones = svdup_n_s16(1);")
        per16 = (
            "    svint16_t v = svld1_s16(pg16, coef + %d);\n"
            "    svint16_t av = svabs_s16_x(pg16, v);\n"
            "    svint32_t e = svabs_s32_x(pg32, svmullb_s32(av, ones));\n"
            "    svint32_t o = svabs_s32_x(pg32, svmullt_s32(av, ones));\n"
            "    svint32_t q0 = svld1_s32(pg32, qc + %d);\n"
            "    svint32_t q1 = svld1_s32(pg32, qc + %d + 8);\n"
            "    svint32_t deven = svuzp1_s32(q0, q1);\n"
            "    svint32_t dodd = svuzp2_s32(q0, q1);\n"
            "    svint32_t p0 = svmul_s32_x(pg32, e, deven);\n"
            "    svint32_t p1 = svmul_s32_x(pg32, o, dodd);\n"
            "    svint32_t l0 = svasr_s32_x(pg32, svadd_s32_x(pg32, p0,"
            " addv), qbitsv);\n"
            "    svint32_t l1 = svasr_s32_x(pg32, svadd_s32_x(pg32, p1,"
            " addv), qbitsv);\n"
            "    svint16_t lv = svqxtnt_s32(svqxtnb_s32(l0), l1);\n"
            "    svst1_s16(pg16, qo + %d, lv);\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l0, 0));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l1, 0));\n")
        nargs = 4
    else:
        raise ValueError("unknown nquant widen %r" % widen)

    for i in range(16):
        off = i * 16
        lines.append("    {")
        for l in (per16 % tuple([off] * nargs)).splitlines():
            lines.append("    " + l)
        lines.append("    }")
    lines.append("    return nz;")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit(combo):
    return emit_256(widen=combo.get("widen", "unpk"))
