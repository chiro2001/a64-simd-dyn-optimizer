
kernels/interp8vpp-32/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_32x32_sve2_vpp>:
       0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
       4:	51000485 	sub	w5, w4, #0x1
       8:	910003fd 	mov	x29, sp
       c:	a90153f3 	stp	x19, x20, [sp, #16]
      10:	a9025bf5 	stp	x21, x22, [sp, #32]
      14:	a90363f7 	stp	x23, x24, [sp, #48]
      18:	6d0437ec 	stp	d12, d13, [sp, #64]
      1c:	6d053fee 	stp	d14, d15, [sp, #80]
      20:	710008bf 	cmp	w5, #0x2
      24:	540001c8 	b.hi	5c <dynopt_interp8_32x32_sve2_vpp+0x5c>  // b.pmore
      28:	7100049f 	cmp	w4, #0x1
      2c:	54009680 	b.eq	12fc <dynopt_interp8_32x32_sve2_vpp+0x12fc>  // b.none
      30:	2538dfff 	mov	z31.b, #-1
      34:	2578c09e 	mov	z30.h, #4
      38:	71000c9f 	cmp	w4, #0x3
      3c:	54000141 	b.ne	64 <dynopt_interp8_32x32_sve2_vpp+0x64>  // b.any
      40:	2578dedd 	mov	z29.h, #-10
      44:	2578c75c 	mov	z28.h, #58
      48:	2578c23b 	mov	z27.h, #17
      4c:	2578df7a 	mov	z26.h, #-5
      50:	2578c039 	mov	z25.h, #1
      54:	2f00e418 	movi	d24, #0x0
      58:	14000009 	b	7c <dynopt_interp8_32x32_sve2_vpp+0x7c>
      5c:	2538dfff 	mov	z31.b, #-1
      60:	2578c09e 	mov	z30.h, #4
      64:	2578debd 	mov	z29.h, #-11
      68:	2578c51c 	mov	z28.h, #40
      6c:	047d33ba 	mov	z26.d, z29.d
      70:	047c339b 	mov	z27.d, z28.d
      74:	047e33d9 	mov	z25.d, z30.d
      78:	047f33f8 	mov	z24.d, z31.d
      7c:	8b01042f 	add	x15, x1, x1, lsl #1
      80:	d37ff824 	lsl	x4, x1, #1
      84:	2518e3e7 	ptrue	p7.b
      88:	cb0f0006 	sub	x6, x0, x15
      8c:	a420bc11 	ld1b	{z17.h}, p7/z, [x0]
      90:	d37ef429 	lsl	x9, x1, #2
      94:	91004084 	add	x4, x4, #0x10
      98:	91004000 	add	x0, x0, #0x10
      9c:	a4245cd2 	ld1b	{z18.h}, p7/z, [x6, x4]
      a0:	a420bc10 	ld1b	{z16.h}, p7/z, [x0]
      a4:	91004124 	add	x4, x9, #0x10
      a8:	8b0108c0 	add	x0, x6, x1, lsl #2
      ac:	a4245cc6 	ld1b	{z6.h}, p7/z, [x6, x4]
      b0:	8b010004 	add	x4, x0, x1
      b4:	a4245c23 	ld1b	{z3.h}, p7/z, [x1, x4]
      b8:	d37ff9e4 	lsl	x4, x15, #1
      bc:	a4215c05 	ld1b	{z5.h}, p7/z, [x0, x1]
      c0:	91004027 	add	x7, x1, #0x10
      c4:	8b010400 	add	x0, x0, x1, lsl #1
      c8:	91004084 	add	x4, x4, #0x10
      cc:	a4275cd4 	ld1b	{z20.h}, p7/z, [x6, x7]
      d0:	a4245cc2 	ld1b	{z2.h}, p7/z, [x6, x4]
      d4:	d37df027 	lsl	x7, x1, #3
      d8:	8b000024 	add	x4, x1, x0
      dc:	910040c5 	add	x5, x6, #0x10
      e0:	a4245c2f 	ld1b	{z15.h}, p7/z, [x1, x4]
      e4:	a420bcb6 	ld1b	{z22.h}, p7/z, [x5]
      e8:	a4295cc7 	ld1b	{z7.h}, p7/z, [x6, x9]
      ec:	cb0100ee 	sub	x14, x7, x1
      f0:	8b010129 	add	x9, x9, x1
      f4:	8b0100c5 	add	x5, x6, x1
      f8:	910040e4 	add	x4, x7, #0x10
      fc:	2578e20d 	mov	z13.h, #4096
     100:	8b0100e7 	add	x7, x7, x1
     104:	a4215cb3 	ld1b	{z19.h}, p7/z, [x5, x1]
     108:	a4245cce 	ld1b	{z14.h}, p7/z, [x6, x4]
     10c:	a420bcd7 	ld1b	{z23.h}, p7/z, [x6]
     110:	2561d003 	sub	z3.h, z3.h, #128
     114:	2561d002 	sub	z2.h, z2.h, #128
     118:	2561d007 	sub	z7.h, z7.h, #128
     11c:	2561d006 	sub	z6.h, z6.h, #128
     120:	91004125 	add	x5, x9, #0x10
     124:	910040e4 	add	x4, x7, #0x10
     128:	2561d013 	sub	z19.h, z19.h, #128
     12c:	2561d012 	sub	z18.h, z18.h, #128
     130:	2561d017 	sub	z23.h, z23.h, #128
     134:	2561d016 	sub	z22.h, z22.h, #128
     138:	0458ddb7 	mad	z23.h, p7/m, z24.h, z13.h
     13c:	0458ddb6 	mad	z22.h, p7/m, z24.h, z13.h
     140:	045a5e77 	mla	z23.h, p7/m, z19.h, z26.h
     144:	045a5e56 	mla	z22.h, p7/m, z18.h, z26.h
     148:	045c5cf7 	mla	z23.h, p7/m, z7.h, z28.h
     14c:	045c5cd6 	mla	z22.h, p7/m, z6.h, z28.h
     150:	045e5c77 	mla	z23.h, p7/m, z3.h, z30.h
     154:	045e5c56 	mla	z22.h, p7/m, z2.h, z30.h
     158:	a4205c21 	ld1b	{z1.h}, p7/z, [x1, x0]
     15c:	a4215cd5 	ld1b	{z21.h}, p7/z, [x6, x1]
     160:	a4255cc4 	ld1b	{z4.h}, p7/z, [x6, x5]
     164:	2561d001 	sub	z1.h, z1.h, #128
     168:	2561d005 	sub	z5.h, z5.h, #128
     16c:	2561d004 	sub	z4.h, z4.h, #128
     170:	2561d011 	sub	z17.h, z17.h, #128
     174:	2561d010 	sub	z16.h, z16.h, #128
     178:	910041c5 	add	x5, x14, #0x10
     17c:	2561d015 	sub	z21.h, z21.h, #128
     180:	a4255cc0 	ld1b	{z0.h}, p7/z, [x6, x5]
     184:	0420bdac 	movprfx	z12, z13
     188:	04595eac 	mla	z12.h, p7/m, z21.h, z25.h
     18c:	2561d000 	sub	z0.h, z0.h, #128
     190:	045b5e2c 	mla	z12.h, p7/m, z17.h, z27.h
     194:	2561d014 	sub	z20.h, z20.h, #128
     198:	045d5cac 	mla	z12.h, p7/m, z5.h, z29.h
     19c:	045f5c2c 	mla	z12.h, p7/m, z1.h, z31.h
     1a0:	046c02ec 	add	z12.h, z23.h, z12.h
     1a4:	0420bdb7 	movprfx	z23, z13
     1a8:	04595e97 	mla	z23.h, p7/m, z20.h, z25.h
     1ac:	452a098c 	sqrshrunb	z12.b, z12.h, #6
     1b0:	045b5e17 	mla	z23.h, p7/m, z16.h, z27.h
     1b4:	052c698c 	uzp1	z12.b, z12.b, z12.b
     1b8:	045d5c97 	mla	z23.h, p7/m, z4.h, z29.h
     1bc:	045f5c17 	mla	z23.h, p7/m, z0.h, z31.h
     1c0:	047702d7 	add	z23.h, z22.h, z23.h
     1c4:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     1c8:	05376af7 	uzp1	z23.b, z23.b, z23.b
     1cc:	ad005c4c 	stp	q12, q23, [x2]
     1d0:	a4245cd6 	ld1b	{z22.h}, p7/z, [x6, x4]
     1d4:	8b030044 	add	x4, x2, x3
     1d8:	2561d00f 	sub	z15.h, z15.h, #128
     1dc:	0420bdb7 	movprfx	z23, z13
     1e0:	04595e77 	mla	z23.h, p7/m, z19.h, z25.h
     1e4:	8b010400 	add	x0, x0, x1, lsl #1
     1e8:	d37ff930 	lsl	x16, x9, #1
     1ec:	a4205c2c 	ld1b	{z12.h}, p7/z, [x1, x0]
     1f0:	8b000025 	add	x5, x1, x0
     1f4:	0458ddb5 	mad	z21.h, p7/m, z24.h, z13.h
     1f8:	045b5cf7 	mla	z23.h, p7/m, z7.h, z27.h
     1fc:	045a5e35 	mla	z21.h, p7/m, z17.h, z26.h
     200:	045d5c77 	mla	z23.h, p7/m, z3.h, z29.h
     204:	045c5cb5 	mla	z21.h, p7/m, z5.h, z28.h
     208:	045f5df7 	mla	z23.h, p7/m, z15.h, z31.h
     20c:	045e5c35 	mla	z21.h, p7/m, z1.h, z30.h
     210:	047702b7 	add	z23.h, z21.h, z23.h
     214:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     218:	05376af7 	uzp1	z23.b, z23.b, z23.b
     21c:	3ca36857 	str	q23, [x2, x3]
     220:	2561d00e 	sub	z14.h, z14.h, #128
     224:	0420bdb5 	movprfx	z21, z13
     228:	04595e55 	mla	z21.h, p7/m, z18.h, z25.h
     22c:	0458ddb4 	mad	z20.h, p7/m, z24.h, z13.h
     230:	045b5cd5 	mla	z21.h, p7/m, z6.h, z27.h
     234:	045a5e14 	mla	z20.h, p7/m, z16.h, z26.h
     238:	045d5c55 	mla	z21.h, p7/m, z2.h, z29.h
     23c:	045c5c94 	mla	z20.h, p7/m, z4.h, z28.h
     240:	045f5dd5 	mla	z21.h, p7/m, z14.h, z31.h
     244:	045e5c14 	mla	z20.h, p7/m, z0.h, z30.h
     248:	04750295 	add	z21.h, z20.h, z21.h
     24c:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     250:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     254:	3d800495 	str	q21, [x4, #16]
     258:	a4255c37 	ld1b	{z23.h}, p7/z, [x1, x5]
     25c:	91004205 	add	x5, x16, #0x10
     260:	a4255cd4 	ld1b	{z20.h}, p7/z, [x6, x5]
     264:	8b030445 	add	x5, x2, x3, lsl #1
     268:	2561d00c 	sub	z12.h, z12.h, #128
     26c:	8b03008a 	add	x10, x4, x3
     270:	0420bdb5 	movprfx	z21, z13
     274:	04595e35 	mla	z21.h, p7/m, z17.h, z25.h
     278:	0458ddb3 	mad	z19.h, p7/m, z24.h, z13.h
     27c:	045b5cb5 	mla	z21.h, p7/m, z5.h, z27.h
     280:	045a5cf3 	mla	z19.h, p7/m, z7.h, z26.h
     284:	045d5c35 	mla	z21.h, p7/m, z1.h, z29.h
     288:	045c5c73 	mla	z19.h, p7/m, z3.h, z28.h
     28c:	045f5d95 	mla	z21.h, p7/m, z12.h, z31.h
     290:	045e5df3 	mla	z19.h, p7/m, z15.h, z30.h
     294:	04750275 	add	z21.h, z19.h, z21.h
     298:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     29c:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     2a0:	3ca36895 	str	q21, [x4, x3]
     2a4:	2561d016 	sub	z22.h, z22.h, #128
     2a8:	0420bdb3 	movprfx	z19, z13
     2ac:	04595e13 	mla	z19.h, p7/m, z16.h, z25.h
     2b0:	8b010210 	add	x16, x16, x1
     2b4:	0458ddb2 	mad	z18.h, p7/m, z24.h, z13.h
     2b8:	045b5c93 	mla	z19.h, p7/m, z4.h, z27.h
     2bc:	045a5cd2 	mla	z18.h, p7/m, z6.h, z26.h
     2c0:	045d5c13 	mla	z19.h, p7/m, z0.h, z29.h
     2c4:	045c5c52 	mla	z18.h, p7/m, z2.h, z28.h
     2c8:	045f5ed3 	mla	z19.h, p7/m, z22.h, z31.h
     2cc:	045e5dd2 	mla	z18.h, p7/m, z14.h, z30.h
     2d0:	04730253 	add	z19.h, z18.h, z19.h
     2d4:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     2d8:	05336a73 	uzp1	z19.b, z19.b, z19.b
     2dc:	3d8004b3 	str	q19, [x5, #16]
     2e0:	2561d017 	sub	z23.h, z23.h, #128
     2e4:	8b010400 	add	x0, x0, x1, lsl #1
     2e8:	0420bdb3 	movprfx	z19, z13
     2ec:	04595cf3 	mla	z19.h, p7/m, z7.h, z25.h
     2f0:	a4205c35 	ld1b	{z21.h}, p7/z, [x1, x0]
     2f4:	91004205 	add	x5, x16, #0x10
     2f8:	0458ddb1 	mad	z17.h, p7/m, z24.h, z13.h
     2fc:	a4255cd2 	ld1b	{z18.h}, p7/z, [x6, x5]
     300:	045a5cb1 	mla	z17.h, p7/m, z5.h, z26.h
     304:	045b5c73 	mla	z19.h, p7/m, z3.h, z27.h
     308:	045c5c31 	mla	z17.h, p7/m, z1.h, z28.h
     30c:	045d5df3 	mla	z19.h, p7/m, z15.h, z29.h
     310:	045e5d91 	mla	z17.h, p7/m, z12.h, z30.h
     314:	045f5ef3 	mla	z19.h, p7/m, z23.h, z31.h
     318:	04730233 	add	z19.h, z17.h, z19.h
     31c:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     320:	05336a73 	uzp1	z19.b, z19.b, z19.b
     324:	3caa6873 	str	q19, [x3, x10]
     328:	8b03046a 	add	x10, x3, x3, lsl #1
     32c:	8b030485 	add	x5, x4, x3, lsl #1
     330:	2561d014 	sub	z20.h, z20.h, #128
     334:	0420bdb1 	movprfx	z17, z13
     338:	04595cd1 	mla	z17.h, p7/m, z6.h, z25.h
     33c:	8b0a0044 	add	x4, x2, x10
     340:	d37ef5f3 	lsl	x19, x15, #2
     344:	0458ddb0 	mad	z16.h, p7/m, z24.h, z13.h
     348:	045b5c51 	mla	z17.h, p7/m, z2.h, z27.h
     34c:	045a5c90 	mla	z16.h, p7/m, z4.h, z26.h
     350:	045d5dd1 	mla	z17.h, p7/m, z14.h, z29.h
     354:	045c5c10 	mla	z16.h, p7/m, z0.h, z28.h
     358:	045f5e91 	mla	z17.h, p7/m, z20.h, z31.h
     35c:	045e5ed0 	mla	z16.h, p7/m, z22.h, z30.h
     360:	04710211 	add	z17.h, z16.h, z17.h
     364:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     368:	05316a31 	uzp1	z17.b, z17.b, z17.b
     36c:	3d800491 	str	q17, [x4, #16]
     370:	91004264 	add	x4, x19, #0x10
     374:	2561d015 	sub	z21.h, z21.h, #128
     378:	8b000028 	add	x8, x1, x0
     37c:	a4285c33 	ld1b	{z19.h}, p7/z, [x1, x8]
     380:	a4245cd0 	ld1b	{z16.h}, p7/z, [x6, x4]
     384:	8b030844 	add	x4, x2, x3, lsl #2
     388:	8b050068 	add	x8, x3, x5
     38c:	0420bdb1 	movprfx	z17, z13
     390:	04595cb1 	mla	z17.h, p7/m, z5.h, z25.h
     394:	0458dda7 	mad	z7.h, p7/m, z24.h, z13.h
     398:	045b5c31 	mla	z17.h, p7/m, z1.h, z27.h
     39c:	045a5c67 	mla	z7.h, p7/m, z3.h, z26.h
     3a0:	045d5d91 	mla	z17.h, p7/m, z12.h, z29.h
     3a4:	045c5de7 	mla	z7.h, p7/m, z15.h, z28.h
     3a8:	045f5eb1 	mla	z17.h, p7/m, z21.h, z31.h
     3ac:	045e5ee7 	mla	z7.h, p7/m, z23.h, z30.h
     3b0:	047100f1 	add	z17.h, z7.h, z17.h
     3b4:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     3b8:	05316a31 	uzp1	z17.b, z17.b, z17.b
     3bc:	3ca56871 	str	q17, [x3, x5]
     3c0:	2561d012 	sub	z18.h, z18.h, #128
     3c4:	8b03086c 	add	x12, x3, x3, lsl #2
     3c8:	0420bda7 	movprfx	z7, z13
     3cc:	04595c87 	mla	z7.h, p7/m, z4.h, z25.h
     3d0:	0458dda6 	mad	z6.h, p7/m, z24.h, z13.h
     3d4:	8b010273 	add	x19, x19, x1
     3d8:	045a5c46 	mla	z6.h, p7/m, z2.h, z26.h
     3dc:	045b5c07 	mla	z7.h, p7/m, z0.h, z27.h
     3e0:	045c5dc6 	mla	z6.h, p7/m, z14.h, z28.h
     3e4:	045d5ec7 	mla	z7.h, p7/m, z22.h, z29.h
     3e8:	045e5e86 	mla	z6.h, p7/m, z20.h, z30.h
     3ec:	045f5e47 	mla	z7.h, p7/m, z18.h, z31.h
     3f0:	046700c7 	add	z7.h, z6.h, z7.h
     3f4:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     3f8:	052768e7 	uzp1	z7.b, z7.b, z7.b
     3fc:	3d800487 	str	q7, [x4, #16]
     400:	2561d013 	sub	z19.h, z19.h, #128
     404:	8b010400 	add	x0, x0, x1, lsl #1
     408:	0420bda7 	movprfx	z7, z13
     40c:	04595c67 	mla	z7.h, p7/m, z3.h, z25.h
     410:	a4205c31 	ld1b	{z17.h}, p7/z, [x1, x0]
     414:	9100426b 	add	x11, x19, #0x10
     418:	0458dda5 	mad	z5.h, p7/m, z24.h, z13.h
     41c:	a42b5cc6 	ld1b	{z6.h}, p7/z, [x6, x11]
     420:	045a5c25 	mla	z5.h, p7/m, z1.h, z26.h
     424:	045b5de7 	mla	z7.h, p7/m, z15.h, z27.h
     428:	045c5d85 	mla	z5.h, p7/m, z12.h, z28.h
     42c:	045d5ee7 	mla	z7.h, p7/m, z23.h, z29.h
     430:	045e5ea5 	mla	z5.h, p7/m, z21.h, z30.h
     434:	045f5e67 	mla	z7.h, p7/m, z19.h, z31.h
     438:	046700a7 	add	z7.h, z5.h, z7.h
     43c:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     440:	052768e7 	uzp1	z7.b, z7.b, z7.b
     444:	3ca86867 	str	q7, [x3, x8]
     448:	8b0c0048 	add	x8, x2, x12
     44c:	2561d010 	sub	z16.h, z16.h, #128
     450:	8b000024 	add	x4, x1, x0
     454:	0420bda5 	movprfx	z5, z13
     458:	04595c45 	mla	z5.h, p7/m, z2.h, z25.h
     45c:	0458dda4 	mad	z4.h, p7/m, z24.h, z13.h
     460:	045b5dc5 	mla	z5.h, p7/m, z14.h, z27.h
     464:	045a5c04 	mla	z4.h, p7/m, z0.h, z26.h
     468:	045d5e85 	mla	z5.h, p7/m, z20.h, z29.h
     46c:	045c5ec4 	mla	z4.h, p7/m, z22.h, z28.h
     470:	045f5e05 	mla	z5.h, p7/m, z16.h, z31.h
     474:	045e5e44 	mla	z4.h, p7/m, z18.h, z30.h
     478:	04650085 	add	z5.h, z4.h, z5.h
     47c:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
     480:	052568a5 	uzp1	z5.b, z5.b, z5.b
     484:	3d800505 	str	q5, [x8, #16]
     488:	a4245c27 	ld1b	{z7.h}, p7/z, [x1, x4]
     48c:	d37ff9c4 	lsl	x4, x14, #1
     490:	8b0304a5 	add	x5, x5, x3, lsl #1
     494:	2561d011 	sub	z17.h, z17.h, #128
     498:	0420bda5 	movprfx	z5, z13
     49c:	04595c25 	mla	z5.h, p7/m, z1.h, z25.h
     4a0:	91004084 	add	x4, x4, #0x10
     4a4:	a4245cc4 	ld1b	{z4.h}, p7/z, [x6, x4]
     4a8:	8b05006b 	add	x11, x3, x5
     4ac:	8b0a0444 	add	x4, x2, x10, lsl #1
     4b0:	d37cec28 	lsl	x8, x1, #4
     4b4:	0458dda3 	mad	z3.h, p7/m, z24.h, z13.h
     4b8:	045b5d85 	mla	z5.h, p7/m, z12.h, z27.h
     4bc:	045a5de3 	mla	z3.h, p7/m, z15.h, z26.h
     4c0:	045d5ea5 	mla	z5.h, p7/m, z21.h, z29.h
     4c4:	045c5ee3 	mla	z3.h, p7/m, z23.h, z28.h
     4c8:	045f5e25 	mla	z5.h, p7/m, z17.h, z31.h
     4cc:	045e5e63 	mla	z3.h, p7/m, z19.h, z30.h
     4d0:	04650065 	add	z5.h, z3.h, z5.h
     4d4:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
     4d8:	052568a5 	uzp1	z5.b, z5.b, z5.b
     4dc:	3ca56865 	str	q5, [x3, x5]
     4e0:	2561d006 	sub	z6.h, z6.h, #128
     4e4:	d37df074 	lsl	x20, x3, #3
     4e8:	cb010112 	sub	x18, x8, x1
     4ec:	0420bda3 	movprfx	z3, z13
     4f0:	04595c03 	mla	z3.h, p7/m, z0.h, z25.h
     4f4:	0458dda2 	mad	z2.h, p7/m, z24.h, z13.h
     4f8:	045b5ec3 	mla	z3.h, p7/m, z22.h, z27.h
     4fc:	045a5dc2 	mla	z2.h, p7/m, z14.h, z26.h
     500:	045d5e43 	mla	z3.h, p7/m, z18.h, z29.h
     504:	045c5e82 	mla	z2.h, p7/m, z20.h, z28.h
     508:	045f5cc3 	mla	z3.h, p7/m, z6.h, z31.h
     50c:	045e5e02 	mla	z2.h, p7/m, z16.h, z30.h
     510:	04630043 	add	z3.h, z2.h, z3.h
     514:	452a0863 	sqrshrunb	z3.b, z3.h, #6
     518:	05236863 	uzp1	z3.b, z3.b, z3.b
     51c:	3d800483 	str	q3, [x4, #16]
     520:	2561d007 	sub	z7.h, z7.h, #128
     524:	8b010400 	add	x0, x0, x1, lsl #1
     528:	0420bda3 	movprfx	z3, z13
     52c:	04595de3 	mla	z3.h, p7/m, z15.h, z25.h
     530:	a4205c25 	ld1b	{z5.h}, p7/z, [x1, x0]
     534:	9100424d 	add	x13, x18, #0x10
     538:	0458dda1 	mad	z1.h, p7/m, z24.h, z13.h
     53c:	a42d5cc2 	ld1b	{z2.h}, p7/z, [x6, x13]
     540:	045a5d81 	mla	z1.h, p7/m, z12.h, z26.h
     544:	045b5ee3 	mla	z3.h, p7/m, z23.h, z27.h
     548:	045c5ea1 	mla	z1.h, p7/m, z21.h, z28.h
     54c:	045d5e63 	mla	z3.h, p7/m, z19.h, z29.h
     550:	045e5e21 	mla	z1.h, p7/m, z17.h, z30.h
     554:	045f5ce3 	mla	z3.h, p7/m, z7.h, z31.h
     558:	04630023 	add	z3.h, z1.h, z3.h
     55c:	452a0863 	sqrshrunb	z3.b, z3.h, #6
     560:	05236863 	uzp1	z3.b, z3.b, z3.b
     564:	3cab6863 	str	q3, [x3, x11]
     568:	cb03028b 	sub	x11, x20, x3
     56c:	2561d004 	sub	z4.h, z4.h, #128
     570:	0420bda1 	movprfx	z1, z13
     574:	04595dc1 	mla	z1.h, p7/m, z14.h, z25.h
     578:	8b0b004d 	add	x13, x2, x11
     57c:	8b000024 	add	x4, x1, x0
     580:	0458dda0 	mad	z0.h, p7/m, z24.h, z13.h
     584:	8b0304a5 	add	x5, x5, x3, lsl #1
     588:	045a5ec0 	mla	z0.h, p7/m, z22.h, z26.h
     58c:	045b5e81 	mla	z1.h, p7/m, z20.h, z27.h
     590:	045c5e40 	mla	z0.h, p7/m, z18.h, z28.h
     594:	045d5e01 	mla	z1.h, p7/m, z16.h, z29.h
     598:	045e5cc0 	mla	z0.h, p7/m, z6.h, z30.h
     59c:	045f5c81 	mla	z1.h, p7/m, z4.h, z31.h
     5a0:	04610001 	add	z1.h, z0.h, z1.h
     5a4:	452a0821 	sqrshrunb	z1.b, z1.h, #6
     5a8:	05216821 	uzp1	z1.b, z1.b, z1.b
     5ac:	3d8005a1 	str	q1, [x13, #16]
     5b0:	a4245c23 	ld1b	{z3.h}, p7/z, [x1, x4]
     5b4:	91004104 	add	x4, x8, #0x10
     5b8:	a4245cc0 	ld1b	{z0.h}, p7/z, [x6, x4]
     5bc:	2561d005 	sub	z5.h, z5.h, #128
     5c0:	8b140044 	add	x4, x2, x20
     5c4:	8b05006d 	add	x13, x3, x5
     5c8:	0420bda1 	movprfx	z1, z13
     5cc:	04595d81 	mla	z1.h, p7/m, z12.h, z25.h
     5d0:	0458ddaf 	mad	z15.h, p7/m, z24.h, z13.h
     5d4:	045b5ea1 	mla	z1.h, p7/m, z21.h, z27.h
     5d8:	045a5eef 	mla	z15.h, p7/m, z23.h, z26.h
     5dc:	045d5e21 	mla	z1.h, p7/m, z17.h, z29.h
     5e0:	045c5e6f 	mla	z15.h, p7/m, z19.h, z28.h
     5e4:	045f5ca1 	mla	z1.h, p7/m, z5.h, z31.h
     5e8:	045e5cef 	mla	z15.h, p7/m, z7.h, z30.h
     5ec:	046101e1 	add	z1.h, z15.h, z1.h
     5f0:	452a0821 	sqrshrunb	z1.b, z1.h, #6
     5f4:	05216821 	uzp1	z1.b, z1.b, z1.b
     5f8:	3ca56861 	str	q1, [x3, x5]
     5fc:	2561d002 	sub	z2.h, z2.h, #128
     600:	8b030294 	add	x20, x20, x3
     604:	0420bdaf 	movprfx	z15, z13
     608:	04595ecf 	mla	z15.h, p7/m, z22.h, z25.h
     60c:	0458ddae 	mad	z14.h, p7/m, z24.h, z13.h
     610:	8b010108 	add	x8, x8, x1
     614:	045a5e8e 	mla	z14.h, p7/m, z20.h, z26.h
     618:	045b5e4f 	mla	z15.h, p7/m, z18.h, z27.h
     61c:	045c5e0e 	mla	z14.h, p7/m, z16.h, z28.h
     620:	045d5ccf 	mla	z15.h, p7/m, z6.h, z29.h
     624:	045e5c8e 	mla	z14.h, p7/m, z4.h, z30.h
     628:	045f5c4f 	mla	z15.h, p7/m, z2.h, z31.h
     62c:	046f01cf 	add	z15.h, z14.h, z15.h
     630:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
     634:	052f69ef 	uzp1	z15.b, z15.b, z15.b
     638:	3d80048f 	str	q15, [x4, #16]
     63c:	2561d003 	sub	z3.h, z3.h, #128
     640:	8b010400 	add	x0, x0, x1, lsl #1
     644:	0420bdaf 	movprfx	z15, z13
     648:	04595eef 	mla	z15.h, p7/m, z23.h, z25.h
     64c:	a4205c21 	ld1b	{z1.h}, p7/z, [x1, x0]
     650:	91004111 	add	x17, x8, #0x10
     654:	0458ddac 	mad	z12.h, p7/m, z24.h, z13.h
     658:	a4315cce 	ld1b	{z14.h}, p7/z, [x6, x17]
     65c:	045a5eac 	mla	z12.h, p7/m, z21.h, z26.h
     660:	045b5e6f 	mla	z15.h, p7/m, z19.h, z27.h
     664:	045c5e2c 	mla	z12.h, p7/m, z17.h, z28.h
     668:	045d5cef 	mla	z15.h, p7/m, z7.h, z29.h
     66c:	045e5cac 	mla	z12.h, p7/m, z5.h, z30.h
     670:	045f5c6f 	mla	z15.h, p7/m, z3.h, z31.h
     674:	046f018f 	add	z15.h, z12.h, z15.h
     678:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
     67c:	052f69ef 	uzp1	z15.b, z15.b, z15.b
     680:	3cad686f 	str	q15, [x3, x13]
     684:	8b14004d 	add	x13, x2, x20
     688:	2561d000 	sub	z0.h, z0.h, #128
     68c:	8b000024 	add	x4, x1, x0
     690:	0420bdac 	movprfx	z12, z13
     694:	04595e8c 	mla	z12.h, p7/m, z20.h, z25.h
     698:	0458ddb6 	mad	z22.h, p7/m, z24.h, z13.h
     69c:	045b5e0c 	mla	z12.h, p7/m, z16.h, z27.h
     6a0:	045a5e56 	mla	z22.h, p7/m, z18.h, z26.h
     6a4:	045d5c8c 	mla	z12.h, p7/m, z4.h, z29.h
     6a8:	045c5cd6 	mla	z22.h, p7/m, z6.h, z28.h
     6ac:	045f5c0c 	mla	z12.h, p7/m, z0.h, z31.h
     6b0:	045e5c56 	mla	z22.h, p7/m, z2.h, z30.h
     6b4:	046c02cc 	add	z12.h, z22.h, z12.h
     6b8:	452a098c 	sqrshrunb	z12.b, z12.h, #6
     6bc:	052c698c 	uzp1	z12.b, z12.b, z12.b
     6c0:	3d8005ac 	str	q12, [x13, #16]
     6c4:	d37ff8ed 	lsl	x13, x7, #1
     6c8:	a4245c2f 	ld1b	{z15.h}, p7/z, [x1, x4]
     6cc:	8b0304a5 	add	x5, x5, x3, lsl #1
     6d0:	2561d001 	sub	z1.h, z1.h, #128
     6d4:	0420bdac 	movprfx	z12, z13
     6d8:	04595eac 	mla	z12.h, p7/m, z21.h, z25.h
     6dc:	910041a4 	add	x4, x13, #0x10
     6e0:	a4245cd6 	ld1b	{z22.h}, p7/z, [x6, x4]
     6e4:	8b050071 	add	x17, x3, x5
     6e8:	8b0c0444 	add	x4, x2, x12, lsl #1
     6ec:	0458ddb7 	mad	z23.h, p7/m, z24.h, z13.h
     6f0:	045b5e2c 	mla	z12.h, p7/m, z17.h, z27.h
     6f4:	045a5e77 	mla	z23.h, p7/m, z19.h, z26.h
     6f8:	045d5cac 	mla	z12.h, p7/m, z5.h, z29.h
     6fc:	045c5cf7 	mla	z23.h, p7/m, z7.h, z28.h
     700:	045f5c2c 	mla	z12.h, p7/m, z1.h, z31.h
     704:	045e5c77 	mla	z23.h, p7/m, z3.h, z30.h
     708:	046c02ec 	add	z12.h, z23.h, z12.h
     70c:	452a098c 	sqrshrunb	z12.b, z12.h, #6
     710:	052c698c 	uzp1	z12.b, z12.b, z12.b
     714:	3ca5686c 	str	q12, [x3, x5]
     718:	2561d00e 	sub	z14.h, z14.h, #128
     71c:	8b0c047e 	add	x30, x3, x12, lsl #1
     720:	0420bdb7 	movprfx	z23, z13
     724:	04595e57 	mla	z23.h, p7/m, z18.h, z25.h
     728:	8b0101ad 	add	x13, x13, x1
     72c:	0458ddb4 	mad	z20.h, p7/m, z24.h, z13.h
     730:	045b5cd7 	mla	z23.h, p7/m, z6.h, z27.h
     734:	045a5e14 	mla	z20.h, p7/m, z16.h, z26.h
     738:	045d5c57 	mla	z23.h, p7/m, z2.h, z29.h
     73c:	045c5c94 	mla	z20.h, p7/m, z4.h, z28.h
     740:	045f5dd7 	mla	z23.h, p7/m, z14.h, z31.h
     744:	045e5c14 	mla	z20.h, p7/m, z0.h, z30.h
     748:	04770297 	add	z23.h, z20.h, z23.h
     74c:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     750:	05376af7 	uzp1	z23.b, z23.b, z23.b
     754:	3d800497 	str	q23, [x4, #16]
     758:	2561d00f 	sub	z15.h, z15.h, #128
     75c:	8b010400 	add	x0, x0, x1, lsl #1
     760:	0420bdb7 	movprfx	z23, z13
     764:	04595e77 	mla	z23.h, p7/m, z19.h, z25.h
     768:	a4205c2c 	ld1b	{z12.h}, p7/z, [x1, x0]
     76c:	910041b5 	add	x21, x13, #0x10
     770:	0458ddb5 	mad	z21.h, p7/m, z24.h, z13.h
     774:	a4355cd4 	ld1b	{z20.h}, p7/z, [x6, x21]
     778:	045a5e35 	mla	z21.h, p7/m, z17.h, z26.h
     77c:	045b5cf7 	mla	z23.h, p7/m, z7.h, z27.h
     780:	045c5cb5 	mla	z21.h, p7/m, z5.h, z28.h
     784:	045d5c77 	mla	z23.h, p7/m, z3.h, z29.h
     788:	045e5c35 	mla	z21.h, p7/m, z1.h, z30.h
     78c:	045f5df7 	mla	z23.h, p7/m, z15.h, z31.h
     790:	047702b7 	add	z23.h, z21.h, z23.h
     794:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     798:	05376af7 	uzp1	z23.b, z23.b, z23.b
     79c:	3cb16877 	str	q23, [x3, x17]
     7a0:	8b1e0051 	add	x17, x2, x30
     7a4:	d37ef537 	lsl	x23, x9, #2
     7a8:	2561d016 	sub	z22.h, z22.h, #128
     7ac:	0420bdb5 	movprfx	z21, z13
     7b0:	04595e15 	mla	z21.h, p7/m, z16.h, z25.h
     7b4:	8b000024 	add	x4, x1, x0
     7b8:	8b0304a5 	add	x5, x5, x3, lsl #1
     7bc:	0458ddb2 	mad	z18.h, p7/m, z24.h, z13.h
     7c0:	045b5c95 	mla	z21.h, p7/m, z4.h, z27.h
     7c4:	045a5cd2 	mla	z18.h, p7/m, z6.h, z26.h
     7c8:	045d5c15 	mla	z21.h, p7/m, z0.h, z29.h
     7cc:	045c5c52 	mla	z18.h, p7/m, z2.h, z28.h
     7d0:	045f5ed5 	mla	z21.h, p7/m, z22.h, z31.h
     7d4:	045e5dd2 	mla	z18.h, p7/m, z14.h, z30.h
     7d8:	04750255 	add	z21.h, z18.h, z21.h
     7dc:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     7e0:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     7e4:	3d800635 	str	q21, [x17, #16]
     7e8:	a4245c37 	ld1b	{z23.h}, p7/z, [x1, x4]
     7ec:	910042e4 	add	x4, x23, #0x10
     7f0:	a4245cd2 	ld1b	{z18.h}, p7/z, [x6, x4]
     7f4:	8b0a0844 	add	x4, x2, x10, lsl #2
     7f8:	2561d00c 	sub	z12.h, z12.h, #128
     7fc:	8b050071 	add	x17, x3, x5
     800:	0420bdb5 	movprfx	z21, z13
     804:	04595e35 	mla	z21.h, p7/m, z17.h, z25.h
     808:	0458ddb3 	mad	z19.h, p7/m, z24.h, z13.h
     80c:	045b5cb5 	mla	z21.h, p7/m, z5.h, z27.h
     810:	045a5cf3 	mla	z19.h, p7/m, z7.h, z26.h
     814:	045d5c35 	mla	z21.h, p7/m, z1.h, z29.h
     818:	045c5c73 	mla	z19.h, p7/m, z3.h, z28.h
     81c:	045f5d95 	mla	z21.h, p7/m, z12.h, z31.h
     820:	045e5df3 	mla	z19.h, p7/m, z15.h, z30.h
     824:	04750275 	add	z21.h, z19.h, z21.h
     828:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     82c:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     830:	3ca56875 	str	q21, [x3, x5]
     834:	2561d014 	sub	z20.h, z20.h, #128
     838:	0420bdb3 	movprfx	z19, z13
     83c:	04595cd3 	mla	z19.h, p7/m, z6.h, z25.h
     840:	0458ddb0 	mad	z16.h, p7/m, z24.h, z13.h
     844:	045b5c53 	mla	z19.h, p7/m, z2.h, z27.h
     848:	045a5c90 	mla	z16.h, p7/m, z4.h, z26.h
     84c:	045d5dd3 	mla	z19.h, p7/m, z14.h, z29.h
     850:	045c5c10 	mla	z16.h, p7/m, z0.h, z28.h
     854:	045f5e93 	mla	z19.h, p7/m, z20.h, z31.h
     858:	045e5ed0 	mla	z16.h, p7/m, z22.h, z30.h
     85c:	04730213 	add	z19.h, z16.h, z19.h
     860:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     864:	05336a73 	uzp1	z19.b, z19.b, z19.b
     868:	3d800493 	str	q19, [x4, #16]
     86c:	8b0102e4 	add	x4, x23, x1
     870:	2561d017 	sub	z23.h, z23.h, #128
     874:	8b010400 	add	x0, x0, x1, lsl #1
     878:	0420bdb3 	movprfx	z19, z13
     87c:	04595cf3 	mla	z19.h, p7/m, z7.h, z25.h
     880:	a4205c35 	ld1b	{z21.h}, p7/z, [x1, x0]
     884:	0458ddb1 	mad	z17.h, p7/m, z24.h, z13.h
     888:	045b5c73 	mla	z19.h, p7/m, z3.h, z27.h
     88c:	045a5cb1 	mla	z17.h, p7/m, z5.h, z26.h
     890:	045d5df3 	mla	z19.h, p7/m, z15.h, z29.h
     894:	045c5c31 	mla	z17.h, p7/m, z1.h, z28.h
     898:	045f5ef3 	mla	z19.h, p7/m, z23.h, z31.h
     89c:	045e5d91 	mla	z17.h, p7/m, z12.h, z30.h
     8a0:	91004084 	add	x4, x4, #0x10
     8a4:	04730233 	add	z19.h, z17.h, z19.h
     8a8:	a4245cd0 	ld1b	{z16.h}, p7/z, [x6, x4]
     8ac:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     8b0:	05336a73 	uzp1	z19.b, z19.b, z19.b
     8b4:	3cb16873 	str	q19, [x3, x17]
     8b8:	8b0a0871 	add	x17, x3, x10, lsl #2
     8bc:	8b110044 	add	x4, x2, x17
     8c0:	2561d012 	sub	z18.h, z18.h, #128
     8c4:	0420bdb1 	movprfx	z17, z13
     8c8:	04595c91 	mla	z17.h, p7/m, z4.h, z25.h
     8cc:	8b0304a5 	add	x5, x5, x3, lsl #1
     8d0:	0458dda6 	mad	z6.h, p7/m, z24.h, z13.h
     8d4:	045b5c11 	mla	z17.h, p7/m, z0.h, z27.h
     8d8:	045a5c46 	mla	z6.h, p7/m, z2.h, z26.h
     8dc:	045d5ed1 	mla	z17.h, p7/m, z22.h, z29.h
     8e0:	045c5dc6 	mla	z6.h, p7/m, z14.h, z28.h
     8e4:	045f5e51 	mla	z17.h, p7/m, z18.h, z31.h
     8e8:	045e5e86 	mla	z6.h, p7/m, z20.h, z30.h
     8ec:	047100d1 	add	z17.h, z6.h, z17.h
     8f0:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     8f4:	05316a31 	uzp1	z17.b, z17.b, z17.b
     8f8:	3d800491 	str	q17, [x4, #16]
     8fc:	8b0b0444 	add	x4, x2, x11, lsl #1
     900:	2561d015 	sub	z21.h, z21.h, #128
     904:	0420bdb1 	movprfx	z17, z13
     908:	04595cb1 	mla	z17.h, p7/m, z5.h, z25.h
     90c:	8b000035 	add	x21, x1, x0
     910:	d37ffa10 	lsl	x16, x16, #1
     914:	a4355c33 	ld1b	{z19.h}, p7/z, [x1, x21]
     918:	0458dda7 	mad	z7.h, p7/m, z24.h, z13.h
     91c:	d37df1f5 	lsl	x21, x15, #3
     920:	045a5c67 	mla	z7.h, p7/m, z3.h, z26.h
     924:	045b5c31 	mla	z17.h, p7/m, z1.h, z27.h
     928:	045c5de7 	mla	z7.h, p7/m, z15.h, z28.h
     92c:	045d5d91 	mla	z17.h, p7/m, z12.h, z29.h
     930:	045e5ee7 	mla	z7.h, p7/m, z23.h, z30.h
     934:	045f5eb1 	mla	z17.h, p7/m, z21.h, z31.h
     938:	91004210 	add	x16, x16, #0x10
     93c:	047100f1 	add	z17.h, z7.h, z17.h
     940:	a4305cc6 	ld1b	{z6.h}, p7/z, [x6, x16]
     944:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     948:	05316a31 	uzp1	z17.b, z17.b, z17.b
     94c:	3ca56871 	str	q17, [x3, x5]
     950:	2561d010 	sub	z16.h, z16.h, #128
     954:	8b050070 	add	x16, x3, x5
     958:	0420bda7 	movprfx	z7, z13
     95c:	04595c47 	mla	z7.h, p7/m, z2.h, z25.h
     960:	0458dda4 	mad	z4.h, p7/m, z24.h, z13.h
     964:	045b5dc7 	mla	z7.h, p7/m, z14.h, z27.h
     968:	045a5c04 	mla	z4.h, p7/m, z0.h, z26.h
     96c:	045d5e87 	mla	z7.h, p7/m, z20.h, z29.h
     970:	045c5ec4 	mla	z4.h, p7/m, z22.h, z28.h
     974:	045f5e07 	mla	z7.h, p7/m, z16.h, z31.h
     978:	045e5e44 	mla	z4.h, p7/m, z18.h, z30.h
     97c:	04670087 	add	z7.h, z4.h, z7.h
     980:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     984:	052768e7 	uzp1	z7.b, z7.b, z7.b
     988:	3d800487 	str	q7, [x4, #16]
     98c:	cb0102a4 	sub	x4, x21, x1
     990:	2561d013 	sub	z19.h, z19.h, #128
     994:	91004084 	add	x4, x4, #0x10
     998:	a4245cc4 	ld1b	{z4.h}, p7/z, [x6, x4]
     99c:	0420bda7 	movprfx	z7, z13
     9a0:	04595c67 	mla	z7.h, p7/m, z3.h, z25.h
     9a4:	d37cec64 	lsl	x4, x3, #4
     9a8:	8b010400 	add	x0, x0, x1, lsl #1
     9ac:	0458dda5 	mad	z5.h, p7/m, z24.h, z13.h
     9b0:	a4205c31 	ld1b	{z17.h}, p7/z, [x1, x0]
     9b4:	045a5c25 	mla	z5.h, p7/m, z1.h, z26.h
     9b8:	045b5de7 	mla	z7.h, p7/m, z15.h, z27.h
     9bc:	045c5d85 	mla	z5.h, p7/m, z12.h, z28.h
     9c0:	045d5ee7 	mla	z7.h, p7/m, z23.h, z29.h
     9c4:	045e5ea5 	mla	z5.h, p7/m, z21.h, z30.h
     9c8:	045f5e67 	mla	z7.h, p7/m, z19.h, z31.h
     9cc:	046700a7 	add	z7.h, z5.h, z7.h
     9d0:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     9d4:	052768e7 	uzp1	z7.b, z7.b, z7.b
     9d8:	3cb06867 	str	q7, [x3, x16]
     9dc:	cb030090 	sub	x16, x4, x3
     9e0:	8b100058 	add	x24, x2, x16
     9e4:	2561d006 	sub	z6.h, z6.h, #128
     9e8:	0420bda5 	movprfx	z5, z13
     9ec:	04595c05 	mla	z5.h, p7/m, z0.h, z25.h
     9f0:	8b000036 	add	x22, x1, x0
     9f4:	8b0304a5 	add	x5, x5, x3, lsl #1
     9f8:	0458dda2 	mad	z2.h, p7/m, z24.h, z13.h
     9fc:	045b5ec5 	mla	z5.h, p7/m, z22.h, z27.h
     a00:	045a5dc2 	mla	z2.h, p7/m, z14.h, z26.h
     a04:	045d5e45 	mla	z5.h, p7/m, z18.h, z29.h
     a08:	045c5e82 	mla	z2.h, p7/m, z20.h, z28.h
     a0c:	045f5cc5 	mla	z5.h, p7/m, z6.h, z31.h
     a10:	045e5e02 	mla	z2.h, p7/m, z16.h, z30.h
     a14:	04650045 	add	z5.h, z2.h, z5.h
     a18:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
     a1c:	052568a5 	uzp1	z5.b, z5.b, z5.b
     a20:	3d800705 	str	q5, [x24, #16]
     a24:	a4365c27 	ld1b	{z7.h}, p7/z, [x1, x22]
     a28:	910042b6 	add	x22, x21, #0x10
     a2c:	a4365cc2 	ld1b	{z2.h}, p7/z, [x6, x22]
     a30:	8b040056 	add	x22, x2, x4
     a34:	2561d011 	sub	z17.h, z17.h, #128
     a38:	8b050078 	add	x24, x3, x5
     a3c:	8b030084 	add	x4, x4, x3
     a40:	0420bda5 	movprfx	z5, z13
     a44:	04595c25 	mla	z5.h, p7/m, z1.h, z25.h
     a48:	8b040044 	add	x4, x2, x4
     a4c:	0458dda3 	mad	z3.h, p7/m, z24.h, z13.h
     a50:	045b5d85 	mla	z5.h, p7/m, z12.h, z27.h
     a54:	045a5de3 	mla	z3.h, p7/m, z15.h, z26.h
     a58:	045d5ea5 	mla	z5.h, p7/m, z21.h, z29.h
     a5c:	045c5ee3 	mla	z3.h, p7/m, z23.h, z28.h
     a60:	045f5e25 	mla	z5.h, p7/m, z17.h, z31.h
     a64:	045e5e63 	mla	z3.h, p7/m, z19.h, z30.h
     a68:	04650065 	add	z5.h, z3.h, z5.h
     a6c:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
     a70:	052568a5 	uzp1	z5.b, z5.b, z5.b
     a74:	3ca56865 	str	q5, [x3, x5]
     a78:	2561d004 	sub	z4.h, z4.h, #128
     a7c:	0420bda3 	movprfx	z3, z13
     a80:	04595dc3 	mla	z3.h, p7/m, z14.h, z25.h
     a84:	0458dda0 	mad	z0.h, p7/m, z24.h, z13.h
     a88:	045b5e83 	mla	z3.h, p7/m, z20.h, z27.h
     a8c:	045a5ec0 	mla	z0.h, p7/m, z22.h, z26.h
     a90:	045d5e03 	mla	z3.h, p7/m, z16.h, z29.h
     a94:	045c5e40 	mla	z0.h, p7/m, z18.h, z28.h
     a98:	045f5c83 	mla	z3.h, p7/m, z4.h, z31.h
     a9c:	045e5cc0 	mla	z0.h, p7/m, z6.h, z30.h
     aa0:	8b170129 	add	x9, x9, x23
     aa4:	04630003 	add	z3.h, z0.h, z3.h
     aa8:	452a0863 	sqrshrunb	z3.b, z3.h, #6
     aac:	05236863 	uzp1	z3.b, z3.b, z3.b
     ab0:	3d8006c3 	str	q3, [x22, #16]
     ab4:	2561d007 	sub	z7.h, z7.h, #128
     ab8:	8b010400 	add	x0, x0, x1, lsl #1
     abc:	0420bda3 	movprfx	z3, z13
     ac0:	04595de3 	mla	z3.h, p7/m, z15.h, z25.h
     ac4:	a4205c25 	ld1b	{z5.h}, p7/z, [x1, x0]
     ac8:	8b0304a5 	add	x5, x5, x3, lsl #1
     acc:	0458dda1 	mad	z1.h, p7/m, z24.h, z13.h
     ad0:	045b5ee3 	mla	z3.h, p7/m, z23.h, z27.h
     ad4:	045a5d81 	mla	z1.h, p7/m, z12.h, z26.h
     ad8:	045d5e63 	mla	z3.h, p7/m, z19.h, z29.h
     adc:	045c5ea1 	mla	z1.h, p7/m, z21.h, z28.h
     ae0:	045f5ce3 	mla	z3.h, p7/m, z7.h, z31.h
     ae4:	045e5e21 	mla	z1.h, p7/m, z17.h, z30.h
     ae8:	91004129 	add	x9, x9, #0x10
     aec:	04630023 	add	z3.h, z1.h, z3.h
     af0:	a4295cc0 	ld1b	{z0.h}, p7/z, [x6, x9]
     af4:	d37ffa73 	lsl	x19, x19, #1
     af8:	452a0863 	sqrshrunb	z3.b, z3.h, #6
     afc:	05236863 	uzp1	z3.b, z3.b, z3.b
     b00:	3cb86863 	str	q3, [x3, x24]
     b04:	2561d002 	sub	z2.h, z2.h, #128
     b08:	8b000036 	add	x22, x1, x0
     b0c:	0420bda1 	movprfx	z1, z13
     b10:	04595ec1 	mla	z1.h, p7/m, z22.h, z25.h
     b14:	0458ddae 	mad	z14.h, p7/m, z24.h, z13.h
     b18:	045b5e41 	mla	z1.h, p7/m, z18.h, z27.h
     b1c:	045a5e8e 	mla	z14.h, p7/m, z20.h, z26.h
     b20:	045d5cc1 	mla	z1.h, p7/m, z6.h, z29.h
     b24:	045c5e0e 	mla	z14.h, p7/m, z16.h, z28.h
     b28:	045f5c41 	mla	z1.h, p7/m, z2.h, z31.h
     b2c:	045e5c8e 	mla	z14.h, p7/m, z4.h, z30.h
     b30:	91004273 	add	x19, x19, #0x10
     b34:	046101c1 	add	z1.h, z14.h, z1.h
     b38:	452a0821 	sqrshrunb	z1.b, z1.h, #6
     b3c:	05216821 	uzp1	z1.b, z1.b, z1.b
     b40:	3d800481 	str	q1, [x4, #16]
     b44:	8b010404 	add	x4, x0, x1, lsl #1
     b48:	a4335cce 	ld1b	{z14.h}, p7/z, [x6, x19]
     b4c:	a4365c23 	ld1b	{z3.h}, p7/z, [x1, x22]
     b50:	8b140440 	add	x0, x2, x20, lsl #1
     b54:	8b050073 	add	x19, x3, x5
     b58:	2561d005 	sub	z5.h, z5.h, #128
     b5c:	8b140474 	add	x20, x3, x20, lsl #1
     b60:	0420bda1 	movprfx	z1, z13
     b64:	04595d81 	mla	z1.h, p7/m, z12.h, z25.h
     b68:	0458ddaf 	mad	z15.h, p7/m, z24.h, z13.h
     b6c:	8b140054 	add	x20, x2, x20
     b70:	045a5eef 	mla	z15.h, p7/m, z23.h, z26.h
     b74:	045b5ea1 	mla	z1.h, p7/m, z21.h, z27.h
     b78:	045c5e6f 	mla	z15.h, p7/m, z19.h, z28.h
     b7c:	045d5e21 	mla	z1.h, p7/m, z17.h, z29.h
     b80:	045e5cef 	mla	z15.h, p7/m, z7.h, z30.h
     b84:	045f5ca1 	mla	z1.h, p7/m, z5.h, z31.h
     b88:	046101e1 	add	z1.h, z15.h, z1.h
     b8c:	452a0821 	sqrshrunb	z1.b, z1.h, #6
     b90:	05216821 	uzp1	z1.b, z1.b, z1.b
     b94:	3ca56861 	str	q1, [x3, x5]
     b98:	2561d000 	sub	z0.h, z0.h, #128
     b9c:	0420bdaf 	movprfx	z15, z13
     ba0:	04595e8f 	mla	z15.h, p7/m, z20.h, z25.h
     ba4:	0458ddb6 	mad	z22.h, p7/m, z24.h, z13.h
     ba8:	045b5e0f 	mla	z15.h, p7/m, z16.h, z27.h
     bac:	045a5e56 	mla	z22.h, p7/m, z18.h, z26.h
     bb0:	045d5c8f 	mla	z15.h, p7/m, z4.h, z29.h
     bb4:	045c5cd6 	mla	z22.h, p7/m, z6.h, z28.h
     bb8:	045f5c0f 	mla	z15.h, p7/m, z0.h, z31.h
     bbc:	045e5c56 	mla	z22.h, p7/m, z2.h, z30.h
     bc0:	8b1501ef 	add	x15, x15, x21
     bc4:	046f02cf 	add	z15.h, z22.h, z15.h
     bc8:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
     bcc:	052f69ef 	uzp1	z15.b, z15.b, z15.b
     bd0:	3d80040f 	str	q15, [x0, #16]
     bd4:	2561d003 	sub	z3.h, z3.h, #128
     bd8:	a4245c21 	ld1b	{z1.h}, p7/z, [x1, x4]
     bdc:	8b0304a0 	add	x0, x5, x3, lsl #1
     be0:	0420bdaf 	movprfx	z15, z13
     be4:	04595eef 	mla	z15.h, p7/m, z23.h, z25.h
     be8:	0458ddac 	mad	z12.h, p7/m, z24.h, z13.h
     bec:	8b040029 	add	x9, x1, x4
     bf0:	045a5eac 	mla	z12.h, p7/m, z21.h, z26.h
     bf4:	045b5e6f 	mla	z15.h, p7/m, z19.h, z27.h
     bf8:	045c5e2c 	mla	z12.h, p7/m, z17.h, z28.h
     bfc:	045d5cef 	mla	z15.h, p7/m, z7.h, z29.h
     c00:	045e5cac 	mla	z12.h, p7/m, z5.h, z30.h
     c04:	045f5c6f 	mla	z15.h, p7/m, z3.h, z31.h
     c08:	d37ef5ce 	lsl	x14, x14, #2
     c0c:	910041ef 	add	x15, x15, #0x10
     c10:	046f018f 	add	z15.h, z12.h, z15.h
     c14:	a42f5cd6 	ld1b	{z22.h}, p7/z, [x6, x15]
     c18:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
     c1c:	052f69ef 	uzp1	z15.b, z15.b, z15.b
     c20:	3cb3686f 	str	q15, [x3, x19]
     c24:	2561d00e 	sub	z14.h, z14.h, #128
     c28:	0420bdac 	movprfx	z12, z13
     c2c:	04595e4c 	mla	z12.h, p7/m, z18.h, z25.h
     c30:	910041c5 	add	x5, x14, #0x10
     c34:	0458ddb4 	mad	z20.h, p7/m, z24.h, z13.h
     c38:	045b5ccc 	mla	z12.h, p7/m, z6.h, z27.h
     c3c:	045a5e14 	mla	z20.h, p7/m, z16.h, z26.h
     c40:	045d5c4c 	mla	z12.h, p7/m, z2.h, z29.h
     c44:	045c5c94 	mla	z20.h, p7/m, z4.h, z28.h
     c48:	045f5dcc 	mla	z12.h, p7/m, z14.h, z31.h
     c4c:	045e5c14 	mla	z20.h, p7/m, z0.h, z30.h
     c50:	046c028c 	add	z12.h, z20.h, z12.h
     c54:	452a098c 	sqrshrunb	z12.b, z12.h, #6
     c58:	052c698c 	uzp1	z12.b, z12.b, z12.b
     c5c:	3d80068c 	str	q12, [x20, #16]
     c60:	a4295c2f 	ld1b	{z15.h}, p7/z, [x1, x9]
     c64:	8b0c0849 	add	x9, x2, x12, lsl #2
     c68:	a4255cd4 	ld1b	{z20.h}, p7/z, [x6, x5]
     c6c:	8b000065 	add	x5, x3, x0
     c70:	2561d001 	sub	z1.h, z1.h, #128
     c74:	0420bdac 	movprfx	z12, z13
     c78:	04595eac 	mla	z12.h, p7/m, z21.h, z25.h
     c7c:	0458ddb7 	mad	z23.h, p7/m, z24.h, z13.h
     c80:	045b5e2c 	mla	z12.h, p7/m, z17.h, z27.h
     c84:	045a5e77 	mla	z23.h, p7/m, z19.h, z26.h
     c88:	045d5cac 	mla	z12.h, p7/m, z5.h, z29.h
     c8c:	045c5cf7 	mla	z23.h, p7/m, z7.h, z28.h
     c90:	045f5c2c 	mla	z12.h, p7/m, z1.h, z31.h
     c94:	045e5c77 	mla	z23.h, p7/m, z3.h, z30.h
     c98:	046c02ec 	add	z12.h, z23.h, z12.h
     c9c:	452a098c 	sqrshrunb	z12.b, z12.h, #6
     ca0:	052c698c 	uzp1	z12.b, z12.b, z12.b
     ca4:	3ca0686c 	str	q12, [x3, x0]
     ca8:	2561d016 	sub	z22.h, z22.h, #128
     cac:	0420bdb7 	movprfx	z23, z13
     cb0:	04595e17 	mla	z23.h, p7/m, z16.h, z25.h
     cb4:	0458ddb2 	mad	z18.h, p7/m, z24.h, z13.h
     cb8:	045b5c97 	mla	z23.h, p7/m, z4.h, z27.h
     cbc:	045a5cd2 	mla	z18.h, p7/m, z6.h, z26.h
     cc0:	045d5c17 	mla	z23.h, p7/m, z0.h, z29.h
     cc4:	045c5c52 	mla	z18.h, p7/m, z2.h, z28.h
     cc8:	045f5ed7 	mla	z23.h, p7/m, z22.h, z31.h
     ccc:	045e5dd2 	mla	z18.h, p7/m, z14.h, z30.h
     cd0:	8b0101ce 	add	x14, x14, x1
     cd4:	04770257 	add	z23.h, z18.h, z23.h
     cd8:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     cdc:	05376af7 	uzp1	z23.b, z23.b, z23.b
     ce0:	3d800537 	str	q23, [x9, #16]
     ce4:	2561d00f 	sub	z15.h, z15.h, #128
     ce8:	8b010484 	add	x4, x4, x1, lsl #1
     cec:	0420bdb7 	movprfx	z23, z13
     cf0:	04595e77 	mla	z23.h, p7/m, z19.h, z25.h
     cf4:	a4245c2c 	ld1b	{z12.h}, p7/z, [x1, x4]
     cf8:	0458ddb5 	mad	z21.h, p7/m, z24.h, z13.h
     cfc:	045b5cf7 	mla	z23.h, p7/m, z7.h, z27.h
     d00:	045a5e35 	mla	z21.h, p7/m, z17.h, z26.h
     d04:	045d5c77 	mla	z23.h, p7/m, z3.h, z29.h
     d08:	045c5cb5 	mla	z21.h, p7/m, z5.h, z28.h
     d0c:	045f5df7 	mla	z23.h, p7/m, z15.h, z31.h
     d10:	045e5c35 	mla	z21.h, p7/m, z1.h, z30.h
     d14:	910041ce 	add	x14, x14, #0x10
     d18:	047702b7 	add	z23.h, z21.h, z23.h
     d1c:	a42e5cd2 	ld1b	{z18.h}, p7/z, [x6, x14]
     d20:	452a0af7 	sqrshrunb	z23.b, z23.h, #6
     d24:	05376af7 	uzp1	z23.b, z23.b, z23.b
     d28:	3ca56877 	str	q23, [x3, x5]
     d2c:	8b0c0865 	add	x5, x3, x12, lsl #2
     d30:	2561d014 	sub	z20.h, z20.h, #128
     d34:	8b050045 	add	x5, x2, x5
     d38:	0420bdb5 	movprfx	z21, z13
     d3c:	04595cd5 	mla	z21.h, p7/m, z6.h, z25.h
     d40:	0458ddb0 	mad	z16.h, p7/m, z24.h, z13.h
     d44:	8b030400 	add	x0, x0, x3, lsl #1
     d48:	8b040029 	add	x9, x1, x4
     d4c:	045a5c90 	mla	z16.h, p7/m, z4.h, z26.h
     d50:	8b1e045e 	add	x30, x2, x30, lsl #1
     d54:	045c5c10 	mla	z16.h, p7/m, z0.h, z28.h
     d58:	045b5c55 	mla	z21.h, p7/m, z2.h, z27.h
     d5c:	045e5ed0 	mla	z16.h, p7/m, z22.h, z30.h
     d60:	045d5dd5 	mla	z21.h, p7/m, z14.h, z29.h
     d64:	045f5e95 	mla	z21.h, p7/m, z20.h, z31.h
     d68:	04750215 	add	z21.h, z16.h, z21.h
     d6c:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     d70:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     d74:	3d8004b5 	str	q21, [x5, #16]
     d78:	d37be825 	lsl	x5, x1, #5
     d7c:	a4295c37 	ld1b	{z23.h}, p7/z, [x1, x9]
     d80:	8b00006e 	add	x14, x3, x0
     d84:	2561d00c 	sub	z12.h, z12.h, #128
     d88:	0420bdb5 	movprfx	z21, z13
     d8c:	04595e35 	mla	z21.h, p7/m, z17.h, z25.h
     d90:	cb0100a9 	sub	x9, x5, x1
     d94:	d37ffa52 	lsl	x18, x18, #1
     d98:	0458ddb3 	mad	z19.h, p7/m, z24.h, z13.h
     d9c:	0458dda6 	mad	z6.h, p7/m, z24.h, z13.h
     da0:	045a5cf3 	mla	z19.h, p7/m, z7.h, z26.h
     da4:	045a5c46 	mla	z6.h, p7/m, z2.h, z26.h
     da8:	045c5c73 	mla	z19.h, p7/m, z3.h, z28.h
     dac:	045c5dc6 	mla	z6.h, p7/m, z14.h, z28.h
     db0:	045e5df3 	mla	z19.h, p7/m, z15.h, z30.h
     db4:	045e5e86 	mla	z6.h, p7/m, z20.h, z30.h
     db8:	045b5cb5 	mla	z21.h, p7/m, z5.h, z27.h
     dbc:	91004252 	add	x18, x18, #0x10
     dc0:	045d5c35 	mla	z21.h, p7/m, z1.h, z29.h
     dc4:	a4325cd0 	ld1b	{z16.h}, p7/z, [x6, x18]
     dc8:	045f5d95 	mla	z21.h, p7/m, z12.h, z31.h
     dcc:	91004129 	add	x9, x9, #0x10
     dd0:	04750275 	add	z21.h, z19.h, z21.h
     dd4:	452a0ab5 	sqrshrunb	z21.b, z21.h, #6
     dd8:	05356ab5 	uzp1	z21.b, z21.b, z21.b
     ddc:	3ca06875 	str	q21, [x3, x0]
     de0:	2561d012 	sub	z18.h, z18.h, #128
     de4:	0420bdb3 	movprfx	z19, z13
     de8:	04595c93 	mla	z19.h, p7/m, z4.h, z25.h
     dec:	045b5c13 	mla	z19.h, p7/m, z0.h, z27.h
     df0:	045d5ed3 	mla	z19.h, p7/m, z22.h, z29.h
     df4:	045f5e53 	mla	z19.h, p7/m, z18.h, z31.h
     df8:	047300d3 	add	z19.h, z6.h, z19.h
     dfc:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     e00:	05336a73 	uzp1	z19.b, z19.b, z19.b
     e04:	3d8007d3 	str	q19, [x30, #16]
     e08:	a4295cc6 	ld1b	{z6.h}, p7/z, [x6, x9]
     e0c:	d37df149 	lsl	x9, x10, #3
     e10:	2561d017 	sub	z23.h, z23.h, #128
     e14:	0420bdb3 	movprfx	z19, z13
     e18:	04595cf3 	mla	z19.h, p7/m, z7.h, z25.h
     e1c:	8b010484 	add	x4, x4, x1, lsl #1
     e20:	0458ddb1 	mad	z17.h, p7/m, z24.h, z13.h
     e24:	a4245c35 	ld1b	{z21.h}, p7/z, [x1, x4]
     e28:	045a5cb1 	mla	z17.h, p7/m, z5.h, z26.h
     e2c:	045b5c73 	mla	z19.h, p7/m, z3.h, z27.h
     e30:	045c5c31 	mla	z17.h, p7/m, z1.h, z28.h
     e34:	045d5df3 	mla	z19.h, p7/m, z15.h, z29.h
     e38:	045e5d91 	mla	z17.h, p7/m, z12.h, z30.h
     e3c:	045f5ef3 	mla	z19.h, p7/m, z23.h, z31.h
     e40:	04730233 	add	z19.h, z17.h, z19.h
     e44:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
     e48:	05336a73 	uzp1	z19.b, z19.b, z19.b
     e4c:	3cae6873 	str	q19, [x3, x14]
     e50:	cb03012e 	sub	x14, x9, x3
     e54:	2561d010 	sub	z16.h, z16.h, #128
     e58:	8b0e004e 	add	x14, x2, x14
     e5c:	0420bdb1 	movprfx	z17, z13
     e60:	04595c51 	mla	z17.h, p7/m, z2.h, z25.h
     e64:	0458dda4 	mad	z4.h, p7/m, z24.h, z13.h
     e68:	8b030400 	add	x0, x0, x3, lsl #1
     e6c:	045a5c04 	mla	z4.h, p7/m, z0.h, z26.h
     e70:	045b5dd1 	mla	z17.h, p7/m, z14.h, z27.h
     e74:	045c5ec4 	mla	z4.h, p7/m, z22.h, z28.h
     e78:	045d5e91 	mla	z17.h, p7/m, z20.h, z29.h
     e7c:	045e5e44 	mla	z4.h, p7/m, z18.h, z30.h
     e80:	045f5e11 	mla	z17.h, p7/m, z16.h, z31.h
     e84:	04710091 	add	z17.h, z4.h, z17.h
     e88:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     e8c:	05316a31 	uzp1	z17.b, z17.b, z17.b
     e90:	3d8005d1 	str	q17, [x14, #16]
     e94:	910040ae 	add	x14, x5, #0x10
     e98:	8b04002f 	add	x15, x1, x4
     e9c:	a42e5cc4 	ld1b	{z4.h}, p7/z, [x6, x14]
     ea0:	a42f5c33 	ld1b	{z19.h}, p7/z, [x1, x15]
     ea4:	8b09004e 	add	x14, x2, x9
     ea8:	8b00006f 	add	x15, x3, x0
     eac:	2561d015 	sub	z21.h, z21.h, #128
     eb0:	8b0c098c 	add	x12, x12, x12, lsl #2
     eb4:	0420bdb1 	movprfx	z17, z13
     eb8:	04595cb1 	mla	z17.h, p7/m, z5.h, z25.h
     ebc:	0458dda7 	mad	z7.h, p7/m, z24.h, z13.h
     ec0:	8b0c004c 	add	x12, x2, x12
     ec4:	045a5c67 	mla	z7.h, p7/m, z3.h, z26.h
     ec8:	045b5c31 	mla	z17.h, p7/m, z1.h, z27.h
     ecc:	045c5de7 	mla	z7.h, p7/m, z15.h, z28.h
     ed0:	045d5d91 	mla	z17.h, p7/m, z12.h, z29.h
     ed4:	045e5ee7 	mla	z7.h, p7/m, z23.h, z30.h
     ed8:	045f5eb1 	mla	z17.h, p7/m, z21.h, z31.h
     edc:	047100f1 	add	z17.h, z7.h, z17.h
     ee0:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
     ee4:	05316a31 	uzp1	z17.b, z17.b, z17.b
     ee8:	3ca06871 	str	q17, [x3, x0]
     eec:	2561d006 	sub	z6.h, z6.h, #128
     ef0:	8b030400 	add	x0, x0, x3, lsl #1
     ef4:	0420bda7 	movprfx	z7, z13
     ef8:	04595c07 	mla	z7.h, p7/m, z0.h, z25.h
     efc:	0458dda2 	mad	z2.h, p7/m, z24.h, z13.h
     f00:	045b5ec7 	mla	z7.h, p7/m, z22.h, z27.h
     f04:	045a5dc2 	mla	z2.h, p7/m, z14.h, z26.h
     f08:	045d5e47 	mla	z7.h, p7/m, z18.h, z29.h
     f0c:	045c5e82 	mla	z2.h, p7/m, z20.h, z28.h
     f10:	045f5cc7 	mla	z7.h, p7/m, z6.h, z31.h
     f14:	045e5e02 	mla	z2.h, p7/m, z16.h, z30.h
     f18:	8b0100a5 	add	x5, x5, x1
     f1c:	04670047 	add	z7.h, z2.h, z7.h
     f20:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     f24:	052768e7 	uzp1	z7.b, z7.b, z7.b
     f28:	3d8005c7 	str	q7, [x14, #16]
     f2c:	2561d013 	sub	z19.h, z19.h, #128
     f30:	8b010484 	add	x4, x4, x1, lsl #1
     f34:	0420bda7 	movprfx	z7, z13
     f38:	04595c67 	mla	z7.h, p7/m, z3.h, z25.h
     f3c:	a4245c31 	ld1b	{z17.h}, p7/z, [x1, x4]
     f40:	8b110451 	add	x17, x2, x17, lsl #1
     f44:	0458dda5 	mad	z5.h, p7/m, z24.h, z13.h
     f48:	045b5de7 	mla	z7.h, p7/m, z15.h, z27.h
     f4c:	045a5c25 	mla	z5.h, p7/m, z1.h, z26.h
     f50:	045d5ee7 	mla	z7.h, p7/m, z23.h, z29.h
     f54:	045c5d85 	mla	z5.h, p7/m, z12.h, z28.h
     f58:	045f5e67 	mla	z7.h, p7/m, z19.h, z31.h
     f5c:	045e5ea5 	mla	z5.h, p7/m, z21.h, z30.h
     f60:	910040a5 	add	x5, x5, #0x10
     f64:	046700a7 	add	z7.h, z5.h, z7.h
     f68:	a4255cc2 	ld1b	{z2.h}, p7/z, [x6, x5]
     f6c:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
     f70:	052768e7 	uzp1	z7.b, z7.b, z7.b
     f74:	3caf6867 	str	q7, [x3, x15]
     f78:	2561d004 	sub	z4.h, z4.h, #128
     f7c:	0420bda5 	movprfx	z5, z13
     f80:	04595dc5 	mla	z5.h, p7/m, z14.h, z25.h
     f84:	0458dda0 	mad	z0.h, p7/m, z24.h, z13.h
     f88:	045b5e85 	mla	z5.h, p7/m, z20.h, z27.h
     f8c:	045a5ec0 	mla	z0.h, p7/m, z22.h, z26.h
     f90:	045d5e05 	mla	z5.h, p7/m, z16.h, z29.h
     f94:	045c5e40 	mla	z0.h, p7/m, z18.h, z28.h
     f98:	045f5c85 	mla	z5.h, p7/m, z4.h, z31.h
     f9c:	045e5cc0 	mla	z0.h, p7/m, z6.h, z30.h
     fa0:	d37ff908 	lsl	x8, x8, #1
     fa4:	8b09014a 	add	x10, x10, x9
     fa8:	04650005 	add	z5.h, z0.h, z5.h
     fac:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
     fb0:	052568a5 	uzp1	z5.b, z5.b, z5.b
     fb4:	3d800585 	str	q5, [x12, #16]
     fb8:	8b00006c 	add	x12, x3, x0
     fbc:	2561d011 	sub	z17.h, z17.h, #128
     fc0:	8b04002e 	add	x14, x1, x4
     fc4:	0420bda5 	movprfx	z5, z13
     fc8:	04595c25 	mla	z5.h, p7/m, z1.h, z25.h
     fcc:	a42e5c27 	ld1b	{z7.h}, p7/z, [x1, x14]
     fd0:	8b0a004a 	add	x10, x2, x10
     fd4:	91004105 	add	x5, x8, #0x10
     fd8:	0458dda3 	mad	z3.h, p7/m, z24.h, z13.h
     fdc:	a4255cc0 	ld1b	{z0.h}, p7/z, [x6, x5]
     fe0:	045a5de3 	mla	z3.h, p7/m, z15.h, z26.h
     fe4:	045b5d85 	mla	z5.h, p7/m, z12.h, z27.h
     fe8:	045c5ee3 	mla	z3.h, p7/m, z23.h, z28.h
     fec:	045d5ea5 	mla	z5.h, p7/m, z21.h, z29.h
     ff0:	045e5e63 	mla	z3.h, p7/m, z19.h, z30.h
     ff4:	045f5e25 	mla	z5.h, p7/m, z17.h, z31.h
     ff8:	04650065 	add	z5.h, z3.h, z5.h
     ffc:	452a08a5 	sqrshrunb	z5.b, z5.h, #6
    1000:	052568a5 	uzp1	z5.b, z5.b, z5.b
    1004:	3ca06865 	str	q5, [x3, x0]
    1008:	2561d002 	sub	z2.h, z2.h, #128
    100c:	8b010484 	add	x4, x4, x1, lsl #1
    1010:	0420bda3 	movprfx	z3, z13
    1014:	04595ec3 	mla	z3.h, p7/m, z22.h, z25.h
    1018:	0458ddae 	mad	z14.h, p7/m, z24.h, z13.h
    101c:	045b5e43 	mla	z3.h, p7/m, z18.h, z27.h
    1020:	045a5e8e 	mla	z14.h, p7/m, z20.h, z26.h
    1024:	045d5cc3 	mla	z3.h, p7/m, z6.h, z29.h
    1028:	045c5e0e 	mla	z14.h, p7/m, z16.h, z28.h
    102c:	8b010108 	add	x8, x8, x1
    1030:	045e5c8e 	mla	z14.h, p7/m, z4.h, z30.h
    1034:	045f5c43 	mla	z3.h, p7/m, z2.h, z31.h
    1038:	046301c3 	add	z3.h, z14.h, z3.h
    103c:	452a0863 	sqrshrunb	z3.b, z3.h, #6
    1040:	05236863 	uzp1	z3.b, z3.b, z3.b
    1044:	3d800623 	str	q3, [x17, #16]
    1048:	2561d007 	sub	z7.h, z7.h, #128
    104c:	a4245c25 	ld1b	{z5.h}, p7/z, [x1, x4]
    1050:	8b040025 	add	x5, x1, x4
    1054:	0420bda3 	movprfx	z3, z13
    1058:	04595de3 	mla	z3.h, p7/m, z15.h, z25.h
    105c:	0458dda1 	mad	z1.h, p7/m, z24.h, z13.h
    1060:	045b5ee3 	mla	z3.h, p7/m, z23.h, z27.h
    1064:	045a5d81 	mla	z1.h, p7/m, z12.h, z26.h
    1068:	045d5e63 	mla	z3.h, p7/m, z19.h, z29.h
    106c:	045c5ea1 	mla	z1.h, p7/m, z21.h, z28.h
    1070:	d37ef4e7 	lsl	x7, x7, #2
    1074:	045e5e21 	mla	z1.h, p7/m, z17.h, z30.h
    1078:	91004108 	add	x8, x8, #0x10
    107c:	045f5ce3 	mla	z3.h, p7/m, z7.h, z31.h
    1080:	a4285cce 	ld1b	{z14.h}, p7/z, [x6, x8]
    1084:	04630023 	add	z3.h, z1.h, z3.h
    1088:	452a0863 	sqrshrunb	z3.b, z3.h, #6
    108c:	05236863 	uzp1	z3.b, z3.b, z3.b
    1090:	3cac6863 	str	q3, [x3, x12]
    1094:	2561d000 	sub	z0.h, z0.h, #128
    1098:	8b030400 	add	x0, x0, x3, lsl #1
    109c:	0420bda1 	movprfx	z1, z13
    10a0:	04595e81 	mla	z1.h, p7/m, z20.h, z25.h
    10a4:	0458ddb6 	mad	z22.h, p7/m, z24.h, z13.h
    10a8:	045b5e01 	mla	z1.h, p7/m, z16.h, z27.h
    10ac:	045a5e56 	mla	z22.h, p7/m, z18.h, z26.h
    10b0:	045d5c81 	mla	z1.h, p7/m, z4.h, z29.h
    10b4:	045c5cd6 	mla	z22.h, p7/m, z6.h, z28.h
    10b8:	045f5c01 	mla	z1.h, p7/m, z0.h, z31.h
    10bc:	045e5c56 	mla	z22.h, p7/m, z2.h, z30.h
    10c0:	046102c1 	add	z1.h, z22.h, z1.h
    10c4:	452a0821 	sqrshrunb	z1.b, z1.h, #6
    10c8:	05216821 	uzp1	z1.b, z1.b, z1.b
    10cc:	3d800541 	str	q1, [x10, #16]
    10d0:	a4255c23 	ld1b	{z3.h}, p7/z, [x1, x5]
    10d4:	910040e5 	add	x5, x7, #0x10
    10d8:	a4255cd6 	ld1b	{z22.h}, p7/z, [x6, x5]
    10dc:	2561d005 	sub	z5.h, z5.h, #128
    10e0:	8b0b0845 	add	x5, x2, x11, lsl #2
    10e4:	8b000068 	add	x8, x3, x0
    10e8:	0420bda1 	movprfx	z1, z13
    10ec:	04595d81 	mla	z1.h, p7/m, z12.h, z25.h
    10f0:	8b0b086b 	add	x11, x3, x11, lsl #2
    10f4:	0458ddaf 	mad	z15.h, p7/m, z24.h, z13.h
    10f8:	045b5ea1 	mla	z1.h, p7/m, z21.h, z27.h
    10fc:	8b0b004b 	add	x11, x2, x11
    1100:	045a5eef 	mla	z15.h, p7/m, z23.h, z26.h
    1104:	045d5e21 	mla	z1.h, p7/m, z17.h, z29.h
    1108:	045c5e6f 	mla	z15.h, p7/m, z19.h, z28.h
    110c:	045f5ca1 	mla	z1.h, p7/m, z5.h, z31.h
    1110:	045e5cef 	mla	z15.h, p7/m, z7.h, z30.h
    1114:	046101e1 	add	z1.h, z15.h, z1.h
    1118:	452a0821 	sqrshrunb	z1.b, z1.h, #6
    111c:	05216821 	uzp1	z1.b, z1.b, z1.b
    1120:	3ca06861 	str	q1, [x3, x0]
    1124:	2561d00e 	sub	z14.h, z14.h, #128
    1128:	0420bdaf 	movprfx	z15, z13
    112c:	04595e4f 	mla	z15.h, p7/m, z18.h, z25.h
    1130:	8b030400 	add	x0, x0, x3, lsl #1
    1134:	0458ddb4 	mad	z20.h, p7/m, z24.h, z13.h
    1138:	045b5ccf 	mla	z15.h, p7/m, z6.h, z27.h
    113c:	045a5e14 	mla	z20.h, p7/m, z16.h, z26.h
    1140:	8b0100e7 	add	x7, x7, x1
    1144:	045c5c94 	mla	z20.h, p7/m, z4.h, z28.h
    1148:	045d5c4f 	mla	z15.h, p7/m, z2.h, z29.h
    114c:	045e5c14 	mla	z20.h, p7/m, z0.h, z30.h
    1150:	045f5dcf 	mla	z15.h, p7/m, z14.h, z31.h
    1154:	046f028f 	add	z15.h, z20.h, z15.h
    1158:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
    115c:	052f69ef 	uzp1	z15.b, z15.b, z15.b
    1160:	3d8004af 	str	q15, [x5, #16]
    1164:	8b010484 	add	x4, x4, x1, lsl #1
    1168:	2561d003 	sub	z3.h, z3.h, #128
    116c:	a4245c21 	ld1b	{z1.h}, p7/z, [x1, x4]
    1170:	0420bdaf 	movprfx	z15, z13
    1174:	04595eef 	mla	z15.h, p7/m, z23.h, z25.h
    1178:	8b100450 	add	x16, x2, x16, lsl #1
    117c:	0458ddac 	mad	z12.h, p7/m, z24.h, z13.h
    1180:	045b5e6f 	mla	z15.h, p7/m, z19.h, z27.h
    1184:	045a5eac 	mla	z12.h, p7/m, z21.h, z26.h
    1188:	910040e7 	add	x7, x7, #0x10
    118c:	045c5e2c 	mla	z12.h, p7/m, z17.h, z28.h
    1190:	a4275cd4 	ld1b	{z20.h}, p7/z, [x6, x7]
    1194:	045e5cac 	mla	z12.h, p7/m, z5.h, z30.h
    1198:	045d5cef 	mla	z15.h, p7/m, z7.h, z29.h
    119c:	045f5c6f 	mla	z15.h, p7/m, z3.h, z31.h
    11a0:	046f018f 	add	z15.h, z12.h, z15.h
    11a4:	452a09ef 	sqrshrunb	z15.b, z15.h, #6
    11a8:	052f69ef 	uzp1	z15.b, z15.b, z15.b
    11ac:	3ca8686f 	str	q15, [x3, x8]
    11b0:	2561d016 	sub	z22.h, z22.h, #128
    11b4:	0420bdac 	movprfx	z12, z13
    11b8:	04595e0c 	mla	z12.h, p7/m, z16.h, z25.h
    11bc:	8b040025 	add	x5, x1, x4
    11c0:	0458ddb2 	mad	z18.h, p7/m, z24.h, z13.h
    11c4:	045b5c8c 	mla	z12.h, p7/m, z4.h, z27.h
    11c8:	045a5cd2 	mla	z18.h, p7/m, z6.h, z26.h
    11cc:	8b031442 	add	x2, x2, x3, lsl #5
    11d0:	045c5c52 	mla	z18.h, p7/m, z2.h, z28.h
    11d4:	045d5c0c 	mla	z12.h, p7/m, z0.h, z29.h
    11d8:	045e5dd2 	mla	z18.h, p7/m, z14.h, z30.h
    11dc:	045f5ecc 	mla	z12.h, p7/m, z22.h, z31.h
    11e0:	d37ff9ad 	lsl	x13, x13, #1
    11e4:	046c024c 	add	z12.h, z18.h, z12.h
    11e8:	452a098c 	sqrshrunb	z12.b, z12.h, #6
    11ec:	052c698c 	uzp1	z12.b, z12.b, z12.b
    11f0:	3d80056c 	str	q12, [x11, #16]
    11f4:	a4255c2f 	ld1b	{z15.h}, p7/z, [x1, x5]
    11f8:	8b000061 	add	x1, x3, x0
    11fc:	0420bdac 	movprfx	z12, z13
    1200:	04595eac 	mla	z12.h, p7/m, z21.h, z25.h
    1204:	2561d001 	sub	z1.h, z1.h, #128
    1208:	0458ddb7 	mad	z23.h, p7/m, z24.h, z13.h
    120c:	910041ad 	add	x13, x13, #0x10
    1210:	045a5e77 	mla	z23.h, p7/m, z19.h, z26.h
    1214:	a42d5cd2 	ld1b	{z18.h}, p7/z, [x6, x13]
    1218:	cb030042 	sub	x2, x2, x3
    121c:	045c5cf7 	mla	z23.h, p7/m, z7.h, z28.h
    1220:	045b5e2c 	mla	z12.h, p7/m, z17.h, z27.h
    1224:	045e5c77 	mla	z23.h, p7/m, z3.h, z30.h
    1228:	045d5cac 	mla	z12.h, p7/m, z5.h, z29.h
    122c:	045f5c2c 	mla	z12.h, p7/m, z1.h, z31.h
    1230:	046c02ec 	add	z12.h, z23.h, z12.h
    1234:	452a098c 	sqrshrunb	z12.b, z12.h, #6
    1238:	052c698c 	uzp1	z12.b, z12.b, z12.b
    123c:	3ca0686c 	str	q12, [x3, x0]
    1240:	2561d014 	sub	z20.h, z20.h, #128
    1244:	0420bdac 	movprfx	z12, z13
    1248:	04595ccc 	mla	z12.h, p7/m, z6.h, z25.h
    124c:	0458ddb0 	mad	z16.h, p7/m, z24.h, z13.h
    1250:	045b5c4c 	mla	z12.h, p7/m, z2.h, z27.h
    1254:	045a5c90 	mla	z16.h, p7/m, z4.h, z26.h
    1258:	045d5dcc 	mla	z12.h, p7/m, z14.h, z29.h
    125c:	045c5c10 	mla	z16.h, p7/m, z0.h, z28.h
    1260:	045f5e8c 	mla	z12.h, p7/m, z20.h, z31.h
    1264:	045e5ed0 	mla	z16.h, p7/m, z22.h, z30.h
    1268:	046c020c 	add	z12.h, z16.h, z12.h
    126c:	452a098c 	sqrshrunb	z12.b, z12.h, #6
    1270:	052c698c 	uzp1	z12.b, z12.b, z12.b
    1274:	3d80060c 	str	q12, [x16, #16]
    1278:	0459ddb3 	mad	z19.h, p7/m, z25.h, z13.h
    127c:	0458ddb5 	mad	z21.h, p7/m, z24.h, z13.h
    1280:	045b5cf3 	mla	z19.h, p7/m, z7.h, z27.h
    1284:	2561d00f 	sub	z15.h, z15.h, #128
    1288:	045d5c73 	mla	z19.h, p7/m, z3.h, z29.h
    128c:	045a5e35 	mla	z21.h, p7/m, z17.h, z26.h
    1290:	045f5df3 	mla	z19.h, p7/m, z15.h, z31.h
    1294:	045c5cb5 	mla	z21.h, p7/m, z5.h, z28.h
    1298:	045e5c35 	mla	z21.h, p7/m, z1.h, z30.h
    129c:	047302b3 	add	z19.h, z21.h, z19.h
    12a0:	452a0a73 	sqrshrunb	z19.b, z19.h, #6
    12a4:	05336a73 	uzp1	z19.b, z19.b, z19.b
    12a8:	3ca16873 	str	q19, [x3, x1]
    12ac:	0459dda4 	mad	z4.h, p7/m, z25.h, z13.h
    12b0:	0458dda6 	mad	z6.h, p7/m, z24.h, z13.h
    12b4:	045b5c04 	mla	z4.h, p7/m, z0.h, z27.h
    12b8:	2561d012 	sub	z18.h, z18.h, #128
    12bc:	045d5ec4 	mla	z4.h, p7/m, z22.h, z29.h
    12c0:	045a5c46 	mla	z6.h, p7/m, z2.h, z26.h
    12c4:	045f5e44 	mla	z4.h, p7/m, z18.h, z31.h
    12c8:	045c5dc6 	mla	z6.h, p7/m, z14.h, z28.h
    12cc:	045e5e86 	mla	z6.h, p7/m, z20.h, z30.h
    12d0:	046400c4 	add	z4.h, z6.h, z4.h
    12d4:	452a0884 	sqrshrunb	z4.b, z4.h, #6
    12d8:	05246884 	uzp1	z4.b, z4.b, z4.b
    12dc:	3d800444 	str	q4, [x2, #16]
    12e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    12e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    12e8:	a94363f7 	ldp	x23, x24, [sp, #48]
    12ec:	6d4437ec 	ldp	d12, d13, [sp, #64]
    12f0:	6d453fee 	ldp	d14, d15, [sp, #80]
    12f4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    12f8:	d65f03c0 	ret
    12fc:	2f00e41f 	movi	d31, #0x0
    1300:	2578c03e 	mov	z30.h, #1
    1304:	2578df7d 	mov	z29.h, #-5
    1308:	2578c23c 	mov	z28.h, #17
    130c:	2578c75b 	mov	z27.h, #58
    1310:	2578deda 	mov	z26.h, #-10
    1314:	2578c099 	mov	z25.h, #4
    1318:	2538dff8 	mov	z24.b, #-1
    131c:	17fffb58 	b	7c <dynopt_interp8_32x32_sve2_vpp+0x7c>
