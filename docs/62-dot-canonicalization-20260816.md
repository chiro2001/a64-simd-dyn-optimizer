# Dot 图规范化：同一算法、多指令实现的统一（2026-08-16）

## 1. 目标

dct16/dct32（以及同类 kernel）的上游实现会用不同指令完成同一个
算法（NEON `vmull/vmlal`、SVE1 `sdot.d`、SVE2 `smullb/smlalb`、
`unpk+svmul`、`s32 mul+saddv`）。本工作把 AGO 的 op DAG 规范化为
**类型化 `dot` 语义节点**，让这些实现成为同一张计算图的不同
lowering，并给出 pass 与指令搜索方案。

## 2. 为什么能统一

### 2.1 数学等价（语义权威）

上述所有指令序列都精确计算同一个整数点积：

```text
dot4(acc, a, b) = acc + a0·b0 + a1·b1 + a2·b2 + a3·b3
```

整数精确性意味着：只要每个乘积和累加不截断、不饱和，不同的指令
序列产生**完全相同的整数结果**。差异只在 lowering 属性：

| 差异 | 是图结构吗？ | 归属 |
| --- | --- | --- |
| 输入类型 s16 vs s32 | 否 | dot 节点的类型参数 |
| 累加宽度 s64 vs s32 | 否 | dot 节点的类型参数 |
| 常数布局（4×s16 打包 vs s32 系数） | 否 | lowering |
| 指令选择（sdot/smullb/vmlal/unpk+mul） | 否 | lowering |
| 稀有回绕（0.000078%） | 否 | 合同族属性 |

### 2.2 合同族是唯一需要裁决的点

- `upstream-exact`：pass2 的 E 链保持 s32，只能用 `mul+saddv`；
- `legacy-internal-exact`：允许把 E 切回 s16 切片走 `sdot.d`，稀有
  回绕（20k 失配 16/20.48M = 0.000078%）由 **TestBenchLite** 裁决。

仓库证据（docs/20 §5.8/§5.9）：用户已放开 legacy 合同族；`legacy
k2-ex` 用 sdot.d 替代 mul+saddv 后 full fused_uop **8292 → 7989
（-303）**，TestBenchLite 5 seed 全 PASS。内部参考 4827 的剩余优势
正是“k2/k4 也走 s16 sdot（saddv=0、mul=32）”。

## 3. 工具实现

### 3.1 `optimizer/ir/dot_ir.py`（新增）

- `DOT_LOWERINGS`：lowering 合法性/代价表（sdot.d / smullb_smlalb /
  vmull_vmlal / unpk_svmul / mul_saddv），含 a/b/acc 类型、ISA、
  合同族、uop 估计；
- `make_dot()`：构造类型化 `dot` 节点（attrs: acc_ty/a_ty/b_ty/
  lowering/lane_owner/legacy_kind）；
- `canonicalize_dot_ops()`：把 `dot_segment`→dot(s16,s16,s64,sdot.d)、
  `mul_reduce`→dot(s32,s32,s32,mul_saddv)、`neon_mul`→
  dot(s16,s16,s32,vmull_vmlal)；
- `legal_lowerings(dot, isa, contract, sve2)`：按目标 ISA + 合同族
  返回合法 lowering 及代价（指令搜索的核心）；
- `select_dot_lowerings(ops, isa, contract, sve2)`：对整张 DAG 的每个
  dot 节点选代价最低的合法 lowering，返回带 lowering 的图 + 报告
  （每节点替代、无合法项标记、总 uop 估计）——即指令搜索方案的
  单点实现；
- `expand_dot_lowering()`：还原 legacy kind，兼容现有消费方；
- `dot_summary()`：按 lowering/acc 统计，供报告。

### 3.2 pass 接入（`optimizer/ir/dct32_rewrites.py`）

- 新增 `REWRITES["canonicalize_dot"]`：对任意 dct32 op DAG 做 dot
  规范化，可组合进现有 rewrite 序列；
- 新增 `dot_lowering_report(ops)`：输出每个 dot 的类型/当前
  lowering 与合法替代，供搜索报告。

## 4. 指令搜索方案

1. **轴定义**：每个 `dot` 节点的 lowering 是一个搜索轴，取值由
   `legal_lowerings()` 按（目标 ISA、sve2 开关、合同族）过滤；
   批量选择用 `select_dot_lowerings()`（按 uop 估计贪心选优）；
2. **与现有机制对应**：`legacy_k2` / `legacy_k4` rewrite 就是
   “pass2 k2/k4 的 dot 从 mul_saddv 切到 sdot.d”的 lowering 选择，
   现在显式化到规范化节点上；
3. **门禁**：upstream-exact 下 mul_saddv 强制；legacy-internal-exact
   下 sdot.d 合法，最终由 TestBenchLite（黄金标准）裁决；
4. **预期收益**：内部参考 4827 vs 当前 best 7190 的差距主要在
   k2/k4 的 s16 sdot 化（-1000+ fused_uop 潜力）；dct16 的
   `dot_segment` 与 `neon_mul` 同样归一后可跨 kernel 复用同一套
   lowering/代价表。

## 5. 使用示例

```python
from dct32_rewrites import apply_rewrites, REWRITES
from dot_ir import legal_lowerings, dot_summary

canon = apply_rewrites(ops, ["canonicalize_dot"])
print(dot_summary(canon))
# dot 节点选 lowering：
for op in canon:
    if op.kind == "dot":
        print(op.attrs["tile_id"],
              legal_lowerings(op, isa="sve1", contract="both"))
# 整图最优 lowering 分配：
canon, rep = select_dot_lowerings(ops, isa="sve1",
                                  contract="legacy-internal-exact")
print(rep["selected"], rep["total_uop"])
```

## 6. 验证

- `optimizer/ir/test_dot_ir.py`：8 用例（legacy→typed 转换、summary、
  sve1/sve2/neon 合法性、合同族过滤、superset、选择器）全 PASS；
- 现有回归：`cd optimizer && python3 -m unittest discover -s ago -q`、
  `python3 -m unittest discover -s tools -p 'test_check_isa_level.py' -q`。

## 7. 后续路线

1. 把 dct32 的 `legacy_k2/k4` 搜索轴改造成规范化 dot 的 lowering
   枚举，跑 `tools/search_plans.py` 验证 fused_uop 向 4827 收敛；
2. dct16/interp/quant 的同构点积子图接入同一 `dot` 节点与代价表；
3. 实机（950/960）验证 legacy lowering 的 TestBenchLite 门禁与周期
   收益；920B 上 v2 已实测指令数最优不转周期（+3~4%），统一的主要
   价值在 SVE2/950/960 结构收益。
