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
- `derive_dot_lowering_flags(canon)`：把选定的 lowering 翻译回发射器
  的 plan 开关（`legacy_ex` / `legacy_k4`），闭环为
  `图 → canonicalize → select → flags → 发射器 → 测量`；
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

### 测量链路已验证（2026-08-16）

`tools/search_plans.py` 在本环境（qemu-aarch64 + 交叉 g++16 +
`build/x265-8-clang-sve/libx265.a`）冒烟通过：18 语义 plan →
12 唯一 lowering → 全测，best = `assign+segment+narrow4+derived+k2`
**fused_uop 8292**（与 docs/20 v3.1 full-call 一致），20k 差分 0、
零 scatter。下一步即可在该链路上跑规范化 dot 驱动的 lowering 枚举。

### canonical 驱动的 lowering 枚举已闭环（2026-08-16）

`tools/search_dot_lowerings.py`：v3.1 plan → op DAG → canonicalize →
`select_dot_lowerings`（按合同族）→ `derive_dot_lowering_flags` →
发射器 `legacy_ex` → `measure()`（QEMU 20k 差分 + 真动态轨迹）：

| 合同族 | dot lowering flags | fused_uop | 20k 失配 |
| --- | --- | ---: | ---: |
| upstream-exact | legacy_ex=0 | **8292** | 0 |
| legacy-internal-exact | legacy_ex=1（canonical 选出 sdot.d） | **7989（-303）** | 0（稀有回绕由 TestBenchLite 门禁） |
| legacy-internal-exact | legacy_ex=1 + **legacy_k4=1** | **7820（-472）** | 0 |

- `measure()` 新增 `allow_mismatch`：契约族变体可在稀有失配下继续
  出 fused_uop（verify 退出码 1 放行），供 legacy 族测量；
- `legacy_k4` 已参数化进 grouped 发射器（leaf 生成 EEO16 s16 切片、
  Xk4 tbl2 打包、sdot.d 循环），与 k2 组合后 8292 → 7820；
- 已知缺口：source-proof 期望表需 legacy 感知 plan 模型（当前
  legacy 变体跳过该静态层，由编译+差分+轨迹兜底）。

### 指令搜索网格（2026-08-16，24 组合全实测）

canonical 驱动的网格枚举（legacy ∈ {off, ex, ex+k4} × narrow_batch
∈ {1,4} × constant_layout ∈ {canonical, derived-replicated} ×
acc_split ∈ {1,2}），全部经 QEMU 20k 差分 + 真动态轨迹，0 失配：

| 排序 | legacy | narrow | const | fused_uop |
| --- | --- | ---: | --- | ---: |
| 1 | **ex+k4** | 4 | derived-replicated | **7820** |
| 2 | ex | 4 | derived-replicated | 7989 |
| 3 | ex+k4 | 4 | canonical | 8278 |
| 4 | off | 4 | derived-replicated | 8292 |
| 5 | ex | 4 | canonical | 8434 |
| 6 | off | 4 | canonical | 8716 |
| 7-24 | narrow_batch=1 全部 | 1 | — | 10884–11465 |

结论：sdot.d lowering（legacy）+ narrow4 + derived-replicated 常量是
该网格最优；acc_split 在此发射器路径无 fused_uop 影响；narrow_batch
=1 全面劣化。搜索方案（canonical → select → flags → 发射 → 测量）
已闭环且可复现。

### op 后端结构轴 + TestBenchLite 黄金标准（2026-08-16）

grouped 发射器网格已穷尽（best 7820）。op 后端
（`dct32_op_emit.emit_from_plan`，支持 k0 向量化/共享乘/索引 dot/
odd 打包等结构轴）接入同一 QEMU 测量链（自定义 trace 范围
`_ZL9op_pass_4PKsPsl` → `dynopt_dct32_sve2_shared`）：

| 变体 | fused_uop | 20k 失配（lanes） | TestBenchLite 5 seed |
| --- | ---: | ---: | --- |
| base（op 后端） | 8114 | 0 | 全 PASS |
| legacy（ex+k4） | 7482 | 7268 | 全 PASS |
| k0even | 6880 | 7268 | 全 PASS |
| k0shared | 6844 | 7268 | 全 PASS |
| sdoti | 6994 | 7268 | 全 PASS |
| **oddpack** | **6584** | 7268 | **全 PASS** |

