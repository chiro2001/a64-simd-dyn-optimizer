
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
  58:	90000009 	adrp	x9, 0 <dynopt_interp8_32x32_sve2_sdoth>
  5c:	91000129 	add	x9, x9, #0x0
  60:	85804100 	ldr	z0, [x8]
  64:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  68:	91000108 	add	x8, x8, #0x0
  6c:	85804102 	ldr	z2, [x8]
  70:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  74:	91000108 	add	x8, x8, #0x0
  78:	85804103 	ldr	z3, [x8]
  7c:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  80:	91000108 	add	x8, x8, #0x0
  84:	85804104 	ldr	z4, [x8]
  88:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  8c:	91000108 	add	x8, x8, #0x0
  90:	85804105 	ldr	z5, [x8]
  94:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  98:	91000108 	add	x8, x8, #0x0
  9c:	9a8a0129 	csel	x9, x9, x10, eq	// eq = none
  a0:	85804106 	ldr	z6, [x8]
  a4:	90000008 	adrp	x8, 0 <dynopt_interp8_32x32_sve2_sdoth>
  a8:	91000108 	add	x8, x8, #0x0
  ac:	85804121 	ldr	z1, [x9]
  b0:	2558e3e1 	ptrue	p1.h
  b4:	85804107 	ldr	z7, [x8]
  b8:	2518e3e2 	ptrue	p2.b
  bc:	91005408 	add	x8, x0, #0x15
  c0:	52800409 	mov	w9, #0x20                  	// #32
  c4:	928002ea 	mov	x10, #0xffffffffffffffe8    	// #-24
  c8:	5280020c 	mov	w12, #0x10                  	// #16
  cc:	5280030d 	mov	w13, #0x18                  	// #24
  d0:	a40a4911 	ld1b	{z17.b}, p2/z, [x8, x10]
  d4:	f1000529 	subs	x9, x9, #0x1
  d8:	2521d011 	sub	z17.b, z17.b, #128
  dc:	05223232 	tbl	z18.b, {z17.b}, z2.b
  e0:	0420be14 	movprfx	z20, z16
  e4:	44400254 	sdot	z20.h, z18.b, z0.b
  e8:	05233233 	tbl	z19.b, {z17.b}, z3.b
  ec:	44410274 	sdot	z20.h, z19.b, z1.b
  f0:	05243233 	tbl	z19.b, {z17.b}, z4.b
  f4:	4451a694 	addp	z20.h, p1/m, z20.h, z20.h
  f8:	05746a92 	uzp1	z18.h, z20.h, z20.h
  fc:	05253234 	tbl	z20.b, {z17.b}, z5.b
 100:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 104:	05326a52 	uzp1	z18.b, z18.b, z18.b
 108:	e400e052 	st1b	{z18.b}, p0, [x2]
 10c:	0420be12 	movprfx	z18, z16
 110:	44400272 	sdot	z18.h, z19.b, z0.b
 114:	05263233 	tbl	z19.b, {z17.b}, z6.b
 118:	44410292 	sdot	z18.h, z20.b, z1.b
 11c:	05273231 	tbl	z17.b, {z17.b}, z7.b
 120:	4451a652 	addp	z18.h, p1/m, z18.h, z18.h
 124:	05726a52 	uzp1	z18.h, z18.h, z18.h
 128:	452a0a52 	sqrshrunb	z18.b, z18.h, #6
 12c:	05326a52 	uzp1	z18.b, z18.b, z18.b
 130:	e40b4052 	st1b	{z18.b}, p0, [x2, x11]
 134:	0420be12 	movprfx	z18, z16
 138:	44400272 	sdot	z18.h, z19.b, z0.b
 13c:	44410232 	sdot	z18.h, z17.b, z1.b
 140:	4451a652 	addp	z18.h, p1/m, z18.h, z18.h
 144:	05726a51 	uzp1	z17.h, z18.h, z18.h
 148:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 14c:	05316a31 	uzp1	z17.b, z17.b, z17.b
 150:	e40c4051 	st1b	{z17.b}, p0, [x2, x12]
 154:	85804111 	ldr	z17, [x8]
 158:	8b010108 	add	x8, x8, x1
 15c:	2521d011 	sub	z17.b, z17.b, #128
 160:	05223232 	tbl	z18.b, {z17.b}, z2.b
 164:	0420be13 	movprfx	z19, z16
 168:	44400253 	sdot	z19.h, z18.b, z0.b
 16c:	05233231 	tbl	z17.b, {z17.b}, z3.b
 170:	44410233 	sdot	z19.h, z17.b, z1.b
 174:	4451a673 	addp	z19.h, p1/m, z19.h, z19.h
 178:	05736a71 	uzp1	z17.h, z19.h, z19.h
 17c:	452a0a31 	sqrshrunb	z17.b, z17.h, #6
 180:	05316a31 	uzp1	z17.b, z17.b, z17.b
 184:	e40d4051 	st1b	{z17.b}, p0, [x2, x13]
 188:	8b030042 	add	x2, x2, x3
 18c:	54fffa21 	b.ne	d0 <dynopt_interp8_32x32_sve2_sdoth+0xd0>  // b.any
 190:	d65f03c0 	ret
