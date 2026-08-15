	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_32x64_sve2_vpp
	.type	dynopt_interp4_32x64_sve2_vpp, %function
dynopt_interp4_32x64_sve2_vpp:
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
	lsl	x7, x1, 2
	add	x8, x7, x1
	stp	x23, x24, [sp, 48]
	lsl	x9, x1, 3
	sub	x13, x9, x1
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 25, -16
	.cfi_offset 26, -8
	add	x10, x13, 16
	add	x12, x2, x3, lsl 1
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	ld1b	z25.h, p7/z, [x0]
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	sub	z25.h, z25.h, #128
	ldrsb	w4, [x6, 2]
	mov	z29.h, w4
	add	x14, x2, x3, lsl 2
	ldrsb	w4, [x6, 3]
	sub	x6, x0, x1
	mov	z28.h, w4
	add	x0, x0, 16
	add	x5, x6, x1, lsl 1
	ld1b	z24.h, p7/z, [x0]
	add	x0, x11, 16
	ld1b	z22.h, p7/z, [x6, x0]
	ld1b	z21.h, p7/z, [x5, x1]
	add	x0, x5, x1
	ld1b	z23.h, p7/z, [x6, x11]
	ld1b	z19.h, p7/z, [x1, x0]
	add	x11, x11, x1
	add	x5, x5, x1, lsl 1
	ld1b	z1.h, p7/z, [x6]
	add	x4, x6, 16
	add	x0, x7, 16
	ld1b	z0.h, p7/z, [x4]
	ld1b	z18.h, p7/z, [x6, x0]
	add	x4, x11, 16
	add	x0, x1, x5
	ld1b	z17.h, p7/z, [x1, x5]
	ld1b	z20.h, p7/z, [x6, x4]
	sub	z21.h, z21.h, #128
	sub	z20.h, z20.h, #128
	add	x4, x8, 16
	sub	z23.h, z23.h, #128
	ld1b	z16.h, p7/z, [x6, x4]
	sub	z22.h, z22.h, #128
	sub	z24.h, z24.h, #128
	sub	z1.h, z1.h, #128
	sub	z0.h, z0.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z1.h, p7/m, z25.h, z30.h
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z1.h, p7/m, z23.h, z29.h
	mla	z0.h, p7/m, z22.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	mla	z0.h, p7/m, z20.h, z28.h
	add	z1.h, z1.h, #8192
	add	z0.h, z0.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z1.b, z1.b, z1.b
	uzp1	z0.b, z0.b, z0.b
	stp	q1, q0, [x2]
	ld1b	z27.h, p7/z, [x1, x0]
	lsl	x0, x11, 1
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	add	x0, x0, 16
	ld1b	z26.h, p7/z, [x6, x0]
	mla	z25.h, p7/m, z23.h, z30.h
	add	x0, x2, x3
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x2, x3]
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x0, 16]
	ld1b	z6.h, p7/z, [x6, x10]
	add	x10, x0, x3
	add	x5, x5, x1, lsl 1
	sub	z17.h, z17.h, #128
	ld1b	z7.h, p7/z, [x1, x5]
	add	x4, x1, x5
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z17.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x0, x3]
	sub	z16.h, z16.h, #128
	sub	z27.h, z27.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mul	z21.h, p7/m, z21.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z22.h, p7/m, z16.h, z28.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z22.h, z22.h, #8192
	add	z21.h, z21.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z22.b, z22.b, z22.b
	uzp1	z21.b, z21.b, z21.b
	str	q22, [x12, 16]
	ld1b	z5.h, p7/z, [x1, x4]
	add	x4, x9, 16
	ld1b	z4.h, p7/z, [x6, x4]
	sub	z26.h, z26.h, #128
	str	q21, [x3, x10]
	add	x10, x3, x3, lsl 1
	mul	z20.h, p7/m, z20.h, z31.h
	add	x4, x0, x3, lsl 1
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	add	x0, x2, x10
	add	x9, x9, x1
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x5, x5, x1, lsl 1
	sub	z7.h, z7.h, #128
	mul	z19.h, p7/m, z19.h, z31.h
	str	q20, [x0, 16]
	add	x0, x9, 16
	ld1b	z2.h, p7/z, [x6, x0]
	add	x0, x3, x4
	ld1b	z3.h, p7/z, [x1, x5]
	mla	z19.h, p7/m, z17.h, z30.h
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z7.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	add	x12, x1, x5
	sub	z6.h, z6.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	lsl	x30, x8, 1
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z6.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x14, 16]
	add	x14, x3, x3, lsl 2
	ld1b	z1.h, p7/z, [x1, x12]
	sub	z5.h, z5.h, #128
	add	x12, x30, 16
	mul	z17.h, p7/m, z17.h, z31.h
	ld1b	z0.h, p7/z, [x6, x12]
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z7.h, z29.h
	mla	z17.h, p7/m, z5.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	add	x0, x2, x14
	sub	z4.h, z4.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x15, x2, x10, lsl 1
	mla	z16.h, p7/m, z26.h, z30.h
	add	x30, x30, x1
	add	x5, x5, x1, lsl 1
	mla	z16.h, p7/m, z6.h, z29.h
	mla	z16.h, p7/m, z4.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x0, 16]
	add	x0, x30, 16
	ld1b	z17.h, p7/z, [x1, x5]
	ld1b	z16.h, p7/z, [x6, x0]
	add	x12, x1, x5
	add	x0, x3, x4
	sub	z3.h, z3.h, #128
	lsl	x19, x11, 2
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z7.h, z30.h
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	lsl	x21, x3, 3
	sub	z2.h, z2.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z6.h, z30.h
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x15, 16]
	ld1b	z27.h, p7/z, [x1, x12]
	add	x12, x19, 16
	ld1b	z26.h, p7/z, [x6, x12]
	sub	x12, x21, x3
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x0]
	add	x0, x2, x12
	sub	z0.h, z0.h, #128
	add	x4, x4, x3, lsl 1
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	add	x16, x2, x21
	add	x5, x5, x1, lsl 1
	mla	z6.h, p7/m, z2.h, z29.h
	add	x19, x19, x1
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x0, 16]
	sub	z17.h, z17.h, #128
	ld1b	z25.h, p7/z, [x1, x5]
	add	x0, x1, x5
	add	x15, x19, 16
	mul	z5.h, p7/m, z5.h, z31.h
	ld1b	z24.h, p7/z, [x6, x15]
	mla	z5.h, p7/m, z3.h, z30.h
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z16.h, z16.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x16, 16]
	ld1b	z23.h, p7/z, [x1, x0]
	lsl	x0, x13, 1
	add	x21, x21, x3
	sub	z27.h, z27.h, #128
	mul	z3.h, p7/m, z3.h, z31.h
	add	x15, x3, x4
	add	x0, x0, 16
	ld1b	z22.h, p7/z, [x6, x0]
	add	x0, x2, x21
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x15]
	sub	z26.h, z26.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x0, 16]
	lsl	x0, x1, 4
	sub	x17, x0, x1
	sub	z25.h, z25.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x15, x17, 16
	ld1b	z20.h, p7/z, [x6, x15]
	add	x18, x2, x14, lsl 1
	add	x15, x3, x4
	mla	z1.h, p7/m, z17.h, z30.h
	add	x5, x5, x1, lsl 1
	add	x20, x3, x14, lsl 1
	ld1b	z21.h, p7/z, [x1, x5]
	add	x16, x1, x5
	mla	z1.h, p7/m, z27.h, z29.h
	mla	z1.h, p7/m, z25.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	sub	z24.h, z24.h, #128
	sub	z23.h, z23.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z0.h, p7/m, z16.h, z30.h
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z0.h, p7/m, z26.h, z29.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z0.h, p7/m, z24.h, z28.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z0.h, z0.h, #8192
	add	z17.h, z17.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z0.b, z0.b, z0.b
	uzp1	z17.b, z17.b, z17.b
	str	q0, [x18, 16]
	ld1b	z19.h, p7/z, [x1, x16]
	add	x16, x0, 16
	ld1b	z18.h, p7/z, [x6, x16]
	str	q17, [x3, x15]
	add	x15, x2, x20
	sub	z22.h, z22.h, #128
	add	x4, x4, x3, lsl 1
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	add	x18, x2, x10, lsl 2
	add	x5, x5, x1, lsl 1
	mla	z16.h, p7/m, z24.h, z29.h
	add	x0, x0, x1
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x15, 16]
	sub	z21.h, z21.h, #128
	ld1b	z7.h, p7/z, [x1, x5]
	add	x15, x1, x5
	add	x16, x0, 16
	mul	z27.h, p7/m, z27.h, z31.h
	ld1b	z6.h, p7/z, [x6, x16]
	mla	z27.h, p7/m, z25.h, z30.h
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	add	x16, x3, x4
	sub	z20.h, z20.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x18, 16]
	ld1b	z5.h, p7/z, [x1, x15]
	lsl	x15, x9, 1
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	add	x18, x15, 16
	ld1b	z4.h, p7/z, [x6, x18]
	mla	z25.h, p7/m, z23.h, z30.h
	add	x18, x3, x10, lsl 2
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x16]
	add	x16, x2, x18
	sub	z18.h, z18.h, #128
	add	x4, x4, x3, lsl 1
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	add	x15, x15, x1
	add	x23, x2, x12, lsl 1
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x16, 16]
	add	x16, x15, 16
	add	x5, x5, x1, lsl 1
	ld1b	z2.h, p7/z, [x6, x16]
	ld1b	z3.h, p7/z, [x1, x5]
	add	x16, x3, x4
	add	x22, x1, x5
	sub	z7.h, z7.h, #128
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	lsl	x24, x3, 4
	sub	z6.h, z6.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x23, 16]
	ld1b	z1.h, p7/z, [x1, x22]
	lsl	x22, x8, 2
	sub	z5.h, z5.h, #128
	add	x23, x22, 16
	mul	z21.h, p7/m, z21.h, z31.h
	ld1b	z0.h, p7/z, [x6, x23]
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x16]
	sub	x16, x24, x3
	sub	z4.h, z4.h, #128
	add	x23, x2, x16
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z6.h, z29.h
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x4, x4, x3, lsl 1
	str	q20, [x23, 16]
	add	x23, x22, x1
	sub	z3.h, z3.h, #128
	add	x23, x23, 16
	ld1b	z20.h, p7/z, [x6, x23]
	mul	z19.h, p7/m, z19.h, z31.h
	add	x23, x2, x24
	add	x5, x5, x1, lsl 1
	mla	z19.h, p7/m, z7.h, z30.h
	ld1b	z21.h, p7/z, [x1, x5]
	mla	z19.h, p7/m, z5.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	add	x26, x1, x5
	sub	z2.h, z2.h, #128
	add	x25, x3, x4
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z6.h, z30.h
	mla	z18.h, p7/m, z4.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x23, 16]
	add	x23, x5, x1, lsl 1
	ld1b	z19.h, p7/z, [x1, x26]
	sub	z1.h, z1.h, #128
	lsl	x5, x30, 1
	add	x30, x24, x3
	mul	z7.h, p7/m, z7.h, z31.h
	add	x30, x2, x30
	mla	z7.h, p7/m, z5.h, z30.h
	add	x5, x5, 16
	mla	z7.h, p7/m, z3.h, z29.h
	ld1b	z18.h, p7/z, [x6, x5]
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x25]
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x30, 16]
	lsl	x30, x11, 3
	ld1b	z17.h, p7/z, [x1, x23]
	sub	x5, x30, x1
	sub	z21.h, z21.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x5, x5, 16
	ld1b	z16.h, p7/z, [x6, x5]
	add	x24, x3, x4
	add	x5, x2, x21, lsl 1
	mla	z5.h, p7/m, z3.h, z30.h
	add	x21, x3, x21, lsl 1
	mla	z5.h, p7/m, z1.h, z29.h
	add	x22, x8, x22
	add	x21, x2, x21
	mla	z5.h, p7/m, z21.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	add	x25, x1, x23
	sub	z20.h, z20.h, #128
	sub	z19.h, z19.h, #128
	add	x4, x4, x3, lsl 1
	add	x22, x22, 16
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
	str	q4, [x5, 16]
	add	x5, x23, x1, lsl 1
	ld1b	z27.h, p7/z, [x1, x25]
	add	x23, x30, 16
	ld1b	z26.h, p7/z, [x6, x23]
	str	q3, [x3, x24]
	sub	z18.h, z18.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z20.h, z29.h
	mla	z2.h, p7/m, z18.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x21, 16]
	ld1b	z24.h, p7/z, [x6, x22]
	add	x22, x2, x14, lsl 2
	lsl	x19, x19, 1
	ld1b	z25.h, p7/z, [x1, x5]
	sub	z17.h, z17.h, #128
	add	x19, x19, 16
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z21.h, z30.h
	mla	z1.h, p7/m, z19.h, z29.h
	mla	z1.h, p7/m, z17.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	add	x21, x3, x4
	sub	z16.h, z16.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z20.h, z30.h
	mla	z0.h, p7/m, z18.h, z29.h
	mla	z0.h, p7/m, z16.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x22, 16]
	ld1b	z22.h, p7/z, [x6, x19]
	add	x19, x3, x14, lsl 2
	add	x19, x2, x19
	sub	z27.h, z27.h, #128
	mul	z21.h, p7/m, z21.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x23, x1, x5
	mla	z21.h, p7/m, z19.h, z30.h
	ld1b	z23.h, p7/z, [x1, x23]
	add	x20, x2, x20, lsl 1
	mla	z21.h, p7/m, z17.h, z29.h
	add	x11, x11, x30
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x21]
	add	x5, x5, x1, lsl 1
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	add	x11, x11, 16
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x19, 16]
	sub	z25.h, z25.h, #128
	ld1b	z7.h, p7/z, [x1, x5]
	ld1b	z6.h, p7/z, [x6, x11]
	add	x19, x1, x5
	add	x11, x3, x4
	lsl	x13, x13, 2
	mul	z19.h, p7/m, z19.h, z31.h
	mla	z19.h, p7/m, z17.h, z30.h
	mla	z19.h, p7/m, z27.h, z29.h
	mla	z19.h, p7/m, z25.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	sub	z24.h, z24.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z24.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x20, 16]
	ld1b	z5.h, p7/z, [x1, x19]
	add	x19, x13, 16
	ld1b	z4.h, p7/z, [x6, x19]
	lsl	x19, x10, 3
	sub	z23.h, z23.h, #128
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z25.h, z29.h
	mla	z17.h, p7/m, z23.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x11]
	sub	x11, x19, x3
	add	x11, x2, x11
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	add	x13, x13, x1
	add	x4, x4, x3, lsl 1
	mla	z16.h, p7/m, z26.h, z30.h
	add	x13, x13, 16
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x11, 16]
	ld1b	z2.h, p7/z, [x6, x13]
	add	x13, x2, x19
	add	x11, x3, x4
	sub	z7.h, z7.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	add	x5, x5, x1, lsl 1
	mla	z27.h, p7/m, z25.h, z30.h
	ld1b	z3.h, p7/z, [x1, x5]
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z7.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	sub	z6.h, z6.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	lsl	x17, x17, 1
	mla	z26.h, p7/m, z24.h, z30.h
	add	x14, x14, x14, lsl 2
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z6.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x13, 16]
	add	x20, x1, x5
	sub	z5.h, z5.h, #128
	ld1b	z1.h, p7/z, [x1, x20]
	add	x14, x2, x14
	add	x17, x17, 16
	mul	z25.h, p7/m, z25.h, z31.h
	ld1b	z0.h, p7/z, [x6, x17]
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z7.h, z29.h
	mla	z25.h, p7/m, z5.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x11]
	lsl	x11, x1, 5
	sub	z4.h, z4.h, #128
	add	x4, x4, x3, lsl 1
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	sub	x13, x11, x1
	mla	z24.h, p7/m, z6.h, z29.h
	add	x18, x2, x18, lsl 1
	mla	z24.h, p7/m, z4.h, z28.h
	add	x13, x13, 16
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	add	x5, x5, x1, lsl 1
	add	x10, x10, x19
	str	q24, [x14, 16]
	ld1b	z24.h, p7/z, [x6, x13]
	add	x13, x3, x4
	ld1b	z25.h, p7/z, [x1, x5]
	sub	z3.h, z3.h, #128
	add	x14, x1, x5
	add	x10, x2, x10
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z7.h, z30.h
	mla	z23.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	sub	z2.h, z2.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z6.h, z30.h
	mla	z22.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z2.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x18, 16]
	ld1b	z23.h, p7/z, [x1, x14]
	add	x14, x11, 16
	add	x11, x11, x1
	ld1b	z22.h, p7/z, [x6, x14]
	sub	z1.h, z1.h, #128
	add	x4, x4, x3, lsl 1
	add	x11, x11, 16
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x13]
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x10, 16]
	ld1b	z20.h, p7/z, [x6, x11]
	add	x11, x2, x12, lsl 2
	add	x10, x3, x4
	sub	z25.h, z25.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	add	x12, x3, x12, lsl 2
	add	x5, x5, x1, lsl 1
	mla	z5.h, p7/m, z3.h, z30.h
	ld1b	z21.h, p7/z, [x1, x5]
	add	x12, x2, x12
	mla	z5.h, p7/m, z1.h, z29.h
	lsl	x0, x0, 1
	mla	z5.h, p7/m, z25.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z24.h, z24.h, #128
	add	x4, x4, x3, lsl 1
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z24.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x11, 16]
	add	x11, x0, 16
	sub	z23.h, z23.h, #128
	add	x0, x0, x1
	ld1b	z18.h, p7/z, [x6, x11]
	mul	z3.h, p7/m, z3.h, z31.h
	add	x13, x1, x5
	add	x16, x2, x16, lsl 1
	ld1b	z19.h, p7/z, [x1, x13]
	mla	z3.h, p7/m, z1.h, z30.h
	add	x0, x0, 16
	mla	z3.h, p7/m, z25.h, z29.h
	mla	z3.h, p7/m, z23.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x10]
	sub	z22.h, z22.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z24.h, z29.h
	mla	z2.h, p7/m, z22.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x12, 16]
	ld1b	z16.h, p7/z, [x6, x0]
	add	x0, x3, x4
	sub	z21.h, z21.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	add	x5, x5, x1, lsl 1
	mla	z1.h, p7/m, z25.h, z30.h
	ld1b	z17.h, p7/z, [x1, x5]
	mla	z1.h, p7/m, z23.h, z29.h
	mla	z1.h, p7/m, z21.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	add	x10, x1, x5
	sub	z20.h, z20.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	lsl	x9, x9, 2
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z22.h, z29.h
	mla	z0.h, p7/m, z20.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x16, 16]
	sub	z19.h, z19.h, #128
	ld1b	z27.h, p7/z, [x1, x10]
	mul	z25.h, p7/m, z25.h, z31.h
	add	x10, x9, 16
	mla	z25.h, p7/m, z23.h, z30.h
	ld1b	z26.h, p7/z, [x6, x10]
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x0]
	lsl	x0, x3, 5
	sub	x10, x0, x3
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	add	x10, x2, x10
	add	x4, x4, x3, lsl 1
	mla	z24.h, p7/m, z22.h, z30.h
	add	x9, x9, x1
	add	x11, x2, x0
	mla	z24.h, p7/m, z20.h, z29.h
	add	x9, x9, 16
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x10, 16]
	ld1b	z6.h, p7/z, [x6, x9]
	add	x9, x3, x4
	sub	z17.h, z17.h, #128
	add	x5, x5, x1, lsl 1
	mul	z23.h, p7/m, z23.h, z31.h
	ld1b	z7.h, p7/z, [x1, x5]
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z17.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	sub	z16.h, z16.h, #128
	add	x0, x0, x3
	mul	z22.h, p7/m, z22.h, z31.h
	lsl	x15, x15, 1
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z16.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x11, 16]
	add	x10, x1, x5
	sub	z27.h, z27.h, #128
	ld1b	z5.h, p7/z, [x1, x10]
	add	x0, x2, x0
	add	x15, x15, 16
	mul	z21.h, p7/m, z21.h, z31.h
	ld1b	z4.h, p7/z, [x6, x15]
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x9]
	add	x9, x3, x3, lsl 4
	add	x4, x4, x3, lsl 1
	sub	z26.h, z26.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	add	x11, x2, x9, lsl 1
	lsl	x8, x8, 3
	mla	z20.h, p7/m, z18.h, z30.h
	add	x7, x7, x1
	add	x5, x5, x1, lsl 1
	mla	z20.h, p7/m, z16.h, z29.h
	add	x10, x3, x4
	mla	z20.h, p7/m, z26.h, z28.h
	sub	x8, x8, x1
	add	x9, x3, x9, lsl 1
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x0, 16]
	sub	z7.h, z7.h, #128
	ld1b	z3.h, p7/z, [x1, x5]
	add	x0, x1, x5
	mul	z19.h, p7/m, z19.h, z31.h
	add	x9, x2, x9
	mla	z19.h, p7/m, z17.h, z30.h
	add	x8, x8, 16
	mla	z19.h, p7/m, z27.h, z29.h
	ld1b	z2.h, p7/z, [x6, x8]
	mla	z19.h, p7/m, z7.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	sub	z6.h, z6.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z6.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x11, 16]
	ld1b	z1.h, p7/z, [x1, x0]
	lsl	x0, x7, 3
	sub	z5.h, z5.h, #128
	add	x11, x0, 16
	mul	z17.h, p7/m, z17.h, z31.h
	ld1b	z0.h, p7/z, [x6, x11]
	mla	z17.h, p7/m, z27.h, z30.h
	mla	z17.h, p7/m, z7.h, z29.h
	mla	z17.h, p7/m, z5.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x10]
	sub	z4.h, z4.h, #128
	add	x0, x0, x1
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z6.h, z29.h
	mla	z16.h, p7/m, z4.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x9, 16]
	add	x9, x3, x3, lsl 3
	sub	z3.h, z3.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x0, x0, 16
	ld1b	z16.h, p7/z, [x6, x0]
	add	x0, x2, x9, lsl 2
	add	x5, x5, x1, lsl 1
	mla	z27.h, p7/m, z7.h, z30.h
	ld1b	z17.h, p7/z, [x1, x5]
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	add	x11, x3, x4
	sub	z2.h, z2.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z6.h, z30.h
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x0, 16]
	add	x0, x1, x7, lsl 2
	add	x12, x1, x5
	sub	z1.h, z1.h, #128
	ld1b	z27.h, p7/z, [x1, x12]
	lsl	x0, x0, 1
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z5.h, z30.h
	add	x12, x0, 16
	mla	z7.h, p7/m, z3.h, z29.h
	ld1b	z26.h, p7/z, [x6, x12]
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x11]
	add	x11, x3, x9, lsl 2
	add	x11, x2, x11
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	add	x9, x3, x9, lsl 1
	add	x4, x4, x3, lsl 1
	mla	z6.h, p7/m, z4.h, z30.h
	add	x0, x0, x1
	add	x14, x1, x7, lsl 1
	mla	z6.h, p7/m, z2.h, z29.h
	add	x9, x2, x9, lsl 1
	add	x0, x0, 16
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x11, 16]
	ld1b	z24.h, p7/z, [x6, x0]
	add	x0, x3, x4
	add	x16, x3, x3, lsl 2
	sub	z17.h, z17.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	add	x5, x5, x1, lsl 1
	mla	z5.h, p7/m, z3.h, z30.h
	ld1b	z25.h, p7/z, [x1, x5]
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z16.h, z16.h, #128
	lsl	x15, x14, 2
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x9, 16]
	add	x11, x1, x5
	sub	z27.h, z27.h, #128
	ld1b	z23.h, p7/z, [x1, x11]
	add	x9, x15, 16
	mul	z3.h, p7/m, z3.h, z31.h
	ld1b	z22.h, p7/z, [x6, x9]
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x0]
	lsl	x0, x16, 3
	sub	x9, x0, x3
	sub	z26.h, z26.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x9, x2, x9
	mla	z2.h, p7/m, z0.h, z30.h
	mla	z2.h, p7/m, z16.h, z29.h
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	add	x4, x4, x3, lsl 1
	add	x5, x5, x1, lsl 1
	str	q2, [x9, 16]
	add	x9, x1, x1, lsl 1
	ld1b	z21.h, p7/z, [x1, x5]
	sub	z25.h, z25.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z17.h, z30.h
	lsl	x13, x9, 4
	mla	z1.h, p7/m, z27.h, z29.h
	mla	z1.h, p7/m, z25.h, z28.h
	sub	x11, x13, x9
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	add	x11, x11, 16
	ld1b	z20.h, p7/z, [x6, x11]
	uzp1	z1.b, z1.b, z1.b
	add	x11, x2, x0
	str	q1, [x3, x4]
	sub	z24.h, z24.h, #128
	add	x12, x3, x4
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z16.h, z30.h
	add	x0, x0, x3
	mla	z0.h, p7/m, z26.h, z29.h
	mla	z0.h, p7/m, z24.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x11, 16]
	sub	x11, x30, x1
	sub	z23.h, z23.h, #128
	add	x0, x2, x0
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z17.h, p7/m, z27.h, z30.h
	lsl	x11, x11, 1
	add	x17, x1, x5
	mla	z17.h, p7/m, z25.h, z29.h
	ld1b	z19.h, p7/z, [x1, x17]
	mla	z17.h, p7/m, z23.h, z28.h
	add	x11, x11, 16
	add	z17.h, z17.h, #8192
	ld1b	z18.h, p7/z, [x6, x11]
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x12]
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x0, 16]
	sub	x0, x13, x1
	add	x0, x0, 16
	ld1b	z6.h, p7/z, [x6, x0]
	sub	z21.h, z21.h, #128
	add	x0, x3, x16, lsl 2
	add	x4, x4, x3, lsl 1
	mul	z27.h, p7/m, z27.h, z31.h
	add	x11, x3, x4
	add	x5, x5, x1, lsl 1
	mla	z27.h, p7/m, z25.h, z30.h
	add	x17, x2, x0, lsl 1
	add	x0, x3, x0, lsl 1
	ld1b	z7.h, p7/z, [x1, x5]
	add	x0, x2, x0
	add	x12, x1, x5
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	sub	z20.h, z20.h, #128
	sub	z19.h, z19.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z26.h, z26.h, #8192
	add	z25.h, z25.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z26.b, z26.b, z26.b
	uzp1	z25.b, z25.b, z25.b
	str	q26, [x17, 16]
	ld1b	z5.h, p7/z, [x1, x12]
	add	x12, x13, 16
	ld1b	z4.h, p7/z, [x6, x12]
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	str	q25, [x3, x11]
	mla	z24.h, p7/m, z22.h, z30.h
	add	x11, x3, x16, lsl 1
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x0, 16]
	add	x0, x13, x1
	sub	z7.h, z7.h, #128
	mul	z23.h, p7/m, z23.h, z31.h
	add	x4, x4, x3, lsl 1
	add	x0, x0, 16
	ld1b	z2.h, p7/z, [x6, x0]
	add	x7, x7, x7, lsl 2
	add	x0, x2, x11, lsl 2
	mla	z23.h, p7/m, z21.h, z30.h
	add	x5, x5, x1, lsl 1
	add	x12, x3, x4
	ld1b	z3.h, p7/z, [x1, x5]
	lsl	x7, x7, 1
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z7.h, z28.h
	add	x7, x7, 16
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	sub	z6.h, z6.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z6.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x0, 16]
	ld1b	z0.h, p7/z, [x6, x7]
	add	x7, x3, x3, lsl 1
	sub	z5.h, z5.h, #128
	mul	z21.h, p7/m, z21.h, z31.h
	add	x17, x1, x5
	mla	z21.h, p7/m, z19.h, z30.h
	ld1b	z1.h, p7/z, [x1, x17]
	mla	z21.h, p7/m, z7.h, z29.h
	mla	z21.h, p7/m, z5.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x12]
	lsl	x12, x7, 4
	sub	z4.h, z4.h, #128
	mul	z20.h, p7/m, z20.h, z31.h
	add	x0, x5, x1, lsl 1
	sub	x5, x12, x7
	mla	z20.h, p7/m, z18.h, z30.h
	add	x5, x2, x5
	add	x13, x9, x13
	mla	z20.h, p7/m, z6.h, z29.h
	add	x13, x13, 16
	mla	z20.h, p7/m, z4.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	add	x4, x4, x3, lsl 1
	str	q20, [x5, 16]
	ld1b	z20.h, p7/z, [x6, x13]
	lsl	x13, x7, 3
	sub	x5, x13, x3
	ld1b	z21.h, p7/z, [x1, x0]
	sub	z3.h, z3.h, #128
	add	x17, x1, x0
	mul	z19.h, p7/m, z19.h, z31.h
	mla	z19.h, p7/m, z7.h, z30.h
	add	x5, x2, x5, lsl 1
	mla	z19.h, p7/m, z5.h, z29.h
	mla	z19.h, p7/m, z3.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	sub	z2.h, z2.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z6.h, z30.h
	mla	z18.h, p7/m, z4.h, z29.h
	mla	z18.h, p7/m, z2.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x5, 16]
	ld1b	z19.h, p7/z, [x1, x17]
	add	x17, x1, x9, lsl 2
	add	x19, x3, x4
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	lsl	x17, x17, 2
	add	x4, x4, x3, lsl 1
	mla	z7.h, p7/m, z5.h, z30.h
	add	x5, x17, 16
	ld1b	z18.h, p7/z, [x6, x5]
	add	x17, x17, x1
	sub	x5, x12, x3
	mla	z7.h, p7/m, z3.h, z29.h
	add	x17, x17, 16
	add	x5, x2, x5
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x19]
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x5, 16]
	ld1b	z16.h, p7/z, [x6, x17]
	add	x17, x2, x12
	sub	z21.h, z21.h, #128
	add	x5, x3, x4
	add	x9, x9, x30
	mul	z5.h, p7/m, z5.h, z31.h
	add	x0, x0, x1, lsl 1
	mla	z5.h, p7/m, z3.h, z30.h
	ld1b	z17.h, p7/z, [x1, x0]
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z21.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x4]
	sub	z20.h, z20.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	lsl	x9, x9, 1
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z20.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x17, 16]
	add	x19, x1, x0
	sub	z19.h, z19.h, #128
	ld1b	z27.h, p7/z, [x1, x19]
	add	x9, x9, 16
	mul	z3.h, p7/m, z3.h, z31.h
	ld1b	z26.h, p7/z, [x6, x9]
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z3.h, p7/m, z21.h, z29.h
	mla	z3.h, p7/m, z19.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x5]
	add	x5, x12, x3
	add	x5, x2, x5
	sub	z18.h, z18.h, #128
	mul	z2.h, p7/m, z2.h, z31.h
	add	x16, x16, x16, lsl 2
	add	x4, x4, x3, lsl 1
	mla	z2.h, p7/m, z0.h, z30.h
	add	x0, x0, x1, lsl 1
	mla	z2.h, p7/m, z20.h, z29.h
	add	x14, x14, x15
	add	x16, x2, x16, lsl 1
	mla	z2.h, p7/m, z18.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x5, 16]
	sub	z17.h, z17.h, #128
	ld1b	z25.h, p7/z, [x1, x0]
	add	x5, x1, x0
	add	x14, x14, 16
	mul	z1.h, p7/m, z1.h, z31.h
	ld1b	z24.h, p7/z, [x6, x14]
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
	str	q0, [x16, 16]
	ld1b	z23.h, p7/z, [x1, x5]
	lsl	x5, x1, 3
	sub	x5, x5, x1
	sub	z27.h, z27.h, #128
	mul	z21.h, p7/m, z21.h, z31.h
	add	x14, x3, x4
	add	x12, x7, x12
	mla	z21.h, p7/m, z19.h, z30.h
	add	x12, x2, x12
	lsl	x9, x5, 3
	mla	z21.h, p7/m, z17.h, z29.h
	add	x15, x9, 16
	add	x9, x9, x1
	ld1b	z22.h, p7/z, [x6, x15]
	mla	z21.h, p7/m, z27.h, z28.h
	add	x9, x9, 16
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
	str	q20, [x12, 16]
	ld1b	z6.h, p7/z, [x6, x9]
	add	x9, x3, x7, lsl 2
	sub	z25.h, z25.h, #128
	add	x4, x4, x3, lsl 1
	add	x5, x1, x5, lsl 2
	mul	z19.h, p7/m, z19.h, z31.h
	add	x15, x2, x9, lsl 2
	add	x0, x0, x1, lsl 1
	mla	z19.h, p7/m, z17.h, z30.h
	lsl	x5, x5, 1
	ld1b	z7.h, p7/z, [x1, x0]
	mla	z19.h, p7/m, z27.h, z29.h
	add	x5, x5, 16
	mla	z19.h, p7/m, z25.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x4]
	add	x12, x3, x4
	sub	z24.h, z24.h, #128
	mul	z18.h, p7/m, z18.h, z31.h
	add	x9, x3, x9, lsl 2
	mla	z18.h, p7/m, z16.h, z30.h
	mla	z18.h, p7/m, z26.h, z29.h
	mla	z18.h, p7/m, z24.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x15, 16]
	ld1b	z4.h, p7/z, [x6, x5]
	lsl	x5, x1, 4
	sub	z23.h, z23.h, #128
	mul	z17.h, p7/m, z17.h, z31.h
	add	x9, x2, x9
	sub	x5, x5, x1
	mla	z17.h, p7/m, z27.h, z30.h
	add	x14, x1, x0
	mla	z17.h, p7/m, z25.h, z29.h
	ld1b	z5.h, p7/z, [x1, x14]
	lsl	x5, x5, 2
	mla	z17.h, p7/m, z23.h, z28.h
	add	x7, x7, x13
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x12]
	add	x4, x4, x3, lsl 1
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z26.h, z30.h
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x9, 16]
	sub	x9, x5, x1
	add	x7, x2, x7, lsl 1
	sub	z7.h, z7.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	add	x9, x9, 16
	add	x11, x11, x11, lsl 2
	ld1b	z2.h, p7/z, [x6, x9]
	add	x9, x3, x4
	add	x0, x0, x1, lsl 1
	mla	z27.h, p7/m, z25.h, z30.h
	ld1b	z3.h, p7/z, [x1, x0]
	add	x11, x2, x11
	mla	z27.h, p7/m, z23.h, z29.h
	lsl	x10, x3, 3
	mla	z27.h, p7/m, z7.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x4]
	sub	x10, x10, x3
	sub	z6.h, z6.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z6.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x7, 16]
	add	x7, x5, 16
	sub	z5.h, z5.h, #128
	add	x5, x5, x1
	ld1b	z0.h, p7/z, [x6, x7]
	sub	z4.h, z4.h, #128
	add	x12, x1, x0
	add	x4, x4, x3, lsl 1
	ld1b	z1.h, p7/z, [x1, x12]
	add	x5, x5, 16
	mul	z25.h, p7/m, z25.h, z31.h
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z25.h, p7/m, z7.h, z29.h
	mla	z24.h, p7/m, z6.h, z29.h
	mla	z25.h, p7/m, z5.h, z28.h
	mla	z24.h, p7/m, z4.h, z28.h
	add	z25.h, z25.h, #8192
	add	z24.h, z24.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z25.b, z25.b, z25.b
	uzp1	z24.b, z24.b, z24.b
	str	q25, [x3, x9]
	add	x0, x0, x1, lsl 1
	sub	z3.h, z3.h, #128
	add	x9, x1, x0
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z7.h, z30.h
	str	q24, [x11, 16]
	ld1b	z24.h, p7/z, [x6, x5]
	add	x5, x2, x10, lsl 3
	ld1b	z25.h, p7/z, [x1, x0]
	mla	z23.h, p7/m, z5.h, z29.h
	mla	z23.h, p7/m, z3.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	sub	z2.h, z2.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z6.h, z30.h
	mla	z22.h, p7/m, z4.h, z29.h
	mla	z22.h, p7/m, z2.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x5, 16]
	ld1b	z23.h, p7/z, [x1, x9]
	lsl	x9, x1, 5
	sub	x5, x9, x1
	sub	z1.h, z1.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	add	x7, x3, x4
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	lsl	x5, x5, 1
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	add	x5, x5, 16
	ld1b	z22.h, p7/z, [x6, x5]
	sqrshrunb	z7.b, z7.h, #6
	add	x5, x3, x10, lsl 3
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x7]
	add	x5, x2, x5
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x5, 16]
	lsl	x5, x1, 6
	sub	z25.h, z25.h, #128
	sub	x7, x5, x1
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z3.h, z30.h
	add	x10, x3, x10, lsl 2
	add	x4, x4, x3, lsl 1
	mla	z5.h, p7/m, z1.h, z29.h
	lsl	x8, x3, 4
	add	x7, x7, 16
	ld1b	z20.h, p7/z, [x6, x7]
	add	x10, x2, x10, lsl 1
	add	x7, x3, x4
	mla	z5.h, p7/m, z25.h, z28.h
	sub	x8, x8, x3
	add	x0, x0, x1, lsl 1
	add	z5.h, z5.h, #8192
	ld1b	z21.h, p7/z, [x1, x0]
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	lsl	x8, x8, 2
	str	q5, [x3, x4]
	sub	z24.h, z24.h, #128
	add	x11, x1, x0
	sub	z23.h, z23.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z3.h, p7/m, z1.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z3.h, p7/m, z25.h, z29.h
	mla	z4.h, p7/m, z24.h, z28.h
	mla	z3.h, p7/m, z23.h, z28.h
	add	z4.h, z4.h, #8192
	add	z3.h, z3.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z4.b, z4.b, z4.b
	uzp1	z3.b, z3.b, z3.b
	str	q4, [x10, 16]
	add	x10, x5, 16
	ld1b	z19.h, p7/z, [x1, x11]
	ld1b	z18.h, p7/z, [x6, x10]
	add	x0, x0, x1, lsl 1
	str	q3, [x3, x7]
	sub	x7, x8, x3
	sub	z22.h, z22.h, #128
	add	x7, x2, x7
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	add	x4, x4, x3, lsl 1
	mla	z2.h, p7/m, z24.h, z29.h
	mla	z2.h, p7/m, z22.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x7, 16]
	add	x7, x1, x0
	ld1b	z17.h, p7/z, [x1, x0]
	add	x0, x2, x8
	sub	z21.h, z21.h, #128
	mul	z1.h, p7/m, z1.h, z31.h
	add	x5, x5, x1
	mla	z1.h, p7/m, z25.h, z30.h
	mla	z1.h, p7/m, z23.h, z29.h
	add	x5, x5, 16
	mla	z1.h, p7/m, z21.h, z28.h
	ld1b	z16.h, p7/z, [x6, x5]
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x4]
	sub	z20.h, z20.h, #128
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z22.h, z29.h
	mla	z0.h, p7/m, z20.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x0, 16]
	add	x0, x9, x1
	ld1b	z27.h, p7/z, [x1, x7]
	add	x5, x3, x4
	sub	z19.h, z19.h, #128
	mul	z25.h, p7/m, z25.h, z31.h
	lsl	x0, x0, 1
	add	x8, x8, x3
	mla	z25.h, p7/m, z23.h, z30.h
	add	x0, x0, 16
	ld1b	z26.h, p7/z, [x6, x0]
	add	x8, x2, x8
	lsl	x0, x3, 5
	add	x4, x4, x3, lsl 1
	mla	z25.h, p7/m, z21.h, z29.h
	sub	x0, x0, x3
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x5]
	add	x0, x2, x0, lsl 1
	sub	z18.h, z18.h, #128
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x8, 16]
	sub	z17.h, z17.h, #128
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z21.h, z30.h
	mla	z23.h, p7/m, z19.h, z29.h
	mla	z23.h, p7/m, z17.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x4]
	sub	z16.h, z16.h, #128
	add	x1, x3, x4
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z20.h, z30.h
	mla	z22.h, p7/m, z18.h, z29.h
	mla	z22.h, p7/m, z16.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x0, 16]
	add	x0, x2, x3, lsl 6
	sub	x0, x0, x3
	mul	z21.h, p7/m, z21.h, z31.h
	sub	z27.h, z27.h, #128
	mla	z21.h, p7/m, z19.h, z30.h
	mla	z21.h, p7/m, z17.h, z29.h
	mla	z21.h, p7/m, z27.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x1]
	mul	z20.h, p7/m, z20.h, z31.h
	sub	z26.h, z26.h, #128
	mla	z20.h, p7/m, z18.h, z30.h
	mla	z20.h, p7/m, z16.h, z29.h
	mla	z20.h, p7/m, z26.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x0, 16]
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
	.size	dynopt_interp4_32x64_sve2_vpp, .-dynopt_interp4_32x64_sve2_vpp
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
