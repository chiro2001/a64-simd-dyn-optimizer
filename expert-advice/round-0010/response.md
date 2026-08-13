# round-0010 最终答复（GPT-5.6-sol，只读会话；三份建议文档因 read-only 未能落盘，本文件由主进程补录最终消息）

- 当前沙箱强制只读，`apply_patch` 被拒；3 个指定文档未能落盘，仓库未改动。
- 【事实】16x16 为 fused_uop 373→189、raw vector 373→193，差分与 lite PASS。
- 【反驳】189 > ⌊373/2⌋=186，只能称“接近减半”；实机 cycles 未测，不能称性能真减半。
- 【反驳】8x8 的 79 确有打包/重排成本，但缺少逐轴消融与下界证明，不能断言全是固有布局税。
- 【风险】当前 guard 指向旧符号；fixed-VL 候选必须仅在 `svcntb()==32` 注册，并补 worker-VL、ABI、双侧 guard、逐节点范围证明。
- 【事实/推断】现有 16x32 探针 4405/20000 分歧、首差 1，表明跨 16x16 合并舍入不恒等。
- 【实验顺序】16x32 `per_16x16` 归约屏障 → 16x16 压至 ≤186（目标 ≤180）→ 8x8 消融至 ≤72 后止损。
- 【验证】finalist 应过 200k 零分歧、多 seed lite、当前符号 guard、VL=128/512 零调用及同机 paired cycles。
- 【工具】保留 fused_uop 半数硬门，增加关键路径、端口、访存、spill 的 Pareto；代理校准前不输出单值“预测 cycles”。
- 【ISA/DCT】优先补 p1 双源 rounding-narrow/ADDQV 子集并探针 p3 ADDQP；SABAL/UABAL、p2/bitperm 暂缓；DCT“60 gap”已是过时口径。
