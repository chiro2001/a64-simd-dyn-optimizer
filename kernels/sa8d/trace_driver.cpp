// Single-invocation driver for QEMU dynamic instruction tracing of the
// tool-generated SVE2 SA8D 8x8 pair candidate. Calls the kernel exactly once
// on fixed in-range data so `-one-insn-per-tb -d exec,in_asm -dfilter <fn
// range>` yields the executed instruction stream in order.
#include <cstdint>
#include <cstring>

extern "C" int dynopt_sa8d_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t a[8 * 32];
    static uint8_t b[8 * 32];
    for (int i = 0; i < 8 * 32; i++)
    {
        a[i] = (uint8_t)((i * 37 + 11) % 256);
        b[i] = (uint8_t)((i * 13 + 7) % 256);
    }
    int cost = dynopt_sa8d_8x8_sve2(a, 32, b, 32);
    return cost == 0x7fffffff;  // never true; keeps the call live
}
