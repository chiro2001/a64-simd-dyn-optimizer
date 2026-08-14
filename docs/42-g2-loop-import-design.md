# G2：规范计数循环的导入期展开设计（2026-08-14）

> 背景：seed 线（LLVM IR/MachineIR）目前要求直线代码。此前 hpp 可
> unroll、vpp/interp4 是 switch+phi（已用分支剥离处理）；**idct16 是
> 第一个真正需要循环支持的 kernel**。

## 1. idct16 证据（为什么 unroll 失败）

`x265::idct16_neon`（dct-prim.cpp）在不同 clang 参数下的函数体：

| 参数 | 行数 | br | icmp | phi |
| --- | ---: | ---: | ---: | ---: |
| -O3 -funroll-loops（count=16, th=5000） | 3397 | 176 | 88 | 560 |
| 同上（count=32, th=30000） | 3397 | 176 | 88 | 560 |
| 同上（count=4, th=1000000） | 4549 | 192 | 504 | 504 |

结论：clang 保留循环，无法用编译期 unroll 旗标压平。

循环形态（结构证据）：
- **96 个 `icmp eq i64`** —— do-while 风格：`k++` 直到 `k == N`
  （典型 4 次迭代的逆蝶形 stage）；
- **496 个 `<4 x i32>` phi** + 8 个 i64 归纳变量 phi——循环携带的
  向量累加器（逆蝶形 t/u 累加链），正是 docs/30 §1.4 终止的“蝶形
  在位化困难”同款结构；
- 96 组 `br i1` 条件出口。

## 2. 方案：导入期展开（import-time unrolling）

不引入结构化循环节点（避免 lane_forms/codegen 全部重写），而是在
**extract_seed 文本层做 mini-unroller**：

1. 识别规范 do-while 计数循环：
   - 头块：`%iv = phi i64 [ init, %pre ], [ %next, %latch ]`
   - 退出：`icmp eq i64 %iv, %N`（N 为常数）+ `br i1 ...`
   - 锁存：`%next = add i64 %iv, 1` + `br label %header`
2. 克隆循环体 N 次：每次迭代把 phi dst 重命名 + 用迭代值替换
   （迭代 0 用 entry 入值，迭代 k 用上一轮体尾值），并替换归纳变量
   引用为常量 k；
3. 删除 br/icmp/phi 行，输出直线 IR 文本 → 现有 importer 直接导入；
4. 正确性由 roundtrip 门禁裁决（idct16 对照上游 idct16_neon
   位级一致）。

关键点：
- **phi 入值映射**：entry 入值 = 初始值；latch 入值 = 上一轮体尾
  （SSA 符号替换，与 strip_switch 的 phi 解析同思路）；
- **多入边/条件出口**：先只支持“单入口 + 单退出 + 常数 trip”；
  出现 break/多出口时显式失败（不静默丢语义）；
- **嵌套循环**：由外到内逐层展开（内层展开后外层体变大，文本处理
  即可）；
- 预算：展开后 idct16 预计 1.5~3 万节点，编译/门禁时间可接受
  （interp8-32 的 1952 节点门禁 ~30s 量级）。

## 3. 验收

1. `seeds/idct16.yaml`（mangled `_ZN4x26511idct16_neonEPKsPsl`）：
   导入 0 未知指令；
2. roundtrip 门禁：candidate vs 上游 idct16_neon，**100k cases
   mismatches=0**；
3. seed_pipeline（kernel idct16）：复现或优于手写特化（文档记录
   为 980/246 系，以搜索实际结果为准）。

## 4. 风险与回退

- 循环体含条件（break/if）→ 本方案失败：记录具体形态，考虑结构化
  循环节点或 qemu 动态流旁路；
- 展开体过大（>5 万节点）→ 门禁慢但正确性优先；必要时对 idct32
  采用“半展开 + 结构化循环”混合；
- 不做：修改 x265 源码加 pragma unroll（上游不改）。

## 6. 2026-08-14 实测更新：idct16 需要结构化 CFG（不止计数循环）

进一步分析证明 idct16_neon 的控制流是**循环索引相关的数据依赖分支**：

- `%77 = bitcast <4 x i16> %76 to i64; %78 = icmp eq i64 %77, 0;
  br i1 ...` —— 源里 `if (g_t16[k][j] != 0)` 跳过 smull 的优化，
  其中 g_t16 的**行/列索引是运行时循环变量**；
- 验证 1：clang unroll 旗标（count=32 / threshold=1e6）只部分展开，
  保留 192 br / 504 phi；
- 验证 2：把源码常量表 `@g_t16` 注入 .ll 后跑
  `opt -passes="function(sccp,instcombine,gvn,simplifycfg)"`——
  **无法折叠**（索引运行时，load 不恒定），CFG 不变。

