// Single-invocation driver for QEMU tracing (sao B0 64x4).
#include <cstdint>

extern "C" void dynopt_sao_b0_64x4_sve2(
    uint8_t*, const int8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t rec[4 * 64];
    static int8_t off[32];
    for (int i = 0; i < 32; i++)
        off[i] = (int8_t)((i * 3 + 1) % 33) - 16;
    for (int i = 0; i < 4 * 64; i++)
        rec[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_sao_b0_64x4_sve2(rec, off, 64);
    return rec[255] == 0x7f;
}
