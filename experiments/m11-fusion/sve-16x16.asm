
build/sve4.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sa8d_16x16_neon_sve2>:
   0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   4:	910003fd 	mov	x29, sp
   8:	a90153f3 	stp	x19, x20, [sp, #16]
   c:	aa0103f4 	mov	x20, x1
  10:	a9025bf5 	stp	x21, x22, [sp, #32]
  14:	aa0003f5 	mov	x21, x0
  18:	aa0203f6 	mov	x22, x2
  1c:	f9001fe3 	str	x3, [sp, #56]
  20:	94000000 	bl	0 <dynopt_sa8d_8x8x2raw_neon_sve2>
  24:	f9401fe3 	ldr	x3, [sp, #56]
  28:	2a0003f3 	mov	w19, w0
  2c:	aa1403e1 	mov	x1, x20
  30:	8b140ea0 	add	x0, x21, x20, lsl #3
  34:	8b030ec2 	add	x2, x22, x3, lsl #3
  38:	94000000 	bl	0 <dynopt_sa8d_8x8x2raw_neon_sve2>
  3c:	93407c00 	sxtw	x0, w0
  40:	8b33c000 	add	x0, x0, w19, sxtw
  44:	91000400 	add	x0, x0, #0x1
  48:	a94153f3 	ldp	x19, x20, [sp, #16]
  4c:	d3418000 	ubfx	x0, x0, #1, #32
  50:	a9425bf5 	ldp	x21, x22, [sp, #32]
  54:	a8c47bfd 	ldp	x29, x30, [sp], #64
  58:	d65f03c0 	ret
