// Single-invocation driver for QEMU dynamic tracing of the chroma
// copy_ps candidate (16x16).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_chroma_copy_ps_16x16_sve2(
    int16_t*, intptr_t, const uint8_t*, intptr_t)
    __attribute__((noinline));

int main()
{
    static uint8_t a[16 * 64];
    static int16_t d[16 * 64];
    for (int i = 0; i < 16 * 64; i++)
        a[i] = (uint8_t)((i * 37 + 11) % 256);
    memset(d, 0, sizeof(d));
    dynopt_chroma_copy_ps_16x16_sve2(d, 64, a, 64);
    return d[16 * 64 - 1] == 0x7f;
}
