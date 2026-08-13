#!/usr/bin/env python3
"""Parameterized SVE2 (VL=256) emitter for DCT32, upstream-exact (v1).

Structure (mirrors x265 pass1/pass2Butterfly32_sve, 8-bit depth contract):
  - per row: E/O leaves are 16-lane (s[j] +/- s[31-j]), one z-register each;
    EE/EO, EEE/EEO, EEEE/EEEO via half-reverse TBL + add/sub;
  - leaves are spilled to local buffers (sizeless SVE types cannot live in
    arrays), then four k-families consume them:
      k odd      : full 16-term SDOT .d (16 lanes -> 4 s64 partials) + UADDV
      k = 2 mod 4: 8-term SDOT .d on the low 8 lanes + UADDV
      k = 4 mod 8: 4-term vmul on EEO (widened to s32) + UADDV
      k = 0 mod 8: 2-term t8_even muls on EEEE/EEEO (scalar round in v1)
  - rounding matches vrshrn (add half then arithmetic shift).

This is the correctness/plumbing baseline; count optimization (constant
pre-arrangement, row-pair packing, [C|C] duplication) is the next iteration.
"""

import argparse

from dct32_constants import GT32


def cpp_constants():
    lines = []
    lines.append("static const int16_t C32[32][16] = {")
    for k in range(32):
        body = ", ".join(str(GT32[k][j]) for j in range(16))
        lines.append("    { %s }," % body)
    lines.append("};")
    # k = 4 mod 8 family coefficients.
    lines.append("static const int32_t K4[4][4] = {")
    for k in (4, 12, 20, 28):
        body = ", ".join(str(GT32[k][j]) for j in range(4))
        lines.append("    { %s },  // k=%d" % (body, k))
    lines.append("};")
    # k = 0 mod 8 family coefficients (t8_even equivalent).
    lines.append("static const int32_t K0[4][4] = {")
    for k in (0, 8, 16, 24):
        body = ", ".join(str(GT32[k][j]) for j in range(4))
        lines.append("    { %s },  // k=%d" % (body, k))
    lines.append("};")
    # k = 2 mod 4 family: 8 s32 coefficients.
    lines.append("static const int32_t K2[8][8] = {")
    for k in range(2, 32, 4):
        body = ", ".join(str(GT32[k][j]) for j in range(8))
        lines.append("    { %s },  // k=%d" % (body, k))
    lines.append("};")
    # Odd-k slice constants: 16 lanes = g[4m..4m+3] repeated 4x so one
    # SDOT .s computes the same 4-coefficient group for 4 rows.
    lines.append("static const int16_t CODD[16][4][16] = {")
    for kk in range(16):
        k = 2 * kk + 1
        lines.append("    {")
        for m in range(4):
            body = ", ".join(str(GT32[k][4 * m + j]) for j in range(4))
            lines.append("        { %s, %s, %s, %s },  // m=%d"
                         % (body, body, body, body, m))
        lines.append("    },  // k=%d" % k)
    lines.append("};")
    # k=2 mod 4 slice constants (pass1, s16 EO): [g[0..3]]x4 / [g[4..7]]x4.
    lines.append("static const int16_t K2S[8][2][16] = {")
    for kk in range(8):
        k = 4 * kk + 2
        lines.append("    {")
        for m in range(2):
            body = ", ".join(str(GT32[k][4 * m + j]) for j in range(4))
            lines.append("        { %s, %s, %s, %s },  // m=%d"
                         % (body, body, body, body, m))
        lines.append("    },  // k=%d" % k)
    lines.append("};")
    return "\n".join(lines)


