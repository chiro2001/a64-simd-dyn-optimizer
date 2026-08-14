# Roundtrip Oracle 契约（S2，2026-08-14）

> seed 线（抽取层）的语义保真由“roundtrip 出厂门禁”保证：导入的
> MachineIR → codegen → 编译 → QEMU 差分 vs 参考实现。本文把门禁的
> 输入契约与 harness 契约规范化，使新 seed 的 harness 可半自动生成。

## 1. recipe 的 verify 段（输入契约）

```yaml
verify:
  codegen: emit_neon_c_intrinsics   # CODEGEN_REGISTRY 中的发射器名
  func_name: dynopt_<kernel>_neon_roundtrip   # 生成函数符号
  harness: kernels/<name>/roundtrip_verify.cpp # 差分主程序
  lib: build/x265-8-clang-sve/libx265.a
  compile_flags: ["-march=armv8.2-a+dotprod"] # 目标 ISA（dotprod/sve…）
  cases: 20000                        # 随机 case 数
```

约定：
- `func_name` 必须是 `extern "C"` 符号，签名与参考一致（除参考的
  额外参数，如 coeffIdx 可省略时省略）；
- `codegen` 是通用 node-driven 发射器；新增 op 形态只扩发射器，
  不写 per-kernel codegen；
- 门禁通过条件：QEMU 退出 0 且输出含 `mismatches=0`（或
  `candidate_vs_neon_mismatches=0`——上游实现自身与 C 有已知分歧时，
  对照“导入的 kernel”而非 C oracle）。

## 2. harness 契约

每个 harness 是自包含 C++ main：

1. **随机源**：`std::mt19937 rng(0xD16C2026u)`（与 20k 差分同种子族）；
2. **strides**：覆盖块宽相关集合（8 块：`{8,16,32}`；16 块：
   `{16,32,64}`；32 块：`{32,64,96}`）；
3. **相位/形状**：hpp/vpp 的 phase 参数按项目合同（interp4 排除
   phase 4）；形状由 W/H 决定；
4. **缓冲 padding**：
   - hpp 读 `src-3` 字节 → 前垫 8 字节；
   - **vpp 读 `src-3*stride` 行 → 前垫 3 行最大 stride**（教训：
     docs/41 G4f 曾因未垫行越界误报）；
   - 输出按 dstStride 写，读按行 stride；
5. **参考调用**：直接调用 x265 模板/符号（extern 声明）；
6. **比较**：逐行 memcmp W 字节；打印前 5 个失配（行/相位/stride）；
7. **输出**：`cases=<N> mismatches=<M>`；退出码 0 iff M==0。

## 3. 新 seed 接入清单

1. 确认目标函数在源文件（`rg` 定位）；编译 -O2/展开旗标后 body 无
   未知控制流（直线 / uniform branch / switch+phi）；
2. 建 `seeds/<name>.yaml`（clang_args/目标函数/extract 选项/verify）；
3. `extract_seed --recipe ...`：先 `--no-verify` 看 op 直方图，补
   codegen 缺失形态；再带 verify 跑到 `mismatches=0`；
4. `seed_pipeline --recipe ... --kernel <name>`：跑通全流程并与手写
   最优对照。

## 4. 后续（半自动 harness 生成）

按本契约把 harness 模板参数化（类型/形状/strides/相位/参考模板名），
由 recipe 的 `verify.ref_call` 字段生成 harness 源——与 gen_verify
（20k 差分）同思路，作为 S2 的下一步实现。
