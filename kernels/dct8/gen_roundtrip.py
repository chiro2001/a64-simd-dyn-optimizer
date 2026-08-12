#!/usr/bin/env python3
"""DCT8 MachineIR -> C++ NEON roundtrip generator.

Usage:
  python3 kernels/dct8/gen_roundtrip.py <machine-ir.json> <out.cpp>
      [--widen-pass2]   apply the C-exact s32 odd-column fix (upstream bug)
      [--widen-overflow] range-driven variant: widen every s16 sub flagged by
                        the value-range analysis (generalizes --widen-pass2)

The generated function is `dynopt_dct8_neon_candidate(const int16_t*, int16_t*,
intptr_t)` and must be bit-exact with the x265 dct8 C reference inside the
[-255,255] 8-bit residual contract.
"""

import json
import sys

from optimizer.ir.codegen import emit_dct8_c_intrinsics
from optimizer.ir.machine_ir import MachineIR
from optimizer.ir.rewrites import widen_dct8_pass2_odd, widen_overflows


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    doc = json.load(open(sys.argv[1]))
    ir = MachineIR(function=doc.get("function"), nodes=doc["nodes"])
    if "--widen-pass2" in sys.argv:
        widen_dct8_pass2_odd(ir)
        print("applied widen_pass2_odd rewrite")
    elif "--widen-overflow" in sys.argv:
        widen_overflows(ir)
        print("applied range-driven widen_overflows rewrite")
    code = emit_dct8_c_intrinsics(ir)
    with open(sys.argv[2], "w") as f:
        f.write(code)
    print("wrote %s (%d lines)" % (sys.argv[2], code.count("\n")))
    return 0


if __name__ == "__main__":
    sys.exit(main())