def leaf_build_cpp():
    return """\
static void leaf32(const int16_t* src, intptr_t stride, int shift,
                   int16_t* dst)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svbool_t pg4 = svwhilelt_b16(0, 4);
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svuint16_t rev8 = svld1_u16(p16, IDX_REV8);
    const svuint16_t rev4 = svld1_u16(p16, IDX_REV4);
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);

    int16_t* outE = dst;            // 32 x 16
    int16_t* outO = outE + 32 * 16;
    int32_t* outEO = (int32_t*)(outO + 32 * 16);      // 32 x 8 s32
    int32_t* outEEO = outEO + 32 * 8;
    int32_t* outEEEE = outEEO + 32 * 4;
    int32_t* outEEEO = outEEEE + 32 * 2;

    for (int i = 0; i < 32; i++)
    {
        svint16_t lo = svld1_s16(p16, src + i * stride);
        svint16_t hi = svld1_s16(p16, src + i * stride + 16);
        svint16_t rv = svrev_s16(hi);
        svint16_t O = svsub_s16_x(p16, lo, rv);
        svst1_s16(p16, outO + i * 16, O);

        // E in s32 (upstream widens; s16 would wrap for pass2 inputs):
        // NOTE: svaddlb/svaddlt are PER-128-BIT-SEGMENT even/odd (not
        // low/high), so widen lo/rv halves first, then add in s32.
        svint32_t loa = svunpklo_s32(lo), lob = svunpkhi_s32(lo);
        svint32_t rva = svunpklo_s32(rv), rvb = svunpkhi_s32(rv);
        svint32_t Ea = svadd_s32_x(p8s, loa, rva);   // E[0..7]
        svint32_t Eb = svadd_s32_x(p8s, lob, rvb);   // E[8..15]

        // EE/EO: E[j] +/- E[15-j]; E[15..8] is the full reverse of Eb.
        svint32_t Erb = svrev_s32(Eb);
        svint32_t EE = svadd_s32_x(p8s, Ea, Erb);
        svint32_t EO = svsub_s32_x(p8s, Ea, Erb);
        svst1_s32(p8s, outEO + i * 8, EO);

        // EEE/EEO: EE[j] +/- EE[7-j] (reverse the 8 s32 lanes).
        svint32_t EEr = svrev_s32(EE);
        svint32_t EEE = svadd_s32_x(p8s, EE, EEr);
        svint32_t EEO = svsub_s32_x(p8s, EE, EEr);
        svst1_s32(pg4s, outEEO + i * 4, EEO);

        // EEEE/EEEO: EEE[j] +/- EEE[3-j] (low 2 lanes meaningful).
        svint32_t EEEr = svtbl_s32(EEE, rev4s);
        svint32_t EEEE = svadd_s32_x(p8s, EEE, EEEr);
        svint32_t EEEO = svsub_s32_x(p8s, EEE, EEEr);
        svst1_s32(svwhilelt_b32(0, 2), outEEEE + i * 2, EEEE);
        svst1_s32(svwhilelt_b32(0, 2), outEEEO + i * 2, EEEO);
    }
    (void)shift;
}
"""


