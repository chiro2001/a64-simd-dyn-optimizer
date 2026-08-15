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

已做最小验证：aarch64 测试程序链接 `libx265.so` + 注入库，调用
`x265_setup_primitives` 后 `sa8d` slot 被替换为候选（QEMU SVE2 下
`dynopt: patched ...`），说明符号拦截与运行时 patch 路径可用。

实测（2026-08-15）：

| 目标 | 成功 patch kernel 数 | 说明 |
| --- | ---: | --- |
| sve2（950） | 77 | 含 dct8/dct16/dct32、sa8d/sa8d16、interp8vpp、chroma 等 |
| sve1（920B） | 27（原生） | 含 dct8、dct32(best_sve1)、copy 族、hps、scale2d、scan、sign 等 |

跳过原因主要是：该 kernel 当前只有 SVE2p3 候选（如 interp8 path-B /
interp4 hpp）、IDCT 当前 best 为 SVE2p1 sdot、或候选源只存在于搜索结果
而 gen 发射器尚无对应配方。生成式 SVE1 候选（interp8/sa8d/satd/interp4
等）已通过 20k 差分，可用 `--kernels` 明确指定纳入注入库。

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
