// Differential probe for the DCT16 SVE256 dense-dot candidate (fixed VL=256)
// against the x265 C reference dct16_c (pinned b81f650). Uniform [-255,255]
// inputs, strides {16,17,32}. The candidate must be C-exact: the upstream
// NEON/SVE kernels carry a known ~0.0045% divergence from the C reference,
// while the dense form computes in s64/s32 and should report zero mismatches.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <sys/prctl.h>

namespace x265 {
void dct16_c(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

extern "C" void dynopt_dct16_sve2_dense(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
#ifndef PR_SVE_SET_VL
#define PR_SVE_SET_VL 50
#endif
    // fixed vector length contract: 32 bytes = 256 bits
    if (prctl(PR_SVE_SET_VL, 32, 0, 0, 0, 0) < 0)
    {
        perror("prctl(PR_SVE_SET_VL)");
        return 77;
    }

    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 16, 17, 32 };

    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        int16_t buf[16 * 32 + 16];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)((int)(rng() % 511) - 255);

        int16_t want[256], got[256];
        x265::dct16_c(buf, want, stride);
        memset(got, 0, sizeof(got));
        dynopt_dct16_sve2_dense(buf, got, stride);
        if (memcmp(want, got, sizeof(want)) != 0)
        {
            mism++;
            if (mism == 1)
            {
                fprintf(stderr, "dct16 sve2 dense mismatch stride=%d\n", stride);
                int k = 0;
                for (; k < 256; k++)
                    if (want[k] != got[k])
                        break;
                fprintf(stderr, " first-diff idx=%d want=%d got=%d\n",
                        k, want[k], got[k]);
            }
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism != 0;
}
