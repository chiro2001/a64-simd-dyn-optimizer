"""SVE2 scale2D_64to32 (VL=256) candidate emitter (docs/37).

64x64 -> 32x32: each 2x2 block -> (a+b+c+d+2)>>2. Per 16 input bytes per
row pair: widen to u16, even/odd uzp pair sums (2x1), add rows (2x2),
rounding shift right 2, qxtnb+uzp1 narrow to u8.
"""


def emit_64to32(func_name="dynopt_scale2d_64to32_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(uint8_t* dst, const uint8_t* src,"
        " intptr_t stride)" % func_name,
        "{",
        "    svbool_t pg16 = svptrue_b16();",
        "    svbool_t pg8_8 = svwhilelt_b8_u64(0, 8);",
    ]
    for y in range(0, 64, 2):
        for c in (0, 16, 32, 48):
            d = y // 2 * 32 + c // 2
            lines.extend([
                "    {",
                "        const uint8_t* r0 = src + %d * stride + %d;"
                % (y, c),
                "        svuint16_t a0 = svld1ub_u16(pg16, r0);",
                "        svuint16_t b0 = svld1ub_u16(pg16, r0 + stride);",
                "        svuint16_t ae = svuzp1_u16(a0, a0);",
                "        svuint16_t ao = svuzp2_u16(a0, a0);",
                "        svuint16_t be = svuzp1_u16(b0, b0);",
                "        svuint16_t bo = svuzp2_u16(b0, b0);",
                "        svuint16_t s = svadd_u16_x(pg16,"
                " svadd_u16_x(pg16, ae, ao), svadd_u16_x(pg16, be, bo));",
                "        s = svrshr_n_u16_x(pg16, s, 2);",
                "        svuint8_t out = svuzp1_u8(svqxtnb_u16(s),"
                " svqxtnb_u16(s));",
                "        svst1_u8(pg8_8, dst + %d, out);" % d,
                "    }",
            ])
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64to32()
