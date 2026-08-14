// Single-invocation driver for QEMU tracing (interp8 vpp 8x8).
#include <cstdint>

extern "C" void dynopt_interp8_8x8_sve2_vpp(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int)
    __attribute__((noinline));

int main()
{
    static uint8_t src[8 * 64 + 16], dst[64];
    for (int i = 0; i < (int)sizeof(src); i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_interp8_8x8_sve2_vpp(src + 16, 64, dst, 8, 1);
    return dst[0] == 0x7f;
}
