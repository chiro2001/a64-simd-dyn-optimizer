# M4 Search Iteration 0003 — ext+umax half-fold peephole

- run-id: `m4-search-cand-0003`
- state: `rejected-correctness`
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`

## 1. 本轮试图证伪什么

假设：s64 `trn1+trn2+umax` 的“高低半区折半 max”可以用 `vext(a,b,4)+umax`
一条更少指令实现（每组 3 条 → 2 条，净减 4 条）。

## 2. 什么变了，什么刻意没变

变：新增变换 `cand-0003-ext-umax`，替换 4 组 s64 trn+umax 为 `vextq_s16`+`vmaxq_u16`。

刻意没变：load、butterfly、s16/s32 trn、abs/sabd、最终归约全部保持 seed 原样。

## 3. 正确性证据

100,000 例差分：`mismatches=99949`。推导错误：`vext(a,b,4)` 给出
`[hi(a), lo(b)]`，而原 trn 方案需要 `[hi(a), hi(b)]` 才能让 `max` 分别
折半配对 a 与 b；高半区会错误混入 `hi(a)` 与 `lo(b)`。

结论：该 peephole 不成立；半折 max 的 `trn(2×s64)` 仍是当前布局下的紧凑
实现。真正减少 shuffle 需要按专家建议重排 Hadamard stage（让最终配对相邻），
这属于布局综合而非局部替换。

## 4. 性能

正确性失败，不进入 benchmark。

## 5. 下一轮最有信息量的一个实验

在 Python 侧枚举 Hadamard 3 个 bit-stage 的排列（6 种）与系数打包顺序，
直接检验“最终折半配对能否变成相邻 lane 配对”，找到可行布局后再生成 C++；
同时并行升级 paired A/B benchmark。

## 产物索引

- `kernels/sa8d/candidates/cand-0003-ext-umax.cpp`（生成，已拒绝）
- `kernels/sa8d/gen_candidate.py`（`cand-0003-ext-umax` 变换）
