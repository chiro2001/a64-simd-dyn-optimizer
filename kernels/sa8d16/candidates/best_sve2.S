
kernels/sa8d16/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sa8d_16x16_sve2>:
   0:	8b03044d 	add	x13, x2, x3, lsl #1
   4:	8b01040e 	add	x14, x0, x1, lsl #1
   8:	2518e3e7 	ptrue	p7.b
   c:	8b0305ab 	add	x11, x13, x3, lsl #1
  10:	8b0105cc 	add	x12, x14, x1, lsl #1
  14:	a42d5c7f 	ld1b	{z31.h}, p7/z, [x3, x13]
  18:	8b030569 	add	x9, x11, x3, lsl #1
  1c:	8b01058a 	add	x10, x12, x1, lsl #1
  20:	a42e5c3e 	ld1b	{z30.h}, p7/z, [x1, x14]
  24:	8b030527 	add	x7, x9, x3, lsl #1
  28:	8b010548 	add	x8, x10, x1, lsl #1
  2c:	047f07de 	sub	z30.h, z30.h, z31.h
  30:	8b0304e5 	add	x5, x7, x3, lsl #1
  34:	8b010506 	add	x6, x8, x1, lsl #1
  38:	a420bc5f 	ld1b	{z31.h}, p7/z, [x2]
  3c:	8b0304a4 	add	x4, x5, x3, lsl #1
  40:	8b0104cf 	add	x15, x6, x1, lsl #1
  44:	a420bc1d 	ld1b	{z29.h}, p7/z, [x0]
  48:	8b040070 	add	x16, x3, x4
  4c:	047f07bd 	sub	z29.h, z29.h, z31.h
  50:	a4305c7f 	ld1b	{z31.h}, p7/z, [x3, x16]
  54:	90000010 	adrp	x16, 0 <dynopt_sa8d_16x16_sve2>
  58:	91000210 	add	x16, x16, #0x0
  5c:	a4235c59 	ld1b	{z25.h}, p7/z, [x2, x3]
  60:	8b0f0031 	add	x17, x1, x15
  64:	a4315c3c 	ld1b	{z28.h}, p7/z, [x1, x17]
  68:	047f079c 	sub	z28.h, z28.h, z31.h
  6c:	a4a0be1f 	ld1h	{z31.h}, p7/z, [x16]
  70:	8b030050 	add	x16, x2, x3
  74:	a4235e1b 	ld1b	{z27.h}, p7/z, [x16, x3]
  78:	8b010011 	add	x17, x0, x1
  7c:	8b0d006d 	add	x13, x3, x13
  80:	a4215e36 	ld1b	{z22.h}, p7/z, [x17, x1]
  84:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
  88:	047b06d6 	sub	z22.h, z22.h, z27.h
  8c:	057f33de 	tbl	z30.h, {z30.h}, z31.h
  90:	a4215c1b 	ld1b	{z27.h}, p7/z, [x0, x1]
  94:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
  98:	0479077b 	sub	z27.h, z27.h, z25.h
  9c:	057f33de 	tbl	z30.h, {z30.h}, z31.h
  a0:	a42d5c79 	ld1b	{z25.h}, p7/z, [x3, x13]
  a4:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
  a8:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
  ac:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
  b0:	057f32d6 	tbl	z22.h, {z22.h}, z31.h
  b4:	057f337b 	tbl	z27.h, {z27.h}, z31.h
  b8:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
  bc:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
  c0:	057f32d6 	tbl	z22.h, {z22.h}, z31.h
  c4:	057f337b 	tbl	z27.h, {z27.h}, z31.h
  c8:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
  cc:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
  d0:	047e02da 	add	z26.h, z22.h, z30.h
  d4:	8b0e002e 	add	x14, x1, x14
  d8:	047e06d6 	sub	z22.h, z22.h, z30.h
  dc:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
  e0:	a42e5c3e 	ld1b	{z30.h}, p7/z, [x1, x14]
  e4:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
  e8:	047907de 	sub	z30.h, z30.h, z25.h
  ec:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
  f0:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
  f4:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
  f8:	047b03b7 	add	z23.h, z29.h, z27.h
  fc:	047b07bd 	sub	z29.h, z29.h, z27.h
 100:	047a02f9 	add	z25.h, z23.h, z26.h
 104:	a42b5c7b 	ld1b	{z27.h}, p7/z, [x3, x11]
 108:	044c1f57 	sabd	z23.h, p7/m, z23.h, z26.h
 10c:	8b0b006b 	add	x11, x3, x11
 110:	a42c5c3a 	ld1b	{z26.h}, p7/z, [x1, x12]
 114:	a42b5c78 	ld1b	{z24.h}, p7/z, [x3, x11]
 118:	047b075a 	sub	z26.h, z26.h, z27.h
 11c:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 120:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 124:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 128:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 12c:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 130:	047603b5 	add	z21.h, z29.h, z22.h
 134:	8b0c002c 	add	x12, x1, x12
 138:	044c1edd 	sabd	z29.h, p7/m, z29.h, z22.h
 13c:	a42c5c3b 	ld1b	{z27.h}, p7/z, [x1, x12]
 140:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 144:	0478077b 	sub	z27.h, z27.h, z24.h
 148:	057f33de 	tbl	z30.h, {z30.h}, z31.h
 14c:	a42a5c38 	ld1b	{z24.h}, p7/z, [x1, x10]
 150:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 154:	057f33de 	tbl	z30.h, {z30.h}, z31.h
 158:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 15c:	047a03d4 	add	z20.h, z30.h, z26.h
 160:	047a07de 	sub	z30.h, z30.h, z26.h
 164:	a4295c7a 	ld1b	{z26.h}, p7/z, [x3, x9]
 168:	8b090069 	add	x9, x3, x9
 16c:	047a0718 	sub	z24.h, z24.h, z26.h
 170:	a4295c76 	ld1b	{z22.h}, p7/z, [x3, x9]
 174:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 178:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 17c:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 180:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 184:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 188:	8b0a002a 	add	x10, x1, x10
 18c:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 190:	a42a5c3a 	ld1b	{z26.h}, p7/z, [x1, x10]
 194:	057f337b 	tbl	z27.h, {z27.h}, z31.h
 198:	0476075a 	sub	z26.h, z26.h, z22.h
 19c:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 1a0:	057f337b 	tbl	z27.h, {z27.h}, z31.h
 1a4:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 1a8:	04780376 	add	z22.h, z27.h, z24.h
 1ac:	0478077b 	sub	z27.h, z27.h, z24.h
 1b0:	04760298 	add	z24.h, z20.h, z22.h
 1b4:	0456bf18 	abs	z24.h, p7/m, z24.h
 1b8:	0456bf39 	abs	z25.h, p7/m, z25.h
 1bc:	04481f19 	smax	z25.h, p7/m, z25.h, z24.h
 1c0:	047b03d8 	add	z24.h, z30.h, z27.h
 1c4:	044c1f7e 	sabd	z30.h, p7/m, z30.h, z27.h
 1c8:	0420bf1b 	movprfx	z27, z24
 1cc:	0456bf1b 	abs	z27.h, p7/m, z24.h
 1d0:	04481fdd 	smax	z29.h, p7/m, z29.h, z30.h
 1d4:	0456beb5 	abs	z21.h, p7/m, z21.h
 1d8:	044c1ed4 	sabd	z20.h, p7/m, z20.h, z22.h
 1dc:	0420bebe 	movprfx	z30, z21
 1e0:	04481f7e 	smax	z30.h, p7/m, z30.h, z27.h
 1e4:	04481e97 	smax	z23.h, p7/m, z23.h, z20.h
 1e8:	a4275c7b 	ld1b	{z27.h}, p7/z, [x3, x7]
 1ec:	047d02f7 	add	z23.h, z23.h, z29.h
 1f0:	a4285c3d 	ld1b	{z29.h}, p7/z, [x1, x8]
 1f4:	047b07bd 	sub	z29.h, z29.h, z27.h
 1f8:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 1fc:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 200:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 204:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 208:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 20c:	047e0339 	add	z25.h, z25.h, z30.h
 210:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 214:	04770339 	add	z25.h, z25.h, z23.h
 218:	057f335e 	tbl	z30.h, {z26.h}, z31.h
 21c:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 220:	057f33de 	tbl	z30.h, {z30.h}, z31.h
 224:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 228:	047d03d5 	add	z21.h, z30.h, z29.h
 22c:	047d07de 	sub	z30.h, z30.h, z29.h
 230:	a4255c7d 	ld1b	{z29.h}, p7/z, [x3, x5]
 234:	8b050065 	add	x5, x3, x5
 238:	a4255c77 	ld1b	{z23.h}, p7/z, [x3, x5]
 23c:	a4265c3a 	ld1b	{z26.h}, p7/z, [x1, x6]
 240:	8b080028 	add	x8, x1, x8
 244:	8b070067 	add	x7, x3, x7
 248:	a4285c38 	ld1b	{z24.h}, p7/z, [x1, x8]
 24c:	a4275c7b 	ld1b	{z27.h}, p7/z, [x3, x7]
 250:	8b060026 	add	x6, x1, x6
 254:	047b0718 	sub	z24.h, z24.h, z27.h
 258:	047d075a 	sub	z26.h, z26.h, z29.h
 25c:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 260:	a4265c3d 	ld1b	{z29.h}, p7/z, [x1, x6]
 264:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 268:	047707bd 	sub	z29.h, z29.h, z23.h
 26c:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 270:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 274:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 278:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 27c:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 280:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 284:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 288:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 28c:	047a0317 	add	z23.h, z24.h, z26.h
 290:	047702b6 	add	z22.h, z21.h, z23.h
 294:	044c1ef5 	sabd	z21.h, p7/m, z21.h, z23.h
 298:	a4245c77 	ld1b	{z23.h}, p7/z, [x3, x4]
 29c:	047a0718 	sub	z24.h, z24.h, z26.h
 2a0:	8b0105e0 	add	x0, x15, x1, lsl #1
 2a4:	a42f5c3a 	ld1b	{z26.h}, p7/z, [x1, x15]
 2a8:	a4205c3b 	ld1b	{z27.h}, p7/z, [x1, x0]
 2ac:	8b030484 	add	x4, x4, x3, lsl #1
 2b0:	0477075a 	sub	z26.h, z26.h, z23.h
 2b4:	a4245c77 	ld1b	{z23.h}, p7/z, [x3, x4]
 2b8:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 2bc:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 2c0:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 2c4:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 2c8:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 2cc:	0477077b 	sub	z27.h, z27.h, z23.h
 2d0:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 2d4:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 2d8:	057f339c 	tbl	z28.h, {z28.h}, z31.h
 2dc:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 2e0:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 2e4:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 2e8:	057f339c 	tbl	z28.h, {z28.h}, z31.h
 2ec:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 2f0:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 2f4:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 2f8:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 2fc:	047a03b7 	add	z23.h, z29.h, z26.h
 300:	057f337b 	tbl	z27.h, {z27.h}, z31.h
 304:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 308:	057f337b 	tbl	z27.h, {z27.h}, z31.h
 30c:	047a07bf 	sub	z31.h, z29.h, z26.h
 310:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 314:	047b039a 	add	z26.h, z28.h, z27.h
 318:	047b079c 	sub	z28.h, z28.h, z27.h
 31c:	047a02fd 	add	z29.h, z23.h, z26.h
 320:	044c1f57 	sabd	z23.h, p7/m, z23.h, z26.h
 324:	047803da 	add	z26.h, z30.h, z24.h
 328:	044c1f1e 	sabd	z30.h, p7/m, z30.h, z24.h
 32c:	047c03f8 	add	z24.h, z31.h, z28.h
 330:	044c1f9f 	sabd	z31.h, p7/m, z31.h, z28.h
 334:	04403f39 	saddv	d25, p7, z25.h
 338:	04481ffe 	smax	z30.h, p7/m, z30.h, z31.h
 33c:	0456bed6 	abs	z22.h, p7/m, z22.h
 340:	0456bfbd 	abs	z29.h, p7/m, z29.h
 344:	0420bebb 	movprfx	z27, z21
 348:	04481efb 	smax	z27.h, p7/m, z27.h, z23.h
 34c:	04481edd 	smax	z29.h, p7/m, z29.h, z22.h
 350:	0456bf5a 	abs	z26.h, p7/m, z26.h
 354:	0420bf1c 	movprfx	z28, z24
 358:	0456bf1c 	abs	z28.h, p7/m, z24.h
 35c:	047e037e 	add	z30.h, z27.h, z30.h
 360:	0420bf5f 	movprfx	z31, z26
 364:	04481f9f 	smax	z31.h, p7/m, z31.h, z28.h
 368:	047f03bf 	add	z31.h, z29.h, z31.h
 36c:	047e03ff 	add	z31.h, z31.h, z30.h
 370:	04403fff 	saddv	d31, p7, z31.h
 374:	0eb987ff 	add	v31.2s, v31.2s, v25.2s
 378:	1e2603e0 	fmov	w0, s31
 37c:	11000400 	add	w0, w0, #0x1
 380:	13017c00 	asr	w0, w0, #1
 384:	d65f03c0 	ret
