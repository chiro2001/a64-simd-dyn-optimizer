// SAD 32x32 NEON seed (ACLE), straight-line (docs/41). Upstream aarch64
// sad is assembly; the roundtrip gate validates against
// x265_pixel_sad_32x32_neon_dotprod.
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

#define SAD_ROW(r)                                                     \
    do {                                                               \
        uint8x16_t x0_##r = vld1q_u8(a + (r) * sa);                    \
        uint8x16_t y0_##r = vld1q_u8(b + (r) * sb);                    \
        uint8x16_t x1_##r = vld1q_u8(a + (r) * sa + 16);               \
        uint8x16_t y1_##r = vld1q_u8(b + (r) * sb + 16);               \
        acc += vaddlvq_u8(vabdq_u8(x0_##r, y0_##r));                   \
        acc += vaddlvq_u8(vabdq_u8(x1_##r, y1_##r));                   \
    } while (0)

extern "C" int dynopt_sad_32x32_neon(
    const uint8_t* a, intptr_t sa, const uint8_t* b, intptr_t sb)
{
    uint32_t acc = 0;
    SAD_ROW(0);
    SAD_ROW(1);
    SAD_ROW(2);
    SAD_ROW(3);
    SAD_ROW(4);
    SAD_ROW(5);
    SAD_ROW(6);
    SAD_ROW(7);
    SAD_ROW(8);
    SAD_ROW(9);
    SAD_ROW(10);
    SAD_ROW(11);
    SAD_ROW(12);
    SAD_ROW(13);
    SAD_ROW(14);
    SAD_ROW(15);
    SAD_ROW(16);
    SAD_ROW(17);
    SAD_ROW(18);
    SAD_ROW(19);
    SAD_ROW(20);
    SAD_ROW(21);
    SAD_ROW(22);
    SAD_ROW(23);
    SAD_ROW(24);
    SAD_ROW(25);
    SAD_ROW(26);
    SAD_ROW(27);
    SAD_ROW(28);
    SAD_ROW(29);
    SAD_ROW(30);
    SAD_ROW(31);
    return (int)acc;
}
