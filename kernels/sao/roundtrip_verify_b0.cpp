// Differential verify: generated roundtrip candidate vs the open-source
// NEON processSaoCUB0_neon (loopfilter-prim.cpp compiled in) and the C
// baseline, fixed 64x4.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

#define HAVE_NEON 1
#define X265_DEPTH 8
#define HIGH_BIT_DEPTH 0
#define X265_NS x265
#include "../../third_party/x265/source/common/aarch64/loopfilter-prim.cpp"

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_sao_b0_64x4_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(uint8_t*, const int8_t*, intptr_t);

static void ref_c(uint8_t* rec, const int8_t* off, int w, int h,
                  intptr_t stride)
{
    for (int y = 0; y < h; y++)
    {
        for (int x = 0; x < w; x++)
        {
            int v = (int)rec[x] + off[rec[x] >> 3];
            rec[x] = (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
        }
        rec += stride;
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5A0B2026u);
    int mism = 0;
    int strides[4] = { 64, 65, 96, 128 };
    for (int i = 0; i < cases; i++)
    {
        uint8_t src[4 * 128 + 16], a[4 * 128 + 16], b[4 * 128 + 16];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() & 0xFF);
        int8_t off[32];
        for (int j = 0; j < 32; j++)
            off[j] = (int8_t)(rng() % 33) - 16;
        intptr_t stride = strides[rng() % 4];
        memcpy(a, src, sizeof(src));
        memcpy(b, src, sizeof(src));
        ref_c(a, off, 64, 4, stride);
        processSaoCUB0_neon(b, off, 64, 4, stride);
        DYNOPT_CANDIDATE(src, off, stride);
        for (int k = 0; k < 4 * (int)stride + 16; k++)
            if (a[k] != b[k] || a[k] != src[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d[%d]: c=%d neon=%d gen=%d\n",
                            i, k, a[k], b[k], src[k]);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
