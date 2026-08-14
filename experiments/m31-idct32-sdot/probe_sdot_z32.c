// SVE2p1 sdot_z32 (s16 x s16 -> s32, 2-way) 语义探针，VL=256 (QEMU)。
//   vectors: lane e = d[2e]*c[2e] + d[2e+1]*c[2e+1], s32 wrap
//   indexed: 每 128-bit 段内 4 个 s32 lane 共享 c[2*imm], c[2*imm+1]
// 编译: aarch64-linux-gnu-gcc -O2 -march=armv9.4-a+sve2p1 probe_sdot_z32.c
// 运行: QEMU_LD_PREFIX=/usr/aarch64-linux-gnu qemu-aarch64 -cpu max,sve-max-vq=2 ./a.out
#include <arm_sve.h>
#include <stdio.h>
#include <stdint.h>

static void check(const char *name, int32_t *got, const int32_t *exp) {
  int bad = 0;
  for (int i = 0; i < 8; i++)
    if (got[i] != exp[i]) {
      bad = 1;
      printf("  %s lane%d got=%d exp=%d\n", name, i, got[i], exp[i]);
    }
  printf("%s: %s\n", name, bad ? "BAD" : "OK");
}

int main(void) {
  int16_t d16[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  int16_t c16[16] = {5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int32_t out[8] = {0};
  svint16_t d = svld1_s16(svptrue_b16(), d16);
  svint16_t c = svld1_s16(svptrue_b16(), c16);
  svint32_t a;

  // vectors: lane e = 1*5+2*6=17, 3*7+4*8=53, ...
  a = svdup_s32(0);
  asm volatile("sdot %0.s, %1.h, %2.h" : "+w"(a) : "w"(d), "w"(c));
  svst1_s32(svptrue_b32(), out, a);
  int32_t e1[8] = {17,53,105,173,257,357,473,605};
  check("sdot z.s,z.h,z.h", out, e1);

  // indexed imm=1: 段0 所有 s32 lane 用 c[2],c[3]=7,8；段1 用 c[10],c[11]=15,16
  register svint16_t cc asm("z3") = c;  // Zm 编码限 z0-z7
  a = svdup_s32(0);
  asm volatile("sdot %0.s, %1.h, %2.h[1]" : "+w"(a) : "w"(d), "w"(cc));
  svst1_s32(svptrue_b32(), out, a);
  int32_t e2[8] = {23,53,83,113,295,357,419,481};
  check("sdot z.s,z.h,z.h[1]", out, e2);
  return 0;
}
