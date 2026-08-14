
kernels/interp8vpp-16/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_16x16_sve2_vpp>:
   0:	51000485 	sub	w5, w4, #0x1
   4:	710008bf 	cmp	w5, #0x2
   8:	540001c8 	b.hi	40 <dynopt_interp8_16x16_sve2_vpp+0x40>  // b.pmore
   c:	7100049f 	cmp	w4, #0x1
  10:	54002720 	b.eq	4f4 <dynopt_interp8_16x16_sve2_vpp+0x4f4>  // b.none
  14:	2538dfff 	mov	z31.b, #-1
  18:	2578c09e 	mov	z30.h, #4
  1c:	71000c9f 	cmp	w4, #0x3
  20:	54000141 	b.ne	48 <dynopt_interp8_16x16_sve2_vpp+0x48>  // b.any
  24:	2578dedd 	mov	z29.h, #-10
  28:	2578c75c 	mov	z28.h, #58
  2c:	2578c23b 	mov	z27.h, #17
  30:	2578df7a 	mov	z26.h, #-5
  34:	2578c039 	mov	z25.h, #1
  38:	2f00e418 	movi	d24, #0x0
  3c:	14000009 	b	60 <dynopt_interp8_16x16_sve2_vpp+0x60>
  40:	2538dfff 	mov	z31.b, #-1
  44:	2578c09e 	mov	z30.h, #4
  48:	2578debd 	mov	z29.h, #-11
  4c:	2578c51c 	mov	z28.h, #40
  50:	047f33f8 	mov	z24.d, z31.d
  54:	047e33d9 	mov	z25.d, z30.d
  58:	047d33ba 	mov	z26.d, z29.d
  5c:	047c339b 	mov	z27.d, z28.d
  60:	8b010425 	add	x5, x1, x1, lsl #1
  64:	2518e3e7 	ptrue	p7.b
  68:	8b030048 	add	x8, x2, x3
  6c:	cb050005 	sub	x5, x0, x5
  70:	2578e206 	mov	z6.h, #4096
  74:	a420bca0 	ld1b	{z0.h}, p7/z, [x5]
  78:	8b0108a6 	add	x6, x5, x1, lsl #2
  7c:	8b0100a7 	add	x7, x5, x1
  80:	a4215cf5 	ld1b	{z21.h}, p7/z, [x7, x1]
  84:	8b0104c4 	add	x4, x6, x1, lsl #1
  88:	8b0104a7 	add	x7, x5, x1, lsl #1
  8c:	a4245c30 	ld1b	{z16.h}, p7/z, [x1, x4]
  90:	a4265c32 	ld1b	{z18.h}, p7/z, [x1, x6]
  94:	a420bc14 	ld1b	{z20.h}, p7/z, [x0]
  98:	a4215cb6 	ld1b	{z22.h}, p7/z, [x5, x1]
  9c:	2561d010 	sub	z16.h, z16.h, #128
  a0:	2561d012 	sub	z18.h, z18.h, #128
  a4:	8b040020 	add	x0, x1, x4
  a8:	2561d014 	sub	z20.h, z20.h, #128
  ac:	a4205c24 	ld1b	{z4.h}, p7/z, [x1, x0]
  b0:	8b010484 	add	x4, x4, x1, lsl #1
  b4:	2561d015 	sub	z21.h, z21.h, #128
  b8:	d37ff829 	lsl	x9, x1, #1
  bc:	2561d016 	sub	z22.h, z22.h, #128
  c0:	a4275d33 	ld1b	{z19.h}, p7/z, [x9, x7]
  c4:	0420bcc1 	movprfx	z1, z6
  c8:	04595ec1 	mla	z1.h, p7/m, z22.h, z25.h
  cc:	2561d013 	sub	z19.h, z19.h, #128
  d0:	8b060027 	add	x7, x1, x6
  d4:	045b5e81 	mla	z1.h, p7/m, z20.h, z27.h
  d8:	a4275c31 	ld1b	{z17.h}, p7/z, [x1, x7]
  dc:	8b030446 	add	x6, x2, x3, lsl #1
  e0:	2561d011 	sub	z17.h, z17.h, #128
  e4:	045d5e41 	mla	z1.h, p7/m, z18.h, z29.h
  e8:	2561d000 	sub	z0.h, z0.h, #128
  ec:	045f5e01 	mla	z1.h, p7/m, z16.h, z31.h
  f0:	0458dcc0 	mad	z0.h, p7/m, z24.h, z6.h
  f4:	045a5ea0 	mla	z0.h, p7/m, z21.h, z26.h
  f8:	045c5e60 	mla	z0.h, p7/m, z19.h, z28.h
  fc:	045e5e20 	mla	z0.h, p7/m, z17.h, z30.h
 100:	04610001 	add	z1.h, z0.h, z1.h
 104:	452a0821 	sqrshrunb	z1.b, z1.h, #6
 108:	05216821 	uzp1	z1.b, z1.b, z1.b
 10c:	3d800041 	str	q1, [x2]
 110:	2561d004 	sub	z4.h, z4.h, #128
 114:	a4245c37 	ld1b	{z23.h}, p7/z, [x1, x4]
 118:	8b060067 	add	x7, x3, x6
 11c:	0420bcc3 	movprfx	z3, z6
 120:	04595ea3 	mla	z3.h, p7/m, z21.h, z25.h
 124:	0458dcd6 	mad	z22.h, p7/m, z24.h, z6.h
 128:	8b040020 	add	x0, x1, x4
 12c:	045a5e96 	mla	z22.h, p7/m, z20.h, z26.h
 130:	045b5e63 	mla	z3.h, p7/m, z19.h, z27.h
 134:	045c5e56 	mla	z22.h, p7/m, z18.h, z28.h
 138:	045d5e23 	mla	z3.h, p7/m, z17.h, z29.h
 13c:	045e5e16 	mla	z22.h, p7/m, z16.h, z30.h
 140:	045f5c83 	mla	z3.h, p7/m, z4.h, z31.h
 144:	046302c3 	add	z3.h, z22.h, z3.h
 148:	452a0863 	sqrshrunb	z3.b, z3.h, #6
 14c:	05236863 	uzp1	z3.b, z3.b, z3.b
 150:	3ca36843 	str	q3, [x2, x3]
 154:	2561d017 	sub	z23.h, z23.h, #128
 158:	a4205c22 	ld1b	{z2.h}, p7/z, [x1, x0]
 15c:	8b0304c5 	add	x5, x6, x3, lsl #1
 160:	0420bcc5 	movprfx	z5, z6
 164:	04595e85 	mla	z5.h, p7/m, z20.h, z25.h
 168:	8b010480 	add	x0, x4, x1, lsl #1
 16c:	045b5e45 	mla	z5.h, p7/m, z18.h, z27.h
 170:	0458dcd5 	mad	z21.h, p7/m, z24.h, z6.h
 174:	045d5e05 	mla	z5.h, p7/m, z16.h, z29.h
 178:	045a5e75 	mla	z21.h, p7/m, z19.h, z26.h
 17c:	045f5ee5 	mla	z5.h, p7/m, z23.h, z31.h
 180:	045c5e35 	mla	z21.h, p7/m, z17.h, z28.h
 184:	045e5c95 	mla	z21.h, p7/m, z4.h, z30.h
 188:	046502a5 	add	z5.h, z21.h, z5.h
 18c:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 190:	052568a5 	uzp1	z5.b, z5.b, z5.b
 194:	3ca36905 	str	q5, [x8, x3]
 198:	2561d002 	sub	z2.h, z2.h, #128
 19c:	a4205c20 	ld1b	{z0.h}, p7/z, [x1, x0]
 1a0:	8b050064 	add	x4, x3, x5
 1a4:	8b000022 	add	x2, x1, x0
 1a8:	0420bcc1 	movprfx	z1, z6
 1ac:	04595e61 	mla	z1.h, p7/m, z19.h, z25.h
 1b0:	0458dcd4 	mad	z20.h, p7/m, z24.h, z6.h
 1b4:	045b5e21 	mla	z1.h, p7/m, z17.h, z27.h
 1b8:	045a5e54 	mla	z20.h, p7/m, z18.h, z26.h
 1bc:	045d5c81 	mla	z1.h, p7/m, z4.h, z29.h
 1c0:	045c5e14 	mla	z20.h, p7/m, z16.h, z28.h
 1c4:	045f5c41 	mla	z1.h, p7/m, z2.h, z31.h
 1c8:	045e5ef4 	mla	z20.h, p7/m, z23.h, z30.h
 1cc:	04610281 	add	z1.h, z20.h, z1.h
 1d0:	452a0821 	sqrshrunb	z1.b, z1.h, #6
 1d4:	05216821 	uzp1	z1.b, z1.b, z1.b
 1d8:	3ca66861 	str	q1, [x3, x6]
 1dc:	2561d000 	sub	z0.h, z0.h, #128
 1e0:	a4225c23 	ld1b	{z3.h}, p7/z, [x1, x2]
 1e4:	8b010400 	add	x0, x0, x1, lsl #1
 1e8:	0420bcc5 	movprfx	z5, z6
 1ec:	04595e45 	mla	z5.h, p7/m, z18.h, z25.h
 1f0:	0458dcd3 	mad	z19.h, p7/m, z24.h, z6.h
 1f4:	8b0304a2 	add	x2, x5, x3, lsl #1
 1f8:	045a5e33 	mla	z19.h, p7/m, z17.h, z26.h
 1fc:	045b5e05 	mla	z5.h, p7/m, z16.h, z27.h
 200:	045c5c93 	mla	z19.h, p7/m, z4.h, z28.h
 204:	045d5ee5 	mla	z5.h, p7/m, z23.h, z29.h
 208:	045e5c53 	mla	z19.h, p7/m, z2.h, z30.h
 20c:	045f5c05 	mla	z5.h, p7/m, z0.h, z31.h
 210:	04650265 	add	z5.h, z19.h, z5.h
 214:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 218:	052568a5 	uzp1	z5.b, z5.b, z5.b
 21c:	3ca76865 	str	q5, [x3, x7]
 220:	2561d003 	sub	z3.h, z3.h, #128
 224:	a4205c21 	ld1b	{z1.h}, p7/z, [x1, x0]
 228:	8b020066 	add	x6, x3, x2
 22c:	0420bcc5 	movprfx	z5, z6
 230:	04595e25 	mla	z5.h, p7/m, z17.h, z25.h
 234:	0458dcd2 	mad	z18.h, p7/m, z24.h, z6.h
 238:	045b5c85 	mla	z5.h, p7/m, z4.h, z27.h
 23c:	045a5e12 	mla	z18.h, p7/m, z16.h, z26.h
 240:	045d5c45 	mla	z5.h, p7/m, z2.h, z29.h
 244:	045c5ef2 	mla	z18.h, p7/m, z23.h, z28.h
 248:	045f5c65 	mla	z5.h, p7/m, z3.h, z31.h
 24c:	045e5c12 	mla	z18.h, p7/m, z0.h, z30.h
 250:	04650245 	add	z5.h, z18.h, z5.h
 254:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 258:	052568a5 	uzp1	z5.b, z5.b, z5.b
 25c:	3ca56865 	str	q5, [x3, x5]
 260:	8b000025 	add	x5, x1, x0
 264:	2561d001 	sub	z1.h, z1.h, #128
 268:	a4255c32 	ld1b	{z18.h}, p7/z, [x1, x5]
 26c:	0420bcc5 	movprfx	z5, z6
 270:	04595e05 	mla	z5.h, p7/m, z16.h, z25.h
 274:	8b030445 	add	x5, x2, x3, lsl #1
 278:	045b5ee5 	mla	z5.h, p7/m, z23.h, z27.h
 27c:	0458dcd1 	mad	z17.h, p7/m, z24.h, z6.h
 280:	045d5c05 	mla	z5.h, p7/m, z0.h, z29.h
 284:	045a5c91 	mla	z17.h, p7/m, z4.h, z26.h
 288:	045f5c25 	mla	z5.h, p7/m, z1.h, z31.h
 28c:	045c5c51 	mla	z17.h, p7/m, z2.h, z28.h
 290:	045e5c71 	mla	z17.h, p7/m, z3.h, z30.h
 294:	04650225 	add	z5.h, z17.h, z5.h
 298:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 29c:	052568a5 	uzp1	z5.b, z5.b, z5.b
 2a0:	3ca46865 	str	q5, [x3, x4]
 2a4:	2561d012 	sub	z18.h, z18.h, #128
 2a8:	8b0304a4 	add	x4, x5, x3, lsl #1
 2ac:	0420bcc5 	movprfx	z5, z6
 2b0:	04595c85 	mla	z5.h, p7/m, z4.h, z25.h
 2b4:	8b010400 	add	x0, x0, x1, lsl #1
 2b8:	8b050068 	add	x8, x3, x5
 2bc:	a4205c31 	ld1b	{z17.h}, p7/z, [x1, x0]
 2c0:	045b5c45 	mla	z5.h, p7/m, z2.h, z27.h
 2c4:	0458dcd0 	mad	z16.h, p7/m, z24.h, z6.h
 2c8:	045d5c65 	mla	z5.h, p7/m, z3.h, z29.h
 2cc:	045a5ef0 	mla	z16.h, p7/m, z23.h, z26.h
 2d0:	045f5e45 	mla	z5.h, p7/m, z18.h, z31.h
 2d4:	045c5c10 	mla	z16.h, p7/m, z0.h, z28.h
 2d8:	045e5c30 	mla	z16.h, p7/m, z1.h, z30.h
 2dc:	04650205 	add	z5.h, z16.h, z5.h
 2e0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 2e4:	052568a5 	uzp1	z5.b, z5.b, z5.b
 2e8:	3ca26865 	str	q5, [x3, x2]
 2ec:	2561d011 	sub	z17.h, z17.h, #128
 2f0:	8b000022 	add	x2, x1, x0
 2f4:	0420bcc5 	movprfx	z5, z6
 2f8:	04595ee5 	mla	z5.h, p7/m, z23.h, z25.h
 2fc:	a4225c30 	ld1b	{z16.h}, p7/z, [x1, x2]
 300:	045b5c05 	mla	z5.h, p7/m, z0.h, z27.h
 304:	8b040067 	add	x7, x3, x4
 308:	045d5c25 	mla	z5.h, p7/m, z1.h, z29.h
 30c:	0458dcc4 	mad	z4.h, p7/m, z24.h, z6.h
 310:	045f5e25 	mla	z5.h, p7/m, z17.h, z31.h
 314:	045a5c44 	mla	z4.h, p7/m, z2.h, z26.h
 318:	045c5c64 	mla	z4.h, p7/m, z3.h, z28.h
 31c:	045e5e44 	mla	z4.h, p7/m, z18.h, z30.h
 320:	04650085 	add	z5.h, z4.h, z5.h
 324:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 328:	052568a5 	uzp1	z5.b, z5.b, z5.b
 32c:	3ca66865 	str	q5, [x3, x6]
 330:	2561d010 	sub	z16.h, z16.h, #128
 334:	8b010400 	add	x0, x0, x1, lsl #1
 338:	0420bcc4 	movprfx	z4, z6
 33c:	04595c44 	mla	z4.h, p7/m, z2.h, z25.h
 340:	a4205c27 	ld1b	{z7.h}, p7/z, [x1, x0]
 344:	8b030482 	add	x2, x4, x3, lsl #1
 348:	045b5c64 	mla	z4.h, p7/m, z3.h, z27.h
 34c:	0458dcd7 	mad	z23.h, p7/m, z24.h, z6.h
 350:	045d5e44 	mla	z4.h, p7/m, z18.h, z29.h
 354:	045a5c17 	mla	z23.h, p7/m, z0.h, z26.h
 358:	045f5e04 	mla	z4.h, p7/m, z16.h, z31.h
 35c:	045c5c37 	mla	z23.h, p7/m, z1.h, z28.h
 360:	045e5e37 	mla	z23.h, p7/m, z17.h, z30.h
 364:	046402e4 	add	z4.h, z23.h, z4.h
 368:	452a0884 	sqrshrunb	z4.b, z4.h, #6
 36c:	05246884 	uzp1	z4.b, z4.b, z4.b
 370:	3ca56864 	str	q4, [x3, x5]
 374:	2561d007 	sub	z7.h, z7.h, #128
 378:	8b000025 	add	x5, x1, x0
 37c:	0420bcc5 	movprfx	z5, z6
 380:	04595c05 	mla	z5.h, p7/m, z0.h, z25.h
 384:	a4255c37 	ld1b	{z23.h}, p7/z, [x1, x5]
 388:	8b010400 	add	x0, x0, x1, lsl #1
 38c:	045b5c25 	mla	z5.h, p7/m, z1.h, z27.h
 390:	8b020066 	add	x6, x3, x2
 394:	045d5e25 	mla	z5.h, p7/m, z17.h, z29.h
 398:	0458dcc2 	mad	z2.h, p7/m, z24.h, z6.h
 39c:	045f5ce5 	mla	z5.h, p7/m, z7.h, z31.h
 3a0:	045a5c62 	mla	z2.h, p7/m, z3.h, z26.h
 3a4:	045c5e42 	mla	z2.h, p7/m, z18.h, z28.h
 3a8:	045e5e02 	mla	z2.h, p7/m, z16.h, z30.h
 3ac:	04650045 	add	z5.h, z2.h, z5.h
 3b0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 3b4:	052568a5 	uzp1	z5.b, z5.b, z5.b
 3b8:	3ca86865 	str	q5, [x3, x8]
 3bc:	2561d017 	sub	z23.h, z23.h, #128
 3c0:	a4205c36 	ld1b	{z22.h}, p7/z, [x1, x0]
 3c4:	8b000028 	add	x8, x1, x0
 3c8:	2561d016 	sub	z22.h, z22.h, #128
 3cc:	0420bcc4 	movprfx	z4, z6
 3d0:	04595c64 	mla	z4.h, p7/m, z3.h, z25.h
 3d4:	0420bcc2 	movprfx	z2, z6
 3d8:	04595c22 	mla	z2.h, p7/m, z1.h, z25.h
 3dc:	045b5e44 	mla	z4.h, p7/m, z18.h, z27.h
 3e0:	045b5e22 	mla	z2.h, p7/m, z17.h, z27.h
 3e4:	045d5e04 	mla	z4.h, p7/m, z16.h, z29.h
 3e8:	8b030445 	add	x5, x2, x3, lsl #1
 3ec:	0458dcc0 	mad	z0.h, p7/m, z24.h, z6.h
 3f0:	0458dcc3 	mad	z3.h, p7/m, z24.h, z6.h
 3f4:	045a5c20 	mla	z0.h, p7/m, z1.h, z26.h
 3f8:	045a5e43 	mla	z3.h, p7/m, z18.h, z26.h
 3fc:	045c5e20 	mla	z0.h, p7/m, z17.h, z28.h
 400:	045c5e03 	mla	z3.h, p7/m, z16.h, z28.h
 404:	045e5ce0 	mla	z0.h, p7/m, z7.h, z30.h
 408:	045f5ee4 	mla	z4.h, p7/m, z23.h, z31.h
 40c:	045e5ee3 	mla	z3.h, p7/m, z23.h, z30.h
 410:	04640004 	add	z4.h, z0.h, z4.h
 414:	045d5ce2 	mla	z2.h, p7/m, z7.h, z29.h
 418:	452a0884 	sqrshrunb	z4.b, z4.h, #6
 41c:	045f5ec2 	mla	z2.h, p7/m, z22.h, z31.h
 420:	05246884 	uzp1	z4.b, z4.b, z4.b
 424:	04620062 	add	z2.h, z3.h, z2.h
 428:	452a0842 	sqrshrunb	z2.b, z2.h, #6
 42c:	05226842 	uzp1	z2.b, z2.b, z2.b
 430:	3ca46864 	str	q4, [x3, x4]
 434:	a4285c35 	ld1b	{z21.h}, p7/z, [x1, x8]
 438:	8b010400 	add	x0, x0, x1, lsl #1
 43c:	2561d015 	sub	z21.h, z21.h, #128
 440:	0420bcc0 	movprfx	z0, z6
 444:	04595e40 	mla	z0.h, p7/m, z18.h, z25.h
 448:	0458dcc1 	mad	z1.h, p7/m, z24.h, z6.h
 44c:	3ca76862 	str	q2, [x3, x7]
 450:	045a5e21 	mla	z1.h, p7/m, z17.h, z26.h
 454:	a4205c34 	ld1b	{z20.h}, p7/z, [x1, x0]
 458:	045b5e00 	mla	z0.h, p7/m, z16.h, z27.h
 45c:	045c5ce1 	mla	z1.h, p7/m, z7.h, z28.h
 460:	045d5ee0 	mla	z0.h, p7/m, z23.h, z29.h
 464:	045e5ec1 	mla	z1.h, p7/m, z22.h, z30.h
 468:	045f5ea0 	mla	z0.h, p7/m, z21.h, z31.h
 46c:	04600020 	add	z0.h, z1.h, z0.h
 470:	452a0800 	sqrshrunb	z0.b, z0.h, #6
 474:	05206800 	uzp1	z0.b, z0.b, z0.b
 478:	3ca26860 	str	q0, [x3, x2]
 47c:	0420bcc5 	movprfx	z5, z6
 480:	04595e25 	mla	z5.h, p7/m, z17.h, z25.h
 484:	2561d014 	sub	z20.h, z20.h, #128
 488:	8b000020 	add	x0, x1, x0
 48c:	0458dcd2 	mad	z18.h, p7/m, z24.h, z6.h
 490:	a4205c33 	ld1b	{z19.h}, p7/z, [x1, x0]
 494:	045a5e12 	mla	z18.h, p7/m, z16.h, z26.h
 498:	045b5ce5 	mla	z5.h, p7/m, z7.h, z27.h
 49c:	045c5ef2 	mla	z18.h, p7/m, z23.h, z28.h
 4a0:	045d5ec5 	mla	z5.h, p7/m, z22.h, z29.h
 4a4:	045e5eb2 	mla	z18.h, p7/m, z21.h, z30.h
 4a8:	045f5e85 	mla	z5.h, p7/m, z20.h, z31.h
 4ac:	04650245 	add	z5.h, z18.h, z5.h
 4b0:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
 4b4:	052568a5 	uzp1	z5.b, z5.b, z5.b
 4b8:	3ca66865 	str	q5, [x3, x6]
 4bc:	0459dcd0 	mad	z16.h, p7/m, z25.h, z6.h
 4c0:	0458dcd1 	mad	z17.h, p7/m, z24.h, z6.h
 4c4:	045b5ef0 	mla	z16.h, p7/m, z23.h, z27.h
 4c8:	045a5cf1 	mla	z17.h, p7/m, z7.h, z26.h
 4cc:	045d5eb0 	mla	z16.h, p7/m, z21.h, z29.h
 4d0:	045c5ed1 	mla	z17.h, p7/m, z22.h, z28.h
 4d4:	2561d013 	sub	z19.h, z19.h, #128
 4d8:	045e5e91 	mla	z17.h, p7/m, z20.h, z30.h
 4dc:	045f5e70 	mla	z16.h, p7/m, z19.h, z31.h
 4e0:	04700230 	add	z16.h, z17.h, z16.h
 4e4:	452a0a10 	sqrshrunb	z16.b, z16.h, #6
 4e8:	05306a10 	uzp1	z16.b, z16.b, z16.b
 4ec:	3ca56870 	str	q16, [x3, x5]
 4f0:	d65f03c0 	ret
 4f4:	2f00e41f 	movi	d31, #0x0
 4f8:	2578c03e 	mov	z30.h, #1
 4fc:	2578df7d 	mov	z29.h, #-5
 500:	2578c23c 	mov	z28.h, #17
 504:	2578c75b 	mov	z27.h, #58
 508:	2578deda 	mov	z26.h, #-10
 50c:	2578c099 	mov	z25.h, #4
 510:	2538dff8 	mov	z24.b, #-1
 514:	17fffed3 	b	60 <dynopt_interp8_16x16_sve2_vpp+0x60>
