// SA8D 32x32 SVE2 candidate: width-native cadd butterfly (950-only).
//
// 2 half-vectors per row x 4 8-row passes; each half runs the
// upstream hadamard_8x8 (cadd<90> + kHADPermuteTbl, 3-stage) with the
// vertical sa8d fold. Rounding matches the reference: (sum+1)>>1 per
// 16x16 group (pixel_sa8d_16x32 rounds each 16-row half via vpaddq).
// Gate-arbitrated vs x265::sa8d16x32_sve2<32,32>.

#include <arm_sve.h>
#include <stdint.h>

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

static inline svint16_t had8_s16(svint16_t x, svuint16_t idx)
{
    svint16_t s = svcadd_s16(x, x, 90);
    s = svtbl_s16(s, idx);
    s = svcadd_s16(s, s, 90);
    s = svtbl_s16(s, idx);
    return svcadd_s16(s, s, 90);
}

extern "C" int dynopt_sa8d_32x32_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);
    unsigned acca[2], accb[2];
    acca[0] = 0;
    acca[1] = 0;
    accb[0] = 0;
    accb[1] = 0;

    for (int pass = 0; pass < 4; pass++)
    {
        const int band = pass / 2;
        const uint8_t* p1 = pix1 + pass * 8 * sp1;
        const uint8_t* p2 = pix2 + pass * 8 * sp2;
        #define LD(c, r) svreinterpret_s16_u16(svsub_u16_x(        \
            p16, svld1ub_u16(p16, p1 + (c) + (r) * sp1),             \
                 svld1ub_u16(p16, p2 + (c) + (r) * sp2)))
        svint16_t da0, db0;
        da0 = LD(0, 0);
        db0 = LD(16, 0);
        svint16_t da1, db1;
        da1 = LD(0, 1);
        db1 = LD(16, 1);
        svint16_t da2, db2;
        da2 = LD(0, 2);
        db2 = LD(16, 2);
        svint16_t da3, db3;
        da3 = LD(0, 3);
        db3 = LD(16, 3);
        svint16_t da4, db4;
        da4 = LD(0, 4);
        db4 = LD(16, 4);
        svint16_t da5, db5;
        da5 = LD(0, 5);
        db5 = LD(16, 5);
        svint16_t da6, db6;
        da6 = LD(0, 6);
        db6 = LD(16, 6);
        svint16_t da7, db7;
        da7 = LD(0, 7);
        db7 = LD(16, 7);
        svint16_t aa0, aa1, aa2, aa3, aa4, aa5, aa6, aa7, ab0, ab1, ab2, ab3, ab4, ab5, ab6, ab7;
        aa0 = had8_s16(da0, had_idx);
        aa1 = had8_s16(da1, had_idx);
        aa2 = had8_s16(da2, had_idx);
        aa3 = had8_s16(da3, had_idx);
        aa4 = had8_s16(da4, had_idx);
        aa5 = had8_s16(da5, had_idx);
        aa6 = had8_s16(da6, had_idx);
        aa7 = had8_s16(da7, had_idx);
        ab0 = had8_s16(db0, had_idx);
        ab1 = had8_s16(db1, had_idx);
        ab2 = had8_s16(db2, had_idx);
        ab3 = had8_s16(db3, had_idx);
        ab4 = had8_s16(db4, had_idx);
        ab5 = had8_s16(db5, had_idx);
        ab6 = had8_s16(db6, had_idx);
        ab7 = had8_s16(db7, had_idx);
        svuint16_t hsa, hsb;
        {
            svint16_t b0 = svadd_s16_x(p16, aa0, aa1);
            svint16_t b1 = svsub_s16_x(p16, aa0, aa1);
            svint16_t b2 = svadd_s16_x(p16, aa2, aa3);
            svint16_t b3 = svsub_s16_x(p16, aa2, aa3);
            svint16_t b4 = svadd_s16_x(p16, aa4, aa5);
            svint16_t b5 = svsub_s16_x(p16, aa4, aa5);
            svint16_t b6 = svadd_s16_x(p16, aa6, aa7);
            svint16_t b7 = svsub_s16_x(p16, aa6, aa7);
            svint16_t aa0 = svabs_s16_x(p16, svadd_s16_x(p16, b0, b2));
            svint16_t aa2 = svabs_s16_x(p16, svsub_s16_x(p16, b0, b2));
            svint16_t aa1 = svabs_s16_x(p16, svadd_s16_x(p16, b1, b3));
            svint16_t aa3 = svabs_s16_x(p16, svsub_s16_x(p16, b1, b3));
            svint16_t aa4 = svabs_s16_x(p16, svadd_s16_x(p16, b4, b6));
            svint16_t aa6 = svabs_s16_x(p16, svsub_s16_x(p16, b4, b6));
            svint16_t aa5 = svabs_s16_x(p16, svadd_s16_x(p16, b5, b7));
            svint16_t aa7 = svabs_s16_x(p16, svsub_s16_x(p16, b5, b7));
            svuint16_t max0 = svmax_u16_x(p16, svreinterpret_u16_s16(aa0), svreinterpret_u16_s16(aa4));
            svuint16_t max1 = svmax_u16_x(p16, svreinterpret_u16_s16(aa1), svreinterpret_u16_s16(aa5));
            svuint16_t max2 = svmax_u16_x(p16, svreinterpret_u16_s16(aa2), svreinterpret_u16_s16(aa6));
            svuint16_t max3 = svmax_u16_x(p16, svreinterpret_u16_s16(aa3), svreinterpret_u16_s16(aa7));
            hsa = svadd_u16_x(p16, svadd_u16_x(p16, max0, max1), svadd_u16_x(p16, max2, max3));
        }
        {
            svint16_t b0 = svadd_s16_x(p16, ab0, ab1);
            svint16_t b1 = svsub_s16_x(p16, ab0, ab1);
            svint16_t b2 = svadd_s16_x(p16, ab2, ab3);
            svint16_t b3 = svsub_s16_x(p16, ab2, ab3);
            svint16_t b4 = svadd_s16_x(p16, ab4, ab5);
            svint16_t b5 = svsub_s16_x(p16, ab4, ab5);
            svint16_t b6 = svadd_s16_x(p16, ab6, ab7);
            svint16_t b7 = svsub_s16_x(p16, ab6, ab7);
            svint16_t aa0 = svabs_s16_x(p16, svadd_s16_x(p16, b0, b2));
            svint16_t aa2 = svabs_s16_x(p16, svsub_s16_x(p16, b0, b2));
            svint16_t aa1 = svabs_s16_x(p16, svadd_s16_x(p16, b1, b3));
            svint16_t aa3 = svabs_s16_x(p16, svsub_s16_x(p16, b1, b3));
            svint16_t aa4 = svabs_s16_x(p16, svadd_s16_x(p16, b4, b6));
            svint16_t aa6 = svabs_s16_x(p16, svsub_s16_x(p16, b4, b6));
            svint16_t aa5 = svabs_s16_x(p16, svadd_s16_x(p16, b5, b7));
            svint16_t aa7 = svabs_s16_x(p16, svsub_s16_x(p16, b5, b7));
            svuint16_t max0 = svmax_u16_x(p16, svreinterpret_u16_s16(aa0), svreinterpret_u16_s16(aa4));
            svuint16_t max1 = svmax_u16_x(p16, svreinterpret_u16_s16(aa1), svreinterpret_u16_s16(aa5));
            svuint16_t max2 = svmax_u16_x(p16, svreinterpret_u16_s16(aa2), svreinterpret_u16_s16(aa6));
            svuint16_t max3 = svmax_u16_x(p16, svreinterpret_u16_s16(aa3), svreinterpret_u16_s16(aa7));
            hsb = svadd_u16_x(p16, svadd_u16_x(p16, max0, max1), svadd_u16_x(p16, max2, max3));
        }
        acca[band] += svaddv_u16(p16, hsa);
        accb[band] += svaddv_u16(p16, hsb);
    }
    return (int)(((acca[0] + 1) >> 1) + ((acca[1] + 1) >> 1) + ((accb[0] + 1) >> 1) + ((accb[1] + 1) >> 1));
}
