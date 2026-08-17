# docs/83: AGO 自动搜索续接 — manifest 修复 + 家族扩展 + 发现模式 (2026-08-18)

> 承接 docs/78-82 主线（NEON/SVE → SVE2-256 优化 + AGO 自动搜索）。
> 本文档记录本地可完成项；950 实机验证仍在用户侧。

## 0. 本轮改动摘要（goal round 6：sa8d16 宽度原生 cadd，自动搜索 21 kernel）

1. **sa8d16 宽度原生候选（best_wide_cadd.cpp）**：现有候选 best_sve1
   (411 uop)/best_sve2 (404 uop，纯 NEON trn 128-bit) 均远高于 manifest
   预期 ~180；上游 `sa8d16_sve2<16,16>` 的 hadamard_8x8 本身用 cadd
   （128-bit bridge，rot-90 + kHADPermuteTbl）。逐字移植为宽度原生
   （VL=256 16-lane 同时处理左右 8x8 象限）：
   - 静态（-O3）：**fused 193（vs 404/411，减半）、permute 10.0%
     （vs 20.2/16.9%）、cp_lat 47（vs 95/100）**
   - 门禁：**QEMU vq=2 2000 例差分 0 失配**（vs sa8d16_sve2<16,16>）
   - 排序（ago_pred，950 表）：**cover-C 204.2 vs B 903.9 / A 908.9
     （4.4x 快）**——自动搜索大幅超过两个手写候选
   - 踩坑记录：初版 had8 只有 **2 级 cadd + 2 tbl**（8 点 hadamard 需
     3 级蝴蝶）→ 2000/2000 失配（同 psy-cost 漏级错误）；补第 3 级
     cadd 后 bit-exact
2. **接线**：新建 covers_sa8d16.py（A/B/C + cp_chains/tail_ops/
   expected_permute_ratio），两工具注册（make_emitter/ago_covers/
   rank-by chain/_ago_march/KERNEL_COVERS）；测试 +4（TestCoversSa8d16）。
3. **DB 301→303 行**；docs/82 家族表 + sa8d16 行（score=0.293）。

## 0a. 本轮改动摘要（goal round 5：satd 大形状全家族覆盖，20 kernel）

1. **satd 大形状全覆盖（cadd 模板参数化生成，+8 kernel → 自动搜索 20）**：
   水平/纵向扩展模式经门禁逐一证实（独立 16-lane 条带分解与参考一致）：
   - 32x16/32x32/32x64（2 半向量/行）、64x16/64x32/64x48/64x64
     （4 半向量/行）、16x32/16x64（上一轮）——全部 **QEMU vq=2
     2000 例差分 0 失配**（vs satd8_sve2<W,H>）
   - 静态（-O3 循环体）：32 宽 fused 72 / ago_pred 72.3；64 宽
     fused 140 / ago_pred 170.8
   - 生成方式：python 生成器（halves × gmax 参数化）产出候选 +
     covers 模块，两工具注册（make_emitter/ago_covers/rank-by
     chain/_ago_march/KERNEL_COVERS）
   - 踩坑：生成器初始把 covers 模块写成 `covers_satd-32x64.py`
     （带连字符）→ 导入失败门禁空跑；重命名为 `covers_satd32x64.py`
     后 4 门禁全过。测试：TestLargeSatdCovers 参数化 9 形状（+3）
2. **DB 297→301 行**；docs/82 家族表 +8 行（satd 家族 14 形状全覆盖，
   覆盖 score 0.260-0.391）。satd 家族成为自动搜索最大家族。

## 0a. 本轮改动摘要（goal round 4：satd-16x32/16x64 新 kernel 覆盖）

1. **大形状 satd 覆盖（13 个 kernel）**：satd-16x32/16x64（W=16，
   H=32/64，均为 16 宽 × 纵向翻倍）此前无任何候选。用已验证的
   satd-16 cadd 内核做**纵向扩展**（g-loop 4→8/16 组，同一 ROWH4
   结构）：
   - `kernels/satd-16x32|candidates/best_sve2_cadd.cpp`（g<8）、
     `kernels/satd-16x64/candidates/best_sve2_cadd.cpp`（g<16）
   - 新建 covers_satd16x32.py / covers_satd16x64.py（cover A）
   - 两工具注册（ago_auto_search KERNEL_COVERS + search_sve2_layouts
     make_emitter/ago_covers/rank-by chain/_ago_march sve2 组——
     后者曾因缺 satd-16x32 落到 dotprod march 使 rank-by ago 崩溃，
     已修）
   - 门禁：**两 shape 均 QEMU vq=2 2000 例差分 0 失配**（vs
     satd8_sve2<16,32>/<16,64>）；fused 38（循环体）、permute 22.2%、
     ago_pred 38.1
   - 测试 +3（TestCoversSatd16x32，含 g<8 结构断言）
