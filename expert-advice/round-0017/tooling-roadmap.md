# Round 0017 tooling roadmap

## 目标与原则

目标不是让搜索“看到 spill 后再祈祷另一个 flag 会更好”，而是在三层都能
解释压力来源：

```text
semantic/op DAG
  -> region 划分 + pressure-aware schedule
  -> register allocation / planned spill
  -> assembly/object 的实际 stack traffic
  -> dynamic MCA + NP1/920B width lower bound
```

以下均为建议路线，本轮没有修改源码。标记沿用 `summary.md`：**[事实]**、
**[推断]**、**[待验]**。

## P0：先让现有 ACLE 搜索能可靠比较编译器 profiles

### P0.1 build fingerprint 与缓存隔离

**[事实]** `search_sve2_layouts.py` 当前验证缓存键是
`contract | source_hash`，源码去重也只看 source hash。若把编译器或 flags
加入搜索轴，相同源码的 GCC/Clang、O2/O3、greedy/PBQP 会被错误去重或复用
旧 counts。

在引入 flag 轴之前，定义：

```json
{
  "source_sha256": "...",
  "contract": "upstream-exact",
  "backend": "acle",
  "compiler_path": "/usr/bin/aarch64-linux-gnu-g++",
  "compiler_version": "16.1.0",
  "target": "aarch64-linux-gnu",
  "march": "armv9.4-a+sve2p1",
  "msve_vector_bits": "256",
  "opt_flags": ["-O3", "-flive-range-shrinkage"],
  "emitter_version": "git blob/hash"
}
```

`build_id = sha256(canonical_json(fingerprint))` 应进入：tag、object 名、cache
key、results.json。源码 canonical dedup 只能在同一个 build fingerprint 内
进行。编译器 profile 推荐由 manifest 或独立 `compiler_profiles` YAML 声明，
不要继续扩张 `candidate_opt()` 的 if/else。

建议 profiles：

- `gcc16-sdot-o3-control`
- `gcc16-fixed256`
- `gcc16-live-shrink`
- `gcc16-pressure1`
- `gcc16-o2-presched`
- `clang22-greedy-control`
- `clang22-fixed256`
- `clang22-pbqp`
- `clang22-greedy-deep`
- `clang22-ilpmin`

**[事实]** `SDOT_COMPUTES` 当前没有包含 emitter 已支持的
`sdot-s32-pair`。如果以后重放 pair，现状会错误地给它选择 SVE2/O2，并走
不修复 `.byte` 的统计路径。compute capability 应从枚举元数据推导
`march/opt/trace_fix`，而不是维护第二份手写 tuple。

### P0.2 静态 spill report

在 correctness 之前或 2k 短门之后，解析候选 object 的目标函数范围，生成
独立报告：

```json
{
  "frame_bytes_fixed": 0,
  "frame_vl_units": 0,
  "callee_save_gpr": 0,
  "callee_save_vec": 0,
  "spill_ldr_z": 0,
  "spill_str_z": 0,
  "spill_ld1_sp": 0,
  "spill_st1_sp": 0,
  "spill_addr_ops": 0,
  "distinct_stack_slots": 0,
  "stack_vector_window32_max": 0,
  "planned_stack_load": 0,
  "planned_stack_store": 0
}
```

实现要点：

1. 把 `[sp, ...]` 的 `ldr/str zN`、`ld1*/st1*` 与普通 input/output memory
   分开；计 `addvl/subvl/rdvl/cntb` 等 spill frame 地址开销。
2. callee-save 与主体 spill 分开。直接 asm 若入口保存 `d8-d15`，那是 ABI
   成本，不应伪装成 allocator spill。
3. scalar store 模式已有算法性 `o[][]` 栈 roundtrip；直接 asm 以后还可能
   有 planned E/O buffer。emitter 应输出 stack-slot provenance，报告工具按
   offset 将 planned slot 与未知 allocator slot 分栏。
4. sdot object 可用 objdump 正确识别，QEMU `.byte` 问题不影响这一步。

这一步不替代现有 true-dynamic `stack_vector`；它用于低成本筛选和解释
“为何 stack_vector 变化”。

### P0.3 shortlist 与 hard guard

当前代理执行顺序先按 fused 排序，再只给 `ok[:N]` 跑 MCA/cost/cp/lite。
改为生成并集：

```python
shortlist = union(
    top_n(fused_uop),
    top_n(predicted_spill_uops),
    top_n(actual_stack_vector),
    pareto_frontier(fused_uop, stack_vector, peak_live_z, vector_lb),
    risk_rows(fused_improves=True, pressure_worsens=True),
)
```

