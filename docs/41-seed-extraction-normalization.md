# Seed 提取规范化：源码 + 编译配方 + 目标函数 → MachineIR（2026-08-14）

> 用户方向（2026-08-14）：抽取层按**有源码**的方式走，但入口必须规范化：
> 输入 = 源码 + 编译方式 + 目标函数名称，输出 = IR；方案不绑定 x265，
> 可复用于其他项目。

## 1. 输入契约（seed recipe）

`seeds/<name>.yaml`，示例见 `seeds/dct16.yaml`：

```yaml
seed: dct16
compiler: clang
target: aarch64-linux-gnu
source: third_party/x265/source/common/aarch64/dct-prim.cpp
clang_args: [ -march=..., -O3, -funroll-loops, ... -I... -D... ]
target_function:
  mangled: _ZN4x26510dct16_neonEPKsPsl
  demangled: x265::dct16_neon
output:
  ll: experiments/<seed>/llvm-ir/<name>.ll
  json: experiments/<seed>/imported/machine-ir.json
```

字段全部与宿主项目无关：换一个项目 = 换 source/clang_args/target_function，
工具代码零改动。

## 2. 执行

```sh
python3 tools/extract_seed.py --recipe seeds/dct16.yaml
# --compiler clang-22 可指定工具链；--out 覆盖输出路径
```

步骤：clang `-S -emit-llvm`（按配方参数）→ 按 mangled/demangled 名定位
函数并截取平衡函数体 → `import_llvm_ir_text` 受限导入 → 写
machine-ir.json + provenance（编译器版本、源码/IR sha256、目标函数）。

## 3. 复现验证（2026-08-14）

- `seeds/dct16.yaml` 复现 m30 seed：**2244 节点，与旧
  `experiments/m30-dct16-search/imported/machine-ir.json` 逐节点相等**；
- op 直方图：intrinsic 960 / add 368 / shuffle 304 / mul 187 /
  sext 132 / addr 94 / sub 80 / store 64 / load 44 / shl 11。

## 4. 约束与后续

- 受限解析器 `import_llvm_ir_text` 目前只支持**直线代码**（fully
  unrolled，无分支/循环）和白名单 op；配方里的 unroll 参数就是为此
  存在。后续扩展解析器支持循环/更多 intrinsic 后，配方可去掉
  `-funroll-loops` 强制展开；
- 常量数值不在 IR 里（外部全局引用），由 `tools/extract_x265_constants.py`
  按源码布局解析（docs/40 M1a2）；
- 下一步：为 m18 interp8 / m2 sa8d 建 recipe（从各自编译命令反推），
  统一入口后 interp8/sa8d 的检测扩展直接复用同一 pipeline。

## 5. 执行记录（2026-08-14）

### M3a ✅：interp8 / sa8d seed recipe

- `seeds/interp8-8x8.yaml`：源 `filter-neon-dotprod.cpp`，clang 22.1.8
  `-O2 -march=armv8.2-a+dotprod`（+encoder include，`slicetype.h`）；
  **复现 m18 136 节点逐节点相等**；
- `seeds/sa8d-8x8.yaml`：源 `pixel-prim.cpp`，同参数；原 seed 用 clang
  18.1.3（167 节点），本机 22.1.8 生成 **163 节点**（bitcast 32→28，
  IR 形状差异），roundtrip 验证 **100000 cases mismatches=0**；
- codegen 健壮性修复（clang ≥21 的 IR 形状）：
  - `emit_c_intrinsics` env 支持编号参数 `%0..%3`（原只认命名参数）；
  - `<8 x i16>` shuffle 模式 `[0,1,2,3,8,9,10,11]`（concat 低半）新增
    `vcombine_s16(vget_low_s16..)` 发射；
  - 交叉链接去掉 `-lnuma`（libx265.a 未引用 numa 符号）。
- 说明：旧 m2 seed（clang 18）保留未覆盖；recipe 用当前工具链再生即
  clang-22 变体，provenance 记录编译器版本，语义以 roundtrip 门禁为准。

### G4 ✅：roundtrip 出厂门禁（extract_seed --verify）

- `tools/extract_seed.py` 新增 `verify:` 支持：导入后自动
  codegen → 交叉编译 → QEMU 差分 harness，失败即提取失败；
