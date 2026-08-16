// Single-invocation driver for QEMU tracing (SSD sse_pp 16x16).
#include <cstdint>

extern "C" int dynopt_sse_pp_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
    __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64 + 16], b[16 * 64 + 16];
    for (int i = 0; i < (int)sizeof(a); i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (uint8_t)((i * 53 + 7) % 256);
    }
    return dynopt_sse_pp_16x16_sve2(a + 8, 64, b + 8, 64) == 0x7f;
}
