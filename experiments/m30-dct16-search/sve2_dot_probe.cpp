// Static-instruction probe for the discovered constant-rearrangement form on
// SVE2 at fixed VL=256: out[i] = dot(C, x_i) for i = 0..3, where C is one
// shared 8-coefficient vector (the pre-permuted g_t16 row composition the
// dynamic-flow analysis discovered) and x_i are 8 x s16 raw data leaves.
// The point is the static instruction count of the dense-dot shape versus
// the NEON dense dot (~55 insns per output) and the structured tbl chain.
#include <arm_sve.h>
#include <cstdint>
#include <stdint.h>

static const uint16_t cdup_idx[16] = { 0, 1, 2, 3, 4, 5, 6, 7,
                                       0, 1, 2, 3, 4, 5, 6, 7 };

// one 4-lane output: [dot(C,x0), dot(C,x1), dot(C,x2), dot(C,x3)]
extern "C" void sve2_dot4(const int16_t* xs, int16_t* out,
                          const int16_t* C)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svuint16_t idx = svld1_u16(p16, cdup_idx);

    svint16_t Cv = svld1_s16(p16, C);
    svint16_t C0 = svtbl_s16(Cv, idx);          // [C, C]
    svint16_t X0 = svld1_s16(p16, xs);          // [x0, x1]
    svint16_t X1 = svld1_s16(p16, xs + 16);     // [x2, x3]

    svint32_t a0 = svmullb_s32(C0, X0);
    svint32_t a1 = svmullt_s32(C0, X0);
    svint32_t b0 = svmullb_s32(C0, X1);
    svint32_t b1 = svmullt_s32(C0, X1);

    svint32_t s0 = svadd_s32_x(p8s, a0, a1);
    svint32_t s1 = svadd_s32_x(p8s, b0, b1);
    svint32_t p0 = svaddp_s32_x(p8s, s0, s0);
    svint32_t p1 = svaddp_s32_x(p8s, p0, p0);
    svint32_t q0 = svaddp_s32_x(p8s, s1, s1);
    svint32_t q1 = svaddp_s32_x(p8s, q0, q0);

    svint16_t n0 = svrshrnb_n_s32(p1, 3);
    svint16_t n1 = svrshrnt_n_s32(n0, q1, 3);
    svst1_s16(p16, out, n1);
}
