// SATD 32x8 SVE2 candidate: native SVE2 cadd butterfly (950-only).
//
// 2 half-vectors per row x 2 4-row quads of the verified satd-16 cadd
// kernel; gate-arbitrated vs x265::satd8_sve2<32,8>.

#include <arm_sve.h>

static inline svint16_t cadd90_s16(svint16_t a)
{
    return svcadd_s16(a, a, 270);
}

#define CADD90(a) cadd90_s16((a))

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

extern "C" int dynopt_satd_32x8_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);

    #define LD(c, r) svreinterpret_s16_u16(svsub_u16_x(        \
        p16,                                                  \
        svld1ub_u16(p16, pix1 + (c) + (r) * sp1),             \
        svld1ub_u16(p16, pix2 + (c) + (r) * sp2)))
    #define ROWH4(p)                                           \
        p = CADD90(p);                                        \
        p = svtbl_s16(p, had_idx);                            \
        p = CADD90(p);                                        \
        (void)0
    #define VERT(a0, d0, a1, d1, r0, r1, r2, r3)               \
        a0 = svabs_s16_x(p16, svadd_s16_x(p16, r0, r1));      \
        d0 = svabd_s16_x(p16, r0, r1);                        \
        a1 = svabs_s16_x(p16, svadd_s16_x(p16, r2, r3));      \
        d1 = svabd_s16_x(p16, r2, r3);                        \
        (void)0

    svuint16_t total = svdup_n_u16(0);
    for (int g = 0; g < 2; g++)
    {
        const int r0 = g * 4 + 0, r1 = g * 4 + 1;
        const int r2 = g * 4 + 2, r3 = g * 4 + 3;
        svint16_t a0a, d0a, a1a, d1a, a0b, d0b, a1b, d1b;
        svint16_t ra0 = LD(0, r0); ROWH4(ra0);
        svint16_t rb0 = LD(16, r0); ROWH4(rb0);
        svint16_t ra1 = LD(0, r1); ROWH4(ra1);
        svint16_t rb1 = LD(16, r1); ROWH4(rb1);
        svint16_t ra2 = LD(0, r2); ROWH4(ra2);
        svint16_t rb2 = LD(16, r2); ROWH4(rb2);
        svint16_t ra3 = LD(0, r3); ROWH4(ra3);
        svint16_t rb3 = LD(16, r3); ROWH4(rb3);
        VERT(a0a, d0a, a1a, d1a, ra0, ra1, ra2, ra3);
        VERT(a0b, d0b, a1b, d1b, rb0, rb1, rb2, rb3);
        svint16_t m0a = svmax_s16_x(p16, a0a, a1a);
        svint16_t m0b = svmax_s16_x(p16, a0b, a1b);
        svint16_t m1a = svmax_s16_x(p16, d0a, d1a);
        svint16_t m1b = svmax_s16_x(p16, d0b, d1b);
        svint16_t gs = svadd_s16_x(p16, svadd_s16_x(p16, m0a, m1a), svadd_s16_x(p16, m0b, m1b));
        total = svadd_u16_x(p16, total, svreinterpret_u16_s16(gs));
    }
    return (int)svaddv_u16(p16, total);
}
