// 20k differential for dynopt_cost_coeff_remain_sve2 vs x265 C reference.
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" uint32_t dynopt_cost_coeff_remain_sve2(
    uint16_t*, int, int);

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    costCoeffRemain_t ref = primitives.costCoeffRemain;
    std::mt19937 rng(0x2A11u);
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        uint16_t a[16], b[16];
        for (int i = 0; i < 16; i++)
            a[i] = b[i] = (uint16_t)(rng() & 0x3FF);
        const int n = 1 + (int)(rng() % 16);
        const int idx = (int)(rng() % n);
        const uint32_t r = ref(a, n, idx);
        const uint32_t d = dynopt_cost_coeff_remain_sve2(b, n, idx);
        if (r != d)
        {
            if (bad < 5)
                printf("mismatch t=%d n=%d idx=%d ref=%u dyn=%u\n",
                       t, n, idx, r, d);
            bad++;
        }
    }
    printf("cost_remain verify bad=%d\n", bad);
    return bad != 0;
}
