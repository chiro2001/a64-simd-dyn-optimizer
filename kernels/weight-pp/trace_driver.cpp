// Single-invocation driver for QEMU tracing (weight_pp 64x32 branch-0).
#include <cstdint>

extern "C" void dynopt_weight_pp_sve2(
    const uint8_t*, uint8_t*, intptr_t, int, int, int, int, int, int)
    __attribute__((noinline));

int main()
{
    static uint8_t a[64 * 64], d[64 * 64];
    for (int i = 0; i < (int)sizeof(a); i++)
        a[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_weight_pp_sve2(a, d, 64, 64, 32, 64, 32, 6, 0);
    return d[0] == 0x7f;
}
