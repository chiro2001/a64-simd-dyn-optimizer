#!/usr/bin/env python3
"""Post-process 950 E2E results into the DB and re-run the M4 check.

After `FROZEN=1 scripts/freeze-950-dct.sh user@host` produces the
paired 30f/100f results, run this once per segment:

  python3 tools/finalize_950.py --results /tmp/950-30f.json

The results file (JSON) fields:
  frames, base_median_ms, opt_median_ms, ci_low_ms, ci_high_ms,
  base_md5, opt_md5, expect_md5 (bitstream), segment (30f|100f)

Steps: validate bit-exact md5, validate media md5 for 100f (genuine
100-frame file), upsert DB rows (kernel_db), re-run m4_declaration.py.
Use --dry-run to preview without writing.
"""

import argparse
import json
import subprocess
import sys


EXPECT_YUV_MD5 = {
    "30f": "e20e4c9e5e82f338c6cdf05787cf6cd3",
    "100f": "0f0c65c1f54a19ca53927f6efd430016",
}


def pct(base, opt):
    return (opt - base) / base * 100.0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--results", required=True)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    d = json.load(open(args.results))
    frames = d["frames"]
    segment = "30f" if frames <= 30 else "100f"

    # 1. bit-exact gate
    if d.get("base_md5") != d.get("opt_md5"):
        print("FAIL: base/opt md5 differ (not bit-exact)")
        return 1
    if d.get("expect_md5") and d["base_md5"] != d["expect_md5"]:
        print("WARN: bitstream md5 differs from frozen reference")

    # 2. media authenticity for the genuine 100f segment
    if segment == "100f" and d.get("yuv_md5") and \
            d["yuv_md5"] != EXPECT_YUV_MD5["100f"]:
        print("FAIL: 100f yuv md5 mismatch (must be the genuine "
              "100-frame file, docs/63)")
        return 1

    diff = pct(d["base_median_ms"], d["opt_median_ms"])
    ci = d["ci_low_ms"], d["ci_high_ms"]
    row = ("id=best9-frozen-950-%s date=2026-08-17 kernel=best9 "
           "family=bundle variant=frozen-950 machine=950 "
           "e2e_%s_pct=%.2f e2e_ci_ms=%.1f..%.1f bit_exact=yes "
           "report=reports/950-freeze-%s.txt"
           % (segment, segment, diff, ci[0], ci[1], segment))
    print("PLAN: %s" % row)
    if not args.dry_run:
        r = subprocess.run(["python3", "tools/kernel_db.py", "add", row],
                           capture_output=True, text=True)
        if r.returncode != 0:
            print(r.stderr)
            return 1
        subprocess.run(["python3", "tools/kernel_db.py", "export-md"],
                       capture_output=True)
        m4 = subprocess.run(["python3", "tools/m4_declaration.py"],
                            capture_output=True, text=True)
        print(m4.stdout[-1200:])
    print("OK%s: %s diff=%.2f%% CI=[%.1f,%.1f] ms"
          % (" (dry-run)" if args.dry_run else "", segment, diff,
             ci[0], ci[1]))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
