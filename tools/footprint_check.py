#!/usr/bin/env python3
"""Two-group store-footprint certificate (docs/75, footprint layer).

The dual emitters write every output position through
psv_store4_s16(dst + line*k + i, nn) (4 s16 lanes per store, primitive
footprint certified in tools/dual_lane_cert.py).  This checker derives
the static address set from the loop ranges in the emitter templates
and asserts it equals the full output range:
  dct16: {16k + i + l | k in K, i in {0,4,..,12}, l in 0..3} == 0..255
  dct32: {32k + i + l | k in K, i in {0,4,..,28}, l in 0..3} == 0..1023
Value correctness at every address is covered by the existing
TestBenchLite / cross-VQ 20k differential gates.
"""

import re
import sys

sys.path.insert(0, "optimizer/ir")

from dct16_dual_sve_emit import (  # noqa: E402
    _ODD_LOOP as _ODD16, _PASS4_K2_LOOP as _K2_16, _EVEN_LOOP as _EV16,
)
from dct32_dual_sve_emit import (  # noqa: E402
    _ODD_LOOP as _ODD32, _K2_LOOP_PASS1 as _K2_32,
    _K4_LOOP as _K4_32, _EVEN_LOOP as _EV32,
)


def k_ranges(text):
    """Extract (start, stop, step) of every `for (int k = a; k < b;
    k += c)` loop in a template chunk."""
    out = []
    for m in re.finditer(
            r"for \(int k = (\d+); k < (\d+); k \+= (\d+)\)",
            text):
        out.append((int(m.group(1)), int(m.group(2)),
                    int(m.group(3))))
    return out


def unrolled_k(text):
    """Extract constant k values from psv_store4_s16(dst + line * K + i,
    nn) unrolled sites."""
    return sorted({int(m) for m in re.findall(
        r"psv_store4_s16\(dst \+ \d+ \* (\d+) \+ i, nn\)", text)})


def address_set(line, k_vals, i_step):
    return {line * k + i + l
            for k in k_vals
            for i in range(0, line, i_step)
            for l in range(4)}


def check(name, line, k_vals, i_step):
    full = set(range(line * line))
    got = address_set(line, k_vals, i_step)
    ok = got == full
    print("%s: k_vals=%s i_step=%d -> %d addresses, full=%d, equal=%s"
          % (name, sorted(k_vals), i_step, len(got), len(full), ok))
    if not ok:
        print("  missing:", sorted(full - got)[:10],
              "extra:", sorted(got - full)[:10])
    return ok


def main():
    # dct16: odd k (1..15 step2) + k2 (2..14 step4) + even unrolled
    # {0,4,8,12}; i steps 4.
    k16 = []
    for a, b, s in k_ranges(_ODD16) + k_ranges(_K2_16):
        k16.extend(range(a, b, s))
    k16.extend(unrolled_k(_EV16))
    ok16 = check("dct16", 16, k16, 4)

    # dct32: odd (1..31 step2) + k2 (2..30 step4, pass1) + k4 (4..28
    # step8) + even unrolled {0,8,16,24}; i steps 4.
    k32 = []
    for a, b, s in k_ranges(_ODD32) + k_ranges(_K2_32) + k_ranges(_K4_32):
        k32.extend(range(a, b, s))
    k32.extend(unrolled_k(_EV32))
    ok32 = check("dct32", 32, k32, 4)

    print("FOOTPRINT PASS dct16=%s dct32=%s" % (ok16, ok32))
    return 0 if (ok16 and ok32) else 1


if __name__ == "__main__":
    raise SystemExit(main())
