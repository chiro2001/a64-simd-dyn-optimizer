# Round 0018：为本地 QEMU 补 SVE2p3 SDOT BtoH（deepseek-v4-flash，默认 profile）

任务：给本机 QEMU 源码补上 SVE2p3 指令
`sdot z0.h, z1.b, z2.b`（SDOT Zda.H, Zn.B, Zm.B，4-way 有符号字节
点积累加到半字）的支持，构建并验证，交付补丁与摘要。

背景（已确认事实）：
- 系统 QEMU 11.0.3 执行该指令报 Illegal instruction（上游尚无
  SVE2p3；SVE2p2 2026-06 才合入）。本项目需要它在本地验证
  SVE2p3 kernel（interp8 方案 B，docs/30 P0）。
- 语义：每个 16-bit 目的 lane j = Zn[4j..4j+3] · Zm[4j..4j+3]
  四个 8-bit 有符号乘积之和，累加（无饱和，按 ARM SDOT 语义；
  4×127×127=64516 可溢出 16-bit，测试数据需避开或按环绕核对）。
- 沙箱只允许写工作区（/home/chiro/projects/a64-simd-dyn-optimizer）
  与 /tmp；不要写 /home/chiro 其他路径。
- **/tmp 是内存盘（tmpfs），禁止把 QEMU 源码/构建放 /tmp**（会占
  内存）。一律用工作区下的磁盘路径（build/ 已被 .gitignore 忽略）：
  源码与构建都放 /home/chiro/projects/a64-simd-dyn-optimizer/build/
  下。内存 29G，构建并发 ≤8。

步骤：
1. 源码准备（不要 git clone，gitlab 经代理不可靠）：
   mkdir -p /home/chiro/projects/a64-simd-dyn-optimizer/build
   tar -xf /home/chiro/downloads/qemu-11.0.3.tar.xz \
     -C /home/chiro/projects/a64-simd-dyn-optimizer/build
   mv /home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-11.0.3 \
      /home/chiro/projects/a64-simd-dyn-optimizer/build/qemu-src
2. 在 target/arm/tcg/sve2.c（译码/trans_*）与
   target/arm/tcg/sve_helper.c（do_sdot 类 helper）找到现有 SDOT
   实现（HtoD/BtoS/HtoS），补 BtoH 变体。注意译码可能需按 SVE2p3
   特性（isar/CPUFeature）使能；可参考仓库中 SVE2p1 HtoS 的使能
   方式（本项目确认 QEMU 11.0.3 已执行 sdot z.s,z.h,z.h）。
3. 构建：mkdir -p /home/chiro/projects/a64-simd-dyn-optimizer/build/
   qemu-build && cd 该目录 && ../qemu-src/configure
   --target-list=aarch64-linux-user --static --disable-system &&
   make -j8 qemu-aarch64
4. 验证：
   - aarch64-linux-gnu-gcc -march=armv9.4-a+sve2p3 写小程序执行
     sdot z0.h,z1.b,z2.b，用构建出的 qemu-aarch64 -cpu max,
     sve-max-vq=2 核对点积数值；
   - 回归：跑一个 SVE2/SVE2p1 程序（例如 sdot z.s,z.h,z.h）确认
     未破坏既有支持。
5. 交付：
   - git diff 输出到
     /home/chiro/projects/a64-simd-dyn-optimizer/patches/
     qemu-sve2p3-sdot-btoh.patch（仓库只准新增这一个文件）；
   - 摘要写到 /home/chiro/projects/a64-simd-dyn-optimizer/build/
     qemu-sve2p3-SUMMARY.md（QEMU 版本/提交号、
     改动文件、构建命令、验证输出、已知限制）；
   - 把摘要内容作为最终答复返回。

约束：禁止读取 /tmp/dct-sve.s 等内部手写 kernel；不要修改仓库
其他内容；不要提交。若构建超过 45 分钟无进展，保存进度并返回
说明，不要无限重试。
