
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
  50:	2518e101 	ptrue	p1.b, vl8
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
  88:	d37ff829 	lsl	x9, x1, #1
  8c:	9a8a0108 	csel	x8, x8, x10, eq	// eq = none
  90:	05203065 	tbl	z5.b, {z3.b}, z0.b
  94:	d37ff86a 	lsl	x10, x3, #1
  98:	05223066 	tbl	z6.b, {z3.b}, z2.b
  9c:	85804103 	ldr	z3, [x8]
  a0:	0420bc87 	movprfx	z7, z4
  a4:	444100a7 	sdot	z7.h, z5.b, z1.b
  a8:	444300c7 	sdot	z7.h, z6.b, z3.b
  ac:	056768e5 	uzp1	z5.h, z7.h, z7.h
  b0:	05676ce6 	uzp2	z6.h, z7.h, z7.h
  b4:	d1000c08 	sub	x8, x0, #0x3
  b8:	046600a5 	add	z5.h, z5.h, z6.h
  bc:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
  c0:	052568a5 	uzp1	z5.b, z5.b, z5.b
  c4:	e400e445 	st1b	{z5.b}, p1, [x2]
  c8:	a4014105 	ld1b	{z5.b}, p0/z, [x8, x1]
  cc:	2521d005 	sub	z5.b, z5.b, #128
  d0:	052030a6 	tbl	z6.b, {z5.b}, z0.b
  d4:	052230a5 	tbl	z5.b, {z5.b}, z2.b
  d8:	0420bc87 	movprfx	z7, z4
  dc:	444100c7 	sdot	z7.h, z6.b, z1.b
  e0:	444300a7 	sdot	z7.h, z5.b, z3.b
  e4:	056768e5 	uzp1	z5.h, z7.h, z7.h
  e8:	05676ce6 	uzp2	z6.h, z7.h, z7.h
  ec:	046600a5 	add	z5.h, z5.h, z6.h
  f0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
  f4:	052568a5 	uzp1	z5.b, z5.b, z5.b
  f8:	e4034445 	st1b	{z5.b}, p1, [x2, x3]
  fc:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
 100:	8b010129 	add	x9, x9, x1
 104:	2521d005 	sub	z5.b, z5.b, #128
 108:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 10c:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 110:	0420bc87 	movprfx	z7, z4
 114:	444100c7 	sdot	z7.h, z6.b, z1.b
 118:	444300a7 	sdot	z7.h, z5.b, z3.b
 11c:	056768e5 	uzp1	z5.h, z7.h, z7.h
 120:	05676ce6 	uzp2	z6.h, z7.h, z7.h
 124:	046600a5 	add	z5.h, z5.h, z6.h
 128:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 12c:	052568a5 	uzp1	z5.b, z5.b, z5.b
 130:	e40a4445 	st1b	{z5.b}, p1, [x2, x10]
 134:	a4094105 	ld1b	{z5.b}, p0/z, [x8, x9]
 138:	8b030149 	add	x9, x10, x3
 13c:	d37ef42a 	lsl	x10, x1, #2
 140:	2521d005 	sub	z5.b, z5.b, #128
 144:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 148:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 14c:	0420bc87 	movprfx	z7, z4
 150:	444100c7 	sdot	z7.h, z6.b, z1.b
 154:	444300a7 	sdot	z7.h, z5.b, z3.b
 158:	056768e5 	uzp1	z5.h, z7.h, z7.h
 15c:	05676ce6 	uzp2	z6.h, z7.h, z7.h
 160:	046600a5 	add	z5.h, z5.h, z6.h
 164:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 168:	052568a5 	uzp1	z5.b, z5.b, z5.b
 16c:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 170:	d37ef469 	lsl	x9, x3, #2
 174:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 178:	8b01014a 	add	x10, x10, x1
 17c:	2521d005 	sub	z5.b, z5.b, #128
 180:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 184:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 188:	0420bc87 	movprfx	z7, z4
 18c:	444100c7 	sdot	z7.h, z6.b, z1.b
 190:	444300a7 	sdot	z7.h, z5.b, z3.b
 194:	056768e5 	uzp1	z5.h, z7.h, z7.h
 198:	05676ce6 	uzp2	z6.h, z7.h, z7.h
 19c:	046600a5 	add	z5.h, z5.h, z6.h
 1a0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 1a4:	052568a5 	uzp1	z5.b, z5.b, z5.b
 1a8:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 1ac:	8b030129 	add	x9, x9, x3
 1b0:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 1b4:	528000ca 	mov	w10, #0x6                   	// #6
 1b8:	9b0a7c2b 	mul	x11, x1, x10
 1bc:	2521d005 	sub	z5.b, z5.b, #128
 1c0:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 1c4:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 1c8:	0420bc87 	movprfx	z7, z4
 1cc:	444100c7 	sdot	z7.h, z6.b, z1.b
 1d0:	444300a7 	sdot	z7.h, z5.b, z3.b
 1d4:	056768e5 	uzp1	z5.h, z7.h, z7.h
 1d8:	05676ce6 	uzp2	z6.h, z7.h, z7.h
 1dc:	046600a5 	add	z5.h, z5.h, z6.h
 1e0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 1e4:	052568a5 	uzp1	z5.b, z5.b, z5.b
 1e8:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 1ec:	9b0a7c69 	mul	x9, x3, x10
 1f0:	d37df02a 	lsl	x10, x1, #3
 1f4:	a40b4105 	ld1b	{z5.b}, p0/z, [x8, x11]
 1f8:	cb010108 	sub	x8, x8, x1
 1fc:	2521d005 	sub	z5.b, z5.b, #128
 200:	052030a6 	tbl	z6.b, {z5.b}, z0.b
 204:	052230a5 	tbl	z5.b, {z5.b}, z2.b
 208:	0420bc87 	movprfx	z7, z4
 20c:	444100c7 	sdot	z7.h, z6.b, z1.b
 210:	444300a7 	sdot	z7.h, z5.b, z3.b
 214:	056768e5 	uzp1	z5.h, z7.h, z7.h
 218:	05676ce6 	uzp2	z6.h, z7.h, z7.h
 21c:	046600a5 	add	z5.h, z5.h, z6.h
 220:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 224:	052568a5 	uzp1	z5.b, z5.b, z5.b
 228:	e4094445 	st1b	{z5.b}, p1, [x2, x9]
 22c:	cb030049 	sub	x9, x2, x3
 230:	a40a4105 	ld1b	{z5.b}, p0/z, [x8, x10]
 234:	d37df068 	lsl	x8, x3, #3
 238:	2521d005 	sub	z5.b, z5.b, #128
 23c:	052030a0 	tbl	z0.b, {z5.b}, z0.b
 240:	052230a2 	tbl	z2.b, {z5.b}, z2.b
 244:	0420bc85 	movprfx	z5, z4
 248:	44410005 	sdot	z5.h, z0.b, z1.b
 24c:	44430045 	sdot	z5.h, z2.b, z3.b
 250:	056568a0 	uzp1	z0.h, z5.h, z5.h
 254:	05656ca1 	uzp2	z1.h, z5.h, z5.h
 258:	04610000 	add	z0.h, z0.h, z1.h
 25c:	452a0800 	sqrshrunb	z0.b, z0.h, #6
 260:	05206800 	uzp1	z0.b, z0.b, z0.b
 264:	e4084520 	st1b	{z0.b}, p1, [x9, x8]
 268:	d65f03c0 	ret
