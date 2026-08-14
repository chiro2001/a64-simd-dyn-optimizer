// Differential verify: generated roundtrip candidate vs
// x265_scale1D_128to64_neon.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_scale1d_128to64_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(uint8_t*, const uint8_t*);
extern "C" void x265_scale1D_128to64_neon(uint8_t*, const uint8_t*);

static void ref(uint8_t* dst, const uint8_t* src)
{
    for (int r = 0; r < 2; r++)
        for (int x = 0; x < 128; x += 2)
            dst[r * 64 + (x >> 1)] =
                (uint8_t)((src[r * 128 + x] + src[r * 128 + x + 1] + 1) >> 1);
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5C1E2026u);
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        uint8_t src[256], w[128], n[128], g[128];
        for (int j = 0; j < 256; j++)
            src[j] = (uint8_t)(rng() & 0xFF);
        ref(w, src);
        x265_scale1D_128to64_neon(n, src);
        DYNOPT_CANDIDATE(g, src);
        for (int k = 0; k < 128; k++)
            if (w[k] != n[k] || w[k] != g[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d[%d]: c=%d neon=%d gen=%d\n",
                            i, k, w[k], n[k], g[k]);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
