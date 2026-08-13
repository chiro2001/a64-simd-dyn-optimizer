// ACLE trace driver for the tool-generated DCT8 candidate (VL=256).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_dct8_sve2_shared(const int16_t*, int16_t*, intptr_t);

int main()
{
    static int16_t src[8 * 32];
    static int16_t dst[64];
    int sum = 0;
    for (int i = 0; i < 8 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    dynopt_dct8_sve2_shared(src, dst, 32);
    for (int i = 0; i < 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
