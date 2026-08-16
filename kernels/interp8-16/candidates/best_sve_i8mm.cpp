// SVE I8MM interp8 hpp 16x16 candidate (svusmmla), upstream-exact vs
// x265 C semantics.  Mirrors the NEON i8mm template
// (filter-neon-i8mm.cpp) at 128-bit segment level: vusmmla and
// svusmmla have identical 2x8 x 8x2 per-segment semantics, so the same
// permuted operands / filter layout / lane order give identical
// results.  SVE1-only (no SVE2): rounding narrow via svasr + qxtunb
// chain.  Requires -march=armv8.2-a+sve+i8mm.
#include <arm_sve.h>
#include <stdint.h>

// Same tables as x265 matmul_permute_tbl[coeffIdx>>1]: first 16 bytes
// feed the lo matmul (outputs 0..3), second 16 the hi (outputs 4..7).
static const uint8_t sve_perm[2][32] = {
    { 0, 1, 2, 3, 4, 5, 6, 7, 2, 3, 4, 5, 6, 7, 8, 9,
      4, 5, 6, 7, 8, 9, 10, 11, 6, 7, 8, 9, 10, 11, 12, 13 },
    { 1, 2, 3, 4, 5, 6, 7, 8, 3, 4, 5, 6, 7, 8, 9, 10,
      5, 6, 7, 8, 9, 10, 11, 12, 7, 8, 9, 10, 11, 12, 13, 14 }
};
static const int8_t sve_filter32[3][32] = {
    { -1, 4, -10, 58, 17, -5, 1, 0, 0, -1, 4, -10, 58, 17, -5, 1,
      -1, 4, -10, 58, 17, -5, 1, 0, 0, -1, 4, -10, 58, 17, -5, 1 },
    { 4, -11, 40, 40, -11, 4, -1, 0, 0, 4, -11, 40, 40, -11, 4, -1,
      4, -11, 40, 40, -11, 4, -1, 0, 0, 4, -11, 40, 40, -11, 4, -1 },
    { 1, -5, 17, 58, -10, 4, -1, 0, 0, 1, -5, 17, 58, -10, 4, -1,
      1, -5, 17, 58, -10, 4, -1, 0, 0, 1, -5, 17, 58, -10, 4, -1 }
};

static inline svuint8_t sve_filter8(svuint8_t samples,
                                    const svint8_t filter32,
                                    const svuint8_t idxlo,
                                    const svuint8_t idxhi,
                                    int coeff2)
{
    svuint8_t p0 = svtbl_u8(samples, idxlo);
    svuint8_t p1 = svtbl_u8(samples, idxhi);
    svint32_t lo = svusmmla_s32(svdup_n_s32(0), p0, filter32);
    svint32_t hi = svusmmla_s32(svdup_n_s32(0), p1, filter32);
    // NEON vcombine(vmovn(lo), vmovn(hi)) = {lo0..lo3, hi0..hi3}.
    // SVE zip1 = {lo0,hi0,lo1,hi1,lo2,hi2,lo3,hi3}; tbl reorders.
    svint32_t tr = svzip1_s32(lo, hi);
    const svuint32_t shuf = svld1_u32(
        svptrue_b32(), (const uint32_t[]){0, 2, 4, 6, 1, 3, 5, 7});
    svint32_t m = svtbl_s32(tr, shuf);
    if (coeff2)
    {
        // NEON vsubw_u8(..., vget_low_u8(samples)): lanes 0..7 -= bytes
        // 0..7 of the 16-byte sample window.
        svuint32_t corr = svunpklo_u32(svunpklo_u16(samples));
        m = svsub_s32_x(svptrue_b32(), m, svreinterpret_s32_u32(corr));
    }
    // vqrshrun_n_s16(m, 6) == svasr(m + 32, 6) + saturate to u8.
    // SVE1 (no sqxtunb for these widths): truncate s32 -> s16 low halves
    // via uzp1, clamp to [0,255] in s16, take low bytes via uzp1.
    svint32_t r = svasr_n_s32_x(svptrue_b32(),
                                svadd_s32_x(svptrue_b32(), m,
                                            svdup_s32(32)),
                                6);
    svint16_t r16 = svuzp1_s16(svreinterpret_s16_s32(r),
                               svreinterpret_s16_s32(r));
    r16 = svmax_s16_x(svptrue_b16(), r16, svdup_s16(0));
    r16 = svmin_s16_x(svptrue_b16(), r16, svdup_s16(255));
    svuint8_t b = svreinterpret_u8_s16(r16);
    return svuzp1_u8(b, b);
}

extern "C" void dynopt_interp8_hpp_16x16_sve_i8mm(
    const uint8_t* src, intptr_t srcStride, uint8_t* dst,
    intptr_t dstStride, int coeffIdx)
{
    const int N_TAPS = 8;
    src -= N_TAPS / 2 - 1;

    const svbool_t pg16 = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svbool_t pg8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);
    const int perm_row = coeffIdx >> 1;
    const svuint8_t idxlo = svld1_u8(pg16, sve_perm[perm_row]);
    const svuint8_t idxhi = svld1_u8(pg16, sve_perm[perm_row] + 16);
    const svint8_t filter32 = svld1_s8(svptrue_b8(),
                                       sve_filter32[coeffIdx - 1]);
    const int coeff2 = coeffIdx == 2;

    for (int row = 0; row < 16; row++)
    {
        for (int col = 0; col < 16; col += 8)
        {
            svuint8_t s = svld1_u8(pg16, src + col);
            svuint8_t out = sve_filter8(s, filter32, idxlo, idxhi, coeff2);
            svst1_u8(pg8, dst + col, out);
        }
        src += srcStride;
        dst += dstStride;
    }
}
