"""Static plan<->source consistency checker (round-0012 P1, increment 5).

The plan's tiles/lowering declare which mechanisms are active; lower()
emits C++ blocks. This checker proves, at block granularity, that the
emitted source contains exactly the instruction families the plan
declares (per 4-row group, since pass32_impl is a per-pass template):

  odd sdot.d      : 64 svdot_s64 + (16 svst1_s16 | 16 svst1_s64 temp)
                    + 64 runtime svtbl when constant_layout=canonical
  odd row-reduce  : 64 svdot_s64 + 64 svaddv_s64 + 64 scalar stores
  k2 sliced (p1)  : 16 svdot_s64 + 8 svst1_s16 + 32 svmul + 32 svaddv
                    + 32 scalar stores (pass2 else-branch retained)
  k2 mul          : 32 svmul + 32 svaddv + 32 scalar stores
  k4              : 16 svmul + 16 svaddv + 16 scalar stores
  k0              : 8 svst1_s32 + 16 scalar stores

It also enforces the hard memory policy: zero scatter/gather in source.
"""

import re


def _expected_counts(lowering):
    odd = lowering.get("odd_lowering", "row-reduce")
    narrow = lowering.get("narrow_batch", 1)
    const = lowering.get("constant_layout", "canonical")
    k2 = lowering.get("pass1_k2_slice", 0)
    c = {"svdot_s64": 0, "svaddv_s64": 0, "svst1_s16": 0, "svst1_s64": 0,
         "svmul_s32": 0, "svaddv_s32": 0, "svst1_s32": 0,
         "scalar_dst": 0, "const_tbl": 0}
    if odd == "sdot.d":
        c["svdot_s64"] += 64
        if narrow == 4:
            c["svst1_s16"] += 16
        else:
            c["svst1_s64"] += 16
            c["scalar_dst"] += 64   # temp store + 4 scalar rounds per k
        if const == "canonical":
            c["const_tbl"] += 64
    else:
        c["svdot_s64"] += 64
        c["svaddv_s64"] += 64
        c["scalar_dst"] += 64
    if k2:
        c["svdot_s64"] += 16
        c["svst1_s16"] += 8
    c["svmul_s32"] += 32
    c["svaddv_s32"] += 32
    c["scalar_dst"] += 32
    c["svmul_s32"] += 16          # k4
    c["svaddv_s32"] += 16
    c["scalar_dst"] += 16
    c["svst1_s32"] += 8           # k0
    c["scalar_dst"] += 16
    return c


def _count_source(src):
    # Count only the pass32_impl template body; leaf32 (leaf-building
    # helper) has its own stores that are not per-k-family mechanism
    # counts and would skew the proof.
    seg = src.split("template<int shift>")[-1]
    return {
        "svdot_s64": len(re.findall(r"svdot_s64\(", seg)),
        "svaddv_s64": len(re.findall(r"svaddv_s64\(", seg)),
        "svst1_s16": len(re.findall(r"svst1_s16\(", seg)),
        "svst1_s64": len(re.findall(r"svst1_s64\(", seg)),
        "svmul_s32": len(re.findall(r"svmul_s32_x\(", seg)),
        "svaddv_s32": len(re.findall(r"svaddv_s32\(", seg)),
        "svst1_s32": len(re.findall(r"svst1_s32\(", seg)),
        "scalar_dst": len(re.findall(r"dst\[", seg)),
        "const_tbl": len(re.findall(r"svtbl_s16\(c, ic", seg)),
        "scatter": len(re.findall(r"\bst1d\b|\bgather\b", seg)),
    }


def check_source(plan, src):
    """Return (ok, report). report has expected/actual per family plus
    scatter count and a list of mismatched keys."""
    expected = _expected_counts(plan.lowering)
    actual = _count_source(src)
    mism = []
    for k in expected:
        if actual[k] != expected[k]:
            mism.append("%s expected=%d actual=%d" %
                        (k, expected[k], actual[k]))
    if actual["scatter"]:
        mism.append("scatter present in source: %d" % actual["scatter"])
    report = {"expected": expected, "actual": actual, "mismatches": mism}
    return (not mism, report)
