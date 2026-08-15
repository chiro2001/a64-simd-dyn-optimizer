	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_32x48_sve2_vpp
	.type	dynopt_interp4_32x48_sve2_vpp, %function
dynopt_interp4_32x48_sve2_vpp:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	ubfiz	x4, x4, 2, 3
	ptrue	p7.b, all
	adrp	x5, .LANCHOR0
	mov	x29, sp
	add	x5, x5, :lo12:.LANCHOR0
	add	x6, x5, x4
	stp	x19, x20, [sp, 16]
	lsl	x11, x1, 1
	stp	x21, x22, [sp, 32]
	add	x12, x2, x3, lsl 1
	add	x14, x2, x3, lsl 2
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	lsl	x20, x3, 3
	add	x18, x2, x20
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -16
	.cfi_offset 26, -8
	lsl	x24, x3, 4
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	sub	x5, x0, x1
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	ld1b	z7.h, p7/z, [x0]
	ldrsb	w4, [x6, 2]
	add	x0, x0, 16
	mov	z29.h, w4
	ldrsb	w4, [x6, 3]
	ld1b	z5.h, p7/z, [x5, x11]
	mov	z28.h, w4
	ld1b	z6.h, p7/z, [x0]
	add	x4, x5, 16
	add	x0, x11, 16
	add	x11, x11, x1
	ld1b	z26.h, p7/z, [x4]
	add	x4, x5, x1, lsl 1
	add	x6, x11, 16
	ld1b	z4.h, p7/z, [x5, x0]
	ld1b	z2.h, p7/z, [x5, x6]
	add	x0, x4, x1
	lsl	x6, x1, 2
	ld1b	z3.h, p7/z, [x4, x1]
	ld1b	z1.h, p7/z, [x1, x0]
	add	x4, x4, x1, lsl 1
	add	x0, x6, 16
	ld1b	z27.h, p7/z, [x5]
	ld1b	z0.h, p7/z, [x5, x0]
	add	x7, x6, x1
	add	x0, x1, x4
	sub	z3.h, z3.h, #128
	sub	z5.h, z5.h, #128
	sub	z7.h, z7.h, #128
	sub	z27.h, z27.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z7.h, z30.h
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	ld1b	z17.h, p7/z, [x1, x4]
	sub	z2.h, z2.h, #128
	add	x8, x7, 16
	sub	z4.h, z4.h, #128
	ld1b	z16.h, p7/z, [x5, x8]
	sub	z6.h, z6.h, #128
	sub	z26.h, z26.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z6.h, z30.h
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	stp	q27, q26, [x2]
	ld1b	z27.h, p7/z, [x1, x0]
	lsl	x0, x11, 1
	sub	z1.h, z1.h, #128
	add	x0, x0, 16
	ld1b	z26.h, p7/z, [x5, x0]
	lsl	x8, x1, 3
	add	x0, x2, x3
	sub	x13, x8, x1
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x2, x3]
	add	x4, x4, x1, lsl 1
	sub	z0.h, z0.h, #128
	add	x9, x13, 16
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x0, 16]
	add	x10, x1, x4
	ld1b	z25.h, p7/z, [x1, x4]
	ld1b	z24.h, p7/z, [x5, x9]
	sub	z17.h, z17.h, #128
	add	x9, x0, x3
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x0, x3]
	sub	z16.h, z16.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x12, 16]
	ld1b	z23.h, p7/z, [x1, x10]
	add	x10, x8, 16
	ld1b	z22.h, p7/z, [x5, x10]
	add	x10, x3, x3, lsl 1
	sub	z27.h, z27.h, #128
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x9]
	add	x9, x2, x10
	add	x0, x0, x3, lsl 1
	sub	z26.h, z26.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x8, x8, x1
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x9, 16]
	add	x9, x8, 16
	ld1b	z20.h, p7/z, [x5, x9]
	add	x9, x3, x0
	sub	z25.h, z25.h, #128
	add	x4, x4, x1, lsl 1
	mul	z1.h, p7/m, z1.h, z31.h
	ld1b	z21.h, p7/z, [x1, x4]
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z1.h, p7/m, z27.h, z29.h
	mla	z1.h, p7/m, z25.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	add	x12, x1, x4
	sub	z24.h, z24.h, #128
	lsl	x17, x7, 1
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z16.h, z30.h
	mla	z0.h, p7/m, z26.h, z29.h
	mla	z0.h, p7/m, z24.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x14, 16]
	add	x14, x3, x3, lsl 2
	ld1b	z19.h, p7/z, [x1, x12]
	sub	z23.h, z23.h, #128
	add	x12, x17, 16
	mul	z17.h, p7/m, z17.h, z31.h
	ld1b	z18.h, p7/z, [x5, x12]
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x9]
	add	x9, x2, x14
	sub	z22.h, z22.h, #128
	add	x0, x0, x3, lsl 1
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	add	x15, x2, x10, lsl 1
	add	x17, x17, x1
	mla	z16.h, p7/m, z24.h, z29.h
	add	x4, x4, x1, lsl 1
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x9, 16]
	add	x9, x17, 16
	ld1b	z7.h, p7/z, [x1, x4]
	ld1b	z6.h, p7/z, [x5, x9]
	add	x12, x1, x4
	add	x9, x3, x0
	sub	z21.h, z21.h, #128
	lsl	x16, x11, 2
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
	str	q26, [x15, 16]
	ld1b	z5.h, p7/z, [x1, x12]
	add	x12, x16, 16
	ld1b	z4.h, p7/z, [x5, x12]
	sub	x12, x20, x3
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x9]
	add	x9, x2, x12
	sub	z18.h, z18.h, #128
	add	x0, x0, x3, lsl 1
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	add	x4, x4, x1, lsl 1
	add	x16, x16, x1
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x9, 16]
	sub	z7.h, z7.h, #128
	ld1b	z3.h, p7/z, [x1, x4]
	add	x9, x1, x4
	mul	z23.h, p7/m, z23.h, z31.h
	add	x15, x16, 16
	mla	z23.h, p7/m, z21.h, z30.h
	ld1b	z2.h, p7/z, [x5, x15]
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x0]
	sub	z6.h, z6.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x18, 16]
	ld1b	z1.h, p7/z, [x1, x9]
	lsl	x9, x13, 1
	sub	z5.h, z5.h, #128
	add	x20, x20, x3
	add	x15, x3, x0
	mul	z21.h, p7/m, z21.h, z31.h
	add	x9, x9, 16
	ld1b	z0.h, p7/z, [x5, x9]
	mla	z21.h, p7/m, z19.h, z30.h
	add	x9, x2, x20
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x15]
	sub	z4.h, z4.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z6.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x9, 16]
	lsl	x9, x1, 4
	sub	z3.h, z3.h, #128
	sub	x30, x9, x1
	sub	z2.h, z2.h, #128
	mul	z19.h, p7/m, z19.h, z31.h
	add	x0, x0, x3, lsl 1
	add	x15, x30, 16
	ld1b	z20.h, p7/z, [x5, x15]
	add	x19, x2, x14, lsl 1
	add	x15, x3, x0
	mla	z19.h, p7/m, z7.h, z30.h
	add	x4, x4, x1, lsl 1
	add	x21, x3, x14, lsl 1
	ld1b	z21.h, p7/z, [x1, x4]
	add	x18, x1, x4
	mla	z19.h, p7/m, z5.h, z29.h
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z19.h, p7/m, z3.h, z28.h
	mla	z18.h, p7/m, z6.h, z30.h
	add	z19.h, z19.h, #8192
	mla	z18.h, p7/m, z4.h, z29.h
	sqrshrunb	z19.b, z19.h, #6
	mla	z18.h, p7/m, z2.h, z28.h
	uzp1	z19.b, z19.b, z19.b
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q19, [x3, x0]
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q18, [x19, 16]
	ld1b	z19.h, p7/z, [x1, x18]
	add	x18, x9, 16
	ld1b	z18.h, p7/z, [x5, x18]
	sub	z0.h, z0.h, #128
	str	q7, [x3, x15]
	add	x15, x2, x21
	mul	z6.h, p7/m, z6.h, z31.h
	add	x0, x0, x3, lsl 1
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	add	x19, x2, x10, lsl 2
	add	x4, x4, x1, lsl 1
	mla	z6.h, p7/m, z0.h, z28.h
	add	x9, x9, x1
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x15, 16]
	sub	z21.h, z21.h, #128
	ld1b	z17.h, p7/z, [x1, x4]
	add	x15, x1, x4
	mul	z5.h, p7/m, z5.h, z31.h
	add	x18, x9, 16
	mla	z5.h, p7/m, z3.h, z30.h
	ld1b	z16.h, p7/z, [x5, x18]
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z21.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	add	x18, x3, x0
	sub	z20.h, z20.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z20.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x19, 16]
	ld1b	z27.h, p7/z, [x1, x15]
	lsl	x15, x8, 1
	add	x19, x15, 16
	ld1b	z26.h, p7/z, [x5, x19]
	sub	z19.h, z19.h, #128
	add	x19, x3, x10, lsl 2
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z19.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x18]
	add	x18, x2, x19
	sub	z18.h, z18.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x0, x0, x3, lsl 1
	add	x15, x15, x1
	mla	z2.h, p7/m, z0.h, z30.h
	add	x23, x2, x12, lsl 1
	mla	z2.h, p7/m, z20.h, z29.h
	mla	z2.h, p7/m, z18.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x18, 16]
	add	x18, x15, 16
	ld1b	z24.h, p7/z, [x5, x18]
	add	x4, x4, x1, lsl 1
	sub	z17.h, z17.h, #128
	ld1b	z25.h, p7/z, [x1, x4]
	add	x18, x3, x0
	add	x22, x1, x4
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z21.h, z30.h
	mla	z1.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z17.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z16.h, z16.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z20.h, z30.h
	mla	z0.h, p7/m, z18.h, z29.h
	mla	z0.h, p7/m, z16.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x23, 16]
	ld1b	z23.h, p7/z, [x1, x22]
	lsl	x22, x7, 2
	sub	z27.h, z27.h, #128
	add	x23, x22, 16
	mul	z21.h, p7/m, z21.h, z31.h
	ld1b	z22.h, p7/z, [x5, x23]
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x18]
	sub	x18, x24, x3
	add	x23, x2, x18
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x23, 16]
	add	x23, x22, x1
	sub	z25.h, z25.h, #128
	add	x0, x0, x3, lsl 1
	mul	z19.h, p7/m, z19.h, z31.h
	mla	z19.h, p7/m, z17.h, z30.h
	add	x23, x23, 16
	ld1b	z6.h, p7/z, [x5, x23]
	add	x4, x4, x1, lsl 1
	add	x23, x2, x24
	ld1b	z7.h, p7/z, [x1, x4]
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z25.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x0]
	add	x26, x1, x4
	add	x25, x3, x0
	sub	z24.h, z24.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z24.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x23, 16]
	add	x23, x4, x1, lsl 1
	ld1b	z5.h, p7/z, [x1, x26]
	lsl	x4, x17, 1
	sub	z23.h, z23.h, #128
	mul	z17.h, p7/m, z17.h, z31.h
	add	x17, x24, x3
	mla	z17.h, p7/m, z27.h, z30.h
	add	x4, x4, 16
	add	x17, x2, x17
	ld1b	z4.h, p7/z, [x5, x4]
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x25]
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x17, 16]
	lsl	x17, x11, 3
	sub	x4, x17, x1
	ld1b	z3.h, p7/z, [x1, x23]
	sub	z7.h, z7.h, #128
	add	x0, x0, x3, lsl 1
	add	x4, x4, 16
	ld1b	z2.h, p7/z, [x5, x4]
	add	x24, x3, x0
	add	x4, x2, x20, lsl 1
	mul	z27.h, p7/m, z27.h, z31.h
	add	x20, x3, x20, lsl 1
	mla	z27.h, p7/m, z25.h, z30.h
	add	x22, x7, x22
	add	x20, x2, x20
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z7.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	add	x25, x1, x23
	sub	z6.h, z6.h, #128
	add	x0, x0, x3, lsl 1
	sub	z5.h, z5.h, #128
	sub	z4.h, z4.h, #128
	add	x22, x22, 16
	mul	z26.h, p7/m, z26.h, z31.h
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z25.h, p7/m, z7.h, z29.h
	mla	z26.h, p7/m, z6.h, z28.h
	mla	z25.h, p7/m, z5.h, z28.h
	mul	z24.h, p7/m, z24.h, z31.h
	add	z26.h, z26.h, #8192
	mla	z24.h, p7/m, z22.h, z30.h
	sqrshrunb	z26.b, z26.h, #6
	mla	z24.h, p7/m, z6.h, z29.h
	uzp1	z26.b, z26.b, z26.b
	mla	z24.h, p7/m, z4.h, z28.h
	add	z25.h, z25.h, #8192
	add	z24.h, z24.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z25.b, z25.b, z25.b
	uzp1	z24.b, z24.b, z24.b
	str	q26, [x4, 16]
	add	x4, x23, x1, lsl 1
	ld1b	z1.h, p7/z, [x1, x25]
	add	x23, x17, 16
	ld1b	z0.h, p7/z, [x5, x23]
	str	q25, [x3, x24]
	lsl	x16, x16, 1
	sub	z3.h, z3.h, #128
	sub	z2.h, z2.h, #128
	add	x16, x16, 16
	mul	z23.h, p7/m, z23.h, z31.h
	str	q24, [x20, 16]
	ld1b	z24.h, p7/z, [x5, x22]
	add	x22, x2, x14, lsl 2
	ld1b	z25.h, p7/z, [x1, x4]
	mla	z23.h, p7/m, z7.h, z30.h
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z23.h, p7/m, z5.h, z29.h
	mla	z22.h, p7/m, z6.h, z30.h
	mla	z23.h, p7/m, z3.h, z28.h
	mla	z22.h, p7/m, z4.h, z29.h
	add	z23.h, z23.h, #8192
	mla	z22.h, p7/m, z2.h, z28.h
	sqrshrunb	z23.b, z23.h, #6
	add	z22.h, z22.h, #8192
	uzp1	z23.b, z23.b, z23.b
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q23, [x3, x0]
	add	x20, x3, x0
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	str	q22, [x22, 16]
	ld1b	z22.h, p7/z, [x5, x16]
	add	x16, x3, x14, lsl 2
	add	x16, x2, x16
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	add	x0, x0, x3, lsl 1
	add	x23, x1, x4
	mla	z7.h, p7/m, z1.h, z28.h
	ld1b	z23.h, p7/z, [x1, x23]
	add	x21, x2, x21, lsl 1
	add	x11, x11, x17
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x20]
	add	x4, x4, x1, lsl 1
	sub	z0.h, z0.h, #128
	add	x11, x11, 16
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x16, 16]
	sub	z25.h, z25.h, #128
	ld1b	z21.h, p7/z, [x1, x4]
	ld1b	z20.h, p7/z, [x5, x11]
	add	x16, x1, x4
	add	x11, x3, x0
	mul	z5.h, p7/m, z5.h, z31.h
	lsl	x13, x13, 2
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z25.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z24.h, z24.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z24.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x21, 16]
	ld1b	z19.h, p7/z, [x1, x16]
	add	x16, x13, 16
	ld1b	z18.h, p7/z, [x5, x16]
	sub	z23.h, z23.h, #128
	lsl	x16, x10, 3
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z25.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x11]
	sub	x11, x16, x3
	sub	z22.h, z22.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x11, x2, x11
	add	x13, x13, x1
	mla	z2.h, p7/m, z0.h, z30.h
	add	x0, x0, x3, lsl 1
	add	x13, x13, 16
	mla	z2.h, p7/m, z24.h, z29.h
	mla	z2.h, p7/m, z22.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x11, 16]
	ld1b	z16.h, p7/z, [x5, x13]
	add	x13, x2, x16
	sub	z21.h, z21.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	add	x11, x3, x0
	add	x4, x4, x1, lsl 1
	mla	z1.h, p7/m, z25.h, z30.h
	ld1b	z17.h, p7/z, [x1, x4]
	mla	z1.h, p7/m, z23.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z20.h, z20.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	lsl	x30, x30, 1
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z22.h, z29.h
	add	x14, x14, x14, lsl 2
	mla	z0.h, p7/m, z20.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x13, 16]
	add	x17, x1, x4
	sub	z19.h, z19.h, #128
	ld1b	z27.h, p7/z, [x1, x17]
	add	x14, x2, x14
	add	x30, x30, 16
	mul	z25.h, p7/m, z25.h, z31.h
	ld1b	z26.h, p7/z, [x5, x30]
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x11]
	lsl	x11, x1, 5
	add	x0, x0, x3, lsl 1
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	sub	x13, x11, x1
	add	x19, x2, x19, lsl 1
	mla	z24.h, p7/m, z22.h, z30.h
	add	x13, x13, 16
	add	x4, x4, x1, lsl 1
	mla	z24.h, p7/m, z20.h, z29.h
	add	x10, x10, x16
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x14, 16]
	ld1b	z6.h, p7/z, [x5, x13]
	add	x13, x3, x0
	ld1b	z7.h, p7/z, [x1, x4]
	add	x14, x1, x4
	sub	z17.h, z17.h, #128
	add	x10, x2, x10
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z17.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x0]
	sub	z16.h, z16.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z16.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x19, 16]
	ld1b	z5.h, p7/z, [x1, x14]
	add	x14, x11, 16
	sub	z27.h, z27.h, #128
	ld1b	z4.h, p7/z, [x5, x14]
	add	x11, x11, x1
	add	x0, x0, x3, lsl 1
	mul	z21.h, p7/m, z21.h, z31.h
	add	x11, x11, 16
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x13]
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x10, 16]
	ld1b	z2.h, p7/z, [x5, x11]
	add	x11, x2, x12, lsl 2
	sub	z7.h, z7.h, #128
	mul	z19.h, p7/m, z19.h, z31.h
	add	x10, x3, x0
	add	x12, x3, x12, lsl 2
	mla	z19.h, p7/m, z17.h, z30.h
	add	x4, x4, x1, lsl 1
	add	x12, x2, x12
	ld1b	z3.h, p7/z, [x1, x4]
	mla	z19.h, p7/m, z27.h, z29.h
	lsl	x9, x9, 1
	mla	z19.h, p7/m, z7.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x0]
	sub	z6.h, z6.h, #128
	add	x0, x0, x3, lsl 1
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z6.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x11, 16]
	add	x11, x9, 16
	add	x9, x9, x1
	ld1b	z0.h, p7/z, [x5, x11]
	sub	z5.h, z5.h, #128
	add	x13, x1, x4
	sub	z4.h, z4.h, #128
	ld1b	z1.h, p7/z, [x1, x13]
	add	x18, x2, x18, lsl 1
	add	x9, x9, 16
	mul	z17.h, p7/m, z17.h, z31.h
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z17.h, p7/m, z7.h, z29.h
	mla	z16.h, p7/m, z6.h, z29.h
	mla	z17.h, p7/m, z5.h, z28.h
	mla	z16.h, p7/m, z4.h, z28.h
	add	z17.h, z17.h, #8192
	add	z16.h, z16.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z17.b, z17.b, z17.b
	uzp1	z16.b, z16.b, z16.b
	str	q17, [x3, x10]
	add	x4, x4, x1, lsl 1
	sub	z3.h, z3.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z7.h, z30.h
	str	q16, [x12, 16]
	ld1b	z16.h, p7/z, [x5, x9]
	add	x9, x3, x0
	ld1b	z17.h, p7/z, [x1, x4]
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	add	x10, x1, x4
	sub	z2.h, z2.h, #128
	lsl	x8, x8, 2
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z6.h, z30.h
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x18, 16]
	sub	z1.h, z1.h, #128
	ld1b	z27.h, p7/z, [x1, x10]
	mul	z7.h, p7/m, z7.h, z31.h
	add	x10, x8, 16
	mla	z7.h, p7/m, z5.h, z30.h
	ld1b	z26.h, p7/z, [x5, x10]
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x9]
	lsl	x9, x3, 5
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	sub	x10, x9, x3
	add	x0, x0, x3, lsl 1
	mla	z6.h, p7/m, z4.h, z30.h
	add	x10, x2, x10
	add	x8, x8, x1
	mla	z6.h, p7/m, z2.h, z29.h
	add	x11, x2, x9
	add	x8, x8, 16
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x10, 16]
	ld1b	z24.h, p7/z, [x5, x8]
	add	x8, x3, x0
	add	x4, x4, x1, lsl 1
	sub	z17.h, z17.h, #128
	ld1b	z25.h, p7/z, [x1, x4]
	add	x9, x9, x3
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	sub	z16.h, z16.h, #128
	add	x9, x2, x9
	mul	z4.h, p7/m, z4.h, z31.h
	lsl	x15, x15, 1
	mla	z4.h, p7/m, z2.h, z30.h
	lsl	x7, x7, 3
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x11, 16]
	add	x10, x1, x4
	sub	z27.h, z27.h, #128
	ld1b	z23.h, p7/z, [x1, x10]
	add	x15, x15, 16
	sub	x7, x7, x1
	ld1b	z22.h, p7/z, [x5, x15]
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x8]
	add	x8, x3, x3, lsl 4
	add	x0, x0, x3, lsl 1
	sub	z26.h, z26.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x7, x7, 16
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x9, 16]
	ld1b	z20.h, p7/z, [x5, x7]
	add	x7, x2, x8, lsl 1
	sub	z25.h, z25.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	add	x6, x6, x1
	add	x9, x3, x0
	mla	z1.h, p7/m, z17.h, z30.h
	add	x8, x3, x8, lsl 1
	add	x4, x4, x1, lsl 1
	mla	z1.h, p7/m, z27.h, z29.h
	ld1b	z21.h, p7/z, [x1, x4]
	add	x8, x2, x8
	mla	z1.h, p7/m, z25.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	add	x10, x1, x4
	sub	z24.h, z24.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z16.h, z30.h
	mla	z0.h, p7/m, z26.h, z29.h
	mla	z0.h, p7/m, z24.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x7, 16]
	lsl	x7, x6, 3
	ld1b	z19.h, p7/z, [x1, x10]
	sub	z23.h, z23.h, #128
	add	x10, x7, 16
	mul	z17.h, p7/m, z17.h, z31.h
	ld1b	z18.h, p7/z, [x5, x10]
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x9]
	sub	z22.h, z22.h, #128
	add	x7, x7, x1
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x8, 16]
	add	x8, x3, x3, lsl 3
	sub	z21.h, z21.h, #128
	add	x0, x0, x3, lsl 1
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z25.h, z30.h
	add	x7, x7, 16
	ld1b	z6.h, p7/z, [x5, x7]
	add	x4, x4, x1, lsl 1
	add	x7, x2, x8, lsl 2
	ld1b	z7.h, p7/z, [x1, x4]
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x0]
	add	x9, x3, x0
	sub	z20.h, z20.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x7, 16]
	add	x7, x1, x6, lsl 2
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	add	x10, x1, x4
	mla	z25.h, p7/m, z23.h, z30.h
	ld1b	z5.h, p7/z, [x1, x10]
	lsl	x7, x7, 1
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	x10, x7, 16
	add	z25.h, z25.h, #8192
	ld1b	z4.h, p7/z, [x5, x10]
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x9]
	add	x9, x3, x8, lsl 2
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	add	x9, x2, x9
	add	x8, x3, x8, lsl 1
	mla	z24.h, p7/m, z22.h, z30.h
	add	x0, x0, x3, lsl 1
	add	x7, x7, x1
	mla	z24.h, p7/m, z20.h, z29.h
	add	x8, x2, x8, lsl 1
	mla	z24.h, p7/m, z18.h, z28.h
	add	x7, x7, 16
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x9, 16]
	add	x4, x4, x1, lsl 1
	ld1b	z2.h, p7/z, [x5, x7]
	ld1b	z3.h, p7/z, [x1, x4]
	add	x9, x3, x0
	sub	z7.h, z7.h, #128
	add	x7, x1, x6, lsl 1
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x0]
	sub	z6.h, z6.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x8, 16]
	add	x8, x3, x3, lsl 2
	sub	z5.h, z5.h, #128
	mul	z21.h, p7/m, z21.h, z31.h
	lsl	x7, x7, 2
	add	x10, x1, x4
	mla	z21.h, p7/m, z19.h, z30.h
	ld1b	z1.h, p7/z, [x1, x10]
	mla	z21.h, p7/m, z7.h, z29.h
	add	x7, x7, 16
	mla	z21.h, p7/m, z5.h, z28.h
	ld1b	z0.h, p7/z, [x5, x7]
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x9]
	lsl	x9, x8, 3
	sub	z4.h, z4.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	sub	x7, x9, x3
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z6.h, z29.h
	add	x7, x2, x7
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x0, x0, x3, lsl 1
	add	x13, x2, x9
	add	x9, x9, x3
	sub	z3.h, z3.h, #128
	str	q20, [x7, 16]
	add	x7, x1, x1, lsl 1
	sub	z2.h, z2.h, #128
	add	x4, x4, x1, lsl 1
	mul	z19.h, p7/m, z19.h, z31.h
	ld1b	z21.h, p7/z, [x1, x4]
	lsl	x11, x7, 4
	add	x9, x2, x9
	mla	z19.h, p7/m, z7.h, z30.h
	sub	x10, x11, x7
	lsl	x7, x7, 3
	mla	z19.h, p7/m, z5.h, z29.h
	sub	x7, x7, x1
	add	x10, x10, 16
	ld1b	z20.h, p7/z, [x5, x10]
	add	x10, x3, x0
	mla	z19.h, p7/m, z3.h, z28.h
	mul	z18.h, p7/m, z18.h, z31.h
	lsl	x7, x7, 1
	mla	z18.h, p7/m, z6.h, z30.h
	add	z19.h, z19.h, #8192
	mla	z18.h, p7/m, z4.h, z29.h
	add	x7, x7, 16
	mla	z18.h, p7/m, z2.h, z28.h
	sqrshrunb	z19.b, z19.h, #6
	add	z18.h, z18.h, #8192
	uzp1	z19.b, z19.b, z19.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q19, [x3, x0]
	add	x12, x1, x4
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	str	q18, [x13, 16]
	ld1b	z18.h, p7/z, [x5, x7]
	sub	x7, x11, x1
	ld1b	z19.h, p7/z, [x1, x12]
	mla	z7.h, p7/m, z5.h, z30.h
	add	x7, x7, 16
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x10]
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x9, 16]
	ld1b	z16.h, p7/z, [x5, x7]
	add	x7, x3, x8, lsl 2
	sub	z21.h, z21.h, #128
	add	x0, x0, x3, lsl 1
	add	x4, x4, x1, lsl 1
	mul	z5.h, p7/m, z5.h, z31.h
	add	x12, x2, x7, lsl 1
	add	x9, x3, x0
	ld1b	z17.h, p7/z, [x1, x4]
	add	x7, x3, x7, lsl 1
	add	x10, x1, x4
	mla	z5.h, p7/m, z3.h, z30.h
	add	x7, x2, x7
	mla	z5.h, p7/m, z1.h, z29.h
	add	x8, x3, x8, lsl 1
	mla	z5.h, p7/m, z21.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	add	x4, x4, x1, lsl 1
	add	x0, x0, x3, lsl 1
	sub	z20.h, z20.h, #128
	sub	z19.h, z19.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z3.h, p7/m, z21.h, z29.h
	mla	z4.h, p7/m, z20.h, z28.h
	mla	z3.h, p7/m, z19.h, z28.h
	add	z4.h, z4.h, #8192
	add	z3.h, z3.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z4.b, z4.b, z4.b
	uzp1	z3.b, z3.b, z3.b
	str	q4, [x12, 16]
	ld1b	z27.h, p7/z, [x1, x10]
	add	x10, x11, 16
	ld1b	z26.h, p7/z, [x5, x10]
	str	q3, [x3, x9]
	sub	z18.h, z18.h, #128
	add	x8, x2, x8, lsl 2
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z20.h, z29.h
	mla	z2.h, p7/m, z18.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x7, 16]
	add	x7, x1, x4
	ld1b	z25.h, p7/z, [x1, x4]
	add	x4, x11, x1
	sub	z17.h, z17.h, #128
	add	x4, x4, 16
	mul	z1.h, p7/m, z1.h, z31.h
	ld1b	z24.h, p7/z, [x5, x4]
	mla	z1.h, p7/m, z21.h, z30.h
	add	x4, x3, x0
	mla	z1.h, p7/m, z19.h, z29.h
	add	x6, x6, x6, lsl 2
	mla	z1.h, p7/m, z17.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	sub	z16.h, z16.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z20.h, z30.h
	mla	z0.h, p7/m, z18.h, z29.h
	mla	z0.h, p7/m, z16.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x8, 16]
	ld1b	z23.h, p7/z, [x1, x7]
	add	x1, x3, x3, lsl 1
	sub	z27.h, z27.h, #128
	lsl	x6, x6, 1
	mul	z21.h, p7/m, z21.h, z31.h
	mla	z21.h, p7/m, z19.h, z30.h
	add	x6, x6, 16
	mla	z21.h, p7/m, z17.h, z29.h
	ld1b	z22.h, p7/z, [x5, x6]
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x4]
	lsl	x4, x1, 4
	sub	x5, x4, x1
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	add	x5, x2, x5
	sub	x1, x16, x3
	mla	z20.h, p7/m, z18.h, z30.h
	add	x0, x0, x3, lsl 1
	mla	z20.h, p7/m, z16.h, z29.h
	sub	x4, x4, x3
	add	x1, x2, x1, lsl 1
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x5, 16]
	add	x5, x3, x0
	sub	z25.h, z25.h, #128
	mul	z19.h, p7/m, z19.h, z31.h
	add	x2, x2, x4
	mla	z19.h, p7/m, z17.h, z30.h
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z25.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x0]
	sub	z24.h, z24.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z24.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x1, 16]
	mul	z17.h, p7/m, z17.h, z31.h
	sub	z23.h, z23.h, #128
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x5]
	mul	z16.h, p7/m, z16.h, z31.h
	sub	z22.h, z22.h, #128
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x2, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_interp4_32x48_sve2_vpp, .-dynopt_interp4_32x48_sve2_vpp
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
