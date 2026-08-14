"""SVE2 SAO edge offset class 3 (diagonal 45deg), 64x1, VL=256
(docs/45). Vector blocks x=1..49 + scalar tail 57..63 (dynamic lookup).
"""


def emit_64(func_name="dynopt_sao_e3_64_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(uint8_t* rec, int8_t* upBuff1,"
        " int8_t* offsetEo, intptr_t stride)" % func_name,
        "{",
        "    svbool_t pg8_16 = svwhilelt_b16_u64(0, 8);",
        "    svbool_t pg8_8 = svwhilelt_b8_u64(0, 8);",
        "    svint16_t off16 = svld1sb_s16("
        "svwhilelt_b16_u64(0, 5), offsetEo);",
    ]
    for x in range(1, 57, 8):
        lines.extend([
            "    {",
            "        svuint16_t cur = svld1ub_u16(pg8_16, rec + %d);" % x,
            "        svuint16_t nxt = svld1ub_u16(pg8_16,"
            " rec + %d + stride);" % x,
            "        svint16_t sd = svsub_s16_x(pg8_16,"
            " svreinterpret_s16_u16(cur), svreinterpret_s16_u16(nxt));",
            "        sd = svmax_s16_x(pg8_16, svmin_s16_x(pg8_16, sd,"
            " svdup_n_s16(1)), svdup_n_s16(-1));",
            "        svint16_t su = svld1sb_s16(pg8_16, upBuff1 + %d);"
            % x,
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
            "        svst1_s8(pg8_8, upBuff1 + %d - 1, up8);" % x,
            "    }",
        ])
    lines.append("    for (int x = 57; x < 64; x++)")
    lines.append("    {")
    lines.append("        int d = (int)rec[x] - (int)rec[x + stride];")
    lines.append("        int8_t sd = d < 0 ? -1 : (d > 0 ? 1 : 0);")
    lines.append("        int et = sd + upBuff1[x] + 2;")
    lines.append("        upBuff1[x - 1] = (int8_t)(-sd);")
    lines.append("        int v = (int)rec[x] + offsetEo[et];")
    lines.append("        rec[x] = (uint8_t)(v < 0 ? 0 :"
                 " (v > 255 ? 255 : v));")
    lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64()
