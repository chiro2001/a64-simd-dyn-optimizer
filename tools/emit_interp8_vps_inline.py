"""Inlined interp8 vert_ps emitter (AGO / GCC12-outline fix).

Reproduces the upstream interp8_vert_ps_neon dataflow with the
filter8_u8x16/u8x8 helpers forced inline (always_inline), removing the
`bl` outline + stack round-trip that costs ~1.5-2.0x on 920B.
Semantics are bit-exact with the upstream template (20k differential
per shape).
"""

FILTER16 = {}
FILTER16[1] = """\
    const uint8x16_t f0 = vdupq_n_u8(4);
    const uint8x16_t f1 = vdupq_n_u8(10);
    const uint8x16_t f2 = vdupq_n_u8(58);
    const uint8x16_t f3 = vdupq_n_u8(17);
    const uint8x16_t f4 = vdupq_n_u8(5);
    uint16x8_t t0 = vsubl_u8(vget_low_u8(s[6]), vget_low_u8(s[0]));
    t0 = vaddq_u16(c, t0);
    t0 = vmlal_u8(t0, vget_low_u8(s[1]), vget_low_u8(f0));
    t0 = vmlsl_u8(t0, vget_low_u8(s[2]), vget_low_u8(f1));
    t0 = vmlal_u8(t0, vget_low_u8(s[3]), vget_low_u8(f2));
    t0 = vmlal_u8(t0, vget_low_u8(s[4]), vget_low_u8(f3));
    t0 = vmlsl_u8(t0, vget_low_u8(s[5]), vget_low_u8(f4));
    d0 = vreinterpretq_s16_u16(t0);
    uint16x8_t t1 = vsubl_u8(vget_high_u8(s[6]), vget_high_u8(s[0]));
    t1 = vaddq_u16(c, t1);
    t1 = vmlal_u8(t1, vget_high_u8(s[1]), vget_high_u8(f0));
    t1 = vmlsl_u8(t1, vget_high_u8(s[2]), vget_high_u8(f1));
    t1 = vmlal_u8(t1, vget_high_u8(s[3]), vget_high_u8(f2));
    t1 = vmlal_u8(t1, vget_high_u8(s[4]), vget_high_u8(f3));
    t1 = vmlsl_u8(t1, vget_high_u8(s[5]), vget_high_u8(f4));
    d1 = vreinterpretq_s16_u16(t1);"""
FILTER16[2] = """\
    int16x8_t t0 = vreinterpretq_s16_u16(vaddl_u8(vget_low_u8(s[3]),
                                                  vget_low_u8(s[4])));
    int16x8_t t1 = vreinterpretq_s16_u16(vaddl_u8(vget_low_u8(s[2]),
                                                  vget_low_u8(s[5])));
    int16x8_t t2 = vreinterpretq_s16_u16(vaddl_u8(vget_low_u8(s[1]),
                                                  vget_low_u8(s[6])));
    int16x8_t t3 = vreinterpretq_s16_u16(vaddl_u8(vget_low_u8(s[0]),
                                                  vget_low_u8(s[7])));
    d0 = vreinterpretq_s16_u16(c);
    d0 = vmlaq_n_s16(d0, t0, 40);
    d0 = vmlaq_n_s16(d0, t1, -11);
    d0 = vmlaq_n_s16(d0, t2, 4);
    d0 = vmlaq_n_s16(d0, t3, -1);
    int16x8_t t4 = vreinterpretq_s16_u16(vaddl_u8(vget_high_u8(s[3]),
                                                  vget_high_u8(s[4])));
    int16x8_t t5 = vreinterpretq_s16_u16(vaddl_u8(vget_high_u8(s[2]),
                                                  vget_high_u8(s[5])));
    int16x8_t t6 = vreinterpretq_s16_u16(vaddl_u8(vget_high_u8(s[1]),
                                                  vget_high_u8(s[6])));
    int16x8_t t7 = vreinterpretq_s16_u16(vaddl_u8(vget_high_u8(s[0]),
                                                  vget_high_u8(s[7])));
    d1 = vreinterpretq_s16_u16(c);
    d1 = vmlaq_n_s16(d1, t4, 40);
    d1 = vmlaq_n_s16(d1, t5, -11);
    d1 = vmlaq_n_s16(d1, t6, 4);
    d1 = vmlaq_n_s16(d1, t7, -1);"""
