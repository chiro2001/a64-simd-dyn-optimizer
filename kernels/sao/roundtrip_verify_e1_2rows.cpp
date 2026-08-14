// Differential verify: generated roundtrip candidate vs the open-source
// NEON processSaoCUE1_2Rows_neon (64x2) and a C baseline.
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
#define DYNOPT_CANDIDATE dynopt_sao_e1_2rows_64x2_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(uint8_t*, int8_t*, int8_t*, intptr_t);

static void ref_c(uint8_t* rec, int8_t* up, const int8_t* off, int w, int h,
                  intptr_t stride)
{
    for (int y = 0; y < h; y++)
    {
        for (int x = 0; x < w; x++)
        {
            int d = (int)rec[x] - (int)rec[x + stride];
            int8_t sd = d < 0 ? -1 : (d > 0 ? 1 : 0);
            int et = sd + up[x] + 2;
            up[x] = (int8_t)(-sd);
            int v = (int)rec[x] + off[et];
            rec[x] = (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
        }
        rec += stride;
    }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5A1E2026u);
    int mism = 0;
    int strides[4] = { 64, 65, 96, 128 };
    for (int i = 0; i < cases; i++)
    {
        uint8_t src[3 * 128 + 16], a[3 * 128 + 16], b[3 * 128 + 16];
        int8_t up1[128], up2[128], up3[128];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() & 0xFF);
        int8_t off[5];
        for (int j = 0; j < 5; j++)
            off[j] = (int8_t)(rng() % 33) - 16;
        for (int j = 0; j < 128; j++)
        {
            up1[j] = (int8_t)(rng() % 3) - 1;
            up2[j] = up1[j];
            up3[j] = up1[j];
        }
        intptr_t stride = strides[rng() % 4];
        memcpy(a, src, sizeof(src));
        memcpy(b, src, sizeof(src));
        ref_c(a, up1, off, 64, 2, stride);
        processSaoCUE1_2Rows_neon(b, up2, off, stride, 64);
        DYNOPT_CANDIDATE(src, up3, off, stride);
        for (int k = 0; k < 3 * (int)stride + 16; k++)
            if (a[k] != b[k] || a[k] != src[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d[%d]: c=%d neon=%d gen=%d\n",
                            i, k, a[k], b[k], src[k]);
                mism++;
                break;
            }
        for (int k = 0; k < 64 && !mism; k++)
            if (up1[k] != up2[k] || up1[k] != up3[k])
            {
                if (mism < 5)
                    fprintf(stderr, "mismatch %d up[%d]: c=%d neon=%d gen=%d\n",
                            i, k, up1[k], up2[k], up3[k]);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
