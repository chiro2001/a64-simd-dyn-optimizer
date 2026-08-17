// AGO cover B (round-34 discovery): SVE2 wide-accumulate via svadalp
// for SAD 32x32. One UADALP per row (32 u8 -> 16 u16 pairwise add into
// accumulator, full VL=256 width per row), final single svaddv_u16.
// Round-33 sad-16 finding generalized: per-row svaddv reduction (cover A)
// is the weak pattern; UADALP removes the reduction tree.
// SVE2-only (UADALP is SVE2; SVE1 has no pairwise wide accumulate).
// QEMU gate: 20000 cases, 0 mismatches vs pixel_sad_32x32_neon_dotprod
// (search_sve2_layouts --backend ago --isa sve2 --kernel sad-32, round 34).
#include <arm_sve.h>
#include <stdint.h>

extern "C" int dynopt_sad_32x32_sve2(const uint8_t* a, intptr_t sa,
                             const uint8_t* b, intptr_t sb)
{
    const svbool_t p8 = svwhilelt_b8((uint32_t)0, (uint32_t)32);
    const svbool_t p16 = svptrue_b16();
    svuint16_t acc = svdup_u16(0);
    for (int r = 0; r < 32; r++)
    {
        svuint8_t x = svld1_u8(p8, a + r * sa);
        svuint8_t y = svld1_u8(p8, b + r * sb);
        svuint8_t d = svabd_u8_x(p8, x, y);
        acc = svadalp_u16_m(p16, acc, d);
    }
    return (int)svaddv_u16(p16, acc);
}
