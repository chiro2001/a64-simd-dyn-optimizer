# 从平坦动态 trace 恢复带控制结构的 kernel（Loop Recovery）

状态：**设计 + 原型工具（2026-08-13）+ 直连 trace 日志（2026-08-14）**。

## 1b. 2026-08-14 增量：直接吃 QEMU `-trace.log`

`tools/recover_loops.py` 新增 `--trace-log <log> --start <hex> --end <hex>`
（内部走 parse_exec），不再要求先导出中间 JSON。

在当前 dct32 best（3930，`experiments/m33-loop-recovery/loops-3930.json`）
上的恢复结果：5548 条动态指令 → **2 个顶层循环**（pass1/pass2，
各自 trip=2，period 1281/1395，深度 1）。op 后端的 pass 循环被完整
识别；循环体内是展开的计算块（sdot/permute/narrow/store）。

步骤 4-6（归纳/访存分析 → 结构化 IR → 发射器消费 LoopIR）仍是下一步。

## 1. 语义缺口（用户提出）

QEMU `exec+in_asm` 采集到的是**一条 kernel 调用的平坦动态指令流**：
循环在 trace 里体现为"同一段指令地址按迭代重复"，但循环/分支/归纳变量
等控制信息没有显式表示。现有工具链在这个流上做发现（共享常量矩阵）、
计数（true-dynamic）、以及布局评估，但**最终要交付的 kernel 必须带
控制结构**（循环、条件、谓词），否则：

- 优化 pass 无法做循环级变换（融合、交换、按 4×256 分块、批处理）；
- 无法判断循环不变代码/归纳变量，重排常量只能在展开体内重复；
- 发射器只能靠模板"重新发明"循环，而不是从优化后的流恢复。

关键澄清：当前 true-dynamic 计数已经是**循环执行后**的动态流（循环
每轮都出现在 trace 中），所以计数口径没错；缺的是"把这条流恢复成
结构化 IR/kernel"的环节，以及在这层结构上做循环级优化的能力。

## 2. 证据：v6 trace 的循环骨架（原型工具输出）

`tools/recover_loops.py` 用**回边分支**（向后跳转的 b/b.eq/b.ne/tbz/
tbnz/cbz/cbnz）定位循环体，按 (branch, period, body 签名) 合并重复，
对 v6 候选（1787 条动态指令）恢复出 12 个循环：

```text
pass1 k 循环     : backedge 0x400b6c b    trip=8 period=72  (16 k，2/轮)
pass1 奇偶分发   : backedge 0x400aec tbnz trip=7 period=37  (循环体内条件)
pass2 i 循环     : backedge 0x400c0c b.ne trip=8 period=33  (E/O/EO 构建)
pass2 奇数 sdot  : backedge 0x400cb4 b.ne trip=8 period=13
pass2 偶数路径   : backedge 0x400d24 b.ne trip=4 period=12  (k=2,6,10,14)
...
```

结论：平坦流中的循环结构完全可由地址重复 + 回边恢复，且与发射器/编译器
生成的循环一一对应。

## 3. 恢复流程设计

```text
exec+in_asm trace
  → 1. 回边检测：分支指令 + 目标地址 < 当前地址 → 候选循环
  → 2. 体签名合并：(branch, period, body) 去重，trip = 目标出现次数
  → 3. 嵌套：体包含关系 → depth；循环体内部的条件分支（tbnz 等）
        保留为控制节点
  → 4. 归纳/内存分析：体首尾寄存器/地址变化 → 步长、界限、归纳变量
  → 5. 结构化 IR：loop(header, body, trip, induction, mem_pattern)
  → 6. 发射器消费结构化 IR → 生成带循环的 C++/.S kernel
```

原型已实现 1-3（`tools/recover_loops.py`）；4-6 是下一步。

## 4. 对工具链的改动点

1. **asm-IR 增加控制节点**：`asm_ir.import_asm_trace` 目前是直线 SSA；
   循环恢复输出 `LoopIR`（或给节点加 `loop` 归属），优化 pass 可以
   按循环做变换；
2. **发射器接口**：`emit_dct16_sve2_shared.py` 的布局参数改为从
   LoopIR 派生（k 循环分块数、行分组、pass 融合），保证"恢复的结构"
   与"发射的结构"一致；
3. **评估口径**：保留 true-dynamic 计数（循环已展开），新增
   `loop_report`（trip/period/depth）作为结构化健康度指标——检查优化
   后 kernel 的循环是否被意外展开/合并/丢失；
4. **循环级搜索维度**（v7+）：按恢复的 LoopIR 枚举 k-loop 分块
   （2/4/8 k 每轮）、i-loop 分组（2/4/8 行）、pass 间融合，每个变体
   仍然走 asm 后端 + 上游差分 + true-dynamic 计数。

## 5. 风险

- 编译器会重排/旋转循环（do-while、跳入中间），trip/period 需要
  "最大一致重复段"分析而非简单首地址计数；
- 循环体内的条件分支（奇偶分发）会被误报为内层循环，需要用
  "分支目标在体内且无独立归纳变量"来过滤；
- 恢复出的结构是"当前 kernel 的实现结构"，不一定是唯一合理结构；
  搜索仍以恢复结构为起点，允许发射器生成不同分块。
