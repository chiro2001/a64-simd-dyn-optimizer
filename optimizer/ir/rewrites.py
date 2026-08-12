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


def widen_s16_overflow_subs(ir, sub_ids):
    """Widen a set of s16 sub nodes to s32, including their smull consumers.

    Range-agnostic core shared with widen_dct8_pass2_odd: for each flagged
    `<4 x i16> sub` the operands are sign-extended, the sub becomes `<4 x
    i32>`, and any consuming `smull` becomes `mul<s32>(sext(coef), O)` so the
    dot product stays exact. Consumers after the widened sub keep their
    existing s32 pipeline.
    """
    nodes = ir.nodes
    bydst = {n.get("dst"): n for n in nodes}
    targets = set(sub_ids)
    dst_by_id = {n.get("id"): n.get("dst") for n in nodes
                 if n.get("id") is not None}
    widened_dsts = {dst_by_id[i] for i in targets if i in dst_by_id}
    out = []
    for n in nodes:
        if n.get("id") in targets:
            wa = "w_%s_a" % n["dst"]
            wb = "w_%s_b" % n["dst"]
            out.append({"op": "sext", "type": "<4 x i32>",
                        "src": n["src"][0], "dst": wa})
            out.append({"op": "sext", "type": "<4 x i32>",
                        "src": n["src"][1], "dst": wb})
            out.append({"op": "sub", "type": "<4 x i32>",
                        "src": [wa, wb], "dst": n["dst"]})
            continue
        if n["op"] == "intrinsic" and n["intrinsic"] == "smull" \
                and n["args"][1]["ref"] in widened_dsts:
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


def widen_overflows(ir, input_range=(-255, 255), constants=None):
    """Range-driven width fix: widen every s16 sub flagged by the analysis."""
    from optimizer.analysis.range import analyze

    _, risks = analyze(ir, input_range=input_range, constants=constants)
    sub_ids = [r["id"] for r in risks if r["op"] == "sub"]
    if not sub_ids:
        return ir
    return widen_s16_overflow_subs(ir, sub_ids)


def mul64_to_shift(ir):
    """Replace exact ×64 lane-constant multiplies with a shift by 6.

    In the DCT8 even rows, `mul<s32>(x, <64,64,64,64>)` equals `x << 6`
    exactly (no overflow for the kernel's value range). vshlq_n is cheaper
    than vmulq on most pipelines. This is the smallest rewrite in the
    catalog, demonstrating the search loop making a real instruction
    selection choice.
    """
    changed = 0
    for n in ir.nodes:
        if n.get("op") == "mul" and n.get("const_vec") == [64, 64, 64, 64]:
            n["op"] = "shl"
            n["amt"] = 6
            n.pop("const_vec", None)
            changed += 1
    return ir


DCT8_G_T8 = (
    (64, 64, 64, 64, 64, 64, 64, 64),
    (89, 75, 50, 18, -18, -50, -75, -89),
    (83, 36, -36, -83, -83, -36, 36, 83),
    (75, -18, -89, -50, 50, 89, 18, -75),
    (64, -64, -64, 64, 64, -64, -64, 64),
    (50, -89, 18, 75, -75, -18, 89, -50),
    (36, -83, 83, -36, -36, 83, -83, 36),
    (18, -50, 75, -89, 89, -75, 50, -18),
)


def _src_list(node):
    src = node.get("src")
    if src is None:
        return []
    return src if isinstance(src, list) else [src]


