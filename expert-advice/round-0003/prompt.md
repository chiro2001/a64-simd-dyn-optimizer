# Round 0003: SVE2 双 tile 打包的审阅与下一步方向

你是 AArch64/SVE2/编译器优化审阅者。请只读审阅，不要修改仓库；最终建议
写入回复。

## 背景

项目：把 x265 SA8D 从 NEON 迁移/优化到 SVE2 VL=256（真实硬件未到位，
当前用 QEMU `sve-max-vq=2/4` 做功能验证，N1 无 SVE）。同一份 8x8
MachineIR 已能自动生成两种 SVE2 候选：

- 单 tile（8 个活跃 s16 lane）：功能正确。
- 双 tile pack（16 个活跃 s16 lane）：把两个水平相邻 8x8 tile 装进一个
  向量（lane 0-7 = tile A，lane 8-15 = tile B），同一份 shuffle mask 在
  两个半区独立生效，归约按半向量分别 `(+1)>>1` 再求和，保持逐 tile
  rounding bit-exact。

本轮结果（`experiments/m8-sve-pack/`）：

- 正确性：QEMU VL=256 与 VL=512 各 10 万例差分 0 mismatch（单 tile + 双
  tile）。
- 静态指令（-O2 编译产物，aarch64 objdump 计数）：
  - 单 tile：total=309，SIMD=202（1 × 8x8）
  - 双 tile：total=317，SIMD=204（2 × 8x8）
  - 每 tile 折算：total 309 → 158.5（-49%），SIMD 202 → 102（-49%）
- 成本大头：24 条 `svtbl2`、48 条 `ld1h`（每 shuffle 重新装载 16 项常量
  索引）、20 条 `mad`（索引 = lo + b*svcntw()*2）。

## 请回答

1. 对“双 tile 打包每 tile 静态指令减半”这一结论的反驳或确认；静态指令数
   作为真实硬件不可用时的主代理指标是否合理，还缺什么证据。
2. 最可能被遗漏的 correctness/ABI/VL 风险：例如相邻 8x8 的 load 对齐与
   over-read 合同、`svtbl2` 索引数组在 VL=512 下 `svld1_u16(svptrue_b16())`
   读取 16 元素数组越界、`svwhilelt` 谓词语义、逐 tile rounding、以及
   双 tile 返回两结果之和的调用约定。
3. 按信息增益排序的 1–3 个下一轮实验，目标是在 SVE2 VL=256 上真正降低
   每 tile 动态成本，而不是只降静态计数。重点评估：
   - 把 24 个 `svtbl2` 的索引装载替换为 SVE2 `zip1/zip2/trn1/trn2/
     uzp1/uzp2`（128-bit 段级）或一次性 hoist 常量索引；
   - 4-tile 32-lane 打包用满 VL=256（当前只用了 16/32 lane）；
   - 从 MachineIR 层面做 shuffle 布局融合，而不是在代码生成层逐条翻译。
4. 连续几轮只有静态收益、无实机可测时，应转向 DCT/interp8 还是继续 SVE
   工具建设；停止门槛建议。
5. 明确区分：事实 / 推断 / 需实验验证。

## 上下文文件（路径已核实）

- `experiments/m8-sve-pack/iteration.md`、`manifest.yaml`
- `experiments/m8-sve-pack/static/sve1-insns.txt`、`sve2-insns.txt`
- `experiments/m8-sve-pack/correctness/vl256-qemu-100k.log`
- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`（单 tile）
- `generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp`（双 tile）
- `optimizer/ir/codegen.py`（`emit_sve_intrinsics`）
- `kernels/sa8d/gen_roundtrip.py`、`sve_verify.cpp`
- `scripts/build-sve-sa8d.sh`、`tools/count_asm_insns.py`
- `experiments/m7-isa-coverage/coverage-report.md`（SVE2/SVE2p1-p3 指令缺口）
- `experiments/m6-sve/iteration.md`（M6 功能基线）
- `expert-advice/round-0002/response.md`、`decision.md`
- `docs/05-roadmap.md`、`docs/06-agent-iteration-protocol.md`
