// Single-invocation driver for tracing the tool-generated SVE2 DCT16
// candidate under QEMU at fixed VL=256. Same fixed input as the NEON/SVE
// baseline drivers so instruction counts are directly comparable.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_dct16_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main()
{
    static int16_t src[16 * 32];
    static int16_t dst[256];
    for (int i = 0; i < 16 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    dynopt_dct16_sve2_shared(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 256; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