结论：idct16 的导入不能靠“计数循环导入期展开”，需要
**结构化 CFG 导入器**：块图 → 循环/条件，数据依赖分支用 select/phi
合并表示（即 docs/02 的 PackIR 路线上的 CFG 重建）。这是独立里程碑
（G2b），工作量 ~1 个专职会话；在此之前的正确性/优化均由既有特化
路径（op 后端 + 分组发射器）覆盖，不阻塞主目标验收。

## 7. 2026-08-14 二次实测：结构已精确拆解（G2b 路径已验证）

用 Tarjan SCC 分析 idct16_neon 的真实 CFG：

- **无多块循环**；只有 **8 个单块自循环**（do-while，iv 0→4→8，
  2 次迭代，块内处理 4 行）；
- 自循环**可以被 LLVM 解决**：把 br 上的 `!llvm.loop` metadata
  剥离（x265 源码 pragma 禁用了 unroll）后，
  `opt -passes="loop-unroll-full"` 成功展开（br 192→184，
  self-loop 引用归零）；再跑
  `function(sccp,instcombine,gvn,simplifycfg)` → 176 br / 88 icmp；
- 剩余 88 个 `icmp eq i64 <bitcast <4 x i16> 中间值>, 0` 来自源码
  `partialButterflyInverse16_neon` 的
  `if (vget_lane_u64(butterfly_sum) != 0) 跳过计算`——**输入数据
  依赖**，常量折叠不可解。

### G2b 落地路径（已验证前提）

1. **自循环**：extract_seed 增加 `opt_unroll: true`——剥离
   `!llvm.loop`、注入源码常量表（g_t16/g_t8，可选）、
   `loop-unroll-full` + `function(sccp,instcombine,gvn,simplifycfg)`；
2. **数据依赖 diamond**：展开后 CFG 是 DAG；对每个
   `br i1 %c, label %A, label %B` + merge phi，lower 为
   MachineIR `select`（条件 + 两路值），codegen 发射
   `vbsl`/三元；**这是 G2b 的核心剩余工作**；
3. 验收不变（docs/42 §3）。

## 8. 2026-08-14 实现进度

### Step 1 ✅：opt_unroll（已实现并验证）

- `extract_seed.opt_unroll_llvm`：剥离 `!llvm.loop` metadata（可选注入
  g_t16/g_t8/g_t32 源码常量表）→ `opt -passes="loop-unroll-full"` →
  `function(sccp,instcombine,gvn,simplifycfg)`；
- recipe 选项：`extract: {opt_unroll: true, inject_constants: true}`；
- idct16 实测：自循环清零，剩 **176 br / 88 icmp / 560 phi**（纯数据
  diamond DAG）。

### Step 2 算法规格（待实现）：diamond → 嵌套 if

1. 拓扑排序块 DAG；识别 `br i1 %c, label %A, label %B` 且 A/B 汇聚于
   公共 merge M 的 diamond；
2. lower 为嵌套 MachineIR 节点：
   `{"op":"if", "cond": %c, "then": [A 的指令], "else": [B 的指令]}`
   （A/B 内 SSA 重命名，路径内 stores 保留在 if 体内）；
3. M 的 phi：来自 A/B 的值 → `select(cond, valA, valB)`；只来自单路
   → 条件赋值；
4. codegen：`if (c) { ... } else { ... }`（向量条件转
   `vget_lane_u64(...) != 0` 标量布尔）；
5. lane_forms 对 `if` 节点输出视为 opaque 叶子（idct16 族识别靠
   g_t16 引用，不靠 lane 分析）；
6. 验收：idct16 seed 门禁 10 万例 0 失配 → pipeline 复现手写最优。

风险：diamond 嵌套/非规范汇聚（多出边）先显式失败；不做 qemu 旁路。

## 9. 2026-08-14 覆盖缺口证据：G2b 是全覆盖的唯一瓶颈

对剩余新算子族的 IR 形态实测（源码线）：

| 族 | 实现形式 | 结论 |
| --- | --- | --- |
| sad | 纯汇编（sad-neon-dotprod.S） | 源码线不可导入 → binary lifter 路线 |
| quant/dequant | 纯汇编（asm-primitives.cpp PFX 符号） | 同上 |
| sao | C++（saoCuStats*_neon，6 函数） | 复杂 CFG：E0 21 br/116 icmp/45 phi；
  BO 176 br/157 icmp/8 phi（数据依赖分支+循环）→ 需 G2b |

结论：**G2b（结构化 CFG 导入）是“全自动覆盖剩余算子”的必要条件**，
sad/quant 还需 binary lifter（docs/02 §6.3）。两者都是后续独立里程碑；
当前 seed 线覆盖 11 个 kernel 作为已验证基线。

## 5. 关联

- 成功后可顺带覆盖：idct32、dct32_neon（同逆蝶形结构）、quant/sao
  的循环 kernel；
- docs/41 G4 系列保持直线导入；本文是 G2 的正式实现入口。
