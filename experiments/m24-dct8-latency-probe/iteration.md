# M24-DCT8-Latency-Probe：直接测量关键 mnemonic 依赖链延迟，仍不能排序候选

- run-id: `m24-dct8-latency-probe`
- state: `rejected`（直接延迟替换种子表后，路径模型排序仍为负相关）
- date: 2026-08-13（Asia/Shanghai）
- hosts: N1、920B

## 1. 假设

m23 否定了回归拟合。假设：用依赖链微基准直接测量
mul/mla/addp/trn/zip/rshrn/saddl/ssubl/smull 的真实延迟，替换
`MNEMONIC_LATENCY` 种子表后，关键路径模型能把 M23 的 9 个候选排对。

## 2. 方法

- 新增 `benchmarks/insn_latency.cpp`：每个 mnemonic 用 `asm volatile`
  寄存器到寄存器依赖链，减去同形状 nop 链，输出每 op 的 CNTVCT ticks；
  双操作数 pair（rshrn+sshll、saddl/ssubl/smull+shrn）除以 2；
- 在 N1/920B 用 `taskset -c 0`、65536 次 × 41 样本中位数测量
  （`latency-*.txt`）；
- 以 `shl=1` 归一化到种子表单位，替换路径估计器延迟，对 M23 九候选
  重排并计算 Spearman（`rank-check.py`）。

## 3. 结果

### 3.1 测得的相对延迟（shl=1）

| mnemonic | 920B | N1 | 种子 |
| --- | ---: | ---: | ---: |
| mul | 2.33 | 3.0 | 3 |
| mla | 2.33 | 3.0 | 4 |
| addp | 1.0 | 1.0 | 3 |
| trn1/trn2/zip1/zip2/rev64 | 1.0 | 1.0 | 2 |
| rshrn | 2.33 | 2.0 | 4 |
| saddl/ssubl | 1.67 | 1.0 | 2 |
| smull | 4.67 | 2.0 | 3 |

920B 的 smull 显著更贵、N1 的 mla≈mul，均与种子表不同。

### 3.2 路径模型排序（Spearman 对实测 kernel ticks）

| 延迟表 | 920B | N1 |
| --- | ---: | ---: |
| 种子表 | -0.217 | -0.383 |
| 实测缩放 | -0.083 | -0.250 |
| M23 回归全量拟合（对照） | +0.633 | +0.550 |

直接测量只把负相关略微缩小，仍为负；只有过拟合的回归在样本内为正（M23
留一法已证伪其推广）。模型甚至把实测最慢的 proto_b 排到预测最快
（920B pred=19.7 vs meas=26502）。

## 4. 结论

1. **最长依赖路径单项不足以排序这组候选**，无论延迟来自种子表、直接
   测量还是回归；缺的是 issue/发射宽度、port 冲突与（可能的）调度/前端
   项。proto_b（229 条、预测路径最短）实测最慢，说明存在静态路径看不见
   的成本。
2. 测量/build 敏感性也是障碍：同源码 proto_b 在不同构建/批次下 N1 绝对
   ticks 差别明显（M15 原始二进制 cand≈10404 vs 本轮重建≈12863，方法
   不一致）。
3. 工具结论：搜索排序应退化为“粗筛 + 实机复核”，不再宣称静态排序
   可信；`insn_latency` 保留作为每机延迟证据库。

## 5. 下一步

- 若继续做成本模型：加 issue/port 项并用 9 点重新验证，或做轻量模拟器
  （静态调度 + 端口占用）；成本/收益需评估；
- 性能目标仍需内部参考反汇编或 N+2 实机；
- 等 round-0007 回复后写 decision.md 并按其排序执行。
