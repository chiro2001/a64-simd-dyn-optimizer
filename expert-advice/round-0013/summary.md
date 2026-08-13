# round-0013 结论摘要

1. 【事实】`search_plans` 已完成 18→18→12→12 分层实测，upstream-exact、零 scatter，重现 3962；这是可信的“rewrite-driven E1”通过。
2. 【判定】它还不足以称严格“盲重发现”：`lower()` 仍把少数 lowering 字段映射到预写 C++ 机制块，Tile/lane 语义没有驱动逐 op 生成。
3. 【事实】canonical key 已在 `search_plans` 的 `lower()` 前使用；但通用 `search_sve2_layouts` 仍是 emit 后源码 hash，故主驱动尚未统一。
4. 【下一批必做】统一驱动的 codegen 前 canonical 去重、可机读 ProofReport，以及一个不依赖 grouped C++ 的 DCT32 op-backend 垂直切片。
5. 【可延后】完整通用 MachineIR、`interpass_layout`、全量 tiles 逐寄存器证明；先保留 C++ emitter 作为回归 oracle。
6. 【实验优先级】(1) op-backend 盲重发现；(2) 合并搜索驱动并跨 kernel 回归；(3) row_group=8 双 accumulator 可行性。
7. 【条件实验】SVE2p3 canary 通过后再做 interp8 path-B；当前 SIGILL 时只能 semantic/build-only，NEON 同算力仅作低优先级成本校准。
8. 【验收】所有 upstream-exact finalist 需 200k 0 mismatch、Lite 多 seed、VL/guard/no-scatter 门；QEMU fused_uop 是代理，实机 cycles 才是性能结论。
