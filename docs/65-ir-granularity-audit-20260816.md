# IR 粒度审计：元素 vs 向量（2026-08-16）

## 1. IR 分层

| 层 | 位置 | 最小单元 | 元素信息 |
| --- | --- | --- | --- |
| AGO IR | `optimizer/ago/ir.py` | 整值 Op | `Shape(elem, lanes, vbits)` |
| LayoutIR | `optimizer/ir/layout_ir.py` | 值 + Tile | `ValueLayout(elem_type, lanes, range_hint, wrap_mode)`；`Tile.lane_owner` |
| Op DAG | `op_ir.Op` + dct16/32 构建器 | 整向量 op | `attrs.lane_owner` / `terms` / `store.lanes` / `slice` |
| MachineIR | `optimizer/ir/machine_ir.py` | 指令 | LLVM `<N x iT>` + shuffle mask（元数据） |
| dot_ir | `optimizer/ir/dot_ir.py` | dot 节点 | `a_ty/b_ty/acc_ty` + `terms` |

## 2. 最小单元评估

**元素（lane）是正确性验证的最小单元，但不是计算图的最小节点。**

已做到（元素可追踪/可验证）：
- `Shape.lanes` / `ValueLayout.lanes` 显式声明值含多少元素；
- `Tile.lane_owner`（output/partial）、store `attrs.lanes` 的 (pass,k,row) 元组、
  dot `attrs.terms` 的元素级乘积项；
- `provenance_report`：dct32 32×32 输出 lane 双射、奇 k 16 项覆盖、round epoch、
  零 scatter；dct16 512 lane 双射——正确性门禁在 lane 粒度闭合。

未做到（元素≠图的最小节点）：
- Op 的 inputs/out 是整值引用，lane 级映射靠 op 语义 + attrs 隐含
  （permute 的 idx 表、dot 的 slice/terms），没有显式 per-lane def-use 边；
- lowering 是向量粒度：16-lane SVE 向量固化（VL=256），VL=128 直接 99.9%
  失配——宽度被写死在 lowering 里，元素信息只是元数据/证明义务。

## 3. 结论与改造路径

VL=128/NEON 迁移的本质是 IR 宽度参数化。第一步（本仓库已实现）：

1. `Shape` / `ValueLayout` 增加 `vscale`（默认为 1）：`lanes` 表达为
   “每 128-bit 的 lane 数 × vscale”，`concrete_lanes(vl_bits)` 按目标宽度
   推导实际 lane 数——宽度成为 lowering 属性；
2. 后续：permute/rev/zip 的索引从“16-lane 常量表”改为 lane 索引表达式
   （`lane i → lane f(i)`），使同一 DAG 可在 VL=128/256/NEON 下重 lowering；
3. dot 节点（`terms` 元素级）可作为把 op DAG 拆到 lane 粒度的起点。

测试：`optimizer/ir/test_ir_width.py`（Shape/ValueLayout 的 vscale 推导与
后向兼容）。

## 4. 第二步已落地：permute 索引 → lane 索引表达式（2026-08-16）

`optimizer/ir/width_expr.py`：符号 permute 名（rev8/rev16/rev32/rev64）
按目标宽度解析为「每 128-bit 段的 concrete lane 索引表」：

- `resolve("rev16", 256)` → 单段 16-lane 全反转（现有 VL=256 lowering）；
- `resolve("rev16", 128)` → identity(low) + rev8(high)，正是 8-lane
  fused 基线（`tools/emit_dct16_vl128.py` 的 rev16 助手）使用的分解，
  即 E = lo + rev(hi) 的对折语义；
- `resolve("rev8", 256)` → [7..0, 15..8]（每段内反转）；
- rev32/rev64 按 128-bit 段推导。

这样同一 permute 节点携带的是「逻辑 lane 映射 f(i)」，concrete 表由
宽度解析器生成，而不是写死在 16-lane 常量里——与 vscale 第一步衔接，
为 op 发射器的 8-lane 重 lowering 提供索引层。

测试：`optimizer/ir/test_width_expr.py`（10 项：各 VL 的 rev8/16/32/64
解析、dct16 op IR 的 leaf/per-row permute 符号覆盖）。

## 5. 第三步已落地：8-lane fused pass1 的宽度无关 DAG（2026-08-16）

`dct16_op_ir.lower_pass1_fused8()`：把已验证的 8-lane fused quarter
（`tools/emit_dct16_vl128.py --pass1 fused`）编码成 op DAG，作为
该 C++ 基线的 IR 规格：

- 行对 E/O 叶子：NEON 8-lane load（lo/hi 两半），高半 rev16
  （`idx="rev8", seg=1`，即 width_expr 的 VL=128 分解）；
- k2 族（2,6,10,14）：sdot.d 作用在合并 s16 EO 上（4 terms/输出列）；
- 偶数 k（0,4,8,12）：vmul/vpadd/vrshrn，`neon_mul` 携带 4 个
  coefficient terms（provenance 现在从 dot_segment/dot_accum/neon_mul
  统一收集 terms）；
- 新增 `dct16_width_provenance(ops, vl_bits)`：所有符号 permute 必须能
  被 width_expr 在目标宽度解析（VL=128/256 均验证）。

门禁：`tools/test_dct16_op_ir.py` 新增 fused8 用例——512 输出 lane
全覆盖、0 scatter、op 数 1424、宽度解析 OK。这是「同一计算图在不同
宽度下可重 lowering」的 DAG 层证明；发射器（8-lane codegen）作为
下一步消费该 DAG。

