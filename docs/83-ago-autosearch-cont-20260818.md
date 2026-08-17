# docs/83: AGO 自动搜索续接 — manifest 修复 + 家族扩展 + 发现模式 (2026-08-18)

> 承接 docs/78-82 主线（NEON/SVE → SVE2-256 优化 + AGO 自动搜索）。
> 本文档记录本地可完成项；950 实机验证仍在用户侧。

## 0. 本轮改动摘要（第三轮续接）

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
2. 前两轮摘要见 §1（首轮）与 §2（第二轮）；commit 清单见 §5/§7。

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
- `tools/ago_auto_search.py` / `tools/search_sve2_layouts.py`：
  注册 satd-8x16/satd-16x8（免 manifest + 全管线）
- `optimizer/ago/test_covers_more.py`：+4 测试（13 个）
- DB 289 行（6 行：satd 形状 NEON covers 门禁 + permute）
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
4. satd-16/sad 的 width-native 候选：satd-16 的 best_ir_sve16 58.8%
   与 dct16 sve16 同型（dual-group 高 permute），可套 dct16 的
   neon_bridge/loop 模板重做（sad 已 0% 无需）。
