// SAO band offset, 64x4 NEON seed (ACLE, docs/45). Mirrors
// processSaoCUB0_neon: offset index = pixel >> 3 (8-bit),
// rec = clip(rec + offset[index]).
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

#define B0_BLOCK(y, x)                                                    \
    do {                                                                  \
        uint8x8_t in = vld1_u8(rec + (y) * stride + (x));                 \
        int8x8_t idx = vreinterpret_s8_u8(vshr_n_u8(in, 3));              \
        int8x8_t offs = vtbl4_s8(table, idx);                             \
        int16x8_t t = vmovl_s8(offs);                                     \
        vst1_u8(rec + (y) * stride + (x),                                 \
                vqmovun_s16(vreinterpretq_s16_u16(                       \
                    vaddw_u8(vreinterpretq_u16_s16(t), in))));            \
    } while (0)

#define B0_ROW(y)                                                         \
    do {                                                                  \
        B0_BLOCK(y, 0);   B0_BLOCK(y, 8);   B0_BLOCK(y, 16);              \
        B0_BLOCK(y, 24);  B0_BLOCK(y, 32);  B0_BLOCK(y, 40);              \
        B0_BLOCK(y, 48);  B0_BLOCK(y, 56);                                \
    } while (0)

extern "C" void dynopt_sao_b0_64x4(
    uint8_t* rec, const int8_t* offset, intptr_t stride)
{
    int8x8x4_t table = vld1_s8_x4(offset);
    B0_ROW(0);
    B0_ROW(1);
    B0_ROW(2);
    B0_ROW(3);
}
