# 完整交接文档（2026-08-14，上下文压缩用）

> 本文档是当前唯一完整交接；docs/10 保留历史索引。接手 Agent 先读
> 本文档 §1-§7，再按 §7 的 5 步快速上手。

## 1. 项目一句话状态

对 x265 AArch64（NEON/SVE/SVE2/SVE2p3）算子做**可验证的离线超优化**：
manifest+emitter → 搜索（多轴/并行/缓存）→ 20k 差分 + TestBenchLite →
动态 MCA/表成本/融合 inventory → 替换预估 → 950/920B 实机 paired →
内部注入。**无 960 实机（用户拍板）**，MCA/950 校准权重 + QEMU 为最终
代理；达标内核仅保留项目内部，不做上游 PR。

## 2. 仓库与环境

- 仓库：`/home/chiro/projects/a64-simd-dyn-optimizer`；remote
  `origin`（chiro@129.146.162.16 项目机）、`github`
  （chiro2001/a64-simd-dyn-optimizer，public）。**自动 git push 双远端**。
- 工作树干净（0 未跟踪）；gitignore 只保留 experiments results.json。
- 工具链：clang 22.1.8（`-march=armv9.4-a+sve2p3`）、GCC 16.1.0
  （交叉 aarch64-linux-gnu-g++）、binutils 2.47、QEMU 11.0.3 自定义
  （SVE2p1/2p3 补丁）。
- 关键路径：`build/qemu-build/qemu-aarch64`（自定义，OBJD-T 追踪格式，
  需 objdump 修复）、`build/qemu-src`（QEMU 源码）、
  `/home/chiro/llvm-src/build-mca/bin/llvm-mca`（自定义 MCA，sdot 调度
  补丁）、`build/x265-8-clang-sve/libx265.a`（参考库）。
- 远程实机：950（920G，SVE2 2x256，用户侧 Agent 测）、920B 内网
  （严格 SVE1，用户侧）、云 920B `chiro@124.70.206.229`（本仓库可用，
  与用户测试错峰）。

## 3. 内核覆盖表（全部已验证；fused/MCA，上游为 NEON 基线）

| kernel | 候选 fused | MCA | 上游 fused/MCA | 实机/状态 |
| --- | ---: | ---: | ---: | ---: |
| dct8 | 289 | 77 | 146/48 | 950 原生 **+48%**（✅）；920B 0.75（慢） |
| dct16 | 847 | 220 | 1808/509 | 过减半门；950 不可原生（SVE2p1） |
| dct32 | 4014 | 1041 | 12710 | 950 实测最快（985~995 cyc） |
| idct16 | 980 | 246 | 1487/462 | 950 替换下界 1.09；分歧待裁决 |
| idct32 | 5085 | 1164 | 10214/3318 | 950 替换下界 1.03 |
| sa8d16 | 186 | 73 | 373 | 950 原生 **+28%**（✅，过减半门 186.5） |
| sa8d 8x8 | — | — | — | 有候选，非重点 |
| interp8 hpp path-B 8/16/32 | 93/327/1289 | 53/114/369 | 141/467/1829 | SVE2p3-only，等 960（无）→ 内部保留 |
| interp8 vpp 16/32 | 247/936 | 157/547 | 400/1572 | 950 原生 **+12%/+13%**（✅） |
| interp4 hpp 16/32 | 165/645 | 70/189 | 345/1353 | SVE2p3-only；8x8 不采用 |
| interp4 vpp 16 | 171 | 96 | 231/93 | SVE2，950 可测（待 paired） |
| sad 16/32 | 80/160 | 69/118 | 68/197/26/59 | **无优化空间**，覆盖关闭 |

关键技巧（配方库，docs/22）：sdot.h 切片+addp 对和（93/327/1289）、
滑动行管线（vpp）、单 TBL+双 sdot.h（interp4）、`movprfx` 融合 +
DC 偏移拆分、BtoS 替换口径（上/下界）。

## 4. 实机结论（reports/）

- **950 首轮**（docs/35）：sa8d16/ivpp16/ivpp32/dct8 超保留线 1.10；
  idct16/32 替换下界 1.09/1.03；interp8 path-B 950 不采用（SVE2p3
  缺失）；**NV2 MCA 对 SVE256 系统性低估**（vpp/dct8 判慢实快）。
- **920B 内网最终版**（docs/34 §2.3）：严格 SVE1（sa8d SIGILL 证实）；
  替换样本与云方向一致，**ipb16 云/内网分歧 0.872 vs 0.667 待云重测**；
  dct8 原生 0.75（samples≥50 才稳定），与 950 1.483 对照说明
  **SVE/NEON 管道平衡随硅片变化**。
- MCA 校准第一轮：`tools/calibrate_mca_950.py` + `--mca-target 950`
  profile（compute×3.16/permute×0.32/mem×3.16）；dct8 方向翻转需
  kernel 级修正（docs/34 §2.4）。

## 5. 工具链/流程现状

已自动化：
- `search_sve2_layouts.py`：manifest 布局笛卡尔搜索、多 worker 并行、
  build fingerprint 缓存、两级差分、动态 MCA/表成本/cp/lite/
  fusion inventory、`--bench-920b`（idct16/32/interp8/dct8）、
  `--finalize`。
- `gen_verify`：kind 模板（dct/sa8d/interp8/interp8vpp/interp4/
  interp4vpp/sad）自动生成 20k 差分。
