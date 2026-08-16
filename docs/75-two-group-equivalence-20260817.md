# 双组 lowering 组合等价：声明、证书与下一步（2026-08-17）

对应 round-0028 数学建议第 1 条（最高价值声明）：

> 在 `svcntb()==32` 与契约（alias、stride、tail、舍入）前提下，
> dct16/32 的 16-lane 程序等价于两个 fused8 DAG：store 的逻辑 lane、
> 地址足迹与边界行为相同；guard 失败安全回退。

## 1. 等价声明（精确形式）

令 fused8 程序 `P8(x)`（8-lane，VL=128 语义）与 16-lane 程序
`P16(x)`（VL=256）。P16 由 P8 经“打包双组”构造（docs/72）：
一个 16-lane 寄存器携带两个独立 8-lane 组（lanes 0-7 / 8-15）。
声明：

1. **算子层**（本轮已证）：对每个 dual 原语 `f16` 存在 8-lane 原语
   `f8`，使得 `f16(pack(a,b)) == pack(f8(a), f8(b))`（逐 lane 相等）；
2. **组合层**（下一步）：沿 op_pass_4/op_pass_11 的 op 序列归纳，
   每个 dual 步骤都保持“两个组各自等价于对应 fused8 子程序”的不变量；
3. **足迹层**（下一步）：dual store 写出的逻辑 lane 与两次 fused8
   store 相同（地址 = dst + 16k + i，4-lane 每行），尾部行为一致；
4. **guard**：`svcntb()!=32` 时 P16 直接返回（不写内存）——不产生
   错误写入；fused8 路径在 VL=128 机器独立可跑，声明不含跨 VL 等价。

## 2. 已落地证书：tools/dual_lane_cert.py（2026-08-17）

- 方法：对 pure_sve_helpers 的 16-lane dual 算子与 8-lane 参考算子
  在随机数据（200 例 × 8 lane，值域覆盖正负）上逐 lane 对拍，
  QEMU VL=256（sve-max-vq=2）；
- 已验算子（7/7 PASS）：
  | dual 算子 | 8-lane 参考 |
  | --- | --- |
  | psv16_dual_load8_safe | 两次 psv_load8 |
  | psv16_dual_rev16 | 两次 psv_rev16 |
  | psv16_dual_saddl | 两次 psv_saddl_s16（lo4 宽化） |
  | psv16_dual_vmovn_s32 | 两次 psv_vmovn_s32 |
  | psv16_dual_rev32_s32 | 两次组内 4-lane rev |
  | psv16_dual_vmovn_s64 | 两次组内 s64→s32 截断窄化 |
  | psv16_dual_rshrn_s32 | 两次舍入右移窄化（通用 S） |
- 单测：tools/test_dual_lane_cert.py（回归套件内）。

## 3. 下一步（组合/足迹层）

1. 把 op_pass_4/op_pass_11 的 op 序列显式化为可遍历结构（从发射器
   源码提取 op 表），逐 op 应用 §1-1 的算子证书做归纳检查；
2. 校验 dual store 足迹：`psv16_dual_store4_s16` / `psv_store4_s16`
   的地址与逻辑 lane 映射（两组的 0-3 lane → pa/pb）；
3. 对 dct32 双组发射器重复算子证书（复用 harness，只换 helper）；
4. 若需更强保证：对舍入原语（rshrn）用 SMT 位向量证
   `(x + 2^(S-1)) >> S` 与 vqrshrun 语义一致（标量级），再把算子
   证书嵌入归纳证明；SMT 超预算则标 `test-obligation`。

## 4. 验收

- 算子层：`tools/dual_lane_cert.py` CERT PASS（已达成）；
- 组合层：op 序列归纳检查 0 反例 + 20k QEMU 差分（已有门禁复用）；
- 完整声明仅在组合/足迹层完成后可宣称（docs/72 的跨 VQ 差分仍为
  必要但非充分证据）。
