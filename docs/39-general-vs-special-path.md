# 通用路径 vs 特化路径：以 DCT16 为对照（2026-08-14）

> 目的：把项目里两条优化路线的事实、成败和差异整理清楚，用 DCT16 作为
> 同一算子的对照样本，指导“通用优化路径”后续怎么走。

> **2026-08-14 更新（用户确认）**：两条路线不是竞争关系，而是同一系统的
> 三个层次。本文档保留原对照作为证据；长期方向以 §6 三层框架为准。

## 1. 两条路径的定义

### 1.1 通用路径（LLVM IR / MachineIR / PackIR / SpecIR）

设计见 docs/02 §5-6、docs/05 M2/M3：

```text
x265 现有 NEON/SVE 实现
  → restricted LLVM IR importer（machine_ir.py）
  → target-aware seed MachineIR（保留指令/寄存器/布局）
  → ISA 语义投影 PackIR（去掉 opcode 的布局抽象，设计目标）
  → codegen roundtrip（codegen.py，按 seed 生成 NEON/SVE C++）
  → 通用 rewrite（rewrites.py：widen/mul64_to_shift/wide_loads/
    tree_to_mla/hoist_shuffles）
  → search_driver.py（rewrite 组合 → 编译 → 静态 Pareto 排名）
```

现状：importer 是 restricted 窄解析器（load/zext/sub/add/shuffle/
bitcast/AArch64 intrinsic/lshr/ret，未知指令直接报错，保证不丢语义）；
已有 4 个 seed：sa8d（m2）、dct8（m12）、interp8-8x8（m18）、
dct16（m30）；codegen 已覆盖 sa8d/dct8/dct16/interp8 的 NEON 与部分
SVE 路径。

### 1.2 特化路径（op DAG / Plan / 布局轴 / 原子 rewrite）

```text
kernels/<name>/manifest.yaml（布局轴 + 合同 + corpus）
  → layout_plans()（笛卡尔积 + layout_prune）
  → Plan / lower_plan_to_ops（dct32_op_ir / dct16_op_ir）
  → op DAG（共享 Op 类型，op_ir.py）
  → op 发射器（dct32_op_emit / dct16_op_emit，if-kind → ACLE）
  → search_sve2_layouts.py（编译/20k 差分/trace/MCA/cp/lite/
    consensus/finalize）
  → 原子 rewrite（dct32_rewrites / dct16_rewrites，带 ProofCertificate）
```

现状：DCT32/DCT16 已迁移到同一 op 体系；其余族（interp/sa8d/idct）
仍用 grouped 发射器 + manifest 轴，未完全接入 op 后端。

## 2. DCT16 两线对照（同一算子）

| 环节 | 通用路径（m30 seed） | 特化路径（op 后端） |
| --- | --- | --- |
| 输入 | 上游 `dct16_neon` 全展开 LLVM IR：**2244 节点**（intrinsic 960、shuffle 304、mul 187、add 368、sext 132、store 64、load 44…） | manifest 布局轴 + 手写 Plan/发射器 |
| 锚点 | NEON roundtrip codegen：QEMU **20 万例 0 失配**（与上游位级一致） | op 后端锚点 ≈1511 fused（上游 NEON 基线 1808/509） |
| 通用 rewrite | `hoist_shuffles`/`fold_shuffles_into_constants` **命中 0 次**——实际数据形状是“共享常量矩阵 × 逐行叶子”，不是 elementwise 对齐置换 | 轴：pass1/pass2 k_tile、narrow_merge、legacy、pack_zip、even_sve、store_merge16 等 |
| 结构发现 | 动态流 lane 追踪：发现 **45 个可常量重排的窄化输出**（24 个 splat 求和 + 21 个 g_t16 奇数行点积，常量逐值匹配）——“常量重排”结构被工具自动检测到 | rewrite 序列 `[legacy_k2, legacy_k4, merge_narrow8, k0_even_sve]` 自动搜索；布局搜索 best **699 fused / MCA 212 / cp 43**（847/220 次优），过减半门（904） |
| 最终状态 | 检测完成、**发射未完成**（lane 线性化 `linearize_max_terms` 设计后未落地），项目转投特化路径 | 已固化 `kernels/dct16/candidates/best_op_mca.{cpp,S}`，TestBenchLite 5/5 PASS |

结论：**通用线证明了“导入 + 回环”可行且语义保真，也自动发现了常量重排
结构；特化线用轴 + rewrite 把同一洞察固化成可搜索空间，最终拿到了结果。**
两条线缺的恰好是对方有的：通用线有自动导入/检测但没有可搜索的结构空间；
特化线有可搜索空间但锚点 Plan 和轴要手工设计。

## 3. 通用路径为什么没有直接产出优化

1. **搜索发生在已完全 lower 的指令流里**：MachineIR 保留指令、寄存器、
   布局，rewrite 只能做局部指令级变换，没有数据布局自由度（行分组、
   打包、store 形状、常量预排列都不在它模型里）；
2. **“通用”其实是按 seed 拉动的小词汇表**：rewrites.py 的模式是为
   dct8/sa8d 形状设计的，在 dct16 上命中 0 次；真正需要的共享常量矩阵
   规则需要新的 lane 线性化机制，设计出来后未完成发射；
