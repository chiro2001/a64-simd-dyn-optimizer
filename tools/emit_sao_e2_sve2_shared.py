"""SVE2 SAO edge offset class 2 (diagonal 135deg), 64x1, VL=256
(docs/45). Per 8-pixel block: signDown = clamp(cur - downRight, -1, 1);
edgeType = signDown + buff1 + 2; tbl lookup; bufft[x+1] = -signDown.
"""


def emit_64(func_name="dynopt_sao_e2_64_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(uint8_t* rec, int8_t* bufft,"
        " int8_t* buff1, int8_t* offsetEo, intptr_t stride)" % func_name,
        "{",
        "    svbool_t pg8_16 = svwhilelt_b16_u64(0, 8);",
        "    svbool_t pg8_8 = svwhilelt_b8_u64(0, 8);",
        "    svint16_t off16 = svld1sb_s16("
        "svwhilelt_b16_u64(0, 5), offsetEo);",
    ]
    for x in range(0, 64, 8):
        lines.extend([
            "    {",
            "        svuint16_t cur = svld1ub_u16(pg8_16, rec + %d);" % x,
            "        svuint16_t nxt = svld1ub_u16(pg8_16,"
            " rec + %d + stride + 1);" % x,
            "        svint16_t sd = svsub_s16_x(pg8_16,"
            " svreinterpret_s16_u16(cur), svreinterpret_s16_u16(nxt));",
            "        sd = svmax_s16_x(pg8_16, svmin_s16_x(pg8_16, sd,"
            " svdup_n_s16(1)), svdup_n_s16(-1));",
            "        svint16_t su = svld1sb_s16(pg8_16, buff1 + %d);" % x,
            "        svint16_t et = svadd_s16_x(pg8_16,"
            " svadd_s16_x(pg8_16, sd, su), svdup_n_s16(2));",
            "        svint16_t off = svtbl_s16(off16,"
            " svreinterpret_u16_s16(et));",
            "        svint16_t out = svadd_s16_x(pg8_16,"
            " svreinterpret_s16_u16(cur), off);",
            "        out = svmin_s16_x(pg8_16,"
            " svmax_s16_x(pg8_16, out, svdup_n_s16(0)),"
            " svdup_n_s16(255));",
            "        svuint8_t out8 = svuzp1_u8("
            " svqxtnb_u16(svreinterpret_u16_s16(out)),"
            " svqxtnb_u16(svreinterpret_u16_s16(out)));",
            "        svst1_u8(pg8_8, rec + %d, out8);" % x,
            "        svint8_t up8 = svuzp1_s8("
            " svqxtnb_s16(svneg_s16_x(pg8_16, sd)),"
            " svqxtnb_s16(svneg_s16_x(pg8_16, sd)));",
            "        svst1_s8(pg8_8, bufft + %d + 1, up8);" % x,
            "    }",
        ])
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64()
