// CNTVCT + correctness A/B for saoCuStatsBO (round-0037).
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>
#include "common/primitives.h"
using namespace X265_NS;
extern "C" void dynopt_sao_stats_bo_64_sve2(const int16_t*, const uint8_t*,
    intptr_t, int32_t*, int32_t*);
static inline uint64_t rdtsc() { uint64_t t; __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t)); return t; }
int main(int argc, char** argv) {
    const int which = argc > 1 && !strcmp(argv[1], "cand");
    const int samples = argc > 2 ? atoi(argv[2]) : 100;
    const int batch = argc > 3 ? atoi(argv[3]) : 64;
    x265_param p; memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8; p.cpuid = cpu_detect(false);
    x265_setup_primitives(&p);
    saoCuStatsBO_t fn = primitives.saoCuStatsBO;
    std::mt19937 rng(0x5A0u);
    std::vector<int16_t> diff(64 * 8 + 8);
    std::vector<uint8_t> rec(64 * 8 + 8);
    for (size_t i = 0; i < diff.size(); i++) diff[i] = (int16_t)(rng() % 1024) - 512;
    for (size_t i = 0; i < rec.size(); i++) rec[i] = (uint8_t)rng();
    // correctness
    {
        int32_t sA[32], cA[32], sB[32], cB[32];
        memset(sA, 0, sizeof(sA)); memset(cA, 0, sizeof(cA));
        memset(sB, 0, sizeof(sB)); memset(cB, 0, sizeof(cB));
        fn(diff.data(), rec.data(), 64, 64, 1, sA, cA);
        dynopt_sao_stats_bo_64_sve2(diff.data(), rec.data(), 64, sB, cB);
        int bad = 0;
        for (int i = 0; i < 32; i++) if (sA[i] != sB[i] || cA[i] != cB[i]) bad++;
        printf("sao,verify,bad=%d\n", bad);
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++) {
        int32_t st[32], ct[32];
        memset(st, 0, sizeof(st)); memset(ct, 0, sizeof(ct));
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++) {
            const int16_t* d = diff.data() + (b & 7) * 64;
            const uint8_t* r = rec.data() + (b & 7) * 64;
            if (which) dynopt_sao_stats_bo_64_sve2(d, r, 64, st, ct);
            else fn(d, r, 64, 64, 1, st, ct);
        }
        uint64_t t1 = rdtsc();
        times.push_back((t1 - t0) / (uint64_t)batch);
    }
    std::sort(times.begin(), times.end());
    printf("sao,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size()/2]);
    return 0;
}
