# Round 0029：AGO 下一步建议

## 证据与判断

**已有文件支持的事实。** 冻结集在 N1/710/920B 有 2.0%–2.7% bit-exact E2E。950 dual-SVE16 dct16/32 双编译器、六 seed 正确，但比 SVE/NEON 慢 1.5–3.5 倍，尽管 fused_uop 少 21%–57%；DB 另有 pure-SVE/i8mm/sao 同类反例，op-backend 融合形态则实机获益。ranker 只用 `fused_uop/mca_total`；模板、B&B、等价证书已闭环。

**推断。** 瓶颈已从“能否生成”转为“能否保留生产调度、避免 TBL/打包关键链，并在目标机上识别它”。

**以下均为需要实验验证的建议。**

## 1. 950 E2E 后的 2–4 周方向

先完成 950 冻结集 30f/100f、入库和 M4 声明；op4032 策略另案处理。之后排序如下：

1. **P1：通用 op-fusion/region-schedule 后端（50%）。** 将 dct 的 row-group、pack/系数复用、dot→归约→窄化→store 提升为契约模板；允许 NEON/SVE 混合，上游基线始终可选。先复现 op895/opbase，再在 interp8-hpp 复现真实“四行批处理+perm 复用”。**退出：**两个家族、各 ≤32 个候选后，仍无 bit-exact 候选相对最快可发布基线的 ratio CI 下界 >1.05，或 Amdahl 投影均 <0.3pp，即冻结扩展。
2. **P2：每机实测代理+主动测量（30%）。** 特征加入 VL/ISA、实测关键路径/吞吐、关键链 TBL 深度、load-use、peak-live/spill；代理只作 Pareto 粗筛并可弃权。**退出：**至少 24 个、三家族同 kernel 成对样本后，留一族 Spearman <0.70、top-3 召回 <80%，或仍误选 sve16，则取消精排，只做静态去劣后实测前沿。
3. **P3：一个非 dct 闭环（20%）。** 首选 interp8-hpp，i8mm 失败已暴露批处理和窗口复用缺失；备选 satd/sa8d。验收：两批 bit-exact、kernel CI 下界 >1、E2E 增量 ≥0.2pp 且 CI 不跨零。失败即归档。

形式化证明只随新 fusion rewrite 补局部等价、舍入和足迹义务；SVE2p3 扩面、全 VL 证明后置。

## 2. 三个高信息增益改动

1. **前移真实调度实机门。** 数值门后，立即以同编译器、ABI/dispatch、真实输入分布，对最快可发布实现做交错 direct-call/replay。晋级门为 ratio bootstrap95 下界 ≥1.10 且 Amdahl 投影 ≥0.3pp。最小反证集：sve16、pure-SVE satd、i8mm、sao 作负控，明确比较口径的 op-backend 作正控；任一负控被自动放行即证伪该门。
2. **显式测 lane 宽度与关键链。** 在 950 对 TBL/TBL2、ZIP/UZP、UNPK、SDOT、窄化、LD/ST 分别跑串行依赖链和 8 路独立链，覆盖 VL128/256；再从 final object 计算关键路径上的 permute 数。用 dct16/32 各后端和 8–12 个 satd/interp 变体留出验证；达到 P2 指标才参与排序，否则仅作诊断。
3. **融合优先搜索。** 轴改为跨行 batch、预排系数、窗口/pack 复用、shuffle 消除、归约树、窄化/store 融合；lane 宽度仅是一轴。dct16 与 interp8-hpp 各生成 ≤32 个候选，要求 0 失配、0 非预期 spill，且至少一个非 dct kernel 的 CI 下界 >1.05；否则证伪模板迁移性。

## 3. 通用性最高杠杆

**结论：通用 fused-region 后端 + 每机 profile/dispatch。** 17 个 dual-SVE16 候选说明 NEON→SVE256 功能生成基本解决，950 又证明它不等于性能通用。应让同一 region 保留 NEON/SVE/混合 schedule，由各机实测选择，并把 dct 复用结构迁到 FIR/filter 或 butterfly/reduction。自动多 ISA 是后端产物，不是独立 KPI；新家族仅在 Amdahl 上限 ≥0.3pp 且现有模板无法表达时接入。
