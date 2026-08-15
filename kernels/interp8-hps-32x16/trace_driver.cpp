// Single-invocation driver for QEMU tracing (interp8 hps 32x16).
#include <cstdint>

extern "C" void dynopt_interp8_hps_32x16_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int, int)
    __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64 + 8 + 16];
    static int16_t d[16 * 64 + 8];
    for (int i = 0; i < (int)sizeof(a); i++)
        a[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_interp8_hps_32x16_sve2(a + 16, 64, d, 64, 2, 0);
    return d[0] == 0x7f;
}
