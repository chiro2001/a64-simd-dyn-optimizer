# docs/83: AGO 自动搜索续接 — manifest 修复 + 家族扩展 + 发现模式 (2026-08-18)

> 承接 docs/78-82 主线（NEON/SVE → SVE2-256 优化 + AGO 自动搜索）。
> 本文档记录本地可完成项；950 实机验证仍在用户侧。

## 0. 本轮改动摘要（goal round 35：sao-e0 920B 实测 + psy-cost 家族全形状实测）

1. **sao-stats-e0 block32 920B 实测**：ratio 1.031（慢 3.1%，3 次稳定，
   mism=0）——无赢面。静态 2x 预测基于 950 SVE2 代价表，920B SVE1 的
   svdot_s64 未兑现优势。新 harness `benchmarks/sao_e0_microbench.cpp`
   （5 参 cand vs 7 参 primitives.saoCuStatsE0，endX=64/endY=1 契约）。
2. **psy-cost 家族 920B 全形状实测**（SVE1 cover 全兼容）：
   | 形状 | ratio cand/ref | 结论 |
   |---|---|---|
   | **8x8** | **0.8525（3 次 × 500s 几乎一致）** | **快 14.7%——920B 最大稳定赢面** |
   | 16x16 | 0.9834 | 快 1.7%（r32 已入库） |
   | 32x32 | 0.9957 | 快 0.4%（噪声内） |
   | 64x64 | 1.0079 | 慢 0.8%（噪声内） |
   - **机理推测**：8x8 块小，NEON ref 的每调用固定开销占比高，SVE1
     cover 更紧凑；大块计算密集，NEON 效率逼近。
   - psy-cost-8x8 是继 psy-cost-16、sad-32 后**第三个 920B 稳定赢面**，
     且幅度最大（14.7%）——"自动搜索 > 手写"实机证据显著增强。
3. **920B 实测全景**（11 项）：赢 = psy-cost-8x8（14.7%）、sad-32
   （4-7%）、psy-cost-16（1.4%）；噪声 = satd-16、psy-cost-32/64；
   输 = sa8d16 NEON 降级（1.7%）、sao-e0（3.1%）、sad-16（2.3x）。
4. DB 439→443 行（sao-e0 + psy-cost 8x8/32x32/64x64）。

## 0. 本轮改动摘要（goal round 34：uadalp 模式泛化到 sad-32 + 920B 带宽优势实证）

1. **uadalp 宽累加模式泛化到 sad-32**（round-33 sad-16 发现的直接推广）：
   - 扫描全部候选确认只有 sad/sad-32 有"逐行 svaddv 归约"弱点模式
     （sao-stats/ssd 的 svaddv 是最终归约，合理）。
   - 新变体 **B（best_sve2_adalp.cpp）**：32 行 × 1 UADALP（每行 32B 全宽
     VL=256 → 32 u8→16 u16），最后单次 svaddv_u16。SVE2-only。
   - **QEMU 门禁 20000 例 0 失配**（vs pixel_sad_32x32_neon_dotprod）；
     cp_lat=12（A=14）；ago_pred B/A=0.754（快 25%）。
   - covers_sad_32.py 重构（去掉不稳定 glob，显式 A/B）+ ago_covers 加 B
     + 测试拆分（TestMiscCovers 单候选列表移除 sad-32）。
2. **920B 实机：sad-32 cover A 稳定赢 4-7%**（重大发现）：
   - ratio cand/ref = 0.935-0.957（3 次 × 500 samples × 16384 batch，
     mism=0）——与 sad-16 的 2.3x 慢**完全相反**。
   - **机理**：sad-32 每行 32B = SVE1 VL=256 **全宽 load**（1 次 256-bit
     vs NEON 2 次 128-bit），带宽优势覆盖归约劣势 → 净赢。
     sad-16 每行 16B 只占半向量，无带宽优势 → 输。
   - 这是继 psy-cost-16（1.4%）后**第二个 920B 稳定赢面**，且首次验证
     "SVE1 全宽带宽 > NEON 128-bit"路径。sad-32 归入"920B 可用赢面"。
   - 认知沉淀：920B 测量优先测**行宽 ≥32B** 的 kernel（satd-32x32 的
     SVE1 cover 缺失、sao block32 待测——均留 950/后续）。
3. DB 436→439 行（sad-32 cover-B 门禁+ago_pred、sad-32 920B 实测）。

## 0. 本轮改动摘要（goal round 33：sad 自动搜索迭代——uadalp 宽累加变体 D）

