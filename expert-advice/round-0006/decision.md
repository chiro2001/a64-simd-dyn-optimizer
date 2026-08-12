# Round 0006 decision

| 建议 | 处置 | 证据/理由 | 对应下一轮 |
| --- | --- | --- | --- |
| 归因 a（SVE 位宽容量）措辞过强，改为“未转化收益，容量相等是主要解释之一” | accept | M11 四组 CNTVCT 均 <1；无硬件 PMU，不能反推每指令周期 | 文档修订已随 M14 归档 |
| 归因 b：上游 dct8 为 16-bit 中间减法溢出 bug（非 oracle 错误） | accept（已由 M14 实验定案） | pass2 O=sub<s16> 回绕；-15054-18234=-33288；`widen_dct8_pass2_odd` 后 cand==C 20 万例 0 mismatch | M14 |
| 修正“vrshrn 饱和窄化”错误注释（vrshrn 非饱和，vqrshrn 才是） | accept | ARM ISA 语义 | 本轮修正 |
| 修正“PR_SVE_SET_VL kernel=bits/qemu=bytes”错误注释（标准单位就是字节） | accept | 手册与两端实测一致 16→16B | 本轮修正 |
| 微基准：移出 64 项 checksum、修正二维 origin、throughput 四路独立 dst、latency 预筛 C==NEON 输入、归档 impl_a/b + CNTFRQ | accept | 当前 checksum 参与依赖链、2D origin 有 UB | 下一轮基准重建 |
| 三个手工原型：(a) pass2 仅 O widening；(b) 四列并行 s32 mul/mla 替代 smull+addp；(c) pass1 寄存器常驻 + 显式 8x8 transpose | accept（a 已完成；b/c 排队） | (a)=M14；N1 C 已比 NEON 快 1.24×、距 1.30× 仅 ~5%，920B 还需 +25% | M15/M16 |
| 止损点：三原型后若无候选中心 >1.05 且 CI 下界 >1.00，停止“上游 NEON 局部 peephole”，转 range-aware fixed-point IR | accept | 避免无方向迭代 | M16 判定 |
| m12 manifest/iteration 仍写 c_eq_neon/cand_eq_neon、证据待跑，与 C-oracle 合同冲突 | accept | 合同已改 C 参考 | 本轮修正 |
| sve_dispatch 的 registered 缓存跨线程 stale、生产路径应先查 HWCAP_SVE 与 prctl 返回值 | defer | 尚未进 x265 注册路径；进注入阶段时实施 | P7'/注入 |
