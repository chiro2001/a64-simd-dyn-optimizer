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


def pass2_odd_quarter_cpp(k_tile=1, narrow_merge=0):
    """Unrolled 4-row groups: O quarters + tiled odd-k quarter dot +
    even-k NEON."""
    parts = []
    parts.append("""\
    // odd k: quarter-interleaved O packs, 2 SDOT + 1 aligned add per k.
    const svbool_t p64q = svptrue_b64();
    const svbool_t p4q = svwhilelt_b16(0, 4);
    const svbool_t p8q = svwhilelt_b16(0, 8);
    const svuint16_t iloq = svld1_u16(p16q, idx_lo);
    const svuint16_t q0q = svld1_u16(p16q, idx_q0);
    const svuint16_t q1q = svld1_u16(p16q, idx_q1);
    const svuint16_t qsel = svld1_u16(p16q, idx_q0);
    const svint64_t zaccq = svdup_n_s64(0);

""")
    if narrow_merge:
        parts.append(
            "    svint16_t QO0_0, QO1_0, QO0_1, QO1_1;\n"
            "    svint16_t QO0_2, QO1_2, QO0_3, QO1_3;\n\n")
    pack_blocks = []
    dot_blocks = []
    even_blocks = []
    for g in range(4):
        base = 4 * g
        pack = """\
        {
            const svint16_t PO01 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            const svint16_t PO23 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            %s QO0_%d = svtbl2_s16(
                svcreate2_s16(PO01, PO23), q0q);
            %s QO1_%d = svtbl2_s16(
                svcreate2_s16(PO01, PO23), q1q);
""" % (base, base + 1, base + 2, base + 3,
       "const svint16_t" if not narrow_merge else "", g,
       "const svint16_t" if not narrow_merge else "", g)
        bodies = []
        for t in range(k_tile):
            kexpr = "kb + %d" % (2 * t)
            lo, hi = "cq_loq%d" % t, "cq_hiq%d" % t
            bodies.append(
                "            {\n"
                "                const svint16_t %s = "
                "svld1_s16(p16q, CQ_LO[%s]);\n"
                "                const svint16_t %s = "
                "svld1_s16(p16q, CQ_HI[%s]);\n"
                "                svint64_t d_%d_%d = "
                "svdot_s64(zaccq, QO0_%d, %s);\n"
                "                d_%d_%d = svdot_s64(d_%d_%d, QO1_%d, %s);\n"
                "                const svint32_t w = "
                "svuzp1_s32(svreinterpret_s32_s64(d_%d_%d),\n"
                "                                           "
                "svreinterpret_s32_s64(d_%d_%d));\n"
                "                svint16_t n = svrshrnb_n_s32(w, shift);\n"
                "                n = svuzp1_s16(n, n);\n"
                "                svst1_s16(p4q, dst + (%s) * line + %d, n);\n"
                "            }"
                % (lo, kexpr, hi, kexpr, g, t, g, lo, g, t, g, t, g, hi,
                   g, t, g, t, kexpr, base))
        if narrow_merge:
            pack_blocks.append(pack + "        }\n\n")
        else:
            odd_loop = ("        for (int kb = 1; kb < 16; kb += %d)\n"
                        "        {\n%s\n        }\n"
                        % (2 * k_tile, "\n".join(bodies)))
            pack_blocks.append(pack + odd_loop + "        }\n\n")
        even = """\
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
""" % (base, base, base, base, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base,
       2 * g, 2 * g, base)
        even_blocks.append(even)
    if narrow_merge:
        # k loop hoisted outside groups: dot all groups, then merge
        for t in range(k_tile):
            kexpr = "kb + %d" % (2 * t)
            dot_blocks.append(
                "            const svint16_t cq_loq%d = "
                "svld1_s16(p16q, CQ_LO[%s]);\n"
                "            const svint16_t cq_hiq%d = "
                "svld1_s16(p16q, CQ_HI[%s]);\n"
                % (t, kexpr, t, kexpr))
            dot_blocks.append(
                "            // k=%s, groups 0..3\n%s\n"
                % (kexpr, "\n".join(
                    "                svint64_t d_%d_%d = "
                    "svdot_s64(zaccq, QO0_%d, cq_loq%d);\n"
                    "                d_%d_%d = svdot_s64(d_%d_%d, "
                    "QO1_%d, cq_hiq%d);\n"
                    % (g, t, g, t, g, t, g, t, g, t)
                    for g in range(4))))
            dot_blocks.append(
                "            {\n"
                "                const svint32_t w01 = svuzp1_s32(\n"
                "                    svreinterpret_s32_s64(d_0_%d),\n"
                "                    svreinterpret_s32_s64(d_1_%d));\n"
                "                svint16_t n = svrshrnb_n_s32(w01, shift);\n"
                "                n = svuzp1_s16(n, n);\n"
                "                svst1_s16(p8q, dst + (%s) * line + 0, n);\n"
                "            }\n"
                "            {\n"
                "                const svint32_t w23 = svuzp1_s32(\n"
                "                    svreinterpret_s32_s64(d_2_%d),\n"
                "                    svreinterpret_s32_s64(d_3_%d));\n"
                "                svint16_t n2 = svrshrnb_n_s32(w23, shift);\n"
                "                n2 = svuzp1_s16(n2, n2);\n"
                "                svst1_s16(p8q, dst + (%s) * line + 8, n2);\n"
                "            }"
                % (t, t, kexpr, t, t, kexpr))
    if narrow_merge:
        dot_src = ("    for (int kb = 1; kb < 16; kb += %d)\n"
                   "    {\n%s\n    }\n"
                   % (2 * k_tile, "\n".join(dot_blocks)))
        parts.append("\n".join(pack_blocks) + dot_src
                     + "\n" + "\n".join(even_blocks))
    else:
        parts.append("\n".join(pack_blocks) + "\n"
                     + "\n".join(even_blocks))
    return "\n".join(parts) + "}\n"


