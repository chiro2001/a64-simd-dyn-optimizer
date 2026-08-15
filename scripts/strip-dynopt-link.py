#!/usr/bin/env python3
"""Strip /tmp dynopt objects from the cloud libx265.so.216 ninja link
line (used by freeze-best6b.sh to restore a clean baseline)."""
import re
import sys


def main():
    p = sys.argv[1] if len(sys.argv) > 1 else (
        "build/x265-8-gcc/build.ninja")
    lines = open(p).read().splitlines()
    changed = False
    for i, line in enumerate(lines):
        if line.startswith("build libx265.so.216:") and \
                ("dynopt_patch.o" in line or "/tmp/" in line):
            lines[i] = re.sub(r" /tmp/[^ ]+\.o", "", line)
            changed = True
            break
    if changed:
        open(p, "w").write("\n".join(lines) + "\n")
        print("stripped")
    return 0


if __name__ == "__main__":
    sys.exit(main())
