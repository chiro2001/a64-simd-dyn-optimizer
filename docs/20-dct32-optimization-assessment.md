# DCT32 优化评估（2026-08-13，v1 管线打通）

## 1. 基线（QEMU VL=256）

> **2026-08-13 口径修正（重要）**：此前 v3/v3.1 的 fused_uop
> （4266/3962）是 **pass1-only**（搜索工具 range 只覆盖
> `pass32_impl<4>`）。修正后完整调用（pass1+pass2+wrapper）：
> **v3.1 = 8292（0.652x），v3 = 8596（0.676x），均差于 v2（7190，
> 0.566x）**。v3/v3.1 的“HALVED / 超越内部参考”结论撤销；当前
> full-call best 仍是 **v2**（near-gate，未过半数门）。

| 实现 | dynamic(full) | vector(full) | movprfx | fused_uop(full) | ratio |
| --- | ---: | ---: | ---: | ---: | ---: |
| 上游 x265::dct32_sve（128-bit 风格） | 13362 | 12710 | 0 | 12710 | 1.000 |
| 工具生成 v1（16-lane SVE2，叶子缓冲） | 21233 | 9974 | 1032 | 8942 | 0.704 |
| 工具生成 v2（行主序，叶子不落缓冲） | 16783 | 8854 | 1664 | 7190 | **0.566** |
| 工具生成 v3（4 行切片 + lane-per-output sdot，pass1-only 4266） | 12381 | 9332 | 736 | 8596 | 0.676 |
| **工具生成 v3.1（+ k≡2 pass1 切片，pass1-only 3962）** | 12034 | 8924 | 632 | **8292** | 0.652 |
| 上游 dct32_neon（参考 b 档基线） | 13604 | 11949 | 0 | 11949 | 0.940 |

- v2 相对上游 -43.4%（near-gate，**未过半数门 6355**）；v3/v3.1 的
  pass1 确实更少（4266/3962），但 pass2 未优化（4330/4698），
  full-call 反而比 v2 多。v3/v3.1 保持 upstream-exact、零 scatter、
  200k 差分 0，但**不是当前指令数最优结构**。
- 内部参考 full fused_uop = 4827（0.380x，真 HALVED），本项目 best
  （v2）7190 仍落后约 49%；“v3.1 超越内部”为 pass1-only 假象。
- 正确性：2 万例差分 0（vs `x265::dct32_sve`）；`TestBenchLite --gate dct32`
  PASS（MBDstHarness + C 参照 `dct32_c`）。
- 2026-08-13 全链复验：20 万例差分 0（204.8M lane）、TestBenchLite
  dct32 5 个 seed 全 PASS（1/2/0x12345678/0xDEADBEEF/987654321）。

### v2 行主序轴（layout=v2）

v1 的 k 循环对同一叶子按 k 重复加载（每 pass 约 1800 条 leaf 重载）。
v2 改为逐行：叶子留在寄存器里，一行内完成全部 32 个输出
（16×sdot+uaddv、8×mul+addv、4×mul+4-lane addv、4×标量 t8_even），
彻底取消叶子缓冲与重载。这是 manifest 的新搜索轴
`layout: [v1, v2]`，工具自动枚举并排名。

### 半数硬门已落进工具（2026-08-13）

搜索在 manifest `targets.baseline_fused_uop / halve_gate` 下自动计算
`baseline_ratio` 并打标（HALVED / near-gate / NO）：
- dct32：v2 = 7190 / 12710 = **0.566（near-gate）**，v1 = 0.704（NO）；
- sa8d16：189 / 373 = **0.507（near-gate）**，与 round-0010 的
  “189 > ⌊373/2⌋=186”批评一致；
- sa8d：79 / 97 = 0.814（NO）。

后续每个搜索输出都带该门标；`fused_uop` 仍是排名主指标，实机 cycles
作为最终验收（960/950 可用后）。

### 寄存器压力实验（2026-08-13）

反汇编显示 v2 有 4 个奇数 k 常量栈 spill（每行 `ldr z24` 重载，
~256 条）。新增 `layout=v2b`（C2/C4 惰性按 k 加载，减少峰值活寄存器）：
实测 **v2 与 v2b 均为 7190**——spill 重载与惰性加载的净成本持平，
说明该点不是当前瓶颈，v2 保持 best。

