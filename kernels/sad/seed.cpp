// SAD 16x16 NEON seed (ACLE): u8 abs-diff + across-vector reduction per
// row, straight-line (docs/41). Upstream aarch64 sad is assembly
// (sad-neon-dotprod.S), so the seed is the C/ACLE semantics; the
// roundtrip gate validates it bit-exactly against
// x265_pixel_sad_16x16_neon_dotprod.
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

#define SAD_ROW(r)                                                    \
    do {                                                              \
        uint8x16_t x_##r = vld1q_u8(a + (r) * sa);                    \
        uint8x16_t y_##r = vld1q_u8(b + (r) * sb);                    \
        acc += vaddlvq_u8(vabdq_u8(x_##r, y_##r));                    \
    } while (0)

extern "C" int dynopt_sad_16x16_neon(
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
    return (int)acc;
}
