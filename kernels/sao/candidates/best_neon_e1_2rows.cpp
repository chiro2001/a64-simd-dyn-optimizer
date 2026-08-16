// SAO edge offset class 1, 2 rows (64x2) NEON — slot-safe for
// saoCuOrgE1_2Rows (processSaoCUE1_2Rows: two rows sharing upBuff1).
#include <arm_neon.h>
#include <stdint.h>

extern "C" void dynopt_sao_e1_2rows_64x2_sve2(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo, intptr_t stride)
{
    int8x8_t tbl = vld1_s8(offsetEo);
    for (int y = 0; y < 2; y++)
    {
        for (int x = 0; x < 64; x += 8)
        {
            uint8x8_t in0 = vld1_u8(rec + x);
            uint8x8_t in1 = vld1_u8(rec + x + stride);
            int16x8_t d = vreinterpretq_s16_u16(vsubl_u8(in0, in1));
            int8x8_t sd = vmovn_s16(vmaxq_s16(vminq_s16(d, vdupq_n_s16(1)),
                                              vdupq_n_s16(-1)));
            int8x8_t su = vld1_s8(upBuff1 + x);
            int8x8_t et = vadd_s8(vadd_s8(sd, su), vdup_n_s8(2));
            vst1_s8(upBuff1 + x, vneg_s8(sd));
            int16x8_t t1 = vmovl_s8(vtbl1_s8(tbl, et));
            vst1_u8(rec + x,
                    vqmovun_s16(vreinterpretq_s16_u16(
                        vaddw_u8(vreinterpretq_u16_s16(t1), in0))));
        }
        rec += stride;
    }
}
