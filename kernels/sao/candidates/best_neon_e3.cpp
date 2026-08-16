// SAO edge offset class 3 (diagonal 45deg), 64x1 NEON — slot-safe for
// saoCuOrgE3 (single row; inject adapter accepts startX==1/endX==64,
// i.e., interior CTUs; left/right edge CTUs fall back to upstream).
// Interior CTU convention (sao.cpp SAO_EO_3): the caller pre-processes
// x=startX (startX=1) using tmpL, then the primitive handles
// x=startX+1..endX-1 = 2..63.  Vector blocks x=9..49 + scalar tails
// x=2..8 and x=57..63 so upBuff1[63] is NOT written (the caller writes
// it after the primitive) and rec[64] is never touched.
#include <arm_neon.h>
#include <stdint.h>

static inline int8x8_t sao_sign3(uint8x8_t a, uint8x8_t b)
{
    int16x8_t d = vreinterpretq_s16_u16(vsubl_u8(a, b));
    return vmovn_s16(vmaxq_s16(vminq_s16(d, vdupq_n_s16(1)),
                               vdupq_n_s16(-1)));
}

#define E3_BLOCK(x)                                                       \
    do {                                                                  \
        uint8x8_t in0 = vld1_u8(rec + (x));                               \
        uint8x8_t in1 = vld1_u8(rec + (x) + stride);                      \
        int8x8_t sd = sao_sign3(in0, in1);                                \
        int8x8_t su = vld1_s8(upBuff1 + (x));                             \
        int8x8_t et = vadd_s8(vadd_s8(sd, su), vdup_n_s8(2));             \
        vst1_s8(upBuff1 + (x) - 1, vneg_s8(sd));                          \
        int16x8_t t1 = vmovl_s8(vtbl1_s8(tbl, et));                       \
        vst1_u8(rec + (x),                                                \
                vqmovun_s16(vreinterpretq_s16_u16(                       \
                    vaddw_u8(vreinterpretq_u16_s16(t1), in0))));          \
    } while (0)

extern "C" void dynopt_sao_e3_64_sve2(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo, intptr_t stride)
{
    int8x8_t tbl = vld1_s8(offsetEo);
    // Scalar head MUST precede the vector blocks: the x=9 block writes
    // upBuff1[8], which the x=8 scalar iteration reads.
    for (int x = 2; x < 9; x++)
    {
        int d = (int)rec[x] - (int)rec[x + stride];
        int8_t sd = d < 0 ? -1 : (d > 0 ? 1 : 0);
        int et = sd + upBuff1[x] + 2;
        upBuff1[x - 1] = (int8_t)(-sd);
        int v = (int)rec[x] + offsetEo[et];
        rec[x] = (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
    }
    E3_BLOCK(9);
    E3_BLOCK(17);
    E3_BLOCK(25);
    E3_BLOCK(33);
    E3_BLOCK(41);
    E3_BLOCK(49);
    for (int x = 57; x < 64; x++)
    {
        int d = (int)rec[x] - (int)rec[x + stride];
        int8_t sd = d < 0 ? -1 : (d > 0 ? 1 : 0);
        int et = sd + upBuff1[x] + 2;
        upBuff1[x - 1] = (int8_t)(-sd);
        int v = (int)rec[x] + offsetEo[et];
        rec[x] = (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
    }
}
