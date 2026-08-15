// Single-invocation driver for QEMU tracing (interp8 vps 32x32).
#include <cstdint>

extern "C" void dynopt_interp8_vps_32x32_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int)
    __attribute__((noinline));

int main()
{
    static uint8_t a[(32 + 7) * 64 + 32 + 16];
    static int16_t d[32 * 64 + 32];
    for (int i = 0; i < (int)sizeof(a); i++)
        a[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_interp8_vps_32x32_sve2(a + 3 * 64 + 16, 64, d, 64, 2);
    return d[0] == 0x7f;
}
