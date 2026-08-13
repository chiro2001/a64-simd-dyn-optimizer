// NEON bridge semantic probe for the DCT16 even-k path.
// Validates: svget_neonq (SVE->NEON) + vpaddq tree + vrshrn -> s16 sum.
// Build: aarch64-linux-gnu-g++ -O2 -static -march=armv8.2-a+sve \
//            tools/neon_bridge_probe.cpp -o /tmp/neon_bridge_probe
// Run under QEMU; exit 0 == PASS.
#include <arm_neon.h>
#include <arm_sve.h>
#include <arm_neon_sve_bridge.h>
#include <cstdio>

int main()
{
    const int32_t a[4] = { 10, 20, 30, 40 };
    const svint32_t v = svld1_s32(svptrue_b32(), a);
    // neon_pack: low 128-bit NEON view of the SVE vector (lanes 0..3).
    const int32x4_t t0 = svget_neonq_s32(v);
    // neon_reduce_narrow: vpaddq tree + vrshrn (round shift right).
    const int32x4_t t1 = vpaddq_s32(t0, t0);
    const int32x4_t t2 = vpaddq_s32(t1, t1);
    const int16x4_t res = vrshrn_n_s32(t2, 1);
    int16_t out[4];
    vst1_s16(out, res);
    const bool ok = out[0] == 50;   // (10+20+30+40)>>1
    printf("sum=%d %s\n", (int)out[0], ok ? "PASS" : "FAIL");
    return ok ? 0 : 1;
}