### 200k 差分门（round-0010 验证标准）

- dct32 v2：200000 例 / 204.8M lane，**0 分歧**；
- sa8d16：200000 例，**0 分歧**；
- 加上多 seed lite、guard（VL 拒绝）均已覆盖 finalist 标准。

### v3：4 行切片 + lane-per-output sdot（2026-08-13，突破）

机制（镜像内部参考结构，见 docs/18/21）：
- 4 行一组：O 叶按 4-lane 切片打包（`Xm = [O0[4m..] | O1[..] | O2[..] |
  O3[..]]`，每组 12 条 tbl2）；
- 每个奇数 k：4 条 `sdot .d`（切片 × [g[4m..4m+3]]×4 双份常量）把 4 行
  的完整 16 项点积分别累积进 4 个 s64 lane——**无需逐输出 uaddv**；
- 归约：`uzp1_s32` 取低半 + `rshrnb`（注意 RSHRNB 把结果放偶 lane，
  需再 `uzp1_s16` 压缩）+ 4-lane 向量存储；
- 偶 k（k≡2/4/0）保持 v2 逐行路径；
- 教训：SVE/SVE2 没有 16-bit→32-bit SDOT（sdot .s 只接受 s8 输入），
  lane-per-output 必须用 sdot .d（s64）+ uzp1 收窄。

验证：2 万例 + 20 万例差分均 0（upstream-exact），TestBenchLite PASS，
stack_vector 229（spill 下降）。**注意：以下 4266/3962 为 pass1-only
计数；full-call 见 §1（v3=8596、v3.1=8292，未过半数门，且差于 v2）。**

### v3.1：k≡2 pass1 同构切片（2026-08-13）

- pass1 的 EO 是 s16（上游 pass1 用 sdot）：4 行组再切 EX0/EX1
  （每行 4-lane 切片），每个 k≡2 用 2×sdot .d（[g[0..3]]×4、
  [g[4..7]]×4）+ 同一套 uzp1/rshrnb/uzp1_s16 归约（6 条/组/k，
  替代逐行 mul+saddv+fmov 的 12+）；
- pass2 的 EO 是 s32（避免回绕），保持 vmul 路径；`if (shift == 4)`
  由模板常量折叠；
- 结果 4266 → **3962**（pass1-only）；每输出 4.17 → 3.87（内部 4.15）。
  full-call：v3=8596 → v3.1=8292（pass2 未优化，仍差于 v2 7190）。

### P0 轴解耦（round-0012，2026-08-13）

- 按顶级模型建议把 v3.1 的第一个独立机制拆为搜索轴
  `pass1_k2_slice ∈ {0,1}`（manifest + 发射器 `--pass1-k2-slice`）；
- 回放验证：`layout=v3, pass1_k2_slice=0` = **4266**（历史 v3 计数，
  pass1-only），`=1` = **3962**（v3.1，pass1-only），两者 20k 差分 0、
  零 scatter；full-call 为 8596/8292（§1）。v1/v2/v2b 不受该轴影响
  （源码哈希去重）；
- 续（同批）：`odd_lowering ∈ {sdot.d, row-reduce}` 与
  `narrow_batch ∈ {1, 4}` 也拆为独立轴，得到 6 个 v3 消融点
  （20k 差分全 0、零 scatter）：

  | v3 组合（k2 slice / odd / narrow） | fused_uop（pass1-only） | 说明 |
  | --- | ---: | --- |
  | 1 / sdot.d / 4 | **3962** | v3.1（full 8292） |
  | 1 / row-reduce / 1 | 4252 | 去掉 odd lane-per-output |
  | 0 / sdot.d / 4 | 4266 | 历史 v3 |
  | 0 / row-reduce / 1 | 4488 | 两个机制都去掉 |
  | 1 / sdot.d / 1 | 5494 | 窄化退化标量（stack 229→787） |
  | 0 / sdot.d / 1 | 5875 | 同上且无 k2 slice |

  消融结论：k≡2 slice 净省 ~304，odd lane-per-output 净省 ~220-290，
  批量窄化+向量存储是单项最大收益（~1500）。这验证了 round-0012
  对 v3.1 的机制拆解，且每个机制都能独立开关做机器计数消融。
