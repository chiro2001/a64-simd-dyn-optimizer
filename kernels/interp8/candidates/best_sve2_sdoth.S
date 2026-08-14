
kernels/interp8/candidates/best_sve2_sdoth.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_8x8_sve2_sdoth>:
   0:	51000488 	sub	w8, w4, #0x1
   4:	52800049 	mov	w9, #0x2                   	// #2
   8:	9000000a 	adrp	x10, 0 <dynopt_interp8_8x8_sve2_sdoth>
   c:	9100014a 	add	x10, x10, #0x0
  10:	71000d1f 	cmp	w8, #0x3
  14:	90000008 	adrp	x8, 0 <dynopt_interp8_8x8_sve2_sdoth>
  18:	91000108 	add	x8, x8, #0x0
  1c:	1a893089 	csel	w9, w4, w9, cc	// cc = lo, ul, last
  20:	2518e3e0 	ptrue	p0.b
  24:	71000d3f 	cmp	w9, #0x3
  28:	9000000c 	adrp	x12, 0 <dynopt_interp8_8x8_sve2_sdoth>
  2c:	9100018c 	add	x12, x12, #0x0
  30:	9a880148 	csel	x8, x10, x8, eq	// eq = none
  34:	9280004a 	mov	x10, #0xfffffffffffffffd    	// #-3
  38:	9000000b 	adrp	x11, 0 <dynopt_interp8_8x8_sve2_sdoth>
  3c:	9100016b 	add	x11, x11, #0x0
  40:	a40a4003 	ld1b	{z3.b}, p0/z, [x0, x10]
  44:	9000000a 	adrp	x10, 0 <dynopt_interp8_8x8_sve2_sdoth>
  48:	9100014a 	add	x10, x10, #0x0
  4c:	2578e204 	mov	z4.h, #4096
  50:	2558e3e1 	ptrue	p1.h
  54:	9a8c014a 	csel	x10, x10, x12, eq	// eq = none
  58:	7100053f 	cmp	w9, #0x1
  5c:	90000009 	adrp	x9, 0 <dynopt_interp8_8x8_sve2_sdoth>
  60:	91000129 	add	x9, x9, #0x0
  64:	9a880168 	csel	x8, x11, x8, eq	// eq = none
  68:	2521d003 	sub	z3.b, z3.b, #128
  6c:	85804120 	ldr	z0, [x9]
  70:	90000009 	adrp	x9, 0 <dynopt_interp8_8x8_sve2_sdoth>
  74:	91000129 	add	x9, x9, #0x0
  78:	85804122 	ldr	z2, [x9]
  7c:	85804101 	ldr	z1, [x8]
  80:	90000008 	adrp	x8, 0 <dynopt_interp8_8x8_sve2_sdoth>
  84:	91000108 	add	x8, x8, #0x0
  88:	2518e102 	ptrue	p2.b, vl8
  8c:	d37ff829 	lsl	x9, x1, #1
  90:	9a8a0108 	csel	x8, x8, x10, eq	// eq = none
  94:	05203065 	tbl	z5.b, {z3.b}, z0.b
  98:	d37ff86a 	lsl	x10, x3, #1
  9c:	05223066 	tbl	z6.b, {z3.b}, z2.b
  a0:	85804103 	ldr	z3, [x8]
  a4:	0420bc87 	movprfx	z7, z4
  a8:	444100a7 	sdot	z7.h, z5.b, z1.b
  ac:	444300c7 	sdot	z7.h, z6.b, z3.b
  b0:	d1000c08 	sub	x8, x0, #0x3
  b4:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
  b8:	056768e5 	uzp1	z5.h, z7.h, z7.h
  bc:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
  c0:	052568a5 	uzp1	z5.b, z5.b, z5.b
  c4:	e400e845 	st1b	{z5.b}, p2, [x2]
  c8:	a4014105 	ld1b	{z5.b}, p0/z, [x8, x1]
  cc:	2521d005 	sub	z5.b, z5.b, #128
  d0:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  d4:	0420bc87 	movprfx	z7, z4
  d8:	444100c7 	sdot	z7.h, z6.b, z1.b
  dc:	052230a5 	tbl	z5.b, {z5.b}, z2.b
  e0:	444300a7 	sdot	z7.h, z5.b, z3.b
  e4:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
  e8:	056768e5 	uzp1	z5.h, z7.h, z7.h
  ec:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
  f0:	052568a5 	uzp1	z5.b, z5.b, z5.b
  f4:	e4034845 	st1b	{z5.b}, p2, [x2, x3]
  f8:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
  fc:	8b010129 	add	x9, x9, x1
 100:	2521d005 	sub	z5.b, z5.b, #128
 104:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 108:	0420bc87 	movprfx	z7, z4
 10c:	444100c7 	sdot	z7.h, z6.b, z1.b
 110:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 114:	444300a7 	sdot	z7.h, z5.b, z3.b
 118:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
 11c:	056768e5 	uzp1	z5.h, z7.h, z7.h
 120:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 124:	052568a5 	uzp1	z5.b, z5.b, z5.b
 128:	e40a4845 	st1b	{z5.b}, p2, [x2, x10]
 12c:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
 130:	8b030149 	add	x9, x10, x3
 134:	d37ef42a 	lsl	x10, x1, #2
 138:	2521d005 	sub	z5.b, z5.b, #128
 13c:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 140:	0420bc87 	movprfx	z7, z4
 144:	444100c7 	sdot	z7.h, z6.b, z1.b
 148:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 14c:	444300a7 	sdot	z7.h, z5.b, z3.b
 150:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
 154:	056768e5 	uzp1	z5.h, z7.h, z7.h
 158:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 15c:	052568a5 	uzp1	z5.b, z5.b, z5.b
 160:	e4094845 	st1b	{z5.b}, p2, [x2, x9]
 164:	d37ef469 	lsl	x9, x3, #2
 168:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 16c:	8b01014a 	add	x10, x10, x1
 170:	2521d005 	sub	z5.b, z5.b, #128
 174:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 178:	0420bc87 	movprfx	z7, z4
 17c:	444100c7 	sdot	z7.h, z6.b, z1.b
 180:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 184:	444300a7 	sdot	z7.h, z5.b, z3.b
 188:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
 18c:	056768e5 	uzp1	z5.h, z7.h, z7.h
 190:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 194:	052568a5 	uzp1	z5.b, z5.b, z5.b
 198:	e4094845 	st1b	{z5.b}, p2, [x2, x9]
 19c:	8b030129 	add	x9, x9, x3
 1a0:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 1a4:	528000ca 	mov	w10, #0x6                   	// #6
 1a8:	9b0a7c2b 	mul	x11, x1, x10
 1ac:	2521d005 	sub	z5.b, z5.b, #128
 1b0:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 1b4:	0420bc87 	movprfx	z7, z4
 1b8:	444100c7 	sdot	z7.h, z6.b, z1.b
 1bc:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 1c0:	444300a7 	sdot	z7.h, z5.b, z3.b
 1c4:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
 1c8:	056768e5 	uzp1	z5.h, z7.h, z7.h
 1cc:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 1d0:	052568a5 	uzp1	z5.b, z5.b, z5.b
 1d4:	e4094845 	st1b	{z5.b}, p2, [x2, x9]
 1d8:	9b0a7c69 	mul	x9, x3, x10
 1dc:	d37df02a 	lsl	x10, x1, #3
 1e0:	a40b4105 	ld1b	{z5.b}, p0/z, [x8, x11]
 1e4:	cb010108 	sub	x8, x8, x1
 1e8:	2521d005 	sub	z5.b, z5.b, #128
 1ec:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 1f0:	0420bc87 	movprfx	z7, z4
 1f4:	444100c7 	sdot	z7.h, z6.b, z1.b
 1f8:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 1fc:	444300a7 	sdot	z7.h, z5.b, z3.b
 200:	4451a4e7 	addp	z7.h, p1/m, z7.h, z7.h
 204:	056768e5 	uzp1	z5.h, z7.h, z7.h
 208:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 20c:	052568a5 	uzp1	z5.b, z5.b, z5.b
 210:	e4094845 	st1b	{z5.b}, p2, [x2, x9]
 214:	cb030049 	sub	x9, x2, x3
 218:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 21c:	d37df068 	lsl	x8, x3, #3
 220:	2521d005 	sub	z5.b, z5.b, #128
 224:	052030a0 	tbl	z0.b, {z5.b}, z0.b
 228:	052230a2 	tbl	z2.b, {z5.b}, z2.b
 22c:	0420bc85 	movprfx	z5, z4
 230:	44410005 	sdot	z5.h, z0.b, z1.b
 234:	44430045 	sdot	z5.h, z2.b, z3.b
 238:	4451a4a5 	addp	z5.h, p1/m, z5.h, z5.h
 23c:	056568a0 	uzp1	z0.h, z5.h, z5.h
 240:	452a0800 	sqrshrunb	z0.b, z0.h, #6
 244:	05206800 	uzp1	z0.b, z0.b, z0.b
 248:	e4084920 	st1b	{z0.b}, p2, [x9, x8]
 24c:	d65f03c0 	ret
