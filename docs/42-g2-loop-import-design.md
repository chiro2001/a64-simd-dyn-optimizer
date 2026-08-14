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

## 5. 关联

- 成功后可顺带覆盖：idct32、dct32_neon（同逆蝶形结构）、quant/sao
  的循环 kernel；
- docs/41 G4 系列保持直线导入；本文是 G2 的正式实现入口。
