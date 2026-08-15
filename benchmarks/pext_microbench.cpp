// AGO M3 PEXT template microbench: 4-bit table pext (template output)
// vs the per-set-bit ctz loop (reference), over random 16-bit
// (val, mask) pairs. CNTVCT total ticks per batch.
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <random>
#include <vector>

extern "C" {
static inline uint16_t pext_ref16(uint16_t val, uint16_t mask)
{
    uint16_t out = 0;
    int bit = 0;
    while (mask)
    {
        const int b = __builtin_ctz((unsigned)mask);
        out |= (uint16_t)(((val >> b) & 1) << bit);
        mask &= (uint16_t)(mask - 1);
        bit++;
    }
    return out;
}
}

#include "ago_pext_impl.inc"

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "table");
    const int samples = argc > 2 ? atoi(argv[2]) : 100;
    const int batch = argc > 3 ? atoi(argv[3]) : 16384;
    std::mt19937 rng(0x2A12u);
    std::vector<uint16_t> vals(batch), masks(batch);
    for (int i = 0; i < batch; i++)
    {
        vals[i] = (uint16_t)rng();
        // realistic sparse masks: avg popcount ~4 (scanPosLast CGs)
        uint16_t m = 0;
        for (int j = 0; j < 4; j++)
            m |= (uint16_t)(1u << (rng() % 16));
        masks[i] = m;
    }
    int check = 0;
    for (int i = 0; i < 1000; i++)
    {
        uint8_t c = 0;
        const uint16_t t = pext_nibble(vals[i], masks[i], &c);
        check += t != pext_ref16(vals[i], masks[i]);
        check += (int)c != __builtin_popcount((unsigned)masks[i]);
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        uint32_t acc = 0;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
            {
                uint8_t c = 0;
                acc += pext_nibble(vals[i], masks[i], &c);
            }
            else
                acc += pext_ref16(vals[i], masks[i]);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
        if (s == 0 && acc == 0xFFFFFFFFu)
            printf("unreachable\n");
    }
    std::sort(times.begin(), times.end());
    printf("ago_pext,%s,verify_bad=%d,median_total=%llu\n",
           which ? "table" : "ctz", check,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