MCA 结果出来后才做最终 eligibility：

```python
eligible = (
    passed_20k
    and lite_pass
    and mca_cycles is not None
    and mca_cycles <= incumbent_mca_cycles
    and (stack_vector <= incumbent_stack_vector
         or mca_cycles < incumbent_mca_cycles)
)
```

`fused_uop`、MCA、vector_lb 互相矛盾时保留 Pareto 候选，不强行宣称一个
winner。`consensus_rank` 可用于展示，但不能跨过 hard guard。

**[事实]** 当前 consensus 的 `rank()` 会给数值相同的项不同位置 rank，
包括所有 PASS 的 lite 值；这会让枚举顺序影响平均 rank。改用 average/dense
tie rank，并在排序末尾使用稳定 tag 作为纯展示 tie-break。

## P1：建立 emitter 级 pressure IR

### P1.1 最小 IR

不要直接在 Python 字符串上猜 live range。将 IDCT32 lowering 分成：

```python
Value(
    id, regclass="Z|P|GPR", elem_bits=16|32|64,
    remat=None|"zero"|"ptrue"|"index"|"const_load",
    fixed_regs=None,
)

Op(
    id, kind, defs, uses,
    latency_class, resource_class,
    memory={"kind": "none|load|store", "base": ..., "range": ...},
    constraints={
        "tied": [(def0, use0)],
        "early_clobber": [def0],
        "low_z_use": [use1],
        "bundle_next": False,
    },
)

Region(stage, chunk, k_group, ops, live_in, live_out)
```

最低限度必须能表达：

- SVE Z、predicate P、GPR 是不同 register class；
- `sdot` accumulator 的 read-modify-write tie；
- indexed dot 的 `Zm` 编码限制；
- predicated destructive op 与 `movprfx` bundle；
- load/store 精确 lane footprint，借此在 codegen 前发现 zip32 的 16-lane
  over-read；
- 纯常量/zero/predicate/index 可 rematerialize；
- memory alias：`src`、`coef`、`dst`、constant table、planned scratch。

对仍保留在 ACLE 中的 inline load，IR 的 memory effect 必须落实为精确的
asm memory operand；只有无法枚举 footprint 的块才退化为 `"memory"`
clobber。`volatile` 只保证该 asm 有副作用，不能替代内存依赖描述。

### P1.2 liveness report

给固定 schedule 做 backward dataflow，输出：

- `live_before/live_after`；
- `peak_live_z/p/gpr` 及发生 op；
- `live_area = sum(live_count)`；
- `overcommit_area_K = sum(max(0, live_Z-K))`，K=24/28/32；
- 每个 value 的 `[def,last_use]`、holes、use count、next-use distance；
- chunk/k-group 边界仍活跃的值；
- 按类别拆分的 peak：input rows、D packs、constants、accumulators、butterfly、
  transpose。

固定顺序的 live interval 图是 interval graph，最大同时活跃数就是该顺序所需
寄存器数的下界。它不能证明所有合法 schedule 都会 spill，但能立即淘汰
当前顺序明显不可能的候选。

### P1.3 cheap allocation simulation

搜索内环用 hole-aware linear scan：

1. active 按 interval end 排序；
2. 无空闲寄存器时先尝试 rematerialization；
3. 其次在当前值和 active 中选择 next use 最远、动态 spill cost 最低者；
4. 在 use 前 split/reload，而不是整段反复 store/load；
5. 为 fixed/low-register constraint 预留或交换寄存器；
6. 输出插入后的 spill load/store、slot、critical reload edge。

建议 spill cost：

```text
store_cost(if dirty)
+ sum(reload_cost at remaining uses)
+ critical_edge_penalty(reload -> accumulator consumer)
- rematerialization_credit
```

不要只用 interval length。长寿命常量很适合 rematerialize；长寿命 sdot
accumulator 若被 spill，会在每个 read-modify-write 点形成最坏的 store/reload
链。

在 K=24、28、32 各跑一次：

- K=24 代表不碰 base PCS 的 d8–d15 callee-save；
- K=32 代表 wrapper 一次保存 d8–d15 后内部使用全部 Z；
- K=28 是给额外 scratch/约束留余量的稳健排序点。

### P1.4 top-candidate coloring

对 cheap frontier 的少量候选建立 Z/P 两张 interference graph，运行
optimistic Briggs/Chaitin coloring：

- simplify degree < K；
- 保守 coalesce tied copy/movprfx；
- spill priority 使用上面的动态/critical cost；
- select 阶段失败则 split 后局部重跑；
- fixed/low-register operands预着色。

