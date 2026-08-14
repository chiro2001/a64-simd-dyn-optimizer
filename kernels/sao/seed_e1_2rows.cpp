// SAO edge offset class 1, 2 rows (64x2) NEON seed (docs/45).
// Mirrors processSaoCUE1_2Rows_neon: two sequential rows sharing
// upBuff1 (per-row update), same per-pixel E1 semantics.
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

static inline int8x8_t sao_sign1r(uint8x8_t a, uint8x8_t b)
{
    int16x8_t d = vreinterpretq_s16_u16(vsubl_u8(a, b));
    return vmovn_s16(vmaxq_s16(vminq_s16(d, vdupq_n_s16(1)),
                               vdupq_n_s16(-1)));
}

#define E1R_BLOCK(y, x)                                                   \
    do {                                                                  \
        uint8x8_t in0 = vld1_u8(rec + (y) * stride + (x));                \
        uint8x8_t in1 = vld1_u8(rec + ((y) + 1) * stride + (x));          \
        int8x8_t sd = sao_sign1r(in0, in1);                               \
        int8x8_t su = vld1_s8(upBuff1 + (x));                             \
        int8x8_t et = vadd_s8(vadd_s8(sd, su), vdup_n_s8(2));             \
        vst1_s8(upBuff1 + (x), vneg_s8(sd));                              \
        int16x8_t t1 = vmovl_s8(vtbl1_s8(tbl, et));                       \
        vst1_u8(rec + (y) * stride + (x),                                 \
                vqmovun_s16(vreinterpretq_s16_u16(                       \
                    vaddw_u8(vreinterpretq_u16_s16(t1), in0))));          \
    } while (0)

#define E1R_ROW(y)                                                        \
    do {                                                                  \
        E1R_BLOCK(y, 0);   E1R_BLOCK(y, 8);   E1R_BLOCK(y, 16);           \
        E1R_BLOCK(y, 24);  E1R_BLOCK(y, 32);  E1R_BLOCK(y, 40);           \
        E1R_BLOCK(y, 48);  E1R_BLOCK(y, 56);                              \
    } while (0)

extern "C" void dynopt_sao_e1_2rows_64x2(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo, intptr_t stride)
{
    int8x8_t tbl = vld1_s8(offsetEo);
    E1R_ROW(0);
    E1R_ROW(1);
}
