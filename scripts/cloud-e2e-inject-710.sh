#!/usr/bin/env bash
# Apply a locally generated dynopt compile-in bundle to the Yitian 710
# (root@47.96.166.168) Ninja x265 build and relink libx265.so.216.
#
# Variant of cloud-e2e-inject.sh for a non-git third_party/x265 worktree:
# uses patch(1) instead of git apply, and defaults REPO to /root/projects.
# Expects /tmp/e2e-full.tar.gz (out/ + work/ from
# tools/build_preload_so.py --inject-outdir) on the target host.
set -euo pipefail

REPO="${AGO_REPO:-/root/projects/a64-simd-dyn-optimizer}"
rm -rf /tmp/e2e
mkdir -p /tmp/e2e
tar -C /tmp/e2e -xzf /tmp/e2e-full.tar.gz

PRIM="$REPO/third_party/x265/source/common/primitives.cpp"
cp "$PRIM" /tmp/primitives.cpp.bak
restore() { cp -f /tmp/primitives.cpp.bak "$PRIM"; }
trap restore EXIT

cd "$REPO/third_party/x265"
patch -p1 --forward < /tmp/e2e/out/x265-dynopt-setup.patch
cd "$REPO"
ninja -C build/x265-8-gcc common/CMakeFiles/common.dir/primitives.cpp.o

python3 - <<'PY'
import os
import glob
import re

p = os.path.join(
    os.environ.get('AGO_REPO', '/root/projects/a64-simd-dyn-optimizer'),
    'build/x265-8-gcc/build.ninja')
objs = ' '.join(sorted(glob.glob('/tmp/e2e/work/*.o')) +
                ['/tmp/e2e/out/dynopt_patch.o'])
lines = open(p).read().splitlines()
for i, line in enumerate(lines):
    if line.startswith('build libx265.so.216:'):
        # Drop previously injected dynopt objects before adding this bundle.
        line = re.sub(r'(?: /tmp/[^ ]+\.o)+', '', line)
        lines[i] = line.replace(' | x265.def', ' ' + objs + ' | x265.def')
        break
open(p, 'w').write('\n'.join(lines) + '\n')
print('ninja link line patched')
PY

ninja -C build/x265-8-gcc libx265.so.216
restore
trap - EXIT
echo CLOUD_INJECT_OK
