// Single-invocation driver for QEMU dynamic tracing of the strong luma
// deblock candidate (fixed vertical edge, step=64, tc=8/16).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_pel_filter_luma_strong_sve2(
    uint8_t*, intptr_t, intptr_t, int32_t, int32_t)
    __attribute__((noinline));

int main()
{
    static uint8_t buf[16 * 128 + 64];
    for (int i = 0; i < (int)sizeof(buf); i++)
        buf[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_pel_filter_luma_strong_sve2(buf + 8 * 128 + 32, 64, 1, 8, 16);
    return buf[8 * 128 + 32] == 0x7f;
}
