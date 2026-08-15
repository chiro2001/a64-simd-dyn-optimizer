# Round 0020 decision

| 建议 | 处置 | 理由 | 对应下一轮 |
| --- | --- | --- | --- |
| NEON-only 候选轴 | accept | 920B 是 NEON 4x128 主战场，现有 SVE1 候选全部 ≤NEON；把 NEON-only 作为一等搜索轴 | sa8d16/dct32/costCoeffNxN |
| 真机 CNTVCT 进搜索排序 | accept | MCA 用 Neoverse-V2，无法代表 920B 混合 SVE/NEON；已有 microbench 可复用 | search_sve2_layouts 增加 real-bench hook |
| direct-asm pressure-budget 后端 | defer | 工作量大；先确认 NEON-only/真机排序无收益后再投入 | 若前两项无收益 |
| 修改编码流程 | reject | 用户明确禁止 | - |

Response 因成本控制被截断，结论来自会话输出；完整专家审阅可在下一批次
重新发起，并收紧 prompt 范围。
