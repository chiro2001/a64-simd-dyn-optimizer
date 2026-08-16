#!/usr/bin/env python3
"""Emit a VL=128-correct DCT16 candidate by extracting upstream
pass1Butterfly16_sve / pass2Butterfly16_sve (the 8-lane E/O + sdot
structure) plus their helpers/tables.

This is the migration baseline: upstream-exact at any SVE VL, so it
validates the VL=128 candidate pipeline; structural axes (quarter
interleave, sdot scheduling) are applied on top in later increments.

Usage:
  python3 tools/emit_dct16_vl128.py [--out PATH]
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
    # Keep the trailing semicolon that terminates an object definition.
    tail = text[k + 1:].lstrip()
    if tail.startswith(";"):
        block += ";"
    return block


def _tables_sve(sve):
    return _block(sve, "const int16_t t8_odd[4][8]")


def _pass1(sve):
    return _block(sve, "static inline void pass1Butterfly16_sve")


def _pass2(sve):
    return _block(sve, "static inline void pass2Butterfly16_sve")


def _primh_block(primh, marker):
    return _block(primh, marker)


def _g_t16(constants):
    return _block(constants, "const int16_t g_t16[16][16]")


def _row_pair_block(pfx_a, pfx_b, out_idx):
    """Pass1-style pair: rows a,b -> EO (8 lanes) + EEE/EEO (4 lanes)."""
    return """\
        int32x4_t %(a)s_0 = vaddl_s16(vget_low_s16(%(a)s_lo),
                                      vget_low_s16(%(a)s_hi));
        int32x4_t %(a)s_1 = vaddl_s16(vget_high_s16(%(a)s_lo),
                                      vget_high_s16(%(a)s_hi));
        int32x4_t %(b)s_0 = vaddl_s16(vget_low_s16(%(b)s_lo),
                                      vget_low_s16(%(b)s_hi));
        int32x4_t %(b)s_1 = vaddl_s16(vget_high_s16(%(b)s_lo),
                                      vget_high_s16(%(b)s_hi));
        int16x8_t EO%(idx)s = vcombine_s16(
            vmovn_s32(vsubq_s32(%(a)s_0, rev32(%(a)s_1))),
            vmovn_s32(vsubq_s32(%(b)s_0, rev32(%(b)s_1))));
        int32x4_t e%(idx)s_0 = vaddq_s32(%(a)s_0, rev32(%(a)s_1));
        int32x4_t e%(idx)s_1 = vaddq_s32(%(b)s_0, rev32(%(b)s_1));
        int32x4_t t%(idx)s_0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(e%(idx)s_0),
                       vreinterpretq_s64_s32(e%(idx)s_1)));
        int32x4_t t%(idx)s_1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(e%(idx)s_0),
                       vreinterpretq_s64_s32(e%(idx)s_1))));
        int32x4_t EEE%(idx)s = vaddq_s32(t%(idx)s_0, t%(idx)s_1);
        int32x4_t EEO%(idx)s = vsubq_s32(t%(idx)s_0, t%(idx)s_1);