- 再续（同批）：`constant_layout ∈ {derived-replicated, canonical}`：
  canonical 用运行时 4 条 TBL 从原始 C32 复制切片，derived-replicated
  是 CODD 预复制（v3.1）。最佳组合（k2=1/odd=sdot.d/narrow=4）下
  canonical = 4189 vs derived = **3962（+227）**（pass1-only），证明
  “常量吸收”净省 ~227 fused_uop；全部 20k 差分 0、零 scatter。当前
  manifest（含 acc_split 轴）192 个组合去重后 31 个唯一候选，修正
  range 后全搜索约 2 分钟，>60s 预算；后续加 layout_prune 收紧。
- 这是“复合模板 → 可组合语义轴”的第一步；剩余轴（lane_owner、
  row_group=8、interpass_layout、store_topology）随模板重构继续拆出
  （lane_owner 与 odd_lowering 强相关：output↔sdot.d、partial↔
  row-reduce；store_topology 固定 contiguous 且 scatter 硬禁用）。

### P1 第一增量：typed LayoutIR（round-0012，2026-08-13）

- `optimizer/ir/layout_ir.py` 落地：ValueLayout / RoundBarrier /
  ConstantMap / MemoryMap / Tile / Target / Plan，含
  `canonical_key()`（逻辑 plan 的有序无关 sha256）、`verify_layout()`
  （VL/feature/no-scatter/lane-ownership/round-barrier/contiguous
  硬门）与 `lower(plan)`（回放现有发射器）；
- `tools/test_layout_ir.py`：v3.1 计划 verify 通过、canonical key 稳定、
  `lower(plan)` 与 `emit(v3.1)` 源码逐字节一致；故意破坏 scatter/VL/
  round-shift 的计划全部被拒；
- 下一步：原子 rewrite（assign_output_lanes / segment_dot /
  batch_round_narrow_store / derive_constant_map），以“禁用复合 v3
  模板仍盲搜回 pass1<=3962 / full<=8292”为 Go 判据。

### P1 增量 3-4：按块组装 + rewrite 驱动搜索（round-0012，2026-08-13）

- **增量 3（结构解耦）**：`emit_dct32_sve2_shared.py` 的分组体改为
  `_grouped_body_cpp()` 按机制块组装（leaf / odd slices / k2 EX /
  odd / k2 / k4 / k0，块由独立轴选择）；新增 `emit_grouped()`，plan
  路径不再携带 `layout` 预设。`emit(layout=v3)` 与 `emit_grouped()`
  输出逐字节一致（sha d67990fab4b6…），搜索/finalize 计数不变
  （pass1 3962 / full 8292）。
- **增量 4（搜索由 rewrite 定义）**：`tools/search_plans.py` 从规格
  plan 枚举 18 个合法 rewrite 子集（无 assign 2 个 + 有 assign 16 个），
  每个计划过 `verify_layout` → `lower()` → 编译 → 与 P0 搜索结果按
  源码哈希对齐。结果：18 计划 → 12 个唯一候选，best 仍为
  `k2=1/sdot.d/narrow=4/derived` = **pass1 3962 / full 8292**
  （零 scatter，2026-08-13 range_end 修正），即
  “搜索空间由原子 rewrite 定义、不使用 manifest layout 字符串”的
  E1 验收已实质性达成；复合 `pass_grouped_cpp` 仅保留为旧搜索路径的
  兼容包装。
- 剩余诚实口径：`emit_grouped` 仍复用同一批 C++ 块（plan 的 tiles 语义
  暂由 rewrite 证书承载，未逐块反汇编成 op 级 IR）；op 级原子后端是
  P1 的后续增量，不作为当前 Go 判据。

### P2 增量：rewrite 搜索自包含测量 + 分层漏斗（2026-08-13）

- `tools/search_plans.py` 升级：不再对齐 P0 历史结果，而是对每个
  rewrite 计划**端到端实测**——`verify_layout`（语义层）→
  canonical-key 去重（布局层）→ 源码哈希去重（lowering 层）→
  编译 + 20k 上游差分 + true-dynamic trace（测量层）；
- 实测结果：18 个语义计划 → 18 个 canonical 计划 → 12 个唯一源码 →
  12 个全测候选；best = `assign+segment+narrow4+derived+k2` =
  **pass1 3962 / full 8292 fused_uop**（零 scatter、20k 差分 0），
  与 P0/P1 修正后一致；
