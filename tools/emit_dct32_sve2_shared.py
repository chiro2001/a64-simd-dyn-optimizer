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


def emit(func_name="dynopt_dct32_sve2_shared", layout="v1"):
    if layout in ("v2", "v2b"):
        pass_body = pass_rowmajor_cpp(lazy_c24=(layout == "v2b"))
    else:
        pass_body = pass_cpp()
    idx = """\
static const uint16_t IDX_REV8[16] =
    { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 };
static const uint16_t IDX_REV4[16] =
    { 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 };
static const uint32_t IDX_REV4S[8] =
    { 3, 2, 1, 0, 7, 6, 5, 4 };
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
    pass32_impl(src, coef, srcStride, shift1);
    pass32_impl(coef, dst, 32, shift2);
}
""" % (idx, cpp_constants(), leaf_build_cpp(), pass_body, func_name)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/dct32/sve2_shared.cpp")
    ap.add_argument("--layout", default="v1")
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(layout=args.layout))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
