#!/usr/bin/env python3
"""Parameterized SVE2 (VL=256) emitter for the DCT16 shared-leaf form.

The emitter is the tool-side generator for the structure discovered by
`tools/dct16_shared_discovery.py`:

    out_k[i] = dot(g_t16[k][0..7], (E_i if k even else O_i))
    E_i[j] = s_i[j] + s_i[15-j],   O_i[j] = s_i[j] - s_i[15-j]

with the 8-lane E/O leaves packed two-per-register so one SVE2
`SDOT .d` computes the two 4-element partials of two rows against the
pre-permuted (duplicated) constant [C | C].

Layout parameters (v2, fixed):
  - one row per z-register (16 s16, E/O occupy the low 8 lanes);
  - E/O built with a rev-segment TBL (reverse within each 8-lane half) +
    add/sub, avoiding the upstream rev64/ext chain;
  - dot: one SVE2 `SDOT .d` per row against the pre-duplicated constant
    [C | C] (2 useful s64 lanes = the row's two 4-element partials);
  - narrow: NEON bridge (svget_neonq + vmovn + vcombine + vpaddq +
    vrshrn) so the four row results stay contiguous; SVE2 RSHRNB/RSHRNT
    was rejected because it interleaves results into even/odd half-width
    lanes per 128-bit segment and cannot emit [f0,f1,f2,f3] contiguously.

Generated code must be rebuildable from this script alone; the g_t16 first
half rows are the same constants the discovery report folds into C.
"""

import argparse


GT16_FIRST8 = [
    [64, 64, 64, 64, 64, 64, 64, 64],
    [90, 87, 80, 70, 57, 43, 25, 9],
    [89, 75, 50, 18, -18, -50, -75, -89],
    [87, 57, 9, -43, -80, -90, -70, -25],
    [83, 36, -36, -83, -83, -36, 36, 83],
    [80, 9, -70, -87, -25, 57, 90, 43],
    [75, -18, -89, -50, 50, 89, 18, -75],
    [70, -43, -87, 9, 90, 25, -80, -57],
    [64, -64, -64, 64, 64, -64, -64, 64],
    [57, -80, -25, 90, -9, -87, 43, 70],
    [50, -89, 18, 75, -75, -18, 89, -50],
    [43, -90, 57, 25, -87, 70, 9, -80],
    [36, -83, 83, -36, -36, 83, -83, 36],
    [25, -70, 90, -80, 43, 9, -57, 87],
    [18, -50, 75, -89, 89, -75, 50, -18],
    [9, -25, 43, -57, 70, -80, 87, -90],
]

T8_EVEN = [
    [64, 64, 64, 64],
    [83, 36, 83, 36],
    [64, -64, 64, -64],
    [36, -83, 36, -83],
]


def const_rows_cpp():
    rows = []
    for c in GT16_FIRST8:
        body = ", ".join(str(x) for x in c)
        rows.append("    { %s }," % body)
    return "\n".join(rows)


def t8_even_cpp():
    rows = []
    for c in T8_EVEN:
        body = ", ".join(str(x) for x in c)
        rows.append("    { %s }," % body)
    return "\n".join(rows)


def gt16_s32_cpp():
    """First 4 coefficients of g_t16 rows 2,6,10,14, widened to s32."""
    rows = []
    for k in (2, 6, 10, 14):
        body = ", ".join(str(x) for x in GT16_FIRST8[k][:4])
        rows.append("    { %s }," % body)
    return "\n".join(rows)


