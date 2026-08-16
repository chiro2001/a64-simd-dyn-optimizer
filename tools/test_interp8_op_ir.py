#!/usr/bin/env python3
"""interp8 hpp 16x16 per-coeff DAG tests (filter family)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from interp8_emit import emit_interp8_hpp  # noqa: E402
from interp8_op_ir import (interp8_hpp_8x8_dag, interp8_hpp_16x8_dag,
                           interp8_hpp_16x16_dag,
                           interp8_hpp_32x32_dag)  # noqa: E402
from lane_defuse import defuse_report  # noqa: E402


def main():
    ops = interp8_hpp_16x16_dag()
    assert all("n_out" in o.attrs and "lane_in" in o.attrs for o in ops)
    r = defuse_report(ops)
    assert r["ok"], r["issues"][:5]
    src = emit_interp8_hpp(ops)
    assert src.count("if (coeffIdx == 1)") == 1
    assert src.count("else if (coeffIdx == 2)") == 1
    assert src.count("vld1q_u8") == 128
    assert src.count("vqrshrun_n_s16") == 96
    assert src.count("vmlaq_n_s16") == 128
    assert src.count("vst1q_u8") == 48
    print("interp8 hpp IR DAG OK: ops=%d" % len(ops))

    ops16x8 = interp8_hpp_16x8_dag()
    assert defuse_report(ops16x8)["ok"]
    src16x8 = emit_interp8_hpp(ops16x8)
    assert src16x8.count("vld1q_u8") == 8 * 8
    assert src16x8.count("vst1q_u8") == 8 * 3

    ops32x32 = interp8_hpp_32x32_dag()
    assert defuse_report(ops32x32)["ok"]
    src32x32 = emit_interp8_hpp(ops32x32)
    assert src32x32.count("vld1q_u8") == 32 * 8 * 2
    assert src32x32.count("vst1q_u8") == 32 * 3 * 2
    print("interp8 hpp IR 16x8/32x32 shapes OK")

    ops8x8 = interp8_hpp_8x8_dag()
    assert defuse_report(ops8x8)["ok"]
    src8x8 = emit_interp8_hpp(ops8x8)
    assert src8x8.count("vld1_u8") == 8 * 8
    assert src8x8.count("vst1_u8") == 8 * 3
    assert src8x8.count("vld1q_u8") == 0
    print("interp8 hpp IR 8x8 shape OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
