// Differential verify: generated roundtrip candidate vs
// x265_dequant_normal_neon (open-source NEON asm reference). C reference
// is informational only (add-then-floor vs SRSHL can differ on negative
// ties); the acceptance standard is candidate == NEON asm (docs/37).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <vector>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_dequant_normal_256_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    const int16_t* q, int16_t* c, int scale, int shift);
extern "C" void x265_dequant_normal_neon(
    const int16_t* q, int16_t* c, int num, int scale, int shift);

static int dequant_c(const int16_t* q, int16_t* c, int num,
                     int scale, int shift)
{
    int add = 1 << (shift - 1);
    int bad = 0;
    for (int n = 0; n < num; n++)
    {
        int coeffQ = (q[n] * scale + add) >> shift;
        int clip = coeffQ < -32768 ? -32768 : (coeffQ > 32767 ? 32767
                                                               : coeffQ);
        if ((int)c[n] != clip)
            bad++;
    }
    return bad;
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    const int num = 256;
    std::mt19937 rng(0xDE0A2026u);
    int mism = 0;
    int c_vs_neon = 0;
    int scales[8] = { 1, 3, 16, 64, 72, 255, 1024, 18432 };
    int shifts[6] = { 1, 2, 4, 6, 8, 10 };
    for (int i = 0; i < cases; i++)
    {
        std::vector<int16_t> q(num), c1(num), c2(num);
        for (int j = 0; j < num; j++)
            q[j] = (int16_t)(rng() & 0xFFFF);
        int scale = scales[rng() % 8];
        int shift = shifts[rng() % 6];
        x265_dequant_normal_neon(q.data(), c1.data(), num, scale, shift);
        DYNOPT_CANDIDATE(q.data(), c2.data(), scale, shift);
        c_vs_neon += dequant_c(q.data(), c1.data(), num, scale, shift);
        for (int j = 0; j < num; j++)
            if (c1[j] != c2[j])
            {
                if (mism < 5)
                    fprintf(stderr,
                            "mismatch %d[%d]: neon=%d gen=%d scale=%d "
                            "shift=%d q=%d\n",
                            i, j, c1[j], c2[j], scale, shift, q[j]);
                mism++;
            }
    }
    printf("cases=%d mismatches=%d (c_vs_neon=%d informational)\n",
           cases, mism, c_vs_neon);
    return mism ? 1 : 0;
}
