# LD_PRELOAD 注入器与 ISA 受限搜索（2026-08-15）

## 1. 背景

用户两个诉求：

1. 快速使能优化算子：生成动态库，通过 init 函数直接修改进程内 x265
   `EncoderPrimitives` dispatch 表，让算子指针指向本项目实现，从而可用
   `LD_PRELOAD` 替换算子。
2. 在 920B（SVE1.0 256bit）与 950（SVE2.0 及以下）上验证搜索优化效果：
   搜索/生成后端必须只产生目标机器可运行的指令，同时尽量保留性能。

## 2. 交付

### 2.1 `tools/build_preload_so.py`

- 按 kernel 的 manifest symbol + dispatch 映射生成 wrapper 和共享库；
- 提供三种激活方式：
  - 自动：拦截 `x265::x265_setup_primitives`，在 x265 完成 C/汇编/别名
    初始化后打补丁；
  - 手动：`dynopt_init()` / `dynopt_patch_primitives()`；
  - 构造：加载时尝试 patch（table 未初始化时自动跳过）。
- `--isa` 决定编译 march，并对每个候选对象跑 `check_isa_level.py`，
  不兼容 kernel 跳过并在 `--json` 报告中说明；
- 支持 8-bit x265；候选源缺失时用 gen 通用发射器按 ISA 生成。

已做两层验证：

1. QEMU SVE2 下，aarch64 测试程序链接 `libx265.so` + 注入库，调用
   `x265_setup_primitives` 后 `sa8d` slot 被替换为候选；
2. **920B 云端真机（SVE1）**：`scripts/verify-preload-real-machine.sh`
   把 sve1 注入库和对比程序推到 `chiro@124.70.206.229`，在真实
   `libx265.so` 上 patch 后跑 200 组随机差分，sa8d + interp8
   **bad=0**。

CNTVCT 实测（920B，上游 NEON 基线 vs SVE1 候选，2000 次）：

| kernel | 上游 cycles | 候选 cycles | 比率（上游/候选） |
| --- | ---: | ---: | ---: |
| sa8d-8x8 | 2428 | 5599 | 0.434 |
| interp8-8x8 | 2517 | 4108 | 0.613 |
| scale2D-64to32 | 13774 | 16957 | 0.812 |

结论：920B 的 SVE1 单元对这些形状弱于 NEON，当前 SVE1 候选适合做搜索/
正确性验证，**不适合直接替换**；后续应针对 920B 增加 NEON-native 候选或
调整搜索目标 profile。

真机验证还发现并修复了 copy relocation 问题：x265 可执行文件会把
`x265::primitives` copy 到自身地址空间，`dlsym(RTLD_DEFAULT)` 拿到的是
空副本；注入器现通过 `dl_iterate_phdr` 找到真实 `libx265.so` 对象再取
符号，保证 patch 落到 x265 实际使用的表。

实测（2026-08-15，全 kernel 扫描）：

| 目标 | 成功 patch kernel 数 | 说明 |
| --- | ---: | --- |
| sve2（950） | 153 | 含 dct8/dct16/dct32、sa8d/sa8d16、interp8vpp、chroma、quant/dequant、sao org/stats、planecopy/weight/ssim 等 |
| sve1（920B） | 79（原生） | 含 dct8、dct32(best_sve1)、copy 族、hps/vps、interp8/gen、satd、scale2d、ssim、planecopy、scan、sign 等 |

跳过原因主要是：该 kernel 当前只有 SVE2p3/SVE2p1 候选（interp8 path-B、
interp4 非方形 hpp、IDCT）、`isRowExt` 变体不适用于通用 slot、
`dequant-scaling-le` 与 gt 共用符号、或 `dst4x4/idst4x4` 尚无本项目候选。
生成式 SVE1 候选（interp8/sa8d/satd/interp4 等）已通过 20k 差分。

固定形状字段（quant/nquant/dequant/dequant-scaling/sao/ssim）通过
wrapper adapter 接入：完整 primitive 签名转发到候选，形状不匹配时回退到
原始 x265 函数（sao B0 按 4 行分块循环；E2/E3 仅 patch width=64 的大块
slot；stats 按行循环；sao-e1 用 rows=1 特化生成）。

### 2.2 `search_sve2_layouts.py --isa`

