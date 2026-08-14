# 直接 asm pressure-budgeted 原型设计（2026-08-14，round-0017 P2/P3）

## 1. 目标与范围

第一个里程碑只做 **idct32 单 chunk 的 sdot 计算 + zip32 写回**，用
直接汇编 + 显式寄存器分配，验证能否把动态 MCA 从当前 1164（GCC
ACLE）再压下去。基线事实（`tools/peak_live.py`）：当前 best 峰值
活跃 Z = 31（已在 32 预算内）、spill（ldr/str/addvl）约占总指令流
12% 且均匀分布、无单一热点——因此原型收益预期 **≤10% MCA**，主要
来自消除 spill 与 prologue/frame 开销（窗口 0-500 有 175 条 setup）。

## 2. 寄存器预算

按 AAPCS 免保存区：`z0-z7, z16-z31`（24 个 Z）；wrapper 只在入口
保存 `d8-d15` 低 64bit（若确需 32 个 Z）。每 chunk 分阶段，保证
**每阶段峰值 ≤24**：

| 阶段 | 内容 | 活跃 Z | 分配 |
| --- | --- | ---: | --- |
| A | O 链（k_block=8 ×2 组） | 8 accs + 2 行 + d + C + 1 scratch = 13 | accs=z16-23；行=z0,z1；d=z2；C=z3 |
| B | EO 链（4 accs） | 4+2+1+1+1 = 9 | accs=z16-19 |
| C | EEO/EEEO/EEEE | ≤6 | 同上 |
| D | 蝶形（in-place） | 16 中间量 + 2 scratch = 18 | t/u=z0-15 |
| E | round+splice+uzp 转置 | 2 n + 1 w + 3 scratch = 6（逐对融合） | w=z0-7 渐进 |

## 3. 关键实现点

1. **O 阶段 k_block=8**：每组 8 个累加器、重走输入行
   （C++ 实测 k_block=8 因 GCC 调度 MCA +9，直接 asm 需用显式
   调度规避；若仍负，退回 16 accs + 接受少量 spill）。
2. **蝶形 in-place**：`EEEE/EEEO -> EEE -> EE -> E` 后覆盖已死输入；
   `E±O` 立即 round+narrow，不保留全部 32 个 t/u。
3. **round+splice 融合**：每对 n[2p]/n[2p+1] 窄化后立即 splice 成
   w[p]（C++ zip-fuse 中性，asm 中可省 movprfx：splice 目的与第一
   输入 tied）。
4. **常量**：C 用 `ld1h [base, #vnum, MUL VL]`（vnum 立即数），
   用完即死；不做跨阶段 CSE。
5. **movprfx**：按 docs/09 视为与下一条融合，asm 中不产生前缀
   （splice/udot 用 tied 目的寄存器）。

## 4. 验证与门禁

- 每阶段单测：20k 差分 0 失配 + TestBenchLite idct32 5 seed；
- 指标：fused_uop（目标 <5085）、动态 MCA（目标 <1164）、
  `tools/peak_live.py`（目标峰值 ≤24）、spill 计数（ldr/str/addvl
  目标 <430）；
- 失败条件：任一阶段 20k 非零即停；MCA 不优于 1164 则不替换 best。

## 5. 里程碑

| M | 内容 | 验收 |
| --- | --- | --- |
| M1 | 单 chunk O+EO+C 阶段 asm（无蝶形/写回），对照 C++ 数值 | 20k 0 失配 |
| M2 | +蝶形 + round+splice 融合 | 20k 0 失配，峰值 ≤24 |
| M3 | +uzp 转置 + 16 连续 st1h | 20k 0 失配，MCA 对比 |
| M4 | 4 chunk × 2 stage 全集成（wrapper + d8-d15 保存） | 全 kernel 20k/lite，MCA <1164 |
| M5 | 若 M4 达标，做成 emitter 的 direct-asm 后端轴 | 搜索接入 |

## 6. 风险

- 预期收益 ≤10%（spill 均匀、峰值已 31）；若 M3 起 MCA 无改善，
  记录阴性并停止（避免 1-2 天投入换 0）；
- k_block=8 重载行在 asm 中可能同样不划算；
- 直接 asm 维护成本高，仅在显著优于 ACLE 时才作为默认路径。

## 7. 进展记录

### M1 完成（2026-08-14）：O 阶段直接汇编

`tools/emit_idct32_o_asm.py` 生成 `dynopt_o_phase(src, cbase, off,
out)`：16 个 O 累加器（k_block=8 两组，z16-z23 / z24-z31）、行/d/C
scratch z0-z3、k-base 只用调用者保存 GPR x9-x16（无 callee-saved
clobber）。验证：QEMU 随机输入下与 C 参考逐位一致（bad=0）。

- 峰值 Z 活跃 = 12（≤24，零 spill 可能）；406 条指令（128 sdot +
  160 ld1h + 其余地址/zip/dup）；
- 关键修正：k-base 最初用 x9-x24（含 callee-saved x19-x24）导致
  main 崩溃，改为 k_block=8 + x9-x16 后通过；
- 行地址按 **64 字节/行**（int16 元素 ×2），初版误用 32 字节/行。

下一步：M2（蝶形 + round+splice 融合，z0-z15 中间量 in-place），
M3（uzp 转置 + 连续 st1h），M4（4 chunk × 2 stage 集成对比 MCA）。

### M2 成本分析（2026-08-14）→ 原型停止

蝶形 t/u 阶段：`t_k = E_k+O_k`、`u_k = E_{15-k}-O_{15-k}`，E_k/O_k
各被 t_k 与 u_{15-k} 消费两次。32 个 Z 全被 16×E + 16×O 占用时，任何
dest 覆盖都会破坏另一个源的后续消费；最小正确序列需 1 个 scratch：
`mov z4,z16k; sub z16k,z_k,z4 (u); add z_k,z_k,z4 (t)` —— **3 条/k =
48 ops/chunk**，而 C++ 只需 32（add/sub）。每 chunk 的 asm 净收益 =
spill 节省 ~54（430 stack/8 chunk）− 蝶形多出 16 = 仅 ~38 ops，且
O/EO/EEO 阶段地址算术与 C++ vnum 持平——预期 MCA 收益 ≤3-5%，不敌
实现/维护成本。

**结论：M1 已证明机制（固定寄存器 + 零 spill + 位精确），但 M2 起
无净收益，按 §6 止损规则停止直接 asm 原型**；保留
`tools/emit_idct32_o_asm.py` 作为未来 pressure-budgeted 工具的基础。
后续把预算转回：950/960 实机验收、或算法级改进（如两趟融合）。