2. **DB 297 行**（+2）；docs/82 家族表 + satd-16x32/16x64 行。

## 0a. 本轮改动摘要（goal round 3：satd-16 原生 cadd + -O3 口径统一 + 模板沉淀）

1. **satd-16 cover C（best_sve2_cadd.cpp，SVE2 原生 cadd）**：best_sve1
   已经是 cadd 风格（gen_sve2_emit 的 ROWH4 = cadd→tbl→cadd），但它是
   **SVE1 软件模拟 cadd**（tbl swap + mul sign + add，3-4 条指令，为
   920B SVE1 兼容）。950 是 SVE2——原生 `svcadd_s16(a, a, 270)` 一条
   指令替换（软件 cadd 语义 = SVE2 rot-270，逐 lane 核对后确认）：
   - 静态（-O3）：**fused_uop 172→138（-20%）、tbl 48→16、mul 32→0**；
     permute_depth_ratio 持平 0.08（CP 模型只计 2 条 tbl）
   - 门禁：**QEMU vq=2 2000 例差分 0 失配**（vs satd8_sve2<16,16>）
   - 自动搜索排序（ago_pred，950 表）：**cover-C 144.4 < cover-A 148.2**
     ——SVE2 约束下自动搜索选出原生 cadd 版（920B/SVE1 约束下仍选
     best_sve1 软件模拟，即"指定不同限制输出"维度）
2. **-O3 口径统一（工具一致性修复）**：search_sve2_layouts ago 后端
   candidate_opt 默认 -O2（sdot 例外），ago_auto_search 用 -O3——
   同一 cover 两工具计数不同（satd-16 best_sve1 48@-O2 vs 172@-O3）。
   修复：ago 后端（combo 含 "cover" 键）统一 -O3（与自动搜索、家族表
   score、docs/79 实测 -O3 一致）；缓存键含 candidate_opt 自动分槽。
   修复后两工具数字完全对齐（satd-16 A/C = 172/138，psy-cost A/C =
   176/97）。
3. **cadd_butterfly 模板沉淀（optimizer/templates/cadd_butterfly.py）**：
   第 4 个通用模板（P4 模板库）。模式：svcadd<270>(x,x) 蝴蝶 + tbl 重排
   替代 trn 转置链；ISA 映射（SVE2 原生 / SVE1 软件模拟 / NEON trn 基线）；
   成功案例 psy-cost + satd-16。emit() 生成 satd-16 pack=2 宽度原生源；
   kernel_types = satd16/satd/sa8d/psy_cost；6 个新单测（模板测试 19→25）。
4. **DB 295 行**（+2：satd-16 cadd 门禁行 + vs-best_sve1 对比行）；
   docs/82 家族表 satd-16 行改 C 胜（score=0.218，ago_pred 144.4 vs
   148.2）。

## 0a. 本轮改动摘要（goal round 2：psy-cost cadd 蝴蝶候选）

1. **psy-cost 家族首个"超过手写"候选（best_cadd.cpp）**：手写
   best_sve2.cpp（30.8% permute、168 uop）是 trn 转置链实现；量化上游
   `x265::psyCost_pp_sve2<2>` 二进制发现其内部用 **SVE2 cadd<90>(x,x)
   蝴蝶**（[a+b, a-b] 相邻 lane 对，一次指令完成两路和差）+ 单次 tbl
   重排，每 8x8 块 24 cadd + 16 tbl（vs 手写 24 trn + 16 add/sub）。
   移植上游 u8 路径（pass_1 → hadamard_h 4 段 cadd→tbl→cadd→tbl→cadd
   → pass_2_3 → 16x16 组合 → vabaq 绝对值差）为独立候选：
   - 静态（-O3 armv8.2-a+sve2，static_counts）：**fused_uop 97（-45%）、
     permute_depth_ratio 17.4%（vs 30.8%）、cp_lat 29（vs 44）、
     permute_on_critical 4（vs 40）**
   - 门禁：**QEMU vq=2 2000 例差分 0 失配**（vs psyCost_pp_sve2<2>）
   - 自动搜索排序（ago_pred，950 代价表）：**cover-C 94.2 vs cover-A
     304.2**——预测 3.2x 快
