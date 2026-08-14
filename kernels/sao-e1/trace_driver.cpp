// Single-invocation driver for QEMU tracing (sao E1 64x4).
#include <cstdint>

extern "C" void dynopt_sao_e1_64x4_sve2(
    uint8_t*, int8_t*, int8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t rec[5 * 64];
    static int8_t up[64], off[5] = { -1, 0, 1, 0, -1 };
    for (int i = 0; i < 5 * 64; i++)
        rec[i] = (uint8_t)((i * 37 + 11) % 256);
    for (int i = 0; i < 64; i++)
        up[i] = (int8_t)(i % 3) - 1;
    dynopt_sao_e1_64x4_sve2(rec, up, off, 64);
    return rec[255] == 0x7f;
}
