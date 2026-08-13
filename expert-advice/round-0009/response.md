只读分析已完成：已核对 `context.md`、docs/18、iteration、工具、manifest 与验证合同。  
当前已工具化轴：`pass1_even_factor`、`store_merge16`、`pass1/pass2_pack_zip`；upstream/legacy 最优为 887/791，内部参考 731。  
仍需结构化的方向：`pass2_even_sve`、8 行分组、scatter/连续存储、movprfx 累加、常量/置换自动综合。  
建议把布尔轴升级为带 lane map、位宽/range proof、常量 map、存储地址图和寄存器压力的 typed LayoutIR。  
搜索采用分层枚举→规范化去重→beam/Pareto；小空间穷举，超过预算再启发式剪枝。  
`pass2_even_sve` 应用 `saddlb/saddlt` + `.s` zip/revw 构建 s32 EE'/EO'，`mul+addp` 处理偶数 k，禁止无证明的 EE s16 回绕。  
连续与 scatter `st1d` 必须并列搜索；`fused_adj` 只作 QEMU 静态口径，周期收益需 960 paired PMU 实测。  
每个候选须过 upstream 200k 零分歧或 legacy 代理≤3072、完整 TestBench，并记录类别计数与失败原因。  
长期闭环：trace/IR 发现→可证明重写→自动发射→正确性漏斗→实机反馈，目标是可重复接近 731。  
由于当前 sandbox 强制 `read-only`，`summary.md`、`tooling-roadmap.md`、`verification.md` 无法写入；本轮未修改仓库或运行构建/搜索。