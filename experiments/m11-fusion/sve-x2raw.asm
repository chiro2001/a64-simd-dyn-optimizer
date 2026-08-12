
build/sve3.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sa8d_8x8x2raw_neon_sve2>:
   0:	52800204 	mov	w4, #0x10                  	// #16
   4:	256407e7 	whilelt	p7.h, wzr, w4
   8:	a420bc1f 	ld1b	{z31.h}, p7/z, [x0]
   c:	8b010004 	add	x4, x0, x1
  10:	a4215c1e 	ld1b	{z30.h}, p7/z, [x0, x1]
  14:	8b010400 	add	x0, x0, x1, lsl #1
  18:	8b000025 	add	x5, x1, x0
  1c:	a4215c85 	ld1b	{z5.h}, p7/z, [x4, x1]
  20:	a4205c22 	ld1b	{z2.h}, p7/z, [x1, x0]
  24:	8b030044 	add	x4, x2, x3
  28:	8b010400 	add	x0, x0, x1, lsl #1
  2c:	a420bc51 	ld1b	{z17.h}, p7/z, [x2]
  30:	a4235c47 	ld1b	{z7.h}, p7/z, [x2, x3]
  34:	8b030442 	add	x2, x2, x3, lsl #1
  38:	047107f1 	sub	z17.h, z31.h, z17.h
  3c:	a4255c21 	ld1b	{z1.h}, p7/z, [x1, x5]
  40:	a4205c36 	ld1b	{z22.h}, p7/z, [x1, x0]
  44:	8b000025 	add	x5, x1, x0
  48:	a4235c99 	ld1b	{z25.h}, p7/z, [x4, x3]
  4c:	8b010400 	add	x0, x0, x1, lsl #1
  50:	047904b9 	sub	z25.h, z5.h, z25.h
  54:	a4205c32 	ld1b	{z18.h}, p7/z, [x1, x0]
  58:	8b020064 	add	x4, x3, x2
  5c:	a4225c78 	ld1b	{z24.h}, p7/z, [x3, x2]
  60:	a4255c20 	ld1b	{z0.h}, p7/z, [x1, x5]
  64:	8b030442 	add	x2, x2, x3, lsl #1
  68:	046707c7 	sub	z7.h, z30.h, z7.h
  6c:	8b020060 	add	x0, x3, x2
  70:	047100fc 	add	z28.h, z7.h, z17.h
  74:	04780458 	sub	z24.h, z2.h, z24.h
  78:	04670627 	sub	z7.h, z17.h, z7.h
  7c:	0479031b 	add	z27.h, z24.h, z25.h
  80:	a4225c63 	ld1b	{z3.h}, p7/z, [x3, x2]
  84:	047c0366 	add	z6.h, z27.h, z28.h
  88:	a4205c70 	ld1b	{z16.h}, p7/z, [x3, x0]
  8c:	047b079b 	sub	z27.h, z28.h, z27.h
  90:	04700410 	sub	z16.h, z0.h, z16.h
  94:	046306c3 	sub	z3.h, z22.h, z3.h
  98:	04780738 	sub	z24.h, z25.h, z24.h
  9c:	8b030442 	add	x2, x2, x3, lsl #1
  a0:	04670317 	add	z23.h, z24.h, z7.h
  a4:	a4245c73 	ld1b	{z19.h}, p7/z, [x3, x4]
  a8:	047804f8 	sub	z24.h, z7.h, z24.h
  ac:	04730433 	sub	z19.h, z1.h, z19.h
  b0:	a4225c7d 	ld1b	{z29.h}, p7/z, [x3, x2]
  b4:	04730064 	add	z4.h, z3.h, z19.h
  b8:	047d065d 	sub	z29.h, z18.h, z29.h
  bc:	04630663 	sub	z3.h, z19.h, z3.h
  c0:	047003b5 	add	z21.h, z29.h, z16.h
  c4:	047d061d 	sub	z29.h, z16.h, z29.h
  c8:	046402b4 	add	z20.h, z21.h, z4.h
  cc:	046303a5 	add	z5.h, z29.h, z3.h
  d0:	04660282 	add	z2.h, z20.h, z6.h
  d4:	047700b1 	add	z17.h, z5.h, z23.h
  d8:	04750495 	sub	z21.h, z4.h, z21.h
  dc:	05717041 	trn1	z1.h, z2.h, z17.h
  e0:	047b02ba 	add	z26.h, z21.h, z27.h
  e4:	047d047d 	sub	z29.h, z3.h, z29.h
  e8:	05717451 	trn2	z17.h, z2.h, z17.h
  ec:	047803b9 	add	z25.h, z29.h, z24.h
  f0:	04610232 	add	z18.h, z17.h, z1.h
  f4:	05797340 	trn1	z0.h, z26.h, z25.h
  f8:	05797759 	trn2	z25.h, z26.h, z25.h
  fc:	04600336 	add	z22.h, z25.h, z0.h
 100:	05b6725f 	trn1	z31.s, z18.s, z22.s
 104:	047404d4 	sub	z20.h, z6.h, z20.h
 108:	04750775 	sub	z21.h, z27.h, z21.h
 10c:	04710431 	sub	z17.h, z1.h, z17.h
 110:	046506e5 	sub	z5.h, z23.h, z5.h
 114:	047d071d 	sub	z29.h, z24.h, z29.h
 118:	05657290 	trn1	z16.h, z20.h, z5.h
 11c:	057d72a7 	trn1	z7.h, z21.h, z29.h
 120:	04790419 	sub	z25.h, z0.h, z25.h
 124:	05b67656 	trn2	z22.s, z18.s, z22.s
 128:	05b9723e 	trn1	z30.s, z17.s, z25.s
 12c:	05657685 	trn2	z5.h, z20.h, z5.h
 130:	05b97639 	trn2	z25.s, z17.s, z25.s
 134:	047000a6 	add	z6.h, z5.h, z16.h
 138:	057d76bd 	trn2	z29.h, z21.h, z29.h
 13c:	04650605 	sub	z5.h, z16.h, z5.h
 140:	046703b8 	add	z24.h, z29.h, z7.h
 144:	047f02db 	add	z27.h, z22.h, z31.h
 148:	05b870c4 	trn1	z4.s, z6.s, z24.s
 14c:	044c1ff6 	sabd	z22.h, p7/m, z22.h, z31.h
 150:	047d04fd 	sub	z29.h, z7.h, z29.h
 154:	05b874d8 	trn2	z24.s, z6.s, z24.s
 158:	05bd70a3 	trn1	z3.s, z5.s, z29.s
 15c:	0456bf7b 	abs	z27.h, p7/m, z27.h
 160:	05bd74bd 	trn2	z29.s, z5.s, z29.s
 164:	047e0337 	add	z23.h, z25.h, z30.h
 168:	04640313 	add	z19.h, z24.h, z4.h
 16c:	0456bef7 	abs	z23.h, p7/m, z23.h
 170:	044c1fd9 	sabd	z25.h, p7/m, z25.h, z30.h
 174:	0456be73 	abs	z19.h, p7/m, z19.h
 178:	044c1c98 	sabd	z24.h, p7/m, z24.h, z4.h
 17c:	046303bc 	add	z28.h, z29.h, z3.h
 180:	05f37362 	trn1	z2.d, z27.d, z19.d
 184:	0456bf9c 	abs	z28.h, p7/m, z28.h
 188:	044c1c7d 	sabd	z29.h, p7/m, z29.h, z3.h
 18c:	05fc72e1 	trn1	z1.d, z23.d, z28.d
 190:	05f872c0 	trn1	z0.d, z22.d, z24.d
 194:	05fd733a 	trn1	z26.d, z25.d, z29.d
 198:	05f37773 	trn2	z19.d, z27.d, z19.d
 19c:	05fc76fc 	trn2	z28.d, z23.d, z28.d
 1a0:	04491c53 	umax	z19.h, p7/m, z19.h, z2.h
 1a4:	04491c3c 	umax	z28.h, p7/m, z28.h, z1.h
 1a8:	05f876d8 	trn2	z24.d, z22.d, z24.d
 1ac:	05fd773d 	trn2	z29.d, z25.d, z29.d
 1b0:	04491c18 	umax	z24.h, p7/m, z24.h, z0.h
 1b4:	04491f5d 	umax	z29.h, p7/m, z29.h, z26.h
 1b8:	0473039c 	add	z28.h, z28.h, z19.h
 1bc:	0478039c 	add	z28.h, z28.h, z24.h
 1c0:	047d039c 	add	z28.h, z28.h, z29.h
 1c4:	04413f9f 	uaddv	d31, p7, z28.h
 1c8:	9e6603e0 	fmov	x0, d31
 1cc:	d65f03c0 	ret
