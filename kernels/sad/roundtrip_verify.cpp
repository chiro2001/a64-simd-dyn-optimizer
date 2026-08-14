// Differential verify: generated roundtrip candidate vs x265 NEON dotprod
// SAD (assembly reference) and a plain C reference (16x16, u8).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_sad_16x16_neon_roundtrip
#endif
extern "C" int DYNOPT_CANDIDATE(
    const uint8_t* a, intptr_t sa, const uint8_t* b, intptr_t sb);
extern "C" int x265_pixel_sad_16x16_neon_dotprod(
    const uint8_t* a, intptr_t sa, const uint8_t* b, intptr_t sb);

static int sad_c(const uint8_t* a, intptr_t sa,
                 const uint8_t* b, intptr_t sb)
{
    int s = 0;
    for (int r = 0; r < 16; r++)
    {
        for (int c = 0; c < 16; c++)
        {
            int d = (int)a[c] - (int)b[c];
            s += d < 0 ? -d : d;
        }
        a += sa;
        b += sb;
    }
    return s;
}

static std::vector<uint8_t> make_plane(int stride, int off,
                                       const uint8_t* vals)
{
    std::vector<uint8_t> p((size_t)stride * 16 + off, 0xAA);
    for (int r = 0; r < 16; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * 16, 16);
    return p;
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0x51D2026u);
    int strides[5] = { 16, 17, 32, 64, 65 };
    int offs[4] = { 0, 1, 3, 7 };
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        uint8_t va[256], vb[256];
        for (int j = 0; j < 256; j++)
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
        int rc = sad_c(a, sa, b, sb);
        int rn = x265_pixel_sad_16x16_neon_dotprod(a, sa, b, sb);
        int rg = DYNOPT_CANDIDATE(a, sa, b, sb);
        if (rc != rn || rc != rg)
        {
            if (mism < 5)
                fprintf(stderr,
                        "mismatch %d: c=%d neon=%d gen=%d strides=%d/%d "
                        "off=%d/%d\n",
                        i, rc, rn, rg, sa, sb, oa, ob);
            mism++;
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
