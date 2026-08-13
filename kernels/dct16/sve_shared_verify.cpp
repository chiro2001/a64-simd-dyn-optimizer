// Differential probe for the tool-generated SVE2 DCT16 candidate against
// the upstream open-source SVE kernel (x265::dct16_sve) at fixed VL=256.
//
// Contract (user decision 2026-08-13): the candidate replaces the open-source
// kernel inside x265, so it must be bit-exact with dct16_sve. C-ref is only
// an algorithmic reference; the upstream's rare divergence from C (measured
// ~0.000188%) is part of the behavior contract and does not need to match.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <sys/prctl.h>

namespace x265 {
void dct16_sve(const int16_t*, int16_t*, intptr_t);
}

extern "C" void dynopt_dct16_sve2_shared(
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

    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 16, 17, 32 };

    long mism = 0, total = 0;
    int first_k = -1;
    int16_t first_want = 0, first_got = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        int16_t buf[16 * 32 + 16];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)((int)(rng() % 511) - 255);

        int16_t want[256], got[256];
        x265::dct16_sve(buf, want, stride);
        memset(got, 0, sizeof(got));
        dynopt_dct16_sve2_shared(buf, got, stride);
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
