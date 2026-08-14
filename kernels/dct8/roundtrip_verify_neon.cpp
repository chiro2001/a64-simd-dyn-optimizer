// Differential probe for the generated dct8 NEON roundtrip candidate
// against the upstream x265::dct8_neon (the kernel the seed was imported
// from). The C oracle is intentionally NOT used: upstream dct8_neon has a
// known ~0.87% s16-wrap divergence from dct8_c (m12 finding), and the
// seed-line gate checks bit-exactness with the imported kernel.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
void dct8_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

extern "C" void dynopt_dct8_neon_candidate(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 8, 16, 32 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ss = strides[rng() % 3];
        const intptr_t ds = strides[rng() % 3];
        int16_t buf[8 * 32 + 16], wa[64], wb[64];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)(rng() % 511 - 255);
        x265::dct8_neon(buf, wa, ss);
        dynopt_dct8_neon_candidate(buf, wb, ss);
        if (memcmp(wa, wb, sizeof(wa)) != 0)
        {
            if (mism < 5)
                fprintf(stderr, "stride %ld/%ld\n", (long)ss, (long)ds);
            mism++;
        }
    }
    printf("cases=%d mismatches=%ld\n", cases, mism);
    return mism ? 1 : 0;
}