def pass2_odd_quarter_cpp():
    """Unrolled 4-row groups: O quarters + odd-k quarter dot + even-k NEON."""
    parts = []
    parts.append("""\
    // odd k: quarter-interleaved O packs, 2 SDOT + 1 aligned add per k.
    const svbool_t p16q = svptrue_b16();
    const svbool_t p64q = svptrue_b64();
    const svbool_t p4q = svwhilelt_b16(0, 4);
    const svuint16_t iloq = svld1_u16(p16q, idx_lo);
    const svuint16_t q0q = svld1_u16(p16q, idx_q0);
    const svuint16_t q1q = svld1_u16(p16q, idx_q1);
    const svint64_t zaccq = svdup_n_s64(0);

    const svint16_t zO0 = svset_neonq_s16(svundef_s16(), O[0]);
    const svint16_t zO1 = svset_neonq_s16(svundef_s16(), O[1]);
    const svint16_t zO2 = svset_neonq_s16(svundef_s16(), O[2]);
    const svint16_t zO3 = svset_neonq_s16(svundef_s16(), O[3]);
    const svint16_t zO4 = svset_neonq_s16(svundef_s16(), O[4]);
    const svint16_t zO5 = svset_neonq_s16(svundef_s16(), O[5]);
    const svint16_t zO6 = svset_neonq_s16(svundef_s16(), O[6]);
    const svint16_t zO7 = svset_neonq_s16(svundef_s16(), O[7]);
    const svint16_t zO8 = svset_neonq_s16(svundef_s16(), O[8]);
    const svint16_t zO9 = svset_neonq_s16(svundef_s16(), O[9]);
    const svint16_t zO10 = svset_neonq_s16(svundef_s16(), O[10]);
    const svint16_t zO11 = svset_neonq_s16(svundef_s16(), O[11]);
    const svint16_t zO12 = svset_neonq_s16(svundef_s16(), O[12]);
    const svint16_t zO13 = svset_neonq_s16(svundef_s16(), O[13]);
    const svint16_t zO14 = svset_neonq_s16(svundef_s16(), O[14]);
    const svint16_t zO15 = svset_neonq_s16(svundef_s16(), O[15]);

""")
    for g in range(4):
        base = 4 * g
        parts.append("""\
        {
            const svint16_t PO01 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            const svint16_t PO23 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            const svint16_t QO0_%d = svtbl2_s16(
                svcreate2_s16(PO01, PO23), q0q);
            const svint16_t QO1_%d = svtbl2_s16(
                svcreate2_s16(PO01, PO23), q1q);
            for (int k = 1; k < 16; k += 2)
            {
                const svint16_t cq_loq = svld1_s16(p16q, CQ_LO[k]);
                const svint16_t cq_hiq = svld1_s16(p16q, CQ_HI[k]);
                const svint64_t d0 = svdot_s64(zaccq, QO0_%d, cq_loq);
                const svint64_t d1 = svdot_s64(zaccq, QO1_%d, cq_hiq);
                const svint64_t f = svadd_s64_x(p64q, d0, d1);
                const svint32_t w = svuzp1_s32(svreinterpret_s32_s64(f),
                                               svreinterpret_s32_s64(f));
                svint16_t n = svrshrnb_n_s32(w, shift);
                n = svuzp1_s16(n, n);
                svst1_s16(p4q, dst + k * line + %d, n);
            }
        }

        for (int k = 2; k < 16; k += 4)
        {
            const int32x4_t c0 = vld1q_s32(GT16_S32[(k - 2) / 4]);
            const int32x4_t t0 = vmulq_s32(c0, EO[%d + 0]);
            const int32x4_t t1 = vmulq_s32(c0, EO[%d + 1]);
            const int32x4_t t2 = vmulq_s32(c0, EO[%d + 2]);
            const int32x4_t t3 = vmulq_s32(c0, EO[%d + 3]);
            const int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),
                                           vpaddq_s32(t2, t3));
            const int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line + %d, res);
        }

        {
            const int32x4_t c0 = vld1q_s32(T8E[0]);
            const int32x4_t c4 = vld1q_s32(T8E[1]);
            const int32x4_t c8 = vld1q_s32(T8E[2]);
            const int32x4_t c12 = vld1q_s32(T8E[3]);
            const int32x4_t t0 = vpaddq_s32(EEE[%d + 0], EEE[%d + 1]);
            const int16x4_t res0 = vrshrn_n_s32(vmulq_s32(c0, t0), shift);
            vst1_s16(dst + 0 * line + %d, res0);
            const int32x4_t t2 = vmulq_s32(c4, EEO[%d + 0]);
            const int32x4_t t3 = vmulq_s32(c4, EEO[%d + 1]);
            const int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
            vst1_s16(dst + 4 * line + %d, res4);
            const int32x4_t t4 = vmulq_s32(c8, EEE[%d + 0]);
            const int32x4_t t5 = vmulq_s32(c8, EEE[%d + 1]);
            const int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
            vst1_s16(dst + 8 * line + %d, res8);
            const int32x4_t t6 = vmulq_s32(c12, EEO[%d + 0]);
            const int32x4_t t7 = vmulq_s32(c12, EEO[%d + 1]);
            const int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
            vst1_s16(dst + 12 * line + %d, res12);
        }
""" % (base, base + 1, base + 2, base + 3,
       g, g, g, g, base,
       base, base, base, base, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base))
    return "\n".join(parts)


