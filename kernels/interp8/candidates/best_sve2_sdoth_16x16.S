
kernels/interp8/candidates/best_sve2_sdoth_16x16.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_16x16_sve2_sdoth>:
   0:	51000488 	sub	w8, w4, #0x1
   4:	90000009 	adrp	x9, 0 <dynopt_interp8_16x16_sve2_sdoth>
   8:	91000129 	add	x9, x9, #0x0
   c:	71000d1f 	cmp	w8, #0x3
  10:	52800048 	mov	w8, #0x2                   	// #2
  14:	9000000a 	adrp	x10, 0 <dynopt_interp8_16x16_sve2_sdoth>
  18:	9100014a 	add	x10, x10, #0x0
  1c:	1a883088 	csel	w8, w4, w8, cc	// cc = lo, ul, last
  20:	9000000b 	adrp	x11, 0 <dynopt_interp8_16x16_sve2_sdoth>
  24:	9100016b 	add	x11, x11, #0x0
  28:	71000d1f 	cmp	w8, #0x3
  2c:	9000000c 	adrp	x12, 0 <dynopt_interp8_16x16_sve2_sdoth>
  30:	9100018c 	add	x12, x12, #0x0
  34:	9a890149 	csel	x9, x10, x9, eq	// eq = none
  38:	2578e206 	mov	z6.h, #4096
  3c:	9a8b018a 	csel	x10, x12, x11, eq	// eq = none
  40:	7100051f 	cmp	w8, #0x1
  44:	90000008 	adrp	x8, 0 <dynopt_interp8_16x16_sve2_sdoth>
  48:	91000108 	add	x8, x8, #0x0
  4c:	2518e100 	ptrue	p0.b, vl8
  50:	9a890108 	csel	x8, x8, x9, eq	// eq = none
  54:	90000009 	adrp	x9, 0 <dynopt_interp8_16x16_sve2_sdoth>
  58:	91000129 	add	x9, x9, #0x0
  5c:	85804100 	ldr	z0, [x8]
  60:	90000008 	adrp	x8, 0 <dynopt_interp8_16x16_sve2_sdoth>
  64:	91000108 	add	x8, x8, #0x0
  68:	9a8a0108 	csel	x8, x8, x10, eq	// eq = none
  6c:	85804122 	ldr	z2, [x9]
  70:	90000009 	adrp	x9, 0 <dynopt_interp8_16x16_sve2_sdoth>
  74:	91000129 	add	x9, x9, #0x0
  78:	85804101 	ldr	z1, [x8]
  7c:	90000008 	adrp	x8, 0 <dynopt_interp8_16x16_sve2_sdoth>
  80:	91000108 	add	x8, x8, #0x0
  84:	85804124 	ldr	z4, [x9]
  88:	52800209 	mov	w9, #0x10                  	// #16
  8c:	85804103 	ldr	z3, [x8]
  90:	90000008 	adrp	x8, 0 <dynopt_interp8_16x16_sve2_sdoth>
  94:	91000108 	add	x8, x8, #0x0
  98:	85804105 	ldr	z5, [x8]
  9c:	d1000c08 	sub	x8, x0, #0x3
  a0:	5280010a 	mov	w10, #0x8                   	// #8
  a4:	85804107 	ldr	z7, [x8]
  a8:	f1000529 	subs	x9, x9, #0x1
  ac:	8b010108 	add	x8, x8, x1
  b0:	2521d007 	sub	z7.b, z7.b, #128
  b4:	052230f0 	tbl	z16.b, {z7.b}, z2.b
  b8:	052330f1 	tbl	z17.b, {z7.b}, z3.b
  bc:	0420bcd2 	movprfx	z18, z6
  c0:	44400212 	sdot	z18.h, z16.b, z0.b
  c4:	44410232 	sdot	z18.h, z17.b, z1.b
  c8:	05726a50 	uzp1	z16.h, z18.h, z18.h
  cc:	05726e51 	uzp2	z17.h, z18.h, z18.h
  d0:	04710210 	add	z16.h, z16.h, z17.h
  d4:	052430f1 	tbl	z17.b, {z7.b}, z4.b
  d8:	052530e7 	tbl	z7.b, {z7.b}, z5.b
  dc:	452a0a10 	sqrshrunb	z16.b, z16.h, #6
  e0:	05306a10 	uzp1	z16.b, z16.b, z16.b
  e4:	e400e050 	st1b	{z16.b}, p0, [x2]
  e8:	0420bcd0 	movprfx	z16, z6
  ec:	44400230 	sdot	z16.h, z17.b, z0.b
  f0:	444100f0 	sdot	z16.h, z7.b, z1.b
  f4:	05706a07 	uzp1	z7.h, z16.h, z16.h
  f8:	05706e10 	uzp2	z16.h, z16.h, z16.h
  fc:	047000e7 	add	z7.h, z7.h, z16.h
 100:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
 104:	052768e7 	uzp1	z7.b, z7.b, z7.b
 108:	e40a4047 	st1b	{z7.b}, p0, [x2, x10]
 10c:	8b030042 	add	x2, x2, x3
 110:	54fffca1 	b.ne	a4 <dynopt_interp8_16x16_sve2_sdoth+0xa4>  // b.any
 114:	d65f03c0 	ret
