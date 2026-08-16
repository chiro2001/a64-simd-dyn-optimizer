# dct16/32 16-lane IR 发射器设计（2026-08-17）

## 目标（短期项 5）

从宽度无关 fused8 DAG 生成 VL=256（16-lane）的 dct16/32 候选，与
op-backend（op895/opbase/op4032）同宽对比。当前 fused8 DAG 是 8-lane
固定；16-lane 采用“打包双组”表示：一个 16-lane SVE 寄存器携带两个
独立的 8-lane 组（lanes 0-7 / 8-15），所有运算同时对两组执行。

## 已验证的原语（2026-08-17，QEMU VL=256 + 0 NEON + 数值自检）

- `psv16_load/store`（全 VL ld1h/st1h）
- `psv16_rev`（全寄存器反转）、`psv16_sdot`、`psv16_rshrn6`
- `psv16_dual_rev16`：分别反转两个 8-lane 组（tbl 索引
  [7..0, 15..8]）
- `psv16_dual_vget_lo4/hi4`：从两组各取低/高 4 lane 放到 lanes 0-3 /
  8-11（tbl 索引）

## 8-lane op → 双组 op 映射（待实现）

| 8-lane（VL128） | 16-lane 双组（VL256） |
| --- | --- |
| 行半区 load（lo/hi 各 8） | 两行打包 load（或同一行 lo/hi 打包，取决于 O 组合） |
| rev16（整 8-lane） | 需要“只反转一组”的变体（rev_hi/rev_lo），因 O = lo - rev(hi) 只反转 hi |
| vget_low/high（4-lane） | psv16_dual_vget_lo4/hi4 |
| saddl / vmovn / padd / combine4 | 双组版本（lanes 0-3 与 8-11 并行） |
| sdot（8-lane → 2×s64） | psv16_sdot（16-lane → 4×s64，两组成对） |
| store | psv16_store（每寄存器写两行/两组） |

关键点：8-lane 代码里同一行 lo/hi 会做 O = lo - rev16(hi)，因此打包
方案若把 lo/hi 放同一寄存器，需要“单组反转”原语；若把两行各自
完整处理，则寄存器内同时存在两行的 lo 与 hi，选择其一。设计取舍
在实现时按 pass 结构定（优先两行打包以复用全寄存器）。

## 实施步骤

1. 补齐双组原语（rev_hi/rev_lo、dual_saddl、dual_vmovn、dual_combine4、
   dual_addp4）并各加 VL=256 数值自检；
2. 实现 dct16 pass1/pass2 双组发射器（可由 8-lane pure-SVE 源码
   按映射逐语句翻译），生成 `dct16/candidates/best_ir_sve16.cpp`；
3. 门禁：`--no-neon`、20k QEMU vq=2 差分、TestBenchLite（RUN_VQ=2）、
   与 neon8 数值一致；
4. dct32 同法；与 op895/opbase/op4032 对比 fused/周期，950 实机
   （注入法交错）定稿。

## 状态

- ✅ 双组表示核心原语（dual_rev16/vget_lo4/hi4 + psv16_*）已验证；
- ⏳ 双组运算原语补齐、dct16/32 双组发射器、门禁与 op-backend 对比。
