	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_32x16_sve2_vpp
	.type	dynopt_interp8_32x16_sve2_vpp, %function
dynopt_interp8_32x16_sve2_vpp:
.LFB3:
	.cfi_startproc
	stp	d12, d13, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 76, -32
	.cfi_offset 77, -24
	sub	w5, w4, #1
	stp	d14, d15, [sp, 16]
	.cfi_offset 78, -16
	.cfi_offset 79, -8
	cmp	w5, 2
	bhi	.L3
	cmp	w4, 1
	beq	.L4
	mov	z31.b, #-1
	mov	z30.h, #4
	cmp	w4, 3
	bne	.L7
	mov	z29.h, #-10
	mov	z28.h, #58
	mov	z27.h, #17
	mov	z26.h, #-5
	mov	z25.h, #1
	movi	d24, #0
	b	.L2
	.p2align 2,,3
.L3:
	mov	z31.b, #-1
	mov	z30.h, #4
.L7:
	mov	z29.h, #-11
	mov	z28.h, #40
	mov	z26.d, z29.d
	mov	z27.d, z28.d
	mov	z25.d, z30.d
	mov	z24.d, z31.d
.L2:
	add	x7, x1, x1, lsl 1
	ptrue	p7.b, all
	lsl	x4, x1, 1
	sub	x5, x0, x7
	ld1b	z17.h, p7/z, [x0]
	add	x4, x4, 16
	add	x6, x5, 16
	ld1b	z22.h, p7/z, [x6]
	add	x0, x0, 16
	add	x6, x5, x1
	ld1b	z19.h, p7/z, [x6, x1]
	ld1b	z18.h, p7/z, [x5, x4]
	lsl	x6, x1, 2
	ld1b	z16.h, p7/z, [x0]
	add	x0, x5, x1, lsl 2
	add	x4, x6, 16
	ld1b	z6.h, p7/z, [x5, x4]
	ld1b	z7.h, p7/z, [x5, x6]
	add	x4, x0, x1
	add	x6, x6, x1
	ld1b	z3.h, p7/z, [x1, x4]
	add	x8, x1, 16
	lsl	x4, x7, 1
	ld1b	z20.h, p7/z, [x5, x8]
	ld1b	z5.h, p7/z, [x0, x1]
	add	x8, x6, 16
	add	x0, x0, x1, lsl 1
	add	x4, x4, 16
	ld1b	z4.h, p7/z, [x5, x8]
	ld1b	z2.h, p7/z, [x5, x4]
	lsl	x8, x1, 3
	add	x4, x1, x0
	ld1b	z15.h, p7/z, [x1, x4]
	sub	x12, x8, x1
	add	x4, x8, 16
	mov	z13.h, #4096
	add	x8, x8, x1
	ld1b	z14.h, p7/z, [x5, x4]
	ld1b	z23.h, p7/z, [x5]
	sub	z3.h, z3.h, #128
	sub	z2.h, z2.h, #128
	sub	z7.h, z7.h, #128
	sub	z6.h, z6.h, #128
	add	x4, x8, 16
	sub	z19.h, z19.h, #128
	sub	z18.h, z18.h, #128
	sub	z23.h, z23.h, #128
	sub	z22.h, z22.h, #128
	mad	z23.h, p7/m, z24.h, z13.h
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z19.h, z26.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z22.h, p7/m, z2.h, z30.h
	ld1b	z1.h, p7/z, [x1, x0]
	ld1b	z21.h, p7/z, [x5, x1]
	sub	z1.h, z1.h, #128
	sub	z5.h, z5.h, #128
	sub	z4.h, z4.h, #128
	sub	z17.h, z17.h, #128
	sub	z16.h, z16.h, #128
	add	x9, x12, 16
	sub	z21.h, z21.h, #128
	ld1b	z0.h, p7/z, [x5, x9]
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	sub	z0.h, z0.h, #128
	mla	z12.h, p7/m, z17.h, z27.h
	sub	z20.h, z20.h, #128
	mla	z12.h, p7/m, z5.h, z29.h
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	movprfx	z23, z13
	mla	z23.h, p7/m, z20.h, z25.h
	sqrshrunb	z12.b, z12.h, #6
	mla	z23.h, p7/m, z16.h, z27.h
	uzp1	z12.b, z12.b, z12.b
	mla	z23.h, p7/m, z4.h, z29.h
	mla	z23.h, p7/m, z0.h, z31.h
	add	z23.h, z22.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	stp	q12, q23, [x2]
	ld1b	z22.h, p7/z, [x5, x4]
	add	x4, x2, x3
	sub	z15.h, z15.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	add	x0, x0, x1, lsl 1
	mad	z21.h, p7/m, z24.h, z13.h
	ld1b	z12.h, p7/z, [x1, x0]
	add	x9, x1, x0
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z21.h, p7/m, z1.h, z30.h
	mla	z23.h, p7/m, z15.h, z31.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x2, x3]
	sub	z14.h, z14.h, #128
	movprfx	z21, z13
	mla	z21.h, p7/m, z18.h, z25.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z21.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z21.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	add	z21.h, z20.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x4, 16]
	ld1b	z23.h, p7/z, [x1, x9]
	lsl	x9, x6, 1
	sub	z12.h, z12.h, #128
	add	x11, x2, x3, lsl 1
	add	x10, x9, 16
	ld1b	z20.h, p7/z, [x5, x10]
	add	x10, x4, x3
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z12.h, z31.h
	mla	z19.h, p7/m, z15.h, z30.h
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x4, x3]
	sub	z22.h, z22.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z16.h, z25.h
	add	x9, x9, x1
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z4.h, z27.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z19.h, p7/m, z0.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z19.h, p7/m, z22.h, z31.h
	mla	z18.h, p7/m, z14.h, z30.h
	add	z19.h, z18.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x11, 16]
	sub	z23.h, z23.h, #128
	add	x0, x0, x1, lsl 1
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	ld1b	z21.h, p7/z, [x1, x0]
	add	x13, x9, 16
	mad	z17.h, p7/m, z24.h, z13.h
	ld1b	z18.h, p7/z, [x5, x13]
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z1.h, z28.h
	mla	z19.h, p7/m, z15.h, z29.h
	mla	z17.h, p7/m, z12.h, z30.h
	mla	z19.h, p7/m, z23.h, z31.h
	add	z19.h, z17.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x10]
	add	x10, x3, x3, lsl 1
	add	x13, x2, x10
	sub	z20.h, z20.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z6.h, z25.h
	add	x4, x4, x3, lsl 1
	add	x11, x1, x0
	mad	z16.h, p7/m, z24.h, z13.h
	lsl	x7, x7, 2
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z17.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z0.h, z28.h
	mla	z17.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z22.h, z30.h
	mla	z17.h, p7/m, z20.h, z31.h
	add	z17.h, z16.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x13, 16]
	add	x13, x2, x3, lsl 2
	ld1b	z19.h, p7/z, [x1, x11]
	add	x11, x7, 16
	ld1b	z16.h, p7/z, [x5, x11]
	add	x11, x3, x4
	sub	z21.h, z21.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	mad	z7.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z7.h, p7/m, z3.h, z26.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z7.h, p7/m, z15.h, z28.h
	mla	z17.h, p7/m, z21.h, z31.h
	mla	z7.h, p7/m, z23.h, z30.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x4]
	sub	z18.h, z18.h, #128
	movprfx	z7, z13
	mla	z7.h, p7/m, z4.h, z25.h
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	mla	z7.h, p7/m, z22.h, z29.h
	mla	z6.h, p7/m, z14.h, z28.h
	mla	z7.h, p7/m, z18.h, z31.h
	mla	z6.h, p7/m, z20.h, z30.h
	add	x7, x7, x1
	add	z7.h, z6.h, z7.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x13, 16]
	sub	z19.h, z19.h, #128
	add	x0, x0, x1, lsl 1
	movprfx	z7, z13
	mla	z7.h, p7/m, z3.h, z25.h
	ld1b	z17.h, p7/z, [x1, x0]
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z7.h, p7/m, z15.h, z27.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z7.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z7.h, p7/m, z19.h, z31.h
	mla	z5.h, p7/m, z21.h, z30.h
	add	x7, x7, 16
	add	z7.h, z5.h, z7.h
	ld1b	z6.h, p7/z, [x5, x7]
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x11]
	add	x11, x3, x3, lsl 2
	sub	z16.h, z16.h, #128
	movprfx	z5, z13
	mla	z5.h, p7/m, z2.h, z25.h
	add	x7, x2, x11
	add	x4, x4, x3, lsl 1
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z5.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z5.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z5.h, z4.h, z5.h
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x7, 16]
	add	x7, x2, x10, lsl 1
	sub	z17.h, z17.h, #128
	add	x13, x1, x0
	movprfx	z5, z13
	mla	z5.h, p7/m, z1.h, z25.h
	ld1b	z7.h, p7/z, [x1, x13]
	lsl	x12, x12, 1
	lsl	x13, x1, 4
	mad	z3.h, p7/m, z24.h, z13.h
	mla	z5.h, p7/m, z12.h, z27.h
	mla	z3.h, p7/m, z15.h, z26.h
	mla	z5.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	mla	z5.h, p7/m, z17.h, z31.h
	mla	z3.h, p7/m, z19.h, z30.h
	add	x12, x12, 16
	add	z5.h, z3.h, z5.h
	ld1b	z4.h, p7/z, [x5, x12]
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z6.h, z6.h, #128
	add	x12, x3, x4
	movprfx	z3, z13
	mla	z3.h, p7/m, z0.h, z25.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z3.h, p7/m, z18.h, z29.h
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z3.h, p7/m, z6.h, z31.h
	mla	z2.h, p7/m, z16.h, z30.h
	add	z3.h, z2.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x7, 16]
	sub	x7, x13, x1
	add	x7, x7, 16
	ld1b	z2.h, p7/z, [x5, x7]
	sub	z7.h, z7.h, #128
	lsl	x7, x3, 3
	add	x0, x0, x1, lsl 1
	movprfx	z3, z13
	mla	z3.h, p7/m, z15.h, z25.h
	ld1b	z5.h, p7/z, [x1, x0]
	mad	z1.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z23.h, z27.h
	mla	z1.h, p7/m, z12.h, z26.h
	mla	z3.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z3.h, p7/m, z7.h, z31.h
	mla	z1.h, p7/m, z17.h, z30.h
	add	z3.h, z1.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x12]
	sub	x12, x7, x3
	sub	z4.h, z4.h, #128
	movprfx	z1, z13
	mla	z1.h, p7/m, z14.h, z25.h
	add	x15, x2, x12
	add	x14, x1, x0
	mad	z0.h, p7/m, z24.h, z13.h
	add	x4, x4, x3, lsl 1
	mla	z0.h, p7/m, z22.h, z26.h
	mla	z1.h, p7/m, z20.h, z27.h
	mla	z0.h, p7/m, z18.h, z28.h
	mla	z1.h, p7/m, z16.h, z29.h
	mla	z0.h, p7/m, z6.h, z30.h
	mla	z1.h, p7/m, z4.h, z31.h
	add	z1.h, z0.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x15, 16]
	ld1b	z3.h, p7/z, [x1, x14]
	add	x14, x13, 16
	ld1b	z0.h, p7/z, [x5, x14]
	sub	z5.h, z5.h, #128
	add	x14, x2, x7
	add	x15, x3, x4
	movprfx	z1, z13
	mla	z1.h, p7/m, z12.h, z25.h
	add	x7, x7, x3
	mad	z15.h, p7/m, z24.h, z13.h
	mla	z1.h, p7/m, z21.h, z27.h
	add	x7, x2, x7
	mla	z15.h, p7/m, z23.h, z26.h
	mla	z1.h, p7/m, z17.h, z29.h
	mla	z15.h, p7/m, z19.h, z28.h
	mla	z1.h, p7/m, z5.h, z31.h
	mla	z15.h, p7/m, z7.h, z30.h
	add	z1.h, z15.h, z1.h
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	sub	z2.h, z2.h, #128
	movprfx	z15, z13
	mla	z15.h, p7/m, z22.h, z25.h
	mad	z14.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z18.h, z27.h
	mla	z14.h, p7/m, z20.h, z26.h
	mla	z15.h, p7/m, z6.h, z29.h
	mla	z14.h, p7/m, z16.h, z28.h
	mla	z15.h, p7/m, z2.h, z31.h
	mla	z14.h, p7/m, z4.h, z30.h
	add	x13, x13, x1
	add	z15.h, z14.h, z15.h
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x14, 16]
	sub	z3.h, z3.h, #128
	add	x0, x0, x1, lsl 1
	movprfx	z15, z13
	mla	z15.h, p7/m, z23.h, z25.h
	ld1b	z1.h, p7/z, [x1, x0]
	mad	z12.h, p7/m, z24.h, z13.h
	mla	z15.h, p7/m, z19.h, z27.h
	mla	z12.h, p7/m, z21.h, z26.h
	mla	z15.h, p7/m, z7.h, z29.h
	mla	z12.h, p7/m, z17.h, z28.h
	mla	z15.h, p7/m, z3.h, z31.h
	mla	z12.h, p7/m, z5.h, z30.h
	add	x13, x13, 16
	add	z15.h, z12.h, z15.h
	ld1b	z14.h, p7/z, [x5, x13]
	sqrshrunb	z15.b, z15.h, #6
	uzp1	z15.b, z15.b, z15.b
	str	q15, [x3, x15]
	sub	z0.h, z0.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z20.h, z25.h
	mad	z22.h, p7/m, z24.h, z13.h
	mla	z12.h, p7/m, z16.h, z27.h
	mla	z22.h, p7/m, z18.h, z26.h
	mla	z12.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	mla	z12.h, p7/m, z0.h, z31.h
	mla	z22.h, p7/m, z2.h, z30.h
	add	z12.h, z22.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x7, 16]
	lsl	x7, x8, 1
	sub	z1.h, z1.h, #128
	movprfx	z12, z13
	mla	z12.h, p7/m, z21.h, z25.h
	add	x4, x4, x3, lsl 1
	add	x8, x7, 16
	ld1b	z22.h, p7/z, [x5, x8]
	add	x8, x2, x11, lsl 1
	add	x13, x3, x4
	mad	z23.h, p7/m, z24.h, z13.h
	add	x11, x3, x11, lsl 1
	add	x14, x1, x0
	mla	z23.h, p7/m, z19.h, z26.h
	ld1b	z15.h, p7/z, [x1, x14]
	add	x11, x2, x11
	mla	z23.h, p7/m, z7.h, z28.h
	mla	z12.h, p7/m, z17.h, z27.h
	mla	z23.h, p7/m, z3.h, z30.h
	mla	z12.h, p7/m, z5.h, z29.h
	add	x7, x7, x1
	mla	z12.h, p7/m, z1.h, z31.h
	add	z12.h, z23.h, z12.h
	sqrshrunb	z12.b, z12.h, #6
	uzp1	z12.b, z12.b, z12.b
	str	q12, [x3, x4]
	sub	z14.h, z14.h, #128
	movprfx	z23, z13
	mla	z23.h, p7/m, z18.h, z25.h
	mad	z20.h, p7/m, z24.h, z13.h
	mla	z23.h, p7/m, z6.h, z27.h
	mla	z20.h, p7/m, z16.h, z26.h
	mla	z23.h, p7/m, z2.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	mla	z23.h, p7/m, z14.h, z31.h
	mla	z20.h, p7/m, z0.h, z30.h
	lsl	x6, x6, 2
	add	x7, x7, 16
	add	z23.h, z20.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x8, 16]
	sub	z15.h, z15.h, #128
	ld1b	z20.h, p7/z, [x5, x7]
	add	x0, x0, x1, lsl 1
	add	x4, x4, x3, lsl 1
	ld1b	z12.h, p7/z, [x1, x0]
	movprfx	z23, z13
	mla	z23.h, p7/m, z19.h, z25.h
	add	x7, x6, 16
	mad	z21.h, p7/m, z24.h, z13.h
	mad	z18.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z17.h, z26.h
	mla	z18.h, p7/m, z6.h, z26.h
	mla	z21.h, p7/m, z5.h, z28.h
	mla	z18.h, p7/m, z2.h, z28.h
	mla	z21.h, p7/m, z1.h, z30.h
	mla	z18.h, p7/m, z14.h, z30.h
	mla	z23.h, p7/m, z7.h, z27.h
	mla	z23.h, p7/m, z3.h, z29.h
	mla	z23.h, p7/m, z15.h, z31.h
	add	z23.h, z21.h, z23.h
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x13]
	sub	z22.h, z22.h, #128
	add	x8, x1, x0
	movprfx	z21, z13
	mla	z21.h, p7/m, z16.h, z25.h
	mla	z21.h, p7/m, z4.h, z27.h
	mla	z21.h, p7/m, z0.h, z29.h
	mla	z21.h, p7/m, z22.h, z31.h
	add	z21.h, z18.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x11, 16]
	ld1b	z23.h, p7/z, [x1, x8]
	ld1b	z18.h, p7/z, [x5, x7]
	add	x7, x2, x10, lsl 2
	sub	z12.h, z12.h, #128
	add	x8, x3, x4
	add	x10, x3, x10, lsl 2
	movprfx	z21, z13
	mla	z21.h, p7/m, z17.h, z25.h
	add	x10, x2, x10
	mad	z19.h, p7/m, z24.h, z13.h
	mla	z21.h, p7/m, z5.h, z27.h
	mla	z19.h, p7/m, z7.h, z26.h
	mla	z21.h, p7/m, z1.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z21.h, p7/m, z12.h, z31.h
	mla	z19.h, p7/m, z15.h, z30.h
	add	z21.h, z19.h, z21.h
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x4]
	sub	z20.h, z20.h, #128
	movprfx	z19, z13
	mla	z19.h, p7/m, z6.h, z25.h
	add	x4, x4, x3, lsl 1
	mad	z16.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z2.h, z27.h
	mla	z16.h, p7/m, z4.h, z26.h
	mla	z19.h, p7/m, z14.h, z29.h
	mla	z16.h, p7/m, z0.h, z28.h
	add	x6, x6, x1
	mla	z16.h, p7/m, z22.h, z30.h
	mla	z19.h, p7/m, z20.h, z31.h
	add	z19.h, z16.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x7, 16]
	add	x0, x0, x1, lsl 1
	sub	z23.h, z23.h, #128
	ld1b	z21.h, p7/z, [x1, x0]
	movprfx	z19, z13
	mla	z19.h, p7/m, z7.h, z25.h
	add	x12, x2, x12, lsl 1
	mad	z17.h, p7/m, z24.h, z13.h
	mla	z19.h, p7/m, z3.h, z27.h
	mla	z17.h, p7/m, z5.h, z26.h
	mla	z19.h, p7/m, z15.h, z29.h
	add	x6, x6, 16
	mla	z17.h, p7/m, z1.h, z28.h
	ld1b	z16.h, p7/z, [x5, x6]
	mla	z17.h, p7/m, z12.h, z30.h
	mla	z19.h, p7/m, z23.h, z31.h
	add	z19.h, z17.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x8]
	sub	z18.h, z18.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z4.h, z25.h
	add	x7, x1, x0
	mad	z6.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z0.h, z27.h
	mla	z6.h, p7/m, z2.h, z26.h
	add	x2, x2, x3, lsl 4
	mla	z6.h, p7/m, z14.h, z28.h
	add	x0, x3, x4
	mla	z6.h, p7/m, z20.h, z30.h
	mla	z17.h, p7/m, z22.h, z29.h
	lsl	x9, x9, 1
	mla	z17.h, p7/m, z18.h, z31.h
	add	z17.h, z6.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x10, 16]
	sub	z21.h, z21.h, #128
	ld1b	z19.h, p7/z, [x1, x7]
	movprfx	z17, z13
	mla	z17.h, p7/m, z5.h, z25.h
	mad	z7.h, p7/m, z24.h, z13.h
	add	x9, x9, 16
	mla	z7.h, p7/m, z3.h, z26.h
	ld1b	z6.h, p7/z, [x5, x9]
	mla	z7.h, p7/m, z15.h, z28.h
	sub	x2, x2, x3
	mla	z7.h, p7/m, z23.h, z30.h
	mla	z17.h, p7/m, z1.h, z27.h
	mla	z17.h, p7/m, z12.h, z29.h
	mla	z17.h, p7/m, z21.h, z31.h
	add	z17.h, z7.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x4]
	sub	z16.h, z16.h, #128
	movprfx	z17, z13
	mla	z17.h, p7/m, z2.h, z25.h
	mad	z4.h, p7/m, z24.h, z13.h
	mla	z17.h, p7/m, z14.h, z27.h
	mla	z4.h, p7/m, z0.h, z26.h
	mla	z17.h, p7/m, z20.h, z29.h
	mla	z4.h, p7/m, z22.h, z28.h
	mla	z17.h, p7/m, z16.h, z31.h
	mla	z4.h, p7/m, z18.h, z30.h
	add	z17.h, z4.h, z17.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x12, 16]
	mad	z3.h, p7/m, z25.h, z13.h
	mad	z5.h, p7/m, z24.h, z13.h
	mla	z3.h, p7/m, z15.h, z27.h
	sub	z19.h, z19.h, #128
	mla	z3.h, p7/m, z23.h, z29.h
	mla	z5.h, p7/m, z1.h, z26.h
	mla	z3.h, p7/m, z19.h, z31.h
	mla	z5.h, p7/m, z12.h, z28.h
	mla	z5.h, p7/m, z21.h, z30.h
	add	z3.h, z5.h, z3.h
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x0]
	mad	z0.h, p7/m, z25.h, z13.h
	mad	z2.h, p7/m, z24.h, z13.h
	mla	z0.h, p7/m, z22.h, z27.h
	mla	z2.h, p7/m, z14.h, z26.h
	mla	z0.h, p7/m, z18.h, z29.h
	sub	z6.h, z6.h, #128
	mla	z2.h, p7/m, z20.h, z28.h
	mla	z0.h, p7/m, z6.h, z31.h
	mla	z2.h, p7/m, z16.h, z30.h
	add	z0.h, z2.h, z0.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x2, 16]
	ldp	d14, d15, [sp, 16]
	ldp	d12, d13, [sp], 32
	.cfi_remember_state
	.cfi_restore 77
	.cfi_restore 76
	.cfi_restore 78
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4:
	.cfi_restore_state
	movi	d31, #0
	mov	z30.h, #1
	mov	z29.h, #-5
	mov	z28.h, #17
	mov	z27.h, #58
	mov	z26.h, #-10
	mov	z25.h, #4
	mov	z24.b, #-1
	b	.L2
	.cfi_endproc
.LFE3:
	.size	dynopt_interp8_32x16_sve2_vpp, .-dynopt_interp8_32x16_sve2_vpp
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
