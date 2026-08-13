# round-0013 工具路线与实验排序

## 0. 口径和证据边界

本文把两种“E1”分开：

- **E1-R（rewrite-driven rediscovery）**：搜索入口是规范 Plan 和原子
  rewrite，候选端到端编译、差分、trace；允许当前 grouped emitter 作为
  lowering 实现。
- **E1-B（backend-independent blind discovery）**：rewrite 的语义必须真正
  决定 op 图和 codegen，不能由一个预写的 v3/v3.1 C++ 块隐式提供机制。

【事实】`tools/search_plans.py` 的当前漏斗为 18 个语义计划 → 18 个
canonical 计划 → 12 个源码 → 12 个实测候选；best 为 3962，20k
upstream-exact 为零分歧且零 scatter。`optimizer/ir/layout_ir.py` 的
`lower()` 调用 `emit_grouped()`；`emit_grouped()` 再按五个 lowering 字段
拼接 `_grouped_*_cpp` 块。`verify_layout()` 和 `check_source()` 已经提供
VL/ISA/round/no-scatter 及块级指令族检查。

【推断】上述证据足以证明搜索管线不是在读取 manifest 的 `layout=v3` 字符串
来排名，且 3962 可以被 rewrite 子集重新测到；但不能证明任意 Tile、lane
ownership 或 ConstantMap 已驱动逐 op 生成。一个可合法改变 `Tile.row_group`
而 `lower()` 输出不变的计划即可说明这一点。

## 1. E1 验收：确认、反驳与分级 Go 判据

| 项目 | 当前判定 | 下一批处置 |
| --- | --- | --- |
| “搜索空间由 rewrite 定义” | **E1-R 确认**；`all_plans()` 从 spec Plan 应用原子 rewrite，路径不携带 `layout` 预设。 | 保持为回归门；增加禁止调用复合 preset 的测试。 |
| “实测重发现 3962” | **确认（窄义）**；每个源码候选均编译、20k 差分、true-dynamic，且 v3.1 既有 200k/Lite 证据。 | 记录为 `rewrite-driven`，不要改写成“从零综合”。 |
| `lower` 仍用 C++ 块 | **严格 E1-B 的硬缺口**；当前 lowering 只消费少量字段，tiles 不是代码生成输入。 | 下一批至少完成一个全 kernel 的 op-level vertical slice；旧 C++ 只能作 oracle/兼容 backend。 |
| canonical key 是否 codegen 前去重 | **局部已完成、全局未完成**：`search_plans` 在 `lower()` 前调用 `canonical_key()`；通用 `search_sve2_layouts` 先 `emit()` 后仅按源码 hash 去重。当前 18→18 也没有展示 canonical 压缩收益。 | 把 canonical-plan 阶段移入共同主驱动；保留 lowering 后源码 hash 作为第二层别名去重。 |
| tiles 语义是否逐 op 化 | **未完成**；`check_source` 是 pass32 模板体的正则/指令族计数，不是 lane、系数来源、地址双射或 def-use 证明。 | 对 E1-B 必须覆盖；全量 k-family、逐寄存器调度证明可延后。 |

因此本轮建议写成：**E1-R = PASS；E1-B = CONDITIONAL/尚未通过**。若项目
验收声明只要求“rewrite 定义的候选能重现已知计数”，可以确认；若声明包含
“盲重发现不依赖手写实现”，必须等 op backend 证据。

## 2. 下一轮实验（按信息增益/风险排序）

### #1（最高收益，中风险）：DCT32 op-level backend 垂直切片 + 盲重发现

**目标。** 从 `dct32_spec_plan()` 生成 typed OpIR（至少覆盖 leaf、odd
segment dot、pass1-k2 slice、round/narrow/store，并为 k4/k0 提供同一接口），
让每个 Tile、ConstantMap、MemoryMap 和 RoundBarrier 都有实际消费者。先用
当前 grouped emitter 作为字节/计数 oracle，再让搜索 finalist 只走 OpIR backend。

**实现路线。**

1. 定义最小 op 集：`load/rev/pack/dot_segment/mul_reduce/accumulate/
   round_shift/narrow/pack_store`；每个 op 带 `op_id`、输入输出
   `ValueLayout`、`round_epoch`、`tile_id` 和 proof-obligation 引用。
2. `lower(plan, backend="op")` 先产生可解释的 op DAG，再由 ACLE/asm emitter
   发射；旧 `lower(..., backend="grouped")` 只用于回归对照。
3. 为搜索增加 held-out 配置：搜索模块不得导入/调用 `emit(layout="v3")`
   或 `pass_grouped_cpp`；v3.1 的标签、源码和计数只在测试 oracle 中出现。
4. 对完整候选比较最终输出、pass1 已舍入中间矩阵、op provenance 和动态
   指令族；只有全部覆盖的候选才标 `blind`。

**Go/风险。** Go 是 OpIR 路径在不引用复合块的情况下得到
`fused_uop <= 3962`、200k 0 mismatch、Lite 多 seed PASS、零 scatter，且
source/object 的 op 覆盖率 100%。风险是寄存器分配和编译器重排会使第一版
计数偏高；这不应通过放宽语义门解决，先作为缺失 lowering/调度信息反馈。

### #2（高杠杆，低至中风险）：合并两个搜索驱动并做多 kernel 试点

**目标。** 在 DCT32、DCT16、interp8 path-A 三个适配器上使用同一分层引擎，
验证 canonical/proof/budget/cache 不是 DCT32 特例。

