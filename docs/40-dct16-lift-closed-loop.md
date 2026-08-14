# DCT16 闭环实验：MachineIR 线 → 配方种子 → 搜索复现（2026-08-14）

> 长期目标（/goal）的首个验收：新算子免手写特化发射器即达到手写特化
> 水平。DCT16 是试金石——它同时拥有通用线产物（m30 seed、roundtrip、
> lane 追踪）和特化线结果（699/847 fused/MCA）。

## 1. 闭环定义

```text
kernels/dct16 上游 NEON（dct16_neon）
  → ① 抽取：LLVM IR import（m30 seed，2244 节点）✅ 已完成
  → ② 检测：lane 追踪 + 共享常量矩阵（MachineIR 线，本实验补齐数值
     常量解析）
  → ③ 配方匹配：检测结果 → 蝶形族配方（odd/even k 族、G16 行号）
  → ④ 轴种子：配方事实 → 布局轴建议（legacy/narrow_merge/even_sve…）
  → ⑤ 搜索：search_sve2_layouts 全轴空间 → 复现 699/847（已存在工具）
  → ⑥ 验收：20k 差分 + TestBenchLite + fused/MCA 对照
```

“免手写”的含义：①②③④对 dct16 不得使用 dct16 专属的手写 Plan/发射器
逻辑；只允许通用检测 + 配方库（蝶形族配方本身是知识层资产，跨算子复用）。
⑤⑥复用现有搜索/验证工具。

## 2. 里程碑与验收

### M1a：MachineIR 线数值常量解析 + 共享矩阵检测（本实验第一步）

- 输入：`experiments/m30-dct16-search/imported/machine-ir.json`；
- 常量源：load 节点已带 `const_name/const_off`（g_t16 + 字节偏移）；
  试点用配方库 G16 表解析（通用版后续改 ELF/rodata 符号解析）；
- 验收：检测命中数与 asm 线报告
  `shared-matrix-discovery.json`（39 个）一致或超集；
  命中常量逐值匹配 G16 行。

### M1b：配方匹配 + 轴种子

- 输出 `recipe-seed.json`：kernel=butterfly/dct16，odd/even 行号、
  splat 计数、轴种子（legacy_semantics/narrow_merge/even_sve/
  pass1_quarter…）+ 每条建议的证据（命中 id/常量行）；
- 验收：轴种子覆盖 699 组合的关键轴取值（pass1-quarter、
  legacy_semantics=1、narrow_merge=1、even_sve=1）。

### M2：搜索复现

- 用 M1b 种子约束后的轴空间跑 search_sve2_layouts（op 后端）；
- 验收：不手工挑选，复现 fused 699 / MCA 212（或更好）。

### M3：推广

- 同一流水线跑 m18 interp8、m2 sa8d seed；
- 验收：各达到与手写特化相同或更好的 fused/MCA。

## 3. 时间盒与止损

- M1a+M1b：1 个会话；M2：1 个会话；M3：每 seed 1 个会话；
- 任一步超预算先落差距文档（缺什么 op kind/布局自由度/常量源），
  回到混合路线，不无限投入；
- 特化线交付（950 数据、interp4vpp paired、ipb16 重测）并行不受阻。

## 5. 执行记录（2026-08-14）

### M1a ✅：MachineIR 线数值常量解析 + 共享矩阵检测

- `optimizer/analysis/linearize.py` 新增：
  - `resolve_const_loads()`：读 load 节点的 `const_name/const_off`
    （试点常量源 = 配方库 G16 表）；
  - `lane_forms(ir, const_values)`：smull 遇常量叶子时按**叶子 lane
    映射**缩放系数（首版按 slot i 取值，shuffle 后错位；修复后
    consts 变为完整 G16 行）；
  - `shared_constant_matrix_outputs()`：asm 检测器的 MachineIR 移植。
- 新工具 `tools/dct16_recipe_seed.py`：seed → 检测 → 配方匹配 →
  轴种子 JSON。
- 结果（m30 seed，2244 节点）：
  - **44 命中**（asm 线 39 的超集），13 个唯一常量签名 vs asm 9 个，
    交集 8；多出的 5 个是偶路径（k4 行 4/12、k0 行 8 的
    [83,36,-36,-83] / [64,-64,-64,64] / [36,-83,83,-36]）；
  - asm 独有的 `[1,1,1,1]` 是 k0 偶路径的归一化形式（asm 线折叠系数），
    MachineIR 线用原始值匹配到 G16 行 8，覆盖面更完整；
  - 奇数行 1/3/5/7/9/11/13/15 全部精确匹配 G16（含 revneg 变体）。

### M1b ✅：配方匹配 + 轴种子

- `recipe-seed.json`：kernel=dct16/family=butterfly，odd_rows=全 8 行、
  even_rows=[4,8,12]，轴种子：
  `pass1=quarter, pass1_k_tile=2, pass2=odd-quarter, pass2_k_tile=1,
  legacy_semantics=1, narrow_merge=1, even_sve=1`；
- 与手写 699 组合逐轴对照：种子覆盖其全部关键轴（699 的
  `pass1_even_factor=1` 可由偶路径检测补充，种子未显式给出）。

### M2 ✅：搜索复现

- 全新 outdir 重跑 `search_sve2_layouts.py --backend op --kernel dct16
  --workers 8 --rank-by mca ... --outdir experiments/m30-dct16-search/
  lift-search`（32 候选全过差分）：
  - **fused 699 / MCA 212 / est NP1 125.5 / cp 43 / lite 5/5 PASS**，
    与 layout-search-proxy 完全一致；
  - 胜出组合正是轴种子指向的角落。

### 结论

对 dct16，**抽取（M1a）+ 配方匹配/轴种子（M1b）+ 通用搜索（M2）的闭环
已跑通**：从上游 NEON 的 LLVM IR seed 出发，无需手写轴即自动指向并复现
手写特化最优（699/847）。剩余：
- M1a2：常量源从配方 G16 改为 ELF/rodata 符号解析（通用性）；
- M3：m18 interp8、m2 sa8d 走同一流水线。

## 4. 通用性边界（本实验明确记录）

- 常量解析先用配方库 G16（知识层资产），通用版改为 ELF/rodata 符号
  解析（记录为 M1a2）；
- 检测只覆盖“共享常量矩阵 × 逐行叶子”形状；其他结构族（滑动窗、
  差分归约）由后续配方扩展，不在本实验范围。
