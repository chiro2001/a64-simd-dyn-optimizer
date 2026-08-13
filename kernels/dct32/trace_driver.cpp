// Single-invocation driver for QEMU dynamic instruction tracing of the
// tool-generated SVE2 DCT32 candidate.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_dct32_sve2_shared(
    const int16_t*, int16_t*, intptr_t) __attribute__((noinline));

int main()
{
    static int16_t src[32 * 64];
    static int16_t dst[1024];
    for (int i = 0; i < 32 * 64; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    dynopt_dct32_sve2_shared(src, dst, 64);
    int sum = 0;
    for (int i = 0; i < 1024; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
