// SA8D oracle CLI: exposes x265 C reference and NEON dispatch for one call.
//
// Usage:
//   sa8d_oracle <8|16|32|64> <file>       read layout+data, print c,neon
//   sa8d_oracle batch <8|16|32|64> <file> read N cases, print one line each
//   sa8d_oracle guard <8|16|32|64>        guard-page test, print result
//
// File layout (little-endian):
//   uint32 shape; int64 stride_a; int64 stride_b;
//   int32 offset_a; int32 offset_b;
//   pixel a[shape*stride_a + offset_a]; pixel b[shape*stride_b + offset_b];
#include "primitives.h"

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

using namespace x265;

static const size_t PAGE = 4096;

struct Ptrs {
    pixelcmp_t c;
    pixelcmp_t neon;
    LumaCU idx;
};

// ---- Canonical SA8D interpreter (port of kernels/sa8d/spec.py) -----------
// Mirrors the frozen x265 C reference stages with explicit 16-bit lanes.
struct Packed {
    int lo, hi;
};

static Packed pack2(int lo, int hi) { return {lo, hi}; }
static Packed p_add(Packed a, Packed b) { return {a.lo + b.lo, a.hi + b.hi}; }
static Packed p_sub(Packed a, Packed b) { return {a.lo - b.lo, a.hi - b.hi}; }
static Packed p_abs(Packed a) { return {std::abs(a.lo), std::abs(a.hi)}; }

static void hadamard4(Packed s0, Packed s1, Packed s2, Packed s3,
                      Packed& d0, Packed& d1, Packed& d2, Packed& d3)
{
    Packed t0 = p_add(s0, s1);
    Packed t1 = p_sub(s0, s1);
    Packed t2 = p_add(s2, s3);
    Packed t3 = p_sub(s2, s3);
    d0 = p_add(t0, t2);
    d2 = p_sub(t0, t2);
    d1 = p_add(t1, t3);
    d3 = p_sub(t1, t3);
}

static void read_block(const pixel* plane, intptr_t stride, int r0, int c0,
                       int size, int* out)
{
    int n = 0;
    for (int r = r0; r < r0 + size; r++)
        for (int c = c0; c < c0 + size; c++)
            out[n++] = (int)plane[(size_t)r * stride + c];
}

static int sa8d8_raw(const pixel* a, intptr_t sa, const pixel* b, intptr_t sb)
{
    int d[64];
    read_block(a, sa, 0, 0, 8, d);
    int d2[64];
    read_block(b, sb, 0, 0, 8, d2);
    Packed tmp[8][4];
    for (int r = 0; r < 8; r++)
    {
        const int* da = d + r * 8;
        const int* db = d2 + r * 8;
        Packed b0 = pack2(da[0] - db[0] + da[1] - db[1], da[0] - db[0] - da[1] + db[1]);
        Packed b1 = pack2(da[2] - db[2] + da[3] - db[3], da[2] - db[2] - da[3] + db[3]);
        Packed b2 = pack2(da[4] - db[4] + da[5] - db[5], da[4] - db[4] - da[5] + db[5]);
        Packed b3 = pack2(da[6] - db[6] + da[7] - db[7], da[6] - db[6] - da[7] + db[7]);
        hadamard4(b0, b1, b2, b3, tmp[r][0], tmp[r][1], tmp[r][2], tmp[r][3]);
    }
    int total = 0;
    for (int cg = 0; cg < 4; cg++)
    {
        Packed a0, a1, a2, a3, a4, a5, a6, a7;
        hadamard4(tmp[0][cg], tmp[1][cg], tmp[2][cg], tmp[3][cg],
                  a0, a1, a2, a3);
        hadamard4(tmp[4][cg], tmp[5][cg], tmp[6][cg], tmp[7][cg],
                  a4, a5, a6, a7);
        Packed b0 = p_add(p_abs(p_add(a0, a4)), p_abs(p_sub(a0, a4)));
        b0 = p_add(b0, p_abs(p_add(a1, a5)));
        b0 = p_add(b0, p_abs(p_sub(a1, a5)));
        b0 = p_add(b0, p_abs(p_add(a2, a6)));
        b0 = p_add(b0, p_abs(p_sub(a2, a6)));
        b0 = p_add(b0, p_abs(p_add(a3, a7)));
        b0 = p_add(b0, p_abs(p_sub(a3, a7)));
        total += b0.lo + b0.hi;
    }
    return total;
}