- `--isa sve1|sve2|sve2p1|sve2p3`；
- `--target 920B|950` 等价于 `--isa sve1|sve2` + 对应 MCA profile；
- 过滤 layout：`sdot-h` 要求 sve2p3、`sdot-s32` 系列要求 sve2p1；
- 编译 march 按目标覆盖；每个候选对象过 `check_isa_level.py` 静态门禁；
- gen 后端在 sve1/sve2 下自动把只含 sdot-h 的 compute 轴回退到
  `sdot-d`（SVE1 sdot + NEON-bridge 窄化），保证仍有候选可搜；
- `seed_pipeline.py --isa` 透传到搜索。

### 2.3 `check_isa_level.py` 修正

- objdump 解析器修复：字节列不再吞掉 `cadd/sdot` 这类十六进制字母开头
  的助记符；
- 增加按操作数的 ISA 判定：
  - `sdot z.s, z.h, z.h` → sve2p1；
  - `sdot z.h, z.b, z.b` → sve2p3；
  - `cadd/addp/rshrnb/sqrshrnb/... z` 形式 → sve2；
- 目录中 UMLAL{2} 等共享条目剥离 `{2}`，NEON 基线不再被 SME2 条目误判。

## 3. 命令

```sh
# ISA 受限搜索（920B）
python3 tools/search_sve2_layouts.py --kernel sa8d --backend gen --isa sve1 \
  --outdir experiments/isa-sve1/sa8d --workers 4 --mca-top 5

# ISA 受限搜索（950）
python3 tools/search_sve2_layouts.py --kernel interp8 --isa sve2 \
  --outdir experiments/isa-sve2/interp8 --workers 4

# 构建注入库
python3 tools/build_preload_so.py --isa sve2 \
  --out build/dynopt-x265-sve2.so \
  --kernels dct8,sa8d16,interp8vpp-16 --json build/preload-report.json

# 使用
LD_PRELOAD=$PWD/build/dynopt-x265-sve2.so x265 ...

# 真机一键验证（920B SVE1 / 950 SVE2）
scripts/verify-preload-real-machine.sh <user@host> sve1
```

## 4. SVE1 原生候选示例（20k 差分 0 失配）

| kernel | fused/MCA | 生成方式 |
| --- | ---: | --- |
| interp8-8x8 | 106/52 | gen fir，SVE1 sdot-d + NEON vqrshrun |
| sa8d-8x8 | 100/74 | gen hadamard，CADD90 用 tbl+add/sub 精确替换 |
| sa8d16 | 236/110 | gen hadamard，16-lane 自然行 |
| satd-16x16 | 174/87 | gen hadamard |
| interp4-16x16 | 295/104 | gen fir，SVE1 |

## 5. 已知限制与下一步

- 注入器目前只支持 8-bit x265；10/12-bit 需要按 bit-depth 编译候选与
  wrapper。
- 部分 kernel 的候选源未入库（只在 experiments results 中），注入器会
  用 gen 发射器生成；没有通用配方的族需要先补配方。
- 920B 上仍建议对 SVE2/SVE2p1/SVE2p3-only kernel 使用 docs/29 的
  shape-substitution 微基准做性能预估，LD_PRELOAD 注入只用于原生可用
  候选。
- 950 原生验收仍需在实机跑 paired；仓库已提供
  `scripts/quick-test-real-machine.sh` 与 `tools/parse_quick_report.py`。

## 6. 编译进 x265（替代 LD_PRELOAD）

对静态链接或不便使用 LD_PRELOAD 的环境，`build_preload_so.py
--inject-outdir` 可生成编译期注入材料：

- `dynopt_patch.cpp/.o`：直接修改 `x265::primitives`，不依赖
  dlsym/dlopen；
- `x265-dynopt-setup.patch`：在 `x265_setup_primitives` 的
  `setupAliasPrimitives` 之后调用 `dynopt_patch_primitives()`；
- 每个候选 kernel 的 `.o`。

`scripts/build-x265-injected.sh` 一键完成：生成对象与补丁 → 仅重编
`primitives.cpp` → `ar r` 替换/追加到 `libx265.a` → 恢复原始源码 →
链接并运行 `benchmarks/injected_verify.cpp` 自检。已验证 QEMU 下
`x265_setup_primitives` 从 x265 内部完成 patch，候选可执行。

```sh
scripts/build-x265-injected.sh --isa sve1 --kernels sa8d,interp8 \
  --build-dir build/x265-8-cross-sve2 --inject-out build/dynopt-inject
```
