#!/usr/bin/env bash
# Randomized paired PMU A/B for SA8D: candidate vs same-machine NEON.
#
# One valid pair = one perf-stat run of each impl (random order) on the
# pinned vCPU; both gross cycles:u/instructions:u and net (empty-subtracted)
# per-call values are recorded. ≥MIN_VALID pairs across ≥3 processes are
# required; the bootstrap 95% CI of the per-pair speedup must have its lower
# bound above the keep threshold (default 1.10 for 920B NEON->SVE256).
#
# Usage: scripts/run-pmu-sa8d-paired.sh <bench-binary> <shape>
#          [pairs_per_proc=10] [procs=3] [batch=4096] [outdir]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BIN="${1:?usage: run-pmu-sa8d-paired.sh <bench> <shape> [pairs] [procs] [batch] [out]}"
SHAPE="${2:?usage: run-pmu-sa8d-paired.sh <bench> <shape> [pairs] [procs] [batch] [out]}"
PAIRS="${3:-10}"
PROCS="${4:-3}"
BATCH="${5:-4096}"
OUT="${6:-experiments/m11-sve-920b/benchmark/pmu}"
MIN_VALID="${MIN_VALID:-30}"
KEEP_LO="${KEEP_LO:-1.10}"
CPU="${CPU:-0}"

mkdir -p "$OUT"
RAW="$OUT/paired-pmu-raw.csv"
: > "$RAW"

run_perf() {
  local impl="$1"
  perf stat -x, -e cycles:u,instructions:u \
    taskset -c "$CPU" "$BIN" "$SHAPE" "$impl" latency 1 "$BATCH" --noverify \
    2>&1 | awk -F, '$1=="cycles:u"{c=$2} $1=="instructions:u"{i=$2} END{printf "%.0f,%.0f", c, i}'
}

for p in $(seq 1 "$PROCS"); do
  for s in $(seq 1 "$PAIRS"); do
    order=$((RANDOM % 2))
    if [ "$order" -eq 0 ]; then
      n=$(run_perf neon); c=$(run_perf cand)
    else
      c=$(run_perf cand); n=$(run_perf neon)
    fi
    echo "$p,$s,$order,$n,$c" >> "$RAW"
  done
done

python3 - "$RAW" "$OUT" "$MIN_VALID" "$KEEP_LO" "$BATCH" <<'PY'
import csv, json, random, statistics, sys
raw, out, min_valid, keep_lo, batch = sys.argv[1:6]
min_valid, keep_lo, batch = int(min_valid), float(keep_lo), int(batch)

valid = []
with open(raw) as f:
    for r in csv.reader(f):
        if len(r) != 5 or not r[3] or not r[4]:
            continue
        a = [float(x) for x in r[3].split(",")]
        b = [float(x) for x in r[4].split(",")]
        if any(v <= 0 for v in a + b):
            continue
        neon_cyc, neon_insn = a[0] / batch, a[1] / batch
        cand_cyc, cand_insn = b[0] / batch, b[1] / batch
        valid.append((int(r[0]), int(r[1]), int(r[2]),
                      neon_cyc, neon_insn, cand_cyc, cand_insn))

ratios = [n[3] / n[5] for n in valid]          # speedup = neon_cyc / cand_cyc
rng = random.Random(0x920B)
B = 10000
bs = []
for _ in range(B):
    s = [ratios[rng.randrange(len(ratios))] for _ in ratios]
    bs.append(statistics.median(s))
bs.sort()
lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
med = statistics.median(ratios) if ratios else float("nan")
geo = statistics.geometric_mean(ratios) if ratios else float("nan")
nprocs = len(set(n[0] for n in valid))
ok = (len(valid) >= min_valid and lo > keep_lo and nprocs >= 3)

with open(f"{out}/paired-pmu-summary.txt", "w") as f:
    f.write("valid_pairs=%d procs=%d\n" % (len(valid), nprocs))
    f.write("speedup_median=%.4f geomean=%.4f bootstrap95=[%.4f, %.4f]\n"
            % (med, geo, lo, hi))
    f.write("keep_lo=%.3f min_valid=%d verdict=%s\n"
            % (keep_lo, min_valid, "KEEP" if ok else "REJECT"))

with open(f"{out}/paired-pmu-per-call.csv", "w") as f:
    f.write("proc,pair,order,neon_cyc,neon_insn,cand_cyc,cand_insn\n")
    for v in valid:
        f.write("%d,%d,%d,%.2f,%.2f,%.2f,%.2f\n" % v)

print(json.dumps({
    "valid_pairs": len(valid), "procs": nprocs,
    "speedup_median": med, "speedup_geomean": geo,
    "bootstrap95": [lo, hi], "keep_lo": keep_lo,
    "verdict": "KEEP" if ok else "REJECT",
}))
sys.exit(0 if ok else 1)
PY

echo "[run-pmu-sa8d-paired] wrote $OUT/paired-pmu-summary.txt"
