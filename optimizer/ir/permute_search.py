"""Lane-permutation instruction search for SVE VL=256.

Discovers a short sequence of SVE lane-permutation instructions that
realizes a target element permutation (e.g. a 16x16 transpose). The search
enumerates in-place butterfly networks over xor distances (1,2,4,8) with
zip1/zip2, trn1/trn2 and uzp1/uzp2 op pairs, verifies the result against
the Python lane model, and can emit ACLE source or a QEMU probe.

This is the data-movement half of the instruction matcher: MachineIR
shuffle masks (see patterns.py) are classified into trn/zip forms, and this
module searches *sequences* of those forms for a given permutation target.
"""

import argparse
import itertools


N = 16


def _zip1(a, b):
    return [a[i // 2] if i % 2 == 0 else b[i // 2] for i in range(N)]


def _zip2(a, b):
    return [a[8 + i // 2] if i % 2 == 0 else b[8 + i // 2]
            for i in range(N)]


def _trn1(a, b):
    return [a[i] if i % 2 == 0 else b[i - 1] for i in range(N)]


def _trn2(a, b):
    return [a[i + 1] if i % 2 == 0 else b[i] for i in range(N)]


def _uzp1(a, b):
    return [a[2 * i] if i < 8 else b[2 * (i - 8)] for i in range(N)]


def _uzp2(a, b):
    return [a[2 * i + 1] if i < 8 else b[2 * (i - 8) + 1]
            for i in range(N)]


OP_PAIRS = {
    "zip": (_zip1, _zip2),
    "trn": (_trn1, _trn2),
    "uzp": (_uzp1, _uzp2),
}


def butterfly(vectors, order, op_name):
    """Apply an in-place butterfly with xor-distance `order` using op pair
    `op_name` (lower-index slot gets op1, higher slot gets op2)."""
    v = [x[:] for x in vectors]
    f1, f2 = OP_PAIRS[op_name]
    for d in order:
        for i in range(N):
            j = i ^ d
            if i < j:
                v[i], v[j] = f1(v[i], v[j]), f2(v[i], v[j])
    return v


def transpose_target():
    """Target permutation: out[j][lane] == input[lane][j] (16x16 transpose)."""
    return [[input_r * N + out_c for input_r in range(N)]
            for out_c in range(N)]


def search_transpose(max_levels=4, ops=("zip", "trn", "uzp")):
    """Find a butterfly sequence whose outputs are the 16 transpose columns
    (natural lane order). Returns (order, op_name) or None."""
    rows = [[r * N + c for c in range(N)] for r in range(N)]
    target = transpose_target()
    for levels in range(1, max_levels + 1):
        for order in itertools.permutations([1, 2, 4, 8], levels):
            for op_name in ops:
                out = butterfly(rows, order, op_name)
                if all(out[j] == target[j] for j in range(N)):
                    return order, op_name
    return None


def emit_acle(order, op_name, inputs, outputs, suffix="t"):
    """Emit ACLE statements for an in-place butterfly over 16 named
    svint16_t variables (zip/trn/uzp pairs)."""
    fns = {
        "zip": ("svzip1_s16", "svzip2_s16"),
        "trn": ("svtrn1_s16", "svtrn2_s16"),
        "uzp": ("svuzp1_s16", "svuzp2_s16"),
    }
    f1, f2 = fns[op_name]
    lines = []
    step = 0
    for d in order:
        for i in range(N):
            j = i ^ d
            if i < j:
                a = "%s(%s[%d], %s[%d])" % (f1, inputs, i, inputs, j)
                b = "%s(%s[%d], %s[%d])" % (f2, inputs, i, inputs, j)
                lines.append("    svint16_t %s%d_%d = %s;" % (suffix, step, i, a))
                lines.append("    svint16_t %s%d_%d = %s;" % (suffix, step, j, b))
        step += 1
    return "\n".join(lines)


def probe_source(order, op_name, func="transpose16"):
    """Emit a standalone QEMU probe that verifies the discovered sequence."""
    out = []
    out.append("#include <arm_sve.h>")
    out.append("#include <stdint.h>")
    out.append("#include <stdio.h>")
    out.append("#define P16 svptrue_b16()")
    out.append("int main(void) {")
    for i in range(N):
        out.append("    int16_t tmp%d[16];" % i)
        out.append("    for (int c = 0; c < 16; c++) "
                   "tmp%d[c] = (int16_t)(%d * 16 + c);" % (i, i))
        out.append("    svint16_t v%d = svld1_s16(P16, tmp%d);" % (i, i))
    out.append("    int bad = 0;")
    names = ["v%d" % i for i in range(N)]
    f1, f2 = {
        "zip": ("svzip1_s16", "svzip2_s16"),
        "trn": ("svtrn1_s16", "svtrn2_s16"),
        "uzp": ("svuzp1_s16", "svuzp2_s16"),
    }[op_name]
    tmp_id = 0
    for d in order:
        new = list(names)
        for i in range(N):
            j = i ^ d
            if i < j:
                new[i] = "x%d_%d" % (tmp_id, i)
                new[j] = "x%d_%d" % (tmp_id, j)
                out.append("    svint16_t %s = %s(%s, %s);"
                           % (new[i], f1, names[i], names[j]))
                out.append("    svint16_t %s = %s(%s, %s);"
                           % (new[j], f2, names[i], names[j]))
        names = new
        tmp_id += 1
    for j in range(N):
        out.append("    {")
        out.append("        int16_t got[16];")
        out.append("        svst1_s16(P16, got, %s);" % names[j])
        out.append("        for (int r = 0; r < 16; r++)")
        out.append("            if (got[r] != (int16_t)(r * 16 + %d)) bad++;"
                   % j)
        out.append("    }")
    out.append("    printf(\"%s bad=%%d\\n\", bad);" % func)
    out.append("    return bad ? 1 : 0;")
    out.append("}")
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--target", default="transpose16")
    ap.add_argument("--ops", default="zip,trn,uzp")
    ap.add_argument("--probe", help="write QEMU probe C to this path")
    ap.add_argument("--acle", help="write ACLE snippet to this path")
    args = ap.parse_args()
    ops = tuple(args.ops.split(","))
    hit = search_transpose(ops=ops)
    if not hit:
        print("no sequence found")
        return 1
    order, op_name = hit
    print("found: order=%s op=%s (ops=%d)" % (order, op_name, len(order)))
    if args.probe:
        with open(args.probe, "w") as f:
            f.write(probe_source(order, op_name))
        print("probe written to %s" % args.probe)
    if args.acle:
        with open(args.acle, "w") as f:
            f.write(emit_acle(order, op_name, "out", "dst"))
        print("acle written to %s" % args.acle)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
