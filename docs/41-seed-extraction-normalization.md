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
