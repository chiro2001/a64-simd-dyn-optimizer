// Single-invocation driver for tracing the upstream SVE DCT16 (dct16_sve)
// under QEMU at fixed VL=256. Same fixed input as the NEON trace driver so
// the dynamic instruction streams are directly comparable.
#include <cstdint>
#include <cstring>

namespace x265 {
void dct16_sve(const int16_t*, int16_t*, intptr_t);
}

int main()
{
    static int16_t src[16 * 32];
    static int16_t dst[256];
    for (int i = 0; i < 16 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    x265::dct16_sve(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 256; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
