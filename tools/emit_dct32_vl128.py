#!/usr/bin/env python3
"""Emit a VL=128-correct DCT32 candidate by extracting upstream
pass1Butterfly32_sve / pass2Butterfly32_sve (the 8-lane E/O + sdot
structure) plus their helpers/tables, optionally with the fused
4-row quarter structure (single loop over row groups, no intermediate
O/EO/EEE arrays).

This is the DCT32 analogue of tools/emit_dct16_vl128.py.

Usage:
  python3 tools/emit_dct32_vl128.py [--out PATH]
                                    [--pass1 upstream|fused]
                                    [--pass2 upstream|fused]
"""

import argparse
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SVE = os.path.join(
    ROOT, "third_party/x265/source/common/aarch64/dct-prim-sve.cpp")
PRIMH = os.path.join(
    ROOT, "third_party/x265/source/common/aarch64/dct-prim.h")
CONSTANTS = os.path.join(
    ROOT, "third_party/x265/source/common/constants.cpp")


def _block(text, start_marker):
    i = text.index(start_marker)
    j = text.index("{", i)
    depth = 0
    k = j
    while k < len(text):
        if text[k] == "{":
            depth += 1
        elif text[k] == "}":
            depth -= 1
            if depth == 0:
                break
        k += 1
    block = text[i:k + 1].rstrip()
    tail = text[k + 1:].lstrip()
    if tail.startswith(";"):
        block += ";"
    return block


def _tables_sve(sve):
    return _block(sve, "const int16_t t8_odd[4][8]")


def _pass1(sve):
    return _block(sve, "static inline void pass1Butterfly32_sve")


def _pass2(sve):
    return _block(sve, "static inline void pass2Butterfly32_sve")


def _primh_block(primh, marker):
    return _block(primh, marker)


def _g_t32(constants):
    return _block(constants, "const int16_t g_t32[32][32]")


def _row_block(s, pass2=False):
    """Per-row E/O decomposition for the fused 4-row body."""
    if pass2:
        return """\
        int32x4_t E%(s)s_0 = vaddl_s16(vget_low_s16(in_lo_%(s)s.val[0]),
                                       vget_low_s16(in_lo_%(s)s.val[3]));
        int32x4_t E%(s)s_1 = vaddl_s16(vget_high_s16(in_lo_%(s)s.val[0]),
                                       vget_high_s16(in_lo_%(s)s.val[3]));
        int32x4_t E%(s)s_2 = vaddl_s16(vget_low_s16(in_lo_%(s)s.val[1]),
                                       vget_low_s16(in_lo_%(s)s.val[2]));
        int32x4_t E%(s)s_3 = vaddl_s16(vget_high_s16(in_lo_%(s)s.val[1]),
                                       vget_high_s16(in_lo_%(s)s.val[2]));
        int32x4_t EO%(s)s_0 = vsubq_s32(E%(s)s_0, rev32(E%(s)s_3));
        int32x4_t EO%(s)s_1 = vsubq_s32(E%(s)s_1, rev32(E%(s)s_2));
        int32x4_t EE%(s)s_0 = vaddq_s32(E%(s)s_0, rev32(E%(s)s_3));
        int32x4_t EE%(s)s_1 = vaddq_s32(E%(s)s_1, rev32(E%(s)s_2));
        int32x4_t EEO%(s)s = vsubq_s32(EE%(s)s_0, rev32(EE%(s)s_1));
        int32x4_t EEE%(s)s = vaddq_s32(EE%(s)s_0, rev32(EE%(s)s_1));
""" % {"s": s}
    return """\
        int32x4_t E%(s)s_0 = vaddl_s16(vget_low_s16(in_lo_%(s)s.val[0]),
                                       vget_low_s16(in_lo_%(s)s.val[3]));
        int32x4_t E%(s)s_1 = vaddl_s16(vget_high_s16(in_lo_%(s)s.val[0]),
                                       vget_high_s16(in_lo_%(s)s.val[3]));
        int32x4_t E%(s)s_2 = vaddl_s16(vget_low_s16(in_lo_%(s)s.val[1]),
                                       vget_low_s16(in_lo_%(s)s.val[2]));
        int32x4_t E%(s)s_3 = vaddl_s16(vget_high_s16(in_lo_%(s)s.val[1]),
                                       vget_high_s16(in_lo_%(s)s.val[2]));
        int16x8_t EO%(s)s = vcombine_s16(
            vmovn_s32(vsubq_s32(E%(s)s_0, rev32(E%(s)s_3))),
            vmovn_s32(vsubq_s32(E%(s)s_1, rev32(E%(s)s_2))));
        int32x4_t EE%(s)s_0 = vaddq_s32(E%(s)s_0, rev32(E%(s)s_3));
        int32x4_t EE%(s)s_1 = vaddq_s32(E%(s)s_1, rev32(E%(s)s_2));
        int32x4_t EEO%(s)s = vsubq_s32(EE%(s)s_0, rev32(EE%(s)s_1));
        int32x4_t EEE%(s)s = vaddq_s32(EE%(s)s_0, rev32(EE%(s)s_1));
""" % {"s": s}


