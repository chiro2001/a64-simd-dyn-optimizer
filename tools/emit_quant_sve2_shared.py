"""SVE2 quant (256 elements, VL=256) candidate emitter (docs/44).

Semantics per element (x265 quant_c):
  a = abs(coef) * quantCoeff
  level = (a + add) >> qBits
  deltaU = (a - (level << qBits)) >> (qBits - 8)
  qCoef = level * sign(coef); return #nonzero(level)

Search axes:
  widen=unpk       -- abs(s16) + svunpklo/hi + svmul
  widen=smull-ones -- svabs_s16 + svmullb/t(ones) + svmul(even/odd qc)
numsig via svcntp(svcmpne); qCoef via svsel(neg, -lv, lv).
"""


def emit_256(func_name="dynopt_quant_256_sve2", widen="unpk"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "extern \"C\" uint32_t %s("
        "const int16_t* coef, const int32_t* qc, int32_t* du,"
        " int16_t* qo, int qBits, int add)" % func_name,
        "{",
        "    svbool_t pg16 = svptrue_b16();",
        "    svbool_t pg32 = svptrue_b32();",
        "    svint32_t addv = svdup_n_s32(add);",
        "    svuint32_t qbitsv = svdup_n_u32(qBits);",
        "    svuint32_t qbits8v = svdup_n_u32(qBits - 8);",
        "    svint32_t qbitsmulv = svdup_n_s32(1 << qBits);",
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
            "    svint32_t d0 = svasr_s32_x(pg32, svmsb_s32_x(pg32, l0,"
            " qbitsmulv, p0), qbits8v);\n"
            "    svint32_t d1 = svasr_s32_x(pg32, svmsb_s32_x(pg32, l1,"
            " qbitsmulv, p1), qbits8v);\n"
            "    svst1_s32(pg32, du + %d, d0);\n"
            "    svst1_s32(pg32, du + %d + 8, d1);\n"
            "    svint16_t lv = svuzp1_s16(svqxtnb_s32(l0),"
            " svqxtnb_s32(l1));\n"
            "    svbool_t neg = svcmplt_n_s16(pg16, v, 0);\n"
            "    svst1_s16(pg16, qo + %d, svsel_s16(neg,"
            " svneg_s16_x(pg16, lv), lv));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l0, 0));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l1, 0));\n")
        args5 = (0, 0, 0, 0, 0)
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
            "    svint32_t d0 = svasr_s32_x(pg32, svmsb_s32_x(pg32, l0,"
            " qbitsmulv, p0), qbits8v);\n"
            "    svint32_t d1 = svasr_s32_x(pg32, svmsb_s32_x(pg32, l1,"
            " qbitsmulv, p1), qbits8v);\n"
            "    svst1_s32(pg32, du + %d, svzip1_s32(d0, d1));\n"
            "    svst1_s32(pg32, du + %d + 8, svzip2_s32(d0, d1));\n"
            "    svint16_t lv = svqxtnt_s32(svqxtnb_s32(l0), l1);\n"
            "    svbool_t neg = svcmplt_n_s16(pg16, v, 0);\n"
            "    svst1_s16(pg16, qo + %d, svsel_s16(neg,"
            " svneg_s16_x(pg16, lv), lv));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l0, 0));\n"
            "    nz += (uint32_t)svcntp_b32(svptrue_b32(),"
            " svcmpne_n_s32(pg32, l1, 0));\n")
        args6 = (0, 0, 0, 0, 0, 0)
    else:
        raise ValueError("unknown quant widen %r" % widen)

    for i in range(16):
        off = i * 16
        lines.append("    {")
        nargs = 6
        for l in (per16 % tuple([off] * nargs)).splitlines():
            lines.append("    " + l)
        lines.append("    }")
    lines.append("    return nz;")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_sve1(func_name="dynopt_quant_256_sve2"):
    """SVE1 quant: 256-bit s16 loads + s32 widen/mul/shift, NEON bridge for
    the saturating narrow (svqxtnb is SVE2-only and unavailable on 920B)."""
    return r"""\
// Generated by tools/emit_quant_sve2_shared.py (SVE1+NEON variant)
#include <arm_sve.h>
#include <arm_neon.h>
#include <arm_neon_sve_bridge.h>
#include <stdint.h>

static inline int16x8_t narrow8(svint32_t v)
{
    static const uint32_t HI[8] = { 4, 5, 6, 7, 0, 0, 0, 0 };
    const svuint32_t idx = svld1_u32(svptrue_b32(), HI);
    const svint32_t hi = svtbl_s32(v, idx);
    return vcombine_s16(vqmovn_s32(svget_neonq_s32(v)),
                        vqmovn_s32(svget_neonq_s32(hi)));
}

static inline svint16_t narrow16(svint32_t lo, svint32_t hi)
{
    int16_t tmp[16];
    vst1q_s16(tmp, narrow8(lo));
    vst1q_s16(tmp + 8, narrow8(hi));
    return svld1_s16(svptrue_b16(), tmp);
}

extern "C" uint32_t dynopt_quant_256_sve2(
    const int16_t* coef, const int32_t* qc, int32_t* du,
    int16_t* qo, int qBits, int add)
{
    const svbool_t pg16 = svptrue_b16();
    const svbool_t pg32 = svptrue_b32();
    const svint32_t addv = svdup_n_s32(add);
    const svuint32_t qbitsv = svdup_n_u32((uint32_t)qBits);
    const svuint32_t qbits8v = svdup_n_u32((uint32_t)(qBits - 8));
    const svint32_t qbitsmulv = svdup_n_s32(1 << qBits);
    uint32_t nz = 0;

    for (int o = 0; o < 256; o += 16)
    {
        const svint16_t v = svld1_s16(pg16, coef + o);
        const svint32_t a0 = svabs_s32_x(pg32, svunpklo_s32(v));
        const svint32_t a1 = svabs_s32_x(pg32, svunpkhi_s32(v));
        const svint32_t q0 = svld1_s32(pg32, qc + o);
        const svint32_t q1 = svld1_s32(pg32, qc + o + 8);
        const svint32_t p0 = svmul_s32_x(pg32, a0, q0);
        const svint32_t p1 = svmul_s32_x(pg32, a1, q1);
        const svint32_t l0 = svasr_s32_x(pg32, svadd_s32_x(pg32, p0, addv),
                                         qbitsv);
        const svint32_t l1 = svasr_s32_x(pg32, svadd_s32_x(pg32, p1, addv),
                                         qbitsv);
        const svint32_t d0 = svasr_s32_x(
            pg32, svmsb_s32_x(pg32, l0, qbitsmulv, p0), qbits8v);
        const svint32_t d1 = svasr_s32_x(
            pg32, svmsb_s32_x(pg32, l1, qbitsmulv, p1), qbits8v);
        svst1_s32(pg32, du + o, d0);
        svst1_s32(pg32, du + o + 8, d1);
        const svint16_t lvs = narrow16(l0, l1);
        const svbool_t neg = svcmplt_n_s16(pg16, v, 0);
        svst1_s16(pg16, qo + o, svsel_s16(neg, svneg_s16_x(pg16, lvs), lvs));
        nz += (uint32_t)svcntp_b32(svptrue_b32(),
                                   svcmpne_n_s32(pg32, l0, 0));
        nz += (uint32_t)svcntp_b32(svptrue_b32(),
                                   svcmpne_n_s32(pg32, l1, 0));
    }
    return nz;
}
""".replace("dynopt_quant_256_sve2", func_name)


def emit(combo):
    if combo.get("compute") == "sve1":
        return emit_sve1()
    return emit_256(widen=combo.get("widen", "unpk"))
