## 总判定

v0.3 **不建议原样冻结，建议“修订后有条件通过”**。

三档目标可以保留为 stretch KPI，920B/N+2 的保留—优秀分层也基本合理；但冻结前至少要修正四点：

1. `cycles_est` 只能作为搜索代理，不能称为可靠 cycles 估算。
2. `load > SIMD ⇒ 无优化价值` 不能作为硬淘汰门。
3. 跨 ISA 与同 ISA baseline 必须拆成独立、不可二选一的验收项。
4. 融合表为空时，未验证融合对不得产生预测收益并驱动搜索。

以下用：

- **[事实]**：仓库证据或确定的 ISA/OS 语义；
- **[推断]**：基于现有证据的判断；
- **[需实验]**：只能由目标机器确认。

## 1. 需求口径自洽性

### 三档目标与 2.3×

**[事实]** 文档将“+130%”定义为 `speedup = 2.30`，数学上没有歧义，见[项目章程](/home/chiro/projects/a64-simd-dyn-optimizer/docs/01-project-charter.md:56)。

**[推断]** 对 b 档，128→256 的“纯宽度收益”是 2×，但它不是整个实现的绝对理论上限。布局改变、减少归约、合并 load、消除地址/调用开销都可能突破 2×。因此 2.3×可以作为有挑战性的目标，但不能说是仅凭 SVE 宽度自然可达。

在理想模型下：

- 纯宽度后：`Tnew = Told / 2`
- 2.3×目标：`Tnew = Told / 2.3`
- 相对纯宽度结果，还需再减少 `1 - 2/2.3 = 13.0%` cycles；
- 或表述为再获得 `2.3/2 = 1.15×` 吞吐。

因此[需求文档](/home/chiro/projects/a64-simd-dyn-optimizer/docs/09-instruction-fusion-analysis.md:96)中的“约 15% 指令/周期削减”不够准确：应写成“额外 15% 吞吐，等价于约 13% cycles/工作量削减”。

c 档更激进：SVE256→SVE256 没有宽度红利，按当前模型需直接把成本压到基线的 `43.5%`，即削减 `56.5%`。如果基线是上游最佳 SVE256 实现，这只能视为 stretch goal，必须逐 family 做可达上界/D6 分析。

**[需实验]** N+2 尚未定型，“4×256”、各类 permute/reduction 的吞吐及 2.3×是否可达，都不能由 pipe 数确认。

### `cycles_est` 需要降级或重构

当前：

```text
(simd_insns + load_insns) / SIMD_pipe_count
```

不能可靠表示 cycles，原因包括：

- load 通常使用独立 load/AGU 资源，但也共享前端、rename、ROB；
- permute、整数 ALU、水平归约未必都能使用全部 SIMD pipes；
- 256-bit 指令可能在实现内部拆成多个操作；
- latency/依赖链、spill、store、调用和地址运算均被遗漏；
- 静态指令数只适用于无循环、无调用的直线路径。

建议保留 `n_est`，但命名为 `instruction_score`，另做资源下界：

```text
cycles_lb = max(
  vec_alu_uops / vec_alu_rate,
  permute_uops / permute_rate,
  reduction_uops / reduction_rate,
  load_uops / load_rate,
  load_bytes / l1_bandwidth,
  store_uops / store_rate,
  frontend_uops / frontend_rate,
  critical_path_latency
)
```

共享端口则按端口占用求和，而不是简单取 `max`。最终验收仍只认实机 paired cycles。

另有两个实现级问题：

- **[事实]** 当前计数器以操作数出现 `z/p/v` 判 SIMD，所以 `ld1b` 已经包含在 `simd` 中；若再加入 `load_insns`，向量 load 会双计，见[计数器](/home/chiro/projects/a64-simd-dyn-optimizer/tools/count_asm_insns.py:13)。必须建立互斥分类：vector compute/permute/reduce、predicate、vector load、scalar load、store、scalar/control。
- **[事实]** 16x16 wrapper 的“23 条”只包含 wrapper 和两次 `bl`，不包含两个 raw helper 的动态路径，见[生成 wrapper](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_16x16.cpp:6)。必须统计最终 linked symbol 的内联结果，或沿调用图计算每个逻辑 16x16 的动态成本。

### `load > SIMD` 不足以判定 compute-bound

结论是：**可能误杀，而且不能证明相反方向。**

- `load > SIMD` 不证明 memory-bound：load 可能与 SIMD 重叠，且都是 L1 hit。
- `load <= SIMD` 也不证明 compute-bound：一个高延迟 reduction、cache miss 或依赖链就可能主导。
- load-heavy kernel 仍可能通过 load 合并、向量加宽、窗口复用、预取和布局搜索显著优化；`interp8` 正是典型风险。
- store 不计会奖励产生 spill/store 的候选。

建议改成软信号：

```text
load_pressure: low | medium | high
compute_bound_prediction: true | false | unknown
optimization_route: compute | load-reuse | latency | mixed
```

