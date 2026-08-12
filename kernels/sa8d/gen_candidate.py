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


def abs_add_reduction(src):
    """Replace add+abs+sabd+s64trn+umax stage with direct abs+add.

    This is a hypothesis, not a proven rewrite: the funnel verifies whether
    sum(abs(x)+abs(y)) over the four post-s32trn pairs is bit-exact.
    """
    start = "    int16x8_t v98 = vaddq_s16(v97, v96);"
    end = "    int16x8_t v143 = vreinterpretq_s16_u16(vmaxq_u16("
    si = src.index(start)
    ei = src.index(end)
    # end marker line continues; find its newline.
    ei = src.index("\n", ei) + 1
    span = src[si:ei]
    keep_ids = {"96", "97", "101", "102", "106", "107", "111", "112"}
    kept = []
    for line in span.splitlines(True):
        m = re.match(r"    int16x8_t v(\d+) = vreinterpretq_s16_s32\(v\d+\);",
                     line)
        if m and m.group(1) in keep_ids:
            kept.append(line)
    replacement = (
        "".join(kept) +
        "    int16x8_t v134 = vaddq_s16(vabsq_s16(v96), vabsq_s16(v97));\n"
        "    int16x8_t v137 = vaddq_s16(vabsq_s16(v101), vabsq_s16(v102));\n"
        "    int16x8_t v140 = vaddq_s16(vabsq_s16(v106), vabsq_s16(v107));\n"
        "    int16x8_t v143 = vaddq_s16(vabsq_s16(v111), vabsq_s16(v112));\n"
    )
    return src[:si] + replacement + src[ei:]


def ext_umax_reduction(src):
    """Replace s64 trn1+trn2+umax half-folds with vext+umax.

    Current per group: trn1/trn2 on 2x s64 then umax pairs lane i with i+4.
    Equivalent: ext(a,b,4) then max(a, ext) — one fewer instruction per group.
    """
    start = "    int64x2_t v116 = vreinterpretq_s64_s16(v99);"
    end = "    int16x8_t v143 = vreinterpretq_s16_u16(vmaxq_u16("
    si = src.index(start)
    ei = src.index(end)
    ei = src.index(");", ei) + 2
    replacement = (
        "    int16x8_t v132 = vextq_s16(v99, v109, 4);\n"
        "    int16x8_t v134 = vreinterpretq_s16_u16(vmaxq_u16("
        "vreinterpretq_u16_s16(v99), vreinterpretq_u16_s16(v132)));\n"
        "    int16x8_t v135 = vextq_s16(v104, v114, 4);\n"
        "    int16x8_t v137 = vreinterpretq_s16_u16(vmaxq_u16("
        "vreinterpretq_u16_s16(v104), vreinterpretq_u16_s16(v135)));\n"
        "    int16x8_t v138 = vextq_s16(v100, v110, 4);\n"
        "    int16x8_t v140 = vreinterpretq_s16_u16(vmaxq_u16("
        "vreinterpretq_u16_s16(v100), vreinterpretq_u16_s16(v138)));\n"
        "    int16x8_t v141 = vextq_s16(v105, v115, 4);\n"
        "    int16x8_t v143 = vreinterpretq_s16_u16(vmaxq_u16("
        "vreinterpretq_u16_s16(v105), vreinterpretq_u16_s16(v141)));\n"
    )
    return src[:si] + replacement + src[ei:]


VARIANTS = {
    "cand-0001-balanced-reduction": balanced_reduction,
    "cand-0002-abs-add-reduction": abs_add_reduction,
    "cand-0003-ext-umax": ext_umax_reduction,
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
