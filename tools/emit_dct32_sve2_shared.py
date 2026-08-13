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


def _odd_row_reduce(kk):
    """Per-row 16-term dot (v2-style): 4 sdot.d + 4 uaddv per k."""
    k = 2 * kk + 1
    return """\
        {
            svint16_t c = svld1_s16(p16, C32[%d]);
            svint64_t t0 = svdot_s64(zero64, O0, c);
            svint64_t t1 = svdot_s64(zero64, O1, c);
            svint64_t t2 = svdot_s64(zero64, O2, c);
            svint64_t t3 = svdot_s64(zero64, O3, c);
            dst[%d * 32 + base + 0] =
                (int16_t)((svaddv_s64(p64, t0) + add) >> shift);
            dst[%d * 32 + base + 1] =
                (int16_t)((svaddv_s64(p64, t1) + add) >> shift);
            dst[%d * 32 + base + 2] =
                (int16_t)((svaddv_s64(p64, t2) + add) >> shift);
            dst[%d * 32 + base + 3] =
                (int16_t)((svaddv_s64(p64, t3) + add) >> shift);
        }""" % (k, k, k, k, k)


def _sve1_tbl2(a, b, idx, idxb, out):
    """SVE1 lowering of svtbl2(A, B, idx): two single-register TBLs + ORR.

    idx is a compile-time constant with lanes in [0,16) (select A) and
    [16,32) (select B); idxb is the precomputed B-table index vector:
    sentinel 16 (out of range -> 0) on A-selected lanes, idx-16 on
    B-selected lanes. Single-register SVE1 TBL returns 0 for out-of-range
    indices, so the two tables have disjoint non-zero lanes and ORR merges.
    """
    return ("svint16_t %(out)sa = svtbl_s16(%(a)s, %(idx)s);\n"
            "        svint16_t %(out)sb = svtbl_s16(%(b)s, %(idxb)s);\n"
            "        svint16_t %(out)s = svorr_s16_x(p16, %(out)sa, %(out)sb);"
            % {"a": a, "b": b, "idx": idx, "idxb": idxb, "out": out})


def _sve1_narrow(lo, shift):
    """SVE1 lowering of rshrnb inside the uzp1+rshrnb+uzp1 chain."""
    # SVE1 has no SRShR (that is SVE2), so round via add-half + ASR.
    return ("svint32_t _ra = svadd_n_s32_x(p8s, %(lo)s, add);\n"
            "            svint32_t _rs = svasr_n_s32_x(p8s, _ra, %(shift)s);\n"
            "            svint16_t rz = svuzp1_s16("
            "svreinterpret_s16_s32(_rs), svreinterpret_s16_s32(_rs));"
            % {"lo": lo, "shift": shift})


def _odd_sdot_chain(acc_split):
    """Emit the 4-term sdot.d accumulation for one odd k.

    acc_split=1: one 4-deep accumulator chain (v3.1 default).
    acc_split=2: two independent 2-deep chains + add (depth 3).
    acc_split=4: four independent sdots + tree-add (depth 2).
    """
    if acc_split == 1:
        return ("            svint64_t t = svdot_s64(zero64, X0, c0);\n"
                "            t = svdot_s64(t, X1, c1);\n"
                "            t = svdot_s64(t, X2, c2);\n"
                "            t = svdot_s64(t, X3, c3);\n")
    if acc_split == 2:
        return ("            svint64_t t0 = svdot_s64(zero64, X0, c0);\n"
                "            t0 = svdot_s64(t0, X1, c1);\n"
                "            svint64_t t1 = svdot_s64(zero64, X2, c2);\n"
                "            t1 = svdot_s64(t1, X3, c3);\n"
                "            svint64_t t = svadd_s64_x(p64, t0, t1);\n")
    if acc_split == 4:
        return ("            svint64_t t0 = svdot_s64(zero64, X0, c0);\n"
                "            svint64_t t1 = svdot_s64(zero64, X1, c1);\n"
                "            svint64_t t2 = svdot_s64(zero64, X2, c2);\n"
                "            svint64_t t3 = svdot_s64(zero64, X3, c3);\n"
                "            svint64_t t = svadd_s64_x(p64, "
                "svadd_s64_x(p64, t0, t1),\n"
                "                                       "
                "svadd_s64_x(p64, t2, t3));\n")
    raise ValueError("acc_split must be 1, 2 or 4, got %r" % (acc_split,))


