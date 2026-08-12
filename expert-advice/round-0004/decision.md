# Round 0004 decision

顶级模型回复见 `response.md`。逐项处置如下：

| 建议 | 处置 | 证据/理由 | 对应动作 |
| --- | --- | --- | --- |
| typed TRN 静态下降成立，但 M9 保持 `blocked-environment`，不得宣称生产性能 | accept | 干净消融：single 290→117、x2 297→125；索引机制全部消失 | M9 状态已为 `blocked-environment` |
| raw helper 实际返回 half-R8 和，两次 wave 后 `(H_top+H_bottom+1)>>1` 精确等于 16x16 合同 | accept（下一步实现） | R8 必为偶数（Hadamard 系数奇偶性），除 2 是精确缩放 | M10：两次 wave 构造合法 16x16 |
| 验证器应固化 parity/scale lemma，不能只靠“奇数报错” | accept（下一步） | 当前只查两 tile 之和偶数，两个奇数也会通过 | M10：逐 tile R8 偶数断言 + lemma 写入文档 |
| `raw=True` 跳过任意 pair 尾部太宽，应精确匹配 `+1,>>1` 或把 scale 放进 IR | accept（下一步加固） | 未来 MachineIR 尾部变化可能静默误编译 | M10：raw 模式加尾部形状断言 |
| VL 合同二选一：固定 `svcntb()==32` 或 VLA-minimum `>=32`；日志记录实际 VL | accept（下一步） | 当前注释与 manifest 不一致；vq=4 是 512-bit 不是“≤256” | M10：verify 打印 `svcntb()`；文档统一 |
| 两次 wave 的调用形状与 footprint 必须正确（底部不加列偏移） | accept（下一步） | 正确形状：顶部 raw(a)、底部 raw(a+8*sa) | M10 16x16 oracle 按此实现 |
| guard-page/恰好边界/ASan/UBSan；负 stride 需先明确合同 | defer（M10 部分执行） | 先做正 stride guard + sanitizer；负 stride 需要地址计算改造，另行评估 | M10 guard 二进制 |
| 一条 UADDV 是 `low+(full-low)==full` 的代数化简，非神奇优化；跨编译器无形状保证 | accept | GCC 16.1/Clang 22 O1-O3 均单 UADDV；正确性不依赖它 | 记录观察；若需性能门禁，raw 直接表达 full reduction |
| 生产最终 symbol、QEMU guest 动态指令、spill/live Z/P、V0 身份归档 | defer（M10 部分执行） | 先跑通合法 16x16 门禁；身份/object hash 本轮起归档 | M10 identity.txt |
| 随后冻结 M6，转 N1 可测 family（未 profile 默认 DCT8） | accept-as-procedure | 真实硬件到位前不再枚举 SVE 静态赢家 | M10 完成后执行 |
