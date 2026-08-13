// Trace driver for the upstream SVE DCT8 (dct8_sve) at VL=256.
#include <cstdint>
#include <cstring>

namespace x265 {
void dct8_sve(const int16_t*, int16_t*, intptr_t);
}

int main()
{
    static int16_t src[8 * 32];
    static int16_t dst[64];
    for (int i = 0; i < 8 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    x265::dct8_sve(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
