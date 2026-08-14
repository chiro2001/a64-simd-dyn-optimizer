
kernels/interp8vpp-16/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_16x16_sve2_vpp>:
   0:	043f57ff 	addvl	sp, sp, #-1
   4:	51000485 	sub	w5, w4, #0x1
   8:	d10103ff 	sub	sp, sp, #0x40
   c:	6d0027e8 	stp	d8, d9, [sp]
  10:	6d012fea 	stp	d10, d11, [sp, #16]
  14:	6d0237ec 	stp	d12, d13, [sp, #32]
  18:	6d033fee 	stp	d14, d15, [sp, #48]
  1c:	710008bf 	cmp	w5, #0x2
  20:	540001c8 	b.hi	58 <dynopt_interp8_16x16_sve2_vpp+0x58>  // b.pmore
  24:	7100049f 	cmp	w4, #0x1
  28:	54002860 	b.eq	534 <dynopt_interp8_16x16_sve2_vpp+0x534>  // b.none
  2c:	2538dfe7 	mov	z7.b, #-1
  30:	2578c085 	mov	z5.h, #4
  34:	71000c9f 	cmp	w4, #0x3
  38:	54000141 	b.ne	60 <dynopt_interp8_16x16_sve2_vpp+0x60>  // b.any
  3c:	2578dec6 	mov	z6.h, #-10
  40:	2578c744 	mov	z4.h, #58
  44:	2578c223 	mov	z3.h, #17
  48:	2578df61 	mov	z1.h, #-5
  4c:	2578c022 	mov	z2.h, #1
  50:	2f00e400 	movi	d0, #0x0
  54:	14000009 	b	78 <dynopt_interp8_16x16_sve2_vpp+0x78>
  58:	2538dfe7 	mov	z7.b, #-1
  5c:	2578c085 	mov	z5.h, #4
  60:	2578dea6 	mov	z6.h, #-11
  64:	2578c504 	mov	z4.h, #40
  68:	046630c1 	mov	z1.d, z6.d
  6c:	04643083 	mov	z3.d, z4.d
  70:	046530a2 	mov	z2.d, z5.d
  74:	046730e0 	mov	z0.d, z7.d
  78:	8b010424 	add	x4, x1, x1, lsl #1
  7c:	2518e3e7 	ptrue	p7.b
  80:	a420bc13 	ld1b	{z19.h}, p7/z, [x0]
  84:	cb040004 	sub	x4, x0, x4
  88:	a4215c91 	ld1b	{z17.h}, p7/z, [x4, x1]
  8c:	a420bc90 	ld1b	{z16.h}, p7/z, [x4]
  90:	8b010880 	add	x0, x4, x1, lsl #2
  94:	8b010087 	add	x7, x4, x1
  98:	a4205c35 	ld1b	{z21.h}, p7/z, [x1, x0]
  9c:	8b010485 	add	x5, x4, x1, lsl #1
  a0:	8b000024 	add	x4, x1, x0
  a4:	a4245c36 	ld1b	{z22.h}, p7/z, [x1, x4]
  a8:	8b010400 	add	x0, x0, x1, lsl #1
  ac:	a4205c37 	ld1b	{z23.h}, p7/z, [x1, x0]
  b0:	a4215cf2 	ld1b	{z18.h}, p7/z, [x7, x1]
  b4:	8b000024 	add	x4, x1, x0
  b8:	8b010400 	add	x0, x0, x1, lsl #1
  bc:	a4245c38 	ld1b	{z24.h}, p7/z, [x1, x4]
  c0:	a4205c39 	ld1b	{z25.h}, p7/z, [x1, x0]
  c4:	8b000024 	add	x4, x1, x0
  c8:	8b010400 	add	x0, x0, x1, lsl #1
  cc:	a4245c3a 	ld1b	{z26.h}, p7/z, [x1, x4]
  d0:	a4205c3b 	ld1b	{z27.h}, p7/z, [x1, x0]
  d4:	8b000024 	add	x4, x1, x0
  d8:	8b010400 	add	x0, x0, x1, lsl #1
  dc:	a4245c3c 	ld1b	{z28.h}, p7/z, [x1, x4]
  e0:	a4205c3d 	ld1b	{z29.h}, p7/z, [x1, x0]
  e4:	8b000024 	add	x4, x1, x0
  e8:	8b010400 	add	x0, x0, x1, lsl #1
  ec:	a4245c3e 	ld1b	{z30.h}, p7/z, [x1, x4]
  f0:	a4205c2e 	ld1b	{z14.h}, p7/z, [x1, x0]
  f4:	8b000024 	add	x4, x1, x0
  f8:	8b010400 	add	x0, x0, x1, lsl #1
  fc:	a4245c2d 	ld1b	{z13.h}, p7/z, [x1, x4]
 100:	a4205c2c 	ld1b	{z12.h}, p7/z, [x1, x0]
 104:	8b000024 	add	x4, x1, x0
 108:	8b010400 	add	x0, x0, x1, lsl #1
 10c:	a4245c2b 	ld1b	{z11.h}, p7/z, [x1, x4]
 110:	a4205c2a 	ld1b	{z10.h}, p7/z, [x1, x0]
 114:	8b000024 	add	x4, x1, x0
 118:	8b010400 	add	x0, x0, x1, lsl #1
 11c:	a4245c29 	ld1b	{z9.h}, p7/z, [x1, x4]
 120:	a4205c2f 	ld1b	{z15.h}, p7/z, [x1, x0]
 124:	8b000024 	add	x4, x1, x0
 128:	d37ff826 	lsl	x6, x1, #1
 12c:	a4245c3f 	ld1b	{z31.h}, p7/z, [x1, x4]
 130:	a4255cd4 	ld1b	{z20.h}, p7/z, [x6, x5]
 134:	910103e0 	add	x0, sp, #0x40
 138:	8b030041 	add	x1, x2, x3
 13c:	2561d01f 	sub	z31.h, z31.h, #128
 140:	e580401f 	str	z31, [x0]
 144:	2561d017 	sub	z23.h, z23.h, #128
 148:	2578e21f 	mov	z31.h, #4096
 14c:	2561d016 	sub	z22.h, z22.h, #128
 150:	2561d015 	sub	z21.h, z21.h, #128
 154:	2561d014 	sub	z20.h, z20.h, #128
 158:	8b030440 	add	x0, x2, x3, lsl #1
 15c:	2561d013 	sub	z19.h, z19.h, #128
 160:	2561d012 	sub	z18.h, z18.h, #128
 164:	2561d011 	sub	z17.h, z17.h, #128
 168:	2561d010 	sub	z16.h, z16.h, #128
 16c:	0420bfe8 	movprfx	z8, z31
 170:	04425e28 	mla	z8.h, p7/m, z17.h, z2.h
 174:	0440dff0 	mad	z16.h, p7/m, z0.h, z31.h
 178:	04435e68 	mla	z8.h, p7/m, z19.h, z3.h
 17c:	04415e50 	mla	z16.h, p7/m, z18.h, z1.h
 180:	04465ea8 	mla	z8.h, p7/m, z21.h, z6.h
 184:	04445e90 	mla	z16.h, p7/m, z20.h, z4.h
 188:	04475ee8 	mla	z8.h, p7/m, z23.h, z7.h
 18c:	04455ed0 	mla	z16.h, p7/m, z22.h, z5.h
 190:	04680210 	add	z16.h, z16.h, z8.h
 194:	452a0a10 	sqrshrunb	z16.b, z16.h, #6
 198:	05306a10 	uzp1	z16.b, z16.b, z16.b
 19c:	3d800050 	str	q16, [x2]
 1a0:	2561d018 	sub	z24.h, z24.h, #128
 1a4:	0420bff0 	movprfx	z16, z31
 1a8:	04425e50 	mla	z16.h, p7/m, z18.h, z2.h
 1ac:	0440dff1 	mad	z17.h, p7/m, z0.h, z31.h
 1b0:	04435e90 	mla	z16.h, p7/m, z20.h, z3.h
 1b4:	04415e71 	mla	z17.h, p7/m, z19.h, z1.h
 1b8:	04465ed0 	mla	z16.h, p7/m, z22.h, z6.h
 1bc:	04445eb1 	mla	z17.h, p7/m, z21.h, z4.h
 1c0:	04475f10 	mla	z16.h, p7/m, z24.h, z7.h
 1c4:	04455ef1 	mla	z17.h, p7/m, z23.h, z5.h
 1c8:	04700231 	add	z17.h, z17.h, z16.h
 1cc:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 1d0:	05316a31 	uzp1	z17.b, z17.b, z17.b
 1d4:	3ca36851 	str	q17, [x2, x3]
 1d8:	2561d019 	sub	z25.h, z25.h, #128
 1dc:	0420bff1 	movprfx	z17, z31
 1e0:	04425e71 	mla	z17.h, p7/m, z19.h, z2.h
 1e4:	0440dff2 	mad	z18.h, p7/m, z0.h, z31.h
 1e8:	04435eb1 	mla	z17.h, p7/m, z21.h, z3.h
 1ec:	04415e92 	mla	z18.h, p7/m, z20.h, z1.h
 1f0:	04465ef1 	mla	z17.h, p7/m, z23.h, z6.h
 1f4:	04445ed2 	mla	z18.h, p7/m, z22.h, z4.h
 1f8:	04475f31 	mla	z17.h, p7/m, z25.h, z7.h
 1fc:	04455f12 	mla	z18.h, p7/m, z24.h, z5.h
 200:	04710252 	add	z18.h, z18.h, z17.h
 204:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 208:	05326a52 	uzp1	z18.b, z18.b, z18.b
 20c:	3ca36832 	str	q18, [x1, x3]
 210:	8b000061 	add	x1, x3, x0
 214:	2561d01a 	sub	z26.h, z26.h, #128
 218:	0420bff2 	movprfx	z18, z31
 21c:	04425e92 	mla	z18.h, p7/m, z20.h, z2.h
 220:	0440dff3 	mad	z19.h, p7/m, z0.h, z31.h
 224:	04435ed2 	mla	z18.h, p7/m, z22.h, z3.h
 228:	04415eb3 	mla	z19.h, p7/m, z21.h, z1.h
 22c:	04465f12 	mla	z18.h, p7/m, z24.h, z6.h
 230:	04445ef3 	mla	z19.h, p7/m, z23.h, z4.h
 234:	04475f52 	mla	z18.h, p7/m, z26.h, z7.h
 238:	04455f33 	mla	z19.h, p7/m, z25.h, z5.h
 23c:	04720273 	add	z19.h, z19.h, z18.h
 240:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
 244:	05336a73 	uzp1	z19.b, z19.b, z19.b
 248:	3ca06873 	str	q19, [x3, x0]
 24c:	8b030400 	add	x0, x0, x3, lsl #1
 250:	2561d01b 	sub	z27.h, z27.h, #128
 254:	0420bff3 	movprfx	z19, z31
 258:	04425eb3 	mla	z19.h, p7/m, z21.h, z2.h
 25c:	0440dff4 	mad	z20.h, p7/m, z0.h, z31.h
 260:	04435ef3 	mla	z19.h, p7/m, z23.h, z3.h
 264:	04415ed4 	mla	z20.h, p7/m, z22.h, z1.h
 268:	04465f33 	mla	z19.h, p7/m, z25.h, z6.h
 26c:	04445f14 	mla	z20.h, p7/m, z24.h, z4.h
 270:	04475f73 	mla	z19.h, p7/m, z27.h, z7.h
 274:	04455f54 	mla	z20.h, p7/m, z26.h, z5.h
 278:	04730294 	add	z20.h, z20.h, z19.h
 27c:	452a0a94 	sqrshrunb	z20.b, z20.h, #6
 280:	05346a94 	uzp1	z20.b, z20.b, z20.b
 284:	3ca16874 	str	q20, [x3, x1]
 288:	8b000061 	add	x1, x3, x0
 28c:	2561d01c 	sub	z28.h, z28.h, #128
 290:	0420bff4 	movprfx	z20, z31
 294:	04425ed4 	mla	z20.h, p7/m, z22.h, z2.h
 298:	0440dff5 	mad	z21.h, p7/m, z0.h, z31.h
 29c:	04435f14 	mla	z20.h, p7/m, z24.h, z3.h
 2a0:	04415ef5 	mla	z21.h, p7/m, z23.h, z1.h
 2a4:	04465f54 	mla	z20.h, p7/m, z26.h, z6.h
 2a8:	04445f35 	mla	z21.h, p7/m, z25.h, z4.h
 2ac:	04475f94 	mla	z20.h, p7/m, z28.h, z7.h
 2b0:	04455f75 	mla	z21.h, p7/m, z27.h, z5.h
 2b4:	047402b5 	add	z21.h, z21.h, z20.h
 2b8:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
 2bc:	05356ab5 	uzp1	z21.b, z21.b, z21.b
 2c0:	3ca06875 	str	q21, [x3, x0]
 2c4:	8b030400 	add	x0, x0, x3, lsl #1
 2c8:	2561d01d 	sub	z29.h, z29.h, #128
 2cc:	0420bff5 	movprfx	z21, z31
 2d0:	04425ef5 	mla	z21.h, p7/m, z23.h, z2.h
 2d4:	0440dff6 	mad	z22.h, p7/m, z0.h, z31.h
 2d8:	04435f35 	mla	z21.h, p7/m, z25.h, z3.h
 2dc:	04415f16 	mla	z22.h, p7/m, z24.h, z1.h
 2e0:	04465f75 	mla	z21.h, p7/m, z27.h, z6.h
 2e4:	04445f56 	mla	z22.h, p7/m, z26.h, z4.h
 2e8:	04475fb5 	mla	z21.h, p7/m, z29.h, z7.h
 2ec:	04455f96 	mla	z22.h, p7/m, z28.h, z5.h
 2f0:	047502d6 	add	z22.h, z22.h, z21.h
 2f4:	452a0ad6 	sqrshrunb	z22.b, z22.h, #6
 2f8:	05366ad6 	uzp1	z22.b, z22.b, z22.b
 2fc:	3ca16876 	str	q22, [x3, x1]
 300:	8b000061 	add	x1, x3, x0
 304:	2561d01e 	sub	z30.h, z30.h, #128
 308:	0420bff6 	movprfx	z22, z31
 30c:	04425f16 	mla	z22.h, p7/m, z24.h, z2.h
 310:	0440dff7 	mad	z23.h, p7/m, z0.h, z31.h
 314:	04435f56 	mla	z22.h, p7/m, z26.h, z3.h
 318:	04415f37 	mla	z23.h, p7/m, z25.h, z1.h
 31c:	04465f96 	mla	z22.h, p7/m, z28.h, z6.h
 320:	04445f77 	mla	z23.h, p7/m, z27.h, z4.h
 324:	04475fd6 	mla	z22.h, p7/m, z30.h, z7.h
 328:	04455fb7 	mla	z23.h, p7/m, z29.h, z5.h
 32c:	047602f7 	add	z23.h, z23.h, z22.h
 330:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
 334:	05376af7 	uzp1	z23.b, z23.b, z23.b
 338:	3ca06877 	str	q23, [x3, x0]
 33c:	8b030400 	add	x0, x0, x3, lsl #1
 340:	2561d00e 	sub	z14.h, z14.h, #128
 344:	0420bff7 	movprfx	z23, z31
 348:	04425f37 	mla	z23.h, p7/m, z25.h, z2.h
 34c:	0440dff8 	mad	z24.h, p7/m, z0.h, z31.h
 350:	04435f77 	mla	z23.h, p7/m, z27.h, z3.h
 354:	04415f58 	mla	z24.h, p7/m, z26.h, z1.h
 358:	04465fb7 	mla	z23.h, p7/m, z29.h, z6.h
 35c:	04445f98 	mla	z24.h, p7/m, z28.h, z4.h
 360:	04475dd7 	mla	z23.h, p7/m, z14.h, z7.h
 364:	04455fd8 	mla	z24.h, p7/m, z30.h, z5.h
 368:	04770318 	add	z24.h, z24.h, z23.h
 36c:	452a0b18 	sqrshrunb	z24.b, z24.h, #6
 370:	05386b18 	uzp1	z24.b, z24.b, z24.b
 374:	3ca16878 	str	q24, [x3, x1]
 378:	8b000061 	add	x1, x3, x0
 37c:	2561d00d 	sub	z13.h, z13.h, #128
 380:	0420bff8 	movprfx	z24, z31
 384:	04425f58 	mla	z24.h, p7/m, z26.h, z2.h
 388:	0440dff9 	mad	z25.h, p7/m, z0.h, z31.h
 38c:	04435f98 	mla	z24.h, p7/m, z28.h, z3.h
 390:	04415f79 	mla	z25.h, p7/m, z27.h, z1.h
 394:	04465fd8 	mla	z24.h, p7/m, z30.h, z6.h
 398:	04445fb9 	mla	z25.h, p7/m, z29.h, z4.h
 39c:	04475db8 	mla	z24.h, p7/m, z13.h, z7.h
 3a0:	04455dd9 	mla	z25.h, p7/m, z14.h, z5.h
 3a4:	04780339 	add	z25.h, z25.h, z24.h
 3a8:	452a0b39 	sqrshrunb	z25.b, z25.h, #6
 3ac:	05396b39 	uzp1	z25.b, z25.b, z25.b
 3b0:	3ca06879 	str	q25, [x3, x0]
 3b4:	8b030400 	add	x0, x0, x3, lsl #1
 3b8:	2561d00c 	sub	z12.h, z12.h, #128
 3bc:	0420bff9 	movprfx	z25, z31
 3c0:	04425f79 	mla	z25.h, p7/m, z27.h, z2.h
 3c4:	0440dffa 	mad	z26.h, p7/m, z0.h, z31.h
 3c8:	04435fb9 	mla	z25.h, p7/m, z29.h, z3.h
 3cc:	04415f9a 	mla	z26.h, p7/m, z28.h, z1.h
 3d0:	04465dd9 	mla	z25.h, p7/m, z14.h, z6.h
 3d4:	04445fda 	mla	z26.h, p7/m, z30.h, z4.h
 3d8:	04475d99 	mla	z25.h, p7/m, z12.h, z7.h
 3dc:	04455dba 	mla	z26.h, p7/m, z13.h, z5.h
 3e0:	0479035a 	add	z26.h, z26.h, z25.h
 3e4:	452a0b5a 	sqrshrunb	z26.b, z26.h, #6
 3e8:	053a6b5a 	uzp1	z26.b, z26.b, z26.b
 3ec:	3ca1687a 	str	q26, [x3, x1]
 3f0:	8b000061 	add	x1, x3, x0
 3f4:	2561d00b 	sub	z11.h, z11.h, #128
 3f8:	0420bffa 	movprfx	z26, z31
 3fc:	04425f9a 	mla	z26.h, p7/m, z28.h, z2.h
 400:	0440dffb 	mad	z27.h, p7/m, z0.h, z31.h
 404:	04435fda 	mla	z26.h, p7/m, z30.h, z3.h
 408:	04415fbb 	mla	z27.h, p7/m, z29.h, z1.h
 40c:	04465dba 	mla	z26.h, p7/m, z13.h, z6.h
 410:	04445ddb 	mla	z27.h, p7/m, z14.h, z4.h
 414:	04475d7a 	mla	z26.h, p7/m, z11.h, z7.h
 418:	04455d9b 	mla	z27.h, p7/m, z12.h, z5.h
 41c:	047a037b 	add	z27.h, z27.h, z26.h
 420:	452a0b7b 	sqrshrunb	z27.b, z27.h, #6
 424:	053b6b7b 	uzp1	z27.b, z27.b, z27.b
 428:	3ca0687b 	str	q27, [x3, x0]
 42c:	8b030400 	add	x0, x0, x3, lsl #1
 430:	2561d00a 	sub	z10.h, z10.h, #128
 434:	0420bffb 	movprfx	z27, z31
 438:	04425fbb 	mla	z27.h, p7/m, z29.h, z2.h
 43c:	0440dffc 	mad	z28.h, p7/m, z0.h, z31.h
 440:	04435ddb 	mla	z27.h, p7/m, z14.h, z3.h
 444:	04415fdc 	mla	z28.h, p7/m, z30.h, z1.h
 448:	04465d9b 	mla	z27.h, p7/m, z12.h, z6.h
 44c:	04445dbc 	mla	z28.h, p7/m, z13.h, z4.h
 450:	04475d5b 	mla	z27.h, p7/m, z10.h, z7.h
 454:	04455d7c 	mla	z28.h, p7/m, z11.h, z5.h
 458:	047b039c 	add	z28.h, z28.h, z27.h
 45c:	452a0b9c 	sqrshrunb	z28.b, z28.h, #6
 460:	053c6b9c 	uzp1	z28.b, z28.b, z28.b
 464:	3ca1687c 	str	q28, [x3, x1]
 468:	8b000061 	add	x1, x3, x0
 46c:	0420bffc 	movprfx	z28, z31
 470:	04425fdc 	mla	z28.h, p7/m, z30.h, z2.h
 474:	2561d009 	sub	z9.h, z9.h, #128
 478:	0440dffd 	mad	z29.h, p7/m, z0.h, z31.h
 47c:	04435dbc 	mla	z28.h, p7/m, z13.h, z3.h
 480:	04415ddd 	mla	z29.h, p7/m, z14.h, z1.h
 484:	04465d7c 	mla	z28.h, p7/m, z11.h, z6.h
 488:	04445d9d 	mla	z29.h, p7/m, z12.h, z4.h
 48c:	04475d3c 	mla	z28.h, p7/m, z9.h, z7.h
 490:	04455d5d 	mla	z29.h, p7/m, z10.h, z5.h
 494:	047c03bd 	add	z29.h, z29.h, z28.h
 498:	452a0bbd 	sqrshrunb	z29.b, z29.h, #6
 49c:	053d6bbd 	uzp1	z29.b, z29.b, z29.b
 4a0:	3ca0687d 	str	q29, [x3, x0]
 4a4:	8b030400 	add	x0, x0, x3, lsl #1
 4a8:	0420bffd 	movprfx	z29, z31
 4ac:	04425ddd 	mla	z29.h, p7/m, z14.h, z2.h
 4b0:	0440dffe 	mad	z30.h, p7/m, z0.h, z31.h
 4b4:	04435d9d 	mla	z29.h, p7/m, z12.h, z3.h
 4b8:	04415dbe 	mla	z30.h, p7/m, z13.h, z1.h
 4bc:	04465d5d 	mla	z29.h, p7/m, z10.h, z6.h
 4c0:	04445d7e 	mla	z30.h, p7/m, z11.h, z4.h
 4c4:	2561d00f 	sub	z15.h, z15.h, #128
 4c8:	04455d3e 	mla	z30.h, p7/m, z9.h, z5.h
 4cc:	04475dfd 	mla	z29.h, p7/m, z15.h, z7.h
 4d0:	047d03de 	add	z30.h, z30.h, z29.h
 4d4:	452a0bde 	sqrshrunb	z30.b, z30.h, #6
 4d8:	053e6bde 	uzp1	z30.b, z30.b, z30.b
 4dc:	3ca1687e 	str	q30, [x3, x1]
 4e0:	0440dfee 	mad	z14.h, p7/m, z0.h, z31.h
 4e4:	0442dfed 	mad	z13.h, p7/m, z2.h, z31.h
 4e8:	0441ddcc 	mad	z12.h, p7/m, z1.h, z14.h
 4ec:	0443ddab 	mad	z11.h, p7/m, z3.h, z13.h
 4f0:	0444dd8a 	mad	z10.h, p7/m, z4.h, z12.h
 4f4:	0446dd69 	mad	z9.h, p7/m, z6.h, z11.h
 4f8:	910103e1 	add	x1, sp, #0x40
 4fc:	8580403f 	ldr	z31, [x1]
 500:	0445dd4f 	mad	z15.h, p7/m, z5.h, z10.h
 504:	0447dd3f 	mad	z31.h, p7/m, z7.h, z9.h
 508:	047f01ef 	add	z15.h, z15.h, z31.h
 50c:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
 510:	052f69ef 	uzp1	z15.b, z15.b, z15.b
 514:	3ca0686f 	str	q15, [x3, x0]
 518:	6d4027e8 	ldp	d8, d9, [sp]
 51c:	6d412fea 	ldp	d10, d11, [sp, #16]
 520:	6d4237ec 	ldp	d12, d13, [sp, #32]
 524:	6d433fee 	ldp	d14, d15, [sp, #48]
 528:	043f503f 	addvl	sp, sp, #1
 52c:	910103ff 	add	sp, sp, #0x40
 530:	d65f03c0 	ret
 534:	2f00e407 	movi	d7, #0x0
 538:	2578c025 	mov	z5.h, #1
 53c:	2578df66 	mov	z6.h, #-5
 540:	2578c224 	mov	z4.h, #17
 544:	2578c743 	mov	z3.h, #58
 548:	2578dec1 	mov	z1.h, #-10
 54c:	2578c082 	mov	z2.h, #4
 550:	2538dfe0 	mov	z0.b, #-1
 554:	17fffec9 	b	78 <dynopt_interp8_16x16_sve2_vpp+0x78>