FILTER16[3] = """\
    const uint8x16_t f0 = vdupq_n_u8(4);
    const uint8x16_t f1 = vdupq_n_u8(10);
    const uint8x16_t f2 = vdupq_n_u8(58);
    const uint8x16_t f3 = vdupq_n_u8(17);
    const uint8x16_t f4 = vdupq_n_u8(5);
    uint16x8_t t0 = vsubl_u8(vget_low_u8(s[1]), vget_low_u8(s[7]));
    t0 = vaddq_u16(c, t0);
    t0 = vmlal_u8(t0, vget_low_u8(s[6]), vget_low_u8(f0));
    t0 = vmlsl_u8(t0, vget_low_u8(s[5]), vget_low_u8(f1));
    t0 = vmlal_u8(t0, vget_low_u8(s[4]), vget_low_u8(f2));
    t0 = vmlal_u8(t0, vget_low_u8(s[3]), vget_low_u8(f3));
    t0 = vmlsl_u8(t0, vget_low_u8(s[2]), vget_low_u8(f4));
    d0 = vreinterpretq_s16_u16(t0);
    uint16x8_t t1 = vsubl_u8(vget_high_u8(s[1]), vget_high_u8(s[7]));
    t1 = vaddq_u16(c, t1);
    t1 = vmlal_u8(t1, vget_high_u8(s[6]), vget_high_u8(f0));
    t1 = vmlsl_u8(t1, vget_high_u8(s[5]), vget_high_u8(f1));
    t1 = vmlal_u8(t1, vget_high_u8(s[4]), vget_high_u8(f2));
    t1 = vmlal_u8(t1, vget_high_u8(s[3]), vget_high_u8(f3));
    t1 = vmlsl_u8(t1, vget_high_u8(s[2]), vget_high_u8(f4));
    d1 = vreinterpretq_s16_u16(t1);"""

FILTER8 = {}
FILTER8[1] = """\
    uint16x8_t t = vaddq_u16(c, vsubl_u8(s[6], s[0]));
    t = vmlal_u8(t, s[1], vdup_n_u8(4));
    t = vmlsl_u8(t, s[2], vdup_n_u8(10));
    t = vmlal_u8(t, s[3], vdup_n_u8(58));
    t = vmlal_u8(t, s[4], vdup_n_u8(17));
    t = vmlsl_u8(t, s[5], vdup_n_u8(5));
    d = vreinterpretq_s16_u16(t);"""
FILTER8[2] = """\
    int16x8_t t0 = vreinterpretq_s16_u16(vaddl_u8(s[3], s[4]));
    int16x8_t t1 = vreinterpretq_s16_u16(vaddl_u8(s[2], s[5]));
    int16x8_t t2 = vreinterpretq_s16_u16(vaddl_u8(s[1], s[6]));
    int16x8_t t3 = vreinterpretq_s16_u16(vaddl_u8(s[0], s[7]));
    d = vreinterpretq_s16_u16(c);
    d = vmlaq_n_s16(d, t0, 40);
    d = vmlaq_n_s16(d, t1, -11);
    d = vmlaq_n_s16(d, t2, 4);
    d = vmlaq_n_s16(d, t3, -1);"""
FILTER8[3] = """\
    uint16x8_t t = vaddq_u16(c, vsubl_u8(s[1], s[7]));
    t = vmlal_u8(t, s[6], vdup_n_u8(4));
    t = vmlsl_u8(t, s[5], vdup_n_u8(10));
    t = vmlal_u8(t, s[4], vdup_n_u8(58));
    t = vmlal_u8(t, s[3], vdup_n_u8(17));
    t = vmlsl_u8(t, s[2], vdup_n_u8(5));
    d = vreinterpretq_s16_u16(t);"""


def _filter16_fn(idx):
    return ('__attribute__((always_inline)) static inline void '
            'filter16_%d(const uint8x16_t* s, const uint16x8_t c,\n'
            '             int16x8_t& d0, int16x8_t& d1)\n{\n' % idx) + \
        FILTER16[idx] + "\n}\n"


def _filter8_fn(idx):
    return ('__attribute__((always_inline)) static inline void '
            'filter8_%d(const uint8x8_t* s, const uint16x8_t c,\n'
            '            int16x8_t& d)\n{\n' % idx) + \
        FILTER8[idx] + "\n}\n"


_IMPL = """\
template<int CI, int W, int H>
static void %(fn)s(const uint8_t* src, intptr_t sstride,
                   int16_t* dst, intptr_t dstride)
{
    const int offset = (unsigned)-8192;  // IF_INTERNAL_OFFS
    src -= 3 * sstride;
    const uint16x8_t c = vdupq_n_u16((uint16_t)offset);
    const int SEG = W / 16;
    for (int row = 0; row < H; row += 4)
    {
        const uint8_t* p = src + row * sstride;
        int16_t* d = dst + row * dstride;
        if (W == 8)
        {
            uint8x8_t in[11];
            for (int i = 0; i < 11; i++)
                in[i] = vld1_u8(p + i * sstride);
            for (int k = 0; k < 4; k++)
            {
                int16x8_t sum;
                filter8_%(ci)d(in + k, c, sum);
                vst1q_s16(d + k * dstride, sum);
            }
        }
        else
        {
            uint8x16_t in[SEG][11];
            for (int i = 0; i < 11; i++)
                for (int seg = 0; seg < SEG; seg++)
                    in[seg][i] = vld1q_u8(p + i * sstride + seg * 16);
            for (int k = 0; k < 4; k++)
                for (int seg = 0; seg < SEG; seg++)
                {
                    int16x8_t d0, d1;
                    filter16_%(ci)d(in[seg] + k, c, d0, d1);
                    vst1q_s16(d + k * dstride + seg * 16, d0);
                    vst1q_s16(d + k * dstride + seg * 16 + 8, d1);
                }
        }
    }
}
"""


