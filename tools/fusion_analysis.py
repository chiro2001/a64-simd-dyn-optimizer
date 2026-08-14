#!/usr/bin/env python3
"""Static fusion inventory for a kernel's final assembly (docs/09 v0.1).

Usage:
  aarch64-linux-gnu-objdump -d f.o | python3 tools/fusion_analysis.py - \
      --kernel <name> --out <report.json>
  python3 tools/fusion_analysis.py <disasm.txt> --kernel <name>
"""

import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.analysis.fusion import fusion_report

PROFILES = {
    "kunpeng-n2-sve2p3-vl256": {"name": "kunpeng-n2-sve2p3-vl256",
                                "issue_est": 4},
    "kunpeng-920b-sve-vl256": {"name": "kunpeng-920b-sve-vl256",
                               "issue_est": 4},
    "n1-neon128": {"name": "n1-neon128", "issue_est": 4},
}


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    path = sys.argv[1]
    kernel = "kernel"
    profile = PROFILES["kunpeng-n2-sve2p3-vl256"]
    out = None
    i = 2
    while i < len(sys.argv):
        if sys.argv[i] == "--kernel":
            kernel = sys.argv[i + 1]
            i += 2
        elif sys.argv[i] == "--profile":
            profile = PROFILES[sys.argv[i + 1]]
            i += 2
        elif sys.argv[i] == "--out":
            out = sys.argv[i + 1]
            i += 2
        else:
            i += 1
    text = sys.stdin.read() if path == "-" else open(path).read()
    report = fusion_report(kernel, profile, text)
    if out:
        json.dump(report, open(out, "w"), indent=1)
    s = report["summary"]
    print("kernel=%s profile=%s" % (report["kernel"], report["profile"]))
    print("counts=%s n_est=%d instruction_score=%.2f"
          % (report["counts"], report["n_est"],
             report["estimation"]["instruction_score"]))
    print("compute_bound=%s load_pressure=%s"
          % (report["compute_bound_prediction"], report["load_pressure"]))
    print("structurally_eligible=%d hw_supported=%d savings=%s"
          % (s["structurally_eligible"], s["hw_supported"],
             s["predicted_issue_slots_saved"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