static int canonical_sa8d(int shape, const pixel* a, intptr_t sa,
                          const pixel* b, intptr_t sb)
{
    if (shape == 8)
        return (sa8d8_raw(a, sa, b, sb) + 2) >> 2;
    if (shape == 16)
    {
        int raw = sa8d8_raw(a, sa, b, sb)
                + sa8d8_raw(a + 8, sa, b + 8, sb)
                + sa8d8_raw(a + 8 * sa, sa, b + 8 * sb, sb)
                + sa8d8_raw(a + 8 + 8 * sa, sa, b + 8 + 8 * sb, sb);
        return (raw + 2) >> 2;
    }
    if (shape == 32)
    {
        int total = 0;
        for (int oy = 0; oy < 32; oy += 16)
            for (int ox = 0; ox < 32; ox += 16)
                total += canonical_sa8d(16, a + (size_t)oy * sa + ox, sa,
                                        b + (size_t)oy * sb + ox, sb);
        return total;
    }
    int total = 0;
    for (int oy = 0; oy < 64; oy += 16)
        for (int ox = 0; ox < 64; ox += 16)
            total += canonical_sa8d(16, a + (size_t)oy * sa + ox, sa,
                                    b + (size_t)oy * sb + ox, sb);
    return total;
}

static void setup(Ptrs& p, int shape)
{
    EncoderPrimitives cprim, opt;
    memset(&cprim, 0, sizeof(cprim));
    memset(&opt, 0, sizeof(opt));
    setupCPrimitives(cprim);
    setupAliasPrimitives(cprim);
    int cpu = cpu_detect(false);
    setupIntrinsicPrimitives(opt, cpu);
    setupAssemblyPrimitives(opt, cpu);
    setupAliasPrimitives(opt);
    p.idx = shape == 8 ? BLOCK_8x8
          : shape == 16 ? BLOCK_16x16
          : shape == 32 ? BLOCK_32x32
                        : BLOCK_64x64;
    p.c = cprim.cu[p.idx].sa8d;
    p.neon = opt.cu[p.idx].sa8d;
}

static int run_file(const char* path, int shape)
{
    FILE* f = fopen(path, "rb");
    if (!f) { perror("fopen"); return 1; }
    uint32_t s32 = 0;
    int64_t sa = 0, sb = 0;
    int32_t oa = 0, ob = 0;
    if (fread(&s32, 4, 1, f) != 1 || fread(&sa, 8, 1, f) != 1 ||
        fread(&sb, 8, 1, f) != 1 || fread(&oa, 4, 1, f) != 1 ||
        fread(&ob, 4, 1, f) != 1 || (int)s32 != shape)
    {
        fprintf(stderr, "bad header\n");
        fclose(f);
        return 1;
    }
    if (oa < 0 || ob < 0) { fprintf(stderr, "negative offset\n"); return 1; }
    const size_t na = (size_t)shape * (size_t)sa + (size_t)oa;
    const size_t nb = (size_t)shape * (size_t)sb + (size_t)ob;
    std::vector<pixel> a(na), b(nb);
    if (fread(a.data(), 1, na, f) != na || fread(b.data(), 1, nb, f) != nb)
    {
        fprintf(stderr, "short data\n");
        fclose(f);
        return 1;
    }
    fclose(f);
    Ptrs p;
    setup(p, shape);
    int rc = p.c(a.data() + oa, (intptr_t)sa, b.data() + ob, (intptr_t)sb);
    int rk = canonical_sa8d(shape, a.data() + oa, (intptr_t)sa,
                            b.data() + ob, (intptr_t)sb);
    int rn = p.neon(a.data() + oa, (intptr_t)sa, b.data() + ob, (intptr_t)sb);
    printf("%d %d %d\n", rc, rk, rn);
    return (rc == rn && rn == rk) ? 0 : 2;
}

