# Round 0019：QEMU 补齐 SVE2p1/SVE2p2/SVE2p3 剩余指令（dsv4flash，默认 profile）

任务：在本地 QEMU（已支持 SVE2p3 SDOT BtoH，见 round-0018）中补齐
**SVE2p1/SVE2p2/SVE2p3 尚未实现**的指令，构建并逐一验证，交付补丁与
摘要。本任务**后台执行，不阻塞主线**。

环境（已就绪）：
- QEMU 源码：/home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-src
  （11.0.3，磁盘路径，勿放 /tmp）；
- QEMU 构建目录：.../build/qemu-build（qemu-aarch64 已构建，含
  round-0018 的 SDOT BtoH 补丁）；重建用
  `make -j8 qemu-aarch64`（配置参数同 round-0018 摘要）。
- 已提交补丁：patches/qemu-sve2p3-sdot-btoh.patch（勿改动；新补丁另存
  为 patches/qemu-sve2p1p3-remaining.patch）。
- LLVM 源码（用于对照指令集）：/home/chiro/llvm-src（22.1.8，含
  FeatureSVE2p1/2p2/2p3 与 SVEInstrFormats.td 定义）。
- 本机 QEMU 11.0.3 已支持 SVE2p1（如 sdot z.s,z.h,z.h 可执行）；
  SVE2p3 目前只有 SDOT BtoH。SVE2p2 大概率整体缺失（2026-06 上游才
  合入）。

步骤：
1. **枚举**：从 ARM 官方（DDI0602 等，可查 LLVM SVEInstrFormats.td 中
   FeatureSVE2p1/2p2/2p3 门控的指令）列出 SVE2p1/SVE2p2/SVE2p3 全部
   指令族；对照 build/qemu-src 的 sve.decode / translate-sve.c 确认
   哪些已实现、哪些缺失（SVE2p1 已有部分，SVE2p2 全部，SVE2p3 除
   SDOT BtoH 外全部）。
2. **实现缺失指令**（按“本项目可能需要 + 官方语义明确”优先；每条：
   decode 条目 + helper（如需）+ CPU 特性门控 SVEver>=2/3/4）。至少
   覆盖：SDOT/UDOT BtoH（UDOT BtoH 若缺失）、SVE2p2 的
   8-bit widening dot 类指令、SVE2p3 其余 dot/收窄类指令。若某些
   指令语义复杂且本项目不涉及，可跳过并在摘要中列明。
3. **构建**：build/qemu-build 中 make -j8 qemu-aarch64（内存 29G，
   并发 ≤8；勿放 /tmp）。
4. **验证**：对每条新增指令写 canary（纯汇编 + C 按 ARM 语义逐 lane
   校验），用构建出的 qemu-aarch64 -cpu max,sve-max-vq=2 运行；回归
   SVE2p1 sdot z.s,z.h,z.h 与 SVE2p3 sdot z.h,z.b,z.b。
5. **交付**：
   - git diff（相对 build/qemu-src 未补丁状态）写到
     /home/chiro/projects/a64-simd-dyn-optimizer/patches/
     qemu-sve2p1p3-remaining.patch（仓库只准新增这一个文件，已有
     round-0018 补丁不动）；
   - 摘要写到 /home/chiro/projects/a64-simd-dyn-optimizer/build/
     qemu-sve2p1p3-SUMMARY.md（指令清单/已实现/跳过/验证输出/限制）；
   - 最终答复给出摘要。

约束：沙箱只允许写工作区与 /tmp（用工作区 build/ 目录，磁盘路径）；
禁止读取 /tmp/dct-sve.s 等内部 kernel；不要提交；构建/验证超过
60 分钟无进展则保存进度并返回。
