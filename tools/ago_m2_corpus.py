#!/usr/bin/env python3
"""Build the AGO M2-expanded corpus (round-0024 experiment 1).

Instances: satd8 covers A-E (reduce/block4x4-layout/quadrant-schedule)
and sa8d8 covers A-C (reduce), i.e. 8 region instances, each with its
own cover source. The corpus pipeline:

  emit source -> cross-compile object -> 20k oracle (scripts/
  verify-ago-*.sh) -> final-object features -> frozen manifest ->
  analytical prediction (predict.py + N1/920B cost tables)

Outputs under experiments/ago-m2-expanded/:
  src/<kernel>_<cover>.cpp     generated cover source
  obj/<kernel>_<cover>.o       compiled object
  manifest/<kernel>_<cover>.json  frozen candidate manifest
  features.json                final-object features (deduped)
  predictions.json             analytical predictions
"""

from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.contracts.sa8d8 import Sa8d8Contract  # noqa: E402
from ago.contracts.satd8 import Satd8Contract  # noqa: E402
from ago.contracts.satd8_shapes import (  # noqa: E402
    SATD8X4, SATD8X16, SATD16X8)
from ago.covers_sa8d8 import all_covers as sa8d8_covers  # noqa: E402
from ago.covers_sa8d8 import cover_meta as sa8d8_meta  # noqa: E402
from ago.covers_sa8d8 import emit_cover as emit_sa8d8  # noqa: E402
from ago.covers_satd8 import all_covers as satd8_covers  # noqa: E402
from ago.covers_satd8 import cover_meta as satd8_meta  # noqa: E402
from ago.covers_satd8 import emit_cover as emit_satd8  # noqa: E402
from ago.covers_satd_shapes import (  # noqa: E402
    all_shapes as satd_shapes, emit_cover as emit_satd_shape)
from ago.covers_satd_shapes import cover_meta as satd_shape_meta  # noqa: E402
from ago.manifest import CandidateManifest, write_manifest  # noqa: E402
from ago.objfeatures import extract_features  # noqa: E402
from ago.predict import predict_from_features  # noqa: E402


KERNELS = [
    ("satd8", Satd8Contract(), satd8_covers(), satd8_meta,
     emit_satd8, "dynopt_ago_satd8"),
    ("sa8d8", Sa8d8Contract(), sa8d8_covers(), sa8d8_meta,
     emit_sa8d8, "dynopt_ago_sa8d8"),
]

SHAPE_CONTRACTS = {
    "8x4": ("satd8x4", SATD8X4, "dynopt_ago_satd8x4"),
    "8x16": ("satd8x16", SATD8X16, "dynopt_ago_satd8x16"),
    "16x8": ("satd16x8", SATD16X8, "dynopt_ago_satd16x8"),
}


def main() -> None:
    out = ROOT / "experiments" / "ago-m2-expanded"
    for sub in ("src", "obj", "manifest"):
        (out / sub).mkdir(parents=True, exist_ok=True)
    cxx = os.environ.get("AGO_CXX", "aarch64-linux-gnu-g++")
    compiler_version = subprocess.run(
        [cxx, "--version"], capture_output=True, text=True
    ).stdout.splitlines()[0]

    features_all = {}
    predictions = []
    instances = []
    for kernel, contract, covers, meta_fn, emit, func in KERNELS:
        meta = meta_fn()
        for cover in covers:
            name = "%s_%s" % (kernel, cover)
            src_path = out / "src" / (name + ".cpp")
            obj_path = out / "obj" / (name + ".o")
            src_path.write_text(emit(cover, func))
            subprocess.run(
                [cxx, "-O3", "-DNDEBUG", "-std=c++11",
                 "-march=armv8.2-a+dotprod", "-c", str(src_path),
                 "-o", str(obj_path)],
                check=True)
            feats = extract_features(str(obj_path), str(src_path))
            features_all[name] = feats
            m = CandidateManifest(
                kernel=kernel, cover=cover,
                contract_hash=contract.canonical()[:16],
                region=meta["regions"][cover],
                template_params={"tail": meta["tails"][cover][:24]},
                isa="neon", compiler=cxx, compiler_version=compiler_version,
                cflags="-O3 -DNDEBUG -std=c++11 -march=armv8.2-a+dotprod",
                source_hash=feats["source_sha256"],
                object_hash=feats["object_sha256"],
                verify="20k oracle (pending native run)")
            write_manifest(str(out / "manifest" / (name + ".json")), m)
            instances.append(name)

    shape_meta = satd_shape_meta()
    for shape in satd_shapes():
        kernel_name, contract, sym = SHAPE_CONTRACTS[shape]
        for cover in ("A", "B", "C"):
            name = "%s_%s" % (kernel_name, cover)
            src_path = out / "src" / (name + ".cpp")
            obj_path = out / "obj" / (name + ".o")
            src_path.write_text(emit_satd_shape(shape, cover, sym))
            subprocess.run(
                [cxx, "-O3", "-DNDEBUG", "-std=c++11",
                 "-march=armv8.2-a+dotprod", "-c", str(src_path),
                 "-o", str(obj_path)],
                check=True)
            feats = extract_features(str(obj_path), str(src_path))
            features_all[name] = feats
            m = CandidateManifest(
                kernel=kernel_name, cover=cover,
                contract_hash=contract.canonical()[:16],
                region=shape_meta["regions"]["%s/%s" % (shape, cover)],
                template_params={"shape": shape, "cover": cover},
                isa="neon", compiler=cxx, compiler_version=compiler_version,
                cflags="-O3 -DNDEBUG -std=c++11 -march=armv8.2-a+dotprod",
                source_hash=feats["source_sha256"],
                object_hash=feats["object_sha256"],
                verify="20k oracle (pending native run)")
            write_manifest(str(out / "manifest" / (name + ".json")), m)
            instances.append(name)

    for table_name, table_path in (
            ("n1", ROOT / "benchmarks" / "neon-timing-n1" / "timing-n1.json"),
            ("920b", ROOT / "benchmarks" / "sve-timing-920b" / "timing-920b.json")):
        table = json.loads(table_path.read_text())
        for name in instances:
            kernel, cover = name.split("_", 1)
            if kernel == "sa8d8":
                meta = sa8d8_meta()
            elif kernel == "satd8":
                meta = satd8_meta()
            else:
                shape = {"satd8x4": "8x4", "satd8x16": "8x16",
                         "satd16x8": "16x8"}[kernel]
                meta = shape_meta
                cover = "%s/%s" % (shape, cover)
            p = predict_from_features(meta, cover, table, features_all[name])
            predictions.append({"instance": name, "table": table_name, **p})

    (out / "features.json").write_text(
        json.dumps(features_all, indent=2, sort_keys=True) + "\n")
    (out / "predictions.json").write_text(
        json.dumps(predictions, indent=2, sort_keys=True) + "\n")

    objs = sorted({f["object_sha256"] for f in features_all.values()})
    print("instances:", len(instances))
    print("unique object hashes:", len(objs))
    for name in sorted(features_all):
        f = features_all[name]
        print("%-12s insn=%-4d spill=%-3d calls=%d hash=%s" % (
            name, f["insn_total"], f["spill_reload_heuristic"],
            f["external_calls"], f["object_sha256"][:10]))


if __name__ == "__main__":
    main()
