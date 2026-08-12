// DCT8 x2 SVE2 candidate: two horizontally adjacent 8x8 tiles in one
// fixed-VL=256 (svcntb()==32) SVE register. Tile A lives in the low half
// (s32 lanes 0-3 / s16 lanes 0-3) and tile B in the high half (s32 lanes
// 4-7 / s16 lanes 4-7), so every elementwise op does two tiles' work with
// no cross-tile shuffles. Pairwise ops (NEON vpaddq) use svaddp + one
// svtbl fixup because SVE ADDP interleaves the two source halves.
//
// Contract:
//   - srcStride >= 16 s16 elements; tile A = src cols 0..7, tile B = cols
//     8..15 of each row (horizontally adjacent);
//   - dst is a contiguous 128-s16 buffer: dstA = dst[0..63], dstB =
//     dst[64..127];
//   - caller must fix VL to 256 bits (svcntb()==32) before entry.
//
// Semantics: partial_butterfly8 is replicated from upstream dct8_neon
// (pinned x265 b81f650, common/aarch64/dct-prim.cpp) but E and O are
// computed with widening add/sub (svaddlb/svsublb), which removes the s16
// wrap that makes upstream NEON diverge from dct8_c on ~0.87% of the
// [-255,255] contract. The result is bit-exact with the C oracle.
#include <arm_sve.h>
#include <cstddef>
#include <stdint.h>

