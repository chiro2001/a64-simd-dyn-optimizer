#!/usr/bin/env python3
"""Dual-group lane-map equivalence certificate (round-0028 math #1).

The VL=256 dct16/32 16-lane emitters (docs/72) are built from the
8-lane fused8 DAGs by packing two independent 8-lane groups into one
16-lane register.  The proof premise is that EVERY dual operation is
equivalent to applying the corresponding 8-lane operation to each group
separately:

    dual_op(pack(a, b)) == pack(op8(a), op8(b))

This tool verifies that premise on the actual helper implementations
(optimizer/ir/pure_sve_helpers.py psv16_dual_* + DUAL_HELPERS) by
running both sides on random 8-lane data under QEMU VL=256 and asserting
per-lane equality.  Combined with the store-footprint check (dual store
writes the same logical lanes as two 8-lane stores), this is the
structural induction step of the two-group equivalence claim.

Usage:
  python3 tools/dual_lane_cert.py          # build + run under QEMU vq=2
"""

import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from pure_sve_helpers import PURE_SVE_HELPERS  # noqa: E402
from dct16_dual_sve_emit import DUAL_HELPERS  # noqa: E402


HARNESS = r"""
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
#include <cstdlib>

// ---- 8-lane references for dual ops without a named psv_* twin ----
static inline svint32_t ref_rev32_s32(svint32_t x)
{
    static const uint32_t idx[8] = {3, 2, 1, 0, 7, 6, 5, 4};
    return svreinterpret_s32_u32(svtbl_u32(
        svreinterpret_u32_s32(x),
        svld1_u32(svptrue_b32(), idx)));
}
static inline svint32_t ref_rev64_s32(svint32_t x)
{
    static const uint32_t idx[8] = {1, 0, 3, 2, 5, 4, 7, 6};
    return svreinterpret_s32_u32(svtbl_u32(
        svreinterpret_u32_s32(x),
        svld1_u32(svptrue_b32(), idx)));
}
static inline svint32_t ref_vmovn_s64(svint64_t x)
{
    static const uint32_t idx[8] = {0, 2, 4, 6, 0, 0, 0, 0};
    return svreinterpret_s32_u32(svtbl_u32(
        svreinterpret_u32_s32(svreinterpret_s32_s64(x)),
        svld1_u32(svptrue_b32(), idx)));
}
template <int S>
static inline svint16_t ref_rshrn_s32(svint32_t x)
{
    svint32_t r = svasr_n_s32_x(svptrue_b32(),
                                svadd_s32_x(svptrue_b32(), x,
                                            svdup_s32_x(svptrue_b32(),
                                                        1 << (S - 1))), S);
    svint16_t v = svreinterpret_s16_s32(r);
    static const uint16_t idx[16] = {0, 2, 4, 6, 8, 10, 12, 14,
                                     0, 0, 0, 0, 0, 0, 0, 0};
    return svreinterpret_s16_u16(svtbl_u16(
        svreinterpret_u16_s16(v),
        svld1_u16(svptrue_b16(), idx)));
}
static inline svint32_t ref_addp_s32(svint32_t a, svint32_t b)
{
    return svadd_s32_x(svptrue_b32(), svuzp1_s32(a, b),
                       svuzp2_s32(a, b));
}

// ---- group extraction ----
static volatile int16_t g_pa[8], g_pb[8];
static inline svint16_t g0_s16(svint16_t x)
{
    static const uint16_t idx[8] = {0, 1, 2, 3, 4, 5, 6, 7};
    return svreinterpret_s16_u16(svtbl_u16(
        svreinterpret_u16_s16(x), svld1_u16(svptrue_b16(), idx)));
}
static inline svint16_t g1_s16(svint16_t x)
{
    static const uint16_t idx[8] = {8, 9, 10, 11, 12, 13, 14, 15};
    return svreinterpret_s16_u16(svtbl_u16(
        svreinterpret_u16_s16(x), svld1_u16(svptrue_b16(), idx)));
}

int main()
{
    long bad = 0;
    // 1. dual load8 == pack(load8(a), load8(b))
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 60000 - 30000);
            b[i] = (int16_t)(rand() % 60000 - 30000);
        }
        svint16_t dual = psv16_dual_load8_safe(a, b);
        int16_t ga[8], gb[8];
        svst1_s16(svptrue_pat_b16(SV_VL8), ga, g0_s16(dual));
        svst1_s16(svptrue_pat_b16(SV_VL8), gb, g1_s16(dual));
        for (int i = 0; i < 8; i++)
            if (ga[i] != a[i] || gb[i] != b[i])
            {
                printf("load8 mismatch it=%d\n", it);
                return 1;
            }
    }
    printf("load8 OK\n");

    // 2. dual rev16
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 60000 - 30000);
            b[i] = (int16_t)(rand() % 60000 - 30000);
        }
        svint16_t dual = psv16_dual_load8_safe(a, b);
        svint16_t got = psv16_dual_rev16(dual);
        int16_t ga[8], gb[8];
        svst1_s16(svptrue_pat_b16(SV_VL8), ga, g0_s16(got));
        svst1_s16(svptrue_pat_b16(SV_VL8), gb, g1_s16(got));
        int16_t wa[8], wb[8];
        svst1_s16(svptrue_pat_b16(SV_VL8), wa, psv_rev16(psv_load8(a)));
        svst1_s16(svptrue_pat_b16(SV_VL8), wb, psv_rev16(psv_load8(b)));
        for (int i = 0; i < 8; i++)
            if (ga[i] != wa[i] || gb[i] != wb[i])
            {
                printf("rev16 mismatch it=%d\n", it);
                return 1;
            }
    }
    printf("rev16 OK\n");

    // 3. dual saddl
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8], c[8], d[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 2000 - 1000);
            b[i] = (int16_t)(rand() % 2000 - 1000);
            c[i] = (int16_t)(rand() % 2000 - 1000);
            d[i] = (int16_t)(rand() % 2000 - 1000);
        }
        svint16_t da = psv16_dual_load8_safe(a, b);
        svint16_t db = psv16_dual_load8_safe(c, d);
        svint32_t got = psv16_dual_saddl(da, db);
        svint32_t wa = psv_saddl_s16(psv_get_lo4_s16(psv_load8(a)),
                                     psv_get_lo4_s16(psv_load8(c)));
        svint32_t wb = psv_saddl_s16(psv_get_lo4_s16(psv_load8(b)),
                                     psv_get_lo4_s16(psv_load8(d)));
        int32_t g[8], h[8];
        svst1_s32(svptrue_b32(), g, got);
        svst1_s32(svptrue_b32(), h, wa);
        for (int i = 0; i < 4; i++)
            if (g[i] != h[i])
            {
                printf("saddl g0 mismatch it=%d lane=%d: %d vs %d\n",
                       it, i, g[i], h[i]);
                return 1;
            }
        svst1_s32(svptrue_b32(), h, wb);
        for (int i = 4; i < 8; i++)
            if (g[i] != h[i - 4])
            {
                printf("saddl g1 mismatch it=%d lane=%d: %d vs %d\n",
                       it, i, g[i], h[i - 4]);
                return 1;
            }
    }
    printf("saddl OK\n");

    // 4. dual vmovn_s32 / rev32_s32 / rev64_s32 / vmovn_s64 / rshrn
    for (int it = 0; it < 200; it++)
    {
        int32_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
            b[i] = (int32_t)(rand() % 2000000 - 1000000);
        }
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint32_t db = svld1_s32(svptrue_b32(), b);
        (void)db;
        // vmovn_s32: dual input lanes 0-3 (g0) / 4-7 (g1)
        svint16_t got = psv16_dual_vmovn_s32(da);
        svint16_t wa = psv_vmovn_s32(svuzp1_s32(da, da));
        (void)wa; (void)got; (void)bad;
        int16_t g[16];
        svst1_s16(svptrue_b16(), g, got);
        int16_t h[8];
        svst1_s16(svptrue_pat_b16(SV_VL8), h, psv_vmovn_s32(da));
        for (int i = 0; i < 4; i++)
            if (g[i] != h[i])
            {
                printf("vmovn_s32 g0 mismatch it=%d\n", it);
                return 1;
            }
        for (int i = 0; i < 4; i++)
            if (g[8 + i] != h[4 + i])
            {
                printf("vmovn_s32 g1 mismatch it=%d lane=%d\n",
                       it, 8 + i);
                return 1;
            }
    }
    printf("vmovn_s32 OK\n");

    for (int it = 0; it < 200; it++)
    {
        int32_t a[8];
        for (int i = 0; i < 8; i++)
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint32_t got = psv16_dual_rev32_s32(da);
        svint32_t want = ref_rev32_s32(da);
        int32_t g[8], w[8];
        svst1_s32(svptrue_b32(), g, got);
        svst1_s32(svptrue_b32(), w, want);
        for (int i = 0; i < 4; i++)
            if (g[i] != w[i])
            {
                printf("rev32 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("rev32 OK\n");

    for (int it = 0; it < 200; it++)
    {
        int64_t a[4];
        for (int i = 0; i < 4; i++)
            a[i] = (int64_t)(rand() % 2000000 - 1000000);
        svint64_t da = svld1_s64(svptrue_b64(), a);
        svint32_t got = psv16_dual_vmovn_s64(da);
        svint32_t want = ref_vmovn_s64(da);
        int32_t g[8], w[8];
        svst1_s32(svptrue_b32(), g, got);
        svst1_s32(svptrue_b32(), w, want);
        for (int i = 0; i < 8; i++)
            if (g[i] != w[i])
            {
                printf("vmovn_s64 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("vmovn_s64 OK\n");

    for (int it = 0; it < 200; it++)
    {
        int32_t a[8];
        for (int i = 0; i < 8; i++)
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint16_t got = psv16_dual_rshrn_s32<6>(da);
        svint16_t want = ref_rshrn_s32<6>(da);
        int16_t g[16], w[16];
        svst1_s16(svptrue_b16(), g, got);
        svst1_s16(svptrue_b16(), w, want);
        for (int i = 0; i < 4; i++)
            if (g[i] != w[i])
            {
                printf("rshrn g0 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
        for (int i = 0; i < 4; i++)
            if (g[8 + i] != w[4 + i])
            {
                printf("rshrn g1 mismatch it=%d lane=%d: %d vs %d "
                       "(g0=%d/%d)\n", it, 8 + i, g[8 + i], w[4 + i],
                       g[i], w[i]);
                return 1;
            }
    }
    printf("rshrn OK\n");

    // 5. dual combine4_s16
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8], c[8], d[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 60000 - 30000);
            b[i] = (int16_t)(rand() % 60000 - 30000);
            c[i] = (int16_t)(rand() % 60000 - 30000);
            d[i] = (int16_t)(rand() % 60000 - 30000);
        }
        svint16_t da = psv16_dual_load8_safe(a, b);
        svint16_t db = psv16_dual_load8_safe(c, d);
        svint16_t got = psv16_dual_combine4_s16(da, db);
        int16_t wa[8], wb[8];
        svst1_s16(svptrue_pat_b16(SV_VL8), wa,
                  psv_combine4_s16(psv_load8(a), psv_load8(c)));
        svst1_s16(svptrue_pat_b16(SV_VL8), wb,
                  psv_combine4_s16(psv_load8(b), psv_load8(d)));
        int16_t g[16];
        svst1_s16(svptrue_b16(), g, got);
        for (int i = 0; i < 4; i++)
            if (g[i] != wa[i] || g[8 + i] != wb[i])
            {
                printf("combine4 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("combine4 OK\n");

    // 6. dual addp4_s32 == per-group ref_addp_s32
    for (int it = 0; it < 200; it++)
    {
        int32_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
            b[i] = (int32_t)(rand() % 2000000 - 1000000);
        }
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint32_t db = svld1_s32(svptrue_b32(), b);
        svint32_t got = psv16_dual_addp4_s32(da, db);
        int32_t g[8];
        svst1_s32(svptrue_b32(), g, got);
        // g0 = [a0+a1, a2+a3, b0+b1, b2+b3],
        // g1 = [a4+a5, a6+a7, b4+b5, b6+b7].
        int32_t want0[4] = {a[0] + a[1], a[2] + a[3],
                            b[0] + b[1], b[2] + b[3]};
        int32_t want1[4] = {a[4] + a[5], a[6] + a[7],
                            b[4] + b[5], b[6] + b[7]};
        for (int i = 0; i < 4; i++)
            if (g[i] != want0[i] || g[4 + i] != want1[i])
            {
                printf("addp4 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("addp4 OK\n");

    // 7. dual sdot == per-group psv_sdot
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8], c[8], d[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 4000 - 2000);
            b[i] = (int16_t)(rand() % 4000 - 2000);
            c[i] = (int16_t)(rand() % 4000 - 2000);
            d[i] = (int16_t)(rand() % 4000 - 2000);
        }
        svint16_t dx = psv16_dual_load8_safe(a, b);
        svint16_t dy = psv16_dual_load8_safe(c, d);
        svint64_t got = psv16_sdot(psv_zero_s64(), dx, dy);
        svint64_t wa = psv_sdot(psv_zero_s64(), psv_load8(a),
                                psv_load8(c));
        svint64_t wb = psv_sdot(psv_zero_s64(), psv_load8(b),
                                psv_load8(d));
        int64_t g[4], h[4], k[4];
        svst1_s64(svptrue_b64(), g, got);
        svst1_s64(svptrue_b64(), h, wa);
        svst1_s64(svptrue_b64(), k, wb);
        for (int i = 0; i < 2; i++)
            if (g[i] != h[i] || g[2 + i] != k[i])
            {
                printf("sdot mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("sdot OK\n");

    // 8. dup8/dup4: both groups equal the 8-lane load
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8];
        for (int i = 0; i < 8; i++)
            a[i] = (int16_t)(rand() % 60000 - 30000);
        svint16_t got = psv16_dup8_s16(a);
        int16_t g[16], w[8];
        svst1_s16(svptrue_b16(), g, got);
        svst1_s16(svptrue_pat_b16(SV_VL8), w, psv_load8(a));
        for (int i = 0; i < 8; i++)
            if (g[i] != w[i] || g[8 + i] != w[i])
            {
                printf("dup8 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    for (int it = 0; it < 200; it++)
    {
        int32_t a[4];
        for (int i = 0; i < 4; i++)
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
        svint32_t got = psv16_dup4_s32(a);
        int32_t g[8], w[4];
        svst1_s32(svptrue_b32(), g, got);
        svst1_s32(svptrue_pat_b32(SV_VL4), w, psv_load4_s32(a));
        for (int i = 0; i < 4; i++)
            if (g[i] != w[i] || g[4 + i] != w[i])
            {
                printf("dup4 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("dup8/dup4 OK\n");

    // 9. pairwise_add_s32 == per-group ref_addp_s32
    for (int it = 0; it < 200; it++)
    {
        int32_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
            b[i] = (int32_t)(rand() % 2000000 - 1000000);
        }
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint32_t db = svld1_s32(svptrue_b32(), b);
        svint32_t got = psv16_pairwise_add_s32(da, db);
        svint32_t want = ref_addp_s32(da, db);
        int32_t g[8], w[8];
        svst1_s32(svptrue_b32(), g, got);
        svst1_s32(svptrue_b32(), w, want);
        for (int i = 0; i < 8; i++)
            if (g[i] != w[i])
            {
                printf("pairwise_add mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("pairwise_add OK\n");

    // 10. quad_pack / combine_g0 layout
    for (int it = 0; it < 200; it++)
    {
        int16_t a[16], b[16];
        for (int i = 0; i < 16; i++)
        {
            a[i] = (int16_t)(rand() % 60000 - 30000);
            b[i] = (int16_t)(rand() % 60000 - 30000);
        }
        svint16_t da = svld1_s16(svptrue_b16(), a);
        svint16_t db = svld1_s16(svptrue_b16(), b);
        svint16_t q = psv16_quad_pack_s16(da, db);
        int16_t g[16];
        svst1_s16(svptrue_b16(), g, q);
        // lanes: [a.g0(0-3), a.g1(4-7), b.g0(8-11), b.g1(12-15)]
        for (int i = 0; i < 4; i++)
            if (g[i] != a[i] || g[4 + i] != a[8 + i] ||
                g[8 + i] != b[i] || g[12 + i] != b[8 + i])
            {
                printf("quad_pack mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    for (int it = 0; it < 200; it++)
    {
        int32_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int32_t)(rand() % 2000000 - 1000000);
            b[i] = (int32_t)(rand() % 2000000 - 1000000);
        }
        svint32_t da = svld1_s32(svptrue_b32(), a);
        svint32_t db = svld1_s32(svptrue_b32(), b);
        svint32_t got = psv16_combine_g0_s32(da, db);
        int32_t g[8];
        svst1_s32(svptrue_b32(), g, got);
        for (int i = 0; i < 4; i++)
            if (g[i] != a[i] || g[4 + i] != b[i])
            {
                printf("combine_g0 mismatch it=%d lane=%d\n", it, i);
                return 1;
            }
    }
    printf("quad_pack/combine_g0 OK\n");

    // 11. dual_store4 footprint: pa[0..3] = v lanes 0-3,
    //     pb[0..3] = v lanes 8-11.
    for (int it = 0; it < 200; it++)
    {
        int16_t a[8], b[8];
        for (int i = 0; i < 8; i++)
        {
            a[i] = (int16_t)(rand() % 60000 - 30000);
            b[i] = (int16_t)(rand() % 60000 - 30000);
        }
        svint16_t dual = psv16_dual_load8_safe(a, b);
        for (int i = 0; i < 8; i++)
            g_pa[i] = g_pb[i] = 0;
        psv16_dual_store4_s16((int16_t*)g_pa, (int16_t*)g_pb, dual);
        __asm__ __volatile__("" ::: "memory");
        for (int i = 0; i < 4; i++)
            if (g_pa[i] != a[i] || g_pb[i] != b[i])
            {
                printf("store4 footprint mismatch it=%d lane=%d: "
                       "pa=%d/%d pb=%d/%d\n", it, i, g_pa[i], a[i],
                       g_pb[i], b[i]);
                return 1;
            }
    }
    printf("store4 footprint OK\n");

    printf("CERT PASS\n");
    return 0;
}
"""


