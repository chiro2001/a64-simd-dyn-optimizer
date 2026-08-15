// CNTVCT A/B for quant (256 elems): upstream NEON asm vs SVE1 candidate.
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" uint32_t dynopt_quant_256_sve2(
    const int16_t*, const int32_t*, int32_t*, int16_t*, int, int);
extern "C" uint32_t x265_quant_neon(
    const int16_t*, const int32_t*, int32_t*, int16_t*, int, int, int);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "cand");
    const int samples = argc > 2 ? atoi(argv[2]) : 50;
    const int batch = argc > 3 ? atoi(argv[3]) : 16;
    std::mt19937 rng(0x0A7E2026u);
    std::vector<int16_t> coef(256), qo(256), qo2(256);
    std::vector<int32_t> qc(256), du(256), du2(256);
    for (int i = 0; i < 256; i++)
    {
        coef[i] = (int16_t)(rng() & 0xFFFF);
        qc[i] = 1 + (int32_t)(rng() % 16384);
    }
    const int qBits = 16, add = 128;
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++)
        {
            if (which)
                dynopt_quant_256_sve2(coef.data(), qc.data(), du.data(),
                                      qo.data(), qBits, add);
            else
                x265_quant_neon(coef.data(), qc.data(), du2.data(),
                                qo2.data(), qBits, add, 256);
        }
        uint64_t t1 = rdtsc();
        times.push_back((t1 - t0) / (uint64_t)batch);
    }
    std::sort(times.begin(), times.end());
    printf("quant,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