2. **踩坑记录**：初版只移植 3 段（漏第 2 次 tbl+cadd）→ 1999/2000
   失配；上游 hadamard_8_h 是 **4 段**（8 点 hadamard 3 级蝴蝶 + 2 次
   tbl 重排），补齐后 bit-exact。"bit-exact by construction"仍必须过
   门禁。
3. **ago 后端计数统一为全对象 static_counts**（薄 wrapper 伪影推广）：
   cadd 内核 -O2 链接时被内联进 trace driver 的 main，导出符号只剩
   3 uop（同 dct16/32 "manifest 待修"问题）。修复：ago 后端**全部**
   kernel 走 whole-object static_counts（原只豁免 dct16/dct32），
   缓存键 `|count=whole-object-static` 同步推广。修复后 cover-A 168、
   cover-C 95（此前 cover-A 走 trace 路径记 784，与自动搜索 static
   口径不一致）。
4. **DB 293 行**（+2：best_cadd 门禁行 + vs-best_sve2 对比行）；
   docs/82 家族表 psy-cost 行改 C 胜（score=0.269）；cover C 注册
   covers_psycost（A/B/C + cp_chains/tail_ops/expected_permute_ratio）。

## 0a. 第三轮改动摘要（goal round 1，2026-08-18）

1. **satd 形状家族接入自动搜索（docs/82 #4 扩展）**：satd-8x16/
   satd-16x8 是 scan 中仅有的超阈值 satd 变体（50.7%/46.7%，均为
   dual-group sve16），此前无次阈值候选。新建适配器 covers
   （`covers_satd_8x16.py`/`covers_satd_16x8.py` 包装 covers_satd_shapes
   的 NEON A/B/C trn 版），`shape_meta()` 提供 per-shape cover_meta
   （键=cover 字母，兼容 predict_from_features）。接入 ago_auto_search
   （免 manifest）与 search_sve2_layouts ago 后端（全管线）：
   - satd-8x16：NEON A/C 21.4%、B 22.2%（152-154 uop），**3 cover 全过
     QEMU 2000 例差分**（vs `x265::satd8_sve2<8,16>`）；sve16 候选
     50.7% 符号不匹配 LINK FAIL（scan 记录）
   - satd-16x8：NEON B 17.4% > A/C 23.1%，**3 cover 全过 QEMU 2000 例
     差分**（vs `satd8_sve2<16,8>`）；sve16 候选 46.7% LINK FAIL
   - 自动搜索在两个家族均选出比手写 sve16 更好的候选（score 0.366/
     0.328 vs sve16 的 0.863/0.829）——"自动搜索 ≥ 手写"再添两例
2. **cost-coeff-nxn 接入**（scan 超阈值家族收尾）：covers_costcoeff.py
   包装 looped（45.5%⚠）与 unroll（0.0%）两候选；**两 cover 全过 QEMU
   2000 例差分**（vs x265_costCoeffNxN_neon），自动搜索选出 unroll 版
   （score 0.268）。至此 scan 25 个超阈值候选覆盖：dct16/32、interp8、
   satd-16/8x16/16x8、sad、psy-cost、cost-coeff 全部接入自动搜索。
3. 前两轮摘要见 §1（首轮）与 §2（第二轮）；commit 清单见 §5/§6/§7。

## 1. 首轮改动摘要

1. **dct32 ago 后端 manifest 计数 bug 修复**（docs/82 "manifest 待修"
   闭环，详见 docs/82 文首更新节）：
   - 根因：ago cover 源把 kernel 放在 static `op_pass_4/op_pass_11`
     助手内，导出符号 `dynopt_dct16/32_sve2_shared` 只是薄 wrapper；
     `search_sve2_layouts.py` ago 后端按 wrapper 符号范围做 QEMU
     trace 只统计到 ~14 条指令（fused_uop=0、vector=0）。
   - 修复：ago+dct16/dct32 改走**全对象 static_counts**
     （`measure_layout_candidate` 专用分支），与 ago_auto_search 同源，
     匹配 docs/79 实测（dct32 761/1129、dct16 950/1019）；缓存键 bump
     `|count=whole-object-static` 防旧错误计数复用。
   - 验证：dct32 ago 排名 cover-A (loop) 416 vs cover-B (opbase) 1087
     （-O2 编译口径，-O3 为 761/1129），ago_pred NP1 890.2 vs 1701.2，
     cover-A 继续胜出，与 docs/79 一致。dct16/interp8 同步验证通过。

