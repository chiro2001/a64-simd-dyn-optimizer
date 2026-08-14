// Differential verify: generated roundtrip candidate vs the open-source
// NEON processSaoCUE2_neon (64x1) and a C baseline.
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
#define DYNOPT_CANDIDATE dynopt_sao_e2_64_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    uint8_t*, int8_t*, int8_t*, int8_t*, intptr_t);

static void ref_c(uint8_t* rec, int8_t* bufft, int8_t* buff1,
                  const int8_t* off, int w, intptr_t stride)
{
    for (int x = 0; x < w; x++)
    {
        int d = (int)rec[x] - (int)rec[x + stride + 1];
        int8_t sd = d < 0 ? -1 : (d > 0 ? 1 : 0);
        int et = sd + buff1[x] + 2;
        bufft[x + 1] = (int8_t)(-sd);
        int v = (int)rec[x] + off[et];
        rec[x] = (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5A2E2026u);
    int mism = 0;
    int strides[4] = { 64, 65, 96, 128 };
    for (int i = 0; i < cases; i++)
    {
        uint8_t src[2 * 128 + 16], a[2 * 128 + 16], b[2 * 128 + 16];
        int8_t bt1[130], bt2[130], bt3[130], b1[130], b2[130], b3[130];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() & 0xFF);
        int8_t off[5];
        for (int j = 0; j < 5; j++)
            off[j] = (int8_t)(rng() % 33) - 16;
        for (int j = 0; j < 130; j++)
        {
            b1[j] = (int8_t)(rng() % 3) - 1;
            b2[j] = b1[j];
            b3[j] = b1[j];
            bt1[j] = (int8_t)(rng() % 3) - 1;
            bt2[j] = bt1[j];
            bt3[j] = bt1[j];
        }
        intptr_t stride = strides[rng() % 4];
        memcpy(a, src, sizeof(src));
        memcpy(b, src, sizeof(src));
        ref_c(a, bt1, b1, off, 64, stride);
        processSaoCUE2_neon(b, bt2, b2, off, 64, stride);
        DYNOPT_CANDIDATE(src, bt3, b3, off, stride);
        for (int k = 0; k < 2 * (int)stride + 16; k++)
            if (a[k] != b[k] || a[k] != src[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d[%d]: c=%d neon=%d gen=%d\n",
                            i, k, a[k], b[k], src[k]);
                mism++;
                break;
            }
        for (int k = 0; k < 65 && !mism; k++)
            if (bt1[k] != bt2[k] || bt1[k] != bt3[k] ||
                b1[k] != b2[k] || b1[k] != b3[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d buf[%d]\n", i, k);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