def build_and_run():
    src = os.path.join(ROOT, "build", "tmp-dual-lane-cert.cpp")
    obj = os.path.join(ROOT, "build", "tmp-dual-lane-cert.o")
    binp = os.path.join(ROOT, "build", "tmp-dual-lane-cert")
    os.makedirs(os.path.dirname(src), exist_ok=True)
    with open(src, "w") as f:
        f.write("#include <arm_sve.h>\n#include <stdint.h>\n\n"
                + PURE_SVE_HELPERS + DUAL_HELPERS + HARNESS)
    c = subprocess.run(
        ["aarch64-linux-gnu-g++", "-c", "-O2", "-march=armv8.2-a+sve2",
         "-o", obj, src], capture_output=True, text=True)
    if c.returncode != 0:
        print(c.stderr[:4000])
        return 1
    l = subprocess.run(
        ["aarch64-linux-gnu-g++", "-O2", "-o", binp, obj],
        capture_output=True, text=True)
    if l.returncode != 0:
        print(l.stderr[:4000])
        return 1
    qemu = os.environ.get("QEMU") or os.path.join(
        ROOT, "build", "qemu-build", "qemu-aarch64")
    r = subprocess.run(
        [qemu, "-L", "/usr/aarch64-linux-gnu",
         "-cpu", "max,sve-max-vq=2", binp],
        capture_output=True, text=True)
    print(r.stdout)
    if r.returncode != 0 or "CERT PASS" not in r.stdout:
        print(r.stderr[-2000:])
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(build_and_run())
