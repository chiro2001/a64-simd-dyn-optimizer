#!/usr/bin/env python3
"""SAD 16x16 width-independent DAG tests (asm-family first member)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from lane_defuse import defuse_report  # noqa: E402
from sad_emit import emit_sad16  # noqa: E402
from sad_op_ir import sad16x16_dag  # noqa: E402


def main():
    ops = sad16x16_dag()
    assert all("n_out" in o.attrs and "lane_in" in o.attrs for o in ops)
    r = defuse_report(ops)
    assert r["ok"], r["issues"][:5]
    src = emit_sad16(ops)
    assert src.count("vld1q_u8") == 32
    assert src.count("vget_low_u8") == 32
    assert src.count("vget_high_u8") == 32
    assert src.count("vabal_u8") == 32
    assert src.count("vaddlvq_u16") == 2
    assert "return sad;" in src
    print("SAD16 IR DAG OK: ops=%d" % len(ops))
    return 0


if __name__ == "__main__":
    sys.exit(main())
