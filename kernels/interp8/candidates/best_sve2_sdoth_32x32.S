
kernels/interp8/candidates/best_sve2_sdoth_32x32.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_interp8_32x32_sve2_sdoth>:
   0:	51000488 	sub	w8, w4, #0x1
   4:	90000009 	adrp	x9, 0 <dynopt_interp8_32x32_sve2_sdoth>
   8:	91000129 	add	x9, x9, #0x0
   c:	71000d1f 	cmp	w8, #0x3
  10:	52800048 	mov	w8, #0x2                   	// #2
  14:	9000000a 	adrp	x10, 0 <dynopt_interp8_32x32_sve2_sdoth>
  18:	9100014a 	add	x10, x10, #0x0
  1c:	1a883088 	csel	w8, w4, w8, cc	// cc = lo, ul, last
  20:	9000000b 	adrp	x11, 0 <dynopt_interp8_32x32_sve2_sdoth>
  24:	9100016b 	add	x11, x11, #0x0
  28:	71000d1f 	cmp	w8, #0x3
  2c:	9000000c 	adrp	x12, 0 <dynopt_interp8_32x32_sve2_sdoth>
  30:	9100018c 	add	x12, x12, #0x0
  34:	9a890149 	csel	x9, x10, x9, eq	// eq = none
  38:	2578e210 	mov	z16.h, #4096
  3c:	9a8b018a 	csel	x10, x12, x11, eq	// eq = none
  40:	7100051f 	cmp	w8, #0x1
  44:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  48:	91000108 	add	x8, x8, #0x0
  4c:	2518e100 	ptrue	p0.b, vl8
  50:	5280010b 	mov	w11, #0x8                   	// #8
  54:	9a890108 	csel	x8, x8, x9, eq	// eq = none
  58:	2518e3e1 	ptrue	p1.b
  5c:	52800409 	mov	w9, #0x20                  	// #32
  60:	85804100 	ldr	z0, [x8]
  64:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  68:	91000108 	add	x8, x8, #0x0
  6c:	9a8a0108 	csel	x8, x8, x10, eq	// eq = none
  70:	928002ea 	mov	x10, #0xffffffffffffffe8    	// #-24
  74:	5280020c 	mov	w12, #0x10                  	// #16
  78:	85804101 	ldr	z1, [x8]
  7c:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  80:	91000108 	add	x8, x8, #0x0
  84:	85804102 	ldr	z2, [x8]
  88:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  8c:	91000108 	add	x8, x8, #0x0
  90:	85804103 	ldr	z3, [x8]
  94:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  98:	91000108 	add	x8, x8, #0x0
  9c:	85804104 	ldr	z4, [x8]
  a0:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  a4:	91000108 	add	x8, x8, #0x0
  a8:	85804105 	ldr	z5, [x8]
  ac:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  b0:	91000108 	add	x8, x8, #0x0
  b4:	85804106 	ldr	z6, [x8]
  b8:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  bc:	91000108 	add	x8, x8, #0x0
  c0:	85804107 	ldr	z7, [x8]
  c4:	91005408 	add	x8, x0, #0x15
  c8:	5280030d 	mov	w13, #0x18                  	// #24
  cc:	a40a4511 	ld1b	{z17.b}, p1/z, [x8, x10]
  d0:	f1000529 	subs	x9, x9, #0x1
  d4:	2521d011 	sub	z17.b, z17.b, #128
  d8:	05223232 	tbl	z18.b, {z17.b}, z2.b
  dc:	05233233 	tbl	z19.b, {z17.b}, z3.b
  e0:	0420be14 	movprfx	z20, z16
  e4:	44400254 	sdot	z20.h, z18.b, z0.b
  e8:	44410274 	sdot	z20.h, z19.b, z1.b
  ec:	05746a92 	uzp1	z18.h, z20.h, z20.h
  f0:	05746e93 	uzp2	z19.h, z20.h, z20.h
  f4:	05253234 	tbl	z20.b, {z17.b}, z5.b
  f8:	04730252 	add	z18.h, z18.h, z19.h
  fc:	05243233 	tbl	z19.b, {z17.b}, z4.b
 100:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 104:	05326a52 	uzp1	z18.b, z18.b, z18.b
 108:	e400e052 	st1b	{z18.b}, p0, [x2]
 10c:	0420be12 	movprfx	z18, z16
 110:	44400272 	sdot	z18.h, z19.b, z0.b
 114:	44410292 	sdot	z18.h, z20.b, z1.b
 118:	05726a53 	uzp1	z19.h, z18.h, z18.h
 11c:	05726e52 	uzp2	z18.h, z18.h, z18.h
 120:	04720272 	add	z18.h, z19.h, z18.h
 124:	05263233 	tbl	z19.b, {z17.b}, z6.b
 128:	05273231 	tbl	z17.b, {z17.b}, z7.b
 12c:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 130:	05326a52 	uzp1	z18.b, z18.b, z18.b
 134:	e40b4052 	st1b	{z18.b}, p0, [x2, x11]
 138:	0420be12 	movprfx	z18, z16
 13c:	44400272 	sdot	z18.h, z19.b, z0.b
 140:	44410232 	sdot	z18.h, z17.b, z1.b
 144:	05726a51 	uzp1	z17.h, z18.h, z18.h
 148:	05726e52 	uzp2	z18.h, z18.h, z18.h
 14c:	04720231 	add	z17.h, z17.h, z18.h
 150:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 154:	05316a31 	uzp1	z17.b, z17.b, z17.b
 158:	e40c4051 	st1b	{z17.b}, p0, [x2, x12]
 15c:	85804111 	ldr	z17, [x8]
 160:	8b010108 	add	x8, x8, x1
 164:	2521d011 	sub	z17.b, z17.b, #128
 168:	05223232 	tbl	z18.b, {z17.b}, z2.b
 16c:	05233231 	tbl	z17.b, {z17.b}, z3.b
 170:	0420be13 	movprfx	z19, z16
 174:	44400253 	sdot	z19.h, z18.b, z0.b
 178:	44410233 	sdot	z19.h, z17.b, z1.b
 17c:	05736a71 	uzp1	z17.h, z19.h, z19.h
 180:	05736e72 	uzp2	z18.h, z19.h, z19.h
 184:	04720231 	add	z17.h, z17.h, z18.h
 188:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 18c:	05316a31 	uzp1	z17.b, z17.b, z17.b
 190:	e40d4051 	st1b	{z17.b}, p0, [x2, x13]
 194:	8b030042 	add	x2, x2, x3
 198:	54fff9a1 	b.ne	cc <dynopt_interp8_32x32_sve2_sdoth+0xcc>  // b.any
 19c:	d65f03c0 	ret