def _odd_sdot_d(kk, narrow_batch=4, constant_layout="derived-replicated",
                isa="sve2", acc_split=1):
    """Lane-per-output sdot.d over 4 rows; batch or scalar narrow.

    constant_layout:
      derived-replicated - CODD[k][m] pre-replicated 4x slices (v3.1);
      canonical          - load raw C32[k] once and replicate at runtime
                           with 4 TBLs (ablation of the constant-absorption
                           mechanism).
    """
    k = 2 * kk + 1
    if constant_layout == "canonical":
        head = """\
        {
            svint16_t c = svld1_s16(p16, C32[%d]);
            svint16_t c0 = svtbl_s16(c, ic0);
            svint16_t c1 = svtbl_s16(c, ic1);
            svint16_t c2 = svtbl_s16(c, ic2);
            svint16_t c3 = svtbl_s16(c, ic3);
""" % k
    else:
        head = """\
        {
            svint16_t c0 = svld1_s16(p16, CODD[%d][0]);
            svint16_t c1 = svld1_s16(p16, CODD[%d][1]);
            svint16_t c2 = svld1_s16(p16, CODD[%d][2]);
            svint16_t c3 = svld1_s16(p16, CODD[%d][3]);
""" % (kk, kk, kk, kk)
    body = head + _odd_sdot_chain(acc_split)
    if narrow_batch == 4:
        if isa == "sve1":
            body += """\
            svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(t),
                                      svreinterpret_s32_s64(t));
            %s
            svst1_s16(pg4h, dst + %d * 32 + base, rz);
        }""" % (_sve1_narrow("lo", "shift"), k)
        else:
            body += """\
            svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(t),
                                      svreinterpret_s32_s64(t));
            svint16_t r = svrshrnb_n_s32(lo, shift);
            svint16_t rz = svuzp1_s16(r, r);
            svst1_s16(pg4h, dst + %d * 32 + base, rz);
        }""" % k
    else:
        body += """\
            int64_t tmp[4];
            svst1_s64(p64, tmp, t);
            dst[%d * 32 + base + 0] =
                (int16_t)((tmp[0] + add) >> shift);
            dst[%d * 32 + base + 1] =
                (int16_t)((tmp[1] + add) >> shift);
            dst[%d * 32 + base + 2] =
                (int16_t)((tmp[2] + add) >> shift);
            dst[%d * 32 + base + 3] =
                (int16_t)((tmp[3] + add) >> shift);
        }""" % (k, k, k, k)
    return body