高 load pressure 可以降低“纯 SIMD 融合”优先级，但不得退出整个优化漏斗。load/store 不参与本轮宏融合枚举可以保留，只是不能推出“无优化价值”。

### 920B 与 N+2 门槛

“NEON 4×128”和“SVE 2×256”最多说明名义向量 bit-issue 宽度相同，不应称为已确认的内存或实际峰值带宽。不同指令类别可能有完全不同的吞吐。

**[推断]** 920B `>1.10×` 是合理的中间保留门：在没有名义宽度收益时，它要求布局/指令选择真正产生净收益。但它是项目政策阈值，不是由“512 bit 相等”推导出来的。

建议把门槛写成无歧义表格：

| 环境/档位 | 精确 baseline | 保留 | 优秀 |
|---|---|---:|---:|
| 920B 中间验证 | 同机上游 NEON | `speedup > 1.10` | 不作 N+2 优秀判定 |
| N+2 b 档 | 同机冻结的 NEON 或预注册 SVE128 | `speedup > 2.10` | `speedup >= 2.30` |
| N+2 c 档 | 同机最佳现有 SVE256 | `speedup > 1.10` | `speedup >= 2.30` |

2.10×保留相对纯宽度 2×还要求约 4.8% cycles 削减；2.30×目标要求约 13.0%。目标边界比保留边界再低约 8.7% cycles，层级是清晰的。

但当前文档多处把“920B >10%”和“NEON→SVE 4×256 >110%”写在同一句，容易误读；4×256 属于 N+2，不属于 920B，见[验收文档](/home/chiro/projects/a64-simd-dyn-optimizer/docs/04-validation-benchmark.md:184)。

此外，10% gate 应明确统计条件：建议要求 paired speedup 的预注册中心估计 `>1.10`，且 bootstrap 95% CI 下界也超过 `1.10`；若只要求下界 `>1.00`，应明确它是较弱的探索性保留。

## 2. 推荐方案顺序

信息增益更高的顺序是：

1. 修订上述口径并冻结 P0。
2. 完成 M10 长门禁。
3. 立即做 920B 最小工具链/原生正确性/PMU 闭环。
4. 冻结 SA8D 生成源码与目标对象身份，转入 N1 可测的 DCT8。
5. 再实现融合静态报告；取得目标特定融合证据后才进入排序和主循环。

原因是：融合表目前为空，N+2 又未定型，先实现分析器只能得到大量未经验证的假设；920B 一次原生闭环则会同时回答 SVE1 可执行性、编译器形状、VL、PMU、benchmark 噪声和估算偏差。

M10 的 `vq=1` 门禁必须是：

```text
VL=128 → dispatch 不注册候选 → 候选调用次数为 0
```

不能把直接调用候选产生 mismatch 当成“拒绝通过”。当前仓库只记录了“dispatch 必须禁止”的注释，尚没有实际运行时 dispatch 实现，[codegen 合同](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:246)也明确 VL=128 会静默少算。

## 3. 当前候选是否真是 SVE1

**[事实]** 本次只读审阅中，四个冻结源文件均能用：

```text
-march=armv8-a+sve
```

生成汇编，并由仅启用 SVE 的 AArch64 汇编器接受。实际指令集合为：

```text
ptrue/whilelt, ld1b, add/sub, trn1/trn2,
abs, sabd, umax, uaddv
```

没有 SVE2-only 指令。因此：

> “当前这四个具体源文件可生成 SVE1 对象”成立。

但不能扩展成“现有 backend 已是 SVE1-safe”：

- 构建脚本仍使用 `-march=armv8-a+sve2`，[构建脚本](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/build-sve-sa8d.sh:30)中的旧 hash 不是 SVE1 身份证据；
- 函数名、manifest 和 generator backend 仍叫 `sve2`；
- `TargetFeatures` 只有 `sve_vla()` 和 `sve2_vl256()`，没有真正的 `sve_vl256()` profile，见[features.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/targets/aarch64/features.py:84)；
- 未识别 shuffle 的 fallback 会生成 SVE2 `TBL2`，所以未来候选未必适用 SVE1。

920B 应以 `+sve` 严格重建最终 linked binary，扫描禁止 SVE2 opcode，并保存新 compiler/flags/disassembly/hash。

920B 可以验证：

- SVE1 原生执行、native differential、guard/sanitizer；
- 每个进程及 worker 的真实 VL；
- ABI、spill、调用/内联形状；
- candidate vs 同机 NEON 的中间保留门；
- 920B 自身的 PMU/指令成本和估算偏差。

920B不能验证：

- 任意 SVE2/SVE2.3 指令；
- N+2 的 4×256 吞吐、融合行为和 +130%；
- 上游 SVE2 baseline；
- 920B 上观察到的融合是否可迁移到 N+2。

## 4. 融合分析器核实

“静态报告 → 后处理排序 → 搜索主循环”的演进方向合理，但必须增加置信分层：

1. `structurally_eligible`：仅满足语法、依赖、3R1W 等条件；
2. `hw_supported`：目标融合表或微基准已确认；
3. `measured_correlated`：静态预测与多组实测候选有相关性。

