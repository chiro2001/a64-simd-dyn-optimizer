#!/usr/bin/env python3
"""Generic width-independent-DAG pipeline runner.

Runs the full optimizer loop for any kernel family:
  build DAG -> lane def-use -> emit source -> compile -> differential
  gate (QEMU) -> dynamic counts -> report.

Usage:
  python3 tools/dag_pipeline.py --kernel satd-8 --func dynopt_satd_8x8_sve2 \
      --dag satd8_dag --emit satd8_emit --march armv8.2-a+dotprod

The --dag/--emit values are import paths (module:function) under
optimizer/ir, so new families only need a DAG builder + emitter.
"""

import argparse
import importlib
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "optimizer/analysis", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from gen_verify import generate as gen_verify  # noqa: E402
from kernel_manifest import load_manifest  # noqa: E402
from lane_defuse import defuse_report  # noqa: E402
from search_plans import measure  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--kernel", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument("--dag", required=True, help="module:function")
    ap.add_argument("--emit", required=True, help="module:function")
    ap.add_argument("--march", default="armv8.2-a+dotprod")
    ap.add_argument("--emit-kwargs", default="",
                    help="extra kwargs for the emitter, e.g. "
                         "target=sve2")
    ap.add_argument("--workdir", default="build/tmp-dag-pipeline")
    ap.add_argument("--cases", type=int, default=20000)
    ap.add_argument("--vqs", default="1,2")
    ap.add_argument("--verify-flags", default="",
                    help="extra compile flags for the verify harness "
                         "(e.g. x265 include dirs for sao/filter)")
    args = ap.parse_args()

    dag_mod, dag_fn = args.dag.split(":")
    emit_mod, emit_fn = args.emit.split(":")
    dag = getattr(importlib.import_module(dag_mod), dag_fn)
    emit = getattr(importlib.import_module(emit_mod), emit_fn)
    emit_kwargs = dict(kv.split("=") for kv in
                       args.emit_kwargs.split(",") if kv)

    ops = dag() if not emit_kwargs else dag(**emit_kwargs)
    r = defuse_report(ops)
    if not r["ok"]:
        print("DAG FAIL: %s" % r["issues"][:5])
        return 1
    os.makedirs(args.workdir, exist_ok=True)
    src = os.path.join(args.workdir, "%s.cpp" % args.kernel)
    with open(src, "w") as f:
        f.write(emit(ops, func_name=args.func, **emit_kwargs))
    print("DAG OK: ops=%d stores=%d emitted=%s"
          % (r["ops"], r.get("stores", 0), src))

    m = load_manifest(args.kernel)
    for vq in (int(x) for x in args.vqs.split(",")):
        vl = 16 if vq == 1 else 32
        mm = dict(m)
        mm["vl_bytes"] = vl
        vs = os.path.join(args.workdir, "verify%d.cpp" % vl)
        with open(vs, "w") as f:
            f.write(gen_verify(mm))
        passed, why, counts = measure(
            mm, vs, src, args.workdir, "%s-%d" % (args.kernel, vq),
            range_start_syms=[args.func], range_end_sym=args.func,
            cxx_flags_extra="-O3", qemu_vq=vq,
            verify_cxx_flags=args.verify_flags)
        c = counts or {}
        print("vq=%d passed=%s why=%r fused=%s total=%s"
              % (vq, passed, why, c.get("vector_fused_uop"),
                 c.get("total")))
        if not passed:
            return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