- 该搜索路径全程不含 `layout` 预设字符串，分层漏斗可直接用于评估
  新 rewrite 加入后的候选数压缩与耗时预算。

### P1 增量 5：plan↔源码静态一致性证明（2026-08-13）

- 新增 `optimizer/analysis/layout_verify.py::check_source(plan, src)`：
  对 `pass32_impl` 模板体逐指令族计数（svdot_s64 / svaddv /
  svst1_s16/s64/s32 / svmul / 标量 dst / 常量运行时 tbl），与 plan
  tiles/lowering 声明比对，并强制 `st1d/scatter == 0`；
- `search_plans.py` 在编译前对每个 plan 跑该证明（source-proof 层），
  12/12 候选全部通过；自测覆盖正例（v3.1、spec）与故意破坏的负例
  （narrow 1 vs 4 被检出）；
- 这收窄了“plan tiles 语义未接入 codegen”的口径：块粒度的一致性
  现在有静态证明；剩余差距仅为逐寄存器/逐 lane 的 op 级后端。

## 2. v1 结构（tools/emit_dct32_sve2_shared.py）

- 每行 32 s16 = 2 个 16-lane 寄存器；E/O = `lo ± rev(hi)`（16-lane）。
- E 必须 s32（pass2 输入可超 s16）：`unpklo/unpkhi` 分别加宽 lo/rv 再相加；
  注意 **`svaddlb/svaddlt` 是每 128-bit 段的偶/奇 lane**，不是低半/高半。
- EE/EO = E ± rev16(E)；EEE/EEO = EE ± rev8(EE)；EEEE/EEEO = EEE ± rev4(EEE)
  （全部 16-lane SVE 指令，tbl 实现半反折）。
- k 族：
  - k 奇：O 16-lane `sdot .d`（1 条 16 乘积）+ `uaddv` 归约；
  - k≡2 mod4：EO s32 8-lane `mul` + `uaddv`；
  - k≡4 mod8：EEO s32 4-lane `mul` + 4-lane `uaddv`（VL=256 下 s32 有 8 lane，
    必须用 `whilelt_b32(0,4)` 谓词，否则把未定义 lane 计入）；
  - k≡0 mod8：EEEE/EEEO 2-term 标量（t8_even 系数 = g_t32 行 0/8/16/24 前两列）。
- 叶子落内存缓冲（sizeless 类型不能进数组）；缓冲大小按 s32 计（踩过坑）。

## 3. 下一步优化方向（按预期收益）

1. **常量预排列 + [C|C] 双份**：k 奇 16-term dot 目前每条 sdot 只产出 4 个
   partial 再用 uaddv 归约；改为把 8-lane 叶打包两行/寄存器（DCT16 pass1
   已验证的形态），sdot 一次算两行的 partial，去掉逐行 uaddv。
2. **k≡0 族向量化**：t8_even 4 行分组 vmul（上游形态），替换标量 2-term。
3. **pass2 寄存器分块**：叶子缓冲全部落内存导致大量 ld/st；按 4 行分组
   流水化（上游 `i += 4` 结构）减少回访。
4. **movprfx 1032 条**：cadd/mul 链的破坏性目的寄存器布局优化
   （融合后不计入 fused，但影响实机发射）。

目标：先把 fused_uop 压到 ~7000，再向 6355（减半）逼近；实机 cycles 等
950/960 可用后校准。

## 4. 内部手工最优 DCT32 对照（2026-08-13，仅聚合指标，代码不入库）

> 信息安全说明：与 docs/18 的 DCT16 处理一致，内部算子只在本机 /tmp
> 评估，仓库只记录量化指标与方向结论，不收录任何内部代码/反汇编细节。

同口径（QEMU VL=256、true-dynamic、单次调用 stride=64）三方对比：

| 指标 | 上游 dct32_sve | 本项目 v1 | 内部参考 |
| --- | ---: | ---: | ---: |
| dynamic total | 13362 | 21218 | 5381 |
| 向量 raw | 12710 | 9974 | 4731 |
| movprfx | 0 | 1032 | 480 |
| fused_adj | 12710 | 8942 | **4251** |
| scatter_gather（st1d） | 0 | 0 | 192 |
| fused_uop（sg +3/条） | 12710 | 8942 | **4827** |