def emit(shapes):
    """shapes: list of (W, H). Returns self-contained C++ source."""
    out = ["// Generated by tools/emit_interp8_vps_inline.py -- do not edit.",
           "#include <arm_neon.h>", "#include <stdint.h>", ""]
    for idx in (1, 2, 3):
        out.append(_filter16_fn(idx))
        out.append(_filter8_fn(idx))
    for idx in (1, 2, 3):
        out.append(_IMPL % {"ci": idx, "fn": "vps_impl_%d" % idx})
    for w, h in shapes:
        out.append(
            'extern "C" void dynopt_interp8_vps_%dx%d_sve2(\n'
            '    const uint8_t* src, intptr_t sstride,\n'
            '    int16_t* dst, intptr_t dstride, int coeffIdx)\n{\n'
            '    switch (coeffIdx)\n    {\n'
            '    case 1: vps_impl_1<1, %d, %d>(src, sstride, dst, dstride); break;\n'
            '    case 2: vps_impl_2<2, %d, %d>(src, sstride, dst, dstride); break;\n'
            '    default: vps_impl_3<3, %d, %d>(src, sstride, dst, dstride); break;\n'
            '    }\n}\n' % (w, h, w, h, w, h, w, h))
    return "\n".join(out) + "\n"


HPS_IMPL = """\
template<int CI, int W, int H>
static void hps_impl_%(ci)d(const uint8_t* src, intptr_t sstride,
                            int16_t* dst, intptr_t dstride, int isRowExt)
{
    const int offset = (unsigned)-8192;
    int blkheight = H;
    src -= 3;
    if (isRowExt)
    {
        src -= 3 * sstride;
        blkheight += 7;
    }
    const uint16x8_t c = vdupq_n_u16((uint16_t)offset);
    const int SEG = W / 16;
    for (int row = 0; row < blkheight; row++)
    {
        const uint8_t* p = src + row * sstride;
        int16_t* d = dst + row * dstride;
        if (W == 8)
        {
            uint8x8_t s[8];
            for (int i = 0; i < 8; i++)
                s[i] = vld1_u8(p + i);
            int16x8_t d0;
            filter8_%(ci)d(s, c, d0);
            vst1q_s16(d, d0);
        }
        else for (int seg = 0; seg < SEG; seg++)
        {
            uint8x16_t s[8];
            for (int i = 0; i < 8; i++)
                s[i] = vld1q_u8(p + seg * 16 + i);
            int16x8_t d0, d1;
            filter16_%(ci)d(s, c, d0, d1);
            vst1q_s16(d + seg * 16, d0);
            vst1q_s16(d + seg * 16 + 8, d1);
        }
    }
}
"""


def emit_hps(shapes):
    """shapes: list of (W, H). luma_hps inline candidates (6-arg
    filter_ps_t-like signature with isRowExt)."""
    out = ["// Generated by tools/emit_interp8_vps_inline.py -- do not edit.",
           "#include <arm_neon.h>", "#include <stdint.h>", ""]
    for idx in (1, 2, 3):
        out.append(_filter16_fn(idx))
        out.append(_filter8_fn(idx))
    for idx in (1, 2, 3):
        out.append(HPS_IMPL % {"ci": idx})
    for w, h in shapes:
        out.append(
            'extern "C" void dynopt_interp8_hps_%dx%d_sve2(\n'
            '    const uint8_t* src, intptr_t sstride,\n'
            '    int16_t* dst, intptr_t dstride, int coeffIdx, int isRowExt)\n'
            '{\n'
            '    switch (coeffIdx)\n    {\n'
            '    case 1: hps_impl_1<1, %d, %d>(src, sstride, dst, dstride, isRowExt); break;\n'
            '    case 2: hps_impl_2<2, %d, %d>(src, sstride, dst, dstride, isRowExt); break;\n'
            '    default: hps_impl_3<3, %d, %d>(src, sstride, dst, dstride, isRowExt); break;\n'
            '    }\n}\n' % (w, h, w, h, w, h, w, h))
    return "\n".join(out) + "\n"


if __name__ == "__main__":
    import sys
    shapes = [(8, 8), (16, 8), (8, 16), (16, 16), (16, 32), (32, 16),
              (32, 32), (32, 64), (64, 32), (64, 64)]
    sys.stdout.write(emit(shapes))