def pass_cpp():
    return """\
static void pass32_impl(const int16_t* src, int16_t* dst, intptr_t stride,
                        int shift)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p64 = svptrue_b64();
    const svbool_t p32 = svptrue_b32();
    const svbool_t pg8 = svwhilelt_b16(0, 8);
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svint16_t zero16 = svdup_n_s16(0);
    const svint64_t zero64 = svdup_n_s64(0);
    const int add = 1 << (shift - 1);

    // E/O: 32x16 s16; EO/EEO/EEEE/EEEO: 32x16 s32 (2 s16 each).
    int16_t leaves[32 * 32 + 32 * 16 * 2];
    leaf32(src, stride, shift, leaves);
    const int16_t* LE = leaves;
    const int16_t* LO = LE + 32 * 16;
    const int32_t* LEO = (const int32_t*)(LO + 32 * 16);
    const int32_t* LEEO = LEO + 32 * 8;
    const int32_t* LEEEE = LEEO + 32 * 4;
    const int32_t* LEEEO = LEEEE + 32 * 2;

    // k odd: full 16-term dot on O.
    for (int k = 1; k < 32; k += 2)
    {
        svint16_t c = svld1_s16(p16, C32[k]);
        int16_t* d = dst + k * 32;
        for (int i = 0; i < 32; i++)
        {
            svint16_t o = svld1_s16(p16, LO + i * 16);
            svint64_t t = svdot_s64(zero64, o, c);
            int64_t sum = svaddv_s64(p64, t);
            d[i] = (int16_t)((sum + add) >> shift);
        }
    }

    // k = 2 mod 4: 8-term mul on EO (s32, upstream pass2 form).
    for (int k = 2; k < 32; k += 4)
    {
        svint32_t c = svld1_s32(p32, K2[(k - 2) / 4]);
        int16_t* d = dst + k * 32;
        for (int i = 0; i < 32; i++)
        {
            svint32_t eo = svld1_s32(p32, LEO + i * 8);
            svint32_t t = svmul_s32_x(p32, eo, c);
            int64_t sum = (int64_t)svaddv_s32(p32, t);
            d[i] = (int16_t)((sum + add) >> shift);
        }
    }

    // k = 4 mod 8: 4-term mul on EEO (s32).
    for (int k = 4; k < 32; k += 8)
    {
        svint32_t c = svld1_s32(p32, K4[(k - 4) / 8]);
        int16_t* d = dst + k * 32;
        for (int i = 0; i < 32; i++)
        {
            svint32_t eeo = svld1_s32(pg4s, LEEO + i * 4);
            svint32_t t = svmul_s32_x(p32, eeo, c);
            int64_t sum = (int64_t)svaddv_s32(pg4s, t);
            d[i] = (int16_t)((sum + add) >> shift);
        }
    }

    // k = 0 mod 8: t8_even 2-term dots on EEEE/EEEO (v1: scalar).
    for (int i = 0; i < 32; i++)
    {
        int64_t e0 = LEEEE[i * 2 + 0], e1 = LEEEE[i * 2 + 1];
        int64_t o0 = LEEEO[i * 2 + 0], o1 = LEEEO[i * 2 + 1];
        dst[0 * 32 + i] = (int16_t)((K0[0][0] * e0 + K0[0][1] * e1 + add) >> shift);
        dst[16 * 32 + i] = (int16_t)((K0[2][0] * e0 + K0[2][1] * e1 + add) >> shift);
        dst[8 * 32 + i] = (int16_t)((K0[1][0] * o0 + K0[1][1] * o1 + add) >> shift);
        dst[24 * 32 + i] = (int16_t)((K0[3][0] * o0 + K0[3][1] * o1 + add) >> shift);
    }
}
"""