1. **920B 实测驱动 sad 自动搜索迭代**（手动搜索落入 AGO 自动搜索）：
   - 920B 实测显示 cover A（best_sve2，逐行 svaddv 归约）慢 2.3x，
     cover B（best_ir，NEON vabal 链）慢 1.3-1.45x——920B 分派路径是
     手写 NEON asm（0.67 ticks/call）。
   - **根因**：SVE1 指令集无 pairwise 宽累加（UABAL/UADALP 属
     NEON/SVE2）——这正是 x265 在 aarch64 用 NEON 做 sad 的原因。
   - 自动搜索新变体 **D（svadalp uadalp 宽累加）**：每行 1 条 UADALP
     （16 u8→8 u16 pairwise 入累加器），消除每行归约树，最后单次
     svaddv_u16。SVE2-only（sve1 约束下 ISA REJECT）。
   - 静态：**cp_lat=22（全场最短）**、fused_uop=67（A=80/B=66）、
     fusion_eligible=15 对 uadalp+uadalp。
   - **QEMU 门禁：20000 例 0 失配**（vs pixel_sad_16x16_neon_dotprod，
     upstream-exact）。
2. **ACLE 踩坑**：GCC 的 UADALP intrinsic 是 `svadalp_u16_m(pg, acc, d)`
   （带 predicate，无 u 前缀），非 `svuadalp_u16`；sve1 编译拒绝证实
   SVE2-only。
3. 管线接入：`ago_covers["sad"]` 加 D（search_sve2_layouts.py）；
   covers_sad.py 的 D 落盘 `kernels/sad/candidates/best_sve2_adalp.cpp`
   并走统一 _FILES 读取；test_covers_more 更新（covers 4 项）。
4. **结论**：sad 在 920B（SVE1）无赢面是 ISA 级约束而非搜索空间不足；
   D 是 950 目标的 SVE2 胜者候选（静态最优 cp_lat），待 950 实机验证。
5. DB 434→435 行（sad-cover-D-adalp-ago-pipeline）。

## 0. 本轮改动摘要（goal round 32：920B 首次实机测量——SVE1 VL=256）

1. **920B 首次实机 kernel 测量**（CNTVCT=100MHz，中位 ticks，mism=0/1000）：
   - 新设施 `benchmarks/sa8d16_microbench.cpp` + `benchmarks/sve1_microbench.cpp`
     （通用 harness：satd-16/sad-16/psy-cost-16，均 vs `primitives.*` 分派路径）。
   - **构建踩坑修复**：920B 编译必须加 `-I build/x265-8-gcc`
     （x265_config.h 是生成头，在 build 下而非 source 下）；本地交叉编译
     用 `-I build/x265-8-cross-sve2`。
2. **测量结果**（候选=AGO 胜者，ref=920B 分派路径，ratio cand/ref>1=候选慢）：
   | kernel | 候选 cover | ratio cand/ref | 结论 |
   |---|---|---|---|
   | sa8d16 | best_sve1（**实为 NEON**：SVE2 cadd 胜者无法降级 SVE1） | 1.017（4 次稳定） | 慢 1.7%，NEON 降级版无赢面 |
   | satd-16 | best_sve1（真 SVE1，svtbl 模拟 cadd90） | 首轮 0.962，复测 3×300s 1.01-1.03 | 噪声内，无稳定赢面 |
   | sad | best_sve2（SVE1-only） | 2.34 | 慢 2.3x：逐行 svaddv 归约 vs 手写 NEON 多行展开 |
   | **psy-cost-16x16** | best_sve2（SVE1） | **0.983-0.987（4 次稳定）** | **快 ~1.4%——920B 上首个"自动搜索>现状"稳定实机证据** |
3. **结论**：920B（SVE1）只能验证 SVE1 兼容 cover；psy-cost-16 稳定小赢
   （1.4%）。真正的 SVE2 胜者（sa8d16/psy-cost cadd 蝴蝶版等，静态预测
   4.4x/2x）需 950 验证。sad cover 暴露逐行归约弱点 → 后续优化点
   （多行展开 + 宽累加，可再入自动搜索迭代）。
4. DB 430→434 行（+4：sa8d16/satd-16/sad/psy-cost-16x16，machine=920B）。

## 0. 本轮改动摘要（goal round 31：DB 核对补漏 + docs/85 950 验证清单）

1. **语料↔DB 交叉核对**：发现 5 个已门禁但漏入库的 kernel
   （satd-32x16/32x32/64x16、interp8-32x16/64x32）→ 补 5 行；sa8d
   （M2 记作 sa8d-8）补口径统一行。**143 kernel 全部有门禁行**
   （DB 424→430 行）。
2. **docs/85：950 实机验证清单**——把用户侧命令（kernel 微基准/
   Feedback Loop 校准/E2E 仲裁/入库/通过标准）打包为一步到位的
   执行清单；工具侧就绪声明 + 重点仲裁项（dct16 op895、
   sa8d16/psy-cost cadd、sao block32、interp8 svdot32）。

## 0. 本轮改动摘要（goal round 30：dequant 从零移植——语料 143 完整）

