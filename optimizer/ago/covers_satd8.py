"""Bounded NEON cover search for SATD 8x8 (AGO M2).

All covers share the upstream prefix (load_diff_u8x8x8 ->
hadamard_4_v x2 -> hadamard_abs_4_h x2 -> vmaxq_u16 x4) and differ only
in the sum/reduce tail:

  A upstream : o0=sum0+sum1; o1=sum2+sum3; accv=o0+o1; uaddlv
  B balanced : acc0=sum0+sum2; acc1=sum1+sum3; accv=acc0+acc1; uaddlv
  C dual-red : o0=sum0+sum1; o1=sum2+sum3; uaddlv(o0)+uaddlv(o1)
  D block4x4 : per-4x4-block serial hadamard_4x4 + uaddlv, scalar sum
               (genuinely different layout/schedule: block-serial vs
               quad-parallel)
  E quad-ser : quadrant-serial schedule (finish quad A entirely, then
               quad B) -- same op multiset, different dependency order

All are semantically equal (per-lane u16 adds, lane sums far below
overflow) and each must pass the 20k oracle gate. The tail is the
region where instruction selection can vary without changing the
dataflow graph; this is the M2 bounded cover space.

Prediction uses per-op cost tables (N1 timing-n1.json; 920B table where
available) with throughput-cycle sums as the primary rank, latency sums
as tie-break. Proxies: vaddq_u16 -> add_u16; vmaxq_u16 -> maxv_u8;
uaddlvq_u16 -> paddl_u16.
"""

from __future__ import annotations

from typing import Dict, List

from ago.cover_neon import NEON_HELPERS


_PREFIX = """\
extern "C" int %s(const uint8_t* pix1, intptr_t stride1,
                  const uint8_t* pix2, intptr_t stride2)
{
    int16x8_t d[8];
    d[0] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 0 * stride1),
                                          vld1_u8(pix2 + 0 * stride2)));
    d[1] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 1 * stride1),
                                          vld1_u8(pix2 + 1 * stride2)));
    d[2] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 2 * stride1),
                                          vld1_u8(pix2 + 2 * stride2)));
    d[3] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 3 * stride1),
                                          vld1_u8(pix2 + 3 * stride2)));
    d[4] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 4 * stride1),
                                          vld1_u8(pix2 + 4 * stride2)));
    d[5] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 5 * stride1),
                                          vld1_u8(pix2 + 5 * stride2)));
    d[6] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 6 * stride1),
                                          vld1_u8(pix2 + 6 * stride2)));
    d[7] = vreinterpretq_s16_u16(vsubl_u8(vld1_u8(pix1 + 7 * stride1),
                                          vld1_u8(pix2 + 7 * stride2)));
"""

_QUAD = """\
    int16x8_t t[8];
    hadamard_4_v(d, t);
    hadamard_4_v(d + 4, t + 4);
    hadamard_abs_4_h(t, d);
    hadamard_abs_4_h(t + 4, d + 4);
    uint16x8_t sum0 = vmaxq_u16(vreinterpretq_u16_s16(d[0]),
                                vreinterpretq_u16_s16(d[1]));
    uint16x8_t sum1 = vmaxq_u16(vreinterpretq_u16_s16(d[2]),
                                vreinterpretq_u16_s16(d[3]));
    uint16x8_t sum2 = vmaxq_u16(vreinterpretq_u16_s16(d[4]),
                                vreinterpretq_u16_s16(d[5]));
    uint16x8_t sum3 = vmaxq_u16(vreinterpretq_u16_s16(d[6]),
                                vreinterpretq_u16_s16(d[7]));
"""

_TAILS = {
    "A": """\
    uint16x8_t o0 = vaddq_u16(sum0, sum1);
    uint16x8_t o1 = vaddq_u16(sum2, sum3);
    uint16x8_t accv = vaddq_u16(o0, o1);
    return (int)vaddlvq_u16(accv);
}""",
    "B": """\
    uint16x8_t acc0 = vaddq_u16(sum0, sum2);
    uint16x8_t acc1 = vaddq_u16(sum1, sum3);
    uint16x8_t accv = vaddq_u16(acc0, acc1);
    return (int)vaddlvq_u16(accv);
}""",
    "C": """\
    uint16x8_t o0 = vaddq_u16(sum0, sum1);
    uint16x8_t o1 = vaddq_u16(sum2, sum3);
    return (int)(vaddlvq_u16(o0) + vaddlvq_u16(o1));
}""",
    "D": """\
    int32_t r = 0;
    for (int q = 0; q < 2; q++) {
        const int16x8_t* rows = d + 4 * q;
        int16x8_t a0 = vcombine_s16(vget_low_s16(rows[0]),
                                    vget_low_s16(rows[2]));
        int16x8_t a1 = vnegq_s16(vcombine_s16(vget_low_s16(rows[1]),
                                              vget_low_s16(rows[3])));
        r += hadamard_4x4(a0, a1);
        a0 = vcombine_s16(vget_high_s16(rows[0]),
                          vget_high_s16(rows[2]));
        a1 = vnegq_s16(vcombine_s16(vget_high_s16(rows[1]),
                                    vget_high_s16(rows[3])));
        r += hadamard_4x4(a0, a1);
    }
    return r;
}""",
    "E": """\
    int16x8_t ta[4], tb[4];
    hadamard_4_v(d, ta);
    hadamard_abs_4_h(ta, d);
    uint16x8_t sa0 = vmaxq_u16(vreinterpretq_u16_s16(d[0]),
                               vreinterpretq_u16_s16(d[1]));
    uint16x8_t sa1 = vmaxq_u16(vreinterpretq_u16_s16(d[2]),
                               vreinterpretq_u16_s16(d[3]));
    uint16x8_t o0 = vaddq_u16(sa0, sa1);
    hadamard_4_v(d + 4, tb);
    hadamard_abs_4_h(tb, d + 4);
    uint16x8_t sb0 = vmaxq_u16(vreinterpretq_u16_s16(d[4]),
                               vreinterpretq_u16_s16(d[5]));
    uint16x8_t sb1 = vmaxq_u16(vreinterpretq_u16_s16(d[6]),
                               vreinterpretq_u16_s16(d[7]));
    uint16x8_t o1 = vaddq_u16(sb0, sb1);
    uint16x8_t accv = vaddq_u16(o0, o1);
    return (int)vaddlvq_u16(accv);
}""",
}

