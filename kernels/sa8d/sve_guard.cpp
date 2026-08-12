// Guard-page test for the 16x16 SVE candidate: each plane's exact footprint
// ends exactly at the end of a readable page, with a PROT_NONE page right
// after it. Any over-read (e.g. a widened 32-byte row load) faults.
#include <arm_sve.h>

#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <sys/mman.h>
#include <unistd.h>

extern "C" int dynopt_sa8d_16x16_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

static int sa8d8_raw(const uint8_t* a, intptr_t sa,
                     const uint8_t* b, intptr_t sb)
{
    int d[8][8];
    for (int r = 0; r < 8; r++)
        for (int c = 0; c < 8; c++)
            d[r][c] = (int)a[(size_t)r * sa + c] - (int)b[(size_t)r * sb + c];
    int w[8][8];
    for (int k = 0; k < 8; k++)
        for (int j = 0; j < 8; j++)
            w[k][j] = (__builtin_popcount((unsigned)(k & j)) & 1) ? -1 : 1;
    int h[8][8];
    for (int k = 0; k < 8; k++)
        for (int c = 0; c < 8; c++)
        {
            int s = 0;
            for (int r = 0; r < 8; r++)
                s += w[k][r] * d[r][c];
            h[k][c] = s;
        }
    int r8 = 0;
    for (int ky = 0; ky < 8; ky++)
        for (int kx = 0; kx < 8; kx++)
        {
            int s = 0;
            for (int c = 0; c < 8; c++)
                s += h[ky][c] * w[kx][c];
            r8 += std::abs(s);
        }
    return r8;
}

static int scalar16(const uint8_t* a, intptr_t sa,
                    const uint8_t* b, intptr_t sb)
{
    int r00 = sa8d8_raw(a, sa, b, sb);
    int r01 = sa8d8_raw(a + 8, sa, b + 8, sb);
    int r10 = sa8d8_raw(a + 8 * sa, sa, b + 8 * sb, sb);
    int r11 = sa8d8_raw(a + 8 * sa + 8, sa, b + 8 * sb + 8, sb);
    return (r00 + r01 + r10 + r11 + 2) >> 2;
}

int main()
{
    const size_t PAGE = 4096;
    unsigned char* mem = (unsigned char*)mmap(
        NULL, 2 * PAGE, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (mem == MAP_FAILED)
    {
        perror("mmap");
        return 2;
    }
    if (mprotect(mem + PAGE, PAGE, PROT_NONE) != 0)
    {
        perror("mprotect");
        return 2;
    }

    std::mt19937 rng(0x16);
    int strides[2] = { 16, 17 };
    int offs[4] = { 0, 1, 3, 7 };
    int fails = 0;
    int total = 0;
    for (int si = 0; si < 2; si++)
        for (int oi = 0; oi < 4; oi++)
        {
            int s = strides[si];
            int off = offs[oi];
            intptr_t foot_a = (intptr_t)off + 15 * s + 16;
            intptr_t foot_b = (intptr_t)off + 15 * s + 16;
            unsigned char* a = mem + PAGE - foot_a;
            unsigned char* b = a - foot_b;
            memset(a, 0xA5, (size_t)foot_a);
            memset(b, 0x5A, (size_t)foot_b);
            for (int r = 0; r < 16; r++)
                for (int c = 0; c < 16; c++)
                {
                    a[off + r * s + c] = (unsigned char)(rng() & 0xFF);
                    b[off + r * s + c] = (unsigned char)(rng() & 0xFF);
                }
            int want = scalar16(a + off, s, b + off, s);
            int got = dynopt_sa8d_16x16_neon_sve2(a + off, s, b + off, s);
            total++;
            if (want != got)
            {
                fprintf(stderr, "guard mismatch s=%d off=%d want=%d got=%d\n",
                        s, off, want, got);
                fails++;
            }
        }
    printf("guard_cases=%d fails=%d\n", total, fails);
    munmap(mem, 2 * PAGE);
    return fails ? 1 : 0;
}