**共同接口。** 建议增加内部 `SearchAdapter`（名称可调整）：

```text
spec(manifest, target, contract) -> PlanFamily
enumerate(plan_family)          -> (Plan, provenance)
lower(plan, backend)            -> Artifact(source/object, op_map)
verify(plan, artifact)          -> ProofReport
measure(artifact, gate_profile) -> Result
```

manifest 组合先由 `LegacyPlanAdapter` 转成规范化 Plan；DCT32 使用 typed
LayoutIR，DCT16/interp8 初期可标 `legacy-plan`，但仍走同一结果 schema。

**统一漏斗。**

```text
manifest/spec
  -> semantic ProofReport
  -> canonical_key（codegen 前）
  -> 静态资源/可行性 Pareto
  -> lower + source/object ProofReport
  -> 2k quick diff
  -> 20k + true-dynamic
  -> 200k + Lite/TestBench finalist
```

所有阶段都保留 `semantic_fingerprint` 的至少一个代表，不能让全局 beam
删掉某一 k-family。当前 60 秒预算内可继续穷举；超过预算后才按指纹分层
beam/Pareto。不可执行的 SVE2p3 候选进入 `build-only`/`semantic-only`，不
混入动态排名。

**缓存与去重。** canonical key 只包含规范化的 target features/VL、合同、
round epoch、tiles/lane map、constant/address map 及 schema 版本；排除
rewrite 顺序、标签和函数名等非语义字段。缓存键至少为
`kernel|contract|target|compiler_fingerprint|backend_version|plan_key`。
lower 后仍按源码 hash 去重，并保留“多个 Plan 映射同一源码”的别名报告。

**试点回归。** 要求 DCT16 的 manifest prune 计数与既有结果不变、DCT32
仍发现 3962、interp8-A 仍为 127；再接入 `pipeline.py`。这项工作比先扩充
更多 DCT32 轴更能暴露接口、缓存和合同泄漏问题。

### #3（高潜在收益，高风险）：`row_group=8` 双 accumulator 调度探针

**目标。** 判断 8 行合并是否带来真实信息/指令收益，而不是假定“行数翻倍
就会变快”。VL=256 时一个 s64 向量只有 4 个 lane，8 行必须使用两个
4-lane accumulator bank，或分时复用；当前 verifier/emitter 明确只支持
row_group 1/4。

**两阶段实验。**

1. 先做纯静态 scheduler：为每个 bank 分配 `accumulator_policy={two-bank,
   serial-bank}`，推导常量生命周期、最大 live Z/P/GPR、round/narrow/store
   地址；无法证明寄存器预算或出现 scatter 的计划在 codegen 前拒绝。
2. 仅对可行计划生成一个 8-row OpIR 候选，与 4-row v3.1 做同编译器、同
   VL、同 corpus 对照；分别报告 dot/permute/narrow/load/store、spill、
   `movprfx`、fused_uop，而不是只报总数。

**成功定义。** 200k upstream-exact 0、Lite PASS、零 scatter、无未声明
spill，并在至少一个资源指标上优于 4-row；若计数持平或 spill 增长，记录为
“已证明不可盈利/需新调度”，不阻塞 E1。不要把内部聚合指标当作 8-row
正确性或收益 oracle。

## 3. `ProofReport` 驱动剪枝的细化

当前 `check_source()` 返回的 `expected/actual/mismatches` 只够块级回归。建议
保持兼容包装，同时引入可序列化报告：

```text
ProofReport {
  plan_key, kernel, contract, target, level, status(PASS/REJECT/UNKNOWN),
  obligations[{id, kind, scope, assumption, status, evidence}],
  lane_map, range_facts, round_barriers, constant_coverage, address_bijection,
  expected_ops, actual_ops, provenance_coverage, scatter_count,
  resource_facts(max_live_z/p/gpr, spill_risk), prune_reasons, counterexample
}
```

报告分四级：`plan`（纯语义）、`lowering`（op→source）、`object`（反汇编）、
`trace`（实际执行）。每级只声明自己能证明的性质：正则计数不能替代 lane
等价；QEMU trace 不能替代实机 cycles。

剪枝规则：

- `REJECT` 的硬失败（VL/ISA、range、round epoch、地址非双射、scatter、
  未覆盖 op）立即剪枝，并累计 reason code；
- `UNKNOWN`（编译器 liveness、真实端口、SVE2p3 执行能力）进入较低预算
  的 compile/measure 阶段，不当作失败；
- 只有在同一 target/contract/semantic fingerprint 下，且有静态证明的
  dominance 才能删除计划；动态相关性只生成待审核建议；
- 每条新规则保存正例（v3.1、DCT16 best、interp8-A）和可重放反例，避免
  把一次随机 mismatch 误升级为普遍禁令。

`ProofCertificate` 应补充 obligation id、输入事实和依赖 rewrite；报告需
能指出“哪一个 tile/op/barrier 首先不满足”，而不是只给总 mismatch 数。

## 4. 明确延后项

【事实】interp8 path-B 的 SVE2p3 canary 在当前 QEMU SIGILL；【建议】除非有
支持 SVE2p3 的执行器，否则只做语义解释器/静态发射，标 `unexecuted`。
【建议】NEON→NEON 同算力消融用于校准 load/调度成本，优先级低于上述三项；
没有目标机 paired cycles 时不宣称性能收益。完整跨 kernel op IR、任意
interpass retile、学习式 cycles 模型均在 E1-B 和共同驱动稳定后再做。
