// DCT16 SVE256 dense-dot candidate (fixed VL=256, SVE2), generated from the
// constant-rearrangement structure the dynamic-flow analysis discovered.
//
// Dense form (one pass = one 16x16 matrix multiply, no data shuffles):
//   res[k][i] = vrshrn( dot(g_t16[k][0..15], src_row_i), shift )
//
// Derivation: the two-stage butterfly's runtime rev16/rev32/zip shuffles are
// folded into the constants. For output row k,
//   odd  k: res = dot(g_t16[k][0..7], O_i), O_i[j] = src[j] - src[15-j]
//             = dot([g_t16[k][0..7], -rev(g_t16[k][0..7])], src_row_i)
//   even k: res = dot(g_t16[k][0..7], E_i), E_i[j] = src[j] + src[15-j]
//             = dot([g_t16[k][0..7], +rev(g_t16[k][0..7])], src_row_i)
// and g_t16 rows already have exactly that [C, +/-rev(C)] layout, so the
// whole pass is a direct dense dot against g_t16 rows.
//
// Instruction-level optimization under test: the 8-element dot chains are
// replaced by SVE SDOT (s16 -> s64), the same primitive the upstream SVE DCT
// uses through its NEON-SVE bridge, but here at full 256-bit width: one
// svdot_s64 computes 16 MACs (4x s64 lanes x 4 products), so two input rows
// are reduced to two outputs in 2x svdot + 2x svaddp.
#include <arm_sve.h>
#include <cstddef>
#include <cstdint>
#include <stdint.h>

namespace {

static const int16_t g_t16[16][16] =
{
    { 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64 },
    { 90, 87, 80, 70, 57, 43, 25, 9, -9, -25, -43, -57, -70, -80, -87, -90 },
    { 89, 75, 50, 18, -18, -50, -75, -89, -89, -75, -50, -18, 18, 50, 75, 89 },
    { 87, 57, 9, -43, -80, -90, -70, -25, 25, 70, 90, 80, 43, -9, -57, -87 },
    { 83, 36, -36, -83, -83, -36, 36, 83, 83, 36, -36, -83, -83, -36, 36, 83 },
    { 80, 9, -70, -87, -25, 57, 90, 43, -43, -90, -57, 25, 87, 70, -9, -80 },
    { 75, -18, -89, -50, 50, 89, 18, -75, -75, 18, 89, 50, -50, -89, -18, 75 },
    { 70, -43, -87, 9, 90, 25, -80, -57, 57, 80, -25, -90, -9, 87, 43, -70 },
    { 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64 },
    { 57, -80, -25, 90, -9, -87, 43, 70, -70, -43, 87, 9, -90, 25, 80, -57 },
    { 50, -89, 18, 75, -75, -18, 89, -50, -50, 89, -18, -75, 75, 18, -89, 50 },
    { 43, -90, 57, 25, -87, 70, 9, -80, 80, -9, -70, 87, -25, -57, 90, -43 },
    { 36, -83, 83, -36, -36, 83, -83, 36, 36, -83, 83, -36, -36, 83, -83, 36 },
    { 25, -70, 90, -80, 43, 9, -57, 87, -87, 57, -9, -43, 80, -90, 70, -25 },
    { 18, -50, 75, -89, 89, -75, 50, -18, -18, 50, -75, 89, -89, 75, -50, 18 },
    { 9, -25, 43, -57, 70, -80, 87, -90, 90, -87, 80, -70, 57, -43, 25, -9 },
};

template <int shift>
static void pass(const int16_t* src, int16_t* dst, intptr_t stride)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p64 = svptrue_b64();

    for (int k = 0; k < 16; k++)
    {
        // one 16-lane constant per output row (16 x s16, VL=256)
        const svint16_t c = svld1_s16(p16, g_t16[k]);
        for (int i = 0; i < 16; i += 2)
        {
            // two input rows; sdots64 gives 4 s64 lanes:
            //   [dot4(r_i[0:4]), dot4(r_i[4:8]),
            //    dot4(r_j[0:4]), dot4(r_j[4:8])]
            const svint16_t r0 = svld1_s16(p16, src + (i + 0) * stride);
            const svint16_t r1 = svld1_s16(p16, src + (i + 1) * stride);
            const svint64_t d0 = svdot_s64(svdup_n_s64(0), r0, c);
            const svint64_t d1 = svdot_s64(svdup_n_s64(0), r1, c);

            // Reduce the four 4-element partial dots to two 16-element dots.
            // svaddp_s64_x interleaves pairwise sums of its two operands
            // ([op1[0]+op1[1], op2[0]+op2[1], op1[2]+op1[3], op2[2]+op2[3]]),
            // so the order is wrong for us; use even/odd unzip + add instead:
            //   u0 = [d0[0], d0[2], d1[0], d1[2]]
            //   u1 = [d0[1], d0[3], d1[1], d1[3]]
            //   v  = [d0[0]+d0[1], d0[2]+d0[3],
            //         d1[0]+d1[1], d1[2]+d1[3]]
            //   full = addp(v, v) = [dot(r_i), dot(r_i),
            //                        dot(r_j), dot(r_j)]
            //   t    = uzp2(full, full)
            //        = [dot(r_i), dot(r_j), dot(r_i), dot(r_j)]
            const svint64_t u0 = svuzp1_s64(d0, d1);
            const svint64_t u1 = svuzp2_s64(d0, d1);
            const svint64_t v = svadd_s64_x(p64, u0, u1);
            const svint64_t full = svaddp_s64_x(p64, v, v);
            const svint64_t t = svuzp2_s64(full, full);

            // values fit in s32 (16 MACs, <= 90*2040*16 ~ 2.9M); take the low
            // 32 bits of each 64-bit lane, then round-shift-narrow to s16.
            const svint32_t t32 = svreinterpret_s32_s64(t);
            const svint32_t w = svuzp1_s32(t32, t32);
            const svint16_t n = svrshrnb_n_s32(w, shift);
            // RSHRNB places results in the even-numbered half-width lanes
            // (odd lanes zero); unzip once so the two row results are
            // contiguous before the 2-lane store.
            const svint16_t n2 = svuzp1_s16(n, n);
            svst1_s16(svwhilelt_b16(0, 2), dst + 16 * k + i, n2);
        }
    }
}

} // namespace

extern "C" void dynopt_dct16_sve2_dense(const int16_t* src, int16_t* dst,
                                        intptr_t srcStride)
{
    int16_t coef[256];
    pass<3>(src, coef, srcStride);
    pass<10>(coef, dst, 16);
}