def rowpair_block(i, zO_names=None):
    """One row-pair of the pass2 E/O/EO/EEE/EEO build. With zO_names,
    the O value is produced directly as SVE registers (bridge view of the
    same NEON loads), avoiding the O[] array and register-file moves."""
    head = """\
        {
            const int16x8_t s0_lo = vld1q_s16(src + %d * line);
            const int16x8_t s0_hi = rev16(vld1q_s16(src + %d * line + 8));
            const int16x8_t s1_lo = vld1q_s16(src + %d * line);
            const int16x8_t s1_hi = rev16(vld1q_s16(src + %d * line + 8));

            const int32x4_t E00 = vaddl_s16(vget_low_s16(s0_lo),
                                            vget_low_s16(s0_hi));
            const int32x4_t E01 = vaddl_s16(vget_high_s16(s0_lo),
                                            vget_high_s16(s0_hi));
            const int32x4_t E10 = vaddl_s16(vget_low_s16(s1_lo),
                                            vget_low_s16(s1_hi));
            const int32x4_t E11 = vaddl_s16(vget_high_s16(s1_lo),
                                            vget_high_s16(s1_hi));
""" % (i, i, i + 1, i + 1)
    if zO_names:
        head += """\
            %s = svsub_s16_x(p16q,
                svset_neonq_s16(svundef_s16(), s0_lo),
                svset_neonq_s16(svundef_s16(), s0_hi));
            %s = svsub_s16_x(p16q,
                svset_neonq_s16(svundef_s16(), s1_lo),
                svset_neonq_s16(svundef_s16(), s1_hi));
""" % (zO_names[0], zO_names[1])
    else:
        head += """\
            O[i + 0] = vsubq_s16(s0_lo, s0_hi);
            O[i + 1] = vsubq_s16(s1_lo, s1_hi);
"""
    head += """\
            EO[%d + 0] = vsubq_s32(E00, rev32(E01));
            EO[%d + 1] = vsubq_s32(E10, rev32(E11));

            const int32x4_t EE0 = vaddq_s32(E00, rev32(E01));
            const int32x4_t EE1 = vaddq_s32(E10, rev32(E11));
            const int32x4_t t0 = vreinterpretq_s32_s64(
                vzip1q_s64(vreinterpretq_s64_s32(EE0),
                           vreinterpretq_s64_s32(EE1)));
            const int32x4_t t1 = vrev64q_s32(vreinterpretq_s32_s64(
                vzip2q_s64(vreinterpretq_s64_s32(EE0),
                           vreinterpretq_s64_s32(EE1))));

            EEE[%d] = vaddq_s32(t0, t1);
            EEO[%d] = vsubq_s32(t0, t1);
        }
""" % (i, i, i // 2, i // 2)
    return head


def rowpair_block_named(i, zO0, zO1, eo0, eo1, eee, eeo,
                        eo16_0=None, eo16_1=None):
    """One row-pair producing named zO/EO/EEE/EEO locals (no arrays)."""
    return """\
        {
            const int16x8_t s0_lo = vld1q_s16(src + %d * line);
            const int16x8_t s0_hi = rev16(vld1q_s16(src + %d * line + 8));
            const int16x8_t s1_lo = vld1q_s16(src + %d * line);
            const int16x8_t s1_hi = rev16(vld1q_s16(src + %d * line + 8));
            const int32x4_t E00 = vaddl_s16(vget_low_s16(s0_lo),
                                            vget_low_s16(s0_hi));
            const int32x4_t E01 = vaddl_s16(vget_high_s16(s0_lo),
                                            vget_high_s16(s0_hi));
            const int32x4_t E10 = vaddl_s16(vget_low_s16(s1_lo),
                                            vget_low_s16(s1_hi));
            const int32x4_t E11 = vaddl_s16(vget_high_s16(s1_lo),
                                            vget_high_s16(s1_hi));
            %s = svsub_s16_x(p16q,
                svset_neonq_s16(svundef_s16(), s0_lo),
                svset_neonq_s16(svundef_s16(), s0_hi));
            %s = svsub_s16_x(p16q,
                svset_neonq_s16(svundef_s16(), s1_lo),
                svset_neonq_s16(svundef_s16(), s1_hi));
            %s = vsubq_s32(E00, rev32(E01));
            %s = vsubq_s32(E10, rev32(E11));
            const int32x4_t EE0 = vaddq_s32(E00, rev32(E01));
            const int32x4_t EE1 = vaddq_s32(E10, rev32(E11));
            const int32x4_t t0 = vreinterpretq_s32_s64(
                vzip1q_s64(vreinterpretq_s64_s32(EE0),
                           vreinterpretq_s64_s32(EE1)));
            const int32x4_t t1 = vrev64q_s32(vreinterpretq_s32_s64(
                vzip2q_s64(vreinterpretq_s64_s32(EE0),
                           vreinterpretq_s64_s32(EE1))));
            %s = vaddq_s32(t0, t1);
            %s = vsubq_s32(t0, t1);
%s
        }
""" % (i, i, i + 1, i + 1, zO0, zO1, eo0, eo1, eee, eeo,
       ("            %s = vmovn_s32(%s);\n            %s = vmovn_s32(%s);\n"
        % (eo16_0, eo0, eo16_1, eo1)) if eo16_0 else "")


def even_dots_group(g, eo0, eo1, eo2, eo3, eee0, eee1, eeo0, eeo1,
                    skip_4lane=False, sat_narrow=False):
    """Even-k dots for one 4-row group, reading named EO/EEE/EEO locals."""
    base = 4 * g
    op = "vqrshrn_n_s32" if sat_narrow else "vrshrn_n_s32"
    k2 = ""
    if not skip_4lane:
        k2 = (
            "        for (int k = 2; k < 16; k += 4)\n"
            "        {\n"
            "            const int32x4_t c0 = vld1q_s32(GT16_S32[(k - 2) / 4]);\n"
            "            const int32x4_t t0 = vmulq_s32(c0, %s);\n"
            "            const int32x4_t t1 = vmulq_s32(c0, %s);\n"
            "            const int32x4_t t2 = vmulq_s32(c0, %s);\n"
            "            const int32x4_t t3 = vmulq_s32(c0, %s);\n"
            "            const int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),\n"
            "                                           vpaddq_s32(t2, t3));\n"
            "            const int16x4_t res = %s(t, shift);\n"
            "            vst1_s16(dst + k * line + %d, res);\n"
            "        }\n" % (eo0, eo1, eo2, eo3, op, base))
    tail = (
        "        {\n"
        "            const int32x4_t c0 = vld1q_s32(T8E[0]);\n"
        "            const int32x4_t c4 = vld1q_s32(T8E[1]);\n"
        "            const int32x4_t c8 = vld1q_s32(T8E[2]);\n"
        "            const int32x4_t c12 = vld1q_s32(T8E[3]);\n"
        "            const int32x4_t t0 = vpaddq_s32(%s, %s);\n"
        "            const int16x4_t res0 = %s(vmulq_s32(c0, t0), shift);\n"
        "            vst1_s16(dst + 0 * line + %d, res0);\n"
        "            const int32x4_t t2 = vmulq_s32(c4, %s);\n"
        "            const int32x4_t t3 = vmulq_s32(c4, %s);\n"
        "            const int16x4_t res4 = %s(vpaddq_s32(t2, t3), shift);\n"
        "            vst1_s16(dst + 4 * line + %d, res4);\n"
        "            const int32x4_t t4 = vmulq_s32(c8, %s);\n"
        "            const int32x4_t t5 = vmulq_s32(c8, %s);\n"
        "            const int16x4_t res8 = %s(vpaddq_s32(t4, t5), shift);\n"
        "            vst1_s16(dst + 8 * line + %d, res8);\n"
        "            const int32x4_t t6 = vmulq_s32(c12, %s);\n"
        "            const int32x4_t t7 = vmulq_s32(c12, %s);\n"
        "            const int16x4_t res12 = %s(vpaddq_s32(t6, t7), shift);\n"
        "            vst1_s16(dst + 12 * line + %d, res12);\n"
        "        }\n"
        % (eee0, eee1, op, base, eeo0, eeo1, op, base,
           eee0, eee1, op, base, eeo0, eeo1, op, base))
    return k2 + tail


def pack_group(g):
    base = 4 * g
    return """\
        {
            const svint16_t PO01 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            const svint16_t PO23 = svtbl2_s16(
                svcreate2_s16(zO%d, zO%d), iloq);
            QO0_%d = svtbl2_s16(svcreate2_s16(PO01, PO23), q0q);
            QO1_%d = svtbl2_s16(svcreate2_s16(PO01, PO23), q1q);
        }""" % (base, base + 1, base + 2, base + 3, g, g)


def pass2_odd_quarter_interleaved(k_tile=1, narrow_merge=1, legacy=0):
    """Interleaved pass2: row-pairs -> named EO/EEE/EEO -> per-group even
    dots -> packs -> odd k-loop. No EO/EEE/EEO arrays, no stack spills."""
    parts = []
    parts.append("""\
static void pass2_upstream(const int16_t* src, int16_t* dst)
{
    const int shift = 10;
    const int line = 16;
    const svbool_t p16q = svptrue_b16();
    // odd k: quarter-interleaved O packs; even path interleaved per group.
    const svbool_t p64q = svptrue_b64();
    const svbool_t p4q = svwhilelt_b16(0, 4);
    const svbool_t p8q = svwhilelt_b16(0, 8);
    const svuint16_t iloq = svld1_u16(p16q, idx_lo);
    const svuint16_t q0q = svld1_u16(p16q, idx_q0);
    const svuint16_t q1q = svld1_u16(p16q, idx_q1);
    const svuint16_t qsel = svld1_u16(p16q, idx_q0);
    const svint64_t zaccq = svdup_n_s64(0);

    svint16_t zO0, zO1, zO2, zO3, zO4, zO5, zO6, zO7;
    svint16_t zO8, zO9, zO10, zO11, zO12, zO13, zO14, zO15;
    svint16_t QO0_0, QO1_0, QO0_1, QO1_1, QO0_2, QO1_2, QO0_3, QO1_3;
    svint16_t QEOW0, QEOW1, QEOW2, QEOW3;
    int32x4_t EO_g0_0, EO_g0_1, EO_g0_2, EO_g0_3;
    int32x4_t EEE_g0, EEE_g0_1, EEO_g0, EEO_g0_1;
    int16x4_t EO16_g0_0, EO16_g0_1, EO16_g0_2, EO16_g0_3;
    int32x4_t EO_g1_0, EO_g1_1, EO_g1_2, EO_g1_3;
    int32x4_t EEE_g1, EEE_g1_1, EEO_g1, EEO_g1_1;
    int16x4_t EO16_g1_0, EO16_g1_1, EO16_g1_2, EO16_g1_3;
    int32x4_t EO_g2_0, EO_g2_1, EO_g2_2, EO_g2_3;
    int32x4_t EEE_g2, EEE_g2_1, EEO_g2, EEO_g2_1;
    int16x4_t EO16_g2_0, EO16_g2_1, EO16_g2_2, EO16_g2_3;
    int32x4_t EO_g3_0, EO_g3_1, EO_g3_2, EO_g3_3;
    int32x4_t EEE_g3, EEE_g3_1, EEO_g3, EEO_g3_1;
    int16x4_t EO16_g3_0, EO16_g3_1, EO16_g3_2, EO16_g3_3;

""")
    for g in range(4):
        base = 4 * g
        parts.append(rowpair_block_named(
            base, "zO%d" % base, "zO%d" % (base + 1),
            "EO_g%d_0" % g, "EO_g%d_1" % g,
            "EEE_g%d" % g, "EEO_g%d" % g,
            "EO16_g%d_0" % g, "EO16_g%d_1" % g))
        parts.append(rowpair_block_named(
            base + 2, "zO%d" % (base + 2), "zO%d" % (base + 3),
            "EO_g%d_2" % g, "EO_g%d_3" % g,
            "EEE_g%d_1" % g, "EEO_g%d_1" % g,
            "EO16_g%d_2" % g, "EO16_g%d_3" % g))
        parts.append(even_dots_group(
            g, "EO_g%d_0" % g, "EO_g%d_1" % g,
            "EO_g%d_2" % g, "EO_g%d_3" % g,
            "EEE_g%d" % g, "EEE_g%d_1" % g,
            "EEO_g%d" % g, "EEO_g%d_1" % g,
            skip_4lane=bool(legacy), sat_narrow=bool(legacy)))
        parts.append(pack_group(g))
        if legacy:
            parts.append("""\
        {
            const svint16_t e0 = svset_neonq_s16(
                svundef_s16(), vcombine_s16(EO16_g%d_0, vdup_n_s16(0)));
            const svint16_t e1 = svset_neonq_s16(
                svundef_s16(), vcombine_s16(EO16_g%d_1, vdup_n_s16(0)));
            const svint16_t e2 = svset_neonq_s16(
                svundef_s16(), vcombine_s16(EO16_g%d_2, vdup_n_s16(0)));
            const svint16_t e3 = svset_neonq_s16(
                svundef_s16(), vcombine_s16(EO16_g%d_3, vdup_n_s16(0)));
            const svint16_t t01 = svtbl2_s16(svcreate2_s16(e0, e1), iloq);
            const svint16_t t23 = svtbl2_s16(svcreate2_s16(e2, e3), iloq);
            QEOW%d = svtbl2_s16(svcreate2_s16(t01, t23), qsel);
        }""" % (g, g, g, g, g))

    # odd k loop: merged narrow over group pairs
    dot_blocks = []
    for t in range(k_tile):
        kexpr = "kb + %d" % (2 * t)
        dot_blocks.append(
            "            const svint16_t cq_loq%d = "
            "svld1_s16(p16q, CQ_LO[%s]);\n"
            "            const svint16_t cq_hiq%d = "
            "svld1_s16(p16q, CQ_HI[%s]);\n"
            % (t, kexpr, t, kexpr))
        dot_blocks.append(
            "            // k=%s, groups 0..3\n%s\n"
            % (kexpr, "\n".join(
                "                svint64_t d_%d_%d = "
                "svdot_s64(zaccq, QO0_%d, cq_loq%d);\n"
                "                d_%d_%d = svdot_s64(d_%d_%d, "
                "QO1_%d, cq_hiq%d);\n"
                % (g, t, g, t, g, t, g, t, g, t)
                for g in range(4))))
        dot_blocks.append(
            "            {\n"
            "                const svint32_t w01 = svuzp1_s32(\n"
            "                    svreinterpret_s32_s64(d_0_%d),\n"
            "                    svreinterpret_s32_s64(d_1_%d));\n"
            "                svint16_t n = svrshrnb_n_s32(w01, shift);\n"
            "                n = svuzp1_s16(n, n);\n"
            "                svst1_s16(p8q, dst + (%s) * line + 0, n);\n"
            "            }\n"
            "            {\n"
            "                const svint32_t w23 = svuzp1_s32(\n"
            "                    svreinterpret_s32_s64(d_2_%d),\n"
            "                    svreinterpret_s32_s64(d_3_%d));\n"
            "                svint16_t n2 = svrshrnb_n_s32(w23, shift);\n"
            "                n2 = svuzp1_s16(n2, n2);\n"
            "                svst1_s16(p8q, dst + (%s) * line + 8, n2);\n"
            "            }"
            % (t, t, kexpr, t, t, kexpr))
    parts.append("    for (int kb = 1; kb < 16; kb += %d)\n"
                 "    {\n%s\n    }\n" % (2 * k_tile, "\n".join(dot_blocks)))
    if legacy:
        even_dots = []
        for t in range(k_tile):
            kexpr = "kb + %d" % (4 * t)
            even_dots.append(
                "            {\n"
                "                const svint16_t cq_e%d = "
                "svld1_s16(p16q, CQ_LO[%s]);\n"
                "                svint64_t de0 = svdot_s64(zaccq, QEOW0, cq_e%d);\n"
                "                svint64_t de1 = svdot_s64(zaccq, QEOW1, cq_e%d);\n"
                "                svint64_t de2 = svdot_s64(zaccq, QEOW2, cq_e%d);\n"
                "                svint64_t de3 = svdot_s64(zaccq, QEOW3, cq_e%d);\n"
                "                {\n"
                "                    const svint32_t we01 = svuzp1_s32(\n"
                "                        svreinterpret_s32_s64(de0),\n"
                "                        svreinterpret_s32_s64(de1));\n"
                "                    svint16_t ne = svqrshrnb_n_s32(we01, shift);\n"
                "                    ne = svuzp1_s16(ne, ne);\n"
                "                    svst1_s16(p8q, dst + (%s) * line + 0, ne);\n"
                "                }\n"
                "                {\n"
                "                    const svint32_t we23 = svuzp1_s32(\n"
                "                        svreinterpret_s32_s64(de2),\n"
                "                        svreinterpret_s32_s64(de3));\n"
                "                    svint16_t ne2 = svqrshrnb_n_s32(we23, shift);\n"
                "                    ne2 = svuzp1_s16(ne2, ne2);\n"
                "                    svst1_s16(p8q, dst + (%s) * line + 8, ne2);\n"
                "                }\n"
                "            }\n"
                % (t, kexpr, t, t, t, t, kexpr, kexpr))
        parts.append("    for (int kb = 2; kb < 16; kb += %d)\n"
                     "    {\n%s\n    }\n"
                     % (4 * k_tile, "\n".join(even_dots)))
    return "\n".join(parts) + "}\n"


def pass2_cpp(pass2_layout="upstream", k_tile=1, narrow_merge=0, legacy=0):
    """pass2 body. 'upstream' matches dct16_sve exactly (E s32 vaddl,
    O s16 bridge SDOT, even path vmulq/vpaddq). 'odd-quarter' keeps the
    even-k/E/EO/EEE/EEO NEON path but replaces the odd-k per-row bridge
    SDOT block with the quarter-interleaved form (2 SDOT + 1 add per k
    per 4-row group + pure-SVE narrow)."""
    if pass2_layout == "odd-quarter":
        zO_decls = "\n".join(
            "    svint16_t zO%d;" % j for j in range(16))
        pairs = "\n".join(
            rowpair_block(i, zO_names=("zO%d" % i, "zO%d" % (i + 1)))
            for i in range(0, 16, 2))
        prelude = """\
static void pass2_upstream(const int16_t* src, int16_t* dst)
{
    const int shift = 10;
    const int line = 16;

    const svbool_t p16q = svptrue_b16();
    int32x4_t EO[16];
    int32x4_t EEE[8];
    int32x4_t EEO[8];

%s
%s
"""
        prelude = prelude % (zO_decls, pairs)
    else:
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
        if narrow_merge:
            return pass2_odd_quarter_interleaved(k_tile=k_tile, legacy=legacy)
        return prelude + pass2_odd_quarter_cpp(k_tile=k_tile,
                                               narrow_merge=0)
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


def quarter_dot_compute(g, kexpr, lo, hi):
    """4-row quarter dot without narrow/store (for merged narrow)."""
    return (
        "            const svint16_t x0_%d = (%s & 1) ? QO0_%d : QE0_%d;\n"
        "            const svint16_t x1_%d = (%s & 1) ? QO1_%d : QE1_%d;\n"
        "            svint64_t d_%d = svdot_s64(zacc, x0_%d, %s);\n"
        "            d_%d = svdot_s64(d_%d, x1_%d, %s);\n"
        % (g, kexpr, g, g, g, kexpr, g, g, g, g, lo, g, g, g, hi))


def merged_narrow(g0, g1, kexpr, row_base):
    """Narrow two 4-row groups into one 8-lane store."""
    return (
        "            {\n"
        "                const svint32_t w = svuzp1_s32(\n"
        "                    svreinterpret_s32_s64(d_%d),\n"
        "                    svreinterpret_s32_s64(d_%d));\n"
        "                svint16_t n = svrshrnb_n_s32(w, shift);\n"
        "                n = svuzp1_s16(n, n);\n"
        "                svst1_s16(p8h, dst + 16 * (%s) + %d, n);\n"
        "            }" % (g0, g1, kexpr, row_base))


def quarter_pass_cpp(k_tile=2, narrow_merge=0):
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
        if narrow_merge:
            body = "\n".join(quarter_dot_compute(g, kexpr, lo, hi)
                             for g in range(4))
            body += "\n" + merged_narrow(0, 1, kexpr, 0)
            body += "\n" + merged_narrow(2, 3, kexpr, 8)
        else:
            body = "\n".join(quarter_dot_group(g, kexpr, lo, hi)
                             for g in range(4))
        tiles.append("{\n%s\n%s\n        }" % (header, body))
    dot_src = ("    for (int kb = 0; kb < 16; kb += %d)\n    {\n%s\n    }\n"
               % (k_tile, "\n".join(tiles)))
    return """\
template <int shift>
static void pass_quarter(const int16_t* src, int16_t* dst, intptr_t stride)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p64 = svptrue_b64();
    const svbool_t p4h = svwhilelt_b16(0, 4);
    const svbool_t p8h = svwhilelt_b16(0, 8);
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
         pass2_layout="upstream", pass1_k_tile=2, pass2_k_tile=1,
         narrow_merge=0, legacy_semantics=0):
    rows = const_rows_cpp()
    t8e = t8_even_cpp()
    g32 = gt16_s32_cpp()
    cq_lo, cq_hi = quarter_consts_cpp()
    build_src = "\n".join(build_block(i) for i in range(16))
    dot_src = "\n".join(group_block(g) for g in range(4))
    quarter_src = quarter_pass_cpp(k_tile=pass1_k_tile,
                                   narrow_merge=narrow_merge)
    pass2_src = pass2_cpp(pass2_layout, k_tile=pass2_k_tile,
                          narrow_merge=narrow_merge, legacy=legacy_semantics)
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
    text = """\
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
    if legacy_semantics:
        text = text.replace("svrshrnb_n_s32", "svqrshrnb_n_s32")
    return text


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