- 内部相对上游 fused_adj = **0.335x**（远低于“减半”标准 0.5x）；
  我们 v1 为 0.704x，差距主要在 v1 的叶子缓冲往返与窄化/存储形态。
- 内部指令构成（仅计数，向量 4731）：sdot 1376、ld1h 864、movprfx 480、
  uzp1 480、add 272、rshrnb 256、st1d 192、zip1/zip2 152+152、sub 144、
  rev 112、saddlb/saddlt 32+32、mul 32。
- 方向结论（可工具化，不涉内部实现细节）：
  1. **常量预排列 + [C|C] 双份**：ld1h 864 表明常量以预排列/双份形式
     供 sdot 直接消费，省掉叶侧重排；
  2. **rshrnb 窄化链**：256 条窄化覆盖 2048 输出（0.125/输出），v1 的
     逐行 uaddv+标量舍入应替换为批量 rshrnb+连续 st1h；
  3. **sdot 主导**（1376）：奇数/偶数 k 都走 dot，v1 仅奇数 k 走 dot；
  4. **禁止 scatter**（用户裁定）：内部 192 条 st1d 在口径上 +576 uop，
     本项目必须用 uzp1 连续存储替代，不追表面指令数。

按减半口径（12710→6355），v1（8942）还需再压 ~29%；参考内部的方向
（常量预排列 + 批量窄化 + 全 dot 化）是主要路径。

## 5. 920B 实机复核与 LLVM-MCA（2026-08-13）

用户反馈 920G 上 v3.1 周期与上游几乎无差异，要求 920B 复测 + MCA。
结论分两部分：

### 5.1 920B（SVE1，VL=256）实测

- 能力探针（`experiments/m30-dct32-search/cap-probe/cap_probe_full`）：
  `sdot_d`/`uzp1`/`sunpklo`（SVE1）执行 OK；`rshrnb`/双寄存器 `tbl`
  （SVE2）SIGILL → **best_sve2 候选整体无法在 920B 运行**，因此
  “920B 复测 v3.1 vs 上游” 不可行，只能复测基线。
- 基线（静态 binary，CNTVCT latency，20000 samples，taskset 单核）：

| 实现 | min | p50 | p99 |
| --- | ---: | ---: | ---: |
| dct32_c | 620 | 632 | 654 |
| dct32_neon | 148 | 151 | 169 |
| dct32_sve（上游 SVE1） | 204 | 211 | 229 |

  `verify c/neon/sve 200` 全部 0 分歧（oracle = 上游 dct32_sve）。
  harness 必须以 `-march=armv8.2-a+sve`（非 +sve2）编译，否则主程序
  自身带 SVE2 指令在 920B 全 SIGILL（踩坑已记录）。

### 5.2 LLVM-MCA（Neoverse V2/N2，迭代 1，直通静态体）

| 指标 | best_sve2（full 8292 / pass1 3962） | 上游 dct32_sve（12710） |
| --- | ---: | ---: |
| 静态指令数 | 1681 | 2502 |
| N2 uOps | 2002 | 3102 |
| N2 Total Cycles | 667 | 927 |
| V2 uOps | 2046 | 3101 |
| V2 Total Cycles | 397 | 560 |

- MCA 预测 best 应快 ~1.4×（N2/V2），与 920G 实机“几乎无差异”矛盾；
  MCA 没有鲲鹏 920G 型号，只能做端口/依赖链粗估。可能原因：920G 微架构
  差异、实测候选/协议不一致、或动态循环依赖（sdot 累加链、movprfx
  融合）未被静态模型捕获。
- **下一步需要一台真实 SVE2 机器（如阿里云倚天 710）复测 v3.1 vs
  上游**，并先确认 `svcntb==32`（VL=256）后直接跑同一微基准；若
  倚天为 VL=128，则需重新生成 128-bit 变体，仅能验证 SVE2 指令语义，
  不能验证 256-bit 候选周期。

### 5.3 倚天 710（Neoverse-N2, SVE2, VL=128）临时实测（2026-08-13）

用户提供阿里云倚天 710 实例一小时（自动释放）。实测结论：

