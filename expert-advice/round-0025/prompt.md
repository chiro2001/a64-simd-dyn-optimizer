# Round 0025: 读取交接文档，让 top model 给下一步方向

你是一名资深性能优化架构师。请完整阅读以下文档（先读
`docs/59-handoff-20260816.md`，这是当前状态唯一权威交接文档；然后读
`docs/63-950-920b-intranet-quicktest-20260816.md`、
`docs/64-sve128-neon-migration-plan-20260816.md`、
`docs/65-ir-granularity-audit-20260816.md`、
`docs/66-multi-isa-kernels-survey-20260816.md`、
`reports/intranet-quicktest-920b-950-20260816.md`，需要时再看
`docs/59-history-20260816.md`）。

项目背景（文档内均有）：AGO 框架通过算子级 dispatch 替换/注入提升 x265
E2E；机器 N1(纯NEON)/920B(SVE1 VL256)/710(SVE2 VL128)/950(SVE2
2x256)；两个 goal 已 complete（dct16/32 迁移+IR 宽度参数化；多 ISA
家族推广 satd/sa8d16/sao/sad/mc/ssd/pixel_var/interp8）。实测：
best9 E2E -1.5~-2.1%；7-kernel IR-all 三机基本中性；920B 快测
scanPosLast ~1.5x、idct32 +17%、remain DFA 分布敏感、interp8 path-B
停用；950 上 dct32 op4032 +72.7% vs SVE 但非 bit-exact 需策略放行、
dct16 op895 +29% vs SVE 但仍慢于 NEON 14%。

任务：基于这些文档，给出下一步方向。要求：
1. 首选方向及理由；
2. 完整优先级排序（可执行可验证）；
3. 关键决策点/风险（如 op4032 是否放行、kernel 提升与 E2E 收益映射、
   应暂缓/放弃的候选）；
4. 数据缺口与补齐方法；
5. 最终给出可直接执行的下一步行动清单。

全程只读分析，不要修改任何文件。用中文回答，结构清晰、不要冗长，
控制在 600-900 字。
