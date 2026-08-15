"""M3 template tests: PEXT table generation and rule protocol."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "optimizer"))

from ago.rules import CoverTemplate, Pattern, ProofObligation, RewriteRule  # noqa: E402
from ago.templates.pext_table import (  # noqa: E402
    emit_pext_nibble, gen_cnt4, gen_pext4, pext_reference, proof_c_source,
    proof_obligations)
from ago.templates.dfa_table import (  # noqa: E402
    dfa_step, emit_dfa, gen_dfa_tables, phase_base, proof_c_source as
    dfa_proof_c_source, proof_obligations as dfa_proof_obligations)


class TestPextTable(unittest.TestCase):
    def test_table_matches_reference(self):
        table = gen_pext4()
        cnt = gen_cnt4()
        for s in range(16):
            for m in range(16):
                self.assertEqual(table[s][m], pext_reference(s, m, 4))
                self.assertEqual(cnt[m], bin(m).count("1"))

    def test_proof_source_exhaustive_domain(self):
        src = proof_c_source()
        self.assertIn("3^16", src)  # exhaustive domain comment
        self.assertIn("total", src)

    def test_emit_contains_tables(self):
        src = emit_pext_nibble()
        self.assertIn("DYNOPT_PEXT4", src)
        self.assertIn("DYNOPT_CNT4", src)
        self.assertIn("pext_nibble", src)

    def test_obligations(self):
        obs = proof_obligations()
        self.assertEqual(len(obs), 2)
        self.assertTrue(all(isinstance(o, ProofObligation)
                            for o in obs))


class TestRuleProtocol(unittest.TestCase):
    def test_interfaces_exist(self):
        # protocol classes are instantiable bases with fail-closed methods
        with self.assertRaises(NotImplementedError):
            Pattern().match(None)
        with self.assertRaises(NotImplementedError):
            RewriteRule().apply(None, None)
        with self.assertRaises(NotImplementedError):
            CoverTemplate().emit(None, None)


class TestDfaTable(unittest.TestCase):
    def test_table_matches_reference(self):
        add_tbl, nxt_tbl = gen_dfa_tables()
        i = 0
        for g in range(5):
            for phase in range(3):
                for v in range(256):
                    add, ng = dfa_step(g, phase_base(phase), v)
                    self.assertEqual(add_tbl[i], add)
                    self.assertEqual(nxt_tbl[i], ng)
                    i += 1
        self.assertEqual(i, 5 * 3 * 256)

    def test_emit_contains_tables(self):
        src = emit_dfa("dynopt_cost_coeff_remain_sve2")
        self.assertIn("DYNOPT_REM_ADD", src)
        self.assertIn("DYNOPT_REM_NEXT", src)
        self.assertIn("dynopt_cost_coeff_remain_sve2", src)

    def test_proof_and_obligations(self):
        self.assertIn("3840", dfa_proof_obligations()[0].to_json())
        src = dfa_proof_c_source()
        self.assertIn("dfa exhaustive bad=%d", src)


if __name__ == "__main__":
    unittest.main()
