// Differential verify for the SVE2 SA8D candidate vs a scalar canonical
// reference. Runs under qemu-aarch64 (VL=256 max) on the N1 host.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

extern "C" int dynopt_sa8d_8x8_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

static int scalar_sa8d_8x8(const uint8_t* a, intptr_t sa,
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
    return (r8 + 2) >> 2;
}

static std::vector<uint8_t> make_plane(int stride, int off,
                                       const uint8_t* vals)
{
    std::vector<uint8_t> p((size_t)stride * 8 + off, 0xAA);
    for (int r = 0; r < 8; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * 8, 8);
    return p;
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x5A8D2026u);
    int strides[5] = { 8, 16, 17, 64, 65 };
    int offs[4] = { 0, 1, 3, 7 };
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        uint8_t va[64], vb[64];
        for (int j = 0; j < 64; j++)
        {
            va[j] = (uint8_t)(rng() & 0xFF);
            vb[j] = (uint8_t)(rng() & 0xFF);
        }
        int sa = strides[rng() % 5];
        int sb = strides[rng() % 5];
        int oa = offs[rng() % 4];
        int ob = offs[rng() % 4];
        std::vector<uint8_t> pa = make_plane(sa, oa, va);
        std::vector<uint8_t> pb = make_plane(sb, ob, vb);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int want = scalar_sa8d_8x8(a, sa, b, sb);
        int got = dynopt_sa8d_8x8_neon_sve2(a, sa, b, sb);
        if (want != got)
        {
            if (mism < 5)
                fprintf(stderr, "mismatch %d: scalar=%d sve=%d strides=%d/%d\n",
                        i, want, got, sa, sb);
            mism++;
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
