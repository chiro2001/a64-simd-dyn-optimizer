// Probe: SVE1 indexed SDOT (Zda.D, Zn.H, Zm.H[imm], FEAT_SVE) semantics
// and GCC
// intrinsic availability. VL=256: qemu-aarch64 -cpu max,sve-max-vq=2
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>

static void print64(const char* tag, svint64_t v)
{
    int64_t o[8];
    svst1_s64(svptrue_b64(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 4; i++) printf(" %ld", (long)o[i]);
    printf("\n");
}

int main()
{
    // data: 16 lanes 1..16 (seg0 = 1..8, seg1 = 9..16)
    svint16_t data = svindex_s16(1, 1);
    // const: seg0 group0 = [10,20,30,40], seg0 group1 = [50,60,70,80];
    //        seg1 group0 = [11,22,33,44], seg1 group1 = [55,66,77,88]
    const int16_t c[16] = { 10,20,30,40, 50,60,70,80,
                            11,22,33,44, 55,66,77,88 };
    register svint16_t cvec asm("z1") = svld1_s16(svptrue_b16(), c);
    svint64_t acc = svdup_n_s64(0);
#ifdef __clang__
    acc = svdot_lane_s64(acc, data, cvec, 0);
    acc = svdot_lane_s64(acc, data, cvec, 1);
#else
    // GCC: use inline asm for the indexed form
    asm volatile(
        "sdot %0.d, %1.h, %2.h[0]\n"
        "sdot %0.d, %1.h, %2.h[1]\n"
        : "+w" (acc)
        : "w" (data), "w" (cvec));
#endif
    print64("idx0+idx1", acc);
    // expected: lane0 = (1..4).(10..40) + (1..4).(50..80)
    //         = 300 + 700 = 1000
    // lane1 = (5..8).(10..40) + (5..8).(50..80) = 700+1740 = 2440
    // lane2 = (9..12).(11,22,33,44) + (9..12).(55,66,77,88)
    //       = 11+44+99+176? 9*11+10*22+11*33+12*44=99+220+363+528=1210
    //       + 9*55+10*66+11*77+12*88=495+660+847+1056=3058 => 4268
    // lane3 = (13..16).(11..44)+(13..16).(55..88)
    //       = 143+308+495+704=1650 + 715+924+1155+1408=4202 => 5852
    printf("expect ~1000 2440 4268 5852\n");
    return 0;
}
