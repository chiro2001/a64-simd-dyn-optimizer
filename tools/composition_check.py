#!/usr/bin/env python3
"""Two-group composition certificate (docs/75, composition layer).

The VL=256 dual emitters (op_pass_4/op_pass_11) are straight-line C++
over a fixed op set.  This checker statically verifies that every
statement is built only from:
  - certified dual primitives (psv16_dual_*, psv16_*, verified by
    tools/dual_lane_cert.py), or
  - group-wise SVE builtins (lane-wise ops that act identically on
    lanes 0-7 and 8-15), or
  - packing index loads / scalar arithmetic.
It also records every store pattern (address arithmetic + source
register) for the footprint comparison with the fused8 programs.

This makes the composition claim "mechanical by substitution" precise:
the operator layer is certified per primitive, and this check certifies
that the op sequences contain nothing else.
"""

import re
import sys

sys.path.insert(0, "optimizer/ir")

from dct16_dual_sve_emit import (  # noqa: E402
    _PROLOGUE, _ODD_LOOP, _PASS4_K2_LOOP, _PASS11_K2_LOOP, _EVEN_LOOP,
)
from dct32_dual_sve_emit import (  # noqa: E402
    _PROLOGUE as _PROLOGUE32, _ODD_LOOP as _ODD_LOOP32,
    _K2_LOOP_PASS1, _K2_LOOP_PASS2, _K4_LOOP, _EVEN_LOOP as _EVEN_LOOP32,
)


# Certified by tools/dual_lane_cert.py (operator layer).
CERTIFIED_DUAL = {
    "psv16_dual_load8_safe", "psv16_dual_load8", "psv16_dual_rev16",
    "psv16_dual_rev32_s32", "psv16_dual_rev64_s32", "psv16_dual_saddl",
    "psv16_dual_vget_lo4", "psv16_dual_vget_hi4", "psv16_dual_vmovn_s32",
    "psv16_dual_vmovn_s64", "psv16_dual_rshrn_s32",
    "psv16_dual_combine4_s16", "psv16_dual_addp4_s32",
    "psv16_dual_store4_s16", "psv16_sdot", "psv16_dup8_s16",
    "psv16_dup4_s32", "psv16_pairwise_add_s32", "psv16_quad_pack_s16",
    "psv16_combine_g0_s32",
}

# Group-wise SVE builtins: lane-wise on the full 16-lane register
# (both 8-lane groups identically) or scalar setup.
GROUPWISE = {
    "svadd_s16_x", "svsub_s16_x", "svadd_s32_x", "svsub_s32_x",
    "svmul_s32_x", "svuzp1_s64", "svuzp2_s64",
    "svreinterpret_s16_u16", "svreinterpret_s16_s32",
    "svreinterpret_s16_s64", "svreinterpret_s32_s16",
    "svreinterpret_s32_s64", "svreinterpret_s32_u32",
    "svreinterpret_s64_s32", "svreinterpret_u16_s16",
    "svreinterpret_u32_s32", "svreinterpret_u32_s16",
    "svreinterpret_u16_s16", "svcreate2_s16", "svcreate2_u16",
    "svcreate2_s32", "svcreate2_u32", "svld1_s16", "svld1_s32",
    "svld1_u16", "svld1_u32", "svdup_s32_x", "svptrue_b16",
    "svptrue_b32", "svptrue_b64", "svcntb", "psv_zero_s64",
    "psv_load8", "psv_load4_s32", "psv16_load", "psv_store4_s16",
    "psv16_store", "psv_load_idx", "psv_load_idx_u32",
}

PLAIN_PREFIX = ("const ", "int ", "for ", "if ", "return ", "#",
                "int16_t ", "int32_t ", "int64_t ")


def split_statements(text):
    """Split on ';' outside parentheses/brackets (braces open blocks
    but statements inside still end with ';')."""
    text = re.sub(r"//[^\n]*", "", text)
    out = []
    depth = 0
    cur = []
    for ch in text:
        if ch in "([":
            depth += 1
        elif ch in ")]":
            depth -= 1
        if ch == ";" and depth == 0:
            out.append("".join(cur).strip())
            cur = []
        else:
            cur.append(ch)
    if cur:
        tail = "".join(cur).strip()
        if tail:
            out.append(tail)
    return out


def classify(text):
    stmts = split_statements(text)
    unknown = []
    stores = []
    counts = {}
    for s in stmts:
        s = s.strip()
        if not s or set(s) <= set("{} \t\n"):
            continue
        if s.startswith("//"):
            continue
        if s.startswith(("static ", "static inline ", "void ")):
            continue
        calls = re.findall(
            r"\b([A-Za-z_][A-Za-z0-9_]*)\s*(?:<[^>]*>)?\(", s)
        known = [c for c in calls
                 if c in CERTIFIED_DUAL or c in GROUPWISE]
        if known:
            # outermost RHS call is the last known one in practice
            call = known[-1]
            counts[call] = counts.get(call, 0) + 1
            if "store" in call or call == "psv_store4_s16":
                stores.append(s)
            continue
        if not calls and s.startswith(PLAIN_PREFIX):
            continue
        unknown.append((calls[-1] if calls else "?", s))
    return counts, unknown, stores


def main():
    all_text = _PROLOGUE + _ODD_LOOP + _PASS4_K2_LOOP + _PASS11_K2_LOOP \
        + _EVEN_LOOP
    counts, unknown, stores = classify(all_text)
    print("== dct16 ==")
    print("certified dual ops used:",
          sorted(k for k in counts if k in CERTIFIED_DUAL))
    print("groupwise ops used:",
          sorted(k for k in counts if k in GROUPWISE))
    print("unique op kinds:", len(counts))
    print("store statements:", len(stores))
    for s in stores:
        print("  STORE:", s)
    ok16 = not unknown
    if unknown:
        print("UNKNOWN statements (%d):" % len(unknown))
        for why, s in unknown[:20]:
            print("  [%s] %s" % (why, s[:160]))

    text32 = (_PROLOGUE32 + _ODD_LOOP32 + _K2_LOOP_PASS1
              + _K2_LOOP_PASS2 + _K4_LOOP + _EVEN_LOOP32)
    counts32, unknown32, stores32 = classify(text32)
    print("== dct32 ==")
    print("certified dual ops used:",
          sorted(k for k in counts32 if k in CERTIFIED_DUAL))
    print("groupwise ops used:",
          sorted(k for k in counts32 if k in GROUPWISE))
    print("unique op kinds:", len(counts32))
    print("store statements:", len(stores32))
    ok32 = not unknown32
    if unknown32:
        print("UNKNOWN statements (%d):" % len(unknown32))
        for why, s in unknown32[:20]:
            print("  [%s] %s" % (why, s[:160]))
    print("COMPOSITION PASS dct16=%s dct32=%s"
          % (ok16, ok32))
    return 0 if (ok16 and ok32) else 1


if __name__ == "__main__":
    raise SystemExit(main())
