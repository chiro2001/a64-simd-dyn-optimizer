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
        yield {}
        return
    for vals in product(*(axes[n] for n in names)):
        yield dict(zip(names, vals))


def layout_plans(manifest):
    """Cartesian product filtered by the manifest's generic axis rules.

    Each rule: when `axis` has a non-zero/truthy value, all `requires`
    entries must hold (scalar equality or membership in a list). This
    replaces the per-kernel hardcoded `if combo... continue` chains in
    the search driver (round-0012 P2).

    Prune-aware generation: axes required by other axes are ordered first,
    and each value is checked against already-decided rules before
    descending, so a huge cartesian space is not materialized (dct32's raw
    space is 7.37e8; the generator prunes it to the plans actually usable).
    """
    axes = manifest.get("layouts", {})
    names = list(axes.keys())
    rules = manifest.get("layout_prune", [])
    if not names:
        yield {}
        return

    # order required axes before their dependents (stable topological sort)
    def needed_by(axis):
        return {ra for rule in rules if rule.get("axis") == axis
                for ra in rule.get("requires", {})}

    ordered = []
    remaining = set(names)
    while remaining:
        for n in list(remaining):
            if needed_by(n) - set(ordered) - {n} == set():
                ordered.append(n)
                remaining.discard(n)
                break
        else:
            ordered.extend(sorted(remaining))
            break

    def matches(val, rv):
        if isinstance(rv, list):
            return val in rv
        return val == rv

    def conflicts(c):
        for rule in rules:
            ax = rule["axis"]
            if not c.get(ax, 0):
                continue
            for ra, rv in rule.get("requires", {}).items():
                if ra in c and not matches(c[ra], rv):
                    return True
        return False

    def gen(chosen, idx):
        if idx == len(ordered):
            yield dict(chosen)
            return
        name = ordered[idx]
        for v in axes[name]:
            chosen[name] = v
            if not conflicts(chosen):
                yield from gen(chosen, idx + 1)
        del chosen[name]

    yield from gen({}, 0)


def repo_path(manifest, p):
    if p.startswith("/"):
        return p
    return os.path.join(manifest["_root"], p)


if __name__ == "__main__":
    m = load_manifest(sys.argv[1] if len(sys.argv) > 1 else "dct16")
    print("kernel=%s contract=%s vl=%s" % (m["kernel"], m["contract"],
                                           m.get("vl_bytes")))
    print("layouts=%s" % m.get("layouts"))
    print("layout combos=%d" % sum(1 for _ in layout_combos(m)))
