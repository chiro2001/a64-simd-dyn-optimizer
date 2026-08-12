#!/usr/bin/env bash
# Full M0 SA8D baseline matrix + PMU counts.
# Usage: scripts/run-sa8d-baseline.sh [outdir] [samples] [batch] [procs]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

OUT="${1:-experiments/m0-foundation/benchmark}"
SAMPLES="${2:-30}"
BATCH="${3:-4096}"
PROCS="${4:-3}"
MB="$ROOT/build/sa8d_microbench"

if [ ! -x "$MB" ]; then
  echo "[run-sa8d-baseline] missing $MB; run scripts/build-sa8d-microbench.sh" >&2
  exit 1
fi

mkdir -p "$OUT"

for shape in 8x8 16x16 32x32 64x64; do
  for impl in c neon empty; do
    for mode in latency throughput; do
      raw="$OUT/raw-${shape}-${impl}-${mode}.csv"
      : > "$raw"
      for p in $(seq 1 "$PROCS"); do
        "$MB" "$shape" "$impl" "$mode" "$SAMPLES" "$BATCH" --noverify 2>/dev/null \
          | tail -n +2 \
          | awk -v proc="$p" '{print proc "," $0}' >> "$raw"
      done
    done
  done
done

cat "$OUT"/raw-*.csv > "$OUT/all-raw.csv"
: > "$OUT/summary.csv"
printf "shape,impl,mode,median_ns,mean_ns,mad_ns,p05_ns,p95_ns,cv\n" >> "$OUT/summary.csv"

# Per (shape,impl,mode) stats: median, p05, p95, MAD, mean, CV.
python3 - "$OUT" <<'PY'
import csv, math, statistics, sys
out = sys.argv[1]
rows = {}
with open(f"{out}/all-raw.csv") as f:
    for r in csv.DictReader(f, fieldnames=["proc","shape","impl","mode","sample","batch","ns","ticks","checksum"]):
        key = (r["shape"], r["impl"], r["mode"])
        rows.setdefault(key, []).append(float(r["ns"]))
with open(f"{out}/summary.csv", "a") as f:
    for key in sorted(rows):
        v = sorted(rows[key])
        n = len(v)
        med = statistics.median(v)
        mean = statistics.mean(v)
        mad = statistics.median([abs(x - med) for x in v])
        p05 = v[int(0.05 * (n - 1))]
        p95 = v[int(0.95 * (n - 1))]
        cv = statistics.pstdev(v) / mean if mean else float("nan")
        f.write("%s,%s,%s,%.1f,%.2f,%.1f,%.1f,%.1f,%.4f\n" % (key[0], key[1], key[2], med, mean, mad, p05, p95, cv))
PY

echo "[run-sa8d-baseline] wrote $OUT/all-raw.csv and $OUT/summary.csv"
