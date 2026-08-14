你是 AArch64/SVE2 编译器优化与 AI 编译器方向的高级审阅者。请审阅
下面这批 DCT32 优化迭代的结论，反驳错误归因，并给出下一轮按信息
增益排序的 1–3 个实验/方向。只把最终建议写入
`expert-advice/round-0016/` 下的 summary.md / tooling-roadmap.md /
verification.md（不要修改任何源码/manifest/实验产物）。

背景：项目把 x265 DCT32 的 SVE2 kernel 抽象为 op DAG，用 manifest
布局轴笛卡尔积 + QEMU VL=256 差分 + true-dynamic 指令计数 + x265
TestBenchLite（5 seed）门禁自动搜索。黄金标准：TestBenchLite PASS；
20k 差分 legacy 签名 7268（阈值 22528）不变。

本轮三个迭代（round-0015 后）：
1. sdot_indexed 轴：SVE2 indexed SDOT（Zda.D, Zn.H, Zm.H[imm]）把
   两个 k 族的 4 系数组打包进一个 16-lane 常量向量
   （[kA c0..3, kB c0..3, kA c0..3, kB c0..3]，imm 每 128-bit 段选
   同一 64-bit 组），常量加载 450→282，4682→4514（-168）。搜索
   还发现 k0_shared_mul（原负收益）与它交互由负转正。
2. odd_from_k0packs 轴：k0 的 pack(hi) 换成 pack(rv)（rv=rev(hi)，
   e 链配对 H3≡R0/H0≡R3r/H2≡R1/H1≡R2r 逐 lane 等价），odd 切片
   = L−R（X2/X3 需 revh 还原），4514→4480（-34，spill +39）。
3. k2k4_from_packs 轴：k2 EX0=(L0+R0)-(L3r+R3r)/EX1=(L1+R1)-
   (L2r+R2r)；k4 Xk4=(t0+t3)-revh(t1+t2)，pass2 leaf 的
   E16/EO16/EE16/EEO16 链整体 DCE，4480→4234（-246）。

当前状态：DCT32 best 4234 fused_uop（vector 4694 / stack 442 /
零 scatter），相对上游 12710 = 0.333×；**fused_uop 口径 0.877×、
fused_adj 口径 0.996×，均低于内部参考（4827/4251）**；20k 签名
7268 不变；TestBenchLite 5 seed PASS。累计 5390→4234（-21.5%）。
920B（SVE1）存活但跑不了 SVE2 候选；960（SVE2.3）未流片。

请回答：
- 三迭代的归因是否成立？特别是“pass2 全部 k 族共享同一组 L/R pack”
  是否还有剩余结构收益（当前 pass2 vector ~2350，内部 ~2250）；
- 指令数已低于内部参考后，下一阶段优先：DCT16 迁移（其 op 后端
  结构不同，705/895 vs 内部 731）、920B SVE1 实机验证、还是继续
  DCT32 微优化（spill 442、打包置换 ~700）？
- 工具层面：pack 共享类轴还有哪些可推广形态（例如 E-pack 在
  pass1、k0 的 sdot 化在 SVE2.3 的 sdot.h）；搜索空间 608 候选的
  收敛建议。

关键文件（只读）：
- docs/20-dct32-optimization-assessment.md §6.10–§6.12
- docs/24-dct32-pass2-shared-pack.md
- docs/10-agent-handoff.md §0.1/§0.11
- kernels/dct32/manifest.yaml；optimizer/ir/dct32_op_ir.py /
  dct32_op_emit.py
- experiments/m31-dct32-k0-sdot/probe_sdot_lane.cpp、
  probe_odd_from_packs.cpp、probe_k2k4_from_packs.cpp
- experiments/m30-dct32-search/layout-search-k2k4/results.json

明确区分“由文件支持的事实”“推断”“需要实验验证的建议”。
