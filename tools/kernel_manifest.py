#!/usr/bin/env python3
"""Kernel manifest loader (docs/16): the contract every pipeline stage reads.

Manifest schema v0.1 (kernels/<name>/manifest.yaml):
  kernel, contract, vl_bytes
  candidate: {symbol, verify_src, trace_driver_src, trace_driver_c}
  reference: {lib, symbol, symbol_mangled}
  baselines: {<name>: {driver, object?, symbol, symbol_mangled?}}
  corpus: {strides, value_range, cases}
  layouts: {<axis>: [<values>]}   # search space axes (cartesian product)
"""

import os
import sys

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def load_manifest(kernel="dct16"):
    path = os.path.join(ROOT, "kernels", kernel, "manifest.yaml")
    if not os.path.exists(path):
        raise FileNotFoundError("kernel manifest not found: %s" % path)
    if yaml is None:
        raise RuntimeError("pyyaml is required to load kernel manifests")
    with open(path) as f:
        m = yaml.safe_load(f)
    m["_path"] = path
    m["_root"] = ROOT
    return m


def layout_combos(manifest):
    """Cartesian product of the manifest's layout axes."""
    from itertools import product
    axes = manifest.get("layouts", {})
    names = list(axes.keys())
    if not names:
        return [{}]
    combos = []
    for vals in product(*(axes[n] for n in names)):
        combos.append(dict(zip(names, vals)))
    return combos


def repo_path(manifest, p):
    if p.startswith("/"):
        return p
    return os.path.join(manifest["_root"], p)


if __name__ == "__main__":
    m = load_manifest(sys.argv[1] if len(sys.argv) > 1 else "dct16")
    print("kernel=%s contract=%s vl=%s" % (m["kernel"], m["contract"],
                                           m.get("vl_bytes")))
    print("layouts=%s" % m.get("layouts"))
    print("layout combos=%d" % len(layout_combos(m)))
