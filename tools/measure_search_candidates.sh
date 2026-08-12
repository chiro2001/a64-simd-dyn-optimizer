#!/usr/bin/env bash
# P0 measure-all step: for every distinct .text candidate in a search outdir,
# build the DCT8 microbench linked against it, ship it to the target machine,
# run the randomized paired benchmark, and emit the measured ranking.
#
# Usage:
#   tools/measure_search_candidates.sh <outdir> <n1|920b> [samples] [procs]
#
# Candidates must export the symbol `dynopt_search_candidate` (the
# search_driver codegen default). The script builds with static libstdc++
# so the binary also runs on older distros (920B / openEuler GCC 12).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:?usage: measure_search_candidates.sh <outdir> <n1|920b> [samples] [procs]}"
MACHINE="${2:?usage: measure_search_candidates.sh <outdir> <n1|920b> [samples] [procs]}"
SAMPLES="${3:-30}"
PROCS="${4:-5}"

case "$MACHINE" in
  n1)   HOST=chiro@129.146.162.16; REMOTE=projects/a64-simd-dyn-optimizer ;;
  920b) HOST=chiro@124.70.206.229; REMOTE=projects/a64-simd-dyn-optimizer ;;
  *) echo "machine must be n1 or 920b" >&2; exit 2 ;;
esac

SRC="$ROOT/third_party/x265/source"
LIB="$ROOT/build/x265-8-cross-make/libx265.a"
[ -f "$LIB" ] || { echo "missing $LIB (run scripts/build-x265.sh first)" >&2; exit 1; }

measure_dir="$ROOT/$OUT/measured-$MACHINE"
mkdir -p "$measure_dir"
results="$measure_dir/results.json"
echo "[]" > "$results"

for cpp in "$ROOT"/"$OUT"/*.cpp; do
    [ -e "$cpp" ] || continue
    tag="$(basename "$cpp" .cpp)"
    bin="$ROOT/build/mb_search_${MACHINE}_${tag}"
    "${CXX:-aarch64-linux-gnu-g++}" -O3 -DNDEBUG -std=c++11 \
      -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
      -DDYNOPT_CANDIDATE=dynopt_search_candidate \
      -I"$SRC" -I"$SRC/common" -I"$ROOT/build/x265-8-cross-make" \
      "$ROOT/benchmarks/dct8_microbench.cpp" "$cpp" "$LIB" \
      -static-libstdc++ -static-libgcc -lpthread -ldl -o "$bin"

    base="$(basename "$bin")"
    remote_bin="build/$base"                       # repo-relative, after cd
    remote_out="$OUT/measured-$MACHINE/$tag"       # repo-relative, after cd
    scp -q "$bin" "$HOST:$REMOTE/build/$base"      # scp resolves from $HOME
    summary=$(ssh -o BatchMode=yes "$HOST" \
      "cd '$REMOTE' && scripts/bench-paired.sh '$remote_bin' $SAMPLES $PROCS '$remote_out' 2>/dev/null | tail -1")
    echo "$tag: $summary"

    python3 - "$results" "$tag" "$summary" <<'PY'
import json, re, sys
path, tag, summary = sys.argv[1], sys.argv[2], sys.argv[3]
m = re.search(r"median=([0-9.]+).*bootstrap95=\[([0-9.]+), ([0-9.]+)\]", summary)
row = {"tag": tag}
if m:
    row.update(median=float(m.group(1)), lo=float(m.group(2)),
               hi=float(m.group(3)))
rows = json.load(open(path))
rows.append(row)
json.dump(rows, open(path, "w"), indent=1)
PY
done

python3 - "$results" <<'PY'
import json, sys
rows = json.load(open(sys.argv[1]))
rows.sort(key=lambda r: (-(r.get("median") or 0), r["tag"]))
print("\nmeasured ranking (%s, median neon/cand; >1 means candidate faster):"
      % sys.argv[1])
for r in rows:
    if "median" in r:
        print("  %-28s median=%.4f ci=[%.4f, %.4f]"
              % (r["tag"], r["median"], r["lo"], r["hi"]))
    else:
        print("  %-28s measurement failed" % r["tag"])
json.dump(rows, open(sys.argv[1], "w"), indent=1)
PY