""" % {"a": pfx_a, "b": pfx_b, "idx": out_idx}


def _row_pair_block_p2(pfx_a, pfx_b, out_idx):
    """Pass2-style pair: rows a,b -> EO_a/EO_b (4 lanes each) + EEE/EEO."""
    return """\
        int32x4_t %(a)s_0 = vaddl_s16(vget_low_s16(%(a)s_lo),
                                      vget_low_s16(%(a)s_hi));
        int32x4_t %(a)s_1 = vaddl_s16(vget_high_s16(%(a)s_lo),
                                      vget_high_s16(%(a)s_hi));
        int32x4_t %(b)s_0 = vaddl_s16(vget_low_s16(%(b)s_lo),
                                      vget_low_s16(%(b)s_hi));
        int32x4_t %(b)s_1 = vaddl_s16(vget_high_s16(%(b)s_lo),
                                      vget_high_s16(%(b)s_hi));
        int32x4_t EO%(idx)s_a = vsubq_s32(%(a)s_0, rev32(%(a)s_1));
        int32x4_t EO%(idx)s_b = vsubq_s32(%(b)s_0, rev32(%(b)s_1));
        int32x4_t e%(idx)s_0 = vaddq_s32(%(a)s_0, rev32(%(a)s_1));
        int32x4_t e%(idx)s_1 = vaddq_s32(%(b)s_0, rev32(%(b)s_1));
        int32x4_t t%(idx)s_0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(e%(idx)s_0),
                       vreinterpretq_s64_s32(e%(idx)s_1)));
        int32x4_t t%(idx)s_1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(e%(idx)s_0),
                       vreinterpretq_s64_s32(e%(idx)s_1))));
        int32x4_t EEE%(idx)s = vaddq_s32(t%(idx)s_0, t%(idx)s_1);
        int32x4_t EEO%(idx)s = vsubq_s32(t%(idx)s_0, t%(idx)s_1);
""" % {"a": pfx_a, "b": pfx_b, "idx": out_idx}


def _pass1_fused():
    pairs = "".join([
        _row_pair_block("s0", "s1", "0"),
        _row_pair_block("s2", "s3", "1"),
    ])
    return """\
static inline void pass1Butterfly16_sve(const int16_t *src, int16_t *dst,
                                        intptr_t srcStride)
{
    const int shift = 3 + X265_DEPTH - 8;
    const int line = 16;

    for (int i = 0; i < line; i += 4)
    {
        int16x8_t s0_lo = vld1q_s16(src + (i + 0) * srcStride);
        int16x8_t s0_hi = rev16(vld1q_s16(src + (i + 0) * srcStride + 8));
        int16x8_t s1_lo = vld1q_s16(src + (i + 1) * srcStride);
        int16x8_t s1_hi = rev16(vld1q_s16(src + (i + 1) * srcStride + 8));
        int16x8_t s2_lo = vld1q_s16(src + (i + 2) * srcStride);
        int16x8_t s2_hi = rev16(vld1q_s16(src + (i + 2) * srcStride + 8));
        int16x8_t s3_lo = vld1q_s16(src + (i + 3) * srcStride);
        int16x8_t s3_hi = rev16(vld1q_s16(src + (i + 3) * srcStride + 8));

        int16x8_t O0 = vsubq_s16(s0_lo, s0_hi);
        int16x8_t O1 = vsubq_s16(s1_lo, s1_hi);
        int16x8_t O2 = vsubq_s16(s2_lo, s2_hi);
        int16x8_t O3 = vsubq_s16(s3_lo, s3_hi);

%s
        for (int k = 1; k < 16; k += 2)
        {
            int16x8_t c0_c4 = vld1q_s16(&g_t16[k][0]);

            int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0_c4, O0);
            int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0_c4, O1);
            int64x2_t t2 = sdotq_s16(vdupq_n_s64(0), c0_c4, O2);
            int64x2_t t3 = sdotq_s16(vdupq_n_s64(0), c0_c4, O3);

            int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            int16x4_t res = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);
            vst1_s16(dst + k * line, res);
        }

        for (int k = 2; k < 16; k += 4)
        {
            int16x8_t c0 = vld1q_s16(t8_odd[(k - 2) / 4]);

            int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0, EO0);
            int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0, EO1);

            int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            int16x4_t res = vrshrn_n_s32(t01, shift);
            vst1_s16(dst + k * line, res);
        }

        int32x4_t c0 = vld1q_s32(t8_even[0]);
        int32x4_t c4 = vld1q_s32(t8_even[1]);
        int32x4_t c8 = vld1q_s32(t8_even[2]);
        int32x4_t c12 = vld1q_s32(t8_even[3]);

        int32x4_t t0 = vpaddq_s32(EEE0, EEE1);
        int32x4_t t1 = vmulq_s32(c0, t0);
        int16x4_t res0 = vrshrn_n_s32(t1, shift);
        vst1_s16(dst + 0 * line, res0);

        int32x4_t t2 = vmulq_s32(c4, EEO0);
        int32x4_t t3 = vmulq_s32(c4, EEO1);
        int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 4 * line, res4);

        int32x4_t t4 = vmulq_s32(c8, EEE0);
        int32x4_t t5 = vmulq_s32(c8, EEE1);
        int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 8 * line, res8);

        int32x4_t t6 = vmulq_s32(c12, EEO0);
        int32x4_t t7 = vmulq_s32(c12, EEO1);
        int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 12 * line, res12);

        dst += 4;
    }
}
""" % pairs


def _pass2_fused():
    pairs = "".join([
        _row_pair_block_p2("s0", "s1", "0"),
        _row_pair_block_p2("s2", "s3", "1"),
    ])
    return """\
