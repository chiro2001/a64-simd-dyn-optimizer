// Differential verify: generated roundtrip candidate vs
// x265_scale2D_64to32_neon.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_scale2d_64to32_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(uint8_t*, const uint8_t*, intptr_t);
extern "C" void x265_scale2D_64to32_neon(uint8_t*, const uint8_t*, intptr_t);

static void ref(uint8_t* dst, const uint8_t* src, intptr_t stride)
{
    for (uint32_t y = 0; y < 64; y += 2)
        for (uint32_t x = 0; x < 64; x += 2)
        {
            int s = src[(y + 0) * stride + (x + 0)]
                  + src[(y + 0) * stride + (x + 1)]
                  + src[(y + 1) * stride + (x + 0)]
                  + src[(y + 1) * stride + (x + 1)];
            dst[y / 2 * 32 + x / 2] = (uint8_t)((s + 2) >> 2);
        }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5C2D2026u);
    int mism = 0;
    int strides[4] = { 64, 65, 96, 128 };
    for (int i = 0; i < cases; i++)
    {
        uint8_t src[64 * 128 + 16], w[1024], n[1024], g[1024];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() & 0xFF);
        intptr_t stride = strides[rng() % 4];
        ref(w, src, stride);
        x265_scale2D_64to32_neon(n, src, stride);
        DYNOPT_CANDIDATE(g, src, stride);
        for (int k = 0; k < 1024; k++)
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
