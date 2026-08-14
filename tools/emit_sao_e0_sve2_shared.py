"""SVE2 SAO edge offset class 0 (width 64, 2 rows, VL=256) emitter
(docs/45). Per 8-pixel block: s16 sign clamp, tbl lookup, clip add.
"""


def emit_64(func_name="dynopt_sao_e0_64_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(uint8_t* rec, int8_t* offsetEo,"
        " int8_t* signLeft, intptr_t stride)" % func_name,
        "{",
        "    svbool_t pg8_16 = svwhilelt_b16_u64(0, 8);",
        "    svbool_t pg8_8 = svwhilelt_b8_u64(0, 8);",
        "    static const int16_t IDX_SVE[8] ="
        " { 8, 0, 1, 2, 3, 4, 5, 6 };",
        "    svint16_t idxv = svld1_s16(pg8_16, IDX_SVE);",
        "    svuint16_t off16 = svld1sb_u16("
        "svwhilelt_b16_u64(0, 5), offsetEo);",
    ]
    for y in range(2):
        lines.append("    {")
        lines.append("        int8_t signL = signLeft[%d];" % y)
        for x in range(0, 64, 8):
            lines.append("        {")
            lines.extend([
                "            svuint16_t cur = svld1ub_u16(pg8_16,"
                " rec + %d * stride + %d);" % (y, x),
                "            svuint16_t nxt = svld1ub_u16(pg8_16,"
                " rec + %d * stride + %d + 1);" % (y, x),
                "            svint16_t d = svsub_s16_x(pg8_16,"
                " svreinterpret_s16_u16(cur), svreinterpret_s16_u16(nxt));",
                "            d = svmax_s16_x(pg8_16, svmin_s16_x(pg8_16, d,"
                " svdup_n_s16(1)), svdup_n_s16(-1));",
                "            svint16_t nsr = svneg_s16_x(pg8_16, d);",
                "            svint16_t table16 = svsplice_s16(pg8_16, nsr,"
                " svdup_n_s16(signL));",
                "            svint16_t slvec = svtbl_s16(table16,"
                " svreinterpret_u16_s16(idxv));",
                "            svint16_t et = svadd_s16_x(pg8_16,"
                " svadd_s16_x(pg8_16, d, slvec),"
                " svdup_n_s16(2));",
                "            svuint16_t off = svtbl_u16(off16,"
                " svreinterpret_u16_s16(et));",
                "            svint16_t out = svadd_s16_x(pg8_16,"
                " svreinterpret_s16_u16(cur), svreinterpret_s16_u16(off));",
                "            out = svmin_s16_x(pg8_16,"
                " svmax_s16_x(pg8_16, out, svdup_n_s16(0)),"
                " svdup_n_s16(255));",
                "            svuint8_t out8 = svuzp1_u8("
                " svqxtnb_u16(svreinterpret_u16_s16(out)),"
                " svqxtnb_u16(svreinterpret_u16_s16(out)));",
                "            svst1_u8(pg8_8, rec + %d * stride + %d, out8);"
                % (y, x),
                "            signL = (int8_t)(-svlastb_s16(pg8_16, d));",
            ])
            lines.append("        }")
        lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64()
