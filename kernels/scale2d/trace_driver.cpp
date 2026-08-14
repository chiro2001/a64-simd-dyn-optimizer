// Single-invocation driver for QEMU tracing (scale2d 64to32).
#include <cstdint>

extern "C" void dynopt_scale2d_64to32_sve2(
    uint8_t*, const uint8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t src[64 * 64], dst[1024];
    for (int i = 0; i < 64 * 64; i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_scale2d_64to32_sve2(dst, src, 64);
    return dst[1023] == 0x7f;
}
