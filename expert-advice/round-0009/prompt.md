# 顶级模型分析请求（round-0009，GPT-5.6-sol）

你是本项目的顶级模型分析顾问。请只在本仓库
`/home/chiro/projects/a64-simd-dyn-optimizer` 内做**只读分析**并产出下一阶段
工具优化路线，不要修改任何代码/构建/运行产物（写建议文档除外）。

## 硬性约束

1. **严禁读取 `/tmp` 或仓库外任何文件**，尤其是 `/tmp/dct-sve.s`、
   `/tmp/internal_dct.o`、`/tmp/*trace*` 等内部算子实际源码/反汇编/追踪文件。
   只能使用仓库内已落盘的聚合信息：`docs/18-internal-dct-evaluation.md`、
   `experiments/m30-dct16-search/iteration.md`、`docs/16-tool-inventory.md`、
   `docs/17-n2-validation.md`、`tools/`、`kernels/`、各 manifest。
2. 严禁把内部算子代码或实现细节写入仓库；引用 docs/18 已有的计数与结构
   结论即可。
3. 分析过程只读（可读文件、可跑只读统计脚本读仓库内 JSON），不要执行
   构建/搜索/编译命令。

## 背景（均已在仓库文档中）

项目目标：x265 DCT16 的 SVE2（VL=256）kernel 离线超优化，工具链
`manifest 布局轴 -> 发射器生成 -> 200k 差分 + x265 TestBench 黄金标准 ->
true-dynamic fused_adj 指令数`。内部手工最优 kernel 为 fused_adj=731。
近期从内部算子提取并落地的优化点（详见 docs/18 与 iteration.md）：

- `pass1_even_factor`：pass1 偶数 k 用 EE/EO 4 项点积（sdot 密度对齐，176）；
- `store_merge16`：rshrnb 偶 lane 布局 + 16-lane 合并存储；
- `pass1_pack_zip` / `pass2_pack_zip`：zip1/zip2.d + revh 构建替代 tbl2，
  tbl/mov 归零。

当前：upstream best fused_adj=887，legacy best=791，内部=731，剩余约 60
条。docs/18 §8-9 已定位：内部 pass2 偶数路径用 saddlb/saddlt + .s 级
zip/revw 构建 s32 EE'/EO'，k=0/4/8/12 用 mul.s+addp 每 16 输出约 12 条
（我们 NEON T8E 段约 100 条），并用**散布 st1d**（load_offset 偏移表）
一次写 16 输出；此外剩 movprfx（125 vs 112）、rev32 tbx（16）。

## 请输出

1. 从内部算子提取到的优化点清单与“可工具化程度”评级：哪些已进 manifest
   轴、哪些还是人工发现、如何把它们编码为可搜索的轴/重写规则。
2. 工具搜索如何才能**自己**发现并组合出这样的最优 kernel：搜索空间表示
   （布局、打包、窄化/存储形态、常量预排列）、搜索策略（枚举 vs 启发式、
   组合爆炸控制）、正确性门禁与 fused_adj 代理的关系、scatter-store 等
   “指令数便宜但实机可能贵”的口径问题。
3. 下一步 3-5 个具体工具动作（按收益/风险排序），含 `pass2_even_sve`
   的实现要点与验证标准。
4. 长期：如何让工具链从“人工提取方向”走向“工具自主搜索接近 731”。

## 输出文件（写到 expert-advice/round-0009/）

- `summary.md`：10 行以内结论摘要；
- `tooling-roadmap.md`：第 1-3 项详细路线；
- `verification.md`：第 4 项与每个动作的验证标准（200k 差分、TestBench、
  fused_adj 阈值、实机口径）。

最终答复请给 10 行以内的要点版总结。
