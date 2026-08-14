// Single-invocation driver for QEMU tracing (scale1d 128to64).
#include <cstdint>

extern "C" void dynopt_scale1d_128to64_sve2(uint8_t*, const uint8_t*)
    __attribute__((noinline));

int main()
{
    static uint8_t src[256], dst[128];
    for (int i = 0; i < 256; i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_scale1d_128to64_sve2(dst, src);
    return dst[127] == 0x7f;
}
