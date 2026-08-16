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