1. **dequant（反量化）从零移植**（最后一个无候选的 manifest kernel）：
   - 上游 `x265_dequant_normal_sve2`（pixel-util-sve2.S）算法简单：
     smullb/t 宽乘 quant + srshl 舍入移位（asm 对 shift 取负 = 右移
     舍入）+ sqxtnb/t 饱和窄化
   - **踩坑**：harness 契约是 **4 参数**（quantCoef, coef, scale,
     shift，num 固定 256）——初版按 5 参数写导致参数错位（scale
     读到 num 位），first-diff 定位后修正
   - **门禁过（QEMU 2000 例 0 失配），fused 130、ago_pred 56.4**
2. **语料 143 kernel 完整**（全部有 manifest 的 kernel 均已收编；
   唯一例外 interp4 为 SVE2p3-only 超出范围）。DB 423→424 行；
   测试 +3（TestCoversDequant）；docs/82 +1 行。

## 0. 本轮改动摘要（goal round 29：interp8 大形状 +3、docs/84 语料总览）

1. **interp8-16/32x16/64x32 收编（+3）**：全过门禁（2039/4537/15491
   uop），自动搜索 139→142 kernel——**本地 sve1/sve2 适用语料收编
   完毕**（全部有候选的 kernel 均已接入）。
2. **interp4（17 形状）最终判定**：SVE2p3-only（sdot z.h,b,b 2-way），
   机器列表（N1/920B/710/950）均无 SVE2p3，超出目标优先范围
   （NEON/SVE→SVE256）——确认不接入。
3. **docs/84 语料总览**：142 kernel 全量审计（逐 kernel 实跑胜者
   与 docs/82 一致），家族统计 + 覆盖状态，作为语料现状权威记录。
4. **DB 423 行**；测试 +1（TestInterp8LargeShapes 并入既有参数化）。

## 0. 本轮改动摘要（goal round 28：misc 11 kernel，自动搜索 139）

1. **misc 单候选 kernel 全收编（11）**：mc（64 uop）、ssd（132）、
   sad-32（5）、pu-addavg（128）、pu-copy-pp（32）、scan-pos-last
   （20）、sign（8）、scale2d（22）、pel-filter-luma-strong（128）、
   find-pos-first-last（12）、sao（269，best_b0）——**11/11 全过
   QEMU 门禁**。
2. **DB 412→423 行**；docs/82 +1 摘要行；测试 +1（TestMiscCovers）。
   自动搜索 128→139 kernel。剩余未收编：dequant（无候选）、
   interp4（SVE2p3）、各家族空目录——本地语料基本收编完毕。

## 0a. 本轮改动摘要（goal round 27：interp4vpp/interp8vpp 43 kernel，自动搜索 128）

1. **interp4vpp（22 形状）+ interp8vpp（21 形状）全收编**：全部门禁过
   （interp4vpp 50-1296 uop、interp8vpp 95-4906 uop），自动搜索
   85→128 kernel。
2. **interp4 家族（17 形状）判定为 SVE2p3-only**：候选用
   `sdot z.h,b,b`（SVE2p3 2-way B→H，docs/22 §5.3）——armv8.2-a+sve2
   下汇编拒绝（"selected processor does not support"）。950 不适用，
   **移除注册**（covers 文件保留，留待 sve2p3 约束轴——未来可给 ago
   后端加 sve2p3 march 支持）。
3. **DB 369→412 行**（+43）；docs/82 +3 行（interp4vpp/interp8vpp
   摘要 + interp4 未接入说明）；测试 +1（TestInterpVppCovers）。
   安全注册模板（稳定 anchor，避开 gate 字典）已验证两轮。

## 0a. 本轮改动摘要（goal round 26：interp8 交替路径 28 kernel，自动搜索 85）

1. **interp8 hps/vps/vsp/vss 交替路径全收编（28 kernel）**：
   - vss 8 形状（docs/81 次高 permute 家族：90-2129 uop）、vsp 6
     （250-499）、vps 6（259-510）、hps 8（64-168）——**28/28 全过
     QEMU 门禁**
   - 批量生成模板（模块级候选解析）+ 批量注册（make_emitter/
     ago_covers/rank-by/_ago_march/KERNEL_COVERS）
   - 踩坑记录：a) 注册脚本的 `"idct16",` 替换误伤 lite_top gate
     字典（两处）→ 恢复原条目（含 interp8 条目 + .get()）；b) 两
     manifest 的 contract 值跨行含冒号致 YAML 非法 → 改单行
   - 测试 +1（TestInterp8AltCovers，按候选存在过滤）
2. **DB 341→369 行**；docs/82 +4 摘要行（按子家族）。自动搜索
   57→85 kernel / 21 家族。剩余 interp4/interp8vpp 家族（~40
   形状）与 misc（mc/ssd/sad-32 等）待后续轮批量。

## 0a. 本轮改动摘要（goal round 25：复制家族 6 + idct 2，自动搜索 57 kernel）

1. **复制家族补齐 6 kernel**（chroma-copy-pp/sp/ss、cu-copy-ps/sp/ss）：
   全部门禁过（fused 32-48、0% permute），覆盖 cu/chroma 复制 13/13。
