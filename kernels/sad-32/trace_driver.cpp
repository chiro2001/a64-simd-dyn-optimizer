// Single-invocation driver for QEMU dynamic tracing of the SVE2 SAD
// 16x16 candidate.
#include <cstdint>
#include <cstring>

extern "C" int dynopt_sad_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64], b[16 * 64];
    for (int i = 0; i < 16 * 64; i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (uint8_t)((i * 53 + 7) % 256);
    }
    int s = dynopt_sad_32x32_sve2(a, 64, b, 64);
    return s == 0x7fffffff;
}