2. **家族扩展（docs/82 下一步 #4 完成）**：新增 3 个 cover 模板
   （包装现有候选）+ `ago_auto_search.py` 改为**免 manifest 直接
   发射**（psy-cost 无 manifest 也能跑）：
   - `optimizer/ago/covers_satd16.py`：A=best_sve1 (8.0%) 胜
     B=best_ir_sve16 (58.8%)
   - `optimizer/ago/covers_sad.py`：B=best_ir (0.0%,66) 胜
     A=best_sve2 (0.0%,80) 胜 C=best_ir_sve16 (54.7%)
   - `optimizer/ago/covers_psycost.py`：A=best_sve2 (30.8%) 胜
     B=best_ir_sve16 (42.6%)，⚠ 均 ≥30% 阈值
   - `search_sve2_layouts.py` ago 后端注册 sad/satd-16（有 manifest，
     全管线 QEMU 验证通过；sve16 封面因符号不匹配 manifest 合同
     LINK FAIL——语义正确）
   - 排序与 docs/81 scan 数据完全一致 → 自动搜索复现了手动结论。

3. **DB 入库（280 行）**：3 条 scan-permute（over30=25/11/5）+
   6 条 ago-auto-search 验证行（interp8/dct16/dct32/sad/satd-16/
   psy-cost）。`export-md` 已重生成。

4. **interp8 950 microbench 驱动就绪**（docs/80 下一步 #2）：
   `benchmarks/preload_verify_interp8.cpp` +
   `scripts/microbench-950-interp8.sh`（本地交叉编译语法验证通过；
   950 实机跑 `scripts/microbench-950-interp8.sh user@host`）。

## 2. 第二轮改动摘要

1. **自动发现模式（docs/82 下一步 #5 第一步）**：`ago_auto_search.py`
   新增 `--discover`：枚举发射器/模板参数网格变体（dct16 全部 even-k
   模式、含精选未暴露的 fused/addp），与精选 covers 同台编译/计数/
   排序，输出"发现最佳 vs 精选最佳"对比。dct16 发现 neon_bridge_fused
   score 1.100 < op895 1.137（uop 少 94），但 cp_lat 97 vs 52 更差
   ——score 公式不含关键路径，工具已加 ⚠ 提示，950 实测前不下结论。
   interp8/dct32 无同 kernel 网格（形状=独立 kernel / 变体已全覆盖）。
2. **psy-cost manifest + 全管线**：手工差分确认候选 best_sve2.cpp 与
   上游 `x265::psyCost_pp_sve2<2>` **bit-exact（QEMU 500×6 模式 0
   失配）**；新建 `kernels/psy-cost-16x16/manifest.yaml`（kind=psy_cost
   复用 gen_verify sad harness，签名同形）+ trace_driver.cpp。全管线
   （`--backend ago`）cover-A 过 200/2000 例 QEMU 门禁；cover-B 因
   符号是 pixel_var 不匹配合同 LINK FAIL（scan 记录）。psy-cost 从
   "免 manifest 仅排序"升级为"全管线验证"。

## 3. 回归

- tools 80（含 QEMU 差分）+ ir 50 + ago 70（含 9 个新 cover 测试）
  全部 PASS。

## 4. 工具链漂移警告（docs/79 数字复核）

复核 docs/79 的 neon_bridge 静态数（950 fused / 12.0% permute）时发现
**当前工具链下不可复现**：`kernels/dct16/candidates/
best_wide_sve2_neon_bridge.cpp` 自 9730146 起未变、发射器输出一致，
但 gcc 16.1.0 `-O3 -march=armv8.2-a+sve2` 给出 1019/25.3%
（cp_lat=62、perm=25、cp_len=99）；`-O3 -frename-registers
--param=sched-pressure-algorithm=1` 918/25.0%（perm=7、cp_len=28）；
clang 22 1137/42.1%。均无法回到 docs/79 的 950/55/25/3/12.0%。
op895 用同一工具链精确复现（952/18.5%）——差异集中在 neon_bridge
的 pass2 代码生成，判断为 gcc 升级导致的调度/内联漂移。

影响：docs/79 的"neon_bridge permute 优于 op895（12.0% vs 18.5%）"
结论在现工具链下反转（25.3% vs 18.5%），但 **docs/82 的自动搜索排序
不受影响**（dct16 由 op895 胜出是两种工具链下的稳定结论；interp8
svdot32 20.5%、dct32 loop 19.4% 均精确复现）。950 实机仍是最终仲裁
（docs/79 门禁本来就是 kernel ratio CI 下界，不依赖静态数字）。
新候选的静态数一律以 ago_auto_search 现工具链输出为准。

