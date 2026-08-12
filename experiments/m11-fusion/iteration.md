# m11-fusion：融合静态 inventory（docs/09 v0.1，P4'）

- run-id: `m11-fusion`
- state: `accepted`（v0.1 交付；融合表为空，全部候选仅 structurally_eligible）
- date: 2026-08-13（Asia/Shanghai）
- host: 本地 x86 交叉（GCC 16 反汇编；报告为静态分析，不依赖实机）

## 1. 交付

- `optimizer/analysis/fusion.py`：互斥分类（向量 load 只计 load，不计
  SIMD）、C1 同类 SIMD、C3 端口预算（读口=去重向量源寄存器减去链式中间
  值、写口=1、谓词不计口）、C4 依赖链（dest chaining、中间值在 (i,j) 窗口
  内既不可读也不可写、谓词一致、重排位置标注）、C5 空融合表语义；
- `tools/fusion_analysis.py`：CLI 出 docs/09 §4.2 的 JSON 报告；
- `optimizer/analysis/test_fusion.py`：7 个单测（解析、互斥分类、端口
  计数、dest chaining、中间值可观察拒绝、链断裂拒绝、谓词一致性）。

## 2. 报告结果（空融合表 → 只枚举 structurally_eligible，节省 unknown）

| kernel | profile | simd | load | n_est | instruction_score | structurally_eligible |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| sve-x2raw | kunpeng-n2-sve2p3-vl256 | 84 | 0 | 84 | 21.0 | 2 |
| sve-16x16 | kunpeng-n2-sve2p3-vl256 | 0 | 4 | 4 | 1.0 | 0（wrapper；helper 为独立符号，按调用图另计） |
| dct8-upstream | n1-neon128 | 276 | 11 | 287 | 71.75 | 99 |
| dct8-protob | n1-neon128 | 128 | 17 | 145 | 36.25 | 34 |

所有 pair：`hw_supported=0`、`needs_hw_verify=true`、节省全部 unknown、
`critical_path_impact=worse-or-neutral`——融合不缩短串行依赖。符合
docs/09 §5 验收 1/2/3/5（第 6 条实机 PMU 由 M11/M14-M16 已有数据覆盖；
cycles_lb 以 critical_path 项给出，资源项由 cost.py 另行提供）。

## 3. 下一步（P5'~P6'）

融合对验证：已写 instruction-pair 微基准（`kernels/fusion/
pair_microbench.cpp` + `scripts/bench-pair-fusion.sh`，chained vs control
随机配对 + bootstrap）。920B/N1 各 60 样本：

| pair | 920B chained/control | N1 chained/control |
| --- | ---: | ---: |
| ziprev（zip2→rev64） | 0.923 | 1.000 |
| muladdp（mul→addp） | 1.528 | 1.000（CI 宽） |
| sve_addchain（add→add） | 1.244 | n/a（无 SVE） |

结论（P5' 弱证据，按预期）：**无跨机一致的融合信号**——ziprev 在 920B 的
0.92 与 N1 的 1.00 不一致，muladdp/sve_addchain 的 chained 因依赖链串行
反而更慢（latency-bound，本就不是好融合对象）。按协议：未获得
`hw_supported` 证据，融合不得进入排序/搜索主循环；空融合表语义保持
（round-0005/0006 决策）。
