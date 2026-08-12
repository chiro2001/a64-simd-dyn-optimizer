# M1 Contract Foundation Iteration

- run-id: `m1-contract`
- state: `foundation-only`（contract/verification foundation，不触发 expert advice）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`
- upstream: x265 `b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`

## 1. 本轮试图证伪什么

“从 x265 C reference 手工固化的 canonical 语义，无法与 x265 的 C/NEON
实现在大规模随机输入上 bit-exact 一致。”该命题被证伪：四档 shape 全部一致。

## 2. 什么变了，什么刻意没变

变：

- 新增 SpecIR schema 与稳定哈希：`optimizer/ir/spec_ir.py`。
- 新增 canonical 解释器（Python 与 C++ 双实现，互相交叉校验）：
  - `kernels/sa8d/spec.py`
  - `kernels/sa8d/oracle.cpp` 内的 `canonical_sa8d`
- 新增 oracle CLI：单 case / batch / guard-page，输出 `c canon neon` 三列，
  三者不等即失败。
- 新增差分测试入口 `kernels/sa8d/tests.py` 与 Z3 range proof
  `kernels/sa8d/range_proof.py`。
- 修复过程中发现的 spec 实现 bug：
  1. packed Hadamard 系数对顺序（`(H_j, H_{j+4})`，不是列对）；
  2. 文件布局中 `stride < shape` 非法导致读取漂移（stride 集合按 shape 修正）；
  3. `_read_block` 误用 `r0`（笔误）；
  4. 32x32 必须按四个 16x16 舍入块累加（`sa8d16<32,32>`），不能按 8x8 累加；
  5. 64x64 的 16x16 子块循环未传递原点；
  6. guard-page 布局对 64x64 需要 4 页，否则 B 块落在映射外。

刻意没变：

- 没有修改 x265 任何源文件；
- 没有进入任何性能优化/候选搜索；
- workload 权重仍是占位符。

## 3. 正确性证据

同一 oracle binary（链接未修改 x265），固定 corpus + 随机 corpus 三者一致
（`c == canon == neon`）：

| shape | 总 case 数 | 固定 corpus | 随机 | Python 交叉抽查 | guard |
| --- | ---: | ---: | ---: | ---: | ---: |
| 8x8 | 1,000,153 | 153 | 1,000,000 | 1,000 | exit 0 |
| 16x16 | 1,000,537 | 537 | 1,000,000 | 1,000 | exit 0 |
| 32x32 | 202,073 | 2,073 | 200,000 | 1,000 | exit 0 |
| 64x64 | 108,217 | 8,217 | 100,000 | 1,000 | exit 0 |

- corpus 覆盖：全 0、全 max、A==B、0/max 互换、棋盘、水平/垂直条纹、
  ramp、每个位置正/负 impulse、每 bit 模式、固定 seed 随机（含多种
  stride/offset 组合）。
- guard-page：四档 shape 的 A/B 合法 footprint 紧贴 PROT_NONE 页，均无
  over-read 崩溃，且三实现输出一致。
- Z3 range proof（8-bit）全部通过：
  - 1D Hadamard 系数 `|H| <= 2040`（8 个系数，lower/upper 均 unsat）；
  - 2D 系数 `|T| <= 16320`（8 个系数，lower/upper 均 unsat）；
  - 派生：`|T| < 32768`（s16 abs 永不触 INT16_MIN）、
    `R8 <= 1044480`、16x16 raw 和 `<= 4177920`，均 fit int32。
- SpecIR 文档哈希：`c0d7a10b...67e9e2`（见 `spec.sha256`）。

## 4. 相对哪个精确 baseline，性能如何

本轮无性能候选，不产生性能结论。Baseline 仍为 M0 冻结的 NEON 数据
（8x8 26.3ns/call，16x16 90.3ns/call，32x32 304.9ns/call，
64x64 1033.2ns/call）。

## 5. 下一轮最有信息量的一个实验

M2：把 `pixel_sa8d_8x8_neon` 导入为 seed MachineIR，投影为 PackIR，
并生成 roundtrip 候选；用本轮的 oracle/canonical 作为翻译验证裁判，
要求 roundtrip 在 M0 TestBench 与差分上 bit-exact、性能在基线 ±3% 内。

## 产物索引

- `spec.json` / `spec.sha256`：SpecIR 文档与哈希
- `summary.json`：全量差分与 guard 汇总
- `range-report.json`：Z3 范围证明
- `commands.txt`、`manifest.yaml`
- `expert-link.txt`：none（foundation-only）
- corpus/oracle 大文件按 `.gitignore` 不入库，可由
  `scripts/build-sa8d-oracle.sh` + `kernels/sa8d/tests.py` 重建
