// Differential probe for the generated DCT16 roundtrip candidate against
// the x265 C reference dct16_c (pinned b81f650). Uniform [-255,255] inputs,
// strides {16,17,32}.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
void dct16_c(const int16_t* src, int16_t* dst, intptr_t srcStride);
void dct16_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

extern "C" void dynopt_dct16_neon_candidate(
    const int16_t*, int16_t*, intptr_t) __attribute__((weak));

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 16, 17, 32 };

    int mism = 0;
    int mism_neon = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        int16_t buf[16 * 32 + 16];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)((int)(rng() % 511) - 255);

        int16_t want[256], got[256];
        int16_t up[256];
        x265::dct16_c(buf, want, stride);
        memset(got, 0, sizeof(got));
        dynopt_dct16_neon_candidate(buf, got, stride);
        x265::dct16_neon(buf, up, stride);
        if (memcmp(got, up, sizeof(up)) != 0)
            mism_neon++;
        if (memcmp(want, got, sizeof(want)) != 0)
        {
            mism++;
            if (mism == 1)
            {
                fprintf(stderr, "dct16 mismatch stride=%d\n", stride);
                int k = 0;
                for (; k < 256; k++)
                    if (want[k] != got[k])
                        break;
                fprintf(stderr, " first-diff idx=%d want=%d got=%d\n",
                        k, want[k], got[k]);
            }
        }
    }
    printf("cases=%d mismatches=%d candidate_vs_neon_mismatches=%d\n",
           cases, mism, mism_neon);
    return mism != 0;
}