def _grouped_leaf_cpp(leaf_ex=True):
    leaf = []
    for rr in range(4):
        r = rr
        eo16 = ("svint16_t E16_%(r)d = svadd_s16_x(p16, lo%(r)d, rv%(r)d);\n"
                "            EO16_%(r)d = svsub_s16_x(p16, E16_%(r)d, "
                "svrev_s16(E16_%(r)d));\n" % {"r": r}) if leaf_ex else ""
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
%(eo16)s
            svint32_t EEr%(r)d = svrev_s32(EE%(r)d);
            svint32_t EEE%(r)d = svadd_s32_x(p8s, EE%(r)d, EEr%(r)d);
            EEO%(r)d = svsub_s32_x(p8s, EE%(r)d, EEr%(r)d);
            svint32_t EEEr%(r)d = svtbl_s32(EEE%(r)d, rev4s);
            EEEE%(r)d = svadd_s32_x(p8s, EEE%(r)d, EEEr%(r)d);
            EEEO%(r)d = svsub_s32_x(p8s, EEE%(r)d, EEEr%(r)d);
        }""" % {"r": r, "eo16": eo16}))
    return "\n".join(leaf)


def _grouped_slices_cpp(isa="sve2"):
    slices = []
    for m in range(4):
        if isa == "sve1":
            slices.append(
                "        %s\n" % _sve1_tbl2("O0", "O1", "i%d" % m,
                                            "i%db" % m, "p%d" % m)
                + "        %s\n" % _sve1_tbl2("O2", "O3", "i%d" % m,
                                              "i%db" % m, "q%d" % m)
                + "        %s\n" % _sve1_tbl2("p%d" % m, "q%d" % m,
                                              "ilo", "ilob", "X%d" % m))
        else:
            slices.append("""\
        svint16_t p%d = svtbl2_s16(svcreate2_s16(O0, O1), i%d);
        svint16_t q%d = svtbl2_s16(svcreate2_s16(O2, O3), i%d);
        svint16_t X%d = svtbl2_s16(svcreate2_s16(p%d, q%d), ilo);
""" % (m, m, m, m, m, m, m))
    return "".join(slices)


def _grouped_odd_cpp(odd_lowering="sdot.d", narrow_batch=4,
                     constant_layout="derived-replicated", isa="sve2",
                     acc_split=1):
    if odd_lowering == "row-reduce":
        return "\n".join(_odd_row_reduce(kk) for kk in range(16))
    return "\n".join(_odd_sdot_d(kk, narrow_batch, constant_layout, isa,
                                 acc_split)
                     for kk in range(16))


def _grouped_ex_cpp(isa="sve2"):
    ex = []
    for m in range(2):
        if isa == "sve1":
            ex.append(
                "        %s\n" % _sve1_tbl2("EO16_0", "EO16_1", "i%d" % m,
                                            "i%db" % m, "e%d" % m)
                + "        %s\n" % _sve1_tbl2("EO16_2", "EO16_3", "i%d" % m,
                                              "i%db" % m, "f%d" % m)
                + "        %s\n" % _sve1_tbl2("e%d" % m, "f%d" % m,
                                              "ilo", "ilob", "EX%d" % m))
        else:
            ex.append("""\
        svint16_t e%d = svtbl2_s16(svcreate2_s16(EO16_0, EO16_1), i%d);
        svint16_t f%d = svtbl2_s16(svcreate2_s16(EO16_2, EO16_3), i%d);
        svint16_t EX%d = svtbl2_s16(svcreate2_s16(e%d, f%d), ilo);
""" % (m, m, m, m, m, m, m))
    return "".join(ex)


def _grouped_k2_cpp(pass1_k2_slice=True, isa="sve2"):
    k2 = []
    for kk in range(8):
        d0 = 4 * kk + 2
        if pass1_k2_slice:
            if isa == "sve1":
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
                %s
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
        }""" % (kk, kk, _sve1_narrow("lo", "shift"), d0, kk,
                d0, d0, d0, d0))
            else:
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
    return "\n".join(k2)


