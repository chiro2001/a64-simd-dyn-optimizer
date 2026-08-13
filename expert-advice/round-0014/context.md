# round-0014 context：搜索/验证效率优化

## 当前状态（2026-08-13 深夜，latest commits）

- `git log --oneline -8`：
  - efcd246 DCT32 k0_even_sve atomic rewrite
  - 35bcf82 DCT32 k0_even_sve mechanism（6464 → 5814）
  - 8ded058 handoff 更新
  - 26aabfb acc_split + 差距分析
  - 7cf0fc4 / 5c03e03 DCT16 rewrite 链
- DCT32 best 5814（MCA 411 cyc / 2231 uops）；DCT16 best 705。

## 关键文件

- 搜索驱动：
  - `tools/search_sve2_layouts.py`（布局搜索：编译 → 20k 差分 →
    trace → 排名；verify_cache.json 按 contract+src_hash 缓存；
    dct32 op backend 跳过 rw 轴）
  - `tools/search_rewrite_sequences.py`（rewrite 序列搜索，5^4/4^4
    枚举，逐源 build/verify/trace/MCA-top10；results.json 按 seq
    key 缓存）
  - `tools/parse_qemu_trace.py`（trace → counts）
  - `tools/kernel_manifest.py`（manifest 解析 + layout_plans）
  - `tools/gen_verify.py`（生成差分 harness）
- op DAG / rewrite：
  - `optimizer/ir/dct32_op_ir.py`、`dct32_op_emit.py`、
    `dct32_rewrites.py`（含 k0_even_sve）
  - `optimizer/ir/dct16_op_ir.py`、`dct16_op_emit.py`、
    `dct16_rewrites.py`
  - `optimizer/ir/layout_ir.py`、`op_ir.py`
- 评估文档：`docs/20-dct32-optimization-assessment.md`（§5.10-5.12）、
  `docs/25-dct16-opir-migration.md`、`docs/10-agent-handoff.md`

## 命令形状（本 round 实际使用）

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s workspace-write \
  -C "$PWD" \
  exec -o expert-advice/round-0014/response.md \
  - < expert-advice/round-0014/prompt.md
```

后台运行（nohup，stdout 落 session.log），主模型继续前台工作；落盘后
主进程写 `decision.md`。

## 性能观察（可复现的基准点）

- 单候选全链路（本地 x86）：`aarch64-linux-gnu-g++ -O2 -fno-tree-pre
  -c` 约 0.2s；20k qemu 差分约 2s；trace（-one-insn-per-tb + parse）
  约 1s；llvm-mca 约 0.5s；
- DCT32 rwseq 625 序列串行估计 30-60 分钟（已跑 10 分钟仅完成约
  50/625 个对象的构建+验证）；
- 两台远程环境（ARM N1 129.146.162.16、鲲鹏 920B 124.70.206.229）
  仅用于实机验收，不做大规模搜索。
