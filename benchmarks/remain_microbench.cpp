// AGO M3 DFA microbench: table variant vs reference scalar formula,
// over the real-distribution shape (absCoeff 1/2 in ~75%, <=10 in
// ~99.5%). CNTVCT total ticks per batch.
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

extern "C" uint32_t dynopt_cost_coeff_remain_ref(
    uint16_t*, int, int);
extern "C" uint32_t dynopt_cost_coeff_remain_dfa(
    uint16_t*, int, int);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "dfa");
    const int samples = argc > 2 ? atoi(argv[2]) : 100;
    const int batch = argc > 3 ? atoi(argv[3]) : 4096;
    std::mt19937 rng(0x2A13u);
    std::vector<uint16_t> coef(batch * 16);
    std::vector<int> n(batch), idx(batch);
    for (int i = 0; i < batch; i++)
    {
        n[i] = 1 + (int)(rng() % 16);
        idx[i] = (int)(rng() % n[i]);
        for (int j = 0; j < n[i]; j++)
        {
            const uint32_t r = rng() % 1000;
            coef[i * 16 + j] = (uint16_t)(r < 750 ? 1 + (r & 1)
                                           : r < 995 ? rng() % 10
                                           : rng() & 0x3FF);
        }
    }
    int check = 0;
    for (int i = 0; i < 1000; i++)
        check += dynopt_cost_coeff_remain_ref(coef.data() + i * 16,
                                              n[i], idx[i]) !=
                 dynopt_cost_coeff_remain_dfa(coef.data() + i * 16,
                                              n[i], idx[i]);
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                dynopt_cost_coeff_remain_dfa(coef.data() + i * 16,
                                             n[i], idx[i]);
            else
                dynopt_cost_coeff_remain_ref(coef.data() + i * 16,
                                             n[i], idx[i]);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("ago_remain,%s,verify_bad=%d,median_total=%llu\n",
           which ? "dfa" : "ref", check,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
