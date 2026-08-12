# M15-DCT8-ProtoB：四列并行 mul/mla 奇数列（round-0006 原型 b）

- run-id: `m15-dct8-protob`
- state: `rejected-performance`（C-exact 达成、静态 -34%，但周期未达保留门槛；
  N1 显著负、920B 微正）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地交叉 + N1 + 920B

## 1. 假设

把奇数列的 `16×(smull|vmulq) + 12×vpaddq` 归约链换成 4×4 O 转置 +
4 条 4 深 `vmulq_n/vmlaq_n` 标量广播链（每系数一条，lane=行）。预期：
静态指令显著下降，周期或持平。

## 2. 结果

- 正确性：cand==C 本地 20 万例、N1/920B 各 2 万例 0 mismatch；对上游
  NEON 的 1733/200000 分歧=上游 bug 位置（符合预期）。
- 静态：**229 total / 128 SIMD**（widened 347/282、上游 341；-34%）。
  关键：`mla 24、mul 20、movi 14、mvni 6、addp 仅 8、rshrn 16`。
- paired latency（cntvct）vs 上游 NEON：
  - **920B：1.019×**（CI [1.012, 1.037]）
  - **N1：0.858×**（CI [0.843, 0.881]）
- paired throughput：920B 0.993×、N1 0.845×。

## 3. 归因

指令数降了，但 mla 把上游的树形归约（mul → addp → addp，深度 3）变成
线性依赖链（mul → mla → mla → mla，深度 4），且 N1 的 s32 标量乘法
latency 明显高于 s16 `smull` 树；latency-bound 时负 14%。920B 的 mla
latency 更低，得到微正。结论：**纯 (b) 不可单独达成目标；计数不能当
收益**（与 round-0006 的“计数只作 tie-breaker”一致）。

## 4. 下一轮

原型 (c)：全宽 128-bit 行处理（8 lane 加载/E-O 对）+ 直接按 stride 加载
消除 block 拷贝 + 保留树形归约（可对 mla 用 2 深混合：2×(mul+mla)+add）。
按机器分候选：920B 可保留 mla 版，N1 用树形版。止损点仍按 round-0006。
