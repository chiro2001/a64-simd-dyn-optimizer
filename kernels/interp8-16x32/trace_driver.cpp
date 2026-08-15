// Single-invocation driver for QEMU dynamic tracing of the SVE2p3
// interp8 (horizontal 8-tap) 16x32 candidate.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_interp8_16x32_sve2(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int)
    __attribute__((noinline));

int main()
{
    static uint8_t src[32 * 64 + 32];
    static uint8_t dst[32 * 64];
    for (int i = 0; i < (int)sizeof(src); i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    memset(dst, 0, sizeof(dst));
    dynopt_interp8_16x32_sve2(src + 16, 64, dst, 64, 2);
    int sum = 0;
    for (int i = 0; i < (int)sizeof(dst); i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
