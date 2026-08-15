// Single-invocation driver for QEMU dynamic tracing of the scanPosLast
// candidate (fixed 4x4, diagonal scan, 6 nonzero).
#include <cstdint>
#include <cstring>

extern "C" int dynopt_scan_pos_last_sve2(
    const uint16_t*, const int16_t*, uint16_t*, uint16_t*, uint8_t*,
    int, const uint16_t*, int) __attribute__((noinline));

int main()
{
    static const uint16_t scan[16] =
        { 0, 4, 1, 8, 5, 2, 12, 9, 6, 3, 13, 10, 7, 14, 11, 15 };
    static int16_t coeff[16];
    static uint16_t sign[64], flag[64];
    static uint8_t num[64];
    for (int i = 0; i < 16; i++)
        coeff[i] = (int16_t)((i * 37 + 11) % 200 - 100);
    memset(sign, 0, sizeof(sign));
    memset(flag, 0, sizeof(flag));
    memset(num, 0, sizeof(num));
    return dynopt_scan_pos_last_sve2(
               scan, coeff, sign, flag, num, 6, scan, 4) == 0x7fffffff;
}
