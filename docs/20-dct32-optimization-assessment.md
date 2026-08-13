# DCT32 优化评估（2026-08-13，v1 管线打通）

## 1. 基线（QEMU VL=256）

| 实现 | dynamic | vector | movprfx | fused_uop |
| --- | ---: | ---: | ---: | ---: |
| 上游 x265::dct32_sve（128-bit 风格） | 13362 | 12710 | 0 | 12710 |
| 工具生成 v1（16-lane SVE2，叶子缓冲） | 21218 | 9974 | 1032 | 8942 |
| 工具生成 v2（行主序，叶子不落缓冲） | 16768 | 8854 | 1664 | 7190 |
| 工具生成 v3（4 行切片 + lane-per-output sdot） | 6129 | 4634 | 368 | 4266 |
| **工具生成 v3.1（+ k≡2 pass1 切片）** | **5785** | **4226** | 264 | **3962** |

- v2 相对上游 -43.4%（near-gate）；**v3 相对上游 -66.4%（0.336x，
  HALVED）**，fused_uop=4266 已低于内部参考的 4827（fused_uop 口径），
  与内部 fused_adj=4251 基本持平（4.17 vs 4.15/输出）；零 scatter、
  200k 差分 0（upstream-exact）。
- **v3.1 相对上游 -68.8%（0.312x）**：fused_uop=3962，per_out=3.87，
  已**正式超越内部参考**（4251/4827），且保持 upstream-exact、零
  scatter、200k 差分 0。
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
stack_vector 229（spill 下降）。**半数门与内部参考双达标**。

### v3.1：k≡2 pass1 同构切片（2026-08-13）

- pass1 的 EO 是 s16（上游 pass1 用 sdot）：4 行组再切 EX0/EX1
  （每行 4-lane 切片），每个 k≡2 用 2×sdot .d（[g[0..3]]×4、
  [g[4..7]]×4）+ 同一套 uzp1/rshrnb/uzp1_s16 归约（6 条/组/k，
  替代逐行 mul+saddv+fmov 的 12+）；
- pass2 的 EO 是 s32（避免回绕），保持 vmul 路径；`if (shift == 4)`
  由模板常量折叠；
- 结果 4266 → **3962**；每输出 4.17 → 3.87（内部 4.15）。

### P0 轴解耦（round-0012，2026-08-13）

- 按顶级模型建议把 v3.1 的第一个独立机制拆为搜索轴
  `pass1_k2_slice ∈ {0,1}`（manifest + 发射器 `--pass1-k2-slice`）；
- 回放验证：`layout=v3, pass1_k2_slice=0` = **4266**（历史 v3 计数），
  `=1` = **3962**（v3.1），两者 20k 差分 0、零 scatter；v1/v2/v2b
  不受该轴影响（源码哈希去重）；
- 续（同批）：`odd_lowering ∈ {sdot.d, row-reduce}` 与
  `narrow_batch ∈ {1, 4}` 也拆为独立轴，得到 6 个 v3 消融点
  （20k 差分全 0、零 scatter）：

  | v3 组合（k2 slice / odd / narrow） | fused_uop | 说明 |
  | --- | ---: | --- |
  | 1 / sdot.d / 4 | **3962** | v3.1，保持 best |
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
  canonical = 4189 vs derived = **3962（+227）**，证明“常量吸收”净省
  ~227 fused_uop；全部 20k 差分 0、零 scatter。当前 64 个 manifest
  组合去重后 14 个唯一候选，全搜索约 37s，仍在 <60s 预算内。
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
  模板仍盲搜回 <=3962”为 Go 判据。

### P1 增量 3-4：按块组装 + rewrite 驱动搜索（round-0012，2026-08-13）

- **增量 3（结构解耦）**：`emit_dct32_sve2_shared.py` 的分组体改为
  `_grouped_body_cpp()` 按机制块组装（leaf / odd slices / k2 EX /
  odd / k2 / k4 / k0，块由独立轴选择）；新增 `emit_grouped()`，plan
  路径不再携带 `layout` 预设。`emit(layout=v3)` 与 `emit_grouped()`
  输出逐字节一致（sha d67990fab4b6…），搜索/finalize 计数不变（3962）。
- **增量 4（搜索由 rewrite 定义）**：`tools/search_plans.py` 从规格
  plan 枚举 18 个合法 rewrite 子集（无 assign 2 个 + 有 assign 16 个），
  每个计划过 `verify_layout` → `lower()` → 编译 → 与 P0 搜索结果按
  源码哈希对齐。结果：18 计划 → 12 个唯一候选，best 仍为
  `k2=1/sdot.d/narrow=4/derived` = **3962**（零 scatter），即
  “搜索空间由原子 rewrite 定义、不使用 manifest layout 字符串”的
  E1 验收已实质性达成；复合 `pass_grouped_cpp` 仅保留为旧搜索路径的
  兼容包装。
- 剩余诚实口径：`emit_grouped` 仍复用同一批 C++ 块（plan 的 tiles 语义
  暂由 rewrite 证书承载，未逐块反汇编成 op 级 IR）；op 级原子后端是
  P1 的后续增量，不作为当前 Go 判据。

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
