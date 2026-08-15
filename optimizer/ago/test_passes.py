"""M1 pass pipeline tests: idempotence, determinism, budget (round-0023)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.frontend import SA8D8_DSL, parse_dsl  # noqa: E402
from ago.ir import Op  # noqa: E402
from ago.passes import PassError, Pipeline, RemoveUnused, default_pipeline  # noqa: E402


class TestPasses(unittest.TestCase):
    def test_pipeline_idempotent(self):
        g = parse_dsl(SA8D8_DSL)
        pipe = default_pipeline()
        g1 = pipe.run(g)
        g2 = pipe.run(g1)
        self.assertEqual(g1.canonical_hash(), g2.canonical_hash())

    def test_remove_unused(self):
        g = parse_dsl(SA8D8_DSL)
        # add an unreachable node
        g.ops["junk"] = Op("add", ("o0", "o1"), "junk")
        before = len(g.ops)
        p = RemoveUnused()
        g2 = p.apply(g)
        self.assertNotIn("junk", g2.ops)
        self.assertEqual(len(g2.ops), before - 1)

    def test_budget_and_cycle(self):
        g = parse_dsl(SA8D8_DSL)
        with self.assertRaises(PassError):
            Pipeline([RemoveUnused()]).run(g, budget=1, max_nodes=0)


if __name__ == "__main__":
    unittest.main()
