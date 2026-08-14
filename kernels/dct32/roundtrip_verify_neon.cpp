// Differential probe for the generated dct32 NEON roundtrip candidate
// (flat import, docs/42) against x265::dct32_neon.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
void dct32_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

extern "C" void dynopt_dct32_neon_roundtrip(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 5000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 32, 64, 96 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ss = strides[rng() % 3];
        int16_t buf[32 * 96 + 16], wa[32 * 96], wb[32 * 96];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)(rng() % 511 - 255);
        x265::dct32_neon(buf, wa, ss);
        dynopt_dct32_neon_roundtrip(buf, wb, ss);
        if (memcmp(wa, wb, sizeof(wa)) != 0)
        {
            if (mism < 5)
                fprintf(stderr, "stride %ld\n", (long)ss);
            mism++;
        }
    }
    printf("cases=%d mismatches=%ld\n", cases, mism);
    return mism ? 1 : 0;
}
