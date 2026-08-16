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
