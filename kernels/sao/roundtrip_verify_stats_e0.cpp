// Differential verify: generated roundtrip candidate vs the open-source
// NEON saoCuStatsE0_neon (X265_NS, sao-prim.cpp compiled in) and a C
// reference, 64x1.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

#define HAVE_NEON 1
#define X265_DEPTH 8
#define HIGH_BIT_DEPTH 0
#define X265_NS x265
#include "../../third_party/x265/source/common/aarch64/sao-prim.cpp"

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_sao_stats_e0_64_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    const int16_t*, const uint8_t*, intptr_t, int32_t*, int32_t*);

static void ref_c(const int16_t* diff, const uint8_t* rec, intptr_t stride,
                  int32_t* stats, int32_t* count)
{
    // Mirrors saoCuStatsE0_c (encoder/sao.cpp): s_eoTable = {1,2,0,3,4}.
    static const int eo_map[5] = { 1, 2, 0, 3, 4 };
    int32_t tmp_stats[5] = { 0 };
    int32_t tmp_count[5] = { 0 };
    int8_t sign_left = (int8_t)((int)rec[0] - (int)rec[-1] < 0 ? -1
                                : ((int)rec[0] - (int)rec[-1] > 0 ? 1 : 0));
    for (int x = 0; x < 64; x++)
    {
        int d = (int)rec[x] - (int)rec[x + 1];
        int8_t sr = d < 0 ? -1 : (d > 0 ? 1 : 0);
        int et = sr + sign_left + 2;
        sign_left = (int8_t)-sr;
        tmp_stats[et] += diff[x];
        tmp_count[et]++;
    }
    for (int i = 0; i < 5; i++)
    {
        stats[eo_map[i]] += tmp_stats[i];
        count[eo_map[i]] += tmp_count[i];
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5A4E2026u);
    int mism = 0;
    int strides[4] = { 64, 65, 96, 128 };
    for (int i = 0; i < cases; i++)
    {
        int16_t diff[80];
        uint8_t rec[2 * 128 + 16];
        int32_t c1[5] = { 0 }, c2[5] = { 0 }, c3[5] = { 0 };
        int32_t s1[5] = { 0 }, s2[5] = { 0 }, s3[5] = { 0 };
        // Match x265 PixelHarness sbuf2 range (SMAX = 1<<12): [-4097, 4094].
        // Wider int16 diff overflows the upstream NEON vmlaq_s16 stats path.
        for (int j = 0; j < 80; j++)
            diff[j] = (int16_t)(rng() % (2 * 4096 + 1)) - 4096 - 1;
        for (int j = 0; j < (int)sizeof(rec); j++)
            rec[j] = (uint8_t)(rng() & 0xFF);
        intptr_t stride = strides[rng() % 4];
        rec[128 + 64] = rec[0];  // left neighbor of the second row region
        ref_c(diff, rec, stride, s1, c1);
        X265_NS::saoCuStatsE0_neon(diff, rec, stride, 64, 1, s2, c2);
        DYNOPT_CANDIDATE(diff, rec, stride, s3, c3);
        for (int k = 0; k < 5; k++)
            if (s1[k] != s2[k] || s1[k] != s3[k] ||
                c1[k] != c2[k] || c1[k] != c3[k])
            {
                if (mism < 5)
                    fprintf(stderr,
                            "mismatch %d[%d]: c=%d/%d neon=%d/%d gen=%d/%d\n",
                            i, k, s1[k], c1[k], s2[k], c2[k], s3[k], c3[k]);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
