# Round 0003 decision

顶级模型回复见 `response.md`。逐项处置如下：

| 建议 | 处置 | 证据/理由 | 对应动作 |
| --- | --- | --- | --- |
| “每 tile 静态指令减半”应表述为按等工作量归一化，非函数体尺寸减半 | accept | x2 函数体 297 条 > x1 的 290 条；归一化后 290→148.5（-48.8%）、224→112.5（-49.8%） | `experiments/m8-sve-pack/iteration.md` 已改写 |
| M8 不宜标 `accepted`，应为功能证明 / `blocked-environment` | accept | 协议 `accepted` 需满足全部门禁；实机缺位时只能功能部分完成 | manifest/iteration state 已改 `blocked-environment` |
| VL=512 常量索引 `svld1_u16(svptrue_b16())` 越界 | accept（本轮已修） | codegen 改为 `svld1_u16(pg, ...)`，索引运算也用 `pg`；修复后 VL=512 10 万例 0 mismatch，越界不再存在 | `optimizer/ir/codegen.py`；生成文件已更新 |
| VL<256 会静默只算 tile A，x2 合同必须写明 VL≥256 | accept | `svwhilelt_b16(0,16)` 在 VL=128 只激活 8 lane；docstring 与 iteration 已写明 dispatch 禁止 VL<256 | codegen docstring + iteration 3.1 |
| x2 返回两个已舍入 8x8 之和，不能直接接入 16x16；应改为未舍入 half-R8 raw helper | accept（下一步实现） | x265 16x16 = 四个 raw R8 统一舍入一次；当前 x2 只证明打包机制 | M9 实验：`--pack x2 --raw` 返回两块 half-R8 之和 |
| 首选实验：按原元素类型直接生成 `svtrn1/2_u16/u32/u64`（24 个 shuffle 恰为三种粒度 TRN1/TRN2） | accept（下一轮主实验） | MachineIR 六种 mask 各重复四次；直接 TRN 可删 48 `ld1h` + 24 `mad` 与常量地址计算 | M9 主假设 |
| 常量索引 hoist 作为对照 | accept-as-control | 与 typed TRN 同轮比较，判断编译器/CSE 与寄存器压力 | M9 对照臂 B |
| 用两次 x2 wave 构造合法 16x16 raw helper | accept（typed TRN 后） | VL=256 只有 16 个 s16 lane，四 tile 单 Z 需 VL=512；“4-tile 32-lane 用满 VL=256” 不成立（已纠正 prompt 中的错误） | M9/M10 |
| MachineIR 区域级布局融合 | defer | 在 typed TRN 之后仍有明显 permute 成本时再做 | M10+ |
| 补证据：生产 flags 最终 linked symbol、spill/峰值 live Z/P、QEMU guest 动态指令、guard-page/ASan、实际 VL 日志 | defer（零号门禁） | 不影响本轮功能结论；作为 SVE foundation 轮门禁 | M9 零号门禁 |
| 无实机阶段完成目标无关门禁后停止新增 SVE 静态候选；冻结 M6 blocked；按 profile 转向 DCT8/interp8 | accept-as-procedure | 路线图 D5/D6 要求；默认倾向 DCT8（复用 transpose/layout/rounding 工具） | M9 完成后执行 |
