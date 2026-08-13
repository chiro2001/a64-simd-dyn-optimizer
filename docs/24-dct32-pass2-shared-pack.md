# DCT32 pass2 共享打包设计（转置换位方向，2026-08-14 深夜）

## 背景与差距

当前 best 4682 fused_uop（0.368× 上游，fused_uop 口径已低于内部
4827；fused_adj 4251 口径仍 1.101×）。剩余最大结构差距在 pass2：

- pass2 k0 族：lo/hi 双 pack（4 pack × 36 ops）+ s32 E 链
  （4 × 27 ops）+ k0 数学/窄化 ≈ **544 ops/遍**；
- pass2 odd 切片：4 bank × 10 ops × 2 groups = **80 ops/遍**；
- 内部参考（docs/18 §8，DCT16 反汇编口径）用一个共享构建
  （2 级 zip/trn ~10 ops + saddl/zip/revw/add/sub/uzp ~19 ops）同时
  得到 O 行切片 s16、EO s16 打包、EE'/EO' s32——两类路径共用。

## 已完成的探针（本目录）

### probe_odd_slice.cpp：pack(O) 与 odd 切片映射

固定输入实测（VL=256，4 行 O，行值 `1000*i+j`）：

| 切片 | 内容 | pack(O) 对应 | 关系 |
| --- | --- | --- | --- |
| X0 | rows×(j0..3) | q0 | **相等** |
| X1 | rows×(j4..7) | q1 | **相等** |
| X2 | rows×(j8..11) | q2r | q2r = revh(X2)（4-lane 反转） |
| X3 | rows×(j12..15) | q3r | q3r = revh(X3) |

即：**pack(O) 一次 18 ops 产出 4 个切片的“反转半”**；X2/X3 的反转可
通过把 CODD 对应切片的常量预先 revh 来吸收（sdot 逐 lane 相乘，顺序
反转等价于常量反转），无需额外 revh。当前 build_slices 用 10 ops
（zip/trn 组合）得到正序 4 切片，pack(O) 单看是 18 ops——**单独用更
贵**；只有与 k0 共享时才可能净收益。

### probe_k4_slice.cpp：slice(rev8) 不可在切片内替换（§6.9 已记录）

### probe_k0_epack.cpp：E-pack 仅 pass1 可用（§6.8 已记录）

## 设计选项

### A. pass1/pass2 共享 pack（低风险，先做）

pass1 已有 E-pack（pack(E16) 18 ops）+ odd 切片（10 ops/bank）。
若 odd 切片改用 pack(O)（18 ops/bank，常量吸收反转），并把
pack(O)/pack(E16) 的中间结构（a0..a3/t0..t3/p0..p3 的 s64 视图）
在 odd 与 k0 之间复用，理论上每 group 省 ~8 ops；但 pack(O) 比
build_slices 贵 8 ops/bank，共享收益需 > 该差值。**初步估算净收益
≈ 0~-20，优先级低**。

### B. 全转置换位（内部结构，高收益高成本）

pass2 一次性打包原始行数据（4 行 × lo/hi 或 O/E），2 级 zip/trn 后
用 saddl/zip.s/revw/uzp 派生：

- O 行切片 s16（odd 路径输入，16 k 共用）；
- EO/EE 类 s16 打包（k2/k4 legacy 输入）；
- EE'/EO' s32（k0 输入，**保持精确**——这是与 E-pack 的关键区别：
  s32 派生必须在加宽后发生，不能先形成 s16 E）。

预期把 pass2 的 odd 切片（80）+ k0 双 pack+链（~250）+ k2/k4 切片
（~60）合并为 ~60-90 ops/遍，净 **-250~-330**，fused 可到
~4400-4450，fused_adj 口径逼近内部 4251。

## 实现前必做探针

1. **pass2 s32 E 链的共享派生**：内部“EE'/EO' s32”由共享 pack 的
   saddl+zip.s+revw 链产生。需要复刻 DCT32 版的 lane 映射探针：
   用固定输入验证 `saddlb/saddlt` + `.s` 级 zip/revw/add/sub +
   uzp 序列是否逐 lane 等于当前 `e0..e3 → EEp/EOp`（当前链已验证
   bit-exact，可作 oracle）。
2. **常量反转吸收**：验证把 CODD 切片常量 revh 后与 q2r/q3r 的
   sdot 结果 == 正序常量 × X2/X3 的 sdot（数学上显然，但需在
   sdot.d 的 4-lane 组边界内确认——revh 在 64-bit 粒内，不跨界）。
3. **k2/k4 切片能否从同一 pack 派生**：k2 用 eo16、k4 用 eeo16
   （均 s16 legacy，允许回绕），若共享 pack 打包 E16/EO16/EE16 的
   组合，需探针验证切片 lane 顺序与常量吸收。

## 验收

- 20k 差分 legacy 签名 7268 不变（k0 保持精确）；
- TestBenchLite dct32 5 seed PASS；
- fused_uop < 4682，目标 ≤ 4500（fused_adj 口径逼近 4251）；
- 全布局搜索（--skip-axes）复跑确认新轴最优。

## 参考

- docs/18 §7/§8（内部结构解析，仅聚合信息）
- docs/20 §6.8/§6.9（E-pack 经验与阴性实验）
- 探针：experiments/m31-dct32-k0-sdot/probe_odd_slice.cpp、
  probe_k4_slice.cpp、probe_k0_epack.cpp

## 2026-08-14 补充分析（当前数据流下 k0 链接近最优）

对 pass2 k0 链（当前 63 ops/pack = pack 36 + e 链 12 + 置换 15）的
逐段分析：

1. **e 链（8 saddl + 4 add）是回绕约束的底线**：EE[j] = E[j]+E[15-j]
   的 s32 精确计算要求 lo/hi 先加宽再加对；E-pack 的“单 saddl”依赖
   先形成 s16 E（pass2 回绕，lite FAIL，§6.8）。
2. **置换段（15 ops）已最优**：EEp/EOp 共享 v0/v1r 两个中间量
   （uzp1d+uzp2d+revw_d64+add+sub = 5 ops 同时出两族）；尝试
   `revw+add/sub+uzp1s` 路线（EEp 7 ops、EOp 需奇 lane 取反）只会
   更贵。
3. **s0/s1（w0±w2 的差）不被消费**：GCC 已 DCE，IR 里删除不改变
   动态计数（无需改动）。
4. **interleaved-W 思路（lo/rv 按行 zip 交错后 pack）**：可把
   E[j]=lo[j]+rv[j] 变成相邻 lane 对，但 s16 相加仍回绕；s32 版需要
   移位+saddl+跨行配对，操作数反超当前链。已否决。

结论：**不换数据流就无法低于 ~83 ops/pack（pass2）**；共享打包
（选项 B）必须同时服务 odd/k2/k4/k0 才能摊薄。实现前先做
“s32 E 链共享派生”探针（用当前 e0..e3→EEp/EOp 作 oracle）。
