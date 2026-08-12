"""Typed semantic rewrites on MachineIR.

These are the optimizer's width/overflow fixes: pattern-driven transformations
that preserve the C reference semantics where the imported kernel used a
narrower arithmetic domain.
"""


def widen_dct8_pass2_odd(ir):
    """Fix the upstream dct8 s16-wrap bug on pass 2 odd columns.

    Upstream computes the second-pass O vectors as `vsub_s16` on pass-1
    coefficient values, which wraps when |coef[k] - coef[7-k]| > 32767 (the C
    reference computes in int32). This rewrite:

      O = sub<s16>(rshrn2(a), rev64(rshrn2(b)))   ->  O = sub<s32>(sext(a'), sext(b'))
      odd = smull<s16>(c, O)                      ->  odd = mul<s32>(sext(c), O)

    All products stay below 2**31 (89 * 65280 * 4), so the s32 path is exact.
    """
    nodes = ir.nodes
    bydst = {n.get("dst"): n for n in nodes}
    widened = set()
    out = []

    for n in nodes:
        if n["op"] == "sub" and n.get("type") == "<4 x i16>":
            first = bydst.get(n["src"][0])
            if first and first["op"] == "intrinsic" \
                    and first["intrinsic"] == "rshrn":
                wa = "w_%s_a" % n["dst"]
                wb = "w_%s_b" % n["dst"]
                out.append({"op": "sext", "type": "<4 x i32>",
                            "src": n["src"][0], "dst": wa})
                out.append({"op": "sext", "type": "<4 x i32>",
                            "src": n["src"][1], "dst": wb})
                out.append({"op": "sub", "type": "<4 x i32>",
                            "src": [wa, wb], "dst": n["dst"]})
                widened.add(n["dst"])
                continue
        if n["op"] == "intrinsic" and n["intrinsic"] == "smull" \
                and n["args"][1]["ref"] in widened:
            wc = "w_%s_c" % n["dst"]
            out.append({"op": "sext", "type": "<4 x i32>",
                        "src": n["args"][0]["ref"], "dst": wc})
            out.append({"op": "mul", "type": "<4 x i32>",
                        "src": [wc, n["args"][1]["ref"]], "dst": n["dst"]})
            continue
        out.append(n)

    for i, n in enumerate(out):
        n["id"] = i
    ir.nodes = out
    return ir
