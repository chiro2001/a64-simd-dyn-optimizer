
kernels/interp4vpp-16/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp4_16x16_sve2_vpp>:
   0:	2558e3e0 	ptrue	p0.h
   4:	cb010008 	sub	x8, x0, x1
   8:	12000889 	and	w9, w4, #0x7
   c:	9000000a 	adrp	x10, 0 <dynopt_interp4_16x16_sve2_vpp>
  10:	9100014a 	add	x10, x10, #0x0
  14:	6f00e402 	movi	v2.2d, #0x0
  18:	a420a100 	ld1b	{z0.h}, p0/z, [x8]
  1c:	8b294949 	add	x9, x10, w9, uxtw #2
  20:	a420a004 	ld1b	{z4.h}, p0/z, [x0]
  24:	d37ff82a 	lsl	x10, x1, #1
  28:	2518e121 	ptrue	p1.b, vl16
  2c:	d37ef46c 	lsl	x12, x3, #2
  30:	85c0c123 	ld1rsb	{z3.h}, p0/z, [x9]
  34:	85c1c121 	ld1rsb	{z1.h}, p0/z, [x9, #1]
  38:	d37df06f 	lsl	x15, x3, #3
  3c:	2561d000 	sub	z0.h, z0.h, #128
  40:	2561d004 	sub	z4.h, z4.h, #128
  44:	a42a4105 	ld1b	{z5.h}, p0/z, [x8, x10]
  48:	8b01014a 	add	x10, x10, x1
  4c:	8b03018e 	add	x14, x12, x3
  50:	a42a4107 	ld1b	{z7.h}, p0/z, [x8, x10]
  54:	528000ca 	mov	w10, #0x6                   	// #6
  58:	0443c040 	mad	z0.h, p0/m, z3.h, z2.h
  5c:	2561d005 	sub	z5.h, z5.h, #128
  60:	0420bc50 	movprfx	z16, z2
  64:	04434090 	mla	z16.h, p0/m, z4.h, z3.h
  68:	2561d007 	sub	z7.h, z7.h, #128
  6c:	0420bc06 	movprfx	z6, z0
  70:	04414086 	mla	z6.h, p0/m, z4.h, z1.h
  74:	85c2c120 	ld1rsb	{z0.h}, p0/z, [x9, #2]
  78:	85c3c124 	ld1rsb	{z4.h}, p0/z, [x9, #3]
  7c:	d37ef429 	lsl	x9, x1, #2
  80:	044140b0 	mla	z16.h, p0/m, z5.h, z1.h
  84:	a4294111 	ld1b	{z17.h}, p0/z, [x8, x9]
  88:	8b010129 	add	x9, x9, x1
  8c:	044040a6 	mla	z6.h, p0/m, z5.h, z0.h
  90:	0443c045 	mad	z5.h, p0/m, z3.h, z2.h
  94:	a4294112 	ld1b	{z18.h}, p0/z, [x8, x9]
  98:	044040f0 	mla	z16.h, p0/m, z7.h, z0.h
  9c:	9b0a7c29 	mul	x9, x1, x10
  a0:	2561d011 	sub	z17.h, z17.h, #128
  a4:	2561d012 	sub	z18.h, z18.h, #128
  a8:	9b0a7c6a 	mul	x10, x3, x10
  ac:	044440e6 	mla	z6.h, p0/m, z7.h, z4.h
  b0:	044140e5 	mla	z5.h, p0/m, z7.h, z1.h
  b4:	0443c047 	mad	z7.h, p0/m, z3.h, z2.h
  b8:	04444230 	mla	z16.h, p0/m, z17.h, z4.h
  bc:	2560e406 	add	z6.h, z6.h, #8192
  c0:	04404225 	mla	z5.h, p0/m, z17.h, z0.h
  c4:	04414227 	mla	z7.h, p0/m, z17.h, z1.h
  c8:	2560e410 	add	z16.h, z16.h, #8192
  cc:	0443c051 	mad	z17.h, p0/m, z3.h, z2.h
  d0:	452a08c6 	sqrshrunb	z6.b, z6.h, #6
  d4:	452a0a10 	sqrshrunb	z16.b, z16.h, #6
  d8:	0420bcb3 	movprfx	z19, z5
  dc:	04444253 	mla	z19.h, p0/m, z18.h, z4.h
  e0:	04404247 	mla	z7.h, p0/m, z18.h, z0.h
  e4:	04414251 	mla	z17.h, p0/m, z18.h, z1.h
  e8:	0443c052 	mad	z18.h, p0/m, z3.h, z2.h
  ec:	052668c6 	uzp1	z6.b, z6.b, z6.b
  f0:	05306a05 	uzp1	z5.b, z16.b, z16.b
  f4:	2560e413 	add	z19.h, z19.h, #8192
  f8:	e400e446 	st1b	{z6.b}, p1, [x2]
  fc:	a4294106 	ld1b	{z6.h}, p0/z, [x8, x9]
 100:	d37df029 	lsl	x9, x1, #3
 104:	e4034445 	st1b	{z5.b}, p1, [x2, x3]
 108:	452a0a70 	sqrshrunb	z16.b, z19.h, #6
 10c:	cb01012b 	sub	x11, x9, x1
 110:	2561d006 	sub	z6.h, z6.h, #128
 114:	a42b4105 	ld1b	{z5.h}, p0/z, [x8, x11]
 118:	d37ff86b 	lsl	x11, x3, #1
 11c:	05306a10 	uzp1	z16.b, z16.b, z16.b
 120:	044440c7 	mla	z7.h, p0/m, z6.h, z4.h
 124:	044040d1 	mla	z17.h, p0/m, z6.h, z0.h
 128:	2561d005 	sub	z5.h, z5.h, #128
 12c:	044140d2 	mla	z18.h, p0/m, z6.h, z1.h
 130:	0443c046 	mad	z6.h, p0/m, z3.h, z2.h
 134:	e40b4450 	st1b	{z16.b}, p1, [x2, x11]
 138:	8b03016b 	add	x11, x11, x3
 13c:	a4294110 	ld1b	{z16.h}, p0/z, [x8, x9]
 140:	8b010129 	add	x9, x9, x1
 144:	2560e407 	add	z7.h, z7.h, #8192
 148:	044440b1 	mla	z17.h, p0/m, z5.h, z4.h
 14c:	044040b2 	mla	z18.h, p0/m, z5.h, z0.h
 150:	0420bcd3 	movprfx	z19, z6
 154:	044140b3 	mla	z19.h, p0/m, z5.h, z1.h
 158:	2561d010 	sub	z16.h, z16.h, #128
 15c:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
 160:	2560e411 	add	z17.h, z17.h, #8192
 164:	04444212 	mla	z18.h, p0/m, z16.h, z4.h
 168:	04404213 	mla	z19.h, p0/m, z16.h, z0.h
 16c:	052768e7 	uzp1	z7.b, z7.b, z7.b
 170:	2560e412 	add	z18.h, z18.h, #8192
 174:	e40b4447 	st1b	{z7.b}, p1, [x2, x11]
 178:	452a0a27 	sqrshrunb	z7.b, z17.h, #6
 17c:	0420bc51 	movprfx	z17, z2
 180:	044340b1 	mla	z17.h, p0/m, z5.h, z3.h
 184:	a4294106 	ld1b	{z6.h}, p0/z, [x8, x9]
 188:	52800149 	mov	w9, #0xa                   	// #10
 18c:	9b097c2b 	mul	x11, x1, x9
 190:	2561d006 	sub	z6.h, z6.h, #128
 194:	052768e7 	uzp1	z7.b, z7.b, z7.b
 198:	04414211 	mla	z17.h, p0/m, z16.h, z1.h
 19c:	0443c050 	mad	z16.h, p0/m, z3.h, z2.h
 1a0:	9b097c69 	mul	x9, x3, x9
 1a4:	044440d3 	mla	z19.h, p0/m, z6.h, z4.h
 1a8:	e40c4447 	st1b	{z7.b}, p1, [x2, x12]
 1ac:	452a0a47 	sqrshrunb	z7.b, z18.h, #6
 1b0:	a42b4105 	ld1b	{z5.h}, p0/z, [x8, x11]
 1b4:	5280016b 	mov	w11, #0xb                   	// #11
 1b8:	044040d1 	mla	z17.h, p0/m, z6.h, z0.h
 1bc:	9b0b7c2d 	mul	x13, x1, x11
 1c0:	5280018c 	mov	w12, #0xc                   	// #12
 1c4:	044140d0 	mla	z16.h, p0/m, z6.h, z1.h
 1c8:	0443c046 	mad	z6.h, p0/m, z3.h, z2.h
 1cc:	2560e413 	add	z19.h, z19.h, #8192
 1d0:	052768e7 	uzp1	z7.b, z7.b, z7.b
 1d4:	2561d005 	sub	z5.h, z5.h, #128
 1d8:	452a0a72 	sqrshrunb	z18.b, z19.h, #6
 1dc:	e40e4447 	st1b	{z7.b}, p1, [x2, x14]
 1e0:	9b0c7c2e 	mul	x14, x1, x12
 1e4:	a42d4107 	ld1b	{z7.h}, p0/z, [x8, x13]
 1e8:	044440b1 	mla	z17.h, p0/m, z5.h, z4.h
 1ec:	044040b0 	mla	z16.h, p0/m, z5.h, z0.h
 1f0:	044140a6 	mla	z6.h, p0/m, z5.h, z1.h
 1f4:	0443c045 	mad	z5.h, p0/m, z3.h, z2.h
 1f8:	cb0301ed 	sub	x13, x15, x3
 1fc:	05326a52 	uzp1	z18.b, z18.b, z18.b
 200:	2561d007 	sub	z7.h, z7.h, #128
 204:	2560e411 	add	z17.h, z17.h, #8192
 208:	e40a4452 	st1b	{z18.b}, p1, [x2, x10]
 20c:	044440f0 	mla	z16.h, p0/m, z7.h, z4.h
 210:	044040e6 	mla	z6.h, p0/m, z7.h, z0.h
 214:	a42e4112 	ld1b	{z18.h}, p0/z, [x8, x14]
 218:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 21c:	528001aa 	mov	w10, #0xd                   	// #13
 220:	9b0a7c2e 	mul	x14, x1, x10
 224:	044140e5 	mla	z5.h, p0/m, z7.h, z1.h
 228:	0443c047 	mad	z7.h, p0/m, z3.h, z2.h
 22c:	2561d012 	sub	z18.h, z18.h, #128
 230:	2560e410 	add	z16.h, z16.h, #8192
 234:	05316a31 	uzp1	z17.b, z17.b, z17.b
 238:	04444246 	mla	z6.h, p0/m, z18.h, z4.h
 23c:	452a0a10 	sqrshrunb	z16.b, z16.h, #6
 240:	0420bcb3 	movprfx	z19, z5
 244:	04404253 	mla	z19.h, p0/m, z18.h, z0.h
 248:	e40d4451 	st1b	{z17.b}, p1, [x2, x13]
 24c:	528001cd 	mov	w13, #0xe                   	// #14
 250:	04414247 	mla	z7.h, p0/m, z18.h, z1.h
 254:	a42e4111 	ld1b	{z17.h}, p0/z, [x8, x14]
 258:	9b0d7c2e 	mul	x14, x1, x13
 25c:	0443c052 	mad	z18.h, p0/m, z3.h, z2.h
 260:	2560e406 	add	z6.h, z6.h, #8192
 264:	05306a10 	uzp1	z16.b, z16.b, z16.b
 268:	2561d011 	sub	z17.h, z17.h, #128
 26c:	452a08c6 	sqrshrunb	z6.b, z6.h, #6
 270:	e40f4450 	st1b	{z16.b}, p1, [x2, x15]
 274:	8b0301ef 	add	x15, x15, x3
 278:	a42e4105 	ld1b	{z5.h}, p0/z, [x8, x14]
 27c:	d37cec2e 	lsl	x14, x1, #4
 280:	04444233 	mla	z19.h, p0/m, z17.h, z4.h
 284:	04404227 	mla	z7.h, p0/m, z17.h, z0.h
 288:	04414232 	mla	z18.h, p0/m, z17.h, z1.h
 28c:	0443c051 	mad	z17.h, p0/m, z3.h, z2.h
 290:	052668c6 	uzp1	z6.b, z6.b, z6.b
 294:	2561d005 	sub	z5.h, z5.h, #128
 298:	2560e413 	add	z19.h, z19.h, #8192
 29c:	e40f4446 	st1b	{z6.b}, p1, [x2, x15]
 2a0:	cb0101cf 	sub	x15, x14, x1
 2a4:	044440a7 	mla	z7.h, p0/m, z5.h, z4.h
 2a8:	a42f4106 	ld1b	{z6.h}, p0/z, [x8, x15]
 2ac:	044040b2 	mla	z18.h, p0/m, z5.h, z0.h
 2b0:	452a0a70 	sqrshrunb	z16.b, z19.h, #6
 2b4:	0420bc53 	movprfx	z19, z2
 2b8:	044340b3 	mla	z19.h, p0/m, z5.h, z3.h
 2bc:	0441c225 	mad	z5.h, p0/m, z1.h, z17.h
 2c0:	2561d006 	sub	z6.h, z6.h, #128
 2c4:	2560e407 	add	z7.h, z7.h, #8192
 2c8:	05306a10 	uzp1	z16.b, z16.b, z16.b
 2cc:	044440d2 	mla	z18.h, p0/m, z6.h, z4.h
 2d0:	452a08e7 	sqrshrunb	z7.b, z7.h, #6
 2d4:	044340c2 	mla	z2.h, p0/m, z6.h, z3.h
 2d8:	e4094450 	st1b	{z16.b}, p1, [x2, x9]
 2dc:	9b0b7c69 	mul	x9, x3, x11
 2e0:	044140d3 	mla	z19.h, p0/m, z6.h, z1.h
 2e4:	a42e4110 	ld1b	{z16.h}, p0/z, [x8, x14]
 2e8:	044040c5 	mla	z5.h, p0/m, z6.h, z0.h
 2ec:	9b0c7c6b 	mul	x11, x3, x12
 2f0:	5280024c 	mov	w12, #0x12                  	// #18
 2f4:	2560e412 	add	z18.h, z18.h, #8192
 2f8:	052768e7 	uzp1	z7.b, z7.b, z7.b
 2fc:	2561d010 	sub	z16.h, z16.h, #128
 300:	9b0c7c2c 	mul	x12, x1, x12
 304:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 308:	e4094447 	st1b	{z7.b}, p1, [x2, x9]
 30c:	8b0101c9 	add	x9, x14, x1
 310:	a4294103 	ld1b	{z3.h}, p0/z, [x8, x9]
 314:	0450c041 	mad	z1.h, p0/m, z16.h, z2.h
 318:	04404213 	mla	z19.h, p0/m, z16.h, z0.h
 31c:	04444205 	mla	z5.h, p0/m, z16.h, z4.h
 320:	9b0d7c69 	mul	x9, x3, x13
 324:	05326a47 	uzp1	z7.b, z18.b, z18.b
 328:	2561d003 	sub	z3.h, z3.h, #128
 32c:	2560e405 	add	z5.h, z5.h, #8192
 330:	e40b4447 	st1b	{z7.b}, p1, [x2, x11]
 334:	0443c020 	mad	z0.h, p0/m, z3.h, z1.h
 338:	0444c263 	mad	z3.h, p0/m, z4.h, z19.h
 33c:	a42c4102 	ld1b	{z2.h}, p0/z, [x8, x12]
 340:	9b0a7c68 	mul	x8, x3, x10
 344:	452a08a1 	sqrshrunb	z1.b, z5.h, #6
 348:	2561d002 	sub	z2.h, z2.h, #128
 34c:	2560e403 	add	z3.h, z3.h, #8192
 350:	05216821 	uzp1	z1.b, z1.b, z1.b
 354:	04444040 	mla	z0.h, p0/m, z2.h, z4.h
 358:	452a0862 	sqrshrunb	z2.b, z3.h, #6
 35c:	e4084441 	st1b	{z1.b}, p1, [x2, x8]
 360:	d37cec68 	lsl	x8, x3, #4
 364:	2560e400 	add	z0.h, z0.h, #8192
 368:	05226842 	uzp1	z2.b, z2.b, z2.b
 36c:	452a0800 	sqrshrunb	z0.b, z0.h, #6
 370:	e4094442 	st1b	{z2.b}, p1, [x2, x9]
 374:	cb030049 	sub	x9, x2, x3
 378:	05206800 	uzp1	z0.b, z0.b, z0.b
 37c:	e4084520 	st1b	{z0.b}, p1, [x9, x8]
 380:	d65f03c0 	ret
