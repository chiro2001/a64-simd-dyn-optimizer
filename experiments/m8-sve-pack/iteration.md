# M8-SVE-Pack：16-lane 双 tile 打包（SVE2 VL=256 合同）

- run-id: `m8-sve-pack`
- state: `blocked-environment`（功能证明 + 静态指令证据；性能必须等真实
  SVE2 VL=256 硬件，按协议不标 `accepted`）
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
  - 索引数组装载与索引运算使用活动谓词 `pg`（而非 `svptrue_b16()`），
    避免 VL=512 时 `svld1_u16` 读越 16 项常量数组；
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
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_verify 100000   # VL=256
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 100000   # VL=512
cases=100000 mismatches=0
x2_cases=100000 mismatches=0
```

原始输出：`correctness/vl256-qemu-100k.log`。VL=512 在索引装载修复
（谓词限制到活跃 lane）后才列为有效门禁；修复前该结果存在常量数组越界读，
不能作为正确性证据。

## 3.1 合同与已知边界

- pack=2 要求 VL ≥ 256（固定 VL=256 或 VLA-minimum）；VL=128 只有 8 个
  s16 lane，会静默只算 tile A，dispatch 必须禁止。
- x2 返回两个**已舍入** 8x8 结果之和；它不是 x265 16x16 primitive
  （16x16 要求四个未舍入 R8 累加后统一舍入一次），当前仅作为打包 codegen
  的功能证明，不可直接注册到 x265。
- x2 的调用合同要求两个水平相邻 tile 同时存在、每行至少 16 字节可访问；
  guard-page/负 stride/恰好边界布局尚未覆盖。

## 4. 静态指令证据（-O2 编译产物）

| 候选 | total | SIMD | 对应工作 |
|---|---:|---:|---|
| single-tile（8 活跃 lane） | 290 | 224 | 1 × 8x8 |
| two-tile pack（16 lane） | 297 | 225 | 2 × 8x8 |
| 每 tile 折算（single） | 290 | 224 | 1 × 8x8 |
| 每 tile 折算（pack） | 148.5 | 112.5 | 1 × 8x8 |

按等工作量归一化（一次 x2 调用替代两次 x1 调用），每 tile 静态指令数约
**-49%**（total 290 → 148.5；SIMD 224 → 112.5）。这不是函数体代码尺寸减半
（x2 函数体 297 条 > x1 的 290 条），而是直线执行路径的归一化静态指令/tile
减半；它是早期筛选代理，不等价于周期/吞吐或相对上游 SVE2 实现快 2 倍。

明细见 `static/sve1-insns.txt` 与 `static/sve2-insns.txt`。

## 5. 性能状态

`blocked-environment`：N1 无 SVE，性能必须等真实 SVE2 VL=256 硬件。本轮以
静态指令数为主指标，不宣称实机收益。

## 6. 下一轮最有信息量的一个实验

当前 24 个 `svtbl2` 共产生 48 条 `ld1h`（常量索引装载）+ 24 条 `mad`
（索引计算），是静态计数的大头。下一轮把这些索引重排替换为 SVE2 原生
typed shuffle（MachineIR 的 24 个 shuffle 恰好是 i16/i32/i64 三种粒度的
`TRN1/TRN2`，应直接生成 `svtrn1/2_u16/u32/u64`；普通 `ZIP/TRN/UZP` 不是
统一 128-bit 段内操作，`ZIPQ/UZPQ/TBLQ` 属 SVE2p1 不能默认使用），并同轮
对照常量索引 hoist；同时把 x2 改为“两块未舍入 half-R8 之和”的 raw helper，
用两次 x2 wave 构造合法 16x16 并在 16x16 边界统一舍入。目标把每 tile SIMD
静态指令从 112.5 显著压低后再做真实硬件 paired A/B。

## 产物索引

- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`（单 tile，自动生成）
- `generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp`（双 tile pack，自动生成）
- `correctness/vl256-qemu-100k.log`、`static/*.txt`
