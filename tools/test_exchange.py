"""Unit tests for tools/exchange.py (docs/87 step 8)."""

import json
import unittest

import exchange as ex


class ExchangeTest(unittest.TestCase):
    def test_examples_valid(self):
        fns = {"verdict.json": ex.example_verdict,
               "bone-cost.json": ex.example_cost,
               "measure-request.json": ex.example_request}
        for fn, maker in fns.items():
            payload = maker()
            ok, errs = ex.validate(payload)
            self.assertTrue(ok, "%s: %s" % (fn, errs))

    def test_rejects_structure(self):
        ok, errs = ex.validate({"schema": "ago/exchange/verdict"})
        self.assertFalse(ok)
        self.assertTrue(any("version" in e for e in errs))

    def test_verdict_bad_pairwise_label(self):
        p = ex.example_verdict()
        p["pairwise"]["dct16"] = ["upstream", "ZX"]
        ok, errs = ex.validate(p)
        self.assertFalse(ok)
        self.assertTrue(any("unknown labels" in e for e in errs))

    def test_request_measure_policy(self):
        p = ex.example_request(["dct32"])
        ok, errs = ex.validate(p)
        self.assertTrue(ok, errs)
        p["requests"][0]["measure"] = "hack"
        self.assertFalse(ex.validate(p)[0])

    def test_cost_negatives(self):
        p = ex.example_cost()
        p["rows"][0]["latency"] = -1
        self.assertFalse(ex.validate(p)[0])

    def _registry(self):
        import cover_registry as cr
        import os
        reg = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..",
                           "release", "qemu", "manifest.json")
        return cr.CoverRegistry.load(reg)

    def test_ingest_verdict_rows(self):
        v = ex.example_verdict()
        v["machine"]["tag"] = "950"
        v["date"] = "2026-08-20"
        rows, p_after, _ = ex.ingest_verdict(v, self._registry(),
                                             request=None)
        self.assertEqual(len(rows), len(v.get("kernels", [])))
        self.assertTrue(rows)
        self.assertEqual(rows[0]["machine"], "950")
        self.assertIn("bit_exact", rows[0])
        self.assertIn("dct16", p_after)

    def test_refresh_request_drops_satisfied_kernels(self):
        req = ex.example_request(["dct16", "dct32"])
        v = ex.example_verdict()
        v["kernels"] = [{"kernel": "dct16", "cover": 0,
                          "kind": "upstream", "arm_ns": 2400,
                          "upstream_ns": 2400}]
        v["gates"]["video_md5"]["passed"] = True
        after = ex.refresh_request(req, v)
        ks = [r["kernel"] for r in after["requests"]]
        self.assertNotIn("dct16", ks)
        self.assertIn("dct32", ks)
        priorities = [r["priority"] for r in after["requests"]]
        self.assertEqual(priorities, sorted(priorities))

    def test_ingest_preserves_unknown_kernels_request(self):
        req = ex.example_request(["dct16"])
        v = ex.example_verdict()
        v["kernels"] = []
        v["gates"]["video_md5"]["passed"] = False
        after = ex.refresh_request(req, v)
        self.assertTrue(any(r["kernel"] == "dct16"
                            for r in after["requests"]))


if __name__ == "__main__":
    unittest.main()