3. **PackIR 投影没有接到搜索**：docs/02 设计了 opcode-free 的布局抽象
   （PackIR），但 search_driver 直接搜 MachineIR rewrite，布局自由度
   从未进入搜索空间；
4. **自动细排名被取消**：search_driver P0 记录——修复依赖图后静态模型
   仍有负 held-out Spearman，静态关键路径把上游排最慢而实测最快；
   只能静态 Pareto + 每个候选实机测量；
5. **SVE256 结构不在 NEON seed 里**：seed 是 128-bit NEON 指令流，
   通用线只能微优化 NEON 基线；SVE256 的行宽/指令选择/常量布局是另一个
   结构空间，通用线没有表达它的轴。

## 4. 指导方向：通用前端 + 特化后端（合并而不是二选一）

通用路径的价值在“锚点自动获得 + 结构自动检测”，特化路径的价值在
“结构空间 + 自动搜索”。合并路线：

1. **保留通用线已成功的部分**：
   - LLVM IR 导入 + roundtrip（语义锚点/正确性，m30 已验证）；
   - 动态流 lane 追踪 / 共享常量矩阵检测（结构发现，45 个输出已证明）；
   - `interp.py` 解释器（imported MachineIR 语义验证）；
   - provenance（候选来源审计）。
2. **补齐 PackIR → Plan 投影**：把 imported MachineIR 按 lane semantics
   lift 成标准 Plan/op DAG（复用 patterns.py + permute_search.py），让
   “导入的上游结构”直接变成特化搜索的锚点 Plan——消除手工 port；
3. **搜索统一在 Plan/op 层进行**：布局轴与原子 rewrite 都是特化引擎的
   词汇；通用线的发现（共享常量矩阵、lane 线性化）应落成新原子 rewrite/
   轴，而不是另起一个独立搜索器；
4. **排名统一用校准成本口径**：放弃静态特征细排名（已有负结果），沿用
   mca_targets（920B/NP1/950）+ 实机 paired；通用线的 cost_keys 只作为
   指令语义元数据，不作排序模型；
5. **闭环验证实验（dct16 为试金石）**：
   - 输入：m30 seed（2244 节点，已导入）；
   - 自动投影到 dct16 Plan/op DAG（不手工给轴）；
   - 只给 rewrite 库 + 布局轴全集，看能否自动重现在 699/847；
   - 若成立，用 m18（interp8）和 m2（sa8d）seed 重复同一流程——
     这就是“通用前端 + 特化后端”覆盖新算子的完整证据；
6. **明确不做**：在 MachineIR 指令流内做细排名；为每个 seed 手写专用
   rewrite 而不回流到通用库。

## 5. 与自动化路线（docs/38 §7）的关系

- 7.1 脚手架解决“新算子接入”（manifest 自动生成、签名驱动 harness、
  emitter registry、批量循环）；
- 通用前端解决“锚点自动获得”（导入替代手工 port，roundtrip 保语义）；
- 7.2 配方库解决“新结构发明”（Agent 设计一次，固化后自动实例化）；
- 三者合起来才是全自动覆盖的完整拼图；本文是通用前端接入特化后端的
  依据和验收口径。

## 6. 长期目标：三层框架（2026-08-14 用户确认）

项目的本质不是“通用 vs 特化”，而是**把特化搜索后端的逻辑抽取出来、
形式化、再交给通用搜索自动优化**。架构分三层：

```text
知识层：结构族配方（蝶形/滑动窗/差分归约/查表）× 轴 × 原子 rewrite
        × op 词汇 × ISA 目录 × mca_targets × 合同口径
   ↑ 抽取（检测→配方匹配→锚点）            ↓ 实例化（配方→可搜索空间）
抽取层：LLVM IR/MachineIR 导入 + roundtrip（语义锚点）
        动态流 lane 追踪/共享常量矩阵检测（结构发现）
        族识别 + 常量/映射提取 → anchor Plan + 候选轴
   ↓                                        ↓
搜索层（已通用）：轴枚举 + rewrite 序列搜索 + 并行/缓存
                  验证漏斗（20k/lite）+ 成本排名（MCA/cp/consensus）
                  固化 + 反馈（失败→新轴；实机/MCA 差异→校准）
```

一句话目标（/goal）：以三层流水线实现新算子**免手写特化发射器**即达到
或超过手写特化水平（**dct16 闭环自动重现 699/847 为首个验收**），最终
全自动覆盖优化 x265 全部 SIMD 算子。

验收口径：
1. dct16：从 m30 seed（2244 节点）自动 lift 到 Plan/op DAG（不手工给轴），
   仅用 rewrite 库 + 布局轴全集搜索，重现 699/847；
2. m18 interp8、m2 sa8d：同一流水线各达到与手写特化相同或更好的
   fused/MCA 指标；
3. 新族（quant/sao）：Agent 设计配方一次后，同族变体全自动接入。

边界：机器不负责从零发明新结构族；新族第一次配方设计仍是 Agent/人的
知识工程，之后全部自动化。
