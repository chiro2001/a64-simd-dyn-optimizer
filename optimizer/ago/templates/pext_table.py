"""PEXT 4-bit table template (AGO M3; known win round-0030).

Rewrite: per-set-bit clz/extract loop (bit-select compression)
-> 4-bit table lookup composition. The table is generated from the
reference bit-select semantics, so the proof obligation is an
exhaustive equality over all 65536 (val16, mask16) pairs plus the
16-case count table.
"""

from __future__ import annotations

from typing import List, Tuple

from ago.rules import (  # noqa: E402
    CoverTemplate, Pattern, ProofObligation, RewriteRule, RuleBinding)


def pext_reference(val: int, mask: int, width: int = 16) -> int:
    """Reference bit-select compression (clz/extract loop semantics)."""
    out = 0
    bit = 0
    for i in range(width):
        if (mask >> i) & 1:
            out |= ((val >> i) & 1) << bit
            bit += 1
    return out


def gen_pext4() -> List[List[int]]:
    return [[pext_reference(s, m, 4) for m in range(16)] for s in range(16)]


def gen_cnt4() -> List[int]:
    return [bin(m).count("1") for m in range(16)]


def pext_rows_c() -> str:
    return "},\n    { ".join(
        ", ".join(str(x) for x in row) for row in gen_pext4())


def cnt_lut_c() -> str:
    return ", ".join(str(x) for x in gen_cnt4())


def emit_pext_nibble() -> str:
    return """\
static const uint8_t DYNOPT_PEXT4[16][16] = {
    { %s }
};
static const uint8_t DYNOPT_CNT4[16] = { %s };

static inline uint16_t pext_nibble(uint16_t val, uint16_t mask,
                                   uint8_t* cnt)
{
    const uint16_t c3 = DYNOPT_CNT4[(mask >> 12) & 15];
    const uint16_t c2 = DYNOPT_CNT4[(mask >> 8) & 15];
    const uint16_t c1 = DYNOPT_CNT4[(mask >> 4) & 15];
    const uint16_t c0 = DYNOPT_CNT4[mask & 15];
    const uint16_t out =
        (uint16_t)DYNOPT_PEXT4[val & 15][mask & 15] |
        (uint16_t)(DYNOPT_PEXT4[(val >> 4) & 15][(mask >> 4) & 15])
            << c0 |
        (uint16_t)(DYNOPT_PEXT4[(val >> 8) & 15][(mask >> 8) & 15])
            << (c0 + c1) |
        (uint16_t)(DYNOPT_PEXT4[(val >> 12) & 15][(mask >> 12) & 15])
            << (c0 + c1 + c2);
    *cnt = (uint8_t)(c3 + c2 + c1 + c0);
    return out;
}
""" % (pext_rows_c(), cnt_lut_c())


def proof_obligations() -> List[ProofObligation]:
    return [
        ProofObligation("pext4-exhaustive", "exhaustive_table",
                        {"width": 16,
                         "domain": "all (v&m, m) distinct pairs = 3^16 "
                                   "= 43046721; pext depends only on v&m"}),
        ProofObligation("cnt4-exhaustive", "exhaustive_table",
                        {"width": 4, "domain": "all 16 masks"}),
    ]


def proof_c_source() -> str:
    """Exhaustive proof harness: table vs reference bit-select."""
    return (
        "#include <stdint.h>\n#include <stdio.h>\n" +
        emit_pext_nibble() + """
static inline int pext_ref16(uint16_t val, uint16_t mask)
{
    int out = 0, bit = 0;
    for (int i = 0; i < 16; i++)
        if ((mask >> i) & 1)
            out |= ((val >> i) & 1) << bit++;
    return out;
}
int main(void)
{
    int bad = 0;
    // Exhaustive over all distinct inputs: pext(v,m) depends only on
    // v&m, so iterate every mask m and every submask s of m (3^16
    // pairs). Reference and table must agree on all of them.
    long long total = 0;
    for (int m = 0; m < 65536 && bad < 5; m++)
    {
        uint8_t cnt = 0;
        (void)pext_nibble(0, (uint16_t)m, &cnt);
        if (cnt != (uint8_t)__builtin_popcount((unsigned)m))
            { printf("cnt bad m=%d cnt=%d\\n", m, cnt); bad++; }
        int s = m;
        do {
            uint8_t c = 0;
            const uint16_t got =
                pext_nibble((uint16_t)s, (uint16_t)m, &c);
            if (got != (uint16_t)pext_ref16((uint16_t)s, (uint16_t)m))
                { printf("pext bad s=%d m=%d got=%d\\n", s, m, got);
                  bad++; break; }
            if (c != cnt)
                { printf("cnt mismatch s=%d m=%d\\n", s, m); bad++; break; }
            total++;
            s = (s - 1) & m;
        } while (s != m);
    }
    printf("pext4 exhaustive total=%lld bad=%d\\n", total, bad);
    return bad != 0;
}
""")


class PextNibblePattern(Pattern):
    name = "pext16"

    def match(self, region):
        # region: (val:u16, mask:u16) symbolic pair
        if isinstance(region, tuple) and len(region) == 2:
            return RuleBinding({"val": region[0], "mask": region[1]})
        return None


class PextNibbleRewrite(RewriteRule):
    id = "pext4-table"
    phase = "table-ize"
    effect = "bit-select compression -> 4-bit LUT composition"
    measure = "instruction count per compressed bit (L1 table) "

    def apply(self, region, bindings):
        return region, proof_obligations()


class PextNibbleTemplate(CoverTemplate):
    id = "pext4-neon"
    target = "neon"

    def emit(self, region, bindings, target=""):
        return emit_pext_nibble(), proof_obligations()
