// SAO edge offset class 0, width 64, 2 rows NEON seed (ACLE, docs/45).
// Mirrors x265 processSaoCUE0_neon semantics with fixed width (fully
// unrolled). For each pixel: edgeType = signRight + signLeft + 2 with
// sign = clamp(diff, -1, 1); rec += offsetEo[edgeType] (clipped).
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

static inline int8x8_t sao_sign(uint8x8_t a, uint8x8_t b)
{
    int16x8_t d = vreinterpretq_s16_u16(vsubl_u8(a, b));
    return vmovn_s16(vmaxq_s16(vminq_s16(d, vdupq_n_s16(1)),
                               vdupq_n_s16(-1)));
}

#define E0_BLOCK(y, x)                                                    \
    do {                                                                  \
        uint8x8_t in = vld1_u8(rec + (y) * stride + (x));                 \
        int8x8_t sr = sao_sign(in, vld1_u8(rec + (y) * stride + (x) + 1));\
        int8x8x2_t sh = { vneg_s8(sr), vdup_n_s8(signL) };               \
        int8x8_t edge = vtbl2_s8(sh, index);                             \
        int8x8_t et = vadd_s8(vadd_s8(sr, edge), vdup_n_s8(2));          \
        int16x8_t t1 = vmovl_s8(vtbl1_s8(tbl, et));                      \
        uint8x8_t out = vqmovun_s16(                                     \
            vreinterpretq_s16_u16(vaddw_u8(                              \
                vreinterpretq_u16_s16(t1), in)));                        \
        vst1_u8(rec + (y) * stride + (x), out);                          \
        signL = vget_lane_s8(vneg_s8(sr), 7);                            \
    } while (0)

extern "C" void dynopt_sao_e0_64_sve2(
    uint8_t* rec, int8_t* offsetEo, int8_t* signLeft, intptr_t stride)
{
    static const int8x8_t index = { 8, 0, 1, 2, 3, 4, 5, 6 };
    int8x8_t tbl = vld1_s8(offsetEo);
    int8_t signL = signLeft[0];
    E0_BLOCK(0, 0);   E0_BLOCK(0, 8);   E0_BLOCK(0, 16);  E0_BLOCK(0, 24);
    E0_BLOCK(0, 32);  E0_BLOCK(0, 40);  E0_BLOCK(0, 48);  E0_BLOCK(0, 56);
    signL = signLeft[1];
    E0_BLOCK(1, 0);   E0_BLOCK(1, 8);   E0_BLOCK(1, 16);  E0_BLOCK(1, 24);
    E0_BLOCK(1, 32);  E0_BLOCK(1, 40);  E0_BLOCK(1, 48);  E0_BLOCK(1, 56);
}
