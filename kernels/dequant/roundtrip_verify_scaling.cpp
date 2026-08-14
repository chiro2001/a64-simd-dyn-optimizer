// Differential verify: generated roundtrip candidate vs
// x265_dequant_scaling_neon for one branch (DQS_BRANCH = gt | le).
// gt: shift+4 > per; le: shift+4 <= per. Candidate ABI is
// (q, dq, c, shift, per); reference ABI adds num.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

#ifndef DQS_BRANCH
#error "define DQS_BRANCH = gt | le"
#endif

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_dequant_scaling_256_roundtrip
#endif
extern "C" void DYNOPT_CANDIDATE(
    const int16_t*, const int32_t*, int16_t*, int, int);
extern "C" void x265_dequant_scaling_neon(
    const int16_t*, const int32_t*, int16_t*, int, int, int);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    const int num = 256;
    std::mt19937 rng(0x5CA1E2026u);
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        std::vector<int16_t> q(num), c1(num), c2(num);
        std::vector<int32_t> dq(num);
        for (int j = 0; j < num; j++)
        {
            q[j] = (int16_t)(rng() & 0xFFFF);
            dq[j] = (int32_t)(rng() % 2097153) - 1048576;
        }
#if DQS_BRANCH == 1
        // gt: shift+4 > per
        const int per = 8 + (int)(rng() % 5);            // 8..12
        const int lo = per - 3;
        const int shift = lo + (int)(rng() % (10 - lo + 1));
#else
        // le: shift+4 <= per
        const int per = (rng() % 2) ? 8 : 16;
        const int shift = 1 + (int)(rng() % (per - 4));
#endif
        x265_dequant_scaling_neon(
            q.data(), dq.data(), c1.data(), num, per, shift);
        DYNOPT_CANDIDATE(q.data(), dq.data(), c2.data(), shift, per);
        for (int j = 0; j < num; j++)
            if (c1[j] != c2[j])
            {
                if (mism < 5)
                    fprintf(stderr,
                            "mismatch %d[%d]: neon=%d gen=%d per=%d "
                            "shift=%d q=%d dq=%d\n",
                            i, j, c1[j], c2[j], per, shift, q[j], dq[j]);
                mism++;
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
