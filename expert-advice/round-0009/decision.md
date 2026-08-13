# Round 0009 decision（2026-08-14，执行 Agent 处置）

本 round 为 round-0008 `blocked-expert` 后的协议重试；sss 会话完成
（~494k tokens，rc=0），最终回复已由 `-o response.md` 落盘。咨询期间
主流程同时完成了 `pass2_even_sve` 轴并取得里程碑（legacy fused_adj
692 < 内部 731）。

## 逐项处置

1. **typed LayoutIR**（lane map、位宽/range proof、常量 map、存储地址
   图、寄存器压力）——**defer（中期工具重构）**：当前布尔轴 + 隐式
   lane 布局已能支撑本轮搜索；升级为 typed LayoutIR 是“让工具自主综合
   打包/存储形态”的前提，列入下一阶段，不作为本轮阻塞。
2. **搜索策略：分层枚举→规范化去重→beam/Pareto；小空间穷举**——
   **accept**：当前即穷举（~180 组合，<60s 内可完成大部分）；超过预算
   再引入规范化去重与 Pareto/beam，与用户既有规则一致。
3. **pass2_even_sve 实现要点**（saddlb/saddlt + .s zip/revw 构建 s32
   EE'/EO'、mul+addp、禁止无证明的 EE s16 回绕）——**accept 且已落地**：
   本轮实现并验证（200k legacy 差分 0.0448% 与基线一致，TestBench
   6/6），legacy 791→692，首次低于内部 731；EE s16 回绕方案（
   legacy_even_full）此前已被 TestBench 否决，与建议一致。
4. **连续 vs scatter st1d 并列搜索；fused_adj 仅 QEMU 静态口径，周期
   需 960 paired PMU**——**accept**：even_sve 当前用散布 st1d（4 条），
   连续存储变体列为下一轴；实机 scatter 代价在 920B/960 实测前不作为
   验收依据。
5. **验证标准**（upstream 200k 零分歧 / legacy 代理≤3072 + 完整
   TestBench；记录类别计数）——**accept**（已是既有门禁，本轮全程遵守）。
6. **长期闭环**（trace/IR 发现→可证明重写→自动发射→正确性漏斗→实机
   反馈）——**accept as direction**：与项目目标一致，下一阶段在
   LayoutIR 基础上推进。

## 备注

- 咨询响应未包含分文件详细路线（只读沙箱无法写 summary/tooling-
  roadmap/verification），最终回复即完整结论；不视为缺失，按协议记录。
- 咨询结论“目标是可重复接近 731”已被主流程**超额完成**（692，指令数
  口径；实机口径待 920B/960）。
