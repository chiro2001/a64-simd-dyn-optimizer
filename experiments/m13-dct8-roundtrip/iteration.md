# M13-DCT8-Roundtrip：LLVM importer 扩展 + NEON roundtrip 忠实复现

- run-id: `m13-dct8-roundtrip`
- state: `accepted`（roundtrip 与上游 NEON bit-exact；同时精确复现并定位
  了上游的算术宽度 bug）
- date: 2026-08-13（Asia/Shanghai）
- host: 本地 x86 交叉（aarch64-linux-gnu-g++ 16.1.0 + qemu-aarch64 11.0.3）

## 1. 本轮试图证伪什么

“把上游 dct8_neon 提取为 LLVM IR 后，受限 importer 无法扩展覆盖 DCT 的
widening-mul/pairwise-add/rounding-narrow/store opcode 家族，或者扩展后的
codegen 无法生成与上游 bit-exact 的 roundtrip。”该命题被证伪。

## 2. 什么变了

- `optimizer/ir/machine_ir.py`（importer 扩展）：
  - 全局常量声明跳过、`store` 节点、标量/向量 `mul`（含逐 lane 常量向量
    `const_vec`）、`sext`、`splat (i32 N)` 立即数、i16 getelementptr、
    `load` 的内联常量 gep（`const_name`/`const_off`）、intrinsic 调用参数
    （`args`: ref/imm 有序表，修复 rshrn 移位丢失）；
- `optimizer/ir/codegen.py`：新增 `emit_dct8_c_intrinsics()`：符号化
  stride 寻址（`srcStride` 表达式）、`vld1/vst1`、`vmovl_s16`、`vadd/vsub`
  （按 lane 数选 64/128 位形态）、`vshlq_n_s32`、逐 lane 常量池 +
  `vmulq_s32`、`vrev64_s16/vrev64q_s32`、`vcombine_s32(vget_low/high)`
  （修复 vzip1q_s32 与 vzip1q_s64 的 lane 序差异）、`vmull_s16/
  vpaddq_s32/vrshrn_n_s32`、`dct8_g_t8` 常量表；
- 修了两个字符串索引 bug（`src` 存为字符串时 `src[0]` 取到首字符）；
- `kernels/dct8/gen_roundtrip.py`：MachineIR → roundtrip C++ 生成器；
- seed 提取：clang 22.1.8 `-O2 -emit-llvm -DHAVE_NEON=1` 提取
  `dct8_neon`（380 节点）→ `experiments/m12-dct8/llvm-ir/dct8-neon-seed.ll`
  → `experiments/m12-dct8/imported/machine-ir.json`；
- `kernels/dct8/dct8_verify.cpp`：新增弱符号候选三方对比（oracle/NEON/cand）
  与完整 dump。

## 3. 正确性证据

本地交叉 + qemu，`build/dct8_verify_cand 200000`：

```text
oracle==dct8_c          : 0 mismatch（精确）
candidate==dct8_neon    : 0 mismatch（200000 例 bit-exact roundtrip）
candidate vs C          : 1733 例分歧 = 上游 NEON 同源分歧（0.87%）
```

## 4. 上游 bug 根因（本轮定位，round-0006 独立印证）

`partialButterfly8_neon` 第二 pass 用 `vsub_s16(s0_lo, s0_hi)` 在 **s16 域**
计算 O；当 `|coef[k] - coef[7-k]| > 32767` 时回绕（实测：-33288 →
+32248），而 C 参考在 int32 域计算。pass1 输入 ∈ [-255,255] 不会溢出，
pass2 的 coef 可到 ±32640，随机输入约 0.87% 触发；差异因此是 64 的倍数、
集中在奇数列。最小反例已存档（m12 evidence）。修复方向：pass2 的 O 用
`vsubl_s16` 提升到 s32 后做奇数列点积（下一轮实现并回归）。

## 5. 性能与下一步

roundtrip 只是导入链路验证（与上游 NEON 同性能口径），不宣称收益。下一
轮：实现 C-exact 修复（s32 奇数列路径）+ 指令选择/布局搜索，目标 N1/
920B paired latency 从 0.807×/0.961× 向 1.30× 推进；round-0006 建议落盘
后写 decision.md 并按优先级执行。