- `tools/parse_qemu_trace.py --fix-driver`（OBJD-T 修复）、
  `fix_dynamic_trace.py`、`static_counts`。
- 替换流：`substitute_unsupported.py`（sdot/sqrshrnb/splice→sel 等）、
  `build-substituted-microbench.sh`（idct16/32，sve1/sve2，CXX/AS 可覆盖）、
  `build-interp8-substituted-microbench.sh`（8/16/32，sve1 自动 uzp 源）。
- 实机：`quick-test-real-machine.sh <950|920b>`（门禁+paired 报告）、
  `bench-generic-paired.sh`、`parse_quick_report.py`（known_kernels.json
  自动对照）。
- `calibrate_mca_950.py`、`enumerate_x265_simd.py`。

仍手工（每新算子族）：
1. manifest 编写（参考符号/形状/strides）；2. gen_verify kind 模板；
3. **发射器（核心算法设计）**；4. search emitter hook（3 行）；
5. 语义调试（缓冲/stride 坑：32 宽块 strides≥32、手写 harness 缓冲
   要 `wa[n*64]`）。

## 6. 流程优化总结（相对早期）

1. **验证口径分层**：20k 差分（快筛）→ TestBenchLite（黄金）→
   QEMU 动态流（权威指令数）→ MCA/表成本 → 950/920B paired（验收）。
2. **指令数/MCA 双指标**：fused 与 MCA 常背离（vpp/dct8 MCA 判慢实快；
   sad MCA 判差）；用 950 校准权重 + 实机裁决。
3. **替换口径量化**：BtoS 替换 = 上/下界；sve1 目标自动回退 uzp 源。
4. **候选漂移检查**：emitter 输出与固化候选逐字节一致（vpp16 曾
   257→247 漂移已修）。
5. **工具链坑已文档化**：OBJD-T 追踪、`--fix-driver`、sve2p3 编译只在
   本地交叉生成 .S、实机只汇编、编译器能力探测。
6. **实机数据回填**：报告文件 + known_kernels.json + parse 工具，
   云/内网差异跟踪。

## 7. 后续方向：算子搜索自动化（程序 + Agent 默认 profile dsv4flash）

目标（用户）：**让“程序 + Agent（codex 默认 profile dsv4flash）”快速
覆盖所有算子的优化**。当前“全自动”只差两块：

### 7.1 脚手架全自动（程序可完成，下一步实施）
- `enumerate_x265_simd.py` → 自动生成 manifest：从 x265 源/nm 提取
  参考符号、形状、签名描述（输入/输出/参数/返回），填 manifest YAML。
- gen_verify 改为**签名驱动**：一个通用模板 + 签名描述符（现 7 个
  kind 可合并），新算子零手写 harness。
- search emitter hook 按 kernel 名自动注册（一个通用 dispatcher）。
- 批量循环：对 enumerate 的 todo 列表逐个跑“脚手架→搜索→固化→
  更新 known_kernels/docs”。

### 7.2 发射器配方库（程序 + Agent 半自动）
- 已见族参数化模板：水平 FIR（tap 数/系数表/相位）、垂直滑动行
  （行数/累加器拆分）、差分求和（sad/sa8d）、蝶形变换（dct/idct）。
- 同一算法族（interp4 vs interp8、sad vs sa8d）自动实例化；
  全新算法族（quant/sao/intra）由 **Agent（dsv4flash 默认 profile）**
  设计一次 emitter，之后固化进配方库。
- 预期：已见族算子几分钟覆盖；全新族 1 个 Agent 会话。

### 7.3 下一步执行顺序（按 docs/37）
1. 实施 7.1 脚手架自动化（先支持 sad/sa8d/interp 已见族批量回放）；
2. 覆盖剩余族：**quant → sao → scale1D/2D → ssim → intra**（Agent 按
   需设计 emitter）；3. ipb16 云重测 + 950 interp4vpp paired 收尾；
4. MCA 校准第二轮（更多样本后重拟合，dct8 kernel 级修正）。

## 8. Agent 快速上手 5 步

1. `git pull && git log -1`；读本文件 §2/§3/§5。
2. 环境自检：`scripts/doctor.sh`；自定义 QEMU/MCA 路径见 §2。
3. 验证工具链闭环：对任意 manifest 跑一次小型搜索
   （如 `--kernel interp4 --short-cases 300 --no-short-gate --mca-top 1`）。
4. 实机流程：docs/32（950）/docs/33（920B）+ quick-test 脚本 +
   parse_quick_report。
5. 新算子：docs/37 流程 + 7.1/7.2 自动化（未实施前按“复制最近 manifest
   + kind 模板 + 配方库 emitter + hook”的 30-60 分钟路径）。

## 9. 纪律与坑

- 不要读/提交 `/tmp/dct-sve.s`（内部算子，禁入仓库）；内部信息只以
  数字/结论形式进 docs。
- /tmp 是 tmpfs（内存盘），大文件放 `build/` 或 `/home/chiro/tmp`。
- 实机并发：云 920B 与用户测试错峰；950/920B 由用户侧 Agent 跑，
  本仓库只准备脚本与解析。
- QEMU 构建期间不要并行跑自定义 QEMU（二进制替换窗口）。
- git 双远端 push；实验产物只留 results.json。
