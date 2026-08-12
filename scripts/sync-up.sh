#!/usr/bin/env bash
# Sync one local path to the remote worktree (single rsync source!) and
# optionally commit it on the remote. Usage:
#   scripts/sync-up.sh <relative-path> ["commit message"]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SRC="${1:?usage: sync-up.sh <relative-path> [commit message]}"
REMOTE="${SYNC_REMOTE:-chiro@129.146.162.16:projects/a64-simd-dyn-optimizer}"

if [ ! -e "$SRC" ]; then
  echo "[sync-up] missing local path: $SRC" >&2
  exit 1
fi

if [ -d "$SRC" ]; then
  rsync -az -e 'ssh -o BatchMode=yes' "$SRC/" "$REMOTE/$SRC/"
else
  rsync -az -e 'ssh -o BatchMode=yes' "$SRC" "$REMOTE/$SRC"
fi

if [ -n "${2:-}" ]; then
  ssh -o BatchMode=yes chiro@129.146.162.16 \
    "cd ~/projects/a64-simd-dyn-optimizer && git add -A && git commit -q -m \"$2\" && git log --oneline -1"
fi
