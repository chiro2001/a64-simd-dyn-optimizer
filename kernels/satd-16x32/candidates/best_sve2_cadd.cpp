// SATD 16x32 SVE2 candidate: native SVE2 cadd butterfly (950-only).
//
// Vertical extension of the verified satd-16 cadd kernel
// (best_sve2_cadd.cpp): 32 rows = 8 quads of 4 rows (g-loop x2),
// same ROWH4 horizontal 4-point cadd butterfly on 16-lane rows.
// Bit-exact vs x265::satd8_sve2<16,32> expected by construction
// (sum over quads commutes); verified by the funnel gate.

#include <arm_sve.h>

static inline svint16_t cadd90_s16(svint16_t a)
{
    return svcadd_s16(a, a, 270);
}

#define CADD90(a) cadd90_s16((a))

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

extern "C" int dynopt_satd_16x32_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);

    #define LD(r) svreinterpret_s16_u16(svsub_u16_x(           \
        p16,                                                  \
        svld1ub_u16(p16, pix1 + (r) * sp1),                   \
        svld1ub_u16(p16, pix2 + (r) * sp2)))
    #define ROWH4(p)                                           \
        p = CADD90(p);                                        \
        p = svtbl_s16(p, had_idx);                            \
        p = CADD90(p);                                        \
        (void)0

    svuint16_t total = svdup_n_u16(0);
    for (int g = 0; g < 8; g++)
    {
        svint16_t r0 = LD(g * 4 + 0); ROWH4(r0);
        svint16_t r1 = LD(g * 4 + 1); ROWH4(r1);
        svint16_t r2 = LD(g * 4 + 2); ROWH4(r2);
        svint16_t r3 = LD(g * 4 + 3); ROWH4(r3);
        svint16_t a0 = svabs_s16_x(p16, svadd_s16_x(p16, r0, r1));
        svint16_t d0 = svabd_s16_x(p16, r0, r1);
        svint16_t a1 = svabs_s16_x(p16, svadd_s16_x(p16, r2, r3));
        svint16_t d1 = svabd_s16_x(p16, r2, r3);
        svint16_t m0 = svmax_s16_x(p16, a0, a1);
        svint16_t m1 = svmax_s16_x(p16, d0, d1);
        svint16_t gs = svadd_s16_x(p16, m0, m1);
        total = svadd_u16_x(p16, total, svreinterpret_u16_s16(gs));
    }
    return (int)svaddv_u16(p16, total);
}