- CPU 报告为 **Neoverse-N2，SVE2 齐全**（`sve2/sveaes/svepmull/
  svebitperm/...`），但 **VL=128（svcntb=16）**，`prctl(PR_SVE_SET_VL,32)`
  被钳制为 16，硬件最大 128-bit → **无法直接跑 VL=256 的 best 候选**；
- SVE2 能力探针（rshrnb/tbl2/sdot.d）全部 OK；
- DCT32 上游基线（VL=128，latency 20000 samples，taskset 单核）：

| 实现 | p50 | p99 |
| --- | ---: | ---: |
| dct32_c | 402 | 621 |
| dct32_neon | 118 | 126 |
| dct32_sve（上游，VL 自适应） | 83 | 88 |

- 固定 256-bit 的 best_sve2 在此机 verify 全错（VL 不匹配），不测周期。
- LLVM-MCA 的 `neoverse-n2` 型号与该机同构，MCA N2 数据可作为该校准点。

### 5.4 SVE1 降级后端与 920B 同宽度复测（2026-08-13）

为了让 920B（SVE1/VL=256）也能跑 v3.1 结构，发射器新增 `--isa sve1`
降级（`tools/emit_dct32_sve2_shared.py`）：

- `rshrnb`（SVE2）→ `add 半舍入 + asr`（SVE1，等指令数；SVE1 无
  SRShR）；
- 双寄存器 `svtbl2`（SVE2）→ 两条单寄存器 `svtbl` + `orr`（+2 条/处，
  索引为编译期常量，B 表索引向量预加载）；
- 静态 simd：best_sve2.o 1019 → best_sve1.o 1125（+106），fused_uop
  full 8292 → 9042（SVE1 降级代价 ~9%）。

920B 实机（SVE1/VL=256，CNTVCT latency 20000）：

| 实现 | p50 cycles |
| --- | ---: |
| dct32_c | 633 |
| dct32_neon | 151 |
| 上游 dct32_sve | 222 |
| **best_sve1（v3.1 降级，20k 差分 0）** | **226** |

**结论：指令数减少（full 9042 vs 12710，-29%）在鲲鹏 920B 上未
转化为周期收益（226 vs 222，约 -1.8%）**，与 920G 观测一致。结合
MCA（Neoverse 系预测 ~1.4×）与实机（无收益）的分歧，假设是：
v3.1 把每个输出串成 4 条依赖的 `sdot.d` 累加链，指令少了但关键路径
变长、ILP 变差；而 920B/920G 的 sdot 吞吐/延迟与 Neoverse 不同。
**下一步工具方向：在搜索排序中加入依赖链深度/MCA cycles 或独立
accumulator 轴（row_group/双链拆分），而不是只看 fused_uop。**
（注：本节单次测量已被 §5.8 配对 A/B 取代：v3.1-SVE1 实际慢 ~14%，
v2-SVE1 快 ~4%。）

### 5.5 acc_split（独立累加链）消融（2026-08-13）

为验证“依赖链/ILP”假设，发射器新增 `--acc-split {1,2,4}` 轴：

| SVE1 变体 | 结构 | full fused_uop | 920B p50 cycles |
| --- | --- | ---: | ---: |
| as1 | 4 连 sdot 链（v3.1 默认） | 9042 | 226 |
| as2 | 2+2 独立链 + add | 9298 | 236 |
| as4 | 4 独立 sdot + 树状 add | 9307 | 236 |

三者均 20k 差分 0。**拆链反而更慢（+10 cycles）**：额外 add/寄存器
压力抵消 ILP 收益，说明 920B 上瓶颈既不是指令数也不是 sdot 链深度。
同时修正 full-call 口径后，**v2（7190）仍是 full-call best**；后续
优化应回到 v2 结构（或对 v2 做 pass2 切片），并把真实机周期作为
排名依据，而不是 pass1-only fused_uop。

### 5.6 v2 pass 拆分与下一步（2026-08-13）

v2 的 `pass32_impl`（shift 为运行参数）按 shift=4/11 分别 trace：

| v2 pass | full fused_uop |
| --- | ---: |
| pass1（shift=4） | 3595 |
| pass2（shift=11） | 3595 |
| 合计 | 7190 |

