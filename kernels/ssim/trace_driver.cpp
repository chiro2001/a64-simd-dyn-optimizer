// Single-invocation driver for QEMU tracing (ssim 4x4x2).
#include <cstdint>

extern "C" void dynopt_ssim_4x4x2_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t, int32_t*)
    __attribute__((noinline));

int main()
{
    static uint8_t p1[4 * 64], p2[4 * 64];
    static int32_t sums[8];
    for (int i = 0; i < 4 * 64; i++)
    {
        p1[i] = (uint8_t)((i * 37 + 11) % 256);
        p2[i] = (uint8_t)((i * 53 + 7) % 256);
    }
    dynopt_ssim_4x4x2_sve2(p1, 64, p2, 64, sums);
    return sums[0] == 0x7fffffff;
}
