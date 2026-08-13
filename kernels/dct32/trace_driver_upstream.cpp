// Single-invocation driver for tracing the upstream SVE DCT32 (x265::dct32_sve)
// under QEMU at fixed VL=256.
#include <cstdint>
#include <cstring>

namespace x265 {
void dct32_sve(const int16_t*, int16_t*, intptr_t);
}

int main()
{
    static int16_t src[32 * 64];
    static int16_t dst[1024];
    for (int i = 0; i < 32 * 64; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    x265::dct32_sve(src, dst, 64);
    int sum = 0;
    for (int i = 0; i < 1024; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
