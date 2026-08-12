# M4 Search Iteration 0001 — Balanced final reduction

- run-id: `m4-search-cand-0001`
- state: `retain-experimental`（正确、静态指令数相同、实测 +0.21%，未达接受阈值）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`

## 1. 本轮试图证伪什么

假设：8x8 SA8D 的最终归约是 3 级串行 add 链；改成 2 级平衡树后，在指令数
不变的前提下缩短关键路径，能获得可测量（≥3%）的 latency 提升。

## 2. 什么变了，什么刻意没变

变：

- 新增通用候选漏斗 `scripts/test-candidate.sh`：
  `gen_candidate.py`（从已验证 roundtrip 生成变体）→ 10 万例差分 → 同 binary
  实机 A/B（taskset CPU0、5 进程×30 样本）。
- 候选 `cand-0001-balanced-reduction.cpp`：只把最后三个串行 `vaddq_s16`
  改为先配对再加（`(m0+m1)+(m2+m3)`），其余指令与 roundtrip 完全一致。

刻意没变：load、butterfly、trn/zip、abs/sabd/umax、uaddlv 全部保持 seed 原样。

## 3. 正确性证据

`sa8d_roundtrip_verify`（DYNOPT_CANDIDATE 指向候选）：

```text
cases=100000 mismatches=0
```

## 4. 相对哪个精确 baseline，性能如何

同一 `candidate-..._bench` binary，8x8 latency，batch=4096：

| impl | median ns/batch | ns/call |
| --- | ---: | ---: |
| upstream NEON | 113481.0 | 26.20 |
| cand-0001 | 113240.0 | 26.14 |

speedup = 1.0021×。正确但收益远低于 1.03 接受阈值，判定 `retain-experimental`。

## 5. 下一轮最有信息量的一个实验

针对 24 条 trn/zip 重排（占总指令 20%）做布局搜索：在保持 SpecIR 语义下，
用不同 butterfly 打包减少列变换所需 shuffle；先用静态计数筛选，再走同一漏斗。

## 产物索引

- `kernels/sa8d/candidates/cand-0001-balanced-reduction.cpp`
- `scripts/test-candidate.sh`、`kernels/sa8d/gen_candidate.py`
- `experiments/m4-search/disassembly/roundtrip-8x8.txt`
- `expert-advice/round-0001/`：本轮实际优化迭代的顶级模型单次求助
  （请求被用户中断，未产出 response；记录见 `aborted.md`）
