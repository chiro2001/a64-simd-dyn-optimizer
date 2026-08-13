#!/usr/bin/env python3
"""Kernel manifest loader (docs/16): the contract every pipeline stage reads.

Manifest schema v0.1 (kernels/<name>/manifest.yaml):
  kernel, contract, vl_bytes
  candidate: {symbol, verify_src, trace_driver_src, trace_driver_c}
  reference: {lib, symbol, symbol_mangled}
  baselines: {<name>: {driver, object?, symbol, symbol_mangled?}}
  corpus: {strides, value_range, cases}
  layouts: {<axis>: [<values>]}   # search space axes (cartesian product)
  layout_prune: [{axis, requires}]  # generic axis dependencies (P2)
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


def layout_plans(manifest):
    """Cartesian product filtered by the manifest's generic axis rules.

    Each rule: when `axis` has a non-zero/truthy value, all `requires`
    entries must hold (scalar equality or membership in a list). This
    replaces the per-kernel hardcoded `if combo... continue` chains in
    the search driver (round-0012 P2).
    """
    combos = layout_combos(manifest)
    rules = manifest.get("layout_prune", [])
    out = []
    for c in combos:
        ok = True
        for rule in rules:
            if not c.get(rule["axis"], 0):
                continue
            for ra, rv in rule.get("requires", {}).items():
                val = c.get(ra)
                if isinstance(rv, list):
                    if val not in rv:
                        ok = False
                        break
                elif val != rv:
                    ok = False
                    break
            if not ok:
                break
        if ok:
            out.append(c)
    return out


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