def pass_rowmajor_cpp(lazy_c24=False):
    co = "\n".join(
        "    svint16_t CO%d = svld1_s16(p16, C32[%d]);" % (kk, 2 * kk + 1)
        for kk in range(16))
    c2 = "\n".join(
        "    svint32_t C2%d = svld1_s32(p8s, K2[%d]);" % (kk, kk)
        for kk in range(8))
    c4 = "\n".join(
        "    svint32_t C4%d = svld1_s32(pg4s, K4[%d]);" % (kk, kk)
        for kk in range(4))
    odd = "\n".join(
        """\
        {
            svint64_t t = svdot_s64(zero64, O, CO%d);
            int64_t sum = svaddv_s64(p64, t);
            dst[(%d) * 32 + i] = (int16_t)((sum + add) >> shift);
        }""" % (kk, 2 * kk + 1) for kk in range(16))
    if lazy_c24:
        k2 = "\n".join(
            """\
        {
            svint32_t c = svld1_s32(p8s, K2[%d]);
            svint32_t t = svmul_s32_x(p8s, EO, c);
            int64_t sum = (int64_t)svaddv_s32(p8s, t);
            dst[(%d) * 32 + i] = (int16_t)((sum + add) >> shift);
        }""" % (kk, 4 * kk + 2) for kk in range(8))
        k4 = "\n".join(
            """\
        {
            svint32_t c = svld1_s32(pg4s, K4[%d]);
            svint32_t t = svmul_s32_x(p8s, EEO, c);
            int64_t sum = (int64_t)svaddv_s32(pg4s, t);
            dst[(%d) * 32 + i] = (int16_t)((sum + add) >> shift);
        }""" % (kk, 8 * kk + 4) for kk in range(4))
        c2 = c4 = ""
    else:
        k2 = "\n".join(
            """\
        {
            svint32_t t = svmul_s32_x(p8s, EO, C2%d);
            int64_t sum = (int64_t)svaddv_s32(p8s, t);
            dst[(%d) * 32 + i] = (int16_t)((sum + add) >> shift);
        }""" % (kk, 4 * kk + 2) for kk in range(8))
        k4 = "\n".join(
            """\
        {
            svint32_t t = svmul_s32_x(p8s, EEO, C4%d);
            int64_t sum = (int64_t)svaddv_s32(pg4s, t);
            dst[(%d) * 32 + i] = (int16_t)((sum + add) >> shift);
        }""" % (kk, 8 * kk + 4) for kk in range(4))
    return """\
static void pass32_impl(const int16_t* src, int16_t* dst, intptr_t stride,
                        int shift)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svbool_t p64 = svptrue_b64();
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svbool_t pg2s = svwhilelt_b32(0, 2);
    const svint64_t zero64 = svdup_n_s64(0);
    const int add = 1 << (shift - 1);
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);

%s
%s
%s

    for (int i = 0; i < 32; i++)
    {
        const int16_t* s = src + i * stride;
        svint16_t lo = svld1_s16(p16, s);
        svint16_t hi = svld1_s16(p16, s + 16);
        svint16_t rv = svrev_s16(hi);
        svint16_t O = svsub_s16_x(p16, lo, rv);
        svint32_t loa = svunpklo_s32(lo), lob = svunpkhi_s32(lo);
        svint32_t rva = svunpklo_s32(rv), rvb = svunpkhi_s32(rv);
        svint32_t Ea = svadd_s32_x(p8s, loa, rva);
        svint32_t Eb = svadd_s32_x(p8s, lob, rvb);
        svint32_t Erb = svrev_s32(Eb);
        svint32_t EE = svadd_s32_x(p8s, Ea, Erb);
        svint32_t EO = svsub_s32_x(p8s, Ea, Erb);
        svint32_t EEr = svrev_s32(EE);
        svint32_t EEE = svadd_s32_x(p8s, EE, EEr);
        svint32_t EEO = svsub_s32_x(p8s, EE, EEr);
        svint32_t EEEr = svtbl_s32(EEE, rev4s);
        svint32_t EEEE = svadd_s32_x(p8s, EEE, EEEr);
        svint32_t EEEO = svsub_s32_x(p8s, EEE, EEEr);

%s
%s
%s

        int32_t ee[2], oo[2];
        svst1_s32(pg2s, ee, EEEE);
        svst1_s32(pg2s, oo, EEEO);
        int64_t e0 = ee[0], e1 = ee[1], o0 = oo[0], o1 = oo[1];
        dst[0 * 32 + i] = (int16_t)((K0[0][0] * e0 + K0[0][1] * e1 + add) >> shift);
        dst[16 * 32 + i] = (int16_t)((K0[2][0] * e0 + K0[2][1] * e1 + add) >> shift);
        dst[8 * 32 + i] = (int16_t)((K0[1][0] * o0 + K0[1][1] * o1 + add) >> shift);
        dst[24 * 32 + i] = (int16_t)((K0[3][0] * o0 + K0[3][1] * o1 + add) >> shift);
    }
}
""" % (co, c2, c4, odd, k2, k4)


