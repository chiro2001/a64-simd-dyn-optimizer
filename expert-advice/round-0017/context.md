# Round 0017 context（2026-08-14）

专题：**生成 kernel（尤其直接 asm）中的寄存器 spill 最小化**——通过图
优化或后端参数快速收敛 regspill，进而逼近 cycle 最优。主流程不阻塞
等待，建议落盘后由主 Agent 写 `decision.md`。

## 项目

- x265 SIMD kernel 自动优化器（SVE2，VL=256，QEMU `max,sve-max-vq=2`）。
- 流程：manifest 布局轴笛卡尔积 → emitter 生成 ACLE C++ → g++ -O3 →
  QEMU 20k 差分（upstream-exact）+ TestBenchLite（5 seed）→
  true-dynamic 指令计数（fused_uop）→ 自定义 llvm-mca（neoverse-v2 +
  sve2p1 补丁，动态流）→ NP1/920B 双目标宽度下界（vector_lb）。
- 关键工具：`tools/emit_idct32_sve2_shared.py`、`tools/search_sve2_layouts.py`、
  `optimizer/mca_targets.py`、`optimizer/analysis/cost.py`、
  `docs/06-agent-iteration-protocol.md`、`docs/16-tool-inventory.md`、
  `docs/26-compiler-env-hip09-hip12.md`、`docs/27-idct16-plan.md`。

## IDCT32 当前状态

- best = sdot-s32 scatter：fused_uop 5878（vector 5110 / stack 426 /
  sg 256）、动态 MCA 1900（NEON 上游 3319，-43%）、NP1 vector_lb
  1255（NEON 2553.5，2.03×）；20k 0 失配 + lite 5/5。
- sdot-s32 scalar：fused 4704（更少）但 MCA 3518（写回路径/依赖链）。
- C 常量加载采用 volatile `load_c`（每 sdot 一条 ld1h），把 spill 从
  ~1650 压到 ldr_z 280/355、str_z 71/280。

## 本轮已跑的反例（2026-08-14）

1. `sdot-s32-pair`（chunk 对共享 C，ld1h 减半）：spill 大增，pair_scalar
   fused 5660（+20%）、pair_scatter 5583 但动态 MCA 1940 > 1900，拒绝。
2. `sdot-s32-split`（O/EO 累加器链 8→2×4、4→2×2，+192 adds）：
   scalar fused 5136（+432）、MCA 3586（+2%）；scatter fused 6252
   （+374）、MCA 1957（+3%）、vector_lb +9%；拒绝。
3. `zip32`（32×8 寄存器转置写回：splice 列对 + uzp order 1,2,4 +
   连续 st1h）：转置模式已用独立 QEMU 探针验证正确（synthetic n 与
   kernel 同构 n 均 bad=0），但**集成到 kernel 后 20k 差分 ~89% 失配**
   （GCC 16 与 Clang 22 都错）；现象为“前 8 行第 0-7 列正确、其余
   全错，值来自后续 chunk 的 n 向量”。疑似大函数寄存器压力/UB
   （chunk 3 的 16-lane 加载读越 1024 元素缓冲 8 个元素）交互。
   coef 加 padding 未修复。zip32 已暂停，正是本专题要解决的场景。

## 咨询约束

- 只写 `expert-advice/round-0017/` 下的
  `summary.md` / `tooling-roadmap.md` / `verification.md`；
- 不修改源码/manifest/实验产物/构建目录；
- **禁止读取 /tmp 下内部手写 kernel（如 /tmp/dct-sve.s）**；
- 建议按信息增益排序，区分“事实/推断/需实验验证”，控制在 ~150k
  tokens 内完成并落盘。
