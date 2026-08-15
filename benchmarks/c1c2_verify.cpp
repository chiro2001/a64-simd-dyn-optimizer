// 20k differential for dynopt_cost_c1c2_flag_sve2 vs x265 C reference.
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"
#include "common/contexts.h"

using namespace X265_NS;

extern "C" uint32_t dynopt_cost_c1c2_flag_sve2(
    uint16_t*, intptr_t, uint8_t*, intptr_t);

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    costC1C2Flag_t ref = primitives.costC1C2Flag;
    std::mt19937 rng(0xC1C2u);
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        uint16_t a[16], b[16];
        uint8_t c1[64], c2[64], c0[64];
        for (int i = 0; i < 16; i++)
            a[i] = b[i] = (uint16_t)(rng() & 0x3FF);
        for (int i = 0; i < 64; i++)
            c1[i] = c2[i] = c0[i] = (uint8_t)(rng() & 0x7F);
        intptr_t n = 1 + (int)(rng() % 8);
        intptr_t off = (intptr_t)(rng() % 16);
        uint32_t r = ref(a, n, c1, off);
        uint32_t d = dynopt_cost_c1c2_flag_sve2(b, n, c2, off);
        if (r != d || std::memcmp(c1, c2, 64) != 0)
        {
            if (bad < 5)
            {
                printf("mismatch t=%d n=%ld off=%ld ref=%08x dyn=%08x\n",
                       t, (long)n, (long)off, r, d);
                printf("  abs:");
                for (int i = 0; i < n; i++)
                    printf(" %d", a[i]);
                printf("\n  refCtx:");
                for (int i = 0; i < 16; i++)
                    printf(" %d", c1[i]);
                printf("\n  initCtx:");
                for (int i = 0; i < 16; i++)
                    printf(" %d", c0[i]);
                printf("\n  dynCtx:");
                for (int i = 0; i < 16; i++)
                    printf(" %d", c2[i]);
                printf("\n  next91: %d %d\n",
                       X265_NS::g_nextState[91][0],
                       X265_NS::g_nextState[91][1]);
                {
                    uint8_t s = c0[0];
                    for (int i = 0; i < 8; i++)
                    {
                        printf("  chain0[%d]=%d\n", i, s);
                        s = X265_NS::g_nextState[s][0];
                    }
                }
                printf("\n");
            }
            bad++;
        }
    }
    printf("c1c2 verify bad=%d\n", bad);
    return bad != 0;
}
