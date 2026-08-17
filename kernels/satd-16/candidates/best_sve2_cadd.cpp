// SATD 16x16 SVE2 candidate: native SVE2 cadd butterfly (950-only).
//
// Same structure as best_sve1.cpp (gen_sve2_emit.py generic hadamard
// recipe, pack=2 natural 16x16 lowering) but with the SOFTWARE cadd
// emulation replaced by the native SVE2 svcadd instruction:
//
//   best_sve1: cadd90 = tbl(swap) + mul(sign) + add   (3-4 insns, SVE1)
//   this file: cadd90 = svcadd_s16(..., 270)          (1 insn, SVE2)
//
// The software cadd implements SVE2 rotate-270 semantics:
//   even lane: a[2i] - b[2i+1];  odd lane: a[2i+1] + b[2i]
// so the native call uses rotation=270.  Per row the horizontal 4-point
// hadamard drops from 3 tbl + 4 mul to 1 tbl + 2 cadd; the had_idx
// reorder between butterfly stages stays (inherent to the algorithm).
//
// SVE2-only (svcadd): does NOT run on 920B (SVE1) — the auto-search
// constraint dimension: SVE2 target -> native cadd cover; SVE1 target
// -> best_sve1 software cadd cover.  Bit-exact vs
// x265::satd8_sve2<16,16> by construction (same dataflow, same
// rotation); verified by the satd-16 funnel gate (QEMU vq=2).

#include <arm_sve.h>

static inline svint16_t cadd90_s16(svint16_t a)
{
    return svcadd_s16(a, a, 270);
}

#define CADD90(a) cadd90_s16((a))

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

extern "C" int dynopt_satd_16x16_sve2(const uint8_t* pix1, intptr_t sp1,
                  const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);

    #define LD(r) svreinterpret_s16_u16(svsub_u16_x(               \
        p16,                                                      \
        svld1ub_u16(p16, pix1 + (r) * sp1),                       \
        svld1ub_u16(p16, pix2 + (r) * sp2)))
    #define ROWH4(p)                                               \
        p = CADD90(p);                                            \
        p = svtbl_s16(p, had_idx);                                \
        p = CADD90(p);                                            \
        (void)0

    svuint16_t total = svdup_n_u16(0);
    for (int g = 0; g < 4; g++)
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
        total = svadd_u16_x(p16, total,
                            svreinterpret_u16_s16(gs));
    }
    return (int)svaddv_u16(p16, total);
}