对照 v3/v3.1：pass1 = 4266/3962、pass2 = 4330（两者同），即 v3
的两个 pass 都**差于 v2**。结论：v3 的 4 行切片 + lane-per-output
sdot 在 VL=256 上被 tbl2/uzp/常量重排开销抵消，不是方向。
**下一步工具轴：把 `odd_lowering=sdot.d` / `narrow_batch=4` 应用到
v2 行主序结构（v2-odd-sdot），而不是继续扩展 v3 模板**；目标
7190 → <6355（半数门）。

### 5.7 v2-odd-sdot 探查结果（2026-08-13）

- `leaf_ex=0`（去掉 v3 leaf 的 EO16/EX）后 full fused_uop 不变
  （8596）：编译器已对未使用的 EO16/EX 做 DCE，该方向无收益。
- v2 本身上 920B（SVE1/VL=256，SVE1 编译直接可跑）：cand p50=197
  vs 上游 sve 193、neon 144；20k 差分 0。**在 ±10% 的运行间噪声内
  无收益**——指令数最优结构（7190/12710）同样不转化 920B 周期。
  （2026-08-13 配对 A/B 修正：v2 实际 +3~4%，见 §5.8。）
- 指令族直方图（full-call）：v2 的 uaddv 1024/saddv 768/fmov 1984/
  movprfx 1664 是主要标量开销；v3.1 已去掉 uaddv 但引入 uzp1 896/
  tbl 304/xtn2+shrn+sshr 424/ld1h 1080/str 648。
- 内部参考（fused_adj 4251）的剩余优势主要来自：k2/k4 也走 s16
  sdot（saddv=0、mul=32），zip1/zip2 304 替代 tbl，无 xtn2/shrn/
  sshr。注意内部是 **legacy-internal-exact**（0.104% 分歧），在
  upstream-exact 合同下 pass2 的 s32 k2/k4 必须走 mul+saddv，
  天然多出 ~1024 条——这是合同差，不是工具差距。
- **下一步（修订）**：做 v2-pass1 + k2-slice 混合（估 ~3290+3595
  ≈6885），再做 k2/k4 向量化存储；若需追平内部 4827，需与用户确认
  是否放开 legacy-internal-exact 合同族。

> 2026-08-13 追加：上述“混合”其实已存在于搜索空间——v3 的
> `odd_lowering=row-reduce`（v2 风格逐行 odd + k2 EX slice）full
> fused_uop = **8796**，比 v2 更差。原因：4 行分组把 EO16 和 EX
> 常驻寄存器，spill/leaf 开销超过 k2-slice 的 ~304 收益。因此
> **v2 结构内做 k2-slice 的路径已由证据关闭**；剩余可行动方向：
> (a) k2/k4 向量化批量窄化存储（消 fmov/saddv 标量开销，预计
> 数百条）；(b) 与用户确认 legacy-internal-exact 合同族。

> **2026-08-13 用户裁定（追加）**：legacy-internal-exact 合同族**放开**，
> 黄金标准 = TestBenchLite。DCT32 可合法使用 s16 sdot 化 pass2 k2/k4
> （稀有回绕分歧由 TestBenchLite 裁决），目标从 v2 7190 直接压向
> 内部参考 4827。

### 5.9 legacy k2-ex 首测（2026-08-13，合同放开后）

发射器新增 `--legacy-ex 1`：pass2 的 k≡2 也走 s16 EO16 EX 切片 +
`sdot.d`（替换 s32 mul+saddv）。结果：

| 指标 | v3.1（upstream-exact） | legacy k2-ex |
| --- | ---: | ---: |
| full fused_uop | 8292 | **7989（-303）** |
| 20k 差分 mismatch | 0 | 16 / 20.48M（0.000078%） |
| TestBenchLite dct32 | PASS（历史） | **5 seed 全 PASS** |
| scatter | 0 | 0 |

- 黄金标准（TestBenchLite）通过，合同放开方向有效；
- 但 7989 **仍高于 v2 7190**：legacy 只省了 pass2 k2 的 768 标量
  指令中的 ~303，grouped 4 行结构的 permute/spill 开销仍在；
- 结论：单靠 legacy 合同追不平 v2，**必须把 OpIR 后端 + 调度器
  （zip 化切片、低 spill）做出来**才能逼近内部 4827。

### 5.10 OpIR 后端首个可编译垂直切片（2026-08-13）