若 coloring 相对 linear scan 不能减少实际 spill ≥10%，就不应把它放进
全搜索内环。IDCT32 是大直线 DAG，通常 region 划分与 schedule 的收益会
大于 allocator 算法之差。对无额外约束的单直线 interval graph，只要
`peak_live <= K`，linear scan 已能做到无 spill；coloring 不能突破这个
峰值下界，其价值主要来自预着色、tie/coalesce 和 split 选择。

## P2：IDCT32 的 region 与 schedule 搜索

### P2.1 计算方向轴

当前 emitter 是 input-resident：先装所有 32 行，再让 D pack/累加器长时间
存活。引入互补的 accumulator-resident 方向：

```text
for k_group in groups(k_block):
    init active accumulators
    for row_pair in required_pairs:
        load two rows
        zip D
        for k in active group:
            load C just in time
            sdot acc[k], D, C
        kill rows, D, C
    lower/consume butterfly outputs
```

建议首轮轴：

| 轴 | 值 | 含义 |
| --- | --- | --- |
| `k_block` | 4, 8 | 更小块少活跃、更大块少重复 input load |
| `z_budget` | 24, 28, 32 | ABI/分配预算 |
| `butterfly` | `materialize`, `inplace` | control 与立即消费版本 |
| `phase_buffer` | `none`, `E`, `O` | 在不可同时容纳时，用一次 planned store/load 替代不受控反复 spill |
| `load_ahead` | 0, 1, 2 | load latency hiding window |
| `allocator` | `linear`, `color-top` | coloring 只用于 top |

不再搜索跨 chunk 的 `pair` 并发；已有反例已说明其压力成本。常量共享只允许
发生在同一个已受 z_budget 约束的 k-group 内。

### P2.2 两遍蝶形/累加器分组

有三种合法结构，应由代理而非直觉裁决：

1. **单组立即合成**：对一个最终 k-group 同时计算所需 O 与 even subtree，
   原地形成 `E±O` 并 store。load 较多、planned spill 为零，是首选。
2. **E phase buffer**：先按组算 E，顺序写入小的连续 scratch；再算 O，
   每个最终输出只 load 一次 E 后合成。它增加确定的 1 store+1 load，却可把
   峰值严格压低。
3. **O phase buffer**：对 O 重用更重要时反向处理。由实际 load/port/MCA
   决定，不预设赢家。

关键是 planned buffer 的每个值最多 store/reload 一次，且 provenance 可见；
这通常优于 allocator 在长 accumulator interval 中多次 eviction。

### P2.3 zip32 写回融合

把当前：

```text
32 x t/u live -> 32 x n live -> 16 x w live -> uzp tree -> store
```

改为：

```text
produce final output pair
  -> qrshrnb/uzp1
  -> splice tied to dead n0
  -> keep one w
repeat 16 times
  -> 16-register uzp tree (+2 scratch)
  -> contiguous store immediately
```

如果 compute 分组仍不能在生成 16 个 `w` 前释放累加器，可把 16 个 `w`
写入一个明确的 16×VL scratch，再由独立 transpose helper 读取；这个 control
虽然增加 32 次 planned memory op，却能回答错误是否由高 pressure/movprfx
触发，并可能仍少于当前 compiler spill。

## P3：真正的直接 `.S` backend

### P3.1 澄清现有 backend

**[事实]** 当前 `search_sve2_layouts.py --backend asm` 调用
`bootstrap_cpp()`，本质是把 ACLE C++ 先交给编译器生成 `.S`，再用 GNU as
重装；它不会绕过编译器寄存器分配。新 backend 应单独命名为
`asm-direct`，输入上面的 allocated MachineIR，而不是复用 bootstrap 路径。

建议流水线：

```text
IDCT32 Plan
 -> Op DAG legality/footprint verify
 -> region partition
 -> ASAP/ALAP + pressure-aware list schedule
 -> liveness
 -> linear scan / coloring
 -> remat + planned spill insertion
 -> affected region reschedule
 -> allocation verifier
 -> movprfx bundle verifier
 -> ABI-aware assembly printer
 -> GNU as + objdump round-trip verifier
```

### P3.2 scheduler 评分

ready 指令选择可用词典序，而不是一开始拟合复杂权重：

```text
1. 不允许 live_Z 超过 hard budget（若有合法 ready choice）
2. 最大化本条杀死的 last uses - 新增长寿命 defs
3. 不延误 critical op 超过其 ALAP slack
4. 选择能填目标资源空槽的 op
5. 控制 load 提前距离
6. stable op_id tie-break，保证可复现
```

