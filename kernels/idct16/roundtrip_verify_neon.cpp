// Differential probe for the generated idct16 NEON roundtrip candidate
// (structured CFG import, docs/42 G2b) against the upstream
// x265::idct16_neon (the kernel the seed was imported from).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
void idct16_neon(const int16_t* src, int16_t* dst, intptr_t dstStride);
}

extern "C" void dynopt_idct16_neon_roundtrip(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 16, 32, 64 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ds = strides[rng() % 3];
        int16_t buf[16 * 64 + 16], wa[16 * 64], wb[16 * 64];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)(rng() % 511 - 255);
        x265::idct16_neon(buf, wa, ds);
        dynopt_idct16_neon_roundtrip(buf, wb, ds);
        if (memcmp(wa, wb, sizeof(wa)) != 0)
        {
            if (mism < 5)
                fprintf(stderr, "stride %ld\n", (long)ds);
            mism++;
        }
    }
    printf("cases=%d mismatches=%ld\n", cases, mism);
    return mism ? 1 : 0;
}