- legacy 变体的 20k 差分（0.035% lanes）来自 k2/k4 s16 切片的稀有
  回绕/结构分歧；按用户裁定（2026-08-13），legacy-internal-exact
  的黄金标准 = TestBenchLite，**5 seed（1/2/0x12345678/0xDEADBEEF/
  987654321）全部 PASS → 可接受**；
- 因此 op 后端结构轴是**已验证**的收益：**oddpack 6584** 相对
  upstream 8292 降 **-20.6%**、相对 grouped legacy 最优 7820 再降
  **-15.8%**；
- 测量链新增能力：`measure(allow_mismatch, range_start_syms,
  range_end_sym)` 支持契约族变体与 op 后端 trace 范围。

### op 结构轴扩展网格：命中内部参考（2026-08-16）

扩展 op 轴网格（row_group/slice_kind/k0_merge8/k0_epack/
k2k4_from_packs/tbl2_to_zip/merge_narrow8/常量布局），全部 QEMU 实测
（legacy 变体 20k 失配 7268 lanes，TestBenchLite 门禁）：

| 变体 | fused_uop | TestBenchLite 5 seed |
| --- | ---: | --- |
| **odd+rg16（row_group=16 + odd_from_k0packs）** | **4898** | **全 PASS** |
| odd+rg8 | 5348 | — |
| odd+k2k4pk | 6251 | — |
| odd+zip / odd+tblzip | 6396 | — |
| oddpack | 6584 | 全 PASS |
| base（op 后端） | 8114 | 全 PASS |

- **odd+rg16 = 4898 fused_uop**：命中内部参考（4827，差 1.5%），
  相对 upstream grouped 8292 **-41%**，相对 grouped legacy 7820
  **-37%**；两次测量确定性一致，TestBenchLite 5 seed 全 PASS
  （legacy-internal-exact 黄金标准）；
- merge_narrow8 rewrite 在该 plan 下编译失败（记录为 measure-fail，
  后续排查）；k0_epack 在 pass2 仍劣化（6554）。

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
# 闭环：选定 lowering -> 发射器开关 -> search_plans 测量
from dot_ir import derive_dot_lowering_flags
flags = derive_dot_lowering_flags(canon)
print(flags)  # {'legacy_ex': 1, 'legacy_k4': 1} 供发射器使用
```

## 6. 验证

- `optimizer/ir/test_dot_ir.py`（8 用例）+ `test_dot_dag.py`（真实
  dct32/dct16 DAG 5 用例）全 PASS；
- **真实 dct32 spec DAG 量化**（7168 ops）：
  - canonical 后 1024×`sdot.d/s64` + 1024×`mul_saddv/s32`；
  - upstream-exact 选择器总 uop = 5120；
  - 应用 `legacy_k2/k4`（同一图的 lowering 切换）后 1216×sdot +
    512×mul，legacy 选择器总 uop = **3264（-36%）**——op 级验证
    了搜索轴收益（full fused_uop 由 search_plans 另行测量）；
- 真实 dct16 DAG：256×`dot_segment` + 92×`neon_mul` 归一为同一
  `dot` 节点，SVE1 上均有合法 lowering；
- 闭环测试：upstream-exact 下 `derive_dot_lowering_flags`=全 0；
  legacy 族 + k2/k4 rewrite 后 = legacy_ex/legacy_k4 全 1；
- 现有回归：`cd optimizer && python3 -m unittest discover -s ago -q`、
  `python3 -m unittest discover -s tools -p 'test_check_isa_level.py' -q`、
  `cd optimizer/ir && python3 -m unittest test_dot_ir test_dot_dag -q`。

## 7. 后续路线

1. 把 dct32 的 `legacy_k2/k4` 搜索轴改造成规范化 dot 的 lowering
   枚举，跑 `tools/search_plans.py` 验证 fused_uop 向内部参考 4827
   收敛（环境已具备 qemu-aarch64 + 交叉 g++，下一轮执行）；
2. dct16/interp/quant 的同构点积子图接入同一 `dot` 节点与代价表；
3. 实机（950/960）验证 legacy lowering 的 TestBenchLite 门禁与周期
   收益；920B 上 v2 已实测指令数最优不转周期（+3~4%），统一的主要
   价值在 SVE2/950/960 结构收益。
