// Single-invocation driver for QEMU dynamic tracing of the costCoeffNxN
// candidate (fixed 4x4, diagonal scan).
#include <cstdint>
#include <cstring>

extern "C" uint32_t dynopt_cost_coeff_nxn_sve2(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int)
    __attribute__((noinline));

int main()
{
    static const uint16_t scan[16] =
        { 0, 4, 1, 8, 5, 2, 12, 9, 6, 3, 13, 10, 7, 14, 11, 15 };
    static int16_t coeff[16];
    static uint8_t tab[16], base[256];
    static uint16_t absbuf[32];
    for (int i = 0; i < 16; i++)
    {
        coeff[i] = (int16_t)((i * 37 + 11) % 200 - 100);
        tab[i] = (uint8_t)i;
    }
    for (int i = 0; i < 256; i++)
        base[i] = (uint8_t)(i % 128);
    memset(absbuf, 0, sizeof(absbuf));
    return dynopt_cost_coeff_nxn_sve2(
               scan, coeff, 4, absbuf + 8, tab, 0x5555u, base, 3,
               15, 0) == 0x7fffffff;
}
