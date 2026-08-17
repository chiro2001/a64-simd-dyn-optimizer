#!/usr/bin/env python3
"""AGO 自动搜索：对指定 kernel 运行 cover 搜索 + 排序 + 验证。

流程（免 manifest，docs/82 下一步 #4）：
1. cover 模板直接发射全部候选（optimizer/ago/covers_*.py）
2. 编译每个候选（交叉编译 -march armv8.2-a+sve2）
3. 提取 static_counts 特征（permute_depth_ratio 等）
4. 按 permute_ratio 排序（rho=-1.000 vs 950 实测）+
   fused_uop 综合打分
5. 对最佳候选做 QEMU bit-exact 验证（对比 NEON reference，interp8）
6. 输出排名表 + 验证结果

用法：
  python3 tools/ago_auto_search.py --kernel interp8
  python3 tools/ago_auto_search.py --kernel dct16 --rank-by ago
  python3 tools/ago_auto_search.py --kernel sad
  python3 tools/ago_auto_search.py --kernel psy-cost-16x16

这个脚本是"手动搜索落入 AGO 自动搜索"的入口点（docs/52 长远目标）；
有 manifest 的 kernel 可另行跑 search_sve2_layouts.py --backend ago
做 QEMU 差分验证的完整管线。
"""

import argparse
import os

import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "optimizer"))
sys.path.insert(0, os.path.join(ROOT, "tools"))

CC = os.environ.get("CROSS_CC", "aarch64-linux-gnu-g++")
QEMU = os.environ.get("QEMU", "qemu-aarch64")
QEMU_SYSROOT = os.environ.get("QEMU_SYSROOT", "/usr/aarch64-linux-gnu")

