// Differential verify: generated roundtrip candidate vs the open-source
// NEON saoCuStatsBO_neon (X265_NS, sao-prim.cpp compiled in) and a C
// reference (encoder/sao.cpp saoCuStatsBO_c), 64x1.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>

#define HAVE_NEON 1
#define X265_DEPTH 8
#define HIGH_BIT_DEPTH 0
#define X265_NS x265
#include "../../third_party/x265/source/common/aarch64/sao-prim.cpp"

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_sao_stats_bo_64_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    const int16_t*, const uint8_t*, intptr_t, int32_t*, int32_t*);

static void ref_c(const int16_t* diff, const uint8_t* rec,
                  int32_t* stats, int32_t* count)
{
    // Mirrors saoCuStatsBO_c: classIdx = pixel >> (depth - BO_BITS) = >>3.
    for (int x = 0; x < 64; x++)
    {
        int cls = rec[x] >> 3;
        stats[cls] += diff[x];
        count[cls]++;
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5AAE2026u);
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        int16_t diff[80];
        uint8_t rec[2 * 128 + 16];
        int32_t s1[32] = { 0 }, s2[32] = { 0 }, s3[32] = { 0 };
        int32_t c1[32] = { 0 }, c2[32] = { 0 }, c3[32] = { 0 };
        // Match PixelHarness sbuf2 range (SMAX = 1<<12): [-4097, 4094].
        for (int j = 0; j < 80; j++)
            diff[j] = (int16_t)(rng() % (2 * 4096 + 1)) - 4096 - 1;
        for (int j = 0; j < (int)sizeof(rec); j++)
            rec[j] = (uint8_t)(rng() & 0xFF);
        ref_c(diff, rec, s1, c1);
        X265_NS::saoCuStatsBO_neon(diff, rec, 64, 64, 1, s2, c2);
        DYNOPT_CANDIDATE(diff, rec, 64, s3, c3);
        for (int k = 0; k < 32; k++)
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
