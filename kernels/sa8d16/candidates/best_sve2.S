
kernels/sa8d16/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sa8d_16x16_sve2>:
   0:	2518e3e7 	ptrue	p7.b
   4:	a420bc5e 	ld1b	{z30.h}, p7/z, [x2]
   8:	a420bc07 	ld1b	{z7.h}, p7/z, [x0]
   c:	047e04e7 	sub	z7.h, z7.h, z30.h
  10:	a4235c5e 	ld1b	{z30.h}, p7/z, [x2, x3]
  14:	8b030045 	add	x5, x2, x3
  18:	a4215c1d 	ld1b	{z29.h}, p7/z, [x0, x1]
  1c:	90000004 	adrp	x4, 0 <dynopt_sa8d_16x16_sve2>
  20:	047e07bd 	sub	z29.h, z29.h, z30.h
  24:	91000084 	add	x4, x4, #0x0
  28:	a4235cbe 	ld1b	{z30.h}, p7/z, [x5, x3]
  2c:	a4a0bc9f 	ld1h	{z31.h}, p7/z, [x4]
  30:	8b010006 	add	x6, x0, x1
  34:	8b010404 	add	x4, x0, x1, lsl #1
  38:	a4215cd0 	ld1b	{z16.h}, p7/z, [x6, x1]
  3c:	8b030440 	add	x0, x2, x3, lsl #1
  40:	047e0610 	sub	z16.h, z16.h, z30.h
  44:	a4205c7e 	ld1b	{z30.h}, p7/z, [x3, x0]
  48:	8b000065 	add	x5, x3, x0
  4c:	a4245c36 	ld1b	{z22.h}, p7/z, [x1, x4]
  50:	047e06d6 	sub	z22.h, z22.h, z30.h
  54:	a4255c7e 	ld1b	{z30.h}, p7/z, [x3, x5]
  58:	8b030400 	add	x0, x0, x3, lsl #1
  5c:	8b040026 	add	x6, x1, x4
  60:	a4265c31 	ld1b	{z17.h}, p7/z, [x1, x6]
  64:	047e0631 	sub	z17.h, z17.h, z30.h
  68:	a4205c7e 	ld1b	{z30.h}, p7/z, [x3, x0]
  6c:	8b010482 	add	x2, x4, x1, lsl #1
  70:	8b000064 	add	x4, x3, x0
  74:	a4225c39 	ld1b	{z25.h}, p7/z, [x1, x2]
  78:	047e0739 	sub	z25.h, z25.h, z30.h
  7c:	a4245c7e 	ld1b	{z30.h}, p7/z, [x3, x4]
  80:	8b020025 	add	x5, x1, x2
  84:	8b030400 	add	x0, x0, x3, lsl #1
  88:	a4255c32 	ld1b	{z18.h}, p7/z, [x1, x5]
  8c:	047e0652 	sub	z18.h, z18.h, z30.h
  90:	a4205c7e 	ld1b	{z30.h}, p7/z, [x3, x0]
  94:	8b010442 	add	x2, x2, x1, lsl #1
  98:	8b000064 	add	x4, x3, x0
  9c:	a4225c37 	ld1b	{z23.h}, p7/z, [x1, x2]
  a0:	8b030400 	add	x0, x0, x3, lsl #1
  a4:	047e06f7 	sub	z23.h, z23.h, z30.h
  a8:	a4205c7c 	ld1b	{z28.h}, p7/z, [x3, x0]
  ac:	a4245c7e 	ld1b	{z30.h}, p7/z, [x3, x4]
  b0:	8b020025 	add	x5, x1, x2
  b4:	8b000064 	add	x4, x3, x0
  b8:	8b010442 	add	x2, x2, x1, lsl #1
  bc:	a4255c33 	ld1b	{z19.h}, p7/z, [x1, x5]
  c0:	047e0673 	sub	z19.h, z19.h, z30.h
  c4:	a4225c3e 	ld1b	{z30.h}, p7/z, [x1, x2]
  c8:	047c07de 	sub	z30.h, z30.h, z28.h
  cc:	a4245c7c 	ld1b	{z28.h}, p7/z, [x3, x4]
  d0:	8b020025 	add	x5, x1, x2
  d4:	8b030400 	add	x0, x0, x3, lsl #1
  d8:	a4255c34 	ld1b	{z20.h}, p7/z, [x1, x5]
  dc:	047c0694 	sub	z20.h, z20.h, z28.h
  e0:	a4205c7c 	ld1b	{z28.h}, p7/z, [x3, x0]
  e4:	8b010442 	add	x2, x2, x1, lsl #1
  e8:	8b000064 	add	x4, x3, x0
  ec:	a4225c38 	ld1b	{z24.h}, p7/z, [x1, x2]
  f0:	8b030400 	add	x0, x0, x3, lsl #1
  f4:	047c0718 	sub	z24.h, z24.h, z28.h
  f8:	a4205c7b 	ld1b	{z27.h}, p7/z, [x3, x0]
  fc:	a4245c7c 	ld1b	{z28.h}, p7/z, [x3, x4]
 100:	8b020025 	add	x5, x1, x2
 104:	8b000064 	add	x4, x3, x0
 108:	8b010442 	add	x2, x2, x1, lsl #1
 10c:	a4255c35 	ld1b	{z21.h}, p7/z, [x1, x5]
 110:	047c06b5 	sub	z21.h, z21.h, z28.h
 114:	a4225c3c 	ld1b	{z28.h}, p7/z, [x1, x2]
 118:	047b079c 	sub	z28.h, z28.h, z27.h
 11c:	a4245c7b 	ld1b	{z27.h}, p7/z, [x3, x4]
 120:	8b020025 	add	x5, x1, x2
 124:	8b030400 	add	x0, x0, x3, lsl #1
 128:	a4255c3a 	ld1b	{z26.h}, p7/z, [x1, x5]
 12c:	8b010442 	add	x2, x2, x1, lsl #1
 130:	047b075a 	sub	z26.h, z26.h, z27.h
 134:	4540d8e7 	cadd	z7.h, z7.h, z7.h, #90
 138:	a4225c3b 	ld1b	{z27.h}, p7/z, [x1, x2]
 13c:	057f30e7 	tbl	z7.h, {z7.h}, z31.h
 140:	a4205c66 	ld1b	{z6.h}, p7/z, [x3, x0]
 144:	4540d8e7 	cadd	z7.h, z7.h, z7.h, #90
 148:	0466077b 	sub	z27.h, z27.h, z6.h
 14c:	057f30e7 	tbl	z7.h, {z7.h}, z31.h
 150:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 154:	4540d8e7 	cadd	z7.h, z7.h, z7.h, #90
 158:	057f337b 	tbl	z27.h, {z27.h}, z31.h
 15c:	4540db7b 	cadd	z27.h, z27.h, z27.h, #90
 160:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 164:	4540da10 	cadd	z16.h, z16.h, z16.h, #90
 168:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 16c:	057f3210 	tbl	z16.h, {z16.h}, z31.h
 170:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 174:	4540da10 	cadd	z16.h, z16.h, z16.h, #90
 178:	057f33bd 	tbl	z29.h, {z29.h}, z31.h
 17c:	057f3210 	tbl	z16.h, {z16.h}, z31.h
 180:	4540dbbd 	cadd	z29.h, z29.h, z29.h, #90
 184:	4540da10 	cadd	z16.h, z16.h, z16.h, #90
 188:	047d00e4 	add	z4.h, z7.h, z29.h
 18c:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
 190:	047d04fd 	sub	z29.h, z7.h, z29.h
 194:	057f32d6 	tbl	z22.h, {z22.h}, z31.h
 198:	4540da31 	cadd	z17.h, z17.h, z17.h, #90
 19c:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
 1a0:	057f3231 	tbl	z17.h, {z17.h}, z31.h
 1a4:	057f32d6 	tbl	z22.h, {z22.h}, z31.h
 1a8:	4540da31 	cadd	z17.h, z17.h, z17.h, #90
 1ac:	4540dad6 	cadd	z22.h, z22.h, z22.h, #90
 1b0:	057f3231 	tbl	z17.h, {z17.h}, z31.h
 1b4:	04760207 	add	z7.h, z16.h, z22.h
 1b8:	4540da31 	cadd	z17.h, z17.h, z17.h, #90
 1bc:	4540db39 	cadd	z25.h, z25.h, z25.h, #90
 1c0:	4540da52 	cadd	z18.h, z18.h, z18.h, #90
 1c4:	057f3339 	tbl	z25.h, {z25.h}, z31.h
 1c8:	057f3252 	tbl	z18.h, {z18.h}, z31.h
 1cc:	4540db39 	cadd	z25.h, z25.h, z25.h, #90
 1d0:	4540da52 	cadd	z18.h, z18.h, z18.h, #90
 1d4:	057f3339 	tbl	z25.h, {z25.h}, z31.h
 1d8:	057f3252 	tbl	z18.h, {z18.h}, z31.h
 1dc:	4540daf7 	cadd	z23.h, z23.h, z23.h, #90
 1e0:	4540da52 	cadd	z18.h, z18.h, z18.h, #90
 1e4:	057f32f7 	tbl	z23.h, {z23.h}, z31.h
 1e8:	4540da73 	cadd	z19.h, z19.h, z19.h, #90
 1ec:	4540daf7 	cadd	z23.h, z23.h, z23.h, #90
 1f0:	057f3273 	tbl	z19.h, {z19.h}, z31.h
 1f4:	057f32f7 	tbl	z23.h, {z23.h}, z31.h
 1f8:	4540da73 	cadd	z19.h, z19.h, z19.h, #90
 1fc:	4540daf7 	cadd	z23.h, z23.h, z23.h, #90
 200:	057f3273 	tbl	z19.h, {z19.h}, z31.h
 204:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 208:	4540da94 	cadd	z20.h, z20.h, z20.h, #90
 20c:	057f33de 	tbl	z30.h, {z30.h}, z31.h
 210:	057f3294 	tbl	z20.h, {z20.h}, z31.h
 214:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 218:	4540da94 	cadd	z20.h, z20.h, z20.h, #90
 21c:	057f33de 	tbl	z30.h, {z30.h}, z31.h
 220:	057f3294 	tbl	z20.h, {z20.h}, z31.h
 224:	4540dbde 	cadd	z30.h, z30.h, z30.h, #90
 228:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 22c:	4540dab5 	cadd	z21.h, z21.h, z21.h, #90
 230:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 234:	057f32b5 	tbl	z21.h, {z21.h}, z31.h
 238:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 23c:	4540dab5 	cadd	z21.h, z21.h, z21.h, #90
 240:	057f3318 	tbl	z24.h, {z24.h}, z31.h
 244:	057f32b5 	tbl	z21.h, {z21.h}, z31.h
 248:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 24c:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 250:	057f339c 	tbl	z28.h, {z28.h}, z31.h
 254:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 258:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 25c:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 260:	057f339c 	tbl	z28.h, {z28.h}, z31.h
 264:	057f335a 	tbl	z26.h, {z26.h}, z31.h
 268:	057f337f 	tbl	z31.h, {z27.h}, z31.h
 26c:	4540db5a 	cadd	z26.h, z26.h, z26.h, #90
 270:	0477025b 	add	z27.h, z18.h, z23.h
 274:	04760610 	sub	z16.h, z16.h, z22.h
 278:	04770657 	sub	z23.h, z18.h, z23.h
 27c:	4540da94 	cadd	z20.h, z20.h, z20.h, #90
 280:	4540db18 	cadd	z24.h, z24.h, z24.h, #90
 284:	4540dab5 	cadd	z21.h, z21.h, z21.h, #90
 288:	04780285 	add	z5.h, z20.h, z24.h
 28c:	4540db39 	cadd	z25.h, z25.h, z25.h, #90
 290:	4540da73 	cadd	z19.h, z19.h, z19.h, #90
 294:	04790236 	add	z22.h, z17.h, z25.h
 298:	047e0272 	add	z18.h, z19.h, z30.h
 29c:	04790639 	sub	z25.h, z17.h, z25.h
 2a0:	047e0673 	sub	z19.h, z19.h, z30.h
 2a4:	04780691 	sub	z17.h, z20.h, z24.h
 2a8:	0467009e 	add	z30.h, z4.h, z7.h
 2ac:	4540dbff 	cadd	z31.h, z31.h, z31.h, #90
 2b0:	047f0346 	add	z6.h, z26.h, z31.h
 2b4:	047f075f 	sub	z31.h, z26.h, z31.h
 2b8:	0420bc9a 	movprfx	z26, z4
 2bc:	044c1cfa 	sabd	z26.h, p7/m, z26.h, z7.h
 2c0:	047b02c7 	add	z7.h, z22.h, z27.h
 2c4:	044c1f76 	sabd	z22.h, p7/m, z22.h, z27.h
 2c8:	0465025b 	add	z27.h, z18.h, z5.h
 2cc:	0456bf7b 	abs	z27.h, p7/m, z27.h
 2d0:	047003b8 	add	z24.h, z29.h, z16.h
 2d4:	4540db9c 	cadd	z28.h, z28.h, z28.h, #90
 2d8:	044c1e1d 	sabd	z29.h, p7/m, z29.h, z16.h
 2dc:	047c02b4 	add	z20.h, z21.h, z28.h
 2e0:	04770330 	add	z16.h, z25.h, z23.h
 2e4:	047c06bc 	sub	z28.h, z21.h, z28.h
 2e8:	044c1ef9 	sabd	z25.h, p7/m, z25.h, z23.h
 2ec:	04710275 	add	z21.h, z19.h, z17.h
 2f0:	047f0397 	add	z23.h, z28.h, z31.h
 2f4:	044c1e33 	sabd	z19.h, p7/m, z19.h, z17.h
 2f8:	044c1ffc 	sabd	z28.h, p7/m, z28.h, z31.h
 2fc:	04660291 	add	z17.h, z20.h, z6.h
 300:	0456bfde 	abs	z30.h, p7/m, z30.h
 304:	0456bf18 	abs	z24.h, p7/m, z24.h
 308:	0456bce7 	abs	z7.h, p7/m, z7.h
 30c:	0456be10 	abs	z16.h, p7/m, z16.h
 310:	044c1cb2 	sabd	z18.h, p7/m, z18.h, z5.h
 314:	0456beb5 	abs	z21.h, p7/m, z21.h
 318:	0456be31 	abs	z17.h, p7/m, z17.h
 31c:	044c1cd4 	sabd	z20.h, p7/m, z20.h, z6.h
 320:	0420bf7f 	movprfx	z31, z27
 324:	04481e3f 	smax	z31.h, p7/m, z31.h, z17.h
 328:	0456bef7 	abs	z23.h, p7/m, z23.h
 32c:	04481cfe 	smax	z30.h, p7/m, z30.h, z7.h
 330:	04481e18 	smax	z24.h, p7/m, z24.h, z16.h
 334:	04481eda 	smax	z26.h, p7/m, z26.h, z22.h
 338:	04481f3d 	smax	z29.h, p7/m, z29.h, z25.h
 33c:	0420bebb 	movprfx	z27, z21
 340:	04481efb 	smax	z27.h, p7/m, z27.h, z23.h
 344:	04481e92 	smax	z18.h, p7/m, z18.h, z20.h
 348:	04481f93 	smax	z19.h, p7/m, z19.h, z28.h
 34c:	047803de 	add	z30.h, z30.h, z24.h
 350:	047d035d 	add	z29.h, z26.h, z29.h
 354:	047b03ff 	add	z31.h, z31.h, z27.h
 358:	04730252 	add	z18.h, z18.h, z19.h
 35c:	047d03de 	add	z30.h, z30.h, z29.h
 360:	047203ff 	add	z31.h, z31.h, z18.h
 364:	04403fde 	saddv	d30, p7, z30.h
 368:	04403fff 	saddv	d31, p7, z31.h
 36c:	0ebe87ff 	add	v31.2s, v31.2s, v30.2s
 370:	1e2603e0 	fmov	w0, s31
 374:	11000400 	add	w0, w0, #0x1
 378:	13017c00 	asr	w0, w0, #1
 37c:	d65f03c0 	ret
