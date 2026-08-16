"""dct16 pure-SVE emitter (source-translation of the neon8 fused8 code).

Takes the DAG-generated neon8 source (NEON + SVE bridge) and rewrites it
to SVE-only ACLE using the psv_* primitive set
(optimizer/ir/pure_sve_helpers.py). Pure-SVE mode is VL=128-fixed:
compile with -msve-vector-bits=128 and guard svcntb()==16 at runtime.
"""

from __future__ import annotations

from dct16_op_emit import emit_acle
from pure_sve_helpers import PURE_SVE_HELPERS


def _split_args(s: str):
    out, depth, cur = [], 0, []
    for c in s:
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
        if c == "," and depth == 0:
            out.append("".join(cur).strip())
            cur = []
        else:
            cur.append(c)
    out.append("".join(cur).strip())
    return out


def _replace_call(text: str, name: str, repl):
    out = []
    i = 0
    while i < len(text):
        j = text.find(name + "(", i)
        if j < 0:
            out.append(text[i:])
            break
        out.append(text[i:j])
        k = j + len(name) + 1
        depth = 1
        while depth:
            c = text[k]
            if c == "(":
                depth += 1
            elif c == ")":
                depth -= 1
            k += 1
        inner = text[j + len(name) + 1:k - 1]
        out.append(repl(inner))
        i = k
    return "".join(out)


def _body_subs(body: str) -> str:
    b = body
    for t in ("int16x8_t", "int16x4_t", "int32x4_t", "int64x2_t"):
        b = b.replace(t, {"int16x8_t": "svint16_t",
                          "int16x4_t": "svint16_t",
                          "int32x4_t": "svint32_t",
                          "int64x2_t": "svint64_t"}[t])

    def args1(fmt):
        return lambda s: fmt % tuple(_split_args(s))

    b = _replace_call(b, "vld1q_s16", lambda s: "psv_load8(%s)" % s)
    b = _replace_call(b, "vld1q_s32", lambda s: "psv_load4_s32(%s)" % s)
    b = _replace_call(b, "vst1_s16", args1("psv_store4_s16(%s, %s)"))
    b = _replace_call(b, "vget_low_s16", lambda s: "psv_get_lo4_s16(%s)" % s)
    b = _replace_call(b, "vget_high_s16", lambda s: "psv_get_hi4_s16(%s)" % s)
    b = _replace_call(b, "vaddl_s16", args1("psv_saddl_s16(%s, %s)"))
    b = _replace_call(b, "vaddq_s32", args1("svadd_s32_x(psv_pg4_s32(), %s, %s)"))
    b = _replace_call(b, "vsubq_s32", args1("svsub_s32_x(psv_pg4_s32(), %s, %s)"))
    b = _replace_call(b, "vaddq_s16", args1("svadd_s16_x(psv_pg8_s16(), %s, %s)"))
    b = _replace_call(b, "vsubq_s16", args1("svsub_s16_x(psv_pg8_s16(), %s, %s)"))
    b = _replace_call(b, "vmovn_s32", lambda s: "psv_vmovn_s32(%s)" % s)
    b = _replace_call(b, "vmovn_s64", lambda s: "psv_vmovn_s64(%s)" % s)
    b = _replace_call(b, "vcombine_s16", args1("psv_combine4_s16(%s, %s)"))
    b = _replace_call(b, "vcombine_s32", args1("psv_combine4_s32(%s, %s)"))
    b = _replace_call(b, "vdupq_n_s64", lambda s: "psv_zero_s64()"
                      if _split_args(s)[0].strip() == "0"
                      else "svdup_s64_x(psv_pg2_s64(), %s)" % s)
    b = _replace_call(b, "vmulq_s32", args1("svmul_s32_x(psv_pg4_s32(), %s, %s)"))
    b = _replace_call(b, "vpaddq_s32", args1("psv_addp4_s32(%s, %s)"))
    b = _replace_call(b, "vrev64q_s32", lambda s: "psv_rev64_s32(%s)" % s)
    b = _replace_call(b, "vzip1q_s64", args1("svzip1_s64(%s, %s)"))
    b = _replace_call(b, "vzip2q_s64", args1("svzip2_s64(%s, %s)"))
    b = _replace_call(b, "vrshrn_n_s32", lambda s: "psv_rshrn_s32<%s>(%s)"
                      % (_split_args(s)[1], _split_args(s)[0]))
    b = _replace_call(b, "vreinterpretq_s64_s32",
                      lambda s: "svreinterpret_s64_s32(%s)" % s)
    b = _replace_call(b, "vreinterpretq_s32_s64",
                      lambda s: "svreinterpret_s32_s64(%s)" % s)
    b = _replace_call(b, "rev16", lambda s: "psv_rev16(%s)" % s)
    b = _replace_call(b, "rev32", lambda s: "psv_rev32_s32(%s)" % s)
    b = _replace_call(b, "sdotq_s16", args1("psv_sdot(%s, %s, %s)"))
    return b


_NEON_TOKENS = ("vqtbx1q", "svset_neonq", "svget_neonq", "vld1q_u8",
                "vreinterpretq", "vaddl_", "vget_", "vzip", "vrev64",
                "vpaddq", "vdupq", "vmulq", "vmovn", "vcombine", "vst1",
                "vld1q_s16", "vld1q_s32", "vrshrn", "vsubq", "vaddq")


def _drop_neon_helpers(text: str) -> str:
    out = []
    lines = text.splitlines()
    i = 0
    while i < len(lines):
        l = lines[i]
        if l.startswith("static inline"):
            depth = l.count("{") - l.count("}")
            j = i
            while depth > 0 and j + 1 < len(lines):
                j += 1
                depth += lines[j].count("{") - lines[j].count("}")
            block = "\n".join(lines[i:j + 1])
            if any(t in block for t in _NEON_TOKENS):
                i = j + 1
                continue
        out.append(l)
        i += 1
    return "\n".join(out)


def emit_pure_sve(func_name: str = "dynopt_dct16_pure_sve") -> str:
    src = emit_acle(neon8=True, func_name=func_name)
    lines = src.splitlines()
    idx_block = ""
    for i, l in enumerate(lines):
        if l.startswith("static const uint16_t idx_rev"):
            j = i + 1
            while j < len(lines) and "};" not in lines[j]:
                j += 1
            idx_block = "\n".join(lines[i:j + 1])
            break
    head = ("// Generated by optimizer/ir/dct16_pure_sve_emit.py "
            "-- pure SVE (VL=128-fixed).\n"
            "#include <arm_sve.h>\n#include <cstdint>\n\n"
            + PURE_SVE_HELPERS + "\n" + idx_block + "\n"
            + "static inline svint16_t rev16(const svint16_t a)"
            "{ return psv_rev16(a); }\n"
            + "static inline svint32_t rev32(const svint32_t a)"
            "{ return psv_rev32_s32(a); }\n"
            + "static inline svint64_t sdotq_s16(svint64_t acc, "
            "svint16_t x, svint16_t y){ return psv_sdot(acc, x, y); }\n\n")
    cut = src.index("static const int16_t C8[16][8] = {")
    body = _body_subs(_drop_neon_helpers(src[cut:]))
    sig = ("extern \"C\" void %s(const int16_t* src, int16_t* dst, "
           "intptr_t srcStride)\n{" % func_name)
    guard = ("extern \"C\" void %s(const int16_t* src, int16_t* dst, "
             "intptr_t srcStride)\n{\n    if (svcntb() != 16) return;"
             % func_name)
    body = body.replace(sig, guard, 1)
    return head + body