## 5. 未提交批次清单（首轮 commit 内容，bd97659/415f759/6cbdecf 已推送）

- docs/80（P5 interp8 svdot32）、docs/81（permute_ratio 全家族分析）、
  docs/82（AGO 自动搜索集成 + 本轮更新）、docs/83（本文档）
- interp8 svdot32 发射器 + 3 候选 + 测试
  （`optimizer/ir/interp8_wide_sve2.py`、
  `kernels/interp8/candidates/best_wide_sve2_svdot32{,_16x16,_32x32}.cpp`、
  `tools/test_interp8_wide_sve2.py`）
- AGO covers：interp8/dct16/dct32/sad/satd16/psycost + 测试
- `tools/ago_auto_search.py`、`tools/scan_permute_ratio.py`、
  `tools/test_scan_permute_ratio.py`、
  `optimizer/templates/`（loop_ksections/neon_bridge/svdot_s32_direct）
- `benchmarks/preload_verify_interp8.cpp` +
  `scripts/microbench-950-interp8.sh`
- `tools/search_sve2_layouts.py`（ago 后端 + manifest 修复 + 家族注册）
- `tools/build_preload_so.py`/`scripts/freeze-950-dct.sh`（AGO_WIDE_SVE2）
- `optimizer/ago/objfeatures.py`/`predict.py`（static_counts 桥接）
- scan-permute 报告 3 份 + DB/MD（280 行）
- `.gitignore` 增 `/tmp/`（P2 调试残留，被正式测试取代）

## 6. 本轮 commit 内容（第二轮续接）

- `tools/ago_auto_search.py`：`--discover` 自动发现模式（参数网格枚举
  + 与精选对比 + cp_lat 透明化提示）
- `kernels/psy-cost-16x16/manifest.yaml` + `trace_driver.cpp`（新）
- `tools/gen_verify.py`：kind 增 `psy_cost`（复用 sad harness）
- `tools/search_sve2_layouts.py`：ago 后端注册 psy-cost-16x16
- `optimizer/ago/covers_psycost.py`：docstring 更新（manifest 已建）
- `docs/83` 更新（发现模式 + psy-cost 全管线）
- DB 行：psy-cost 全管线门禁、dct16 发现变体静态数

## 7. 本轮 commit 内容（第三轮续接）

- `optimizer/ago/covers_satd_shapes.py`：shape_meta() per-shape
  cover_meta + 实测 expected_permute_ratio
- `optimizer/ago/covers_satd_8x16.py` / `covers_satd_16x8.py`（新）
- `optimizer/ago/covers_costcoeff.py`（新）
- `tools/ago_auto_search.py` / `tools/search_sve2_layouts.py`：
  注册 satd-8x16/satd-16x8/cost-coeff-nxn（免 manifest + 全管线）
- `optimizer/ago/test_covers_more.py`：+7 测试（16 个）
- DB 291 行（6 行 satd 形状 + 2 行 cost-coeff 门禁）
- docs/82 家族表 + docs/83 更新

## 8. 下一步（优先级）

1. **950 实机（用户侧）**：`scripts/microbench-950-interp8.sh user@host`
   （svdot32 vs best_sve2 正负控）+ `AGO_WIDE_SVE2=1
   scripts/freeze-950-dct.sh user@host`（E2E A/B）→ 结果入库 + docs
   更新（docs/63/72/77/78/79/80）。psy-cost 微基准驱动待建（可仿
   preload_verify_interp8.cpp）。
2. **发现模式深化（docs/82 #5 第二步）**：把 dct16 的 score 公式补上
   cp_lat 项（或换 permute_ratio 优先），并给 dct32 增加新 lowering
   轴（docs/79 "未探索轴"：8-row batch、预排数据布局、pass1+pass2
   融合）作为发现网格；950 实测反馈后校准 score 权重。
3. 代价表 Feedback Loop（docs/82 #3）：把 950 实测 kernel 结果回流
   NP1/920B 代价表，校准 ago_pred。
4. ~~satd-16 width-native~~ / ~~cadd 模板沉淀~~（已完成，goal round 3，
   §0）：satd-16 cover C（原生 svcadd）胜出（fused 138，ago_pred 144.4
   vs 148.2）；cadd_butterfly 模板已入库。后续：把模板应用到其它 8 点
   hadamard 家族（satd-8x16/16x8 的 hadamard_abs_4_h、sao E0、sa8d
   的 8 点变换）作为新 cover。