static inline void pass2Butterfly16_sve(const int16_t *src, int16_t *dst)
{
    const int shift = 10;
    const int line = 16;

    for (int i = 0; i < line; i += 4)
    {
        int16x8_t s0_lo = vld1q_s16(src + (i + 0) * line);
        int16x8_t s0_hi = rev16(vld1q_s16(src + (i + 0) * line + 8));
        int16x8_t s1_lo = vld1q_s16(src + (i + 1) * line);
        int16x8_t s1_hi = rev16(vld1q_s16(src + (i + 1) * line + 8));
        int16x8_t s2_lo = vld1q_s16(src + (i + 2) * line);
        int16x8_t s2_hi = rev16(vld1q_s16(src + (i + 2) * line + 8));
        int16x8_t s3_lo = vld1q_s16(src + (i + 3) * line);
        int16x8_t s3_hi = rev16(vld1q_s16(src + (i + 3) * line + 8));

        int16x8_t O0 = vsubq_s16(s0_lo, s0_hi);
        int16x8_t O1 = vsubq_s16(s1_lo, s1_hi);
        int16x8_t O2 = vsubq_s16(s2_lo, s2_hi);
        int16x8_t O3 = vsubq_s16(s3_lo, s3_hi);

%s
        for (int k = 1; k < 16; k += 2)
        {
            int16x8_t c0_c4 = vld1q_s16(&g_t16[k][0]);

            int64x2_t t0 = sdotq_s16(vdupq_n_s64(0), c0_c4, O0);
            int64x2_t t1 = sdotq_s16(vdupq_n_s64(0), c0_c4, O1);
            int64x2_t t2 = sdotq_s16(vdupq_n_s64(0), c0_c4, O2);
            int64x2_t t3 = sdotq_s16(vdupq_n_s64(0), c0_c4, O3);

            int32x4_t t01 = vcombine_s32(vmovn_s64(t0), vmovn_s64(t1));
            int32x4_t t23 = vcombine_s32(vmovn_s64(t2), vmovn_s64(t3));
            int16x4_t res = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);
            vst1_s16(dst + k * line, res);
        }

        for (int k = 2; k < 16; k += 4)
        {
            int32x4_t c0 = vld1sh_s32(&g_t16[k][0]);

            int32x4_t t0 = vmulq_s32(c0, EO0_a);
            int32x4_t t1 = vmulq_s32(c0, EO0_b);
            int32x4_t t2 = vmulq_s32(c0, EO1_a);
            int32x4_t t3 = vmulq_s32(c0, EO1_b);
            int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),
                                     vpaddq_s32(t2, t3));

            int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line, res);
        }

        int32x4_t c0 = vld1q_s32(t8_even[0]);
        int32x4_t c4 = vld1q_s32(t8_even[1]);
        int32x4_t c8 = vld1q_s32(t8_even[2]);
        int32x4_t c12 = vld1q_s32(t8_even[3]);

        int32x4_t t0 = vpaddq_s32(EEE0, EEE1);
        int32x4_t t1 = vmulq_s32(c0, t0);
        int16x4_t res0 = vrshrn_n_s32(t1, shift);
        vst1_s16(dst + 0 * line, res0);

        int32x4_t t2 = vmulq_s32(c4, EEO0);
        int32x4_t t3 = vmulq_s32(c4, EEO1);
        int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 4 * line, res4);

        int32x4_t t4 = vmulq_s32(c8, EEE0);
        int32x4_t t5 = vmulq_s32(c8, EEE1);
        int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 8 * line, res8);

        int32x4_t t6 = vmulq_s32(c12, EEO0);
        int32x4_t t7 = vmulq_s32(c12, EEO1);
        int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 12 * line, res12);

        dst += 4;
    }
}
""" % pairs


def _neon_dot8_block(kernel, pass2=False):
    """NEON odd-row dot: four 8-term dot products -> int32x4 (rows 0..3)."""
    rows = "".join(
        "            int32x4_t a%d = vmull_s16(vget_low_s16(c0_c4), "
        "vget_low_s16(O%d));\n"
        "            a%d = vmlal_s16(a%d, vget_high_s16(c0_c4), "
        "vget_high_s16(O%d));\n" % (r, r, r, r, r)
        for r in range(4))
    return rows + """\
            int32x4_t s01 = vpaddq_s32(a0, a1);
            int32x4_t s23 = vpaddq_s32(a2, a3);
            int32x4_t t = vpaddq_s32(s01, s23);
            int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line, res);
