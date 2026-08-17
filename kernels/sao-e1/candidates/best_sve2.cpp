// SAO edge offset class 1 (vertical), 64x4 SVE2 candidate.
//
// Port of processSaoCUE1_neon (loopfilter-prim.cpp): per pixel,
// signDown = sign(rec[x] - rec[x+stride]), edgeType = signDown +
// upBuff[x] + 2 (0..4), rec[x] = saturate(rec[x] + eoTable[edgeType]),
// upBuff[x] = -signDown (carried to the next row). Width-native at
// VL=256 (32-pixel chunks); the eoTable is a 5-entry svtbl lookup.
// Saturating add/narrow reuses the sao-b0 pattern (svqadd_s16 +
// svqxtunb/t merge + svuzp1 compaction, 16-byte predicate stores).
//
// Gate-arbitrated bit-exact vs processSaoCUE1_neon (64x4, upBuff
// compared after all rows).

#include <arm_sve.h>
#include <stdint.h>
#include <stddef.h>

extern "C" void dynopt_sao_e1_64x4_sve2(uint8_t* rec, int8_t* upBuff,
                                        const int8_t* offsetEo,
                                        intptr_t stride)
{
    const svbool_t pg32 = svptrue_b8();
    const svbool_t pg16 = svptrue_b16();
    const svbool_t pg16b = svwhilelt_b8_u64(0, 16);
    const svbool_t pg5 = svwhilelt_b8_u64(0, 5);
    const svint8_t n1 = svdup_n_s8(-1);
    const svint8_t z0 = svdup_n_s8(0);
    const svint8_t c2 = svdup_n_s8(2);
    const svint8_t eo = svld1_s8(pg5, offsetEo);  // 5-entry eoTable
    for (int r = 0; r < 4; r++)
    {
        uint8_t* row = rec + r * stride;
        for (int x = 0; x < 64; x += 32)
        {
            svuint8_t in0 = svld1_u8(pg32, row + x);
            svuint8_t in1 = svld1_u8(pg32, row + x + stride);
            // signDown = sign(in0 - in1): -1 if in0<in1, +1 if in0>in1.
            svint8_t sd = svsub_s8_x(
                pg32, svsel_s8(svcmpgt_u8(pg32, in1, in0), n1, z0),
                      svsel_s8(svcmpgt_u8(pg32, in0, in1), n1, z0));
            svint8_t su = svld1_s8(pg32, upBuff + x);
            svint8_t et = svadd_s8_x(pg32, svadd_s8_x(pg32, sd, su), c2);
            svst1_s8(pg32, upBuff + x, svneg_s8_x(pg32, sd));
            svint8_t tbl = svtbl_s8(eo, svreinterpret_u8_s8(et));
            svint16_t inl = svreinterpret_s16_u16(svunpklo_u16(in0));
            svint16_t inh = svreinterpret_s16_u16(svunpkhi_u16(in0));
            svint16_t ol = svunpklo_s16(tbl);
            svint16_t oh = svunpkhi_s16(tbl);
            svint16_t sl = svqadd_s16_x(pg16, inl, ol);
            svint16_t sh = svqadd_s16_x(pg16, inh, oh);
            svuint8_t l0 = svqxtunb_s16(sl);
            svuint8_t lf = svuzp1_u8(svqxtunt_s16(l0, sl),
                                     svqxtunt_s16(l0, sl));
            svuint8_t h0 = svqxtunb_s16(sh);
            svuint8_t hf = svuzp1_u8(svqxtunt_s16(h0, sh),
                                     svqxtunt_s16(h0, sh));
            svst1_u8(pg16b, row + x + 0, lf);
            svst1_u8(pg16b, row + x + 16, hf);
        }
    }
}
