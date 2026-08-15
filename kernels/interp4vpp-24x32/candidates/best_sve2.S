	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_24x32_sve2_vpp
	.type	dynopt_interp4_24x32_sve2_vpp, %function
dynopt_interp4_24x32_sve2_vpp:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	ubfiz	x4, x4, 2, 3
	ptrue	p7.b, all
	adrp	x5, .LANCHOR0
	mov	x29, sp
	add	x5, x5, :lo12:.LANCHOR0
	add	x6, x5, x4
	stp	x19, x20, [sp, 16]
	lsl	x8, x1, 1
	stp	x21, x22, [sp, 32]
	lsl	x12, x1, 2
	lsl	x15, x1, 3
	str	x23, [sp, 48]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	sub	x9, x15, x1
	add	x10, x2, x3, lsl 1
	add	x11, x2, x3, lsl 2
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	sub	x5, x0, x1
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	ld1b	z25.h, p7/z, [x0]
	ldrsb	w4, [x6, 2]
	mov	z29.h, w4
	add	x0, x0, 16
	ldrsb	w4, [x6, 3]
	mov	z28.h, w4
	ld1b	z24.h, p7/z, [x0]
	add	x4, x5, 16
	add	x0, x5, x1, lsl 1
	ld1b	z26.h, p7/z, [x4]
	add	x4, x8, 16
	ld1b	z22.h, p7/z, [x5, x4]
	ld1b	z21.h, p7/z, [x0, x1]
	add	x4, x0, x1
	ld1b	z23.h, p7/z, [x5, x8]
	ld1b	z19.h, p7/z, [x1, x4]
	add	x8, x8, x1
	add	x0, x0, x1, lsl 1
	ld1b	z27.h, p7/z, [x5]
	add	x4, x12, 16
	add	x6, x8, 16
	ld1b	z18.h, p7/z, [x5, x4]
	add	x12, x12, x1
	add	x4, x1, x0
	ld1b	z7.h, p7/z, [x1, x0]
	ld1b	z20.h, p7/z, [x5, x6]
	sub	z21.h, z21.h, #128
	sub	z20.h, z20.h, #128
	add	x6, x12, 16
	sub	z23.h, z23.h, #128
	ld1b	z6.h, p7/z, [x5, x6]
	sub	z22.h, z22.h, #128
	sub	z25.h, z25.h, #128
	sub	z24.h, z24.h, #128
	sub	z27.h, z27.h, #128
	sub	z26.h, z26.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z27.h, p7/m, z25.h, z30.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z27.h, z27.h, #8192
	add	z26.h, z26.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z27.b, z27.b, z27.b
	uzp1	z26.b, z26.b, z26.b
	str	q27, [x2]
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	str	d26, [x2, 16]
	ld1b	z5.h, p7/z, [x1, x4]
	lsl	x4, x8, 1
	add	x4, x4, 16
	ld1b	z4.h, p7/z, [x5, x4]
	mla	z25.h, p7/m, z19.h, z28.h
	add	x4, x2, x3
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x2, x3]
	add	x0, x0, x1, lsl 1
	sub	z18.h, z18.h, #128
	add	x6, x9, 16
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	d24, [x4, 16]
	add	x7, x1, x0
	ld1b	z3.h, p7/z, [x1, x0]
	ld1b	z2.h, p7/z, [x5, x6]
	sub	z7.h, z7.h, #128
	add	x6, x4, x3
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x4, x3]
	sub	z6.h, z6.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	d22, [x10, 16]
	ld1b	z1.h, p7/z, [x1, x7]
	add	x7, x15, 16
	ld1b	z0.h, p7/z, [x5, x7]
	sub	z5.h, z5.h, #128
	add	x7, x3, x3, lsl 1
	mul	z21.h, p7/m, z21.h, z31.h
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x6]
	add	x6, x2, x7
	sub	z4.h, z4.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x0, x0, x1, lsl 1
	mla	z20.h, p7/m, z18.h, z30.h
	add	x15, x15, x1
	mla	z20.h, p7/m, z6.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	d20, [x6, 16]
	sub	z3.h, z3.h, #128
	ld1b	z21.h, p7/z, [x1, x0]
	add	x6, x1, x0
	add	x10, x15, 16
	mul	z19.h, p7/m, z19.h, z31.h
	ld1b	z20.h, p7/z, [x5, x10]
	mla	z19.h, p7/m, z7.h, z30.h
	mla	z19.h, p7/m, z5.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	add	x10, x3, x4
	sub	z2.h, z2.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z6.h, z30.h
	mla	z18.h, p7/m, z4.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	d18, [x11, 16]
	ld1b	z19.h, p7/z, [x1, x6]
	lsl	x6, x12, 1
	sub	z1.h, z1.h, #128
	add	x11, x6, 16
	ld1b	z18.h, p7/z, [x5, x11]
	mul	z7.h, p7/m, z7.h, z31.h
	add	x11, x3, x3, lsl 2
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x10]
	add	x10, x2, x11
	add	x4, x4, x3, lsl 1
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	add	x6, x6, x1
	add	x14, x2, x7, lsl 1
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	d6, [x10, 16]
	add	x10, x6, 16
	ld1b	z16.h, p7/z, [x5, x10]
	add	x0, x0, x1, lsl 1
	add	x10, x3, x4
	ld1b	z17.h, p7/z, [x1, x0]
	sub	z21.h, z21.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z21.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	lsl	x18, x3, 3
	add	x13, x1, x0
	sub	z20.h, z20.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	lsl	x17, x8, 2
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z20.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	d4, [x14, 16]
	sub	z19.h, z19.h, #128
	ld1b	z27.h, p7/z, [x1, x13]
	mul	z3.h, p7/m, z3.h, z31.h
	add	x13, x17, 16
	mla	z3.h, p7/m, z1.h, z30.h
	ld1b	z26.h, p7/z, [x5, x13]
	mla	z3.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z19.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x10]
	sub	x10, x18, x3
	add	x13, x2, x10
	sub	z18.h, z18.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x16, x2, x18
	mla	z2.h, p7/m, z0.h, z30.h
	add	x0, x0, x1, lsl 1
	add	x17, x17, x1
	mla	z2.h, p7/m, z20.h, z29.h
	mla	z2.h, p7/m, z18.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	d2, [x13, 16]
	sub	z17.h, z17.h, #128
	ld1b	z25.h, p7/z, [x1, x0]
	add	x13, x1, x0
	add	x14, x17, 16
	mul	z1.h, p7/m, z1.h, z31.h
	ld1b	z24.h, p7/z, [x5, x14]
	mla	z1.h, p7/m, z21.h, z30.h
	mla	z1.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z17.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	sub	z16.h, z16.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z20.h, z30.h
	mla	z0.h, p7/m, z18.h, z29.h
	mla	z0.h, p7/m, z16.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	d0, [x16, 16]
	ld1b	z23.h, p7/z, [x1, x13]
	lsl	x13, x9, 1
	add	x18, x18, x3
	add	x14, x3, x4
	add	x13, x13, 16
	ld1b	z22.h, p7/z, [x5, x13]
	add	x13, x2, x18
	sub	z27.h, z27.h, #128
	mul	z21.h, p7/m, z21.h, z31.h
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x14]
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	d20, [x13, 16]
	lsl	x13, x1, 4
	sub	z25.h, z25.h, #128
	sub	x14, x13, x1
	add	x4, x4, x3, lsl 1
	mul	z19.h, p7/m, z19.h, z31.h
	add	x16, x14, 16
	add	x20, x2, x11, lsl 1
	ld1b	z6.h, p7/z, [x5, x16]
	add	x16, x3, x4
	add	x0, x0, x1, lsl 1
	mla	z19.h, p7/m, z17.h, z30.h
	ld1b	z7.h, p7/z, [x1, x0]
	add	x30, x3, x11, lsl 1
	add	x19, x1, x0
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z25.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	sub	z24.h, z24.h, #128
	sub	z23.h, z23.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z18.h, p7/m, z24.h, z28.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z18.h, z18.h, #8192
	add	z17.h, z17.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z18.b, z18.b, z18.b
	uzp1	z17.b, z17.b, z17.b
	str	d18, [x20, 16]
	ld1b	z5.h, p7/z, [x1, x19]
	add	x19, x13, 16
	ld1b	z4.h, p7/z, [x5, x19]
	str	q17, [x3, x16]
	add	x16, x2, x30
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x13, x13, x1
	mla	z16.h, p7/m, z26.h, z30.h
	add	x20, x2, x7, lsl 2
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	d16, [x16, 16]
	add	x16, x13, 16
	ld1b	z2.h, p7/z, [x5, x16]
	add	x16, x3, x4
	add	x0, x0, x1, lsl 1
	sub	z7.h, z7.h, #128
	ld1b	z3.h, p7/z, [x1, x0]
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z25.h, z30.h
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z7.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	add	x19, x1, x0
	sub	z6.h, z6.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	lsl	x15, x15, 1
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z6.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	d26, [x20, 16]
	sub	z5.h, z5.h, #128
	ld1b	z1.h, p7/z, [x1, x19]
	mul	z25.h, p7/m, z25.h, z31.h
	add	x19, x15, 16
	mla	z25.h, p7/m, z23.h, z30.h
	ld1b	z0.h, p7/z, [x5, x19]
	mla	z25.h, p7/m, z7.h, z29.h
	mla	z25.h, p7/m, z5.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x16]
	add	x16, x3, x7, lsl 2
	add	x19, x2, x16
	sub	z4.h, z4.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x20, x2, x10, lsl 1
	mla	z24.h, p7/m, z22.h, z30.h
	add	x15, x15, x1
	mla	z24.h, p7/m, z6.h, z29.h
	mla	z24.h, p7/m, z4.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	d24, [x19, 16]
	add	x0, x0, x1, lsl 1
	sub	z3.h, z3.h, #128
	ld1b	z25.h, p7/z, [x1, x0]
	add	x15, x15, 16
	mul	z23.h, p7/m, z23.h, z31.h
	ld1b	z24.h, p7/z, [x5, x15]
	mla	z23.h, p7/m, z7.h, z30.h
	mla	z23.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	add	x19, x1, x0
	add	x15, x3, x4
	sub	z2.h, z2.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z6.h, z30.h
	mla	z22.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z2.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	d22, [x20, 16]
	lsl	x20, x12, 2
	ld1b	z23.h, p7/z, [x1, x19]
	add	x19, x20, 16
	ld1b	z22.h, p7/z, [x5, x19]
	sub	z1.h, z1.h, #128
	lsl	x19, x3, 4
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x15]
	sub	x15, x19, x3
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	add	x21, x2, x15
	add	x4, x4, x3, lsl 1
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	add	x23, x2, x19
	str	d6, [x21, 16]
	add	x21, x20, x1
	sub	z25.h, z25.h, #128
	add	x21, x21, 16
	add	x19, x19, x3
	ld1b	z20.h, p7/z, [x5, x21]
	add	x21, x3, x4
	add	x0, x0, x1, lsl 1
	mul	z5.h, p7/m, z5.h, z31.h
	ld1b	z21.h, p7/z, [x1, x0]
	add	x19, x2, x19
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z25.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z24.h, z24.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	lsl	x6, x6, 1
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z24.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	d4, [x23, 16]
	add	x22, x1, x0
	sub	z23.h, z23.h, #128
	ld1b	z19.h, p7/z, [x1, x22]
	add	x6, x6, 16
	mul	z3.h, p7/m, z3.h, z31.h
	ld1b	z18.h, p7/z, [x5, x6]
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z25.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x21]
	sub	z22.h, z22.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z24.h, z29.h
	mla	z2.h, p7/m, z22.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	d2, [x19, 16]
	lsl	x19, x8, 3
	sub	x6, x19, x1
	add	x4, x4, x3, lsl 1
	sub	z21.h, z21.h, #128
	add	x6, x6, 16
	ld1b	z16.h, p7/z, [x5, x6]
	add	x0, x0, x1, lsl 1
	add	x6, x2, x18, lsl 1
	ld1b	z17.h, p7/z, [x1, x0]
	add	x21, x3, x4
	add	x18, x3, x18, lsl 1
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z25.h, z30.h
	mla	z1.h, p7/m, z23.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	add	x22, x1, x0
	sub	z20.h, z20.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	add	x18, x2, x18
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z22.h, z29.h
	mla	z0.h, p7/m, z20.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	d0, [x6, 16]
	add	x6, x0, x1, lsl 1
	add	x0, x19, 16
	ld1b	z27.h, p7/z, [x1, x22]
	ld1b	z26.h, p7/z, [x5, x0]
	add	x0, x4, x3, lsl 1
	sub	z19.h, z19.h, #128
	add	x4, x2, x11, lsl 2
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x21]
	sub	z18.h, z18.h, #128
	add	x12, x12, x20
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	d24, [x18, 16]
	sub	z17.h, z17.h, #128
	ld1b	z7.h, p7/z, [x1, x6]
	add	x12, x12, 16
	mul	z23.h, p7/m, z23.h, z31.h
	ld1b	z6.h, p7/z, [x5, x12]
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z17.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x0]
	add	x18, x1, x6
	sub	z16.h, z16.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	add	x12, x3, x0
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z16.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	d22, [x4, 16]
	add	x4, x6, x1, lsl 1
	add	x6, x3, x11, lsl 2
	add	x0, x0, x3, lsl 1
	ld1b	z5.h, p7/z, [x1, x18]
	add	x6, x2, x6
	lsl	x17, x17, 1
	sub	z27.h, z27.h, #128
	add	x30, x2, x30, lsl 1
	add	x17, x17, 16
	mul	z21.h, p7/m, z21.h, z31.h
	ld1b	z4.h, p7/z, [x5, x17]
	mla	z21.h, p7/m, z19.h, z30.h
	add	x8, x8, x19
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x12]
	sub	z26.h, z26.h, #128
	lsl	x9, x9, 2
	mul	z20.h, p7/m, z20.h, z31.h
	add	x8, x8, 16
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	d20, [x6, 16]
	add	x6, x3, x0
	ld1b	z3.h, p7/z, [x1, x4]
	ld1b	z2.h, p7/z, [x5, x8]
	sub	z7.h, z7.h, #128
	add	x8, x9, 16
	mul	z19.h, p7/m, z19.h, z31.h
	mla	z19.h, p7/m, z17.h, z30.h
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z7.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x0]
	sub	z6.h, z6.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z6.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	d18, [x30, 16]
	ld1b	z0.h, p7/z, [x5, x8]
	lsl	x8, x7, 3
	add	x12, x1, x4
	sub	z5.h, z5.h, #128
	ld1b	z1.h, p7/z, [x1, x12]
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z7.h, z29.h
	mla	z17.h, p7/m, z5.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x6]
	sub	x6, x8, x3
	sub	z4.h, z4.h, #128
	add	x6, x2, x6
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	add	x9, x9, x1
	add	x0, x0, x3, lsl 1
	mla	z16.h, p7/m, z6.h, z29.h
	add	x9, x9, 16
	mla	z16.h, p7/m, z4.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	d16, [x6, 16]
	ld1b	z16.h, p7/z, [x5, x9]
	add	x9, x2, x8
	add	x6, x3, x0
	add	x4, x4, x1, lsl 1
	sub	z3.h, z3.h, #128
	ld1b	z17.h, p7/z, [x1, x4]
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z7.h, z30.h
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	sub	z2.h, z2.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	lsl	x14, x14, 1
	mla	z26.h, p7/m, z6.h, z30.h
	add	x11, x11, x11, lsl 2
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	d26, [x9, 16]
	add	x12, x1, x4
	sub	z1.h, z1.h, #128
	ld1b	z27.h, p7/z, [x1, x12]
	add	x11, x2, x11
	add	x14, x14, 16
	mul	z7.h, p7/m, z7.h, z31.h
	ld1b	z26.h, p7/z, [x5, x14]
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x6]
	lsl	x6, x1, 5
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	add	x0, x0, x3, lsl 1
	sub	x9, x6, x1
	mla	z6.h, p7/m, z4.h, z30.h
	add	x16, x2, x16, lsl 1
	add	x9, x9, 16
	mla	z6.h, p7/m, z2.h, z29.h
	add	x4, x4, x1, lsl 1
	mla	z6.h, p7/m, z0.h, z28.h
	add	x7, x7, x8
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	d6, [x11, 16]
	ld1b	z24.h, p7/z, [x5, x9]
	add	x9, x3, x0
	ld1b	z25.h, p7/z, [x1, x4]
	add	x11, x1, x4
	sub	z17.h, z17.h, #128
	add	x7, x2, x7
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z16.h, z16.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	d4, [x16, 16]
	ld1b	z23.h, p7/z, [x1, x11]
	add	x11, x6, 16
	add	x6, x6, x1
	ld1b	z22.h, p7/z, [x5, x11]
	add	x0, x0, x3, lsl 1
	sub	z27.h, z27.h, #128
	add	x6, x6, 16
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x9]
	add	x4, x4, x1, lsl 1
	sub	z26.h, z26.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	d2, [x7, 16]
	ld1b	z20.h, p7/z, [x5, x6]
	add	x6, x2, x10, lsl 2
	ld1b	z21.h, p7/z, [x1, x4]
	add	x7, x1, x4
	add	x10, x3, x10, lsl 2
	add	x4, x3, x0
	sub	z25.h, z25.h, #128
	add	x10, x2, x10
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z1.h, p7/m, z27.h, z29.h
	mla	z1.h, p7/m, z25.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z24.h, z24.h, #128
	add	x0, x0, x3, lsl 1
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z16.h, z30.h
	lsl	x13, x13, 1
	mla	z0.h, p7/m, z26.h, z29.h
	mla	z0.h, p7/m, z24.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	d0, [x6, 16]
	sub	z23.h, z23.h, #128
	ld1b	z19.h, p7/z, [x1, x7]
	add	x15, x2, x15, lsl 1
	add	x13, x13, 16
	mul	z17.h, p7/m, z17.h, z31.h
	ld1b	z18.h, p7/z, [x5, x13]
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x4]
	sub	z22.h, z22.h, #128
	add	x2, x2, x3, lsl 5
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	add	x1, x3, x0
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	d16, [x10, 16]
	sub	z21.h, z21.h, #128
	sub	x2, x2, x3
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z25.h, z30.h
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	sub	z20.h, z20.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	d26, [x15, 16]
	mul	z25.h, p7/m, z25.h, z31.h
	sub	z19.h, z19.h, #128
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x1]
	mul	z24.h, p7/m, z24.h, z31.h
	sub	z18.h, z18.h, #128
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	d24, [x2, 16]
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_interp4_24x32_sve2_vpp, .-dynopt_interp4_24x32_sve2_vpp
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL8CHROMA_C, %object
	.size	_ZL8CHROMA_C, 32
_ZL8CHROMA_C:
	.base64	"AEAAAA=="
	.base64	"/joK/g=="
	.base64	"/DYQ/g=="
	.base64	"+i4c/A=="
	.base64	"/CQk/A=="
	.base64	"/Bwu+g=="
	.base64	"/hA2/A=="
	.base64	"/go6/g=="
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
