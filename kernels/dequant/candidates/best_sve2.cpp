// Dequant (normal, 256 elements) SVE2 candidate.
//
// Port of the upstream x265_dequant_normal_sve2 (pixel-util-sve2.S):
// per 16 s16 coefs: smullb/smullt widen-multiply by the quant scalar,
// srshl rounding shift (the asm negates the shift, so a negative
// srshl shift = rounding shift right), sqxtnb/t saturating narrow
// back to s16. Bit-exact by construction; verified by the dequant
// funnel gate.

#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_dequant_normal_256_sve2(
    const int16_t* quantCoef, int16_t* coef, int scale, int shift)
{
    const svbool_t pg16 = svptrue_b16();
    const svbool_t pg32 = svptrue_b32();
    const svint16_t q = svdup_n_s16((int16_t)scale);
    const svint32_t sh = svdup_n_s32(-shift);  // negated: right shift
    for (int i = 0; i < 256; i += 16)
    {
        svint16_t v = svld1_s16(pg16, quantCoef + i);
        svint32_t lo = svmullb_s32(v, q);
        svint32_t hi = svmullt_s32(v, q);
        lo = svrshl_s32_x(pg32, lo, sh);
        hi = svrshl_s32_x(pg32, hi, sh);
        svint16_t r = svqxtnb_s32(lo);
        r = svqxtnt_s32(r, hi);
        svst1_s16(pg16, coef + i, r);
    }
}
