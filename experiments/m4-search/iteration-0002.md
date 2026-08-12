# M4 Search Iteration 0002 — abs+add direct reduction

- run-id: `m4-search-cand-0002`
- state: `rejected-correctness`
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`

## 1. 本轮试图证伪什么

假设：`add+abs+sabd+s64trn+umax` 阶段可以被 `abs(x)+abs(y)` 直接替换，
从而删除 8 条 s64 trn 与 4 条 umax（净减约 12 条指令）。

## 2. 什么变了，什么刻意没变

变：新增变换 `cand-0002-abs-add-reduction`，从已验证 roundtrip 生成候选，
仅替换 `v98..v143` 计算/重排/umax 段；`v96/v97/v101/v102/v106/v107/v111/v112`
的 reinterpret 定义保留，最终归约与 seed 一致。

刻意没变：load、usubl、行/列 butterfly、s16/s32 trn 全部保持 seed 原样。

## 3. 正确性证据

100,000 例差分：`mismatches=99911`。直接 `abs+add` 与原 `umax` 语义不等价，
即该假设被证伪；`trn/umax` 阶段承担了必要的 lane 配对，不能按代数直觉删去。

## 4. 性能

正确性失败，按门禁不进入 benchmark（禁止在 correctness 失败时看性能）。

## 5. 下一轮最有信息量的一个实验

在 PackIR 层用 lane provenance 验证候选变换的 lane 配对是否保持，而不是
直接改 C++ 再靠差分发现不等价；先做“只改变归约顺序/配对但保持 provenance
映射”的候选，再做减少 permute 的尝试。

## 产物索引

- `kernels/sa8d/candidates/cand-0002-abs-add-reduction.cpp`（生成，已拒绝）
- `kernels/sa8d/gen_candidate.py`（`cand-0002-abs-add-reduction` 变换）
