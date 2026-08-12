#!/usr/bin/env python3
"""Generate hand-specified candidate variants from the verified roundtrip.

The roundtrip source is the trusted seed; candidates are produced by a small
set of explicit textual transforms so only the tested hypothesis differs.
"""

import re
import sys


def balanced_reduction(src):
    """Pair the four umax results before the final uaddlv (2-level tree)."""
    if "dynopt_sa8d_8x8_neon_roundtrip" not in src:
        raise ValueError("unexpected roundtrip source")
    # Map final chain: a = add(x,y); b = add(a,z); c = add(b,w)
    m = re.search(
        r"(int16x8_t (v\d+) = vaddq_s16\((v\d+), (v\d+)\);)\n"
        r"( *int16x8_t (v\d+) = vaddq_s16\(\2, (v\d+)\);)\n"
        r"( *int16x8_t (v\d+) = vaddq_s16\(\6, (v\d+)\);)\n"
        r"( *uint32_t (v\d+) = vaddlvq_u16)",
        src)
    if not m:
        raise ValueError("final reduction pattern not found")
    first, a, x, y = m.group(1), m.group(2), m.group(3), m.group(4)
    second, b, z = m.group(5), m.group(6), m.group(7)
    third, c, w = m.group(8), m.group(9), m.group(10)
    uaddlv_line = m.group(12)
    new_second = "    int16x8_t %s = vaddq_s16(%s, %s);" % (b, z, w)
    new_third = "    int16x8_t %s = vaddq_s16(%s, %s);" % (c, a, b)
    return src.replace(second, new_second).replace(third, new_third)


VARIANTS = {
    "cand-0001-balanced-reduction": balanced_reduction,
}


def main():
    if len(sys.argv) < 4:
        print("usage: gen_candidate.py <variant> <roundtrip.cpp> <out.cpp>")
        return 2
    variant, src_path, out_path = sys.argv[1], sys.argv[2], sys.argv[3]
    with open(src_path) as f:
        src = f.read()
    src = VARIANTS[variant](src)
    src = src.replace("dynopt_sa8d_8x8_neon_roundtrip",
                      "dynopt_sa8d_8x8_neon_candidate")
    with open(out_path, "w") as f:
        f.write("// generated candidate %s from roundtrip seed; do not edit\n"
                % variant)
        f.write(src)
    print("wrote %s" % out_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
