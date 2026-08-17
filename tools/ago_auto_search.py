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
    "dct16": ("optimizer.ago.covers_dct16", "dynopt_dct16_sve2_shared"),
    "dct32": ("optimizer.ago.covers_dct32", "dynopt_dct32_sve2_shared"),
    "satd-8": ("optimizer.ago.covers_satd8", "dynopt_satd_8x8_sve2"),
    "sa8d": ("optimizer.ago.covers_sa8d8", "dynopt_sa8d_8x8_sve2"),
    "satd-16": ("optimizer.ago.covers_satd16", "dynopt_satd_16x16_sve2"),
    "sad": ("optimizer.ago.covers_sad", "dynopt_sad_16x16_sve2"),
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


def auto_search(kernel, rank_by="permute", verify=False, march="armv8.2-a+sve2"):
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
        meta = cover_module.cover_meta()

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
        for r in results:
            r["score"] = r["permute_ratio"] + r["fused_uop"] / 1000.0
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

        # 4. 可选：QEMU bit-exact 验证
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
    ap.add_argument("--march", default="armv8.2-a+sve2",
                    help="-march 值（默认 armv8.2-a+sve2）")
    args = ap.parse_args()
    return auto_search(args.kernel, args.rank_by, args.verify, args.march)


if __name__ == "__main__":
    sys.exit(main())
