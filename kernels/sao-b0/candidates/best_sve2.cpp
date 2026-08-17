// SAO band offset (64x4) SVE2 candidate: width-native table lookup.
//
// Port of processSaoCUB0_neon (loopfilter-prim.cpp): per 8-bit pixel,
// tbl_idx = pixel >> 3 (boShift = X265_DEPTH - 5 = 3), offset =
// offset_table[tbl_idx], pixel' = saturate(pixel + offset). Width-native
// at VL=256: 32-pixel chunks, svtbl with the 32-entry offset table (one
// full vector), s16 saturating add (svqadd_s16) then saturating narrow
// (svqxtunb/t) compacted with svuzp1 (SVE2 XTN duplicates into even
// bytes) and 8-byte-predicate stores.
//
// Gate-arbitrated bit-exact vs processSaoCUB0_neon (20000 cases).

#include <arm_sve.h>
#include <stdint.h>
#include <stddef.h>

extern "C" void dynopt_sao_b0_64x4_sve2(uint8_t* rec, const int8_t* offset,
                                        intptr_t stride)
{
    const svbool_t pg32 = svptrue_b8();
    const svbool_t pg16 = svptrue_b16();
    const svbool_t pg16b = svwhilelt_b8_u64(0, 16);
    const svint8_t offs = svld1_s8(pg32, offset);  // 32-entry table
    for (int r = 0; r < 4; r++)
    {
        uint8_t* row = rec + r * stride;
        for (int x = 0; x < 64; x += 32)
        {
            svuint8_t in = svld1_u8(pg32, row + x);
            svuint8_t idx = svlsr_n_u8_x(pg32, in, 3);   // pixel >> 3
            svint8_t tbl = svtbl_s8(offs, idx);          // offset[in>>3]
            svint16_t inl = svreinterpret_s16_u16(svunpklo_u16(in));
            svint16_t inh = svreinterpret_s16_u16(svunpkhi_u16(in));
            svint16_t ol = svunpklo_s16(tbl);
            svint16_t oh = svunpkhi_s16(tbl);
            svint16_t sl = svqadd_s16_x(pg16, inl, ol);
            svint16_t sh = svqadd_s16_x(pg16, inh, oh);
            // SVE2 XTN duplicates each narrowed u8 into even bytes;
            // svqxtunt_s16(lo, op) merges the top-8 narrow with lo, then
            // one svuzp1 compacts all 16 u8 into bytes 0-15.
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
