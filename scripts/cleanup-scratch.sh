#!/usr/bin/env bash
# Project scratch cleanup (2026-08-16).
#
# Prunes regenerable/ignored artifacts so the repo and machine stay lean:
#   1. experiments/: ignored raw search outputs (keeps results.json etc.)
#   2. ~/tmp: project leftovers except keep-list
#   3. /tmp: project temp binaries and qemu/tool temp .so files
#
# Usage:
#   scripts/cleanup-scratch.sh            # dry run (prints what would be removed)
#   scripts/cleanup-scratch.sh --clean    # actually remove
set -uo pipefail

CLEAN=0
if [ "${1:-}" = "--clean" ]; then
  CLEAN=1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "== experiments (ignored raw outputs) =="
if [ "$CLEAN" = 1 ]; then
  git clean -fdX experiments
else
  git clean -ndX experiments | head -20
  echo "... ($(git clean -ndX experiments | wc -l) entries would be removed)"
fi

TMPKEEP="videos|dynopt|node-compile-cache|opencode|pnpm-*"
echo "== ~/tmp (project leftovers; keep: $TMPKEEP) =="
for e in "$HOME"/tmp/*; do
  [ -e "$e" ] || continue
  b=$(basename "$e")
  case "$b" in videos|dynopt|node-compile-cache|opencode|pnpm-*) continue;; esac
  if [ "$CLEAN" = 1 ]; then
    find "$e" -depth -delete 2>/dev/null
  else
    echo "would remove $e"
  fi
done

echo "== /tmp (project temps) =="
if [ "$CLEAN" = 1 ]; then
  find /tmp -maxdepth 1 -name '.9a*.so' -delete 2>/dev/null
  for e in /tmp/sao-bench /tmp/psy-bench /tmp/entropy-verify-* \
           /tmp/entropy-trace-replay* /tmp/quant-* /tmp/dct32-* \
           /tmp/qt-* /tmp/c1c2-* /tmp/ccn-* /tmp/remain-* \
           /tmp/e2e-full.tar.gz /tmp/clip2.yuv /tmp/freeze-* \
           /tmp/gitclean.log; do
    [ -e "$e" ] && find "$e" -depth -delete 2>/dev/null
  done
else
  find /tmp -maxdepth 1 -name '.9a*.so' 2>/dev/null | head -5
  echo "... ($(find /tmp -maxdepth 1 -name '.9a*.so' | wc -l) temp .so files)"
fi

echo "done (dry-run; pass --clean to remove)"
