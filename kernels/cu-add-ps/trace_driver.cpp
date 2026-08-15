// Single-invocation driver for QEMU dynamic tracing of the cu.add_ps
// candidate (16x16).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_cu_add_ps_16x16_sve2(
    uint8_t*, intptr_t, const uint8_t*, const int16_t*,
    intptr_t, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64], d[16 * 64];
    static int16_t b[16 * 64];
    for (int i = 0; i < 16 * 64; i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (int16_t)((i * 53 + 7) % 200 - 100);
    }
    memset(d, 0, sizeof(d));
    dynopt_cu_add_ps_16x16_sve2(d, 64, a, b, 64, 64);
    return d[16 * 64 - 1] == 0x7f;
}