2. **idct16/32 接入（变换家族完整）**：idct16 三候选
   （anchor 1282/scatter 1143/zip16 1151）全过门禁，**scatter 胜**
   （ago_pred 1513.2 vs 2258.5/2321.3）；idct32 两候选（scalar
   5968/scatter 8670）全过，**scalar 胜**（12544.5 vs 16506.7）。
   sdot_*（SVE2p1）scan-only。
3. **DB 333→341 行**；docs/82 +8 行。自动搜索 49→57 kernel / 17 家族。
   批量生成模板（模块级候选解析）可复用——剩余 interp4/interp8vpp/
   interp8 交替路径等 100+ kernel 待收编（下一轮按家族批量）。

## 0a. 本轮改动摘要（goal round 24：cu/chroma 家族 7 kernel，自动搜索 49）

1. **cu/chroma 复制/算术家族接入**（复制/加法/减法/平均 7 kernel，
   全为 manifest 已存在、候选已存在但未收编）：
   - chroma-copy-pp-8x8（16/27.0）、chroma-copy-pp-32x32（2/5.8）、
     chroma-copy-ps-16x16（32/39.5）、cu-copy-pp（2/5.8）、
     cu-add-ps（96/130.8）、cu-sub-ps（64/105.3）、
     chroma-addavg-8x8（64/70.1）
   - 门禁：**7/7 均 QEMU 2000 例 0 失配**（复制类 0% permute）
   - 接线：covers_{chroma,cu}_*.py（生成模板，模块级解析候选文件——
     踩坑：懒加载 _FILES 导致 emit 时 None、缺模块级 import os，已修）
     + 两工具注册；测试 +1（TestCuChromaCovers 参数化 7 kernel）
2. **DB 326→333 行**；docs/82 +7 行。自动搜索 42→49 kernel / 15 家族。

## 0a. 本轮改动摘要（goal round 23：satd-8x32 桥接候选，自动搜索 42 kernel）

1. **satd-8x32（8 宽形状第 2 个）**：= 4× 8x8 块（satd8_sve2<8,32> 的
   h%8==0 分支），每块 hadamard_4x4_quad（8 cadd → 8 tbl → 8 cadd →
   4 abssumsub → 4 max）。128-bit bridge 镜像上游，**一次门禁通过**
   （round-22 的"satd 返原始和无 >>1"教训直接应用）：
   - **门禁过（QEMU 2000 例 0 失配），fused 75（循环体）、ago_pred
     66.4**
   - 接线：covers_satd_8x32.py + 两工具注册；测试 +3（含 blk<4 断言）
2. **DB 325→326 行**；docs/82 +1 行（score=0.075）。satd 家族 17
   形状（8 宽 2/2 完成：8x4、8x32）。覆盖
   {8x4, 8x8, 8x16, 8x32, 16x4, 16x8, 16x16, 16x32, 16x64, 32x8,
   32x16, 32x32, 32x64, 64x16, 64x32, 64x48, 64x64} 17/17 完整
   （剩余 24/48 宽为非 8 倍数宽，x265 无对应 satd 原语）。

## 0a. 本轮改动摘要（goal round 22：satd-8x4 桥接候选，自动搜索 41 kernel）

1. **satd-8x4（8 宽边缘形状首个）**：宽度原生不可行（8-lane 行无法
   填满 256 位向量，combine permutes 吃收益）→ 用 **128-bit bridge**
   镜像上游 hadamard_4x4_dual（cadd<90> + kHADPermuteTbl 2 级蝴蝶 +
   垂直 abs/max 折叠，同 psy-cost best_cadd 模式）：
   - **踩坑**：初版按 sa8d 习惯加了 `(sum+1)>>1` 舍入——satd8_sve2
     wrapper **返回原始和（无 >>1）**；first-diff 恰好 want=5506
     got=2753（偶数和的 >>1）暴露。移除后 bit-exact
   - **门禁过（QEMU 2000 例 0 失配），fused 36、ago_pred 30.8**
   - 接线：covers_satd_8x4.py（单 cover A）+ 两工具注册；测试 +3
2. **DB 324→325 行**；docs/82 +1 行（score=0.036）。satd 家族 14
   形状。satd-8x32（=4×8x8 结构）可同法（bridge 循环）后续补。

## 0a. 本轮改动摘要（goal round 21：语料审计 + 旧格式适配 + 工具手册更新）

1. **40 kernel 语料审计**：全量跑 ago_auto_search，38 kernel 胜者与
   docs/82 完全一致（无漂移）；**抓到 2 处异常**：sa8d/satd-8 的
   cover_meta 是 M2 旧格式（kernel/tails/tail_ops/cp_chains/regions，
   无 "covers"/"names" 键）→ 自动搜索 KeyError 崩溃（此前从未在
   auto-search 中运行过）。