KERNEL_COVERS = {
    "interp8": ("optimizer.ago.covers_interp8", "dynopt_interp8_8x8_sve2"),
    "interp8-64x64": ("optimizer.ago.covers_interp8_64x64", "dynopt_interp8_64x64_sve2"),
    "interp8-32": ("optimizer.ago.covers_interp8_32", "dynopt_interp8_32x32_sve2"),
    "interp8-16x32": ("optimizer.ago.covers_interp8_16x32", "dynopt_interp8_16x32_sve2"),
    "interp8-16x8": ("optimizer.ago.covers_interp8_16x8", "dynopt_interp8_16x8_sve2"),
    "interp8-8x16": ("optimizer.ago.covers_interp8_8x16", "dynopt_interp8_8x16_sve2"),
    "dct16": ("optimizer.ago.covers_dct16", "dynopt_dct16_sve2_shared"),
    "dct32": ("optimizer.ago.covers_dct32", "dynopt_dct32_sve2_shared"),
    "dct8": ("optimizer.ago.covers_dct8", "dynopt_dct8_sve2_shared"),
    "satd-8": ("optimizer.ago.covers_satd8", "dynopt_satd_8x8_sve2"),
    "sa8d": ("optimizer.ago.covers_sa8d8", "dynopt_sa8d_8x8_sve2"),
    "sa8d16": ("optimizer.ago.covers_sa8d16", "dynopt_sa8d_16x16_sve2"),
    "sa8d-32x32": ("optimizer.ago.covers_sa8d32x32", "dynopt_sa8d_32x32_sve2"),
    "sa8d-64x64": ("optimizer.ago.covers_sa8d64x64", "dynopt_sa8d_64x64_sve2"),
    "satd-16": ("optimizer.ago.covers_satd16", "dynopt_satd_16x16_sve2"),
    "satd-16x32": ("optimizer.ago.covers_satd16x32", "dynopt_satd_16x32_sve2"),
    "satd-16x4": ("optimizer.ago.covers_satd16x4", "dynopt_satd_16x4_sve2"),
    "satd-16x64": ("optimizer.ago.covers_satd16x64", "dynopt_satd_16x64_sve2"),
    "satd-32x16": ("optimizer.ago.covers_satd32x16", "dynopt_satd_32x16_sve2"),
    "satd-32x32": ("optimizer.ago.covers_satd32x32", "dynopt_satd_32x32_sve2"),
    "satd-64x16": ("optimizer.ago.covers_satd64x16", "dynopt_satd_64x16_sve2"),
    "satd-64x64": ("optimizer.ago.covers_satd64x64", "dynopt_satd_64x64_sve2"),
    "satd-64x48": ("optimizer.ago.covers_satd64x48", "dynopt_satd_64x48_sve2"),
    "satd-64x32": ("optimizer.ago.covers_satd64x32", "dynopt_satd_64x32_sve2"),
    "satd-32x64": ("optimizer.ago.covers_satd32x64", "dynopt_satd_32x64_sve2"),
    "satd-32x8": ("optimizer.ago.covers_satd32x8", "dynopt_satd_32x8_sve2"),
    "satd-8x16": ("optimizer.ago.covers_satd_8x16", "dynopt_satd_8x16_sve2"),
    "satd-8x4": ("optimizer.ago.covers_satd_8x4", "dynopt_satd_8x4_sve2"),
    "satd-8x32": ("optimizer.ago.covers_satd_8x32", "dynopt_satd_8x32_sve2"),
    "satd-16x8": ("optimizer.ago.covers_satd_16x8", "dynopt_satd_16x8_sve2"),
    "sad": ("optimizer.ago.covers_sad", "dynopt_sad_16x16_sve2"),
    "cost-coeff-nxn": ("optimizer.ago.covers_costcoeff",
                       "dynopt_cost_coeff_nxn_sve2"),
    "sao-stats-e0": ("optimizer.ago.covers_sao_e0", "dynopt_sao_stats_e0_64_sve2"),
    "sao-stats-e2": ("optimizer.ago.covers_sao_stats_e2", "dynopt_sao_stats_e2_64_sve2"),
    "sao-stats-e3": ("optimizer.ago.covers_sao_stats_e3", "dynopt_sao_stats_e3_64_sve2"),
    "sao-b0": ("optimizer.ago.covers_sao_b0", "dynopt_sao_b0_64x4_sve2"),
    "sao-e1": ("optimizer.ago.covers_sao_e1", "dynopt_sao_e1_64x4_sve2"),
    "sao-e2": ("optimizer.ago.covers_sao_e2", "dynopt_sao_e2_64_sve2"),
    "sao-e3": ("optimizer.ago.covers_sao_e3", "dynopt_sao_e3_64_sve2"),
    "sao-stats-e1": ("optimizer.ago.covers_sao_stats_e1", "dynopt_sao_stats_e1_64_sve2"),
    "sao-stats-bo": ("optimizer.ago.covers_sao_stats_bo", "dynopt_sao_stats_bo_64_sve2"),
    "chroma-addavg-8x8": ("optimizer.ago.covers_chroma_addavg_8x8", "dynopt_chroma_addavg_8x8_sve2"),
    "cu-sub-ps": ("optimizer.ago.covers_cu_sub_ps", "dynopt_cu_sub_ps_16x16_sve2"),
    "cu-add-ps": ("optimizer.ago.covers_cu_add_ps", "dynopt_cu_add_ps_16x16_sve2"),
    "cu-copy-pp": ("optimizer.ago.covers_cu_copy_pp", "dynopt_cu_copy_pp_sve2"),
    "chroma-copy-ps-16x16": ("optimizer.ago.covers_chroma_copy_ps_16x16", "dynopt_chroma_copy_ps_16x16_sve2"),
    "chroma-copy-pp-32x32": ("optimizer.ago.covers_chroma_copy_pp_32x32", "dynopt_chroma_copy_pp_32x32_sve2"),
    "chroma-copy-pp-8x8": ("optimizer.ago.covers_chroma_copy_pp_8x8", "dynopt_chroma_copy_pp_8x8_sve2"),
    "psy-cost-16x16": ("optimizer.ago.covers_psycost",
                       "dynopt_psy_cost_pp_16x16_sve2"),
}


def compile_and_count(cpp_path, march, tmpdir):
    """编译候选并提取 static_counts。"""
    obj = os.path.join(tmpdir, "candidate.o")
    r = subprocess.run(
        [CC, "-O3", "-march=" + march, "-c", cpp_path, "-o", obj],
        capture_output=True, text=True, timeout=120)
    if r.returncode != 0:
        return {"error": r.stderr[:200]}
    from static_counts import static_counts
    return static_counts(obj)