def _grouped_k4_cpp():
    return "\n".join(
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


def _grouped_k0_cpp():
    return "\n".join(
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


def _grouped_prologue_cpp(constant_layout="derived-replicated"):
    if constant_layout != "canonical":
        return ""
    return ("    const svuint16_t ic0 = svld1_u16(p16, IDX_C0);\n"
            "    const svuint16_t ic1 = svld1_u16(p16, IDX_C1);\n"
            "    const svuint16_t ic2 = svld1_u16(p16, IDX_C2);\n"
            "    const svuint16_t ic3 = svld1_u16(p16, IDX_C3);")


def _grouped_idx_low_cpp(isa="sve2"):
    """SVE1 needs B-table index constants (sentinel 16 on A-selected lanes)."""
    if isa != "sve1":
        return ""
    return ("    const svuint16_t i0b = svld1_u16(p16, IDX_04B);\n"
            "    const svuint16_t i1b = svld1_u16(p16, IDX_47B);\n"
            "    const svuint16_t i2b = svld1_u16(p16, IDX_8BB);\n"
            "    const svuint16_t i3b = svld1_u16(p16, IDX_CFB);\n"
            "    const svuint16_t ilob = svld1_u16(p16, IDX_LO8B);\n")


def _grouped_body_cpp(pass1_k2_slice=True, odd_lowering="sdot.d",
                      narrow_batch=4,
                      constant_layout="derived-replicated", isa="sve2",
                      acc_split=1, leaf_ex=True):
    """Assemble the grouped pass32_impl body from per-mechanism blocks
    (leaf / odd slices / k2 EX / odd / k2 / k4 / k0), each selected by an
    independent plan axis. This is the P1 increment-3 structure: no single
    composite function owns all mechanisms."""
    leaf = _grouped_leaf_cpp(leaf_ex)
    slices = _grouped_slices_cpp(isa)
    odd = _grouped_odd_cpp(odd_lowering, narrow_batch, constant_layout, isa,
                           acc_split)
    ex = _grouped_ex_cpp(isa) if leaf_ex else ""
    k2 = _grouped_k2_cpp(pass1_k2_slice, isa)
    k4 = _grouped_k4_cpp()
    k0 = _grouped_k0_cpp()
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
    const svbool_t p64 = svptrue_b64();
    const svint64_t zero64 = svdup_n_s64(0);
    const int add = 1 << (shift - 1);
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);
    const svuint16_t i0 = svld1_u16(p16, IDX_04);
    const svuint16_t i1 = svld1_u16(p16, IDX_47);
    const svuint16_t i2 = svld1_u16(p16, IDX_8B);
    const svuint16_t i3 = svld1_u16(p16, IDX_CF);
    const svuint16_t ilo = svld1_u16(p16, IDX_LO8);
%s

    for (int g = 0; g < 8; g++)
    {
        const int base = g * 4;
        svint16_t O0, O1, O2, O3;
        %s
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
""" % (_grouped_prologue_cpp(constant_layout) + _grouped_idx_low_cpp(isa),
       "        svint16_t EO16_0, EO16_1, EO16_2, EO16_3;\n"
       if leaf_ex else "",
       leaf, (slices if odd_lowering == "sdot.d" else ""),
       ex, odd, k2, k4, k0)


def pass_grouped_cpp(pass1_k2_slice=True, odd_lowering="sdot.d",
                     narrow_batch=4, constant_layout="derived-replicated",
                     isa="sve2", acc_split=1, leaf_ex=True):
    """Backward-compatible wrapper kept for the search driver's v3 preset."""
    return _grouped_body_cpp(pass1_k2_slice, odd_lowering, narrow_batch,
                             constant_layout, isa, acc_split, leaf_ex)


def _assemble(func_name, pass_body, call, isa="sve2"):
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
static const uint16_t IDX_C0[16] =
    { 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3 };
static const uint16_t IDX_C1[16] =
    { 4, 5, 6, 7, 4, 5, 6, 7, 4, 5, 6, 7, 4, 5, 6, 7 };
static const uint16_t IDX_C2[16] =
    { 8, 9, 10, 11, 8, 9, 10, 11, 8, 9, 10, 11, 8, 9, 10, 11 };
static const uint16_t IDX_C3[16] =
    { 12, 13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15 };
"""
    if isa == "sve1":
        idx += """\
// B-table indices for TBL2 lowering: sentinel 16 (-> 0) on lanes that
// select A, (idx - 16) on lanes that select B.
static const uint16_t IDX_04B[16] =
    { 16, 16, 16, 16, 0, 1, 2, 3, 16, 16, 16, 16, 0, 1, 2, 3 };
static const uint16_t IDX_47B[16] =
    { 16, 16, 16, 16, 4, 5, 6, 7, 16, 16, 16, 16, 4, 5, 6, 7 };
static const uint16_t IDX_8BB[16] =
    { 16, 16, 16, 16, 8, 9, 10, 11, 16, 16, 16, 16, 8, 9, 10, 11 };
static const uint16_t IDX_CFB[16] =
    { 16, 16, 16, 16, 12, 13, 14, 15, 16, 16, 16, 16, 12, 13, 14, 15 };
static const uint16_t IDX_LO8B[16] =
    { 16, 16, 16, 16, 16, 16, 16, 16, 0, 1, 2, 3, 4, 5, 6, 7 };
"""
    return """\
// Generated by tools/emit_dct32_sve2_shared.py -- do not edit by hand.
// DCT32 %s (VL=256), upstream-exact v1.
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
""" % ("SVE1" if isa == "sve1" else "SVE2",
       idx, cpp_constants(), leaf_build_cpp(), pass_body, func_name, call)


def emit_grouped(func_name="dynopt_dct32_sve2_shared",
                 pass1_k2_slice=True, odd_lowering="sdot.d",
                 narrow_batch=4,
                 constant_layout="derived-replicated", isa="sve2",
                 acc_split=1, leaf_ex=True):
    """Plan-driven grouped DCT32 emitter (P1 increment 3).

    Used by layout_ir.lower() for plans produced by atomic rewrites; it
    does NOT take a `layout` preset, so a rediscovered plan cannot be
    re-wrapped as `v3_like`.
    """
    call = ("    pass32_impl<4>(src, coef, srcStride);\n"
            "    pass32_impl<11>(coef, dst, 32);")
    return _assemble(func_name,
                     _grouped_body_cpp(pass1_k2_slice, odd_lowering,
                                       narrow_batch, constant_layout, isa,
                                       acc_split, leaf_ex),
                     call, isa)


def emit(func_name="dynopt_dct32_sve2_shared", layout="v1",
         pass1_k2_slice=True, odd_lowering="sdot.d", narrow_batch=4,
         constant_layout="derived-replicated", isa="sve2", acc_split=1,
         leaf_ex=True):
    if layout == "v3":
        return emit_grouped(func_name, pass1_k2_slice, odd_lowering,
                            narrow_batch, constant_layout, isa, acc_split,
                            leaf_ex)
    if layout in ("v2", "v2b"):
        pass_body = pass_rowmajor_cpp(lazy_c24=(layout == "v2b"))
        call = ("    pass32_impl(src, coef, srcStride, shift1);\n"
                "    pass32_impl(coef, dst, 32, shift2);")
    else:
        pass_body = pass_cpp()
        call = ("    pass32_impl(src, coef, srcStride, shift1);\n"
                "    pass32_impl(coef, dst, 32, shift2);")
    return _assemble(func_name, pass_body, call, isa)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/dct32/sve2_shared.cpp")
    ap.add_argument("--func-name", default="dynopt_dct32_sve2_shared")
    ap.add_argument("--layout", default="v1")
    ap.add_argument("--pass1-k2-slice", type=int, default=1)
    ap.add_argument("--odd-lowering", default="sdot.d")
    ap.add_argument("--narrow-batch", type=int, default=4)
    ap.add_argument("--constant-layout", default="derived-replicated")
    ap.add_argument("--isa", default="sve2", choices=["sve1", "sve2"])
    ap.add_argument("--acc-split", type=int, default=1, choices=[1, 2, 4])
    ap.add_argument("--leaf-ex", type=int, default=1, choices=[0, 1])
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(func_name=args.func_name,
                     layout=args.layout,
                     pass1_k2_slice=bool(args.pass1_k2_slice),
                     odd_lowering=args.odd_lowering,
                     narrow_batch=args.narrow_batch,
                     constant_layout=args.constant_layout,
                     isa=args.isa,
                     acc_split=args.acc_split,
                     leaf_ex=bool(args.leaf_ex)))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
