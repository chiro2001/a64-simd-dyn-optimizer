// SVE2/QEMU smoke test: validates the cross-compile + qemu VL=256 path.
// Expected output: 40 (4 lanes of (7+3) summed).
#include <arm_sve.h>

#include <cstdio>

int main()
{
    svbool_t pg = svwhilelt_b32(0, 4);
    svuint32_t a = svdup_u32_x(pg, 7);
    svuint32_t b = svdup_u32_x(pg, 3);
    svuint32_t s = svadd_u32_x(pg, a, b);
    unsigned sum = (unsigned)svaddv_u32(pg, s);
    std::printf("sum=%u\n", sum);
    return sum == 40 ? 0 : 1;
}