## 6. 第四步已落地：8-lane codegen 垂直切片（2026-08-16）

`dct16_op_emit.emit_acle(neon8=True)`：消费 `lower_pass1_fused8() +
lower_pass2_fused8()` DAG，用统一的 NEON/SVE-bridge 发射器
（`emit_neon8_ops`）生成完整候选：

- 新增 op 种类：`neon_narrow4`（vmovn s32→s16 4-lane）、
  `neon_combine`（vcombine s16 4+4→8）、`neon_reduce_narrow`
  mode="pair"（k2 族 2 个 s64 部分和 → vmovn+vcombine+vrshrn）；
- `T8ODD16` 常量表（t8_odd 4→8-lane 复制）与 pass2 fused8 DAG
  （`lower_pass2_fused8`，每组现算叶子再消费）；
- 门禁：`-O3 -march=armv8.2-a+sve2` 编译 + QEMU vq=1 20k 差分
  **0 失配**（wrapper 范围 fused 1956 / stack 572）。

**循环回卷已达成计数对齐（2026-08-16）**：`_emit_neon8_looped_pass`
按 tile 结构把 DAG 重新发射成与 C++ fused 一致的四层循环（组 i +
odd/k2 两族 k 循环 + 偶数四行展开）：

| 发射方式 | fused_uop | stack_vector | total | 20k/200k 差分 |
| --- | ---: | ---: | ---: | --- |
| 手写 fused C++ | 1392 | 95 | 1743 | 0 |
| IR 循环回卷 | **1393** | 110 | 1730 | 0 / 0 |

差异仅 1 个 fused_uop（常量表加载位置），基本达成与生产候选同级的
代码质量。修复要点：叶子切片按 tile/row 过滤、pass2 k2 常量
`GT16_S32[(k-2)/4]` 的循环变量映射、偶数区间 store 的 k 具体化。
「同一 DAG → 8-lane 代码」链路现在同时满足正确性门禁与计数对齐。

**多目标重 lowering 已演示（2026-08-16）**：`emit_acle(neon8=True,
neon_dot=True)` 用同一个 fused8 DAG 发射纯 NEON（vmull/vmlal）变体
（`-march=armv8.2-a+dotprod`，objdump 确认 0 sdot）：

| 目标 | 发射方式 | fused_uop | stack | total | 200k 差分 | TestBenchLite |
| --- | --- | ---: | ---: | ---: | --- | --- |
| SVE2 bridge | 手写 fused C++ | 1392 | 95 | 1743 | 0 | PASS |
| SVE2 bridge | IR neon8 | 1393 | 110 | 1730 | 0 | - |
| 纯 NEON | 手写 fused C++ | 1946 | 270 | 2155 | 0 | PASS |
| 纯 NEON | IR neon8+neon_dot | **1941** | 240 | 2174 | 0 | **PASS** |

同一宽度无关 DAG 在 SVE2 与 NEON 两个目标上都达到/超过手写候选的
关键指标——「自动重 lowering」从链路可用推进到生产同级。

**DCT32 同链路覆盖（2026-08-16）**：`dct32_fused8_op_ir.py` +
`dct32_fused8_emit.py` 把同一机制扩展到 dct32（32 行 × 32 k × 2 pass
= 2048 lane；fused8 provenance 全覆盖、0 scatter）：

| 目标 | 发射方式 | fused_uop | stack | total | 200k 差分 | TestBenchLite |
| --- | --- | ---: | ---: | ---: | --- | --- |
| SVE2 | 手写 fused C++ | 8421 | 844 | 11041 | 0 | PASS |
| SVE2 | IR fused8 | **8398** | 1404 | 11435 | **0** | **PASS** |
| 纯 NEON | 手写 fused C++ | 12245 | 1394 | 13909 | 0 | PASS |
| 纯 NEON | IR fused8 | **11910** | 1395 | 13658 | **0** | **PASS** |

IR 版在 fused_uop 上优于手写基线（SVE2 -23、NEON -335），stack 略高
（SVE2 +560）。dct16/dct32 的「宽度无关 DAG → 多目标自动 lowering」
链路全部落地并通过黄金标准门禁。调试中发现的关键差异：dct32 的 k2
族常量是 `g_t32[k][0..7]`（GT32A），不是 dct16 的 t8_odd；k4 族常量
表与 k2 的 s32 表需区分（GT32S32A4）。

**IR 生成候选实机复核（2026-08-16）**：`AGO_IR_DCT=1` 接入注入链
（`build_preload_so.py` 选 `best_ir_sve8/neon8.cpp`），两机 LD_PRELOAD
A/B：

| 机器 | 目标 | kernel 级（原→IR） | 30f E2E 中位 | bit-exact |
| --- | --- | --- | --- | --- |
| N1 | 纯 NEON | dct16 -18.2%、dct32 -6.9% | ≈0（噪声内） | md5 一致 |
| 710 | SVE2 | dct16 -15.4%、dct32 **-13.6%**（手写 -6.8%） | ≈0（同手写） | md5 一致 |

结论：IR 驱动候选实机 bit-exact，kernel 周期与手写同级或更优（710
dct32 翻倍），E2E 与手写候选在噪声内一致——「自动重 lowering」链路
从计数对齐推进到实机等效。