namespace {

// Unpredicated 3-register MUL (SVE): the ACLE svmul_s32_x is the
// destructive Zda = Zda * Zm form, so GCC prefixes it with movprfx whenever
// the first source is still live. All muls here are full-vector, so the
// unpredicated form is equivalent and drops the movprfx.
static inline svint32_t sve_mul_s32(svint32_t a, svint32_t b)
{
    svint32_t r;
    asm("mul %0.s, %1.s, %2.s" : "=w"(r) : "w"(a), "w"(b));
    return r;
}

// Even-path constants are t8_even from common/aarch64/dct-prim.h; the
// odd-column coefficients are scalar splats built at runtime.
static const int32_t c0[8] = { 64, 64, 64, 64,  64, 64, 64, 64 };
static const int32_t c2[8] = { 83, 36, 83, 36,  83, 36, 83, 36 };
static const int32_t c4[8] = { 64, -64, 64, -64,  64, -64, 64, -64 };
static const int32_t c6[8] = { 36, -83, 36, -83,  36, -83, 36, -83 };

// 16-bit gather offsets for the [A lo, B lo] and [A hi, B hi] row quarters.
// Interleave the low/high quarters of the two 8-lane row halves into the
// even lanes so svaddlb/svsublb pair (lo[j], hi[j]) at result lane j.
static const uint16_t idx_lo[16] = { 0, 0, 1, 0, 2, 0, 3, 0,
                                     8, 0, 9, 0, 10, 0, 11, 0 };
static const uint16_t idx_hi[16] = { 7, 0, 6, 0, 5, 0, 4, 0,
                                     15, 0, 14, 0, 13, 0, 12, 0 };
// zip1q_s64/zip2q_s64 + rev64 over the [E_lo, E_hi] tuple, per tile half.
static const uint32_t idx_t0[8] = { 0, 1, 8, 9, 4, 5, 12, 13 };
static const uint32_t idx_t1[8] = { 3, 2, 11, 10, 7, 6, 15, 14 };
// svaddp interleave fixup: {0,2,1,3} per 4-lane half.
static const uint32_t idx_vp[8] = { 0, 2, 1, 3, 4, 6, 5, 7 };
// collapse svrshrnb/svrshrnt duplicated layout to 8 contiguous s16 lanes.
static const uint16_t idx_narrow[8] = { 0, 2, 4, 6, 9, 11, 13, 15 };
// 4x4 transpose of the O block, per tile half (vtrn1q/vtrn2q +
// vcombine low/high over an [Oa(8), Ob(8)] tuple).
static const uint32_t idx_trn1[8] = { 0, 8, 2, 10, 4, 12, 6, 14 };
static const uint32_t idx_trn2[8] = { 1, 9, 3, 11, 5, 13, 7, 15 };
static const uint32_t idx_cmb1[8] = { 0, 1, 8, 9, 4, 5, 12, 13 };
static const uint32_t idx_cmb2[8] = { 2, 3, 10, 11, 6, 7, 14, 15 };

// ROW_STRIDE is the element distance between consecutive resN rows of one
// tile in the dst layout (8 for contiguous [A(64), B(64)], 16 for the
// 16-wide intermediate rows [A row, B row]); B_OFF is tile B's base offset
// relative to tile A (64 contiguous, 8 interleaved rows).
template <int shift, int ROW_STRIDE, int B_OFF>
static void partial_butterfly8x2(const int16_t* src, int16_t* dst,
                                 intptr_t srcStride)
{
    const svbool_t pg8s = svwhilelt_b32(0, 8);
    const svbool_t pg8h = svwhilelt_b16(0, 8);
    const svbool_t pg16 = svwhilelt_b16(0, 16);
    const svbool_t pg4lo = svwhilelt_b16(0, 4);
    // WHILELT is (a + i) < b, so whilelt(4,8) selects lanes 0-3, not 4-7.
    // Build lanes 4-7 as whilelt(0,8) AND NOT whilelt(0,4).
    const svbool_t pg4hi = svbic_b_z(svptrue_b16(), svwhilelt_b16(0, 8),
                                     svwhilelt_b16(0, 4));

    const svuint32_t it0 = svld1_u32(pg8s, idx_t0);
    const svuint32_t it1 = svld1_u32(pg8s, idx_t1);
    const svuint32_t ivp = svld1_u32(pg8s, idx_vp);
    const svuint16_t inar = svld1_u16(pg8h, idx_narrow);
    const svuint16_t ilo = svld1_u16(pg16, idx_lo);
    const svuint16_t ihi = svld1_u16(pg16, idx_hi);
    const svuint32_t itr1 = svld1_u32(pg8s, idx_trn1);
    const svuint32_t itr2 = svld1_u32(pg8s, idx_trn2);
    const svuint32_t icm1 = svld1_u32(pg8s, idx_cmb1);
    const svuint32_t icm2 = svld1_u32(pg8s, idx_cmb2);

    const svint32_t C0 = svld1_s32(pg8s, c0);
    const svint32_t C2 = svld1_s32(pg8s, c2);
    const svint32_t C4 = svld1_s32(pg8s, c4);
    const svint32_t C6 = svld1_s32(pg8s, c6);
    // Scalar coefficient splats for the odd-column MLA chains.
    const svint32_t s89 = svdup_n_s32(89);
    const svint32_t s75 = svdup_n_s32(75);
    const svint32_t s50 = svdup_n_s32(50);
    const svint32_t s18 = svdup_n_s32(18);
    const svint32_t sm18 = svdup_n_s32(-18);
    const svint32_t sm50 = svdup_n_s32(-50);
    const svint32_t sm89 = svdup_n_s32(-89);

    // One stage-1 iteration over rows (i, i+1): widening E/O and the
    // EE/EO combine, both tiles packed.
#define DCT8X2_STAGE(i, o_lo, o_hi, ee, eo)                                  \
    do {                                                                     \
        const int16_t* base = src + (intptr_t)(i) * srcStride;               \
        svint16_t r0 = svld1_s16(pg16, base);                                \
        svint16_t r1 = svld1_s16(pg16, base + srcStride);                    \
        svint16_t lo0 = svtbl_s16(r0, ilo);                                  \
        svint16_t hi0 = svtbl_s16(r0, ihi);                                  \
        svint16_t lo1 = svtbl_s16(r1, ilo);                                  \
        svint16_t hi1 = svtbl_s16(r1, ihi);                                  \
        svint32_t e0 = svaddlb_s32(lo0, hi0);                                \
        svint32_t e1 = svaddlb_s32(lo1, hi1);                                \
        o_lo = svsublb_s32(lo0, hi0);                                        \
        o_hi = svsublb_s32(lo1, hi1);                                        \
        svint32x2_t pair = svcreate2_s32(e0, e1);                            \
        svint32_t t0 = svtbl2_s32(pair, it0);                                \
        svint32_t t1 = svtbl2_s32(pair, it1);                                \
        ee = svadd_s32_x(pg8s, t0, t1);                                      \
        eo = svsub_s32_x(pg8s, t0, t1);                                      \
    } while (0)

    // One j-group: four O values and two EE/EO values, both tiles packed.
    // Written as a macro so the eight SVE inputs stay in registers; a
    // lambda parameter list spills sizeless SVE values to the stack.
#define DCT8X2_FINISH(oa, ob, oc, od, eea, eeb, eoa, eob, off)               \
    do {                                                                     \
        int16_t* d = dst + (off);                                            \
        svint32x2_t p01 = svcreate2_s32(oa, ob);                             \
        svint32x2_t p23 = svcreate2_s32(oc, od);                             \
        svint32_t t1 = svtbl2_s32(p01, itr1);                                \
        svint32_t t2 = svtbl2_s32(p01, itr2);                                \
        svint32_t t3 = svtbl2_s32(p23, itr1);                                \
        svint32_t t4 = svtbl2_s32(p23, itr2);                                \
        svint32x2_t p13 = svcreate2_s32(t1, t3);                             \
        svint32x2_t p24 = svcreate2_s32(t2, t4);                             \
        svint32_t Oo0 = svtbl2_s32(p13, icm1);                               \
        svint32_t Oo1 = svtbl2_s32(p24, icm1);                               \
        svint32_t Oo2 = svtbl2_s32(p13, icm2);                               \
        svint32_t Oo3 = svtbl2_s32(p24, icm2);                               \
        {                                                                    \
            svint32_t a = sve_mul_s32(Oo0, s89);                             \
            a = svmla_s32_x(pg8s, a, Oo1, s75);                              \
            a = svmla_s32_x(pg8s, a, Oo2, s50);                              \
            a = svmla_s32_x(pg8s, a, Oo3, s18);                              \
            svint16_t rb = svrshrnb_n_s32(a, shift);                         \
            svint16_t rt = svrshrnt_n_s32(rb, a, shift);                     \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + ROW_STRIDE, res);                           \
            svst1_s16(pg4hi, d + ROW_STRIDE + (B_OFF - 4), res);             \
        }                                                                    \
        {                                                                    \
            svint32_t a = sve_mul_s32(Oo0, s75);                             \
            a = svmla_s32_x(pg8s, a, Oo1, sm18);                             \
            a = svmla_s32_x(pg8s, a, Oo2, sm89);                             \
            a = svmla_s32_x(pg8s, a, Oo3, sm50);                             \
            svint16_t rb = svrshrnb_n_s32(a, shift);                         \
            svint16_t rt = svrshrnt_n_s32(rb, a, shift);                     \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 3 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 3 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
        {                                                                    \
            svint32_t a = sve_mul_s32(Oo0, s50);                             \
            a = svmla_s32_x(pg8s, a, Oo1, sm89);                             \
            a = svmla_s32_x(pg8s, a, Oo2, s18);                              \
            a = svmla_s32_x(pg8s, a, Oo3, s75);                              \
            svint16_t rb = svrshrnb_n_s32(a, shift);                         \
            svint16_t rt = svrshrnt_n_s32(rb, a, shift);                     \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 5 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 5 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
        {                                                                    \
            svint32_t a = sve_mul_s32(Oo0, s18);                             \
            a = svmla_s32_x(pg8s, a, Oo1, sm50);                             \
            a = svmla_s32_x(pg8s, a, Oo2, s75);                              \
            a = svmla_s32_x(pg8s, a, Oo3, sm89);                             \
            svint16_t rb = svrshrnb_n_s32(a, shift);                         \
            svint16_t rt = svrshrnt_n_s32(rb, a, shift);                     \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 7 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 7 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
        {                                                                    \
            svint32_t m0 = sve_mul_s32(eea, C0);                             \
            svint32_t m1 = sve_mul_s32(eeb, C0);                             \
            svint32_t pre = svtbl_s32(svaddp_s32_x(pg8s, m0, m1), ivp);      \
            svint16_t rb = svrshrnb_n_s32(pre, shift);                       \
            svint16_t rt = svrshrnt_n_s32(rb, pre, shift);                   \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 0, res);                                    \
            svst1_s16(pg4hi, d + 0 + (B_OFF - 4), res);                      \
        }                                                                    \
        {                                                                    \
            svint32_t m0 = sve_mul_s32(eoa, C2);                             \
            svint32_t m1 = sve_mul_s32(eob, C2);                             \
            svint32_t pre = svtbl_s32(svaddp_s32_x(pg8s, m0, m1), ivp);      \
            svint16_t rb = svrshrnb_n_s32(pre, shift);                       \
            svint16_t rt = svrshrnt_n_s32(rb, pre, shift);                   \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 2 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 2 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
        {                                                                    \
            svint32_t m0 = sve_mul_s32(eea, C4);                             \
            svint32_t m1 = sve_mul_s32(eeb, C4);                             \
            svint32_t pre = svtbl_s32(svaddp_s32_x(pg8s, m0, m1), ivp);      \
            svint16_t rb = svrshrnb_n_s32(pre, shift);                       \
            svint16_t rt = svrshrnt_n_s32(rb, pre, shift);                   \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 4 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 4 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
        {                                                                    \
            svint32_t m0 = sve_mul_s32(eoa, C6);                             \
            svint32_t m1 = sve_mul_s32(eob, C6);                             \
            svint32_t pre = svtbl_s32(svaddp_s32_x(pg8s, m0, m1), ivp);      \
            svint16_t rb = svrshrnb_n_s32(pre, shift);                       \
            svint16_t rt = svrshrnt_n_s32(rb, pre, shift);                   \
            svint16_t res = svtbl_s16(rt, inar);                             \
            svst1_s16(pg4lo, d + 6 * ROW_STRIDE, res);                       \
            svst1_s16(pg4hi, d + 6 * ROW_STRIDE + (B_OFF - 4), res);         \
        }                                                                    \
    } while (0)

    {
        svint32_t oa, ob, oc, od, eea, eeb, eoa, eob;
        DCT8X2_STAGE(0, oa, ob, eea, eoa);
        DCT8X2_STAGE(2, oc, od, eeb, eob);
        DCT8X2_FINISH(oa, ob, oc, od, eea, eeb, eoa, eob, 0);
    }
    {
        svint32_t oa, ob, oc, od, eea, eeb, eoa, eob;
        DCT8X2_STAGE(4, oa, ob, eea, eoa);
        DCT8X2_STAGE(6, oc, od, eeb, eob);
        DCT8X2_FINISH(oa, ob, oc, od, eea, eeb, eoa, eob, 4);
    }
#undef DCT8X2_FINISH
#undef DCT8X2_STAGE
}

} // namespace

extern "C" void dynopt_dct8x2_neon_sve2(const int16_t* src, int16_t* dst,
                                        intptr_t srcStride)
{
    // Two passes over the packed two-tile buffers. Pass 1 writes a 128-s16
    // intermediate in 16-wide rows [A row, B row]; pass 2 consumes it with
    // stride 16 and writes the final two tiles contiguously.
    int16_t coef[128];
    partial_butterfly8x2<2, 16, 8>(src, coef, srcStride);
    partial_butterfly8x2<9, 8, 64>(coef, dst, 16);
}
