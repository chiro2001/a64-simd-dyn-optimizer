// Differential verify: generated roundtrip candidate vs
// x265_ssim_4x4x2_core_neon (open-source NEON asm), two 4x4 blocks.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <vector>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_ssim_4x4x2_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t, int32_t*);
extern "C" void x265_ssim_4x4x2_core_neon(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t, int32_t*);

static void ssim_c(const uint8_t* p1, intptr_t s1,
                   const uint8_t* p2, intptr_t s2, int32_t sums[8])
{
    for (int z = 0; z < 2; z++)
    {
        uint32_t s1s = 0, s2s = 0, ss = 0, s12 = 0;
        for (int y = 0; y < 4; y++)
            for (int x = 0; x < 4; x++)
            {
                int a = p1[x + y * s1];
                int b = p2[x + y * s2];
                s1s += a;
                s2s += b;
                ss += a * a;
                ss += b * b;
                s12 += a * b;
            }
        sums[z * 4 + 0] = (int32_t)s1s;
        sums[z * 4 + 1] = (int32_t)s2s;
        sums[z * 4 + 2] = (int32_t)ss;
        sums[z * 4 + 3] = (int32_t)s12;
        p1 += 4;
        p2 += 4;
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x51D2026u);
    int mism = 0;
    int strides[5] = { 8, 16, 17, 32, 64 };
    for (int i = 0; i < cases; i++)
    {
        uint8_t buf1[4 * 64 + 16], buf2[4 * 64 + 16];
        for (int j = 0; j < (int)sizeof(buf1); j++)
        {
            buf1[j] = (uint8_t)(rng() & 0xFF);
            buf2[j] = (uint8_t)(rng() & 0xFF);
        }
        intptr_t s1 = strides[rng() % 5];
        intptr_t s2 = strides[rng() % 5];
        int32_t w[8], n[8], g[8];
        ssim_c(buf1, s1, buf2, s2, w);
        x265_ssim_4x4x2_core_neon(buf1, s1, buf2, s2, n);
        DYNOPT_CANDIDATE(buf1, s1, buf2, s2, g);
        for (int k = 0; k < 8; k++)
            if (w[k] != n[k] || w[k] != g[k])
            {
                if (mism < 5)
                    fprintf(stderr,
                            "mismatch %d[%d]: c=%d neon=%d gen=%d "
                            "s1=%ld s2=%ld\n",
                            i, k, w[k], n[k], g[k], (long)s1, (long)s2);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
