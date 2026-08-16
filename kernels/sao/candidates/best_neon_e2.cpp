// SAO edge offset class 2 (diagonal 135deg), 64x1 NEON — slot-safe
// for saoCuOrgE2 (processSaoCUE2: single row).
#include <arm_neon.h>
#include <stdint.h>

extern "C" void dynopt_sao_e2_64_sve2(
    uint8_t* rec, int8_t* bufft, int8_t* buff1, int8_t* offsetEo,
    intptr_t stride)
{
    int8x8_t tbl = vld1_s8(offsetEo);
    for (int x = 0; x < 64; x += 8)
    {
        uint8x8_t in0 = vld1_u8(rec + x);
        uint8x8_t in1 = vld1_u8(rec + x + stride + 1);
        int16x8_t d = vreinterpretq_s16_u16(vsubl_u8(in0, in1));
        int8x8_t sd = vmovn_s16(vmaxq_s16(vminq_s16(d, vdupq_n_s16(1)),
                                          vdupq_n_s16(-1)));
        int8x8_t su = vld1_s8(buff1 + x);
        int8x8_t et = vadd_s8(vadd_s8(sd, su), vdup_n_s8(2));
        vst1_s8(bufft + x + 1, vneg_s8(sd));
        int16x8_t t1 = vmovl_s8(vtbl1_s8(tbl, et));
        vst1_u8(rec + x,
                vqmovun_s16(vreinterpretq_s16_u16(
                    vaddw_u8(vreinterpretq_u16_s16(t1), in0))));
    }
}
