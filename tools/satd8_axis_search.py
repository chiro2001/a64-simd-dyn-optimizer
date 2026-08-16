#!/usr/bin/env python3
"""SATD 8x8 small-domain axis enumeration (docs/74 B&B acceptance data).

Enumerates the explicit satd8 NEON grammar axes on top of
tools/emit_satd_neon_shared.emit_8x8:
  reduce x abs = {vaddlv, vpaddl, vaddv} x {abd, subabs} = 6 candidates
Each candidate is compiled, counted (static fused_uop oracle), and
gated 20k vs x265 satd8_sve2<8,8> under QEMU.  This is the
"小域全枚举" baseline the bounded B&B will be compared against
(docs/74 acceptance: same best hash, no mis-pruning, node reduction).

Usage:
  python3 tools/satd8_axis_search.py
"""

import json
import os
import subprocess
import sys
from itertools import product

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from static_counts import static_counts  # noqa: E402

OUT = os.path.join(ROOT, "experiments", "m31-satd8-axis-search")
CXX = "aarch64-linux-gnu-g++"
QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]
LIB = os.path.join(ROOT, "build", "x265-8-clang-sve", "libx265.a")

REDUCES = ["vaddlv", "vpaddl", "vaddv"]
ABSES = ["abd", "subabs"]


def run(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, **kw)


def main():
    os.makedirs(OUT, exist_ok=True)
    from emit_satd_neon_shared import emit_8x8

    results = []
    verifier_decls = []
    verifier_calls = []
    objs = []
    for reduce, abs_kind in product(REDUCES, ABSES):
        tag = "r_%s_a_%s" % (reduce, abs_kind)
        sym = "dynopt_satd_8x8_%s" % tag
        src = os.path.join(OUT, tag + ".cpp")
        obj = os.path.join(OUT, tag + ".o")
        with open(src, "w") as f:
            f.write(emit_8x8(func_name=sym, reduce=reduce,
                             abs_kind=abs_kind))
        c = run([CXX, "-O2", "-std=c++11", "-march=armv8.2-a",
                 "-c", src, "-o", obj])
        if c.returncode != 0:
            results.append({"tag": tag, "reduce": reduce, "abs": abs_kind,
                            "passed": False, "reason": "compile failed"})
            continue
        counts = static_counts(obj)
        verifier_decls.append(
            'extern "C" int %s(const uint8_t*, intptr_t,'
            " const uint8_t*, intptr_t);" % sym)
        verifier_calls.append('    check("%s", %s);' % (tag, sym))
        objs.append(obj)
        results.append({"tag": tag, "reduce": reduce, "abs": abs_kind,
                        "passed": None, "counts": counts,
                        "obj": os.path.relpath(obj, ROOT)})

    if not objs:
        print(json.dumps(results, indent=1))
        return 1

    verifier_src = os.path.join(OUT, "verify.cpp")
    with open(verifier_src, "w") as f:
        body = """\
#include <cstdint>
#include <cstdio>
#include <cstdlib>
namespace x265 {
template <int W, int H> int satd8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}
extern "C" {
typedef int (*cfn_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}
static void check(const char* tag, cfn_t CAND)
{
    long mm = 0;
    const int sts[] = {16, 32, 64};
    static uint8_t a[9 * 64 + 16], b[9 * 64 + 16];
    for (int it = 0; it < 20000 && mm < 4; it++)
    {
        int st = sts[it % 3];
        for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++)
            a[i] = b[i] = (uint8_t)(rand() % 256);
        int got = CAND(a + 3 * st + 8, st, b + 3 * st + 8, st);
        int want = x265::satd8_sve2<8, 8>(
            a + 3 * st + 8, st, b + 3 * st + 8, st);
        if (got != want)
        {
            if (mm < 4)
                printf("%s it=%d got=%d want=%d\\n", tag, it, got, want);
            mm++;
        }
    }
    printf("%s mismatches=%ld\\n", tag, mm);
}
__DECLS__
int main()
{
__CALLS__
    return 0;
}
"""
        f.write(body.replace("__DECLS__", "\n".join(verifier_decls))
                .replace("__CALLS__", "\n".join(verifier_calls)))

    v = run([CXX, "-O2", "-std=c++11", verifier_src] + objs +
            ["-Wl,--start-group", LIB, "-Wl,--end-group",
             "-lpthread", "-ldl", "-o",
             os.path.join(OUT, "verify")])
    if v.returncode != 0:
        print("verifier build failed", v.stderr[-500:])
        return 1
    r = run(QEMU + [os.path.join(OUT, "verify"), "20000"])
    mism = {}
    for line in r.stdout.splitlines():
        if "mismatches=" in line:
            tag = line.split()[0]
            mism[tag] = int(line.split("mismatches=")[1])
    for row in results:
        if row.get("passed") is None:
            row["passed"] = mism.get(row["tag"], -1) == 0
            row["mismatches"] = mism.get(row["tag"], -1)

    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump(results, f, indent=1)

    print("%-24s %-8s %-8s %6s %6s" %
          ("tag", "reduce", "abs", "fused", "gate"))
    best = None
    for row in results:
        fused = (row.get("counts") or {}).get("vector_fused_uop", "-")
        gate = "PASS" if row.get("passed") else "FAIL"
        print("%-24s %-8s %-8s %6s %6s" %
              (row["tag"], row["reduce"], row["abs"], fused, gate))
        if row.get("passed") and isinstance(fused, int):
            if best is None or fused < best[1]:
                best = (row["tag"], fused)
    print("best:", best)
    print("wrote", os.path.join(OUT, "results.json"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
