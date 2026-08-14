// Differential probe for the tool-generated SVE2 IDCT16 candidate against
// the x265 C reference (x265::idct16_c) at fixed VL=256.
//
// Contract (2026-08-14): upstream has no SVE IDCT, so the C reference is
// the bit-exact oracle (unlike dct16 where upstream SVE is the contract).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <sys/prctl.h>

namespace x265 {
void idct16_c(const int16_t*, int16_t*, intptr_t);
}

extern "C" void dynopt_idct16_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
#ifndef PR_SVE_SET_VL
#define PR_SVE_SET_VL 50
#endif
    const int vl = prctl(PR_SVE_SET_VL, 32, 0, 0, 0, 0);
    if (vl < 0)
    {
        perror("prctl(PR_SVE_SET_VL)");
        return 77;
    }
    if (vl != 32)
    {
        fprintf(stderr, "prctl returned VL=%d bytes, contract requires 32\n",
                vl);
        return 78;
    }

    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x1D4716u);
    const int strides[3] = { 16, 17, 32 };

    long mism = 0, total = 0;
    int first_k = -1;
    int16_t first_want = 0, first_got = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        int16_t src[16 * 16];
        for (int j = 0; j < 16 * 16; j++)
            src[j] = (int16_t)(int)(rng() % 65536) - 32768;

        int16_t want[16 * 32 + 16], got[16 * 32 + 16];
        memset(want, 0, sizeof(want));
        memset(got, 0, sizeof(got));
        x265::idct16_c(src, want, stride);
        dynopt_idct16_sve2_shared(src, got, stride);
        total += 256;
        for (int k = 0; k < 256; k++)
            if (want[k] != got[k])
            {
                mism++;
                if (first_k < 0)
                {
                    first_k = k;
                    first_want = want[k];
                    first_got = got[k];
                }
            }
    }
    printf("cases=%d lanes=%ld mismatches=%ld rate=%.6f%%\n",
           cases, total, mism, 100.0 * mism / total);
    if (first_k >= 0)
        printf(" first-diff idx=%d want=%d got=%d\n",
               first_k, first_want, first_got);
    return mism != 0;
}
