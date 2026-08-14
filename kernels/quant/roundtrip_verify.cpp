// Differential verify: generated roundtrip candidate vs
// x265_quant_neon (open-source NEON asm), numCoeff=256.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_quant_256_roundtrip
#endif
extern "C" uint32_t DYNOPT_CANDIDATE(
    const int16_t*, const int32_t*, int32_t*, int16_t*, int, int);
extern "C" uint32_t x265_quant_neon(
    const int16_t*, const int32_t*, int32_t*, int16_t*, int, int, int);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    const int num = 256;
    std::mt19937 rng(0x0A7E2026u);
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        std::vector<int16_t> coef(num), q1(num), q2(num);
        std::vector<int32_t> qc(num), d1(num), d2(num);
        for (int j = 0; j < num; j++)
        {
            coef[j] = (int16_t)(rng() & 0xFFFF);
            qc[j] = 1 + (int32_t)(rng() % 16384);
        }
        const int qBits = 14 + (int)(rng() % 9);          // 14..22
        const int add = (int)(rng() % (1 << qBits));
        const uint32_t s1 = x265_quant_neon(
            coef.data(), qc.data(), d1.data(), q1.data(),
            qBits, add, num);
        const uint32_t s2 = DYNOPT_CANDIDATE(
            coef.data(), qc.data(), d2.data(), q2.data(), qBits, add);
        if (s1 != s2)
        {
            if (mism < 5)
                fprintf(stderr, "mismatch %d: numsig ref=%u gen=%u\n",
                        i, s1, s2);
            mism++;
            continue;
        }
        for (int j = 0; j < num; j++)
        {
            if (q1[j] != q2[j] || d1[j] != d2[j])
            {
                if (mism < 5)
                    fprintf(stderr,
                            "mismatch %d[%d]: q ref=%d gen=%d "
                            "d ref=%d gen=%d\n",
                            i, j, q1[j], q2[j], d1[j], d2[j]);
                mism++;
                break;
            }
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
