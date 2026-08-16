#!/usr/bin/env python3
"""SATD 8x8 width-independent DAG tests (non-DCT PoC)."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from lane_defuse import defuse_report  # noqa: E402
from satd8_emit import emit_satd8  # noqa: E402
from satd8_op_ir import satd8_dag, satd16_dag  # noqa: E402


def main():
    ops = satd8_dag()
    assert all("n_out" in o.attrs and "lane_in" in o.attrs for o in ops)
    r = defuse_report(ops)
    assert r["ok"], r["issues"][:5]
    assert r["ops"] == len(ops)
    kinds = {o.kind for o in ops}
    assert {"load_diff", "add", "sub", "permute", "abs", "abd",
            "max", "vpaddl", "vpadal", "vaddv"} <= kinds
    src = emit_satd8(ops)
    assert "return satd;" in src
    assert src.count("vtrn1q_s16") == 4
    assert src.count("vtrn2q_s16") == 4
    assert src.count("vtrn1q_s32") == 4
    assert src.count("vtrn2q_s32") == 4
    assert src.count("vsubl_u8") == 8
    assert src.count("vmaxq_u16") == 4
    assert src.count("vpaddlq_u16") == 1
    assert src.count("vpadalq_u16") == 1
    assert src.count("vaddvq_u32") == 1
    # Every emitted statement declares exactly one value.
    stmts = [l for l in src.splitlines()
             if re.match(r"\s+(u?int\w+_t|int) v\d+", l)]
    assert len(stmts) == len([o for o in ops if o.kind != "vaddv"])
    print("SATD8 IR DAG OK: ops=%d statements=%d"
          % (len(ops), len(stmts)))

    ops16 = satd16_dag()
    assert all("n_out" in o.attrs and "lane_in" in o.attrs for o in ops16)
    r16 = defuse_report(ops16)
    assert r16["ok"], r16["issues"][:5]
    src16 = emit_satd8(ops16, func_name="dynopt_satd_16x16_sve2")
    assert src16.count("vsubl_u8") == 32
    assert src16.count("vget_low_u8") == 32
    assert src16.count("vget_high_u8") == 32
    assert src16.count("vmaxq_u16") == 16
    assert src16.count("vpaddlq_u16") == 1
    assert src16.count("vaddvq_u32") == 1
    print("SATD16 IR DAG OK: ops=%d" % len(ops16))
    return 0


if __name__ == "__main__":
    sys.exit(main())
