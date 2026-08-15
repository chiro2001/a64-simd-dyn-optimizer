"""M1 frontend tests: determinism, structural equivalence to the manual
graph, and fail-closed behavior (round-0023)."""

from __future__ import annotations

import collections
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.frontend import (  # noqa: E402
    FrontendError, SA8D8_DSL, SATD8_DSL, parse_dsl)
from ago.cover_neon import build_c_source  # noqa: E402
from ago.graphs.sa8d8_graph import build_sa8d8_graph  # noqa: E402
from ago.graphs.satd8_graph import build_satd8_graph  # noqa: E402


class TestFrontend(unittest.TestCase):
    def test_deterministic(self):
        g1 = parse_dsl(SA8D8_DSL)
        g2 = parse_dsl(SA8D8_DSL)
        self.assertEqual(g1.canonical_hash(), g2.canonical_hash())

    def test_structure_matches_manual(self):
        g = parse_dsl(SA8D8_DSL)
        manual = build_sa8d8_graph()
        self.assertEqual(
            collections.Counter(op.kind for op in g.ops.values()),
            collections.Counter(op.kind for op in manual.ops.values()))
        self.assertEqual(g.outputs, ("satd",))

    def test_fail_closed(self):
        with self.assertRaises(FrontendError):
            parse_dsl("kernel x\ninput a u8 8 64\nb = foo(a)\noutput b\n")
        with self.assertRaises(FrontendError):
            parse_dsl("kernel x\ninput a u8 8 64\n"
                      "d = sub_ext(load(a, 0), load(a, 1))\noutput d\n")

    def test_satd8_deterministic(self):
        g1 = parse_dsl(SATD8_DSL)
        g2 = parse_dsl(SATD8_DSL)
        self.assertEqual(g1.canonical_hash(), g2.canonical_hash())

    def test_satd8_structure_matches_manual(self):
        g = parse_dsl(SATD8_DSL)
        manual = build_satd8_graph()
        # full structural equality (contract text differs by design:
        # DSL program vs canonical contract)
        self.assertEqual(g.inputs, manual.inputs)
        self.assertEqual(g.outputs, manual.outputs)
        self.assertEqual(g.ops, manual.ops)
        self.assertEqual(g.outputs, ("satd",))

    def test_satd8_fail_closed_group(self):
        with self.assertRaises(FrontendError):
            parse_dsl("kernel x\ninput a u8 8 64\n"
                      "d0 = sub_ext(load(a, 0), load(a, 0))\n"
                      "t = hadamard4_v(d2)\noutput t\n")

    def test_satd8_cover(self):
        g = parse_dsl(SATD8_DSL)
        src = build_c_source(g)
        self.assertIn("hadamard_4_v(d, t)", src)
        self.assertIn("vaddlvq_u16(accv)", src)


if __name__ == "__main__":
    unittest.main()
