#!/usr/bin/env python3
"""Direct-asm O-phase generator for the idct32 sdot chunk (docs/28 M1).

Emits an assembly function computing the 16 O accumulators of ONE chunk
with explicit fixed registers (AAPCS no-save set; accumulators in
z16-z23 for k=0..7 and z24-z31 for k=8..15, scratch rows/d/C in z0-z3,
k-bases in caller-saved x9-x16). Peak Z live = 8 accs + 2 rows + 1 d +
1 C = 12 <= 24; no spill is possible.

Function:
  void dynopt_o_phase(const int16_t* src, const int16_t* cbase,
                      int off, int32_t* out)

Semantics (bit-exact with chunk_arithmetic_sdot's O section):
  O[k][lane] = sum_p (src[(4p+1)*32 + off + lane] * CDOT_O[k][0][2p]
                      + src[(4p+3)*32 + off + lane] * CDOT_O[k][0][2p+1])
with CDOT_O[k][0][*] = (GT32[4p+1][k], GT32[4p+3][k]) repeated 8 times.
"""


def emit(src="x0", cbase="x1", offreg="x2", out="x3"):
    L = []
    L.append("    .arch armv9.4-a+sve2p1")
    L.append("    .text")
    L.append("    .globl dynopt_o_phase")
    L.append("    .p2align 2")
    L.append("dynopt_o_phase:")
    L.append("    ptrue p0.h, vl8")
    L.append("    ptrue p1.b")
    L.append("    add x5, %s, %s, lsl #1" % (src, offreg))
    # k_block=8: 8 k-bases live in caller-saved x9-x16 (k*256 <= 1792),
    # accumulators in z16-z23 (kg=0) / z24-z31 (kg=8); rows re-walked
    # per group. Only
    # caller-saved GPRs are used (no callee-saved clobber).
    for kg in (0, 8):
        acc0 = 16 if kg == 0 else 24
        for k in range(kg, kg + 8):
            L.append("    add x%d, %s, #%d" % (9 + (k - kg), cbase,
                                                k * 256))
        for k in range(kg, kg + 8):
            L.append("    dup z%d.s, #0" % (acc0 + (k - kg)))
        for p in range(8):
            ra = "z0.h"
            rb = "z1.h"
            d = "z2.h"
            ca = "z3.h"
            L.append("    add x8, x5, #%d" % (64 * (4 * p + 1)))
            L.append("    ld1h {%s}, p0/z, [x8]" % ra)
            L.append("    add x8, x5, #%d" % (64 * (4 * p + 3)))
            L.append("    ld1h {%s}, p0/z, [x8]" % rb)
            L.append("    zip1 %s, %s, %s" % (d, ra, rb))
            for k in range(kg, kg + 8):
                L.append("    ld1h {%s}, p1/z, [x%d, #%d, mul vl]"
                         % (ca, 9 + (k - kg), p))
                L.append("    sdot z%d.s, %s, %s"
                         % (acc0 + (k - kg), d, ca))
    # store O[k] (8 x s32 lanes) to out[k*32]
    L.append("    add x9, %s, #0" % out)
    for k in range(16):
        L.append("    st1w {z%d.s}, p1, [x9]" % (16 + k))
        L.append("    add x9, x9, #32")
    L.append("    ret")
    return "\n".join(L) + "\n"


if __name__ == "__main__":
    import sys
    with open(sys.argv[1], "w") as f:
        f.write(emit())
    print("wrote %s" % sys.argv[1])