2. **旧格式适配器**（ago_auto_search._normalize_cover_meta）：识别
   旧格式并归一化为当前协议（covers/names/cp_chains/tail_ops/
   expected_permute_ratio），一处修复两个 kernel：
   - sa8d：A/B/C 全跑通（100/101 uop、**31.7% permute⚠** 超阈值），
     胜者 A（score 0.417）
   - satd-8：A-E 全跑通（76 uop、23.1%），胜者 A（score 0.359）
   - 测试 +3（TestCoverMetaAdapter，含两 kernel 实跑）
3. **docs/68 工具手册补 AGO 自动搜索工具链章节**（3.5 节）：auto-search
   主入口/全管线/Feedback Loop/calibration/covers 协议/templates/
   40 kernel 语料状态。
4. docs/82 补 sa8d/satd-8 行（M2 已验证 → 正式行）。

## 0a. 本轮改动摘要（goal round 20：interp8 8x16/16x8，自动搜索 40 kernel）

1. **interp8 小矩形形状接入**（家族形状补齐）：
   - interp8-8x16（best_ir：fused 1044、ago_pred 469.7）、
     interp8-16x8（831、347.0）
   - 门禁：**两 shape 均 QEMU vq=2 2000 例 0 失配**（0% permute）
   - 接线：covers_interp8_{8x16,16x8}.py + 两工具注册；TestInterp8Shapes
     SHAPES 扩至 5 形状
2. **DB 322→324 行**；docs/82 +2 行。interp8 家族形状 6/6 完整
   （8x8/8x16/16x8/16x32/32x32/64x64），自动搜索 38→40 kernel。

## 0a. 本轮改动摘要（goal round 19：dct32 8-row batch 发现轴闭环（负面结案））

1. **dct32 batch 参数化 + 发现轴探索（docs/79 未探索轴之一）**：
   - `dct32_wide_sve2.py` 的 emit_pass/emit_candidate 参数化 `batch`
     （4=原 loop、8=8 rows/组）；odd-k 路径按 4 行半组重复
   - 发现网格接入（`_discovery_variants` dct32 → emitter-batch8），
     batch8 同时固化为 cover C（门禁全管线）
   - **结果（静态 + 门禁）**：batch8 fused **1113 vs 761（+46%）**、
     permute 12.5% vs 19.4%（更好）、cp_lat 87 vs 75（更差）、
     ago_pred **1571.2 vs 890.2（更差 1.8x）**；**门禁通过（bit-exact）**
   - **结论：8-row batch 负结案**——寄存器压力（stk 167 vs 42）+ odd-k
     双倍结构使 uop 大增，permute 改善不足以抵消；docs/79 该轴
     "已探索、不采纳"。发现模式正确记录为候选（score 1.412 > 1.105）
   - 踩坑：插桩时 anchor 误入 verify 块（缩进破坏），移除后重插
2. **DB 321→322 行**；docs/82 dct32 行改 A/B/C（C 门禁过但负结案）；
   测试 +3（TestCoversDct32Batch8）。dct32 是发现模式首个完整闭环
   的 kernel（精选/发现/门禁/负结案四步齐备）。

## 0a. 本轮改动摘要（goal round 18：interp8 家族形状扩展，自动搜索 38 kernel）

1. **interp8 形状 kernel 接入**（家族从 8x8 扩展到大形状）：
   - interp8-16x32（best_ir：fused 4562、ago_pred 1878.2）、
     interp8-32（8743、3519.1）、interp8-64x64（27351、11805.9）
   - 门禁：**三 shape 均 QEMU vq=2 2000 例 0 失配**（全展开 hpp，
     0% permute；stk 高（2217-11066）是全展开的寄存器压力代价）
   - 接线：covers_interp8_{16x32,32,64x64}.py + 两工具注册；测试 +3
     （TestInterp8Shapes 参数化）
2. **DB 318→321 行**；docs/82 +3 行。自动搜索 35→38 kernel。
   遗留评估：dct32 8-row batch 轴（发射器精细手术、收益不确定）与
   边缘 satd 形状（8/24/48 宽 pack 开销）继续暂缓。

## 0a. 本轮改动摘要（goal round 17：ISA 约束维度落地——SVE1/920B 输出）

1. **"指定不同限制输出"维度落地（--isa sve1/sve2/neon）**：
   - `ago_auto_search.py` 新增 `--isa` 便捷参数（sve1 → armv8.2-a+sve、
     sve2 → 默认、neon → armv8.2-a+dotprod）
   - **ISA 约束过滤机制**：SVE2-only intrinsics（svcadd/svqadd/svqxtun
     等）在 sve1 march 下被 GCC 明确拒绝（"requires ISA extension
     'sve2'"）→ 编译失败 → 打印 **ISA REJECT**（失败时用 sve2 march
     复测区分"ISA 拒绝"与"真编译失败"）→ 幸存者排序
   - **验证（920B SVE1 语义）**：sdot.d 是 SVE1 dotprod 指令（docs/59
     canary 证实，check_isa_level 0 违规），svdot 类 cover 在 sve1 下
     合法编译 ✓；cadd/qadd/qxtun 类正确拒绝 ✓
   - **satd-16 双约束演示**：SVE2 目标 → C（原生 cadd）；SVE1 目标 →
     A（best_sve1 软件 cadd）——同一 kernel 按约束输出不同候选
   - SVE1 幸存集抽查：sad B、cost-coeff B、satd-8x16 A、satd-16x8 B、
     psy-cost A、sa8d16 A、sao-e0 E（block32，svdot_s64 合法）