"""


def _neon_dot4_block(prefixes):
    """NEON four-term dots over s16 8-lane vectors -> int32x4 (4 columns)."""
    lines = []
    for p in prefixes:
        lines.append(
            "            int32x4_t p%d = vmull_s16(vget_low_s16(c0), "
            "vget_low_s16(%s));" % (len(lines), p))
        lines.append(
            "            int32x4_t p%d = vmull_s16(vget_high_s16(c0), "
            "vget_high_s16(%s));" % (len(lines), p))
    lines.append("            int32x4_t s01 = vpaddq_s32(p0, p1);")
    lines.append("            int32x4_t s23 = vpaddq_s32(p2, p3);")
    lines.append("            int32x4_t t = vpaddq_s32(s01, s23);")
    lines.append("            int16x4_t res = vrshrn_n_s32(t, shift);")
    lines.append("            vst1_s16(dst + k * line, res);")
    return "\n".join(lines) + "\n"


def _pass1_fused_neon():
    pairs = "".join([
        _row_pair_block("s0", "s1", "0"),
        _row_pair_block("s2", "s3", "1"),
    ])
    odd = _neon_dot8_block("dct16")
    k2 = _neon_dot4_block(["EO0", "EO1"])
    return """\
static inline void pass1Butterfly16_sve(const int16_t *src, int16_t *dst,
                                        intptr_t srcStride)
{
    const int shift = 3 + X265_DEPTH - 8;
    const int line = 16;

    for (int i = 0; i < line; i += 4)
    {
        int16x8_t s0_lo = vld1q_s16(src + (i + 0) * srcStride);
        int16x8_t s0_hi = rev16(vld1q_s16(src + (i + 0) * srcStride + 8));
        int16x8_t s1_lo = vld1q_s16(src + (i + 1) * srcStride);
        int16x8_t s1_hi = rev16(vld1q_s16(src + (i + 1) * srcStride + 8));
        int16x8_t s2_lo = vld1q_s16(src + (i + 2) * srcStride);
        int16x8_t s2_hi = rev16(vld1q_s16(src + (i + 2) * srcStride + 8));
        int16x8_t s3_lo = vld1q_s16(src + (i + 3) * srcStride);
        int16x8_t s3_hi = rev16(vld1q_s16(src + (i + 3) * srcStride + 8));

        int16x8_t O0 = vsubq_s16(s0_lo, s0_hi);
        int16x8_t O1 = vsubq_s16(s1_lo, s1_hi);
        int16x8_t O2 = vsubq_s16(s2_lo, s2_hi);
        int16x8_t O3 = vsubq_s16(s3_lo, s3_hi);

%s
        for (int k = 1; k < 16; k += 2)
        {
            int16x8_t c0_c4 = vld1q_s16(&g_t16[k][0]);
%s
        }

        for (int k = 2; k < 16; k += 4)
        {
            int16x8_t c0 = vld1q_s16(t8_odd[(k - 2) / 4]);
%s
        }

        int32x4_t c0 = vld1q_s32(t8_even[0]);
        int32x4_t c4 = vld1q_s32(t8_even[1]);
        int32x4_t c8 = vld1q_s32(t8_even[2]);
        int32x4_t c12 = vld1q_s32(t8_even[3]);

        int32x4_t t0 = vpaddq_s32(EEE0, EEE1);
        int32x4_t t1 = vmulq_s32(c0, t0);
        int16x4_t res0 = vrshrn_n_s32(t1, shift);
        vst1_s16(dst + 0 * line, res0);

        int32x4_t t2 = vmulq_s32(c4, EEO0);
        int32x4_t t3 = vmulq_s32(c4, EEO1);
        int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 4 * line, res4);

        int32x4_t t4 = vmulq_s32(c8, EEE0);
        int32x4_t t5 = vmulq_s32(c8, EEE1);
        int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 8 * line, res8);

        int32x4_t t6 = vmulq_s32(c12, EEO0);
        int32x4_t t7 = vmulq_s32(c12, EEO1);
        int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 12 * line, res12);

        dst += 4;
    }
}
""" % (pairs, odd, k2)


def _pass2_fused_neon():
    pairs = "".join([
        _row_pair_block_p2("s0", "s1", "0"),
        _row_pair_block_p2("s2", "s3", "1"),
    ])
    odd = _neon_dot8_block("dct16", pass2=True)
    return """\