# tail op multiset per cover (u16x8 adds, uaddlv reductions, scalar add)
_TAIL_OPS = {
    "A": ["add_u16", "add_u16", "add_u16", "paddl_u16"],
    "B": ["add_u16", "add_u16", "add_u16", "paddl_u16"],
    "C": ["add_u16", "add_u16", "paddl_u16", "paddl_u16", "add_u8"],
    "D": ["paddl_u16", "paddl_u16", "paddl_u16", "paddl_u16",
          "add_u8", "add_u8", "add_u8"],
    "E": ["add_u16", "add_u16", "add_u16", "paddl_u16"],
}

# per-cover critical-path op-class chains (source-level dependency
# depth; proxies: sub_u16->sub_u8, trn->add_u16, uaddlv->paddl_u16)
_CP_CHAINS = {
    "A": ["ld1_u8", "addl_u8", "add_u16", "add_u16",
          "sub_u8", "trn", "abs_s16", "trn", "maxv_u8",
          "add_u16", "add_u16", "add_u16", "paddl_u16"],
    "B": ["ld1_u8", "addl_u8", "add_u16", "add_u16",
          "sub_u8", "trn", "abs_s16", "trn", "maxv_u8",
          "add_u16", "add_u16", "add_u16", "paddl_u16"],
    "C": ["ld1_u8", "addl_u8", "add_u16", "add_u16",
          "sub_u8", "trn", "abs_s16", "trn", "maxv_u8",
          "add_u16", "add_u16", "paddl_u16", "add_u8"],
    "D": ["ld1_u8", "addl_u8", "add_u16", "add_u16",
          "sub_u8", "trn", "abs_s16", "trn", "maxv_u8",
          "paddl_u16", "add_u8", "add_u8", "add_u8"],
    "E": ["ld1_u8", "addl_u8", "add_u16", "add_u16",
          "sub_u8", "trn", "abs_s16", "trn", "maxv_u8",
          "add_u16", "add_u16", "add_u16", "paddl_u16"],
}

_REGION = {
    "A": "satd8/reduce",
    "B": "satd8/reduce",
    "C": "satd8/reduce",
    "D": "satd8/block4x4-layout",
    "E": "satd8/quadrant-schedule",
}


def emit_cover(name: str, func: str) -> str:
    if name not in _TAILS:
        raise ValueError("unknown cover %r" % name)
    body = _QUAD + _TAILS[name] if name in ("A", "B", "C") else _TAILS[name]
    return ("// Generated by optimizer/ago/covers_satd8.py -- do not edit.\n"
            "#include <arm_neon.h>\n#include <stdint.h>\n" +
            NEON_HELPERS + "\n" + _PREFIX % func + "\n" + body + "\n")


def predict_cost(name: str, table: Dict) -> Dict:
    """Static cost prediction from a per-instruction cost table.

    Primary rank: sum of throughput cycles per op; tie-break: sum of
    latency cycles. Missing keys get the table's "empty" cost so a
    missing entry cannot silently zero a whole op class.
    """
    empty = table.get("empty", {"latency_cyc": 1.0,
                                "throughput_cyc_per_op": 1.0})
    tput_sum = lat_sum = 0.0
    for op in _TAIL_OPS[name]:
        c = table.get(op, empty)
        tput_sum += float(c.get("throughput_cyc_per_op") or 0.0)
        lat_sum += float(c.get("latency_cyc") or 0.0)
    return {"cover": name, "tput_sum": round(tput_sum, 3),
            "lat_sum": round(lat_sum, 3)}


def all_covers() -> List[str]:
    return sorted(_TAILS)


def cover_meta() -> Dict:
    return {"kernel": "satd8", "tails": _TAILS, "tail_ops": _TAIL_OPS,
            "cp_chains": _CP_CHAINS, "regions": _REGION}