2. **测试 +2（TestIsaConstraint）**：svcadd 源在 sve2 编译过/sve1 拒绝；
   svadd 源在 sve1 编译过。tools 86→88。

## 0a. 本轮改动摘要（goal round 16：sao-e2/e3 重建，自动搜索 35 kernel）

1. **sao-e2 / sao-e3（对角边偏移重建）**：E1 模式的两个对角变体：
   - **E2（135°）**：signDown = sign(rec[x] - rec[x+stride+1])（下右
     对角）、bufft[x+1] = -signDown（偏移 +1 存储，双缓冲）——
     **门禁过（fused 53、ago_pred 32.6，含 bufft[1..64] 比对）**
   - **E3（45°）**：x 从 startX+1=1 起、sign(rec[x] - rec[x+stride])、
     upBuff1[x-1] = -signDown（偏移 -1 存储）——**门禁过（fused 55、
     ago_pred 33.8）**
2. **sao 重建家族 b0/e1/e2/e3 全完整**（sao 体系 9/9：stats 5 + 重建
   4），全部门禁过。自动搜索 33→35 kernel。
3. 接线：covers_sao_e2/e3.py + 两工具注册；测试 +5（含对角偏移断言）；
   DB 316→318 行；docs/82 +2 行。

## 0a. 本轮改动摘要（goal round 15：sao-e1 重建，自动搜索 33 kernel）

1. **sao-e1（垂直边偏移重建）**：B0 模式（svtbl 查表 + s16 饱和加 +
   qxtun 合并窄化）+ 垂直边分类——`signDown = sign(rec[x] -
   rec[x+stride])`、`edgeType = signDown + upBuff[x] + 2`（0..4）、
   5 项 eoTable 查表、`upBuff[x] = -signDown` 行间传递：
   - **门禁过（QEMU 2000 例 0 失配，vs processSaoCUE1_neon，含 4 行
     upBuff 终值比对），fused 213、ago_pred 95.7**
   - 接线：covers_sao_e1.py + 两工具注册；测试 +3（含 qxtun 断言）
2. **DB 315→316 行**；docs/82 +1 行（score=0.451）。sao 重建家族
   b0/e1 完成，e2/e3（对角，需双 upBuff）后续轮。

## 0a. 本轮改动摘要（goal round 14：sao-b0 重建 kernel 首个，自动搜索 32 kernel）

1. **sao-b0（band offset 重建）首个候选（best_sve2.cpp）**：从零移植
   processSaoCUB0_neon——每像素 `offset[pixel>>3]` 查 32 项表 + 饱和加
   回写。宽度原生（VL=256 32 像素块）：svtbl 查表（32 项表 = 1 个完整
   向量）+ s16 拓宽 + svqadd_s16 + svqxtun 饱和窄化：
   - **踩坑**：svqxtunt_s16 是带合并参数的谓词形式
     `(svuint8_t lo, svint16_t op)`（低半结果作 merge 源），不是
     1 参数形式；且 SVE2 XTN 把窄化结果放到偶数字节，需 svuzp1 压实
   - **门禁过（QEMU 2000 例 0 失配，vs processSaoCUB0_neon），
     fused 132、ago_pred 46.5**（permute 33.3% 来自 uzp1 压实）
   - 接线：covers_sao_b0.py + 两工具注册；测试 +3（含 svtbl 断言）
2. **DB 314→315 行**；docs/82 +1 行。sao 重建家族（b0/e1/e2/e3）从
   B0 起步，E1-E3 重建 = B0 模式 + 边分类（upBuff），后续轮按
   stats 家族同法补齐。

## 0a. 本轮改动摘要（goal round 13：sao-stats-e3 接入，sao stats 家族 5/5 完整）

1. **sao-stats-e3（45° 对角线）**：E3 是 sao stats 家族最后一个成员，
   此前无候选（saoCuStatsE3_sve 参考是行循环复杂内核，从零移植风险
   高的判断被推翻）：
   - **关键洞察**：E3 的 64 宽单行形式与 E1 **仅差一处**——sign_down
     的对比较从 `rec[x] vs rec[x+stride]`（垂直）改为
     `rec[x] vs rec[x+stride-1]`（45° 对角线）；upBuff 协议（negate
     on load、偏移 -1 存储）、5 类分类、svdot 统计、s_eoTable 归约
     全部相同；harness 只比较 stats/count（不比较 upBuff），行末
     边界存储可省
   - 复制 E1 block32 改一行偏移 → **门禁过（QEMU 2000 例 0 失配，
     vs saoCuStatsE3_neon），fused 102、ago_pred 106.1**
   - 接线：covers_sao_stats_e3.py + 两工具注册（make_emitter 踩坑：
     e2 分支是单行格式，首次 anchor 没匹配导致注册中断，补齐后
     通过）；测试 +3（含 stride-1 对角线断言）
