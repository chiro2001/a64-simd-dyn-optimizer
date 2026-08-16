#!/usr/bin/env python3
"""SAO stats E0 64x1 width-independent DAG tests (triple-ISA family)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from lane_defuse import defuse_report  # noqa: E402
from sao_e0_emit import emit_sao_e0_64  # noqa: E402
from sao_e0_op_ir import sao_e0_64_dag  # noqa: E402


def main():
    ops = sao_e0_64_dag()
    assert all("n_out" in o.attrs and "lane_in" in o.attrs for o in ops)
    r = defuse_report(ops)
    assert r["ok"], r["issues"][:5]
    kinds = {o.kind for o in ops}
    assert {"edge", "vceq", "vpadal_s8", "vzip1_s8", "vzip2_s8",
            "dot_stats", "vpadal_s16", "vpadd_s16", "vpaddl_s16",
            "store_sub32", "scalar_sub"} <= kinds
    src = emit_sao_e0_64(ops)
    assert src.count("sign16n") >= 4
    assert src.count("vceqq_s8") == 20
    assert src.count("vpadalq_s8") == 20
    assert src.count("vzip1q_s8") == 20
    assert src.count("vmulq_s16") == 20
    assert src.count("vmlaq_s16") == 20
    assert src.count("vpadalq_s16") == 20
    assert src.count("vpaddq_s16") == 3
    assert src.count("vst1q_s32") == 2
    print("SAO E0 IR DAG OK: ops=%d" % len(ops))
    return 0


if __name__ == "__main__":
    sys.exit(main())
