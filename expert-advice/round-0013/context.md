# round-0013 上下文（批：DCT32 P0/P1 工具化 + interp8 门禁 + canary）

自 round-0012 后完成的主要阶段（均已提交并推送 github/origin）：

1. `b66ec56` DCT32 P0 轴：`pass1_k2_slice` / `odd_lowering` /
   `narrow_batch` 独立可搜索，消融 3962/4252/4266/4488/5494/5875；
2. `82c477b` `constant_layout` 轴：derived 3962 vs canonical 4189；
3. `fe3285c` SVE2p3 `sdot.h` canary（汇编接受，QEMU SIGILL → exit 3）；
4. `706111e`/`018c347` P1 typed LayoutIR + 5 个原子 rewrite，
   `rediscover_v31(spec)` 精确复现 v3.1 plan；
5. `7237ae2` P1 增量 3-4：`emit_grouped` 按机制块组装 + `search_plans.py`
   rewrite 驱动搜索（18 计划实测重发现 best 3962）；
6. `48284ea` P2：manifest `layout_prune` 通用轴依赖替代硬编码
   （DCT16 520/520 等价，best 704 不变）；
7. `b1b8e0a` P1 增量 5：`layout_verify.check_source` 静态一致性证明，
   search_plans 编译前逐 plan 执行。

## 关键事实（仓库内可查证）

- DCT32 best = 3962 fused_uop（上游 12710 的 0.312x，HALVED），
  upstream-exact 20k/200k 差分 0、零 scatter、lite 门禁 PASS；
  DCT16 legacy 704、sa8d16 189、interp8 127。
- rewrite 驱动搜索：`tools/search_plans.py`（18 计划 → 12 唯一源码 →
  12 全测；分层：语义/canonical/source-proof/测量）。
- `optimizer/ir/layout_ir.py`：Plan/Target/ValueLayout/RoundBarrier/
  ConstantMap/MemoryMap/Tile，`canonical_key`（有序无关 sha256）、
  `verify_layout`、`lower`（经 emit_grouped，无 layout 预设）。
- `optimizer/ir/rewrites_dct32.py`：assign_output_lanes（odd + k2 仅
  pass1）、segment_dot、batch_round_narrow_store、derive_constant_map、
  k2_pass1_slice；每个返回 ProofCertificate。
- `optimizer/analysis/layout_verify.py`：pass32_impl 逐指令族计数比对
  （svdot/svaddv/st1/mul/标量 dst/const tbl）+ 零 scatter 硬门。
- 剩余差距：lower 仍由 C++ 块组装（非逐 op IR）；canonical_key 尚未在
  主搜索驱动 codegen 前使用；row_group=8 / interpass_layout 未实现
  （寄存器压力需 accumulator 调度）；960 未流片，SVE2p3 无法执行验证。

## 请重点阅读

- docs/20-dct32-optimization-assessment.md（P0 消融 + P1/P2 增量）
- docs/22-interp8-assessment.md（lite 门禁、store 修复、canary）
- docs/16-tool-inventory.md（工具清单）
- optimizer/ir/layout_ir.py、optimizer/ir/rewrites_dct32.py、
  optimizer/analysis/layout_verify.py、tools/search_plans.py、
  tools/emit_dct32_sve2_shared.py、tools/search_sve2_layouts.py
- kernels/dct32/manifest.yaml、kernels/dct16/manifest.yaml

## 启动命令（本 round 实际使用）

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s workspace-write \
  -C "$PWD" \
  exec -o expert-advice/round-0013/response.md \
  - < expert-advice/round-0013/prompt.md
```

后台运行，主模型继续前台工作；落盘后写 `decision.md`。