def pass_grouped_cpp(pass1_k2_slice=True):
    """v3: 4-row groups; odd-k uses lane-per-output SDOT .s slices +
    RSHRNB batch narrow (no per-output uaddv/fmov), mirroring the internal
    reference's structure. Even-k keeps the v2 per-row mul+saddv path.

    pass1_k2_slice: k==2 mod 4 in pass1 (shift==4) uses the sliced
    s16 SDOT .d path (v3.1, 3962); when disabled it falls back to the
    v3-era mul+saddv path (4266), making this mechanism an independent
    search axis (round-0012 P0)."""
    leaf = []
    for rr in range(4):
        r = rr
        leaf.append(("""\
        {
            const int16_t* s = src + (base + %(r)d) * stride;
            svint16_t lo%(r)d = svld1_s16(p16, s);
            svint16_t hi%(r)d = svld1_s16(p16, s + 16);
            svint16_t rv%(r)d = svrev_s16(hi%(r)d);
            O%(r)d = svsub_s16_x(p16, lo%(r)d, rv%(r)d);
            svint32_t loa%(r)d = svunpklo_s32(lo%(r)d);
            svint32_t lob%(r)d = svunpkhi_s32(lo%(r)d);
            svint32_t rva%(r)d = svunpklo_s32(rv%(r)d);
            svint32_t rvb%(r)d = svunpkhi_s32(rv%(r)d);
            svint32_t Ea%(r)d = svadd_s32_x(p8s, loa%(r)d, rva%(r)d);
            svint32_t Eb%(r)d = svadd_s32_x(p8s, lob%(r)d, rvb%(r)d);
            svint32_t Erb%(r)d = svrev_s32(Eb%(r)d);
            svint32_t EE%(r)d = svadd_s32_x(p8s, Ea%(r)d, Erb%(r)d);
            EO%(r)d = svsub_s32_x(p8s, Ea%(r)d, Erb%(r)d);
            svint16_t E16_%(r)d = svadd_s16_x(p16, lo%(r)d, rv%(r)d);
            EO16_%(r)d = svsub_s16_x(p16, E16_%(r)d, svrev_s16(E16_%(r)d));
            svint32_t EEr%(r)d = svrev_s32(EE%(r)d);
            svint32_t EEE%(r)d = svadd_s32_x(p8s, EE%(r)d, EEr%(r)d);
            EEO%(r)d = svsub_s32_x(p8s, EE%(r)d, EEr%(r)d);
            svint32_t EEEr%(r)d = svtbl_s32(EEE%(r)d, rev4s);
            EEEE%(r)d = svadd_s32_x(p8s, EEE%(r)d, EEEr%(r)d);
            EEEO%(r)d = svsub_s32_x(p8s, EEE%(r)d, EEEr%(r)d);
        }""" % {"r": r}))
    leaf = "\n".join(leaf)
    slices = []
    for m in range(4):
        slices.append("""\
        svint16_t p%d = svtbl2_s16(svcreate2_s16(O0, O1), i%d);
        svint16_t q%d = svtbl2_s16(svcreate2_s16(O2, O3), i%d);
        svint16_t X%d = svtbl2_s16(svcreate2_s16(p%d, q%d), ilo);
""" % (m, m, m, m, m, m, m))
    slices = "".join(slices)
    odd = "\n".join(
        """\
        {
            svint16_t c0 = svld1_s16(p16, CODD[%d][0]);
            svint16_t c1 = svld1_s16(p16, CODD[%d][1]);
            svint16_t c2 = svld1_s16(p16, CODD[%d][2]);
            svint16_t c3 = svld1_s16(p16, CODD[%d][3]);
            svint64_t t = svdot_s64(zero64, X0, c0);
            t = svdot_s64(t, X1, c1);
            t = svdot_s64(t, X2, c2);
            t = svdot_s64(t, X3, c3);
            svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(t),
                                      svreinterpret_s32_s64(t));
            svint16_t r = svrshrnb_n_s32(lo, shift);
            svint16_t rz = svuzp1_s16(r, r);
            svst1_s16(pg4h, dst + (%d) * 32 + base, rz);
        }""" % (kk, kk, kk, kk, 2 * kk + 1) for kk in range(16))
    ex = []
    for m in range(2):
        ex.append("""\
        svint16_t e%d = svtbl2_s16(svcreate2_s16(EO16_0, EO16_1), i%d);
        svint16_t f%d = svtbl2_s16(svcreate2_s16(EO16_2, EO16_3), i%d);
        svint16_t EX%d = svtbl2_s16(svcreate2_s16(e%d, f%d), ilo);
""" % (m, m, m, m, m, m, m))
    ex = "".join(ex)
    k2 = []
    for kk in range(8):
        d0 = 4 * kk + 2
        if pass1_k2_slice:
            k2.append("""\
        {
            if (shift == 4)
            {
                svint16_t cl = svld1_s16(p16, K2S[%d][0]);
                svint16_t ch = svld1_s16(p16, K2S[%d][1]);
                svint64_t t = svdot_s64(zero64, EX0, cl);
                t = svdot_s64(t, EX1, ch);
                svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(t),
                                          svreinterpret_s32_s64(t));
                svint16_t r = svrshrnb_n_s32(lo, shift);
                svint16_t rz = svuzp1_s16(r, r);
                svst1_s16(pg4h, dst + %d * 32 + base, rz);
            }
            else
            {
                svint32_t c = svld1_s32(p8s, K2[%d]);
                svint32_t t0 = svmul_s32_x(p8s, EO0, c);
                svint32_t t1 = svmul_s32_x(p8s, EO1, c);
                svint32_t t2 = svmul_s32_x(p8s, EO2, c);
                svint32_t t3 = svmul_s32_x(p8s, EO3, c);
                int64_t s0 = (int64_t)svaddv_s32(p8s, t0);
                int64_t s1 = (int64_t)svaddv_s32(p8s, t1);
                int64_t s2 = (int64_t)svaddv_s32(p8s, t2);
                int64_t s3 = (int64_t)svaddv_s32(p8s, t3);
                dst[%d * 32 + base + 0] = (int16_t)((s0 + add) >> shift);
                dst[%d * 32 + base + 1] = (int16_t)((s1 + add) >> shift);
                dst[%d * 32 + base + 2] = (int16_t)((s2 + add) >> shift);
                dst[%d * 32 + base + 3] = (int16_t)((s3 + add) >> shift);
            }
        }""" % (kk, kk, d0, kk, d0, d0, d0, d0))
        else:
            k2.append("""\
        {
            svint32_t c = svld1_s32(p8s, K2[%d]);
            svint32_t t0 = svmul_s32_x(p8s, EO0, c);
            svint32_t t1 = svmul_s32_x(p8s, EO1, c);
            svint32_t t2 = svmul_s32_x(p8s, EO2, c);
            svint32_t t3 = svmul_s32_x(p8s, EO3, c);
            int64_t s0 = (int64_t)svaddv_s32(p8s, t0);
            int64_t s1 = (int64_t)svaddv_s32(p8s, t1);
            int64_t s2 = (int64_t)svaddv_s32(p8s, t2);
            int64_t s3 = (int64_t)svaddv_s32(p8s, t3);
            dst[%d * 32 + base + 0] = (int16_t)((s0 + add) >> shift);
            dst[%d * 32 + base + 1] = (int16_t)((s1 + add) >> shift);
            dst[%d * 32 + base + 2] = (int16_t)((s2 + add) >> shift);
            dst[%d * 32 + base + 3] = (int16_t)((s3 + add) >> shift);
        }""" % (kk, d0, d0, d0, d0))
    k2 = "\n".join(k2)
    k4 = "\n".join(
        """\
        {
            svint32_t c = svld1_s32(pg4s, K4[%d]);
            svint32_t t0 = svmul_s32_x(p8s, EEO0, c);
            svint32_t t1 = svmul_s32_x(p8s, EEO1, c);
            svint32_t t2 = svmul_s32_x(p8s, EEO2, c);
            svint32_t t3 = svmul_s32_x(p8s, EEO3, c);
            int64_t s0 = (int64_t)svaddv_s32(pg4s, t0);
            int64_t s1 = (int64_t)svaddv_s32(pg4s, t1);
            int64_t s2 = (int64_t)svaddv_s32(pg4s, t2);
            int64_t s3 = (int64_t)svaddv_s32(pg4s, t3);
            dst[(%d) * 32 + base + 0] = (int16_t)((s0 + add) >> shift);
            dst[(%d) * 32 + base + 1] = (int16_t)((s1 + add) >> shift);
            dst[(%d) * 32 + base + 2] = (int16_t)((s2 + add) >> shift);
            dst[(%d) * 32 + base + 3] = (int16_t)((s3 + add) >> shift);
        }""" % (kk, 8 * kk + 4, 8 * kk + 4, 8 * kk + 4, 8 * kk + 4)
        for kk in range(4))
    k0 = "\n".join(
        """\
        {
        int32_t e0[2], o0[2];
        svst1_s32(pg2s, e0, EEEE%d);
        svst1_s32(pg2s, o0, EEEO%d);
        int64_t e00 = e0[0], e01 = e0[1], o00 = o0[0], o01 = o0[1];
        dst[0 * 32 + base + %d] = (int16_t)((K0[0][0] * e00 + K0[0][1] * e01 + add) >> shift);
        dst[16 * 32 + base + %d] = (int16_t)((K0[2][0] * e00 + K0[2][1] * e01 + add) >> shift);
        dst[8 * 32 + base + %d] = (int16_t)((K0[1][0] * o00 + K0[1][1] * o01 + add) >> shift);
        dst[24 * 32 + base + %d] = (int16_t)((K0[3][0] * o00 + K0[3][1] * o01 + add) >> shift);
        }
""" % (rr, rr, rr, rr, rr, rr) for rr in range(4))
    return """\
template<int shift>
__attribute__((noinline))
static void pass32_impl(const int16_t* src, int16_t* dst, intptr_t stride)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svbool_t pg4h = svwhilelt_b16(0, 4);
    const svbool_t pg2s = svwhilelt_b32(0, 2);
    const svint64_t zero64 = svdup_n_s64(0);
    const int add = 1 << (shift - 1);
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);
    const svuint16_t i0 = svld1_u16(p16, IDX_04);
    const svuint16_t i1 = svld1_u16(p16, IDX_47);
    const svuint16_t i2 = svld1_u16(p16, IDX_8B);
    const svuint16_t i3 = svld1_u16(p16, IDX_CF);
    const svuint16_t ilo = svld1_u16(p16, IDX_LO8);

    for (int g = 0; g < 8; g++)
    {
        const int base = g * 4;
        svint16_t O0, O1, O2, O3;
        svint16_t EO16_0, EO16_1, EO16_2, EO16_3;
        svint32_t EO0, EO1, EO2, EO3;
        svint32_t EEO0, EEO1, EEO2, EEO3;
        svint32_t EEEE0, EEEE1, EEEE2, EEEE3;
        svint32_t EEEO0, EEEO1, EEEO2, EEEO3;

%s
%s

%s
%s
%s
%s

%s
    }
}
""" % (leaf, slices, ex, odd, k2, k4, k0)


