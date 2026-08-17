// AGO cover D (round-33 discovery): SVE2 wide-accumulate via svadalp.
// One UADALP per row (16 u8 -> 8 u16 pairwise add into accumulator)
// instead of per-row svaddv reduction. Final single svaddv_u16.
// SVE2-only (UADALP is SVE2; SVE1 has no pairwise wide accumulate) ->
// targets 950. Under --isa sve1 must report ISA REJECT.
// QEMU gate: 20000 cases, 0 mismatches vs pixel_sad_16x16_neon_dotprod
// (search_sve2_layouts --backend ago --isa sve2 --kernel sad, round 33).
#include <arm_sve.h>
#include <stdint.h>

extern "C" int dynopt_sad_16x16_sve2(const uint8_t* a, intptr_t sa,
                             const uint8_t* b, intptr_t sb)
{
    const svbool_t p8 = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svbool_t p16 = svptrue_b16();
    svuint16_t acc = svdup_u16(0);
    for (int r = 0; r < 16; r++)
    {
        svuint8_t x = svld1_u8(p8, a + r * sa);
        svuint8_t y = svld1_u8(p8, b + r * sb);
        svuint8_t d = svabd_u8_x(p8, x, y);
        acc = svadalp_u16_m(p16, acc, d);
    }
    return (int)svaddv_u16(p16, acc);
}
