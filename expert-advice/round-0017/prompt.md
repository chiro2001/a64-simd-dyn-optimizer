# Round 0017：寄存器 spill 最小化专题咨询（GPT-5.6-sol，max）

你是 AArch64/SVE2 编译器后端与图优化方向的高级专家。项目的自动
优化器按 manifest 布局轴生成 x265 SIMD kernel（SVE2，VL=256），
目标是让生成的 kernel **reg spill 快速收敛**，从而逼近 cycle 最优。
请先读 `expert-advice/round-0017/context.md` 与本仓库下列文件（其余
文件不要无选择读取）：

- `docs/06-agent-iteration-protocol.md`（协议/咨询命令）
- `docs/16-tool-inventory.md`、`docs/23-current-flow-and-agent-deps.md`
- `docs/26-compiler-env-hip09-hip12.md`（MCA/双目标）
- `docs/27-idct16-plan.md`（IDCT16/32 优化记录与反例）
- `tools/emit_idct32_sve2_shared.py`（emitter：mul/sdot-s32/split/pair/zip32）
- `tools/search_sve2_layouts.py`（搜索/统计/MCA/lite）
- `optimizer/mca_targets.py`、`optimizer/analysis/cost.py`
- `kernels/idct32/manifest.yaml`

禁止读取 /tmp 下任何内部手写 kernel（如 /tmp/dct-sve.s）；不得修改
源码、manifest、实验产物或构建目录。只把最终建议写入
`expert-advice/round-0017/` 下的 `summary.md` / `tooling-roadmap.md` /
`verification.md`。

## 需要回答的问题（按优先级）

1. **ACLE 生成路径**：对“g++ -O3 -march=armv9.4-a+sve2p1 生成的大
   内联 SVE kernel（数千条指令、数百个同时存活向量）”，有哪些
   后端参数/标志能显著降低 reg spill？请给出具体命令与预期收益：
   GCC（-fweb、-frename-registers、-fno-tree-pre、寄存器压力启发式、
   -fsched-pressure、-O2 vs -O3 等）与 Clang（-mllvm -regalloc=...、
   -mllvm 调度/压力选项等）各列出 2-4 个最值得试的，并说明机制与
   适用场景。注意项目实测：sdot 候选 -O3 优于 -O2（-O2 spill 更
   多）；-fno-tree-pre/-fweb/-frename-registers 对 mul 版无改善。
2. **直接 asm 生成路径**：如果 emitter 直接生成汇编（不经过 C++/
   ACLE），应如何做寄存器分配与调度以最小化 spill？具体到：
   a) 图优化层面（活跃性/干涉图、线性扫描 vs 图着色、按 chunk 划分
   减少峰值存活、两遍蝴蝶/累加器分组、常量 rematerialization）；
   b) 调度层面（liveness-aware 指令调度、volatile/内联 asm 对调度的
   约束、movprfx 融合）；
   c) 调用/函数边界（noinline 辅助函数、clobber 声明、按行组拆分
   函数减少同时存活）。
   给出可以在本项目 emitter 里落地的具体 pass 或代码结构建议。
3. **搜索回路里的 spill 代理**：当前 fused_uop 已把 stack_vector
   （spill ld/str）计入，MCA 用动态流。除了指令数，还有哪些
   低成本 spill/压力代理可以在搜索里快速排序（例如按 chunk 峰值
   活跃、ldr_z/str_z 计数、liveness 范围估计）？如何防止“fused 更
   优但 spill/MCA 更差”的候选被误选（参考 sdot-s32-pair 反例）。
4. **zip32 失败归因**：本项目 zip32 写回转置（splice + uzp order
   1,2,4）在独立 QEMU 探针中正确，但集成到大 kernel 后 GCC 与
   Clang 都产生错误输出（前 8 行 0-7 列正确、其余错误且值来自后续
   chunk）。请评估最可能的根因（寄存器压力/大函数调度/越界 UB/
   别的），并给出 1-3 个可执行的诊断或修复实验（例如拆分函数、
   消除越界读、显式寄存器分配、降低 chunk 内峰值活跃），以便下一
   轮验证。

## 输出要求

- `summary.md`：结论与按信息增益排序的 1-3 个下一轮实验（含预期
  成本/收益、如何验证）；
- `tooling-roadmap.md`：可落地的工具/pass 路线图（emitter、搜索、
  MCA/est 代理）；
- `verification.md`：每个建议的验证方法与门禁（20k 差分、
  TestBenchLite、fused_uop、动态 MCA、NP1/920B vector_lb）；
- 明确区分“事实 / 推断 / 需实验验证”；总预算 ~150k tokens，完成后
  直接落盘，不要无限深入。