融合表为空时：

```text
structurally_eligible = N
hw_supported = 0
predicted_cycles_saved = unknown/0
```

不得把每个 `needs_hw_verify` 对都按 2→1 扣 issue slot，否则“空表但必须驱动布局搜索”会让搜索偏向虚构收益，这是当前 v0.3 最大的逻辑问题之一。

同样，3R1W、相同谓词、谓词不计端口只能作为句法过滤器，不是硬件融合充分条件。谓词文件、destructive destination、`MOVPRFX` 约束、精确异常和实际 backend uop 都是目标相关行为。`MOVPRFX` 也首先是架构前缀配对约束，不能直接等同于已发生宏融合。

硬件验证应使用专门的相邻/插空 instruction-pair latency/throughput 微基准。`instructions:u` 仍会退休两条架构指令，不能单独证明发生了融合。

## 5. 其余遗漏风险

### 固定 VL=256

- Linux SVE VL 是每线程状态；sysctl 默认值不是运行时合同。
- 应先检查 `HWCAP_SVE`，再以 `PR_SVE_SET_VL` 请求 32 bytes，检查内核返回值及 `svcntb()==32`。
- 在 worker 创建前设置，并在每类 worker 中验证继承；不能只测主线程。
- 全局函数指针 dispatch 与 per-thread VL 天然存在风险。若不能建立进程级不变量，应使用 worker 初始化或安全 wrapper/fallback。
- 固定合同意味着 `<256` 和 `>256` 都不注册；若想接受 `>=256`，应另立 VLA-minimum profile，并补 VL=384 等测试。

### 2 vCPU 和 PMU

**[需实验]** 920B 是否向 VM 暴露可用 PMU 尚未确认；没有 `cycles:u` 就不能用 `cntvct` 冒充 CPU cycles。

建议：

- benchmark 固定一个 vCPU，SSH/监控尽量放另一个；
- 同一 executable、同一进程内随机交替 A/B，批次持续到至少数十至数百毫秒；
- 同时报 cycles、instructions、ns、context-switch、migration、page-fault、PMU scaling；
- 不 multiplex 关键事件；
- 至少 30 个有效 pair、3 个独立进程、跨时段复测；
- 噪声超限丢整个预注册 run，不挑慢样本；
- 分开报告 hot-L1 kernel 与现实 corpus，保留 latency/throughput 两种模式。

现有 benchmark harness 还只允许 candidate 用于 8x8，[sa8d_microbench.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/sa8d_microbench.cpp:214)会拒绝 16x16；920B 验收前必须建立合法 16x16 candidate 路径。

### openEuler/x265

- **[事实]** 当前 bootstrap 使用 `dpkg/apt`，不能直接用于 openEuler，[bootstrap.sh](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/bootstrap.sh:10)需要对应的 rpm/dnf 环境入口。
- passwordless sudo 只解决权限，不保证软件源、PMU、Bitbucket 或包版本可用。
- x265 submodule、固定 commit、编译器、CMake/Ninja、binutils/perf、NUMA 开发包及 sanitizer runtime 都需实际安装/传输验证。
- 当前 x265 构建脚本显式关闭 SVE/SVE2；它可生成 NEON baseline，但不会生成 SVE baseline。
- 归档审计显示 SA8D 扩展实现在 `pixel-prim-sve2.cpp`，所以 920B 上大概率没有可运行的上游 SA8D SVE1 baseline。正式结论仍应以 pinned commit 的 configure log 和最终 dispatch/disassembly 为准。

### baseline 定义

当前“同 ISA/VL”公平性规则与 b 档跨 ISA 比较存在文字冲突。建议冻结为两个独立指标：

- **b 档迁移收益**：同一 N+2、同一 binary/toolchain/workload，candidate SVE256 对冻结的 NEON baseline；若还要 SVE128，单列 `b-neon`、`b-sve128`，不能事后择优。
- **c 档优化收益**：同一 N+2 上 candidate SVE256 对最佳现有上游 SVE256。

因此，一个 candidate 可以达到“对 NEON 2.3×”，但只比上游 SVE2 快 1.1×：此时 b 达成、c 未达成，不能混报。

另外，[SA8D workload](/home/chiro/projects/a64-simd-dyn-optimizer/workloads/sa8d.yaml:1)仍是 1.30 门槛且权重为 placeholder。宣称“工具优秀”前，需要分别冻结 b/c 的 workload、权重、baseline ID 和最终 symbol hash。

## 最终建议

P0 修订后可冻结；关键执行路线建议改为：

```text
P0' 口径修订
→ M10 长门禁和真实 vq=1 dispatch 拒绝
→ 920B SVE1 严格重建 + native correctness + paired PMU
→ 冻结 SA8D 源候选，启动 N1/DCT8
→ 融合静态 inventory
→ 目标融合对验证
→ 后处理排序
→ 经相关性验证后进入搜索主循环
→ N+2 分别完成 b/c 验收
```

本次仅做只读审阅，未修改仓库。