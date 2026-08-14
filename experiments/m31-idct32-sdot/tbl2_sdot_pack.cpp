// TBL2 + zip1 + svdot_lane_s64 pack probe for IDCT32 O/EO sdot 化
// (docs/27 §8.7). Verified 2026-08-14 under QEMU VL=256: bad=0.
//
// Layout: rows a,b,c,d are 16-lane s16 (low 8 = chunk0 cols, high 8 =
// chunk1 cols). For one output column pair (k, k+2) and one 4-row group:
//   T1 = tbl2({a,b}, idx); T2 = tbl2({c,d}, idx); D = zip1(T1, T2)
//   idx lanes 0..7 = [k, 16+k, 8+k, 24+k, k+2, 16+k+2, 8+k+2, 24+k+2]
//   acc = svdot_lane_s64(acc, D, C, 0)
//   C lanes 0..3 = [ga[k],gc[k],gb[k],gd[k]] (row order a,c,b,d),
//   lanes 8..11 = same for column k+2.
// Result lanes: 0 = chunk0 col k (4-row partial), 1 = chunk1 col k,
// 2 = chunk0 col k+2, 3 = chunk1 col k+2. Accumulate 4 row-groups (16 odd
// rows for O; 2 groups for EO) then take low 32 bits of each s64 lane.
#include <arm_sve.h>
#include <stdint.h>
#include <stdio.h>

int main(void)
{
    int16_t ad[16], bd[16], cd[16], dd[16];
    for (int i = 0; i < 16; i++)
    {
        ad[i] = (int16_t)(1000 + i);
        bd[i] = (int16_t)(2000 + i);
        cd[i] = (int16_t)(3000 + i);
        dd[i] = (int16_t)(4000 + i);
    }
    svint16_t a = svld1_s16(svptrue_b16(), ad);
    svint16_t b = svld1_s16(svptrue_b16(), bd);
    svint16_t c = svld1_s16(svptrue_b16(), cd);
    svint16_t d = svld1_s16(svptrue_b16(), dd);

    const uint16_t idxd[16] =
        { 0, 16, 8, 24, 2, 18, 10, 26, 0, 0, 0, 0, 0, 0, 0, 0 };
    svuint16_t idx = svld1_u16(svptrue_b16(), idxd);
    svint16_t T1 = svtbl2_s16(svcreate2_s16(a, b), idx);
    svint16_t T2 = svtbl2_s16(svcreate2_s16(c, d), idx);
    svint16_t D = svzip1_s16(T1, T2);

    const int16_t ga[4] = { 1, 2, 3, 4 }, gc[4] = { 5, 6, 7, 8 };
    const int16_t gb[4] = { 9, 10, 11, 12 }, gd[4] = { 13, 14, 15, 16 };
    const int16_t cdata[16] =
        { ga[0], gc[0], gb[0], gd[0], 0, 0, 0, 0,
          ga[2], gc[2], gb[2], gd[2], 0, 0, 0, 0 };
    svint16_t C = svld1_s16(svptrue_b16(), cdata);

    svint64_t acc = svdot_lane_s64(svdup_n_s64(0), D, C, 0);
    int64_t got[8];
    svst1_s64(svptrue_b64(), got, acc);

    const int64_t want[4] = {
        (int64_t)ad[0] * ga[0] + cd[0] * gc[0] + bd[0] * gb[0] +
            dd[0] * gd[0],
        (int64_t)ad[8] * ga[0] + cd[8] * gc[0] + bd[8] * gb[0] +
            dd[8] * gd[0],
        (int64_t)ad[2] * ga[2] + cd[2] * gc[2] + bd[2] * gb[2] +
            dd[2] * gd[2],
        (int64_t)ad[10] * ga[2] + cd[10] * gc[2] + bd[10] * gb[2] +
            dd[10] * gd[2],
    };
    int bad = 0;
    for (int l = 0; l < 4; l++)
        if (got[l] != want[l])
        {
            printf("lane %d got %lld want %lld\n", l, got[l], want[l]);
            bad++;
        }
    printf("tbl2+sdot pack bad=%d\n", bad);
    return bad ? 1 : 0;
}
