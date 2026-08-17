// Single-invocation driver for QEMU dynamic instruction tracing of the
// SVE2 SA8D 64x64 candidate.
#include <cstdint>

extern "C" int dynopt_sa8d_64x64_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t a[64 * 64];
    static uint8_t b[64 * 64];
    for (int i = 0; i < 64 * 64; i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (uint8_t)((i * 13 + 7) % 256);
    }
    int cost = dynopt_sa8d_64x64_sve2(a, 64, b, 64);
    return cost == 0x7fffffff;  // never true; keeps the call live
}