static int run_batch(const char* path, int shape)
{
    FILE* f = fopen(path, "rb");
    if (!f) { perror("fopen"); return 1; }
    uint32_t count = 0;
    if (fread(&count, 4, 1, f) != 1) { fprintf(stderr, "bad batch header\n"); return 1; }
    Ptrs p;
    setup(p, shape);
    for (uint32_t i = 0; i < count; i++)
    {
        int64_t sa = 0, sb = 0;
        int32_t oa = 0, ob = 0;
        if (fread(&sa, 8, 1, f) != 1 || fread(&sb, 8, 1, f) != 1 ||
            fread(&oa, 4, 1, f) != 1 || fread(&ob, 4, 1, f) != 1)
        {
            fprintf(stderr, "bad case header at %u\n", i);
            return 1;
        }
        const size_t na = (size_t)shape * (size_t)sa + (size_t)oa;
        const size_t nb = (size_t)shape * (size_t)sb + (size_t)ob;
        std::vector<pixel> a(na), b(nb);
        if (fread(a.data(), 1, na, f) != na || fread(b.data(), 1, nb, f) != nb)
        {
            fprintf(stderr, "short data at %u\n", i);
            return 1;
        }
        int rc = p.c(a.data() + oa, (intptr_t)sa, b.data() + ob, (intptr_t)sb);
        int rk = canonical_sa8d(shape, a.data() + oa, (intptr_t)sa,
                                b.data() + ob, (intptr_t)sb);
        int rn = p.neon(a.data() + oa, (intptr_t)sa, b.data() + ob, (intptr_t)sb);
        if (rc != rn || rn != rk)
        {
            fprintf(stderr, "mismatch at case %u: c=%d canon=%d neon=%d\n",
                    i, rc, rk, rn);
            return 2;
        }
        printf("%d %d %d\n", rc, rk, rn);
    }
    fclose(f);
    return 0;
}

static int run_guard(int shape)
{
    // Two pages: data page then PROT_NONE guard page. Block starts so its
    // contiguous footprint ends exactly at the data page end.
    const size_t area = (size_t)shape * (size_t)shape;
    const size_t total = (((2 * area + PAGE - 1) / PAGE) + 1) * PAGE;
    void* mem = mmap(nullptr, total, PROT_READ | PROT_WRITE,
                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (mem == MAP_FAILED) { perror("mmap"); return 1; }
    if (mprotect((char*)mem + total - PAGE, PAGE, PROT_NONE) != 0)
    {
        perror("mprotect");
        return 1;
    }
    const size_t data_end = total - PAGE;
    pixel* b = (pixel*)((char*)mem + data_end - 2 * area);
    pixel* a = (pixel*)((char*)mem + data_end - area);
    for (int i = 0; i < shape * shape; i++)
    {
        a[i] = (pixel)(i * 31);
        b[i] = (pixel)(i * 17);
    }
    Ptrs p;
    setup(p, shape);
    int rc = p.c(a, shape, b, shape);
    int rk = canonical_sa8d(shape, a, shape, b, shape);
    int rn = p.neon(a, shape, b, shape);
    printf("%d %d %d\n", rc, rk, rn);
    return (rc == rn && rn == rk) ? 0 : 2;
}

int main(int argc, char** argv)
{
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s <shape> <file> | guard <shape>\n", argv[0]);
        return 2;
    }
    if (strcmp(argv[1], "guard") == 0)
        return run_guard(atoi(argv[2]));
    if (strcmp(argv[1], "batch") == 0)
        return run_batch(argv[3], atoi(argv[2]));
    return run_file(argv[2], atoi(argv[1]));
}
