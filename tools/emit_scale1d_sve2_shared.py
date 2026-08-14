"""SVE2 scale1D_128to64 (VL=256) candidate emitter (docs/37).

Two 128-px rows -> two 64-px rows, adjacent-pair average (a+b+1)>>1 via
svuzp1/2 (even/odd deinterleave of two 32-byte vectors) + svrhadd.
"""


def emit_128to64(func_name="dynopt_scale1d_128to64_sve2"):
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "extern \"C\" void %s(uint8_t* dst, const uint8_t* src)"
        % func_name,
        "{",
        "    svbool_t pg = svptrue_b8();",
    ]
    # 4 chunks of 64 input bytes -> 32 output bytes, two rows
    for r in range(2):
        for c in range(2):
            off = r * 128 + c * 64
            d = r * 64 + c * 32
            lines.extend([
                "    {",
                "        svuint8_t a = svld1_u8(pg, src + %d);" % off,
                "        svuint8_t b = svld1_u8(pg, src + %d + 32);" % off,
                "        svuint8_t e = svuzp1_u8(a, b);",
                "        svuint8_t o = svuzp2_u8(a, b);",
                "        svst1_u8(pg, dst + %d, svrhadd_u8_x(pg, e, o));"
                % d,
                "    }",
            ])
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_128to64()
