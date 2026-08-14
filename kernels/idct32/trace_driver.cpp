// Single-invocation driver for tracing the tool-generated IDCT32 candidate.
// Optional argv[1] = RNG seed (default keeps the fixed deterministic input);
// used by tools/check_flow_independence.py to verify dynamic-count
// invariance across random inputs (docs/29 §1).
#include <cstdint>
#include <cstdlib>
#include <cstring>

extern "C" void dynopt_idct32_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
    static int16_t src[32 * 32];
    static int16_t dst[32 * 64];
    if (argc > 1)
    {
        uint32_t seed = (uint32_t)strtoul(argv[1], 0, 0);
        for (int i = 0; i < 32 * 32; i++)
        {
            seed = seed * 1664525u + 1013904223u;
            src[i] = (int16_t)(seed % 65536) - 32768;
        }
    }
    else
    {
        for (int i = 0; i < 32 * 32; i++)
            src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    }
    memset(dst, 0, sizeof(dst));
    dynopt_idct32_sve2_shared(src, dst, 64);
    int sum = 0;
    for (int i = 0; i < 32 * 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