def emit(func_name="dynopt_dct32_sve2_shared", layout="v1",
         pass1_k2_slice=True):
    if layout == "v3":
        pass_body = pass_grouped_cpp(pass1_k2_slice=pass1_k2_slice)
    elif layout in ("v2", "v2b"):
        pass_body = pass_rowmajor_cpp(lazy_c24=(layout == "v2b"))
    else:
        pass_body = pass_cpp()
    if layout == "v3":
        call = ("    pass32_impl<4>(src, coef, srcStride);\n"
                "    pass32_impl<11>(coef, dst, 32);")
    else:
        call = ("    pass32_impl(src, coef, srcStride, shift1);\n"
                "    pass32_impl(coef, dst, 32, shift2);")
    idx = """\
static const uint16_t IDX_REV8[16] =
    { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 };
static const uint16_t IDX_REV4[16] =
    { 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 };
static const uint32_t IDX_REV4S[8] =
    { 3, 2, 1, 0, 7, 6, 5, 4 };
static const uint16_t IDX_04[16] =
    { 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 16, 17, 18, 19 };
static const uint16_t IDX_47[16] =
    { 4, 5, 6, 7, 20, 21, 22, 23, 4, 5, 6, 7, 20, 21, 22, 23 };
static const uint16_t IDX_8B[16] =
    { 8, 9, 10, 11, 24, 25, 26, 27, 8, 9, 10, 11, 24, 25, 26, 27 };
static const uint16_t IDX_CF[16] =
    { 12, 13, 14, 15, 28, 29, 30, 31, 12, 13, 14, 15, 28, 29, 30, 31 };
static const uint16_t IDX_LO8[16] =
    { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
"""
    return """\
// Generated by tools/emit_dct32_sve2_shared.py -- do not edit by hand.
// DCT32 SVE2 (VL=256), upstream-exact v1.
#include <arm_sve.h>
#include <cstdint>

%s
%s
%s
%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    const int shift1 = 4;   // 8-bit depth
    const int shift2 = 11;
    int16_t coef[32 * 32];
%s
}
""" % (idx, cpp_constants(), leaf_build_cpp(), pass_body, func_name, call)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/dct32/sve2_shared.cpp")
    ap.add_argument("--layout", default="v1")
    ap.add_argument("--pass1-k2-slice", type=int, default=1)
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(layout=args.layout,
                     pass1_k2_slice=bool(args.pass1_k2_slice)))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
