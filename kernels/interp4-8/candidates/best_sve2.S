
kernels/interp4-8/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp4_8x8_sve2>:
   0:	2518e3e0 	ptrue	p0.b
   4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
   8:	12000889 	and	w9, w4, #0x7
   c:	9000000a 	adrp	x10, 0 <dynopt_interp4_8x8_sve2>
  10:	9100014a 	add	x10, x10, #0x0
  14:	6f00e402 	movi	v2.2d, #0x0
  18:	a4084003 	ld1b	{z3.b}, p0/z, [x0, x8]
  1c:	90000008 	adrp	x8, 0 <dynopt_interp4_8x8_sve2>
  20:	91000108 	add	x8, x8, #0x0
  24:	8b294908 	add	x8, x8, w9, uxtw #2
  28:	90000009 	adrp	x9, 0 <dynopt_interp4_8x8_sve2>
  2c:	91000129 	add	x9, x9, #0x0
  30:	85804140 	ldr	z0, [x10]
  34:	85804121 	ldr	z1, [x9]
  38:	2518e101 	ptrue	p1.b, vl8
  3c:	2521d003 	sub	z3.b, z3.b, #128
  40:	7d400104 	ldr	h4, [x8]
  44:	7d400505 	ldr	h5, [x8, #2]
  48:	d1000408 	sub	x8, x0, #0x1
  4c:	d37ff829 	lsl	x9, x1, #1
  50:	d37ff86a 	lsl	x10, x3, #1
  54:	05222084 	mov	z4.h, h4
  58:	05203066 	tbl	z6.b, {z3.b}, z0.b
  5c:	05213067 	tbl	z7.b, {z3.b}, z1.b
  60:	052220a3 	mov	z3.h, h5
  64:	0420bc45 	movprfx	z5, z2
  68:	444400c5 	sdot	z5.h, z6.b, z4.b
  6c:	444300e5 	sdot	z5.h, z7.b, z3.b
  70:	2560e405 	add	z5.h, z5.h, #8192
  74:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
  78:	052568a5 	uzp1	z5.b, z5.b, z5.b
  7c:	e400e445 	st1b	{z5.b}, p1, [x2]
  80:	a4014105 	ld1b	{z5.b}, p0/z, [x8, x1]
  84:	2521d005 	sub	z5.b, z5.b, #128
  88:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  8c:	0420bc47 	movprfx	z7, z2
  90:	444400c7 	sdot	z7.h, z6.b, z4.b
  94:	052130a5 	tbl	z5.b, {z5.b}, z1.b
  98:	444300a7 	sdot	z7.h, z5.b, z3.b
  9c:	2560e407 	add	z7.h, z7.h, #8192
  a0:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
  a4:	052568a5 	uzp1	z5.b, z5.b, z5.b
  a8:	e4034445 	st1b	{z5.b}, p1, [x2, x3]
  ac:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
  b0:	8b010129 	add	x9, x9, x1
  b4:	2521d005 	sub	z5.b, z5.b, #128
  b8:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  bc:	0420bc47 	movprfx	z7, z2
  c0:	444400c7 	sdot	z7.h, z6.b, z4.b
  c4:	052130a5 	tbl	z5.b, {z5.b}, z1.b
  c8:	444300a7 	sdot	z7.h, z5.b, z3.b
  cc:	2560e407 	add	z7.h, z7.h, #8192
  d0:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
  d4:	052568a5 	uzp1	z5.b, z5.b, z5.b
  d8:	e40a4445 	st1b	{z5.b}, p1, [x2, x10]
  dc:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
  e0:	8b030149 	add	x9, x10, x3
  e4:	d37ef42a 	lsl	x10, x1, #2
  e8:	2521d005 	sub	z5.b, z5.b, #128
  ec:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  f0:	0420bc47 	movprfx	z7, z2
  f4:	444400c7 	sdot	z7.h, z6.b, z4.b
  f8:	052130a5 	tbl	z5.b, {z5.b}, z1.b
  fc:	444300a7 	sdot	z7.h, z5.b, z3.b
 100:	2560e407 	add	z7.h, z7.h, #8192
 104:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
 108:	052568a5 	uzp1	z5.b, z5.b, z5.b
 10c:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 110:	d37ef469 	lsl	x9, x3, #2
 114:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 118:	8b01014a 	add	x10, x10, x1
 11c:	2521d005 	sub	z5.b, z5.b, #128
 120:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 124:	0420bc47 	movprfx	z7, z2
 128:	444400c7 	sdot	z7.h, z6.b, z4.b
 12c:	052130a5 	tbl	z5.b, {z5.b}, z1.b
 130:	444300a7 	sdot	z7.h, z5.b, z3.b
 134:	2560e407 	add	z7.h, z7.h, #8192
 138:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
 13c:	052568a5 	uzp1	z5.b, z5.b, z5.b
 140:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 144:	8b030129 	add	x9, x9, x3
 148:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 14c:	528000ca 	mov	w10, #0x6                   	// #6
 150:	9b0a7c2b 	mul	x11, x1, x10
 154:	2521d005 	sub	z5.b, z5.b, #128
 158:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 15c:	0420bc47 	movprfx	z7, z2
 160:	444400c7 	sdot	z7.h, z6.b, z4.b
 164:	052130a5 	tbl	z5.b, {z5.b}, z1.b
 168:	444300a7 	sdot	z7.h, z5.b, z3.b
 16c:	2560e407 	add	z7.h, z7.h, #8192
 170:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
 174:	052568a5 	uzp1	z5.b, z5.b, z5.b
 178:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 17c:	9b0a7c69 	mul	x9, x3, x10
 180:	d37df02a 	lsl	x10, x1, #3
 184:	a40b4105 	ld1b	{z5.b}, p0/z, [x8, x11]
 188:	cb010108 	sub	x8, x8, x1
 18c:	2521d005 	sub	z5.b, z5.b, #128
 190:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 194:	0420bc47 	movprfx	z7, z2
 198:	444400c7 	sdot	z7.h, z6.b, z4.b
 19c:	052130a5 	tbl	z5.b, {z5.b}, z1.b
 1a0:	444300a7 	sdot	z7.h, z5.b, z3.b
 1a4:	2560e407 	add	z7.h, z7.h, #8192
 1a8:	452a08e5 	sqrshrunb	z5.b, z7.h, #6
 1ac:	052568a5 	uzp1	z5.b, z5.b, z5.b
 1b0:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 1b4:	cb030049 	sub	x9, x2, x3
 1b8:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 1bc:	d37df068 	lsl	x8, x3, #3
 1c0:	2521d005 	sub	z5.b, z5.b, #128
 1c4:	052030a0 	tbl	z0.b, {z5.b}, z0.b
 1c8:	052130a1 	tbl	z1.b, {z5.b}, z1.b
 1cc:	0420bc45 	movprfx	z5, z2
 1d0:	44440005 	sdot	z5.h, z0.b, z4.b
 1d4:	44430025 	sdot	z5.h, z1.b, z3.b
 1d8:	2560e405 	add	z5.h, z5.h, #8192
 1dc:	452a08a0 	sqrshrunb	z0.b, z5.h, #6
 1e0:	05206800 	uzp1	z0.b, z0.b, z0.b
 1e4:	e4084520 	st1b	{z0.b}, p1, [x9, x8]
 1e8:	d65f03c0 	ret