def wide_loads(ir):
    """Fuse adjacent 4-lane loads into one 8-lane load + lane extraction.

    The upstream dct8 seed loads each row as two adjacent `<4 x i16>` loads
    (offsets o and o+8 bytes). AArch64 can load 8 lanes in one instruction and
    split them in registers with vget_low/vget_high, removing one load and its
    address node per row. Only pairs whose `+8` address node has a single
    consuming load are rewritten; everything else is left untouched.
    """
    import re
    from collections import defaultdict

    nodes = ir.nodes
    id_of = {n.get("id"): n for n in nodes if n.get("id") is not None}
    users = defaultdict(list)
    for n in nodes:
        for src in _src_list(n):
            users[src].append(n)
        if n.get("ptr"):
            users[n["ptr"]].append(n)
        for a in n.get("args") or []:
            if "ref" in a:
                users[a["ref"]].append(n)

    pairs = []
    seen_hi = set()
    for n in nodes:
        if n.get("op") != "addr":
            continue
        m = re.match(
            r"getelementptr\s+inbounds\s+(?:nuw\s+)?i8,\s*ptr\s*"
            r"%([A-Za-z0-9._]+),\s*(?:i64\s+)?8\s*$", n.get("rhs", ""))
        if not m:
            continue
        base = m.group(1)
        lo = [x for x in nodes
              if x.get("op") == "load" and x.get("ptr") == base
              and x.get("type") == "<4 x i16>"
              and not x.get("const_name")]
        hi = [x for x in nodes
              if x.get("op") == "load" and x.get("ptr") == n["dst"]
              and x.get("type") == "<4 x i16>"
              and not x.get("const_name")]
        if len(lo) == 1 and len(hi) == 1 and len(users[n["dst"]]) == 1:
            pairs.append((lo[0], hi[0], n))
            seen_hi.add(hi[0]["id"])

    lo_by_id = {}
    removed = set()
    plans = {}
    for lo, hi, a in pairs:
        if lo["id"] in seen_hi:
            continue  # ambiguous overlap; keep both loads
        wide = "wide_%d" % lo["id"]
        plans[lo["id"]] = {
            "wide": wide,
            "lo": lo,
            "hi": hi,
        }
        lo_by_id[lo["dst"]] = wide + "_lo"
        lo_by_id[hi["dst"]] = wide + "_hi"
        removed.add(hi["id"])
        removed.add(a["id"])

    if not lo_by_id:
        return ir

    out = []
    for n in nodes:
        if n["id"] in removed:
            continue
        if n["id"] in plans:
            p = plans[n["id"]]
            wide, lo = p["wide"], p["lo"]
            out.append({"op": "load", "type": "<8 x i16>", "ptr": lo["ptr"],
                        "dst": wide})
            out.append({"op": "half", "half": "low", "type": "<4 x i16>",
                        "src": wide, "dst": wide + "_lo"})
            out.append({"op": "half", "half": "high", "type": "<4 x i16>",
                        "src": wide, "dst": wide + "_hi"})
            continue
        n2 = dict(n)
        if "src" in n2:
            if isinstance(n2["src"], list):
                n2["src"] = [lo_by_id.get(s, s) for s in n2["src"]]
            else:
                n2["src"] = lo_by_id.get(n2["src"], n2["src"])
        if n2.get("args"):
            args = []
            for a in n2["args"]:
                a2 = dict(a)
                if "ref" in a2:
                    a2["ref"] = lo_by_id.get(a2["ref"], a2["ref"])
                args.append(a2)
            n2["args"] = args
        out.append(n2)
    for i, n in enumerate(out):
        n["id"] = i
    ir.nodes = out
    return ir


def _addp_leaves(root_dst, bydst, leaf_dsts):
    stack = [root_dst]
    leaves = set()
    seen = set()
    while stack:
        d = stack.pop()
        if d in seen:
            continue
        seen.add(d)
        node = bydst.get(d)
        if not node:
            return None
        if node.get("op") == "intrinsic" and node.get("intrinsic") == "addp":
            stack.extend(a["ref"] for a in node["args"])
        elif d in leaf_dsts:
            leaves.add(d)
        else:
            return None
    return leaves


