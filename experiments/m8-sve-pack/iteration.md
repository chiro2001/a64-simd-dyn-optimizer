# M8-SVE-Pack：16-lane 双 tile 打包（SVE2 VL=256 合同）

- run-id: `m8-sve-pack`
- state: `accepted`（功能 + 静态指令证据通过；性能待真实 SVE2 硬件）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`（aarch64 编译）+ `qemu-aarch64 -cpu max,sve-max-vq=2/4`

## 1. 本轮试图证伪什么

“同一个 8x8 MachineIR 无法用 16 个 s16 lane 打包两个相邻 8x8 tile”被证伪：
`--pack x2` 后端在 QEMU VL=256 与 VL=512 下各 10 万例差分全零。

## 2. 什么变了

- `optimizer/ir/codegen.py`：`emit_sve_intrinsics` 新增 `pack=2` 模式：
  - `pg = svwhilelt_b16(0, 16)`，每个 load 一次装载相邻两个 tile 的一行
    （16 字节 → lane 0-7 = tile A，lane 8-15 = tile B）；
  - 所有 `svtbl2` 索引数组复制到上半区并把 `lo` 偏移 +8（`b` 标志不变），
    使同一份 NEON shuffle mask 在两个 8-lane 半区独立生效；
  - 归约尾部用两条 `svaddv`：低半用 `svwhilelt_b16(0,8)` 前缀谓词，高半用
    全向量和减低半（`svwhilelt` 只能产生前缀谓词，不能表达 lane 8-15）；
  - 每个 tile 分别 `(+1)>>1` 再求和，保持逐 tile rounding 的 bit-exact 语义。
- `kernels/sa8d/gen_roundtrip.py`：新增 `--pack x2`。
- `kernels/sa8d/sve_verify.cpp`：新增 x2 oracle（两个水平相邻 8x8 block，
  行宽 ≥16）。
- `scripts/build-sve-sa8d.sh`：同时生成/编译/验证单 tile 与双 tile 候选，
  输出静态指令计数。
- `tools/count_asm_insns.py`：修复 objdump 行解析（此前把指令字当作助记符）。

## 3. 正确性证据

```text
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_verify 100000
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 100000
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
```

原始输出：`correctness/vl256-qemu-100k.log`。

## 4. 静态指令证据（-O2 编译产物）

| 候选 | total | SIMD | 对应工作 |
|---|---:|---:|---|
| single-tile（8 活跃 lane） | 309 | 202 | 1 × 8x8 |
| two-tile pack（16 lane） | 317 | 204 | 2 × 8x8 |
| 每 tile 折算 | 309 | 202 | 1 × 8x8 |
| 每 tile 折算 | 158.5 | 102 | 1 × 8x8 |

每 tile 静态指令数相对 8-lane 版本约 **-49%**，符合“双 tile 打包使每调用
指令数减半”的预期信号。

明细见 `static/sve1-insns.txt` 与 `static/sve2-insns.txt`。

## 5. 性能状态

`blocked-environment`：N1 无 SVE，性能必须等真实 SVE2 VL=256 硬件。本轮以
静态指令数为主指标，不宣称实机收益。

## 6. 下一轮最有信息量的一个实验

当前 24 个 `svtbl2` 共产生 48 条 `ld1h`（常量索引装载）+ 20 条 `mad`
（索引计算），是静态计数的大头。下一轮把这些索引重排替换为 SVE2 原生
128-bit 段级指令（`zip1/zip2/trn1/trn2/uzp1/uzp2`）或让编译器提升常量索引，
目标把单 tile SIMD 静态指令数从 202 显著压低，再做真实硬件 paired A/B。

## 产物索引

- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`（单 tile，自动生成）
- `generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp`（双 tile pack，自动生成）
- `correctness/vl256-qemu-100k.log`、`static/*.txt`
