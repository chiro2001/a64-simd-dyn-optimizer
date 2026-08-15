// Single-invocation driver for QEMU dynamic tracing of the SVE2 chroma
// 4-tap vertical 8x16 candidate.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_interp4_8x16_sve2_vpp(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int)
    __attribute__((noinline));

int main()
{
    static uint8_t src[(16 + 4) * 64 + 32];
    static uint8_t dst[16 * 64];
    for (int i = 0; i < (int)sizeof(src); i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    memset(dst, 0, sizeof(dst));
    dynopt_interp4_8x16_sve2_vpp(src + 3 * 64 + 16, 64, dst, 64, 2);
    int sum = 0;
    for (int i = 0; i < (int)sizeof(dst); i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
