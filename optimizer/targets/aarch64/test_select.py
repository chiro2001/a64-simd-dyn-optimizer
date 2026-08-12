#!/usr/bin/env python3
"""Tests/demo for feature-gated instruction selection."""

import sys

from optimizer.targets.aarch64.features import TargetFeatures
from optimizer.targets.aarch64.select import covered, load_db, match, plan


def main():
    db = load_db()
    patterns = [
        {"op": "umax", "lanes": 8, "bits": 16},
        {"op": "umaxp", "lanes": 8, "bits": 16},
        {"op": "fold-lo", "lanes": 8, "bits": 16},
        {"op": "fold-hi", "lanes": 8, "bits": 16},
        {"op": "uaddlv", "lanes": 8, "bits": 16},
        {"op": "add", "lanes": 8, "bits": 16},
        {"op": "load", "lanes": 8, "bits": 8},
    ]
    t_neon = TargetFeatures.neon128()
    t_sve2 = TargetFeatures.sve2_vl256()
    t_sve2p3 = TargetFeatures.sve2p3_vl256()

    print("neon128 covered:", len(covered(db, t_neon)))
    print("sve2-vl256 covered:", len(covered(db, t_sve2)))
    print("sve2p3-vl256 covered:", len(covered(db, t_sve2p3)))
    print()
    for pat in patterns:
        c_neon = [i["id"] for i in match(db, pat, t_neon)]
        c_sve2 = [i["id"] for i in match(db, pat, t_sve2)]
        print(pat["op"], "neon:", c_neon, "| sve2:", c_sve2)

    # Gate check: SVE instructions must not appear under neon-only target.
    sve_leak = [i["id"] for i in db
                if i["feature"] in ("sve", "sve2", "sve2p1", "sve2p2",
                                    "sve2p3")
                and t_neon.allows(i["feature"])]
    print("sve_leak_under_neon:", sve_leak)

    # Combined-feature gate: sve+i8mm instructions need both features.
    t_sve_only = TargetFeatures(neon=True, sve=True)
    t_sve_i8mm = TargetFeatures(neon=True, dotprod=True, i8mm=True, sve=True)
    t_bad_i8mm = TargetFeatures(neon=True, i8mm=True, sve=True)
    mm_pat = {"op": "smmla", "pred": False}
    mm_sve = [i["id"] for i in match(db, mm_pat, t_sve_only)]
    mm_i8mm = [i["id"] for i in match(db, mm_pat, t_sve_i8mm)]
    mm_bad = [i["id"] for i in match(db, mm_pat, t_bad_i8mm)]
    print("smmla sve-only:", mm_sve, "| sve+i8mm:", mm_i8mm,
          "| bad-dep:", mm_bad)
    if mm_sve or "sve-smmla-s32" not in mm_i8mm or mm_bad:
        return 1
    return 1 if sve_leak else 0


if __name__ == "__main__":
    sys.exit(main())
