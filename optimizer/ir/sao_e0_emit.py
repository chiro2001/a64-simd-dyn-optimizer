"""SAO stats E0 64x1 DAG -> pure-NEON ACLE emitter."""

from __future__ import annotations

from typing import Dict, List

from op_ir import Op


def emit_sao_e0_64(ops, func_name: str = "dynopt_sao_stats_e0_64_sve2",
                   target: str = "neon") -> str:
    body: List[str] = []
    count_vars: Dict[int, str] = {}
    stats_vars: Dict[int, str] = {}
    lo_stats: Dict[str, str] = {}
    nsl = "nsl"
    hist_c16 = None

    def v(n):
        return n

    for op in ops:
        kind = op.kind
        attrs = op.attrs
        out = op.out
        ins = list(op.inputs)
        if kind == "dup16":
            i = len(count_vars)
            count_vars[i] = out
            body.append("    int16x8_t %s = vdupq_n_s16(%d);"
                        % (out, attrs["value"]))
        elif kind == "dup32":
            i = len(stats_vars)
            stats_vars[i] = out
            body.append("    int32x4_t %s = vdupq_n_s32(%d);"
                        % (out, attrs["value"]))
        elif kind == "dup8":
            body.append("    uint8x16_t %s = vdupq_n_u8(%d);"
                        % (out, attrs["value"]))
        elif kind == "dup64":
            body.append("    int64x2_t %s = vdupq_n_s64(%d);"
                        % (out, attrs["value"]))
        elif kind == "edge":
            b = attrs["block"]
            body.append("    int8x16_t sr_%d = sign16n(rec + %d, rec + %d + 1);"
                        % (b, b * 16, b * 16))
            body.append("    int8x16_t ns_%d = vextq_s8(%s, sr_%d, 15);"
                        % (b, nsl, b))
            body.append("    int8x16_t %s = vsubq_s8(sr_%d, ns_%d);"
                        % (out, b, b))
            nsl = "sr_%d" % b
        elif kind == "load_diff16":
            b = attrs["block"]
            off = 0 if attrs["half"] == "lo" else 8
            body.append("    int16x8_t %s = vld1q_s16(diff + %d + %d);"
                        % (out, b * 16, off))
        elif kind == "vceq":
            body.append("    int8x16_t %s = vreinterpretq_s8_u8(vceqq_s8("
                        "%s, vdupq_n_s8(%d)));"
                        % (out, ins[0], attrs["value"]))
        elif kind == "vpadal_s8":
            body.append("    int16x8_t %s = vpadalq_s8(%s, %s);"
                        % (out, ins[0], ins[1]))
        elif kind == "vzip1_s8":
            body.append("    int16x8_t %s = vreinterpretq_s16_s8("
                        "vzip1q_s8(%s, %s));" % (out, ins[0], ins[1]))
        elif kind == "vzip2_s8":
            body.append("    int16x8_t %s = vreinterpretq_s16_s8("
                        "vzip2q_s8(%s, %s));" % (out, ins[0], ins[1]))
        elif kind == "dot_stats" and attrs.get("target") != "sve":
            if attrs["half"] == "lo":
                body.append("    int16x8_t %s = vmulq_s16(%s, %s);"
                            % (out, ins[0], ins[1]))
                lo_stats[out] = out
            else:
                body.append("    int16x8_t %s = vmlaq_s16(%s, %s, %s);"
                            % (out, ins[1], ins[0], ins[2]))
        elif kind == "vpadal_s16":
            body.append("    int32x4_t %s = vpadalq_s16(%s, %s);"
                        % (out, ins[0], ins[2]))
        elif kind == "histseg_count":
            body.append("    uint8x16_t %s = vaddq_u8(%s, svget_neonq_u8("
                        "svhistseg_s8(svidx, svset_neonq_s8("
                        "svundef_s8(), %s))));" % (out, ins[0], ins[1]))
        elif kind == "dot_stats" and attrs.get("target") == "sve":
            body.append("    int64x2_t %s = sdotq_s16(%s, %s, %s);"
                        % (out, ins[0], ins[1], ins[2]))
        elif kind == "vpadd_s16":
            body.append("    int16x8_t %s = vpaddq_s16(%s, %s);"
                        % (out, ins[0], ins[1]))
        elif kind == "vpaddl_s16":
            body.append("    int32x4_t %s = vpaddlq_s16(%s);"
                        % (out, ins[0]))
        elif kind == "load32":
            body.append("    int32x4_t %s = vld1q_s32(%s);"
                        % (out, attrs["base"]))
        elif kind == "store_sub32":
            body.append("    vst1q_s32(%s, vsubq_s32(%s, %s));"
                        % (attrs["base"], ins[0], ins[1]))
        elif kind == "vaddv_s16":
            body.append("    int %s = (int)vaddvq_s16(%s);" % (out, ins[0]))
        elif kind == "vaddv_s32":
            body.append("    int %s = (int)vaddvq_s32(%s);" % (out, ins[0]))
        elif kind == "scalar_sub":
            body.append("    %s[%d] -= %s;"
                        % (attrs["base"], attrs["index"], ins[0]))
        elif kind == "hist_count_reduce":
            body.append("    uint16x8_t hc = vaddw_u8(vdupq_n_u16(0), "
                        "vget_low_u8(%s));" % ins[0])
            body.append("    int32x4_t %s = vmovl_s16("
                        "vget_low_s16(vreinterpretq_s16_u16(hc)));"
                        % out)
            hist_c16 = "hc"
        elif kind == "store_add32":
            body.append("    vst1q_s32(%s, vaddq_s32(%s, %s));"
                        % (attrs["base"], ins[0], ins[1]))
        elif kind == "scalar_add_lane":
            body.append("    %s[%d] += vgetq_lane_u16(%s, 4);"
                        % (attrs["base"], attrs["index"], hist_c16))
        elif kind == "vmovn_combine":
            body.append("    int32x4_t %s = vcombine_s32("
                        "vmovn_s64(%s), vmovn_s64(%s));"
                        % (out, ins[0], ins[1]))
        elif kind == "vaddv_s64":
            body.append("    int %s = (int)vaddvq_s64(%s);" % (out, ins[0]))
        elif kind == "vpadd_s32":
            body.append("    int32x4_t %s = vpaddq_s32(%s, %s);"
                        % (out, ins[0], ins[1]))
        else:
            raise ValueError("sao emit: %s" % kind)

    if target == "sve2":
        includes = ("#include <arm_neon.h>\n#include <arm_sve.h>\n"
                    "#include <arm_neon_sve_bridge.h>\n"
                    "#include <stdint.h>\n#include <stddef.h>\n")
        helpers = """\
static inline int64x2_t sdotq_s16(int64x2_t acc, int16x8_t x,
                                  int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(svset_neonq_s64(svundef_s64(), acc),
                                     svset_neonq_s16(svundef_s16(), x),
                                     svset_neonq_s16(svundef_s16(), y)));
}
"""
        prologue = ("    const int8x16_t svidx_tbl = { 0, -2, -1, 1, 2, "
                    "-3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3 };\n"
                    "    svint8_t svidx = svset_neonq_s8(svundef_s8(), "
                    "svidx_tbl);\n")
    else:
        includes = ("#include <arm_neon.h>\n#include <stdint.h>\n"
                    "#include <stddef.h>\n")
        helpers = ""
        prologue = ""
    return """\
// Generated by optimizer/ir/sao_e0_emit.py -- do not edit by hand.
// SAO stats E0 64x1 from width-independent DAG (target=%s).
%s
%s

static inline int8x16_t sign16n(const uint8_t* a, const uint8_t* b)
{
    uint8x16_t s0 = vld1q_u8(a);
    uint8x16_t s1 = vld1q_u8(b);
    return vsubq_s8(vreinterpretq_s8_u8(vcgtq_u8(s1, s0)),
                    vreinterpretq_s8_u8(vcgtq_u8(s0, s1)));
}

extern "C" void %s(const int16_t* diff, const uint8_t* rec, intptr_t stride,
                   int32_t* stats, int32_t* count)
{
    (void)stride;
%s
    int8x16_t nsl = vdupq_n_s8(
        (int)rec[-1] - (int)rec[0] < 0 ? -1 : ((int)rec[-1] - (int)rec[0] > 0
                                               ? 1 : 0));
%s
}
""" % (target, includes, helpers, func_name, prologue, "\n".join(body))