def pass2_cpp(pass2_layout="upstream"):
    """pass2 body. 'upstream' matches dct16_sve exactly (E s32 vaddl,
    O s16 bridge SDOT, even path vmulq/vpaddq). 'odd-quarter' keeps the
    even-k/E/EO/EEE/EEO NEON path but replaces the odd-k per-row bridge
    SDOT block with the quarter-interleaved form (2 SDOT + 1 add per k
    per 4-row group + pure-SVE narrow)."""
    prelude = """\
static void pass2_upstream(const int16_t* src, int16_t* dst)
{
    const int shift = 10;
    const int line = 16;

    int16x8_t O[16];
    int32x4_t EO[16];
    int32x4_t EEE[8];
    int32x4_t EEO[8];

    for (int i = 0; i < line; i += 2)
    {
        const int16x8_t s0_lo = vld1q_s16(src + i * line);
        const int16x8_t s0_hi = rev16(vld1q_s16(src + i * line + 8));
        const int16x8_t s1_lo = vld1q_s16(src + (i + 1) * line);
        const int16x8_t s1_hi = rev16(vld1q_s16(src + (i + 1) * line + 8));

        const int32x4_t E00 = vaddl_s16(vget_low_s16(s0_lo),
                                        vget_low_s16(s0_hi));
        const int32x4_t E01 = vaddl_s16(vget_high_s16(s0_lo),
                                        vget_high_s16(s0_hi));
        const int32x4_t E10 = vaddl_s16(vget_low_s16(s1_lo),
                                        vget_low_s16(s1_hi));
        const int32x4_t E11 = vaddl_s16(vget_high_s16(s1_lo),
                                        vget_high_s16(s1_hi));

        O[i + 0] = vsubq_s16(s0_lo, s0_hi);
        O[i + 1] = vsubq_s16(s1_lo, s1_hi);

        EO[i + 0] = vsubq_s32(E00, rev32(E01));
        EO[i + 1] = vsubq_s32(E10, rev32(E11));

        const int32x4_t EE0 = vaddq_s32(E00, rev32(E01));
        const int32x4_t EE1 = vaddq_s32(E10, rev32(E11));
        const int32x4_t t0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(EE0),
                       vreinterpretq_s64_s32(EE1)));
        const int32x4_t t1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(EE0),
                       vreinterpretq_s64_s32(EE1))));

        EEE[i / 2] = vaddq_s32(t0, t1);
        EEO[i / 2] = vsubq_s32(t0, t1);
    }
"""
    even_tail = """\
        for (int k = 2; k < 16; k += 4)
        {
            const int32x4_t c0 = vld1q_s32(GT16_S32[(k - 2) / 4]);
            const int32x4_t t0 = vmulq_s32(c0, EO[i + 0]);
            const int32x4_t t1 = vmulq_s32(c0, EO[i + 1]);
            const int32x4_t t2 = vmulq_s32(c0, EO[i + 2]);
            const int32x4_t t3 = vmulq_s32(c0, EO[i + 3]);
            const int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),
                                           vpaddq_s32(t2, t3));
            const int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line, res);
        }

        const int32x4_t c0 = vld1q_s32(T8E[0]);
        const int32x4_t c4 = vld1q_s32(T8E[1]);
        const int32x4_t c8 = vld1q_s32(T8E[2]);
        const int32x4_t c12 = vld1q_s32(T8E[3]);

        const int32x4_t t0 = vpaddq_s32(EEE[i / 2 + 0], EEE[i / 2 + 1]);
        const int16x4_t res0 = vrshrn_n_s32(vmulq_s32(c0, t0), shift);
        vst1_s16(dst + 0 * line, res0);

        const int32x4_t t2 = vmulq_s32(c4, EEO[i / 2 + 0]);
        const int32x4_t t3 = vmulq_s32(c4, EEO[i / 2 + 1]);
        const int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 4 * line, res4);

        const int32x4_t t4 = vmulq_s32(c8, EEE[i / 2 + 0]);
        const int32x4_t t5 = vmulq_s32(c8, EEE[i / 2 + 1]);
        const int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 8 * line, res8);

        const int32x4_t t6 = vmulq_s32(c12, EEO[i / 2 + 0]);
        const int32x4_t t7 = vmulq_s32(c12, EEO[i / 2 + 1]);
        const int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 12 * line, res12);

        dst += 4;
    }
}
"""
    if pass2_layout == "upstream":
        odd_loop = """\
    for (int i = 0; i < line; i += 4)
    {
        for (int k = 1; k < 16; k += 2)
        {
            const int16x8_t c0_c4 = vld1q_s16(GT16[k]);
            const int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0_c4, O[i + 0]);
            const int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0_c4, O[i + 1]);
            const int64x2_t t2 = sdotq_s16(vdupq_n_s64(0), c0_c4, O[i + 2]);
            const int64x2_t t3 = sdotq_s16(vdupq_n_s64(0), c0_c4, O[i + 3]);
            const int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            const int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            const int16x4_t res = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);
            vst1_s16(dst + k * line, res);
        }
"""
        return prelude + odd_loop + even_tail
    if pass2_layout == "odd-quarter":
        return prelude + pass2_odd_quarter_cpp() + "}\n"
    raise ValueError("unknown pass2_layout %r" % pass2_layout)