def _normalize_cover_meta(meta):
    """Adapt the M2-era cover_meta format (kernel/tails/tail_ops/
    cp_chains/regions) to the current cover protocol (covers/names/
    cp_chains/tail_ops/expected_permute_ratio). sa8d/satd-8 still use
    the old format; the auto-search requires the protocol keys.
    """
    if "covers" in meta:
        return meta
    covers = sorted(meta.get("tails", {}))
    return {
        "covers": covers,
        "names": {c: "%s cover %s" % (meta.get("kernel", "?"), c)
                  for c in covers},
        "cp_chains": meta.get("cp_chains", {}),
        "tail_ops": meta.get("tail_ops", {}),
        "expected_permute_ratio": {c: 0.0 for c in covers},
    }


def _discovery_variants(kernel):
    """docs/82 #5：返回参数网格上的自动变体 (label, emit_fn) 列表。

    与预定义 cover 不同，这些变体由发射器/模板的参数组合枚举产生，
    让自动搜索"发现"新候选而非只对精选 A/B/C 排序。无网格的 kernel
    返回 []（其 cover 已全覆盖现有变体）。
    """
    import sys as _sys

    _ir = os.path.join(ROOT, "optimizer", "ir")
    if _ir not in _sys.path:
        _sys.path.insert(0, _ir)
    if kernel == "dct16":
        # dct16 发射器全部 even-k 模式（docs/79 表）：精选只暴露
        # neon_bridge/pure_sve2，发现网格补 fused/addp 两个模式。
        from dct16_wide_sve2 import emit_candidate
        return [
            ("emitter-neon_bridge_fused",
             lambda: emit_candidate("neon_bridge_fused")),
            ("emitter-addp",
             lambda: emit_candidate("addp")),
        ]
    if kernel == "dct32":
        # docs/79 未探索轴：8 rows at once（batch=8）。精选 cover 只有
        # loop(batch=4)/opbase；发现网格枚举 batch=8 变体。
        from dct32_wide_sve2 import emit_candidate
        return [
            ("emitter-batch8",
             lambda: emit_candidate(batch=8)),
        ]
    if kernel == "interp8":
        # svdot32 的 16x16/32x32 形状是独立 kernel（interp8-16/32），
        # 与 8x8 精选不可比；8x8 的全部 lowering 变体（svdot32/
        # svdot64/neon）已在精选 covers 中——无同 kernel 发现网格。
        return []
    return []


