// SVE2 saoCuOrgB0 (64x4), upstream-exact vs x265 C semantics:
// idx = p >> 3, off = bandOffset[idx], out = clip(p + off).
//
// Lane-independent, so the whole 32-byte vector is processed at once.
// clip(p + off) is computed without widening via a 128 bias:
//   ps = p - 128 (s8, exact), s = qadd_s8(ps, off),
//   out = s + 128 via wrapping u8 add (exact mod 256; s is the clipped
//   value, so u8(s) + 128 mod 256 equals clamp(p + off, 0, 255))
// which is exactly clamp(p + off, 0, 255).
// GCC arm_sve.h has no svlsr_n_u8 (Clang does), so the SVE2 LSR
// (immediate) .B form is emitted via inline asm (pure Z-register).
#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_sao_b0_64x4_sve2(
    uint8_t* rec, const int8_t* offset, intptr_t stride)
{
    const svint8_t offv = svld1_s8(svptrue_b8(), offset);
    const svint8_t c128s = svdup_s8(128);
    const svuint8_t c128u = svdup_u8(128);
    for (int y = 0; y < 4; y++)
    {
        for (int x = 0; x < 64; x += 32)
        {
            svuint8_t p = svld1_u8(svptrue_b8(), rec + x);
            svuint8_t idx;
            __asm__("lsr %0.b, %1.b, #3" : "=w"(idx) : "w"(p));
            svint8_t off = svtbl_s8(offv, idx);
            svint8_t ps = svsub_s8_x(svptrue_b8(),
                                     svreinterpret_s8_u8(p), c128s);
            svint8_t s = svqadd_s8_x(svptrue_b8(), ps, off);
            svuint8_t out = svadd_u8_x(svptrue_b8(),
                                       svreinterpret_u8_s8(s), c128u);
            svst1_u8(svptrue_b8(), rec + x, out);
        }
        rec += stride;
    }
}