def quarter_consts_cpp():
    """CQ_LO/CQ_HI: each 4-coefficient quarter quadruplicated (16 lanes)."""
    lo_rows, hi_rows = [], []
    for c in GT16_FIRST8:
        lo = c[:4] * 4
        hi = c[4:] * 4
        lo_rows.append("    { %s }," % ", ".join(str(x) for x in lo))
        hi_rows.append("    { %s }," % ", ".join(str(x) for x in hi))
    return "\n".join(lo_rows), "\n".join(hi_rows)


def quarter_dot_group(g, kexpr, lo, hi):
    """One 4-row group of the pass1 quarter dot, with k as a C expression."""
    return (
        "            const svint16_t x0_%d = (%s & 1) ? QO0_%d : QE0_%d;\n"
        "            const svint16_t x1_%d = (%s & 1) ? QO1_%d : QE1_%d;\n"
        "            svint64_t d_%d = svdot_s64(zacc, x0_%d, %s);\n"
        "            d_%d = svdot_s64(d_%d, x1_%d, %s);\n"
        "            const svint32_t w_%d = svuzp1_s32(\n"
        "                svreinterpret_s32_s64(d_%d),"
        " svreinterpret_s32_s64(d_%d));\n"
        "            svint16_t n_%d = svrshrnb_n_s32(w_%d, shift);\n"
        "            n_%d = svuzp1_s16(n_%d, n_%d);\n"
        "            svst1_s16(p4h, dst + 16 * (%s) + %d, n_%d);"
        % (g, kexpr, g, g,
           g, kexpr, g, g,
           g, g, lo,
           g, g, g, hi,
           g, g, g,
           g, g,
           g, g, g,
           kexpr, 4 * g, g))