2. **sao stats 家族 5/5 完整**（e0/e1/e2/e3/bo），全部门禁过、
   block32 模式全家族胜出（102 uop）。DB 313→314 行；docs/82 +1 行。

## 0a. 本轮改动摘要（goal round 12：score 公式补 cp_lat（发现模式深化））

1. **score 公式升级（docs/82 #5 第二步，docs/79 未探索轴之一）**：
   `score = permute_ratio + fused_uop/1000 + cp_lat/500`——cp_lat 项
   依据唯一有 950 仲裁实证的 dct16 案例（op895 优于 permute 更低但
   cp_lat 更高的 neon_bridge_fused；docs/79/83）。权重推导：
   - 约束区间 (0.001, 0.003)：dct16 需 w>0.001；sao-e0 的 block32
     胜出需 w<0.003；cost-coeff unroll 胜出需 w<0.0038
   - 取 w=0.002（/500）：**全部家族胜者与校准 predictor（ago_pred）
     一致**——dct16 C(op895)、sao-e0 E(block32)、cost-coeff B(unroll)、
     satd-8x16 A、sao-e1 C(block32) 均不变，且 dct16 的 score 排序
     从"几乎选错"修正为正确
   - 试错记录：w=0.01（/100）过大导致 sao-e0 E→C、cost-coeff A→B
     翻转（与 ago_pred 矛盾），已弃
   - 发现模式同公式（cp_lat 从 ⚠ 提示升级为计入排序）
2. 测试 6 个全过（无 score 断言）。

## 0a. 本轮改动摘要（goal round 11：Feedback Loop 落地）

1. **Feedback Loop（docs/83 §8 遗留 #3 完成，闭环"实测 → 代价表校准"）**：
   - `optimizer/ago/calibration.py`：load_calibration（缺失/坏 JSON 返回
     空，永不抛错）/ apply_calibration（按 kernel scale 乘 ago_pred）/
     fit_scales（每 kernel 中位 ratio，[0.5, 2.0] 越界视为 outlier）
   - `tools/feedback_calibrate.py --ingest <measurements.json>`：逐行
     发射 cover → 编译（-O3 armv8.2-a+sve2）→ extract_features →
     predict_from_features → scale = measured/predicted → 写
     build/calibration.json（gitignored）+ 报告（含 outlier 标注）
   - 集成：search_sve2_layouts --rank-by ago 自动加载校准（或
     $DYNOPT_CALIBRATION）并乘上 kernel scale；无校准文件时行为不变
   - 冒烟验证：合成 measurements（satd-16/psy-cost 各 2 cover）→
     校准文件生效（144.4→53.6 等），删除文件后排序恢复原值；
     predicted 与既有 ago_pred 完全一致（144.4/148.2/94.2/304.2）
   - 测试：test_calibration.py 8 个（中位/outlier/多 kernel/应用/
     加载容错）
2. **sao-stats-e3 与 sao 重建 kernel（e1-e3/b0）暂缓**：saoCuStatsE3_sve
   是行循环 + 逐边型统计的复杂内核（签名与 64 宽候选不同），从零移植
   风险高；留作后续轮。

## 0a. 本轮改动摘要（goal round 10：sao stats 家族全覆盖，自动搜索 30 kernel）

1. **sao-stats-bo/e1/e2 接入自动搜索**（sao stats 家族 4/4 全覆盖）：
   - **e1**：A=best_sve2（176 uop）、C=block32（102 uop）——排序
     C 104.2 < A 222.6（2.1x）；B=block16 源重复（DUP）
   - **e2**：A（178）、C（102）——排序 C 111.7 < A 222.7（2.0x）
   - **bo**：A=best_sve2 标量实现（0 vector uop，位运算统计）——
     门禁过，ago_pred 314.1
   - **block32 模式在整个 sao stats 家族一致胜出（e0 2.1x/e1 2.1x/
     e2 2.0x）**——自动搜索在 sao stats 家族三连"超过手写"
2. **DB 310→313 行**；docs/82 +3 行；测试 +5（TestCoversSaoStats）。
   covers_sao_stats_{bo,e1,e2}.py + 两工具注册。

## 0a. 本轮改动摘要（goal round 9：sao-stats-e0 接入，自动搜索 27 kernel）

1. **sao-stats-e0 接入自动搜索**（sao 家族首个，710 上已证实 -15% 的
   赢家收编）：5 候选全导出 manifest 符号，全过 QEMU 门禁（vs
   saoCuStatsE0_neon）：
   - A=best_ir 213 uop / B=best_ir_sve2 167 / C=best_sve2 165 /
     D=block16（=C 重复源，DUP）/ **E=block32_sve2 102 uop**
   - 排序（ago_pred，950 表）：**E 104.2 < C 216.6 < B 217.2 < A
     224.0**——自动搜索选出 32 行块变体（uop 最轻），**2.1x 超过
     手写 best_sve2**（另一例"自动搜索 > 手写"）
