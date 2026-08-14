完成。QEMU 已补齐并验证 SVE2p1/p2/p3 的剩余指令子集，交付物如下：

- 补丁：[qemu-sve2p1p3-remaining.patch](/home/chiro/projects/a64-simd-dyn-optimizer/patches/qemu-sve2p1p3-remaining.patch)（相对 qemu-11.0.3 + round-0018 基线，`patch --dry-run` 通过；round-0018 补丁未改动）
- 摘要：[qemu-sve2p1p3-SUMMARY.md](/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-sve2p1p3-SUMMARY.md)
- 验证程序：[sve2p1p3-canary.c](/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-verify/sve2p1p3-canary.c) / [sve2p1p3-canary.S](/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-verify/sve2p1p3-canary.S)

实现内容：

- SVE2p3：`SDOT/UDOT` BtoH（vector + indexed）、`SABAL/UABAL` BtoH/HtoS/StoD、9 条 saturating shift-right-narrow-and-interleave（HtoB 6 条 + StoH 3 条）
- SVE2p2：整数 zeroing unary（`cls/clz/cnt/cnot/not/abs/neg/sxtb/uxtb/sxth/uxth/sxtw/uxtw/sqabs/sqneg/urecpe/ursqrte/rbit/revb/revh/revw/revd`）
- 为区分 SVE2p3 新编码，把旧单向量 shift-narrow 的 bit23 从通配收紧为固定 0，并回归验证旧 `sqshrnb` 仍正常

验证输出（`-cpu max,sve-max-vq=2`，VL=256）：

```text
SVE2p1p3 canary: PASS
SVE2p1 sdot.s regression: PASS
SVE2p3 sdot.h canary: PASS (executor implements FEAT_SVE2p3)
```

跳过并在摘要中列明的指令：`ADDQP/ADDSUBP/SUBP`、`FCVTZSN/FCVTZUN`、`SCVTF/SCVTFLT/UCVTF/UCVTFLT`、`LUTI6`、SVE2p2 的 FP zeroing / `expand` / `compact` / `firstp` / `lastp` / `fmmla` 等。主要限制：indexed dot 按每个 16-byte 段内取 2 字节组实现，`urecpe/ursqrte` 未做逐 lane 数值校验。