def quarter_pass_cpp(k_tile=2):
    """pass1 in quarter-interleaved layout (v3), k-loop tiled by k_tile."""
    blocks = []
    for g in range(4):
        base = 4 * g
        blocks.append("""\
        {
            const svint16_t z0 = svld1_s16(p16, src + %d * stride);
            const svint16_t z1 = svld1_s16(p16, src + %d * stride);
            const svint16_t z2 = svld1_s16(p16, src + %d * stride);
            const svint16_t z3 = svld1_s16(p16, src + %d * stride);
            const svint16_t r0 = svrev_s16(z0);
            const svint16_t r1 = svrev_s16(z1);
            const svint16_t r2 = svrev_s16(z2);
            const svint16_t r3 = svrev_s16(z3);
            // direct quarter packs: raw and reversed halves are packed
            // before E/O formation, saving the intermediate leaf stage
            const svint16_t t01 = svtbl2_s16(svcreate2_s16(z0, z1), ilo);
            const svint16_t t23 = svtbl2_s16(svcreate2_s16(z2, z3), ilo);
            const svint16_t rt01 = svtbl2_s16(svcreate2_s16(r0, r1), ilo);
            const svint16_t rt23 = svtbl2_s16(svcreate2_s16(r2, r3), ilo);
            const svint16_t P0 = svtbl2_s16(svcreate2_s16(t01, t23), qa);
            const svint16_t P1 = svtbl2_s16(svcreate2_s16(t01, t23), qb);
            const svint16_t R0 = svtbl2_s16(svcreate2_s16(rt01, rt23), qa);
            const svint16_t R1 = svtbl2_s16(svcreate2_s16(rt01, rt23), qb);
            QE0_%d = svadd_s16_x(p16, P0, R0);
            QE1_%d = svadd_s16_x(p16, P1, R1);
            QO0_%d = svsub_s16_x(p16, P0, R0);
            QO1_%d = svsub_s16_x(p16, P1, R1);
        }""" % (base, base + 1, base + 2, base + 3, g, g, g, g))
    build_src = "\n".join(blocks)
    tiles = []
    for t in range(k_tile):
        kexpr = "kb + %d" % t
        lo = "cq_lo%d" % t
        hi = "cq_hi%d" % t
        header = "        const svint16_t %s = svld1_s16(p16, CQ_LO[kb + %d]);\n" \
                 "        const svint16_t %s = svld1_s16(p16, CQ_HI[kb + %d]);\n" \
                 % (lo, t, hi, t)
        tiles.append("{\n%s%s\n        }"
                     % (header,
                        "\n".join(quarter_dot_group(g, kexpr, lo, hi)
                                  for g in range(4))))
    dot_src = ("    for (int kb = 0; kb < 16; kb += %d)\n    {\n%s\n    }\n"
               % (k_tile, "\n".join(tiles)))
    return """\
template <int shift>
static void pass_quarter(const int16_t* src, int16_t* dst, intptr_t stride)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p64 = svptrue_b64();
    const svbool_t p4h = svwhilelt_b16(0, 4);
    const svuint16_t ilo = svld1_u16(p16, idx_lo);
    const svuint16_t qa = svld1_u16(p16, idx_qa);
    const svuint16_t qb = svld1_u16(p16, idx_qb);
    const svint64_t zacc = svdup_n_s64(0);

    svint16_t QE0_0, QE1_0, QO0_0, QO1_0;
    svint16_t QE0_1, QE1_1, QO0_1, QO1_1;
    svint16_t QE0_2, QE1_2, QO0_2, QO1_2;
    svint16_t QE0_3, QE1_3, QO0_3, QO1_3;
%s

%s
}
""" % (build_src, dot_src)


def build_block(i):
    return """\
        {
            const svint16_t z = svld1_s16(p16, src + %d * stride);
            const svint16_t rr = svtbl_s16(z, irv);
            E%d = svadd_s16_x(p16, z, rr);
            O%d = svsub_s16_x(p16, z, rr);
        }""" % (i, i, i)


def group_block(g):
    """One 4-row group: per-row SDOT + NEON-bridge contiguous narrow."""
    base = 4 * g
    dots = []
    for r in range(base, base + 4):
        dots.append("""\
            const svint16_t x%d = (k & 1) ? O%d : E%d;
            const svint64_t d%d = svdot_s64(zacc, x%d, ck);""" % (r, r, r, r, r))
    narrow = """\
        {
            const int64x2_t t0 = svget_neonq_s64(d%d);
            const int64x2_t t1 = svget_neonq_s64(d%d);
            const int64x2_t t2 = svget_neonq_s64(d%d);
            const int64x2_t t3 = svget_neonq_s64(d%d);
            const int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            const int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            const int32x4_t w = vpaddq_s32(t01, t23);
            const int16x4_t n = vrshrn_n_s32(w, shift);
            vst1_s16(dst + 16 * k + %d, n);
        }""" % (base, base + 1, base + 2, base + 3, base)
    return "\n".join(dots) + "\n" + narrow


