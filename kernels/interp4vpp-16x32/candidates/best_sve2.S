	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_16x32_sve2_vpp
	.type	dynopt_interp4_16x32_sve2_vpp, %function
dynopt_interp4_16x32_sve2_vpp:
.LFB3:
	.cfi_startproc
	ubfiz	x4, x4, 2, 3
	adrp	x5, .LANCHOR0
	ptrue	p7.b, all
	add	x5, x5, :lo12:.LANCHOR0
	ld1b	z7.h, p7/z, [x0]
	sub	z7.h, z7.h, #128
	add	x6, x5, x4
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	sub	x5, x0, x1
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	lsl	x0, x1, 1
	ldrsb	w4, [x6, 2]
	mov	z29.h, w4
	ld1b	z6.h, p7/z, [x5, x0]
	ldrsb	w4, [x6, 3]
	mov	z28.h, w4
	add	x6, x2, x3
	add	x4, x5, x1, lsl 1
	ld1b	z5.h, p7/z, [x4, x1]
	ld1b	z16.h, p7/z, [x5]
	add	x0, x4, x1
	add	x4, x4, x1, lsl 1
	ld1b	z4.h, p7/z, [x1, x0]
	add	x0, x1, x4
	ld1b	z3.h, p7/z, [x1, x4]
	sub	z5.h, z5.h, #128
	add	x4, x4, x1, lsl 1
	sub	z6.h, z6.h, #128
	sub	z16.h, z16.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z7.h, z30.h
	mla	z16.h, p7/m, z6.h, z29.h
	mla	z16.h, p7/m, z5.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x2]
	ld1b	z2.h, p7/z, [x1, x0]
	add	x0, x2, x3, lsl 1
	sub	z4.h, z4.h, #128
	mul	z7.h, p7/m, z7.h, z31.h
	add	x5, x1, x4
	mla	z7.h, p7/m, z6.h, z30.h
	mla	z7.h, p7/m, z5.h, z29.h
	mla	z7.h, p7/m, z4.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x2, x3]
	sub	z3.h, z3.h, #128
	ld1b	z1.h, p7/z, [x1, x4]
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z5.h, z30.h
	mla	z6.h, p7/m, z4.h, z29.h
	mla	z6.h, p7/m, z3.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x6, x3]
	ld1b	z0.h, p7/z, [x1, x5]
	add	x5, x3, x0
	sub	z2.h, z2.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z4.h, z30.h
	mla	z5.h, p7/m, z3.h, z29.h
	mla	z5.h, p7/m, z2.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x4, x1, lsl 1
	sub	z1.h, z1.h, #128
	ld1b	z24.h, p7/z, [x1, x2]
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z3.h, z30.h
	mla	z4.h, p7/m, z2.h, z29.h
	mla	z4.h, p7/m, z1.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z0.h, z0.h, #128
	ld1b	z23.h, p7/z, [x1, x4]
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z2.h, z30.h
	mla	z3.h, p7/m, z1.h, z29.h
	mla	z3.h, p7/m, z0.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z24.h, z24.h, #128
	ld1b	z22.h, p7/z, [x1, x2]
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z1.h, z30.h
	mla	z2.h, p7/m, z0.h, z29.h
	mla	z2.h, p7/m, z24.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z23.h, z23.h, #128
	ld1b	z27.h, p7/z, [x1, x4]
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z0.h, z30.h
	mla	z1.h, p7/m, z24.h, z29.h
	mla	z1.h, p7/m, z23.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z22.h, z22.h, #128
	ld1b	z26.h, p7/z, [x1, x2]
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z24.h, z30.h
	mla	z0.h, p7/m, z23.h, z29.h
	mla	z0.h, p7/m, z22.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z27.h, z27.h, #128
	ld1b	z25.h, p7/z, [x1, x4]
	mul	z24.h, p7/m, z24.h, z31.h
	mla	z24.h, p7/m, z23.h, z30.h
	mla	z24.h, p7/m, z22.h, z29.h
	mla	z24.h, p7/m, z27.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z26.h, z26.h, #128
	ld1b	z21.h, p7/z, [x1, x2]
	mul	z23.h, p7/m, z23.h, z31.h
	mla	z23.h, p7/m, z22.h, z30.h
	mla	z23.h, p7/m, z27.h, z29.h
	mla	z23.h, p7/m, z26.h, z28.h
	add	z23.h, z23.h, #8192
	sqrshrunb	z23.b, z23.h, #6
	uzp1	z23.b, z23.b, z23.b
	str	q23, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z25.h, z25.h, #128
	ld1b	z20.h, p7/z, [x1, x4]
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z27.h, z30.h
	mla	z22.h, p7/m, z26.h, z29.h
	mla	z22.h, p7/m, z25.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z21.h, z21.h, #128
	ld1b	z19.h, p7/z, [x1, x2]
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z26.h, z30.h
	mla	z27.h, p7/m, z25.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z20.h, z20.h, #128
	ld1b	z18.h, p7/z, [x1, x4]
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z25.h, z30.h
	mla	z26.h, p7/m, z21.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z19.h, z19.h, #128
	ld1b	z17.h, p7/z, [x1, x2]
	mul	z25.h, p7/m, z25.h, z31.h
	mla	z25.h, p7/m, z21.h, z30.h
	mla	z25.h, p7/m, z20.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z18.h, z18.h, #128
	ld1b	z16.h, p7/z, [x1, x4]
	mul	z21.h, p7/m, z21.h, z31.h
	mla	z21.h, p7/m, z20.h, z30.h
	mla	z21.h, p7/m, z19.h, z29.h
	mla	z21.h, p7/m, z18.h, z28.h
	add	z21.h, z21.h, #8192
	sqrshrunb	z21.b, z21.h, #6
	uzp1	z21.b, z21.b, z21.b
	str	q21, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z17.h, z17.h, #128
	ld1b	z7.h, p7/z, [x1, x2]
	mul	z20.h, p7/m, z20.h, z31.h
	mla	z20.h, p7/m, z19.h, z30.h
	mla	z20.h, p7/m, z18.h, z29.h
	mla	z20.h, p7/m, z17.h, z28.h
	add	z20.h, z20.h, #8192
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	str	q20, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z16.h, z16.h, #128
	ld1b	z6.h, p7/z, [x1, x4]
	mul	z19.h, p7/m, z19.h, z31.h
	mla	z19.h, p7/m, z18.h, z30.h
	mla	z19.h, p7/m, z17.h, z29.h
	mla	z19.h, p7/m, z16.h, z28.h
	add	z19.h, z19.h, #8192
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	str	q19, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z7.h, z7.h, #128
	ld1b	z5.h, p7/z, [x1, x2]
	mul	z18.h, p7/m, z18.h, z31.h
	mla	z18.h, p7/m, z17.h, z30.h
	mla	z18.h, p7/m, z16.h, z29.h
	mla	z18.h, p7/m, z7.h, z28.h
	add	z18.h, z18.h, #8192
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	str	q18, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z6.h, z6.h, #128
	ld1b	z4.h, p7/z, [x1, x4]
	mul	z17.h, p7/m, z17.h, z31.h
	mla	z17.h, p7/m, z16.h, z30.h
	mla	z17.h, p7/m, z7.h, z29.h
	mla	z17.h, p7/m, z6.h, z28.h
	add	z17.h, z17.h, #8192
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	str	q17, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z5.h, z5.h, #128
	ld1b	z3.h, p7/z, [x1, x2]
	mul	z16.h, p7/m, z16.h, z31.h
	mla	z16.h, p7/m, z7.h, z30.h
	mla	z16.h, p7/m, z6.h, z29.h
	mla	z16.h, p7/m, z5.h, z28.h
	add	z16.h, z16.h, #8192
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	str	q16, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z4.h, z4.h, #128
	ld1b	z2.h, p7/z, [x1, x4]
	mul	z7.h, p7/m, z7.h, z31.h
	mla	z7.h, p7/m, z6.h, z30.h
	mla	z7.h, p7/m, z5.h, z29.h
	mla	z7.h, p7/m, z4.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z3.h, z3.h, #128
	ld1b	z1.h, p7/z, [x1, x2]
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z5.h, z30.h
	mla	z6.h, p7/m, z4.h, z29.h
	mla	z6.h, p7/m, z3.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z2.h, z2.h, #128
	ld1b	z0.h, p7/z, [x1, x4]
	mul	z5.h, p7/m, z5.h, z31.h
	mla	z5.h, p7/m, z4.h, z30.h
	mla	z5.h, p7/m, z3.h, z29.h
	mla	z5.h, p7/m, z2.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z1.h, z1.h, #128
	ld1b	z22.h, p7/z, [x1, x2]
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z3.h, z30.h
	mla	z4.h, p7/m, z2.h, z29.h
	mla	z4.h, p7/m, z1.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z0.h, z0.h, #128
	ld1b	z27.h, p7/z, [x1, x4]
	mul	z3.h, p7/m, z3.h, z31.h
	mla	z3.h, p7/m, z2.h, z30.h
	mla	z3.h, p7/m, z1.h, z29.h
	mla	z3.h, p7/m, z0.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z22.h, z22.h, #128
	ld1b	z26.h, p7/z, [x1, x2]
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z1.h, z30.h
	mla	z2.h, p7/m, z0.h, z29.h
	mla	z2.h, p7/m, z22.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x3, x5]
	add	x5, x3, x0
	add	x4, x1, x2
	sub	z27.h, z27.h, #128
	ld1b	z25.h, p7/z, [x1, x4]
	mul	z1.h, p7/m, z1.h, z31.h
	mla	z1.h, p7/m, z0.h, z30.h
	mla	z1.h, p7/m, z22.h, z29.h
	mla	z1.h, p7/m, z27.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x0]
	add	x0, x0, x3, lsl 1
	add	x2, x2, x1, lsl 1
	sub	z26.h, z26.h, #128
	ld1b	z24.h, p7/z, [x1, x2]
	add	x4, x1, x2
	mul	z0.h, p7/m, z0.h, z31.h
	mla	z0.h, p7/m, z22.h, z30.h
	mla	z0.h, p7/m, z27.h, z29.h
	mla	z0.h, p7/m, z26.h, z28.h
	add	z0.h, z0.h, #8192
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	str	q0, [x3, x5]
	ld1b	z23.h, p7/z, [x1, x4]
	add	x1, x3, x0
	sub	z25.h, z25.h, #128
	mul	z22.h, p7/m, z22.h, z31.h
	mla	z22.h, p7/m, z27.h, z30.h
	mla	z22.h, p7/m, z26.h, z29.h
	mla	z22.h, p7/m, z25.h, z28.h
	add	z22.h, z22.h, #8192
	sqrshrunb	z22.b, z22.h, #6
	uzp1	z22.b, z22.b, z22.b
	str	q22, [x3, x0]
	add	x0, x0, x3, lsl 1
	sub	z24.h, z24.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	mla	z27.h, p7/m, z26.h, z30.h
	mla	z27.h, p7/m, z25.h, z29.h
	mla	z27.h, p7/m, z24.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x1]
	sub	z23.h, z23.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z25.h, z30.h
	mla	z26.h, p7/m, z24.h, z29.h
	mla	z26.h, p7/m, z23.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x3, x0]
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_interp4_16x32_sve2_vpp, .-dynopt_interp4_16x32_sve2_vpp
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
