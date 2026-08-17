// SA8D 16x16 SVE2 candidate: width-native cadd butterfly (950-only).
//
// Width-native port of the upstream x265::sa8d16_sve2<16,16> hadamard_8x8
// (pixel-prim-sve2.cpp): at VL=256 a 16-pixel row is one natural 16-lane
// register, so the left/right 8x8 quadrants are processed simultaneously
// (lanes 0-7 / 8-15) — no packing, no 128-bit bridge, cadd/tbl count
// halved vs the upstream 128-bit bridge (24 cadd + 16 tbl per 8-row pass
// instead of per 8x8 block).
//
// Algorithm ported verbatim from the upstream u8 path: horizontal 8-point
// hadamard via cadd<90>(x,x) + kHADPermuteTbl reorder (3 cadd stages, 2
// tbl), then the vertical sa8d fold (sumsub pairs -> abssumsub cross ->
// max -> add), accumulated into a u16 vector sum and svaddv-reduced.
// Rotate 90 matches the upstream (rot-270 would swap butterfly outputs).
// Bit-exact by construction; verified by the sa8d16 funnel gate.

#include <arm_sve.h>
#include <stdint.h>

// kHADPermuteTbl as s16 lane indices, per 8-lane quadrant:
// {0,2,4,6,1,3,5,7} for lanes 0-7, {8,10,12,14,9,11,13,15} for 8-15.
static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

// Horizontal 8-point hadamard: 3 butterfly stages (cadd<90>(x,x)) with
// a tbl reorder between stages (2 tbl total).
static inline svint16_t had8_s16(svint16_t x, svuint16_t idx)
{
    svint16_t s = svcadd_s16(x, x, 90);
    s = svtbl_s16(s, idx);
    s = svcadd_s16(s, s, 90);
    s = svtbl_s16(s, idx);
    return svcadd_s16(s, s, 90);
}

extern "C" int dynopt_sa8d_16x16_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);
    unsigned total = 0;

    // Two 8-row passes: (rows 0-7) and (rows 8-15), each processing the
    // left+right 8x8 quadrant pair in the 16 lanes simultaneously.
    for (int pass = 0; pass < 2; pass++)
    {
        const uint8_t* p1 = pix1 + pass * 8 * sp1;
        const uint8_t* p2 = pix2 + pass * 8 * sp2;
        #define LD(r) svreinterpret_s16_u16(svsub_u16_x(            \
            p16, svld1ub_u16(p16, p1 + (r) * sp1),                    \
                 svld1ub_u16(p16, p2 + (r) * sp2)))
        svint16_t d0 = LD(0), d1 = LD(1), d2 = LD(2), d3 = LD(3);
        svint16_t d4 = LD(4), d5 = LD(5), d6 = LD(6), d7 = LD(7);

        // Horizontal 8-point hadamard: 3 cadd stages + 2 tbl reorders.
        svint16_t a0 = had8_s16(d0, had_idx);
        svint16_t a1 = had8_s16(d1, had_idx);
        svint16_t a2 = had8_s16(d2, had_idx);
        svint16_t a3 = had8_s16(d3, had_idx);
        svint16_t a4 = had8_s16(d4, had_idx);
        svint16_t a5 = had8_s16(d5, had_idx);
        svint16_t a6 = had8_s16(d6, had_idx);
        svint16_t a7 = had8_s16(d7, had_idx);

        // Vertical sa8d fold (upstream sumsub/abssumsub/max/add).
        svint16_t b0 = svadd_s16_x(p16, a0, a1);
        svint16_t b1 = svsub_s16_x(p16, a0, a1);
        svint16_t b2 = svadd_s16_x(p16, a2, a3);
        svint16_t b3 = svsub_s16_x(p16, a2, a3);
        svint16_t b4 = svadd_s16_x(p16, a4, a5);
        svint16_t b5 = svsub_s16_x(p16, a4, a5);
        svint16_t b6 = svadd_s16_x(p16, a6, a7);
        svint16_t b7 = svsub_s16_x(p16, a6, a7);

        svint16_t aa0 = svabs_s16_x(p16, svadd_s16_x(p16, b0, b2));
        svint16_t aa2 = svabs_s16_x(p16, svsub_s16_x(p16, b0, b2));
        svint16_t aa1 = svabs_s16_x(p16, svadd_s16_x(p16, b1, b3));
        svint16_t aa3 = svabs_s16_x(p16, svsub_s16_x(p16, b1, b3));
        svint16_t aa4 = svabs_s16_x(p16, svadd_s16_x(p16, b4, b6));
        svint16_t aa6 = svabs_s16_x(p16, svsub_s16_x(p16, b4, b6));
        svint16_t aa5 = svabs_s16_x(p16, svadd_s16_x(p16, b5, b7));
        svint16_t aa7 = svabs_s16_x(p16, svsub_s16_x(p16, b5, b7));

        svuint16_t max0 = svmax_u16_x(p16, svreinterpret_u16_s16(aa0),
                                      svreinterpret_u16_s16(aa4));
        svuint16_t max1 = svmax_u16_x(p16, svreinterpret_u16_s16(aa1),
                                      svreinterpret_u16_s16(aa5));
        svuint16_t max2 = svmax_u16_x(p16, svreinterpret_u16_s16(aa2),
                                      svreinterpret_u16_s16(aa6));
        svuint16_t max3 = svmax_u16_x(p16, svreinterpret_u16_s16(aa3),
                                      svreinterpret_u16_s16(aa7));

        total += svaddv_u16(p16,
                     svadd_u16_x(p16, svadd_u16_x(p16, max0, max1),
                                 svadd_u16_x(p16, max2, max3)));
    }
    return (int)((total + 1) >> 1);
}