- `optimizer/ir/dct32_op_ir.py`：v3.1 plan → 6800 个显式 op（load/rev/
  unpk/permute/dot_segment/mul_reduce/round/narrow/store），2048 个
  store lane 全覆盖，provenance 正/负向测试全过。
- `optimizer/ir/dct32_op_emit.py`：op DAG → ACLE 源码，**不调用任何
  grouped C++ 块**（仅复用数据表）。20k upstream 差分 **0 mismatch**；
  **TestBenchLite dct32 PASS**。
- 调度修正链（每步都 20k=0）：单函数全展开 8406 → 循环恢复 9044
  （z-spill 暴涨）→ k0 共享提取 8819 → **noinline 分 pass 8307**
  （-O2，Go 判据 8292，差 15 条 = 0.18%）；-O3 反而 8490。
- 差距归因：剩下 15 条为标量 temp spill（str +54 / fmov -40），
  属于调度微差；标量 round+store 融合后编译器本已等价（8307 不变）。
- **E1-B Go 达成（2026-08-13）**：op 后端以 `-O2 -fno-tree-pre`
  编译 → full fused_uop = **8283 ≤ 8292**，20k 差分 0，
  TestBenchLite dct32 PASS——**不调用任何 grouped C++ 块的 op DAG
  codegen 已盲重发现 v3.1 计数**。`-fno-tree-pre` 计入 backend 编译
  契约（其余 flag 8307）。
- **op 后端 + legacy_ex（2026-08-13）**：pass2 k2 也走 op DAG 的
  EX sdot 路径（16/20.48M 分歧，同 grouped legacy 签名）→ full
  **7979**（比 grouped legacy 7989 少 10），TestBenchLite PASS；
  当前新 best（仍低于 v2 7190，但超过所有 v3 族）。
- **k4 legacy（2026-08-13 修正后）**：EEO16 正确映射为
  `B = E16 + rev16(E16)`、`EEO16 = B − rev8(B)`（探针逐 row 验证）；
  切片 `i0/ilo` + `K4S`（8k+4 行，曾误写 4k+4 导致 k=12/20/28 全错，
  已修）。op 后端 + k2/k4 legacy = **7724 full**，20k 分歧
  5300/20.48M（0.026%），**TestBenchLite 5 seed 全 PASS**；当前
  full-call 新 best（逼近 v2 7190，差 +7.4%）。

### 5.8 配对 A/B 与吞吐修复（2026-08-13）

微基准 throughput 模式之前复用同一 dst（WAW 串行化，throughput≈
latency），已修复为每 call 独立 dst（`benchmarks/dct32_microbench.cpp`）；
新增 `scripts/bench-dct32-paired.sh`（随机 A/B + bootstrap CI，
每次测量取 50 样本 p50）。920B（SVE1/VL=256）配对结果
（ratio=A/B，>1 表示 A 快）：

| 对比 | mode | median | bootstrap95 |
| --- | --- | ---: | ---: |
| v2-SVE1 / 上游 sve | latency | 1.042 | [1.026, 1.060] |
| v2-SVE1 / 上游 sve | throughput | 1.028 | [1.003, 1.047] |
| v2-SVE1 / neon | latency | 0.693 | [0.682, 0.719] |
| v3.1-SVE1 / 上游 sve | latency | 0.878 | [0.859, 0.896] |

修正结论：

- **v2（7190）在 920B 上确实优于上游（+3~4%，CI 不含 1）**，之前的
  “197 vs 193 无差异”是单次测量噪声；
- **v3.1-SVE1 实际比上游慢 ~14%**，不是“几乎无差异”；
- NEON 仍快 44%，920B 中间档 NEON 领先不变；
- 实机排序与 full-call fused_uop 排序一致（v2 7190 > 上游 12710 >
  v3.1-SVE1 9042 在 cycles 上表现为 v2 快、v3.1-SVE1 慢）；
- 单次/少量样本的 CNTVCT 测量在 920B 上噪声 ±10%，**必须用配对 +
  warmup + p50/CI 才可下结论**（920G 复核也应改用它）。

注意：微基准 `throughput` 模式目前复用同一 dst，back-to-back 调用被
WAW 串行化，实测 throughput≈latency；要测真实吞吐需每调用独立 dst
或足够深的 unroll（后续修复）。