当所有 ready choice 都会超预算时，记录 unavoidable frontier，并在 region
partition/phase-buffer 层处理；不要让 scheduler 悄悄把问题推给 allocator。

### P3.3 destructive op / `movprfx`

为每条 destructive op 建立 machine constraint：

```text
preferred: dest == dead source0 && dest != all other live sources
fallback:  movprfx dest, source0 ; consumer dest, ..., source1
```

fallback 两条是一个 scheduling/RA bundle。打印后重新解析 assembly，硬验：

- 两条物理相邻；
- element suffix 与 predicate 兼容；
- prefix destination 未与仍需的其他 source 冲突；
- assembler 没有 unpredictable movprfx warning；
- `vector_fused` 只在上述硬验通过时扣除 prefix。

### P3.4 wrapper/private ABI

建议形状：

```text
dynopt_idct32_sve2_shared:       # base C ABI, pointer/scalar args
    save LR / used callee GPR
    optionally save d8-d15 once
    call local stage/chunk helpers; no Z value crosses a call
    restore d8-d15 / GPR / LR
    ret

.Lstage_chunk_private:           # private convention, leaf
    may clobber agreed Z/P/GPR set
    ret
```

需要同时生成 machine-readable clobber/ABI metadata，供 verifier 检查。SP
始终 16-byte 对齐；无 AArch64 red zone 假设。若未来改用 variant PCS，另建
profile并验证 z8-z23/p4-p15 的 scalable preserve，不能与 base PCS 混用。

## P4：代理与 MCA 的校准

### P4.1 新的 cheap pressure score

不要立即把所有量压成一个不可解释的模型。保留原始字段，再提供只用于
shortlist 的单调 score：

```text
pressure_risk =
    a * overcommit_area_28
  + b * linear_scan_reload
  + c * linear_scan_store
  + d * critical_reload_edges
  + e * live_across_chunk_boundary
```

用以下已知点做方向校验，而非过拟合：

- volatile C：常量跨 chunk liveness 消失，ldr/str 大幅下降，必须显著降
  pressure_risk；
- pair：常量 load 减半但累加器并发翻倍，pressure_risk 必须上升；
- split：链变短但 accumulator 数增加，pressure_risk 应上升；
- current scatter incumbent：作为归一化 1.0。

若 proxy 连这四个顺序都不能复现，禁止用于剪枝，只展示原始字段。

### P4.2 post-compile resource lower bounds

`optimizer/analysis/cost.py` 的 `cycles_lb=max(resource classes, frontend)`
是吞吐下界，不表达 reload dependency。保持该含义，不要把它冒充 MCA；新增：

- `stack_load_lb = spill_loads / load_rate`；
- `stack_store_lb = spill_stores / store_rate`；
- `spill_addr_frontend_lb`；
- `reload_cp_lb`：从 reload 到下一 consumer 的 load latency edge；
- `useful_vector_lb` 与 `spill_vector_lb` 分栏。

NP1/920B 仍输出两个 target。NP1 的 SVE 4×256 与 NEON 4×128 宽度门是
1276.75 cycles；920B 同宽，只作保守结构报告。最终排序仍使用修复后的完整
动态流 MCA，尤其 scatter 静态 MCA 已被证实高估 61%。

## 实施顺序与退出条件

| 阶段 | 交付 | 估计工程量 | 退出/升级条件 |
| --- | --- | ---: | --- |
| P0 | build fingerprint、compiler profiles、static spill report、MCA union shortlist/hard guard | 0.5–1 天 | pair 反例不会再被 fused 单指标选中；同源码不同 flags 不命中同一 cache |
| P1 | pressure IR、footprint verifier、liveness + K=24/28/32 linear scan report | 1–2 天 | volatile/pair/split 四点方向正确；能定位 peak-live 的具体 op/category |
| P2 | k_block/inplace/phase-buffer/zip-fuse 轴 | 1–2 天 | 至少一个 plan 的 predicted spill 较 incumbent 降 ≥50%，否则先修 partition，不做 coloring |
| P3 | `asm-direct` printer、allocator/bundle/ABI verifier | 1–2 天 | 20k=0、lite=5/5、实际 stack traffic 与预测一致；否则不得进入性能结论 |
| P4 | pressure shortlist + stack/reload lower bounds 校准 | 0.5–1 天 | dynamic MCA top-k recall 需在积累足够样本后评估；未达标时只作展示，不硬剪枝 |

最重要的停止规则：编译器 profile 小矩阵若没有同时改善 stack traffic 与动态
MCA，就停止继续枚举隐藏 flags；graph coloring 若不能超越分组后的 linear
scan ≥10% spill，也停止深化 coloring，把资源投入 region/schedule。