def tree_to_mla(ir):
    """Replace each pass-2 odd-column addp tree with a 4-deep mla chain.

    After widen_overflows, each odd output column of dct8 is a tree of four
    `<4 x i32>` per-lane multiplies reduced by three vpaddq_s32. This rewrite
    transposes the four O vectors once per 4-row block (vtrn1q/vtrn2q_s32 +
    vcombine_s32) and folds each column into:

        mulq_n(Oo0, c0); mlaq_n(acc, Oo1, c1); mlaq_n(acc, Oo2, c2);
        mlaq_n(acc, Oo3, c3)

    matching prototype (b) from m15. The four coefficient rows are read from
    the g_t8 constant loads so the rewrite is pattern-driven rather than
    hardcoding the four odd columns. It is a no-op unless the pass-2 odd
    subtractions were first widened (mul leaves only exist after `widen`).
    """
    from collections import defaultdict

    nodes = ir.nodes
    bydst = {n.get("dst"): n for n in nodes if n.get("dst")}
    loads = [n for n in nodes
             if n.get("op") == "load" and n.get("const_name")
             and (n["const_off"] // 16) in (1, 3, 5, 7)]
    if not loads:
        return ir
    load_dsts = {l["dst"] for l in loads}
    sexts = [n for n in nodes
             if n.get("op") == "sext" and _src_list(n)[0] in load_dsts]
    sext_dsts = {s["dst"] for s in sexts}
    muls = [n for n in nodes
            if n.get("op") == "mul" and n.get("type") == "<4 x i32>"
            and _src_list(n)[0] in sext_dsts]
    if not muls:
        return ir
    mul_by_dst = {m["dst"]: m for m in muls}
    mul_dsts = set(mul_by_dst)
    rshrn_by_src = {n["args"][0]["ref"]: n for n in nodes
                    if n.get("op") == "intrinsic"
                    and n.get("intrinsic") == "rshrn"}

    trees = []
    for n in nodes:
        if n.get("op") != "intrinsic" or n.get("intrinsic") != "addp":
            continue
        if n["dst"] not in rshrn_by_src:
            continue
        leaves = _addp_leaves(n["dst"], bydst, mul_dsts)
        if leaves and len(leaves) == 4:
            trees.append(n)

    def tree_leaves(root):
        return sorted((mul_by_dst[d] for d in
                       _addp_leaves(root["dst"], bydst, mul_dsts)),
                      key=lambda m: m["id"])

    def tree_load(root):
        sext = bydst[_src_list(tree_leaves(root)[0])[0]]
        return bydst[_src_list(sext)[0]]

    by_oset = defaultdict(list)
    for t in trees:
        oset = frozenset(_src_list(m)[1] for m in tree_leaves(t))
        by_oset[oset].append(t)

    plans = {}
    for oset, group in by_oset.items():
        if len(group) != 4:
            continue
        group = sorted(group, key=lambda t: tree_load(t)["const_off"])
        col_loads = [tree_load(t) for t in group]
        if len({l["const_off"] for l in col_loads}) != 4:
            continue
        leaves = [tree_leaves(t) for t in group]
        o = [_src_list(leaves[0][i])[1] for i in range(4)]
        if len(set(o)) != 4:
            continue
        # every column must share the same row order
        if any(_src_list(m)[1] != o[i]
               for col in leaves for i, m in enumerate(col)):
            continue
        # verify pairing: addp(leaf0,leaf1) + addp(leaf2,leaf3) + addp(root)
        ok = True
        removed = set()
        rshrn_dsts = []
        for t, col in zip(group, leaves):
            p01 = p23 = None
            for n in nodes:
                if n.get("op") != "intrinsic" or n.get("intrinsic") != "addp":
                    continue
                refs = {a["ref"] for a in n["args"]}
                if refs == {col[0]["dst"], col[1]["dst"]}:
                    p01 = n
                elif refs == {col[2]["dst"], col[3]["dst"]}:
                    p23 = n
            if not p01 or not p23:
                ok = False
                break
            root = bydst.get(t["dst"])
            if root and not ({p01["dst"], p23["dst"]}
                             == {a["ref"] for a in root["args"]}):
                ok = False
                break
            rshrn_dsts.append(rshrn_by_src[t["dst"]]["dst"])
            removed.update(m["id"] for m in col)
            removed.update(nn["id"] for nn in (p01, p23, t))
            removed.add(rshrn_by_src[t["dst"]]["id"])
        if not ok:
            continue
        tag = "_".join(o)
        pre = []
        trn = []
        for k, (a, b) in enumerate(((o[0], o[1]), (o[2], o[3]))):
            trn.append((a, b, [0, 4, 2, 6]))
            trn.append((a, b, [1, 5, 3, 7]))
        t1, t2, t3, t4 = ["%s_t%d" % (tag, k + 1) for k in range(4)]
        for (a, b, mask), dst in zip(trn, (t1, t2, t3, t4)):
            pre.append({"op": "shuffle", "type": "<4 x i32>",
                        "src": [a, b], "mask": mask, "dst": dst})
        oo = ["%s_oo%d" % (tag, k) for k in range(4)]
        for dst, (a, b), mask in zip(
                oo, ((t1, t3), (t2, t4), (t1, t3), (t2, t4)),
                ([0, 1, 4, 5], [0, 1, 4, 5], [2, 3, 6, 7], [2, 3, 6, 7])):
            pre.append({"op": "shuffle", "type": "<4 x i32>",
                        "src": [a, b], "mask": mask, "dst": dst})

        chains = []
        for load, rdst in zip(col_loads, rshrn_dsts):
            vals = DCT8_G_T8[load["const_off"] // 16]
            acc = "mla_%s_%d_0" % (tag, load["const_off"])
            chains.append({"op": "mul", "type": "<4 x i32>", "src": [oo[0]],
                           "const_vec": [vals[0]] * 4, "dst": acc})
            for k in range(1, 4):
                nxt = "mla_%s_%d_%d" % (tag, load["const_off"], k)
                chains.append({"op": "mla", "type": "<4 x i32>",
                               "src": [acc, oo[k]],
                               "const_vec": [vals[k]] * 4, "dst": nxt})
                acc = nxt
            chains.append({"op": "intrinsic", "intrinsic": "rshrn",
                           "type": "<4 x i16>",
                           "args": [{"ref": acc}, {"imm": 9}],
                           "src": [acc], "dst": rdst})
        plans[min(m["id"] for m in muls if m["id"] in removed)] = {
            "pre": pre, "chains": chains, "removed": removed,
            "sexts": sexts,
        }

    if not plans:
        return ir
    all_removed = set()
    for p in plans.values():
        all_removed |= p["removed"]
    users = defaultdict(set)
    for n in nodes:
        for src in _src_list(n):
            users[src].add(n["id"])
    # remove sexts whose only consumers are gone
    for s in sexts:
        if users.get(s["dst"], set()) <= all_removed:
            all_removed.add(s["id"])

    out = []
    emitted = set()
    for n in nodes:
        if n["id"] in plans and n["id"] not in emitted:
            p = plans[n["id"]]
            out.extend(dict(x) for x in p["pre"])
            out.extend(dict(x) for x in p["chains"])
            emitted.add(n["id"])
            continue
        if n["id"] in all_removed and n["id"] not in plans:
            continue
        if n["id"] in plans:
            continue
        out.append(n)
    for i, n in enumerate(out):
        n["id"] = i
    ir.nodes = out
    return ir
