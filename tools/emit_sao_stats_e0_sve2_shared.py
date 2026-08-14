"""SVE2 SAO stats edge class 0 (horizontal), 64x1, VL=256 (docs/45).

Two structure families:
  block=16: upstream-style NEON-bridge: 16-pixel chunks in the low 128
            bits, svhistseg for counts, sdot z.d/z.h/z.h for stats.
  block=32: full-width SVE256: 32-pixel chunks, cmpeq+svcntp for counts,
            sdot z.d/z.h/z.h for stats.
"""


def _sign16(a_expr, b_expr):
    return ("svsub_s8_x(svptrue_b8(), "
            "svsel_s8(svcmpgt_u8(svptrue_b8(), %s, %s), n1, z0), "
            "svsel_s8(svcmpgt_u8(svptrue_b8(), %s, %s), n1, z0))"
            % (b_expr, a_expr, a_expr, b_expr))


def emit_block16(func_name="dynopt_sao_stats_e0_64_sve2"):
    lines = [
        "#include <arm_neon.h>",
        "#include <arm_sve.h>",
        "#include <arm_neon_sve_bridge.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "static inline int8x16_t sign16n(const uint8_t* a, const uint8_t* b)",
        "{",
        "    uint8x16_t s0 = vld1q_u8(a);",
        "    uint8x16_t s1 = vld1q_u8(b);",
        "    return vsubq_s8(vreinterpretq_s8_u8(vcgtq_u8(s1, s0)),",
        "                    vreinterpretq_s8_u8(vcgtq_u8(s0, s1)));",
        "}",
        "",
        "static inline int64x2_t sdot16(int64x2_t acc, int16x8_t x,",
        "                               int16x8_t y)",
        "{",
        "    return svget_neonq_s64(svdot_s64(",
        "        svset_neonq_s64(svundef_s64(), acc),",
        "        svset_neonq_s16(svundef_s16(), x),",
        "        svset_neonq_s16(svundef_s16(), y)));",
        "}",
        "",
        "extern \"C\" void %s(const int16_t* diff, const uint8_t* rec,"
        " intptr_t stride, int32_t* stats, int32_t* count)" % func_name,
        "{",
        "    const int8x16_t DC = vdupq_n_s8(-3);",
        "    const int8x16_t idx = { 0, -2, -1, 1, 2, -3, -3, -3, -3, -3,"
        " -3, -3, -3, -3, -3, -3 };",
        "    svint8_t svidx = svset_neonq_s8(svundef_s8(), idx);",
        "    uint8x16_t count_u8 = vdupq_n_u8(0);",
        "    int64x2_t st[5] = { vdupq_n_s64(0), vdupq_n_s64(0),"
        " vdupq_n_s64(0), vdupq_n_s64(0), vdupq_n_s64(0) };",
        "    int d0 = (int)rec[-1] - (int)rec[0];",
        "    int8x16_t nsl = vdupq_n_s8(d0 < 0 ? -1 : (d0 > 0 ? 1 : 0));",
    ]
    for x in range(0, 64, 16):
        lines.extend([
            "    {",
            "        int8x16_t sr = sign16n(rec + %d, rec + %d + 1);" % (x, x),
            "        nsl = vextq_s8(nsl, sr, 15);",
            "        int8x16_t et = vsubq_s8(sr, nsl);",
            "        nsl = sr;",
            "        svint8_t svet = svset_neonq_s8(svundef_s8(), et);",
            "        count_u8 = vaddq_u8(count_u8,",
            "            svget_neonq_u8(svhistseg_s8(svidx, svet)));",
            "        int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et,",
            " vdupq_n_s8(-2)));",
            "        int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et,",
            " vdupq_n_s8(-1)));",
            "        int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et,",
            " vdupq_n_s8(0)));",
            "        int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et,",
            " vdupq_n_s8(1)));",
            "        int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et,",
            " vdupq_n_s8(2)));",
            "        int16x8_t dl = vld1q_s16(diff + %d);" % x,
            "        int16x8_t dh = vld1q_s16(diff + %d + 8);" % x,
        ])
        for k, m in enumerate(("m0", "m1", "m2", "m3", "m4")):
            lines.append(
            "        st[%d] = sdot16(st[%d], dl,"
                " vreinterpretq_s16_s8(vzip1q_s8(%s, %s)));" % (k, k, m, m))
        for k, m in enumerate(("m0", "m1", "m2", "m3", "m4")):
            lines.append(
                "        st[%d] = sdot16(st[%d], dh,"
                " vreinterpretq_s16_s8(vzip2q_s8(%s, %s)));" % (k, k, m, m))
        lines.append("    }")
    lines.extend([
        "    uint16x8_t count_u16 = vaddw_u8(vdupq_n_u16(0),",
        "                                     vget_low_u8(count_u8));",
        "    int32x4_t c0123 = vmovl_s16(",
        "        vget_low_s16(vreinterpretq_s16_u16(count_u16)));",
        "    vst1q_s32(count, vaddq_s32(vld1q_s32(count), c0123));",
        "    count[4] += vgetq_lane_u16(count_u16, 4);",
        "    int32x4_t s01 = vcombine_s32(vmovn_s64(st[2]), vmovn_s64(st[0]));",
        "    int32x4_t s23 = vcombine_s32(vmovn_s64(st[1]), vmovn_s64(st[3]));",
        "    int32x4_t s0123 = vpaddq_s32(s01, s23);",
        "    vst1q_s32(stats, vsubq_s32(vld1q_s32(stats), s0123));",
        "    stats[4] -= vaddvq_s64(st[4]);",
        "}",
    ])
    return "\n".join(lines) + "\n"