static inline void pass2Butterfly16_sve(const int16_t *src, int16_t *dst)
{
    const int shift = 10;
    const int line = 16;

    for (int i = 0; i < line; i += 4)
    {
        int16x8_t s0_lo = vld1q_s16(src + (i + 0) * line);
        int16x8_t s0_hi = rev16(vld1q_s16(src + (i + 0) * line + 8));
        int16x8_t s1_lo = vld1q_s16(src + (i + 1) * line);
        int16x8_t s1_hi = rev16(vld1q_s16(src + (i + 1) * line + 8));
        int16x8_t s2_lo = vld1q_s16(src + (i + 2) * line);
        int16x8_t s2_hi = rev16(vld1q_s16(src + (i + 2) * line + 8));
        int16x8_t s3_lo = vld1q_s16(src + (i + 3) * line);
        int16x8_t s3_hi = rev16(vld1q_s16(src + (i + 3) * line + 8));

        int16x8_t O0 = vsubq_s16(s0_lo, s0_hi);
        int16x8_t O1 = vsubq_s16(s1_lo, s1_hi);
        int16x8_t O2 = vsubq_s16(s2_lo, s2_hi);
        int16x8_t O3 = vsubq_s16(s3_lo, s3_hi);

%s
        for (int k = 1; k < 16; k += 2)
        {
            int16x8_t c0_c4 = vld1q_s16(&g_t16[k][0]);
%s
        }

        for (int k = 2; k < 16; k += 4)
        {
            int32x4_t c0 = vmovl_s16(vld1_s16(&g_t16[k][0]));

            int32x4_t t0 = vmulq_s32(c0, EO0_a);
            int32x4_t t1 = vmulq_s32(c0, EO0_b);
            int32x4_t t2 = vmulq_s32(c0, EO1_a);
            int32x4_t t3 = vmulq_s32(c0, EO1_b);
            int32x4_t t = vpaddq_s32(vpaddq_s32(t0, t1),
                                     vpaddq_s32(t2, t3));

            int16x4_t res = vrshrn_n_s32(t, shift);
            vst1_s16(dst + k * line, res);
        }

        int32x4_t c0 = vld1q_s32(t8_even[0]);
        int32x4_t c4 = vld1q_s32(t8_even[1]);
        int32x4_t c8 = vld1q_s32(t8_even[2]);
        int32x4_t c12 = vld1q_s32(t8_even[3]);

        int32x4_t t0 = vpaddq_s32(EEE0, EEE1);
        int32x4_t t1 = vmulq_s32(c0, t0);
        int16x4_t res0 = vrshrn_n_s32(t1, shift);
        vst1_s16(dst + 0 * line, res0);

        int32x4_t t2 = vmulq_s32(c4, EEO0);
        int32x4_t t3 = vmulq_s32(c4, EEO1);
        int16x4_t res4 = vrshrn_n_s32(vpaddq_s32(t2, t3), shift);
        vst1_s16(dst + 4 * line, res4);

        int32x4_t t4 = vmulq_s32(c8, EEE0);
        int32x4_t t5 = vmulq_s32(c8, EEE1);
        int16x4_t res8 = vrshrn_n_s32(vpaddq_s32(t4, t5), shift);
        vst1_s16(dst + 8 * line, res8);

        int32x4_t t6 = vmulq_s32(c12, EEO0);
        int32x4_t t7 = vmulq_s32(c12, EEO1);
        int16x4_t res12 = vrshrn_n_s32(vpaddq_s32(t6, t7), shift);
        vst1_s16(dst + 12 * line, res12);

        dst += 4;
    }
}
""" % (pairs, odd)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(
        ROOT, "kernels/dct16/candidates/best_sve2_vl128.cpp"))
    ap.add_argument("--pass1", choices=("upstream", "fused"),
                    default="upstream",
                    help="pass1 structure: upstream 2-loop or fused 4-row")
    ap.add_argument("--pass2", choices=("upstream", "fused"),
                    default="upstream",
                    help="pass2 structure: upstream 2-loop or fused 4-row")
    ap.add_argument("--isa", choices=("sve2", "sve1", "neon"),
                    default="sve2",
                    help="target ISA: sve2/sve1 use sdot.d via the "
                         "neon-sve bridge; neon emits pure NEON "
                         "(vmull/vmlal), fused structure only")
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
    g_t16 = _g_t16(constants)

    if args.isa == "neon":
        pass1_src = _pass1_fused_neon()
        pass2_src = _pass2_fused_neon()
    else:
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
    variant_header = "// isa=%s pass1=%s pass2=%s\n" % (
        args.isa, args.pass1, args.pass2)

    if args.isa == "neon":
        includes = "#include <arm_neon.h>\n#include <cstdint>\n"
        helpers = ""
    else:
        includes = ("#include <arm_neon.h>\n#include <arm_sve.h>\n"
                    "#include <arm_neon_sve_bridge.h>\n#include <cstdint>\n")
        helpers = """\

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
"""

    src = """\
// Generated by tools/emit_dct16_vl128.py -- do not edit by hand.
// VL=128 migration baseline: upstream 8-lane E/O + sdot structure
// (upstream-exact at any SVE VL; structural axes applied later).
%s
// Depth-8 contract, matching the gen_verify legacy oracle.
#define X265_DEPTH 8
%s

%s

%s

%s

%s

%s

%s

%s

%s

%s

extern "C" void dynopt_dct16_sve2_shared(const int16_t* src, int16_t* dst,
                                         intptr_t srcStride)
{
    int16_t coef[16 * 16];
    pass1Butterfly16_sve(src, coef, srcStride);
    pass2Butterfly16_sve(coef, dst);
}
""" % (variant_header, includes, t8_odd := _tables_sve(sve), t8_even,
       rev_tbls, g_t16, rev16, rev32, helpers, pass1_src, pass2_src)

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as f:
        f.write(src)
    print("wrote %s (%d bytes)" % (args.out, len(src)))
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
