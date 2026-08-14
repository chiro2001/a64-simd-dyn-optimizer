// Single-invocation driver for QEMU tracing (SAO stats E1 64).
#include <cstdint>

extern "C" void dynopt_sao_stats_e1_64_sve2(
    const int16_t*, const uint8_t*, intptr_t, int8_t*, int32_t*, int32_t*)
    __attribute__((noinline));

int main()
{
    static int16_t diff[80];
    static uint8_t rec[2 * 64 + 16];
    static int8_t up[70];
    static int32_t stats[5], count[5];
    for (int i = 0; i < 80; i++)
        diff[i] = (int16_t)((i * 131 - 4097) % 4095);
    for (int i = 0; i < (int)sizeof(rec); i++)
        rec[i] = (uint8_t)((i * 37 + 11) % 256);
    for (int i = 0; i < 70; i++)
        up[i] = (int8_t)(i % 3) - 1;
    dynopt_sao_stats_e1_64_sve2(diff, rec + 8, 64, up, stats, count);
    return stats[0] == 0x7f;
}