def emit_block32(func_name="dynopt_sao_stats_e0_64_sve2"):
    """Full-width 32-pixel SVE256 chunks; counts via cmpeq+svcntp,
    stats via cmpeq/sel + sdot z.d/z.h/z.h."""
    lines = [
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(const int16_t* diff, const uint8_t* rec,"
        " intptr_t stride, int32_t* stats, int32_t* count)" % func_name,
        "{",
        "    const svbool_t pg8 = svptrue_b8();",
        "    const svbool_t pg1 = svwhilelt_b8_u64(0, 1);",
        "    const svbool_t pg16 = svptrue_b16();",
        "    const svbool_t pg32 = svptrue_b32();",
        "    const svbool_t pg64 = svptrue_b64();",
        "    const svint8_t n1 = svdup_n_s8(-1);",
        "    const svint8_t z0 = svdup_n_s8(0);",
        "    long cnt[5] = { 0, 0, 0, 0, 0 };",
        "    svint64_t st0 = svdup_n_s64(0), st1 = svdup_n_s64(0),"
        " st2 = svdup_n_s64(0), st3 = svdup_n_s64(0), st4 = svdup_n_s64(0);",
        "    svint8_t sr_prev = svdup_n_s8(0);",
        "    int d0 = (int)rec[-1] - (int)rec[0];",
        "    int8_t carry = d0 < 0 ? -1 : (d0 > 0 ? 1 : 0);",
    ]
    for i, x in enumerate(range(0, 64, 32)):
        lines.extend([
            "    {",
            "        svuint8_t cur = svld1_u8(pg8, rec + %d);" % x,
            "        svuint8_t nxt = svld1_u8(pg8, rec + %d + 1);" % x,
            "        svint8_t sr = %s;" % _sign16("cur", "nxt"),
        ])
        if i == 0:
            lines.append(
                "        svint8_t nsl = svsplice_s8(pg1,"
                " svdup_n_s8(carry), sr);")
        else:
            lines.append(
                "        svint8_t nsl = svsplice_s8(pg1,"
                " svdup_n_s8(svlastb_s8(pg8, sr_prev)), sr);")
        lines.extend([
            "        svint8_t et = svsub_s8_x(pg8, sr, nsl);",
            "        svint16_t dl = svld1_s16(pg16, diff + %d);" % x,
            "        svint16_t dh = svld1_s16(pg16, diff + %d + 16);" % x,
        ])
        for k, etv in enumerate((-2, -1, 0, 1, 2)):
            lines.append(
                "        svbool_t p%d = svcmpeq_s8(pg8, et,"
                " svdup_n_s8(%d));" % (k, etv))
        for k in range(5):
            lines.append(
                "        cnt[%d] += svcntp_b8(pg8, p%d);" % (k, k))
        for k in range(5):
            lines.extend([
                "        {",
                "            svint8_t mk = svsel_s8(p%d, n1, z0);" % k,
                "            svint16_t ml = svunpklo_s16(mk);",
                "            svint16_t mh = svunpkhi_s16(mk);",
                "            svint64_t stk = svdot_s64(svdup_n_s64(0),"
                " dl, ml);",
                "            stk = svdot_s64(stk, dh, mh);",
                "            st%d = svadd_s64_x(pg64, st%d, stk);" % (k, k),
                "        }",
            ])
        if i == 0:
            lines.append("        sr_prev = sr;")
        lines.append("    }")
    lines.extend([
        "    // s_eoTable memory order for et=-2,-1,0,1,2: {1,2,0,3,4}.",
        "    count[1] += (int)cnt[0]; stats[1] -="
        " (int)svaddv_s64(pg64, st0);",
        "    count[2] += (int)cnt[1]; stats[2] -="
        " (int)svaddv_s64(pg64, st1);",
        "    count[0] += (int)cnt[2]; stats[0] -="
        " (int)svaddv_s64(pg64, st2);",
        "    count[3] += (int)cnt[3]; stats[3] -="
        " (int)svaddv_s64(pg64, st3);",
        "    count[4] += (int)cnt[4]; stats[4] -="
        " (int)svaddv_s64(pg64, st4);",
        "}",
    ])
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    block = combo.get("block", "32")
    if str(block) == "16":
        return emit_block16()
    return emit_block32()