def _pair_block(a, b, p):
    return """\
        int32x4_t t%(p)s_0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(EEE%(a)s),
                       vreinterpretq_s64_s32(EEE%(b)s)));
        int32x4_t t%(p)s_1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(EEE%(a)s),
                       vreinterpretq_s64_s32(EEE%(b)s))));
        int32x4_t EEEE%(p)s = vaddq_s32(t%(p)s_0, t%(p)s_1);
        int32x4_t EEEO%(p)s = vsubq_s32(t%(p)s_0, t%(p)s_1);
""" % {"a": a, "b": b, "p": p}


def _fused_body(pass2=False):
    rows = "".join(_row_block(s, pass2) for s in ("0", "1", "2", "3"))
    pairs = _pair_block("0", "1", "0") + _pair_block("2", "3", "1")
    if pass2:
        k2 = """\
            int32x4_t c0 = vld1sh_s32(&g_t32[k][0]);
            int32x4_t c1 = vld1sh_s32(&g_t32[k][4]);

            int32x4_t t0 = vmulq_s32(c0, EO0_0);
            t0 = vmlaq_s32(t0, c1, EO0_1);
            int32x4_t t1 = vmulq_s32(c0, EO1_0);
            t1 = vmlaq_s32(t1, c1, EO1_1);
            int32x4_t t2 = vmulq_s32(c0, EO2_0);
            t2 = vmlaq_s32(t2, c1, EO2_1);
            int32x4_t t3 = vmulq_s32(c0, EO3_0);
            t3 = vmlaq_s32(t3, c1, EO3_1);

            int32x4_t t0123 = vpaddq_s32(vpaddq_s32(t0, t1),
                                         vpaddq_s32(t2, t3));
            int16x4_t res = vrshrn_n_s32(t0123, shift);
            vst1_s16(dst + k * line + i, res);
"""
    else:
        k2 = """\
            int16x8_t c0 = vld1q_s16(&g_t32[k][0]);

            int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0, EO0);
            int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0, EO1);
            int64x2_t t2 = sdotq_s16(vdupq_n_s64(0), c0, EO2);
            int64x2_t t3 = sdotq_s16(vdupq_n_s64(0), c0, EO3);

            int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            int16x4_t res = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);
            vst1_s16(dst + k * line + i, res);
"""
    return """\
    for (int i = 0; i < line; i += 4)
    {
        int16x8x4_t in_lo_0 = vld1q_s16_x4(src + (i + 0) * srcStride);
        in_lo_0.val[2] = rev16(in_lo_0.val[2]);
        in_lo_0.val[3] = rev16(in_lo_0.val[3]);
        int16x8x4_t in_lo_1 = vld1q_s16_x4(src + (i + 1) * srcStride);
        in_lo_1.val[2] = rev16(in_lo_1.val[2]);
        in_lo_1.val[3] = rev16(in_lo_1.val[3]);
        int16x8x4_t in_lo_2 = vld1q_s16_x4(src + (i + 2) * srcStride);
        in_lo_2.val[2] = rev16(in_lo_2.val[2]);
        in_lo_2.val[3] = rev16(in_lo_2.val[3]);
        int16x8x4_t in_lo_3 = vld1q_s16_x4(src + (i + 3) * srcStride);
        in_lo_3.val[2] = rev16(in_lo_3.val[2]);
        in_lo_3.val[3] = rev16(in_lo_3.val[3]);

        int16x8_t O0_0 = vsubq_s16(in_lo_0.val[0], in_lo_0.val[3]);
        int16x8_t O0_1 = vsubq_s16(in_lo_0.val[1], in_lo_0.val[2]);
        int16x8_t O1_0 = vsubq_s16(in_lo_1.val[0], in_lo_1.val[3]);
        int16x8_t O1_1 = vsubq_s16(in_lo_1.val[1], in_lo_1.val[2]);
        int16x8_t O2_0 = vsubq_s16(in_lo_2.val[0], in_lo_2.val[3]);
        int16x8_t O2_1 = vsubq_s16(in_lo_2.val[1], in_lo_2.val[2]);
        int16x8_t O3_0 = vsubq_s16(in_lo_3.val[0], in_lo_3.val[3]);
        int16x8_t O3_1 = vsubq_s16(in_lo_3.val[1], in_lo_3.val[2]);

%s
%s
        for (int k = 1; k < 32; k += 2)
        {
            int16x8_t c0_c1 = vld1q_s16(&g_t32[k][0]);
            int16x8_t c2_c3 = vld1q_s16(&g_t32[k][8]);

            int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0_c1, O0_0);
            t0 = sdotq_s16(t0, c2_c3, O0_1);
            int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0_c1, O1_0);
            t1 = sdotq_s16(t1, c2_c3, O1_1);
            int64x2_t t2 = sdotq_s16(vdupq_n_s64(0), c0_c1, O2_0);
            t2 = sdotq_s16(t2, c2_c3, O2_1);
            int64x2_t t3 = sdotq_s16(vdupq_n_s64(0), c0_c1, O3_0);
            t3 = sdotq_s16(t3, c2_c3, O3_1);

            int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            int16x4_t res = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);
            vst1_s16(dst + k * line + i, res);
        }

        for (int k = 2; k < 32; k += 4)
        {
%s
        }

        for (int k = 4; k < 32; k += 8)
        {
            int32x4_t c = vld1sh_s32(&g_t32[k][0]);

            int32x4_t t0 = vmulq_s32(c, EEO0);
            int32x4_t t1 = vmulq_s32(c, EEO1);
            int32x4_t t2 = vmulq_s32(c, EEO2);
            int32x4_t t3 = vmulq_s32(c, EEO3);

            int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),
                                     vpaddq_s32(t2, t3));
            int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line + i, res);
        }

        int32x4_t c0 = vld1q_s32(t8_even[0]);
        int32x4_t c8 = vld1q_s32(t8_even[1]);
        int32x4_t c16 = vld1q_s32(t8_even[2]);
        int32x4_t c24 = vld1q_s32(t8_even[3]);

        int32x4_t t0 = vpaddq_s32(EEEE0, EEEE1);
        int32x4_t t1 = vmulq_s32(c0, t0);
        int16x4_t res0 = vrshrn_n_s32(t1, shift);
        vst1_s16(dst + 0 * line + i, res0);

        int32x4_t t2 = vmulq_s32(c8, EEEO0);
        int32x4_t t3 = vmulq_s32(c8, EEEO1);
        int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 8 * line + i, res8);

        int32x4_t t4 = vmulq_s32(c16, EEEE0);
        int32x4_t t5 = vmulq_s32(c16, EEEE1);
        int16x4_t res16 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 16 * line + i, res16);

        int32x4_t t6 = vmulq_s32(c24, EEEO0);
        int32x4_t t7 = vmulq_s32(c24, EEEO1);
        int16x4_t res24 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 24 * line + i, res24);
    }
""" % (rows, pairs, k2)


