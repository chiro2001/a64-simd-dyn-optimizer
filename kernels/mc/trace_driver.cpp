// Single-invocation driver for QEMU tracing (MC avg_pp 16x16).
#include <cstdint>

extern "C" int dynopt_avg_pp_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t,
    uint8_t*, intptr_t)
    __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64 + 16], b[16 * 64 + 16], o[16 * 64 + 16];
    for (int i = 0; i < (int)sizeof(a); i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (uint8_t)((i * 53 + 7) % 256);
    }
    dynopt_avg_pp_16x16_sve2(a + 8, 64, b + 8, 64, o + 8, 64);
    return o[0] == 0x7f;
}
