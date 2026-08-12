#!/usr/bin/env bash
# Full M0 SA8D baseline matrix with per-process noise gate.
# A whole process run is discarded when its CV > NOISE_CV (default 0.10);
# at least MIN_VALID (default 3) valid process runs are required per cell.
# Usage: scripts/run-sa8d-baseline.sh [outdir] [samples] [batch] [procs]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

OUT="${1:-experiments/m0-foundation/benchmark}"
SAMPLES="${2:-30}"
BATCH="${3:-4096}"
PROCS="${4:-5}"
NOISE_CV="${NOISE_CV:-0.10}"
MIN_VALID="${MIN_VALID:-3}"
MB="$ROOT/build/sa8d_microbench"
PIN=""
if command -v taskset >/dev/null 2>&1; then
  PIN="taskset -c 0"
fi

if [ ! -x "$MB" ]; then
  echo "[run-sa8d-baseline] missing $MB; run scripts/build-sa8d-microbench.sh" >&2
  exit 1
fi

mkdir -p "$OUT"

for shape in 8x8 16x16 32x32 64x64; do
  for impl in c neon empty; do
    for mode in latency throughput; do
      raw="$OUT/raw-${shape}-${impl}-${mode}.csv"
      gate="$OUT/gate-${shape}-${impl}-${mode}.csv"
      : > "$raw"
      : > "$gate"
      printf "proc,median_ns,mean_ns,cv,kept\n" > "$gate"
      for p in $(seq 1 "$PROCS"); do
        tmp="$(mktemp)"
        $PIN "$MB" "$shape" "$impl" "$mode" "$SAMPLES" "$BATCH" --noverify 2>/dev/null \
          | tail -n +2 \
          | awk -v proc="$p" '{print proc "," $0}' > "$tmp"
        python3 - "$tmp" "$gate" "$p" "$NOISE_CV" "$raw" <<'PY'
import csv, statistics, sys
tmp, gate, proc, noise_cv, raw = sys.argv[1], sys.argv[2], int(sys.argv[3]), float(sys.argv[4]), sys.argv[5]
vals = []
with open(tmp) as f:
    for r in csv.DictReader(f, fieldnames=["proc","shape","impl","mode","sample","batch","ns","ticks","checksum"]):
        vals.append(float(r["ns"]))
med = statistics.median(vals)
mean = statistics.mean(vals)
cv = statistics.pstdev(vals) / mean if mean else 0.0
kept = 1 if cv <= noise_cv else 0
with open(gate, "a") as g:
    g.write("%d,%.1f,%.1f,%.4f,%d\n" % (proc, med, mean, cv, kept))
if kept:
    with open(tmp) as f:
        data = f.read()
    with open(raw, "a") as r:
        r.write(data)
PY
        rm -f "$tmp"
      done
    done
  done
done

cat "$OUT"/raw-*.csv > "$OUT/all-raw.csv"
: > "$OUT/summary.csv"
printf "shape,impl,mode,median_ns,mean_ns,mad_ns,p05_ns,p95_ns,cv,valid_procs\n" >> "$OUT/summary.csv"

python3 - "$OUT" "$MIN_VALID" <<'PY'
import csv, statistics, sys
out, min_valid = sys.argv[1], int(sys.argv[2])
rows = {}
procs = {}
with open(f"{out}/all-raw.csv") as f:
    for r in csv.DictReader(f, fieldnames=["proc","shape","impl","mode","sample","batch","ns","ticks","checksum"]):
        key = (r["shape"], r["impl"], r["mode"])
        rows.setdefault(key, []).append(float(r["ns"]))
        procs.setdefault(key, set()).add(r["proc"])
with open(f"{out}/summary.csv", "a") as f:
    for key in sorted(rows):
        nprocs = len(procs[key])
        v = sorted(rows[key])
        n = len(v)
        if nprocs < min_valid or not v:
            f.write("%s,%s,%s,nan,nan,nan,nan,nan,nan,%d\n" % (key[0], key[1], key[2], nprocs))
            continue
        med = statistics.median(v)
        mean = statistics.mean(v)
        mad = statistics.median([abs(x - med) for x in v])
        p05 = v[int(0.05 * (n - 1))]
        p95 = v[int(0.95 * (n - 1))]
        cv = statistics.pstdev(v) / mean if mean else float("nan")
        f.write("%s,%s,%s,%.1f,%.2f,%.1f,%.1f,%.1f,%.4f,%d\n" % (
            key[0], key[1], key[2], med, mean, mad, p05, p95, cv, nprocs))
PY

echo "[run-sa8d-baseline] wrote $OUT/summary.csv (noise gate CV<=$NOISE_CV, min valid=$MIN_VALID)"
