"""SVE2 SAO band offset (64x4, VL=256) candidate emitter (docs/45).

Per 8-pixel block: index = pixel >> 3 (u16), narrow to u8, svtbl_s8
(32-entry signed table), sign-extend to s16, add + clip in s16,
unsigned-narrow to u8.
"""


def emit_64x4(func_name="dynopt_sao_b0_64x4_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(uint8_t* rec, const int8_t* offset,"
        " intptr_t stride)" % func_name,
        "{",
        "    svbool_t pg8_16 = svwhilelt_b16_u64(0, 8);",
        "    svbool_t pg8_8 = svwhilelt_b8_u64(0, 8);",
        "    svint8_t table = svld1_s8(svptrue_b8(), offset);",
    ]
    for y in range(4):
        for x in range(0, 64, 8):
            lines.extend([
                "    {",
                "        svuint16_t cur = svld1ub_u16(pg8_16,"
                " rec + %d * stride + %d);" % (y, x),
                "        svuint16_t idx16 = svlsr_n_u16_x(pg8_16, cur, 3);",
                "        svuint8_t idx8 = svuzp1_u8(svqxtnb_u16(idx16),"
                " svqxtnb_u16(idx16));",
                "        svint8_t offs = svtbl_s8(table, idx8);",
                "        svint16_t off16 = svunpklo_s16(offs);",
                "        svint16_t out = svadd_s16_x(pg8_16,"
                " svreinterpret_s16_u16(cur), off16);",
                "        out = svmin_s16_x(pg8_16,"
                " svmax_s16_x(pg8_16, out, svdup_n_s16(0)),"
                " svdup_n_s16(255));",
                "        svuint8_t out8 = svuzp1_u8("
                " svqxtnb_u16(svreinterpret_u16_s16(out)),"
                " svqxtnb_u16(svreinterpret_u16_s16(out)));",
                "        svst1_u8(pg8_8, rec + %d * stride + %d, out8);"
                % (y, x),
                "    }",
            ])
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64x4()