def auto_search(kernel, rank_by="permute", verify=False, discover=False,
                march="armv8.2-a+sve2"):
    """对指定 kernel 运行 AGO 自动搜索。"""
    if kernel not in KERNEL_COVERS:
        print("不支持的 kernel: %s（支持: %s）" % (
            kernel, ", ".join(KERNEL_COVERS.keys())))
        return 1

    print("[ago-search] kernel=%s rank-by=%s" % (kernel, rank_by))

    with tempfile.TemporaryDirectory(prefix="ago-search-") as tmpdir:
        # 1. 对每个 cover 直接发射 + 编译 + 提取特征。
        #    免 manifest（docs/82 下一步 #4）：不依赖 search_sve2_layouts
        #    的 manifest 驱动验证管线，psy-cost 等无 manifest kernel 也可
        #    运行；有 manifest 的 kernel 仍可另行跑 --backend ago 全管线。
        cover_module_name, func_name = KERNEL_COVERS[kernel]
        cover_module = __import__(cover_module_name, fromlist=["emit_cover"])
        meta = _normalize_cover_meta(cover_module.cover_meta())

        print("\n[ago-search] 候选排名（按 %s）:" % rank_by)
        print("%-12s %-30s %6s %8s %6s %6s %5s" % (
            "cover", "name", "fused", "cp_lat", "perm", "ratio", "spill"))
        print("-" * 80)

        results = []
        for cover_id in meta["covers"]:
            code = cover_module.emit_cover(cover_id, func_name)
            cpp = os.path.join(tmpdir, "cover-%s.cpp" % cover_id)
            with open(cpp, "w") as f:
                f.write(code)
            sc = compile_and_count(cpp, march, tmpdir)
            if "error" in sc:
                # Distinguish ISA rejection (compiles under sve2 but not
                # the requested march) from a genuinely broken cover.
                if march != "armv8.2-a+sve2":
                    sc2 = compile_and_count(cpp, "armv8.2-a+sve2", tmpdir)
                    if "error" not in sc2:
                        print("cover-%s      ISA REJECT (%s)" % (
                            cover_id, march))
                        continue
                print("cover-%s      COMPILE FAIL" % cover_id)
                continue
            ratio = sc.get("permute_depth_ratio", 0)
            flag = " ***" if ratio >= 0.30 else ""
            print("cover-%s     %-30s %6d %8s %6d %5.1f%% %5s%s" % (
                cover_id,
                meta["names"][cover_id][:30],
                sc.get("vector_fused_uop", 0),
                sc.get("critical_path_latency", "-"),
                sc.get("permute_on_critical", 0),
                ratio * 100,
                sc.get("spill_reload", "-"),
                flag))
            results.append({
                "cover": cover_id,
                "name": meta["names"][cover_id],
                "fused_uop": sc.get("vector_fused_uop", 0),
                "cp_lat": sc.get("critical_path_latency"),
                "permute_ratio": ratio,
                "permute_on_cp": sc.get("permute_on_critical"),
                "spill": sc.get("spill_reload"),
                "code": code,
            })

        if not results:
            print("[ago-search] 全部候选编译失败")
            return 1

        # 3. 选择最佳候选（综合 permute_ratio + fused_uop）
        # permute_ratio 预测 950 permute 瓶颈，fused_uop 预测总指令开销。
        # 组合分数 = permute_ratio + fused_uop/1000（两者归一化）。
        # 纯 NEON 候选 permute_ratio=0 但 fused_uop 高，SVE2 候选
        # permute_ratio 可能高但 fused_uop 低，组合分数平衡两者。
        def _score(r):
            # permute_ratio (0-1) + fused_uop/1000 + cp_lat/500: the
            # cp_lat term matches the 950-arbitrated dct16 case (op895
            # beats the lower-permute neon_bridge_fused; docs/79/83).
            # Weight 0.002 keeps predictor-consistent winners (sao-e0
            # block32, cost-coeff unroll) while fixing dct16.
            return (r["permute_ratio"] + r["fused_uop"] / 1000.0 +
                    (r.get("cp_lat") or 0) / 500.0)
        for r in results:
            r["score"] = _score(r)
        results.sort(key=lambda r: r["score"])
        winner = results[0]
        print("\n[ago-search] 最佳候选: cover-%s (%s)" % (
            winner["cover"], winner["name"]))
        print("  permute_ratio=%.1f%%  fused_uop=%d  cp_lat=%s  score=%.3f" % (
            winner["permute_ratio"] * 100,
            winner["fused_uop"],
            winner["cp_lat"],
            winner["score"]))

        if winner["permute_ratio"] >= 0.30:
            print("  ⚠ 超过 30%% 阈值，可能不是 950 上的最佳选择")

        # 4. 自动发现（docs/82 #5）：枚举参数网格变体，与精选同台排序
        if discover:
            disc = _discovery_variants(kernel)
            if not disc:
                print("\n[ago-search] %s 无发现网格（精选 cover 已覆盖全部"
                      "现有变体）" % kernel)
            else:
                print("\n[ago-search] 自动发现（参数网格枚举）:")
                print("%-12s %-34s %6s %8s %6s %6s %5s" % (
                    "variant", "desc", "fused", "cp_lat", "perm",
                    "ratio", "spill"))
                print("-" * 80)
                disc_results = []
                for label, emit_fn in disc:
                    try:
                        code = emit_fn()
                    except Exception as exc:  # noqa: BLE001
                        print("%-12s EMIT FAIL: %s" % (label, exc))
                        continue
                    cpp = os.path.join(tmpdir,
                                       "disc-%s.cpp" % label.split("-")[0])
                    with open(cpp, "w") as f:
                        f.write(code)
                    sc = compile_and_count(cpp, march, tmpdir)
                    if "error" in sc:
                        print("%-12s COMPILE FAIL" % label)
                        continue
                    ratio = sc.get("permute_depth_ratio", 0)
                    score = (ratio +
                             sc.get("vector_fused_uop", 0) / 1000.0 +
                             (sc.get("critical_path_latency") or 0) / 500.0)
                    flag = " ***" if ratio >= 0.30 else ""
                    print("%-12s %-34s %6d %8s %6d %5.1f%% %5s%s" % (
                        label[:12],
                        ("emitter mode" if label.startswith("emitter")
                         else "svdot32 template"),
                        sc.get("vector_fused_uop", 0),
                        sc.get("critical_path_latency", "-"),
                        sc.get("permute_on_critical", 0),
                        ratio * 100,
                        sc.get("spill_reload", "-"),
                        flag))
                    disc_results.append({
                        "label": label,
                        "fused_uop": sc.get("vector_fused_uop", 0),
                        "permute_ratio": ratio,
                        "cp_lat": sc.get("critical_path_latency"),
                        "score": score,
                    })
                if disc_results:
                    dbest = min(disc_results, key=lambda r: r["score"])
                    print("\n[ago-search] 发现最佳: %s (score=%.3f, "
                          "permute=%.1f%%, fused=%d, cp_lat=%s) vs "
                          "精选最佳: cover-%s (score=%.3f, permute=%.1f%%, "
                          "fused=%d, cp_lat=%s)" % (
                              dbest["label"], dbest["score"],
                              dbest["permute_ratio"] * 100,
                              dbest["fused_uop"], dbest["cp_lat"],
                              winner["cover"], winner["score"],
                              winner["permute_ratio"] * 100,
                              winner["fused_uop"], winner["cp_lat"]))
                    if dbest["score"] < winner["score"]:
                        print("  ✓ 自动发现优于精选 cover（score 口径）"
                              "——可固化为新 cover")
                        if (dbest["cp_lat"] and winner["cp_lat"]
                                and dbest["cp_lat"] > winner["cp_lat"]):
                            print("  ⚠ 但 cp_lat 更差（%s vs %s）——score "
                                  "公式不含关键路径，950 实测前不下结论"
                                  % (dbest["cp_lat"], winner["cp_lat"]))
                    else:
                        print("  （精选 cover 仍最优；发现变体记录为候选）")

        # 5. 可选：QEMU bit-exact 验证
        if verify:
            print("\n[ago-search] QEMU bit-exact 验证...")
            # TODO: 对 interp8 做 bit-exact 验证
            # 其他 kernel 需要各自的 reference 实现
            if kernel == "interp8":
                _verify_interp8(winner, tmpdir, march)
            else:
                print("  （%s 的 bit-exact 验证尚未实现）" % kernel)

        return 0


