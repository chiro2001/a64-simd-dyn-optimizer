// Single-invocation driver for QEMU dynamic tracing of the
// findPosFirstLast candidate (fixed 4x4, diagonal scan).
#include <cstdint>
#include <cstring>

extern "C" uint32_t dynopt_find_pos_first_last_sve2(
    const int16_t*, intptr_t, const uint16_t*) __attribute__((noinline));

int main()
{
    static const uint16_t scan[16] =
        { 0, 4, 1, 8, 5, 2, 12, 9, 6, 3, 13, 10, 7, 14, 11, 15 };
    static int16_t coeff[16];
    for (int i = 0; i < 16; i++)
        coeff[i] = (int16_t)((i * 37 + 11) % 200 - 100);
    coeff[5] = -3;
    return dynopt_find_pos_first_last_sve2(coeff, 4, scan) == 0x7fffffff;
}
