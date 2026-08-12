# M18-interp8：8-tap luma 水平插值首轮闭环（tier-a 新目标）

- run-id: `m18-interp8`
- state: `foundation-only`（脚手架 + 基线 + seed IR；候选待做）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地交叉 + N1 + 920B

## 1. 合同与入口

- `filter_pp_t(const pixel* src, intptr_t srcStride, pixel* dst, intptr_t
  dstStride, int coeffIdx)`：8-tap 水平 pixel→pixel，src 左移 3，
  `val=clamp((Σ g_lumaFilter[coeffIdx][k]·src[k] + 32) >> 6, 0, 255)`，
  4 相位（g_lumaFilter[4]，coeffIdx 0..3）。
- C 参考：`common/ipfilter.cpp:80 interp_horiz_pp_c<8,W,H>`；
- 上游 NEON 分派（filter-prim.cpp / filter-neon-dotprod.cpp /
  filter-neon-i8mm.cpp）：
  - 920B（有 i8mm）：`interp8_horiz_pp_i8mm`（vusdotq + vqrshrun）；
  - N1（有 dotprod、无 i8mm）：`interp8_horiz_pp_dotprod`；
  - 基座：`interp_horiz_pp_neon<8,W,H>`。

## 2. 脚手架

- `benchmarks/interp8_microbench.cpp`（c/neon/empty/cand，4 相位差分 +
  cand==C 门禁；相位固定 coeffIdx=2 做 A/B）、
  `scripts/build-interp8-microbench.sh`；
- 本地交叉+qemu：c==neon 通过。

## 3. 基线（paired latency，cntvct，ratio=neon/c <1 表示 NEON 更快）

| 形状 | N1 | 920B |
| --- | ---: | ---: |
| 8x8 | 0.565（NEON ~1.8× C） | 0.524 |
| 16x16 | 0.467（NEON ~2.1× C） | 0.599 |

与 DCT8 相反：上游 NEON 插值明显快于 C，tier-a 的 +30% 基线很强。

## 4. 校正：之前的“N1 phase=0 分歧”是 harness bug，非上游 bug

首版 harness 用 `dstStride=64` 写入输出、却按 dense `shape*shape` 读取，
越界读未初始化内存，误报 N1 phase=0 分歧（want=0/got=65 即两个未初始化
字节）。修正为 `dstStride=shape` 后，**本地 qemu/N1/920B 三处 c==neon 全
过（4 相位）**。教训：差分器先做 stride 一致性审计；DCT8 的分歧是真的
（三方 oracle==C 精确 + pass2 探针实证），此处为 harness 假阳性。

## 5. seed IR 提取（本里程碑内完成）

clang 22.1.8 `-target aarch64-linux-gnu -march=armv8.2-a+dotprod -O2
-emit-llvm` 提取 `interp8_horiz_pp_dotprod<8,8>`：139 行、33 处
sdot/udot/ld1x3（模板常量完全展开，无循环）。seed：
`llvm-ir/interp8-8x8-dotprod-seed.ll`。

importer 已知 gap（下一轮按序扩展）：

- `extractvalue`（ld1x3 多寄存器 load 拆解）；
- `trunc <8 x i16> → <8 x i8>`（滤波器系数收窄）；
- `llvm.aarch64.neon.ld1x3.*` 多寄存器 load；
- `llvm.aarch64.neon.sdot/udot.*` 点积家族（语义 + codegen
  `vdotq_s32`/`vudotq_s32` + 样本 `tbl` permute）；
- `icmp/br`（8x8 已展开无循环；宽块/垂直插值需要）。

## 6. 下一轮

1. 扩展 importer（上述 gap）+ roundtrip → C-exact 候选；
2. 结构：i8mm 变体已用 16 宽 vusdotq，参照做 8x8/16x16 全宽 dot 候选，
   目标对上游 NEON +30%。