- `seeds/dct16.yaml` / `seeds/sa8d-8x8.yaml` 已声明门禁：
  - sa8d：100000 cases **mismatches=0** PASS；
  - dct16：100000 cases，candidate vs 上游 NEON **0 失配**
    （vs C 的 6 例是上游 dct16_neon 自身已知分歧）→ 门禁按
    “与上游实现位级一致”通过；
- 门禁注册表：`emit_c_intrinsics` / `emit_dct16_c_intrinsics`
  / `emit_interp8_c_intrinsics`。

### G4b ✅：interp8 roundtrip codegen + 门禁

- `codegen.emit_interp8_c_intrinsics`：忠实还原 136 节点数据流
  （4×16B 窗口 load → b-128 xor → 3×tbl1 → 4×vdotq_s32（splat 8192/
  链式累加）→ concat+vmovn → vqrshrun_n_s16 → 行 store）；
  系数来自 `x265::g_lumaFilter[phase]`，tbl 掩码内嵌
  `dotprod_permute_tbl`（从源码取值）；
- 新 harness `kernels/interp8/roundtrip_verify.cpp`：candidate vs
  上游 `interp8_horiz_pp_dotprod<8,8>`，随机 stride/8 相位；
- 门禁结果：**100000 cases mismatches=0 PASS**（seed 语义保真闭环）；
- 至此三个 seed（dct16/interp8/sa8d）全部纳入出厂 roundtrip 门禁。

### G4c ✅：interp8 16x16 / 32x32 seed 打通

- `seeds/interp8-16x16.yaml`：加 `-funroll-loops -unroll-count=16`
  后模板完全展开（**496 节点**，0 br/icmp），roundtrip 门禁
  **50000 cases mismatches=0**；codegen 新增 `inbounds nuw` addr 形态；
- `seeds/interp8-32x32.yaml`：**1952 节点**，roundtrip 门禁
  **20000 cases mismatches=0**；codegen 新增 8 字节 load/xor/
  identity-extend（`vcombine_u8`+zero），lane_forms 对 undef/poison
  越界 lane 改为独立叶子（不崩溃、不误归因）；
- 完整流水线（seed→检测→搜索）两形状均精确复现手写最优：
  interp8-16 **327 / 114**、interp8-32 **1289 / 369**；
- 至此 interp8 hpp 8/16/32 三形状全部由 seed 线自动覆盖。

### G4d ✅：interp4（chroma 4-tap）16x16 新族打通

- `extract.strip_uniform_branch`：interp4 在 phase==4 时派发到另一个
  kernel，提取时剥离该均匀分支（取主 dotprod 路径），importer 新增
  带注释标签行支持；harness 测 7 个非恒等相位（项目合同一致）；
- codegen 新增：`g_chromaFilter` 符号/`<4 x i16>` load、`ld1x2`、
  `<4 x i16>→<8 x i16>` 扩展、双 `<8 x i8>` 拼接行存储、store 按宽度
  选 vst1q/vst1；
- 门禁：**50000 cases（7 相位）mismatches=0**；
- 完整流水线：interp4 16x16 **165 / 70**，精确复现手写最优——chroma
  4-tap 成为 seed 线覆盖的第一个新族（此前只有 luma 8-tap）。

### G4e ✅：interp4 8x8 / 32x32（同族机械扩展）

- `seeds/interp4-8x8.yaml` / `seeds/interp4-32x32.yaml` + 对应 harness：
  门禁 **50000 / 20000 cases（7 相位）均 0 失配**；
- 全流程：interp4-8 **85 / 47**、interp4-32 **645 / 189**，与手写
  特化一致；
- interp4 族（8/16/32）全部由 seed 线覆盖。

### S1 ✅：seed → 搜索 单命令流水线（seed_pipeline.py）

- `tools/seed_pipeline.py --recipe <seeds/*.yaml> --kernel <name>`：
  提取（含 roundtrip 门禁）→ 结构检测/轴种子 → 全轴空间搜索 →
  summary.json（best fused/MCA + family/axis seed）；
- 配方可声明 `search: {backend: op, extra: [...]}`（dct16 用 op 后端）；
  interp8 自动用 patched llvm-mca；
- 三族验证：
  - dct16：**699 / 212**（32 候选，16 s，精确复现）；
  - interp8-8x8：**93 / 53**（轴种子 sdot-h+addp）；
  - sa8d-8x8：**79 / 71**（轴种子 reduce=sve，超过历史手写候选）。