def _pass1_fused():
    return """\
static inline void pass1Butterfly32_sve(const int16_t *src, int16_t *dst,
                                        intptr_t srcStride)
{
    const int shift = 4 + X265_DEPTH - 8;
    const int line = 32;

%s
}
""" % _fused_body(pass2=False)


def _pass2_fused():
    return """\
static inline void pass2Butterfly32_sve(const int16_t *src, int16_t *dst)
{
    const int shift = 11;
    const int line = 32;

%s
}
""" % _fused_body(pass2=True).replace("srcStride", "line")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(
        ROOT, "kernels/dct32/candidates/best_sve2_vl128.cpp"))
    ap.add_argument("--pass1", choices=("upstream", "fused"),
                    default="upstream")
    ap.add_argument("--pass2", choices=("upstream", "fused"),
                    default="upstream")
    args = ap.parse_args()
    with open(SVE) as f:
        sve = f.read()
    with open(PRIMH) as f:
        primh = f.read()
    with open(CONSTANTS) as f:
        constants = f.read()

    t8_even = _primh_block(primh, "const int32_t t8_even[4][4]")
    rev_tbls = (_primh_block(primh, "const uint8_t rev16_tbl[16]")
                + "\n\n"
                + _primh_block(primh, "const uint8_t rev32_tbl[16]"))
    rev16 = _primh_block(primh, "static inline int16x8_t rev16")
    rev32 = _primh_block(primh, "static inline int32x4_t rev32")
    g_t32 = _g_t32(constants)

    if args.pass1 == "fused":
        pass1_src = _pass1_fused()
    else:
        pass1_src = _pass1(sve).replace(
            "x265_sdotq_s16", "sdotq_s16").replace(
                "x265_vld1sh_s32", "vld1sh_s32")
    if args.pass2 == "fused":
        pass2_src = _pass2_fused()
    else:
        pass2_src = _pass2(sve).replace(
            "x265_sdotq_s16", "sdotq_s16").replace(
                "x265_vld1sh_s32", "vld1sh_s32")
    variant_header = "// pass1=%s pass2=%s\n" % (args.pass1, args.pass2)

    src = """\
// Generated by tools/emit_dct32_vl128.py -- do not edit by hand.
// VL=128 migration baseline: upstream 8-lane E/O + sdot structure
// (upstream-exact at any SVE VL; structural axes applied later).
%s
// Depth-8 contract, matching the gen_verify legacy oracle.
#define X265_DEPTH 8
#include <arm_neon.h>
#include <arm_sve.h>
#include <arm_neon_sve_bridge.h>
#include <cstdint>

%s

%s

%s

%s

%s

%s

static inline int64x2_t sdotq_s16(int64x2_t acc, int16x8_t x, int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(svset_neonq_s64(svundef_s64(), acc),
                                     svset_neonq_s16(svundef_s16(), x),
                                     svset_neonq_s16(svundef_s16(), y)));
}

static inline int32x4_t vld1sh_s32(const int16_t* p)
{
    return svget_neonq_s32(svld1sh_s32(svptrue_pat_b32(SV_VL4), p));
}

%s

%s

extern "C" void dynopt_dct32_sve2_shared(const int16_t* src, int16_t* dst,
                                         intptr_t srcStride)
{
    int16_t coef[32 * 32];
    pass1Butterfly32_sve(src, coef, srcStride);
    pass2Butterfly32_sve(coef, dst);
}
""" % (variant_header, t8_odd := _tables_sve(sve), t8_even, rev_tbls,
       g_t32, rev16, rev32, pass1_src, pass2_src)

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as f:
        f.write(src)
    print("wrote %s (%d bytes)" % (args.out, len(src)))
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