def _verify_interp8(winner, tmpdir, march):
    """对 interp8 最佳候选做 QEMU bit-exact 验证。"""
    from interp8_emit import emit_interp8_hpp
    from interp8_op_ir import interp8_hpp_8x8_dag

    # 生成 NEON reference
    ref_code = emit_interp8_hpp(interp8_hpp_8x8_dag(),
                                func_name="dynopt_neon_interp8_8x8")
    ref_cpp = os.path.join(tmpdir, "neon_ref.cpp")
    ref_obj = os.path.join(tmpdir, "neon_ref.o")
    with open(ref_cpp, "w") as f:
        f.write(ref_code)
    subprocess.run([CC, "-O2", "-march=armv8.2-a", "-c", ref_cpp, "-o", ref_obj],
                   check=True, capture_output=True)

    # 编译候选
    cand_cpp = os.path.join(tmpdir, "winner.cpp")
    cand_obj = os.path.join(tmpdir, "winner.o")
    with open(cand_cpp, "w") as f:
        f.write(winner["code"])
    subprocess.run([CC, "-O3", "-march=" + march, "-c", cand_cpp, "-o", cand_obj],
                   check=True, capture_output=True)

    # 生成 driver
    driver = (
        '#include <cstdint>\n#include <cstdio>\n#include <cstdlib>\n'
        '#include <cstring>\n'
        'extern "C" void dynopt_neon_interp8_8x8(const uint8_t*, intptr_t, '
        'uint8_t*, intptr_t, int);\n'
        'extern "C" void dynopt_interp8_8x8_sve2(const uint8_t*, intptr_t, '
        'uint8_t*, intptr_t, int);\n'
        'static const int N=100*96+96; static uint8_t a[N];\n'
        'int main(){static uint8_t d1[N],d2[N]; long mism=0; srand(0x5EED);\n'
        'for(int it=0;it<200;it++){int mode=it%6;'
        'for(int i=0;i<N;i++){switch(mode){'
        'case 0:a[i]=(uint8_t)(rand()%256);break;'
        'case 1:a[i]=0;break;case 2:a[i]=255;break;'
        'case 3:a[i]=(uint8_t)(rand()%256);break;'
        'case 4:a[i]=(uint8_t)(i*7);break;'
        'default:a[i]=(uint8_t)(rand()%256);break;}}\n'
        'const uint8_t* pa=a+3*96+8;'
        'for(int ph=1;ph<=3;ph++){memset(d1,0xAA,sizeof(d1));'
        'memset(d2,0xAA,sizeof(d2));'
        'dynopt_interp8_8x8_sve2(pa,96,d1+3*96+8,96,ph);'
        'dynopt_neon_interp8_8x8(pa,96,d2+3*96+8,96,ph);'
        'if(memcmp(d1,d2,sizeof(d1))!=0)mism++;}}\n'
        'printf(mism?"FAILED %ld\\n":"PASS\\n",mism); return mism!=0;}')
    drv_cpp = os.path.join(tmpdir, "driver.cpp")
    drv_bin = os.path.join(tmpdir, "driver")
    with open(drv_cpp, "w") as f:
        f.write(driver)
    subprocess.run([CC, "-O2", "-march=" + march, "-o", drv_bin,
                    drv_cpp, ref_obj, cand_obj],
                   check=True, capture_output=True)

    qemu = os.environ.get("QEMU") or os.path.join(
        ROOT, "build", "qemu-build", "qemu-aarch64")
    r = subprocess.run([qemu, "-L", QEMU_SYSROOT,
                        "-cpu", "max,sve-max-vq=2", drv_bin],
                       capture_output=True, text=True, timeout=30)
    result = r.stdout.strip()
    print("  QEMU bit-exact: %s" % result)
    if "PASS" in result:
        print("  ✓ AGO 最佳候选 bit-exact 验证通过")
    else:
        print("  ✗ bit-exact 验证失败")


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--kernel", required=True,
                    choices=list(KERNEL_COVERS.keys()),
                    help="目标 kernel")
    ap.add_argument("--rank-by", default="permute",
                    choices=("permute", "ago"),
                    help="排序方式（默认 permute）")
    ap.add_argument("--verify", action="store_true",
                    help="对最佳候选做 QEMU bit-exact 验证")
    ap.add_argument("--discover", action="store_true",
                    help="自动发现（docs/82 #5）：枚举发射器/模板参数网格"
                         "变体，与精选 covers 同台排序")
    ap.add_argument("--march", default="armv8.2-a+sve2",
                    help="-march 值（默认 armv8.2-a+sve2）")
    ap.add_argument("--isa", choices=("sve1", "sve2", "neon"),
                    help="ISA 约束便捷参数（sve1=920B/VL256、sve2=950、"
                         "neon=纯 NEON）；覆盖 --march 的默认值")
    args = ap.parse_args()
    if args.isa == "sve1" and args.march == "armv8.2-a+sve2":
        args.march = "armv8.2-a+sve"
    elif args.isa == "neon" and args.march == "armv8.2-a+sve2":
        args.march = "armv8.2-a+dotprod"
    return auto_search(args.kernel, args.rank_by, args.verify,
                       args.discover, args.march)


if __name__ == "__main__":
    sys.exit(main())
