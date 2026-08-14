#!/usr/bin/env python3
"""Extract int16 constant tables from x265 source into a JSON table map.

The MachineIR line's constant loads carry `const_name` (mangled symbol) and
`const_off` (byte offset inside the *source-array* layout). Resolving them
against the linked binary's .rodata is unreliable because compilers may
re-layout constant arrays; the source definition is the layout the LLVM IR
global refers to. This extractor parses `constants.cpp` definitions such as

    const int16_t g_t16[16][16] = { ... };

and emits {name: {byte_offset: [values...]}} plus row metadata, which is the
generic constant source for the recipe-seed pipeline (docs/40 M1a2).

Usage:
  python3 tools/extract_x265_constants.py [--cpp path] [--out out.json]
"""

import argparse
import json
import os
import re


def parse_int16_tables(text):
    """Return {name: {"row_len": n, "rows": [[...]], "offsets": {...}}}."""
    tables = {}
    pat = re.compile(
        r"const\s+int16_t\s+(\w+)\s*\[[^\]]*\]\s*\[([^\]]*)\]\s*=\s*\{")
    for m in pat.finditer(text):
        name = m.group(1)
        start = m.end() - 1  # opening brace was consumed by the match
        # brace-matched block
        depth = 0
        i = start
        while i < len(text):
            if text[i] == "{":
                depth += 1
            elif text[i] == "}":
                depth -= 1
                if depth == 0:
                    break
            i += 1
        if depth != 0:
            continue
        body = text[start:i]
        # strip comments, then all integers
        body = re.sub(r"/\*.*?\*/", " ", body, flags=re.S)
        body = re.sub(r"//[^\n]*", " ", body)
        vals = [int(x) for x in re.findall(r"-?\d+", body)]
        if not vals:
            continue
        # row length from the declaration's second dimension when numeric,
        # otherwise from the first brace group (macro dims like NTAPS_*)
        dim2 = m.group(2).strip()
        if dim2.isdigit():
            row_len = int(dim2)
        else:
            first_row = body.split("}", 1)[0]
            row_len = len(re.findall(r"-?\d+", first_row)) or 1
        rows = [vals[i:i + row_len] for i in range(0, len(vals), row_len)
                if len(vals[i:i + row_len]) == row_len]
        offsets = {k * row_len * 2: list(r) for k, r in enumerate(rows)}
        tables[name] = {
            "row_len": row_len,
            "n_rows": len(rows),
            "rows": rows,
            "offsets": offsets,
        }
    return tables


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--cpp",
                    default=os.path.join(
                        os.path.dirname(os.path.dirname(
                            os.path.abspath(__file__))),
                        "third_party/x265/source/common/constants.cpp"))
    ap.add_argument("--out", default="")
    args = ap.parse_args()
    text = open(args.cpp).read()
    tables = parse_int16_tables(text)
    if args.out:
        with open(args.out, "w") as f:
            json.dump(tables, f, indent=1)
    for name, t in tables.items():
        print("%s: %dx%d" % (name, t["n_rows"], t["row_len"]))


if __name__ == "__main__":
    main()
