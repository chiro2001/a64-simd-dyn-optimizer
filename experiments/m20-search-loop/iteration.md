# m20-search-loop：搜索主循环 v0（家族限定，family-scoped）

- run-id: `m20-search-loop`
- state: `foundation-only`（闭环打通；rewrite 目录待扩）
- date: 2026-08-13（Asia/Shanghai）
- host: 本地 x86 交叉

## 1. 定位

P6' 验证结论：校准后的关键路径模型只在其拟合家族内有效（920B DCT8
R²=0.98）。因此 v0 搜索驱动**限定家族使用**：对 DCT8 合同枚举 MachineIR
rewrite、生成 C++、交叉编译、反汇编、用拟合权重算成本并排序。跨家族排序
仍 gated（m19）。

## 2. 实现与证据

`tools/search_driver.py`：`--rewrite=widen` 逐个应用（当前目录：widen/
nop），`emit_dct8_c_intrinsics` 出码，aarch64-g++ 编译，objdump →
`estimate_critical_path` → 拟合权重路径成本 → 排序。运行结果：

| 机器 | baseline（343 条） | widen（347 条） | 排序 |
| --- | ---: | ---: | --- |
| n1 | 2.70 | 2.70 | baseline < widen |
| 920b | 7.06 | 7.06 | baseline < widen |

与 M14 实测（widen 对上游 0.981/0.891）方向一致；N1 的成本差未拉开
（N1 拟合 R²=0.81 的局限）。

## 3. 下一增量

- ✅ rewrite 目录已加 `mul64_to_shift`（×64 常量乘 → shl 6），组合枚举
  {baseline, widen, shift64, widen+shift64}；widen+shift64 候选 C-exact
  （20k 0 mismatch）——搜索循环已能做出并验证真实的指令选择；
- 继续：把 M15/M16 的结构选择编码为 IR rewrite
  （奇数行 tree↔mla、全宽加载、转置/常量复用），让搜索空间真正展开；
- 每个新 rewrite 先过 range/cost 分析再进目录；
- 920B 家族内可信任排序，N1 需先补拟合点。
