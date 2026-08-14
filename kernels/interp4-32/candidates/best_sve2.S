
kernels/interp4-32/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp4_32x32_sve2>:
   0:	12000888 	and	w8, w4, #0x7
   4:	90000009 	adrp	x9, 0 <dynopt_interp4_32x32_sve2>
   8:	91000129 	add	x9, x9, #0x0
   c:	8b284928 	add	x8, x9, w8, uxtw #2
  10:	6f00e401 	movi	v1.2d, #0x0
  14:	2518e120 	ptrue	p0.b, vl16
  18:	2518e3e1 	ptrue	p1.b
  1c:	52800409 	mov	w9, #0x20                  	// #32
  20:	928001ea 	mov	x10, #0xfffffffffffffff0    	// #-16
  24:	7d400102 	ldr	h2, [x8]
  28:	7d400503 	ldr	h3, [x8, #2]
  2c:	90000008 	adrp	x8, 0 <dynopt_interp4_32x32_sve2>
  30:	91000108 	add	x8, x8, #0x0
  34:	5280020b 	mov	w11, #0x10                  	// #16
  38:	85804100 	ldr	z0, [x8]
  3c:	90000008 	adrp	x8, 0 <dynopt_interp4_32x32_sve2>
  40:	91000108 	add	x8, x8, #0x0
  44:	05222042 	mov	z2.h, h2
  48:	05222063 	mov	z3.h, h3
  4c:	85804104 	ldr	z4, [x8]
  50:	91003c08 	add	x8, x0, #0xf
  54:	a40a4505 	ld1b	{z5.b}, p1/z, [x8, x10]
  58:	f1000529 	subs	x9, x9, #0x1
  5c:	2521d005 	sub	z5.b, z5.b, #128
  60:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  64:	0420bc27 	movprfx	z7, z1
  68:	444200c7 	sdot	z7.h, z6.b, z2.b
  6c:	052430a5 	tbl	z5.b, {z5.b}, z4.b
  70:	444300a7 	sdot	z7.h, z5.b, z3.b
  74:	2560e407 	add	z7.h, z7.h, #8192
  78:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
  7c:	052568a5 	uzp1	z5.b, z5.b, z5.b
  80:	e400e045 	st1b	{z5.b}, p0, [x2]
  84:	85804105 	ldr	z5, [x8]
  88:	8b010108 	add	x8, x8, x1
  8c:	2521d005 	sub	z5.b, z5.b, #128
  90:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  94:	0420bc27 	movprfx	z7, z1
  98:	444200c7 	sdot	z7.h, z6.b, z2.b
  9c:	052430a5 	tbl	z5.b, {z5.b}, z4.b
  a0:	444300a7 	sdot	z7.h, z5.b, z3.b
  a4:	2560e407 	add	z7.h, z7.h, #8192
  a8:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
  ac:	052568a5 	uzp1	z5.b, z5.b, z5.b
  b0:	e40b4045 	st1b	{z5.b}, p0, [x2, x11]
  b4:	8b030042 	add	x2, x2, x3
  b8:	54fffce1 	b.ne	54 <dynopt_interp4_32x32_sve2+0x54>  // b.any
  bc:	d65f03c0 	ret
