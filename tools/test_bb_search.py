#!/usr/bin/env python3
"""Unit tests for the bounded branch-and-bound prototype."""

import random
import unittest

from bb_search import OPS, bb_search, exhaustive, lower_bound, merge  # noqa


class TestBBSearch(unittest.TestCase):
    def test_deterministic_instance(self):
        ops = {"pair": (2, 1), "quad": (4, 2), "oct": (8, 3)}
        for n in (8, 12, 16, 20):
            ex, nodes_ex = exhaustive(n, ops)
            bb, nodes_bb, pruned = bb_search(n, ops)
            self.assertEqual(ex, bb, "optimality mismatch at n=%d" % n)
            self.assertLessEqual(nodes_bb, nodes_ex)

    def test_random_instances_no_misprune(self):
        rng = random.Random(1234)
        for _ in range(40):
            n = rng.randint(8, 20)
            ops = {
                name: (arity, rng.randint(1, 3))
                for name, (arity, _) in OPS.items()
            }
            ex, _ = exhaustive(n, ops)
            bb, nodes_bb, pruned = bb_search(n, ops)
            self.assertEqual(ex, bb,
                             "mispruned optimum n=%d ops=%s" % (n, ops))
            self.assertGreaterEqual(nodes_bb, 1)

    def test_lower_bound_admissible(self):
        # For random states the bound must never exceed the true optimal
        # remaining cost (otherwise pruning could drop the optimum).
        rng = random.Random(99)
        ops = {"pair": (2, 1), "quad": (4, 2), "oct": (8, 3)}
        for _ in range(200):
            m = rng.randint(2, 10)
            # Compare the bound for an m-leaf state against the
            # exhaustive optimum for that state count.
            ex, _ = exhaustive(m, ops)
            self.assertLessEqual(lower_bound((1,) * m,
                                             list(ops.values())),
                                 ex)

    def test_merge_canonical(self):
        self.assertEqual(merge((3, 2, 1), 2), (5, 1))
        self.assertEqual(merge((5, 4, 3, 2), 4), (14,))


if __name__ == "__main__":
    unittest.main()
