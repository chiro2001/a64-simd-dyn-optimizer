// Single-invocation driver for QEMU tracing (interp8 vsp 8x8).
#include <cstdint>
extern "C" void dynopt_interp8_vsp_8x8_sve2(
    const int16_t*, intptr_t, uint8_t*, intptr_t, int) __attribute__((noinline));
int main() {
    static int16_t a[(8 + 7) * 64 + 8 + 16]; static uint8_t d[8 * 64 + 8];
    for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++) a[i] = (int16_t)((i * 37 + 11) % 16384 - 8192);
    dynopt_interp8_vsp_8x8_sve2(a + 3 * 64 + 16, 64, d, 64, 2); return d[0] == 0x7f;
}
