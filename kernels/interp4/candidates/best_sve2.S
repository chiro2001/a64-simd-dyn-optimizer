
kernels/interp4/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp4_16x16_sve2>:
   0:	12000888 	and	w8, w4, #0x7
   4:	90000009 	adrp	x9, 0 <dynopt_interp4_16x16_sve2>
   8:	91000129 	add	x9, x9, #0x0
   c:	8b284928 	add	x8, x9, w8, uxtw #2
  10:	6f00e401 	movi	v1.2d, #0x0
  14:	2518e120 	ptrue	p0.b, vl16
  18:	52800209 	mov	w9, #0x10                  	// #16
  1c:	7d400102 	ldr	h2, [x8]
  20:	7d400503 	ldr	h3, [x8, #2]
  24:	90000008 	adrp	x8, 0 <dynopt_interp4_16x16_sve2>
  28:	91000108 	add	x8, x8, #0x0
  2c:	85804100 	ldr	z0, [x8]
  30:	90000008 	adrp	x8, 0 <dynopt_interp4_16x16_sve2>
  34:	91000108 	add	x8, x8, #0x0
  38:	05222042 	mov	z2.h, h2
  3c:	05222063 	mov	z3.h, h3
  40:	85804104 	ldr	z4, [x8]
  44:	d1000408 	sub	x8, x0, #0x1
  48:	85804105 	ldr	z5, [x8]
  4c:	f1000529 	subs	x9, x9, #0x1
  50:	8b010108 	add	x8, x8, x1
  54:	2521d005 	sub	z5.b, z5.b, #128
  58:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  5c:	0420bc27 	movprfx	z7, z1
  60:	444200c7 	sdot	z7.h, z6.b, z2.b
  64:	052430a5 	tbl	z5.b, {z5.b}, z4.b
  68:	444300a7 	sdot	z7.h, z5.b, z3.b
  6c:	2560e407 	add	z7.h, z7.h, #8192
  70:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
  74:	052568a5 	uzp1	z5.b, z5.b, z5.b
  78:	e400e045 	st1b	{z5.b}, p0, [x2]
  7c:	8b030042 	add	x2, x2, x3
  80:	54fffe41 	b.ne	48 <dynopt_interp4_16x16_sve2+0x48>  // b.any
  84:	d65f03c0 	ret