2. **DB 308→310 行**；docs/82 + sao-stats-e0 行（score=0.261）；
   测试 +3（TestCoversSaoE0）。covers_sao_e0.py（A-E）+ 两工具注册。

## 0a. 本轮改动摘要（goal round 8 续：dct8 接入 + _CXX 修复，自动搜索 26 kernel）

1. **dct8 接入自动搜索（dct 家族补齐）**：5 个候选静态测量
   （best_sve2 258/18.5%/59、proto_b 330/12.2%、proto_c 325/20%、
   proto_fused 327/13%、sve2_shared 81/52.2%）；仅 best_sve2 与
   sve2_shared 导出 manifest 符号 dynopt_dct8_sve2_shared。
   - **sve2_shared VERIFY FAIL（2000 例 127983 失配）**——非 bit-exact，
     不可用；covers_dct8 收窄为 A（B 及 proto 系列 scan-only）
   - cover-A 门禁过（fused 289@clang、ago_pred 278.1，参考 dct8_sve
     是 void 写 dst 型，共享 verify harness 比对输出）
2. **工具修复（_CXX 含空格崩溃）**：dct8 特殊用例把 _CXX 设为
   `"clang --target=aarch64-linux-gnu"`（docs/30 §1.7），rank-by ago
   的 `_sp.run([args.cxx or _CXX, ...])` 把它当单个可执行文件名 →
   FileNotFoundError；改 `.split()` 展开参数。
3. **DB 307→308 行**；docs/82 + dct8 行（score=0.474）；测试 +3
   （TestCoversDct8，断言 covers 收窄为 A）。

## 0a. 本轮改动摘要（goal round 8：satd-16x4/32x8，自动搜索 25 kernel）

1. **satd-16x4 / satd-32x8 cadd 候选**（cadd 模式收尾剩余 16/32 宽形状）：
   - satd-16x4：g<1（fused 36、ago_pred 30.5）
   - satd-32x8：2 halves × g<2（fused 138、ago_pred 156.2）
   - 门禁：**两 shape 均 QEMU vq=2 2000 例 0 失配**（vs
     satd8_sve2<16,4>/<32,8>）
   - 接线：covers_satd16x4/32x8 + 两工具注册；TestLargeSatdCovers
     SHAPES 扩至 11 形状
2. **DB 305→307 行**；docs/82 +2 行。satd 家族覆盖 13 形状（16/32/64
   宽系全部；剩余 8 宽（8x4/8x32）与 24/48 宽（1.5/3 向量）为边缘
   形状，cadd 模板不直接适用）。

## 0a. 本轮改动摘要（goal round 7：sa8d 大形状 32x32/64x64，自动搜索 23 kernel）

1. **sa8d-32x32/64x64 宽度原生 cadd（best_wide_cadd.cpp，新建 manifest）**：
   x265 的 BLOCK_32x32/64x64 sa8d 走 `sa8d16x32_sve2<W,H>` 参考
   （16x32 strip 循环）。宽度原生扩展（2/4 半向量 × 4/8 个 8 行 pass，
   cadd<90> 3 级蝴蝶 + kHADPermuteTbl）：
   - 门禁（QEMU vq=2 2000 例）：**32x32 fused 195 / ago_pred 272.6；
     64x64 fused 404 / ago_pred 617.5**——全过（0 失配）
   - 踩坑记录（重要，3 连）：
     a) **u16 total 溢出**：32x32 sa8d 最大 ~261k ≫ 65535；改 u32 标量
        累加（sa8d16 的 65280 也勉强临界，一并修）
     b) **harness 缓冲区 stride 上限**：gen_verify 的 buf 是 rows*64+64，
        stride 128 会让参考读越界 → 误失配；strides 改 [33,48,64]
     c) **舍入粒度**（最终根因）：参考 `pixel_sa8d_16x32` 的
        `vpaddq_u64(sum0,sum1)` 按 **16x16 组**分别 (sum+1)>>1 再求和
        （不是整 strip 一次舍入，也不是 16x32 strip）——32x32 共 4 组、
        64x64 共 16 组；修正后 first-diff 从差 1 → 0 失配
   - 期间 verify_cache 因 ckey 不含 manifest strides 而反复命中旧结果
     （1277 失配不变），需显式清 outdir 缓存
2. **接线**：新建 kernels/sa8d-32x32、sa8d-64x64（manifest + trace
   driver + 候选）+ covers_sa8d32x32/64x64；两工具注册；测试 +2
   （TestSa8dLargeCovers，断言 per-group rounding）。DB 303→305 行；
   docs/82 + 2 行。

## 0a. 本轮改动摘要（goal round 6：sa8d16 宽度原生 cadd，自动搜索 21 kernel）

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