def emit(func_name="dynopt_dct16_sve2_shared", export_pass1=False,
         export_pass2=False, pass1_layout="quarter",
         pass2_layout="upstream", pass1_k_tile=2):
    rows = const_rows_cpp()
    t8e = t8_even_cpp()
    g32 = gt16_s32_cpp()
    cq_lo, cq_hi = quarter_consts_cpp()
    build_src = "\n".join(build_block(i) for i in range(16))
    dot_src = "\n".join(group_block(g) for g in range(4))
    quarter_src = quarter_pass_cpp(k_tile=pass1_k_tile)
    pass2_src = pass2_cpp(pass2_layout)
    if pass1_layout == "quarter":
        pass1_call = "pass_quarter<3>(src, coef, srcStride)"
        pass1_export_call = "pass_quarter<3>(src, dst, srcStride)"
        pass1_def = quarter_src
    else:
        pass1_call = "pass<3>(src, coef, srcStride)"
        pass1_export_call = "pass<3>(src, dst, srcStride)"
        pass1_def = ""
    pass1_export = ""
    if export_pass1:
        pass1_export = """

extern "C" void %s_pass1(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    %s;
}
""" % (func_name, pass1_export_call)
    if export_pass2:
        pass1_export += """

extern "C" void %s_pass2(const int16_t* src, int16_t* dst)
{
    pass2_upstream(src, dst);
}
""" % func_name
    return """\
// Generated by tools/emit_dct16_sve2_shared.py -- do not edit by hand.
// SVE2 VL=256 shared-leaf DCT16: E/O leaves + SDOT + NEON-bridge narrow.
#include <arm_sve.h>
#include <arm_neon.h>
#include <arm_neon_sve_bridge.h>
#include <cstdint>

namespace {

static const int16_t C8[16][8] = {
%s
};

static const int16_t GT16[16][8] = {
%s
};

static const int32_t GT16_S32[4][4] = {
%s
};

static const int32_t T8E[4][4] = {
%s
};

static const int16_t CQ_LO[16][16] = {
%s
};

static const int16_t CQ_HI[16][16] = {
%s
};

static const uint8_t rev16_tbl[16] =
    { 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 };
static const uint8_t rev32_tbl[16] =
    { 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 };

static inline int16x8_t rev16(const int16x8_t a)
{
    return vreinterpretq_s16_s8(vqtbx1q_s8(
        vreinterpretq_s8_s16(a), vreinterpretq_s8_s16(a),
        vld1q_u8(rev16_tbl)));
}

static inline int32x4_t rev32(const int32x4_t a)
{
    return vreinterpretq_s32_s8(vqtbx1q_s8(
        vreinterpretq_s8_s32(a), vreinterpretq_s8_s32(a),
        vld1q_u8(rev32_tbl)));
}

static inline int64x2_t sdotq_s16(int64x2_t acc, int16x8_t x, int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(
        svset_neonq_s64(svundef_s64(), acc),
        svset_neonq_s16(svundef_s16(), x),
        svset_neonq_s16(svundef_s16(), y)));
}

// tbl2 index: low 8 lanes of {z_a, z_b} -> [z_a[0..7], z_b[0..7]]
// hi: [z_a[8..15], z_b[8..15]]
static const uint16_t idx_rev[16] =
    { 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
static const uint16_t idx_lo[16] =
    { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
static const uint16_t idx_q0[16] =
    { 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 };
static const uint16_t idx_q1[16] =
    { 4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31 };
static const uint16_t idx_qa[16] =
    { 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 };
static const uint16_t idx_qb[16] =
    { 4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31 };

template <int shift>
static void pass(const int16_t* src, int16_t* dst, intptr_t stride)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t irv = svld1_u16(p16, idx_rev);
    const svint64_t zacc = svdup_n_s64(0);

    // E/O leaves: low 8 lanes per row; rows are unrolled (ACLE: no arrays
    // of SVE types).
    svint16_t E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13,
              E14, E15;
    svint16_t O0, O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13,
              O14, O15;
%s

    for (int k = 0; k < 16; k++)
    {
        const svint16_t ck = svld1_s16(p16, C8[k]);   // [C | C]
%s
    }
}

%s
%s
} // namespace

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    int16_t coef[256];
    %s;
    pass2_upstream(coef, dst);
}
%s""" % (rows, rows, g32, t8e, cq_lo, cq_hi, build_src, dot_src,
         pass1_def, pass2_src, func_name, pass1_call, pass1_export)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="kernels/dct16/candidates/sve2_shared.cpp",
                    nargs="?")
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit())
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
