	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp4_32x8_sve2_vpp
	.type	dynopt_interp4_32x8_sve2_vpp, %function
dynopt_interp4_32x8_sve2_vpp:
.LFB3:
	.cfi_startproc
	ubfiz	x4, x4, 2, 3
	adrp	x5, .LANCHOR0
	ptrue	p7.b, all
	add	x5, x5, :lo12:.LANCHOR0
	ld1b	z7.h, p7/z, [x0]
	sub	z7.h, z7.h, #128
	add	x6, x5, x4
	add	x10, x2, x3, lsl 1
	ldrsb	w4, [x5, x4]
	mov	z31.h, w4
	ldrsb	w4, [x6, 1]
	mov	z30.h, w4
	ldrsb	w4, [x6, 2]
	mov	z29.h, w4
	ldrsb	w4, [x6, 3]
	mov	z28.h, w4
	sub	x4, x0, x1
	add	x0, x0, 16
	ld1b	z6.h, p7/z, [x0]
	add	x5, x4, 16
	ld1b	z26.h, p7/z, [x5]
	add	x0, x4, x1, lsl 1
	lsl	x5, x1, 1
	ld1b	z5.h, p7/z, [x4, x5]
	ld1b	z3.h, p7/z, [x0, x1]
	add	x6, x5, 16
	add	x5, x5, x1
	ld1b	z4.h, p7/z, [x4, x6]
	add	x6, x0, x1
	add	x7, x5, 16
	ld1b	z1.h, p7/z, [x1, x6]
	lsl	x6, x1, 2
	ld1b	z2.h, p7/z, [x4, x7]
	add	x0, x0, x1, lsl 1
	add	x7, x6, 16
	lsl	x5, x5, 1
	ld1b	z0.h, p7/z, [x4, x7]
	ld1b	z27.h, p7/z, [x4]
	add	x7, x1, x0
	sub	z3.h, z3.h, #128
	sub	z2.h, z2.h, #128
	add	x6, x6, x1
	sub	z5.h, z5.h, #128
	sub	z4.h, z4.h, #128
	add	x5, x5, 16
	sub	z6.h, z6.h, #128
	sub	z27.h, z27.h, #128
	sub	z26.h, z26.h, #128
	mul	z27.h, p7/m, z27.h, z31.h
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z27.h, p7/m, z7.h, z30.h
	mla	z26.h, p7/m, z6.h, z30.h
	mla	z27.h, p7/m, z5.h, z29.h
	mla	z26.h, p7/m, z4.h, z29.h
	mla	z27.h, p7/m, z3.h, z28.h
	mla	z26.h, p7/m, z2.h, z28.h
	add	z27.h, z27.h, #8192
	add	z26.h, z26.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z27.b, z27.b, z27.b
	uzp1	z26.b, z26.b, z26.b
	ld1b	z17.h, p7/z, [x1, x0]
	add	x8, x6, 16
	ld1b	z16.h, p7/z, [x4, x8]
	stp	q27, q26, [x2]
	ld1b	z27.h, p7/z, [x1, x7]
	ld1b	z26.h, p7/z, [x4, x5]
	lsl	x7, x1, 3
	sub	z1.h, z1.h, #128
	add	x5, x2, x3
	sub	x8, x7, x1
	mul	z7.h, p7/m, z7.h, z31.h
	add	x8, x8, 16
	mla	z7.h, p7/m, z5.h, z30.h
	mla	z7.h, p7/m, z3.h, z29.h
	mla	z7.h, p7/m, z1.h, z28.h
	add	z7.h, z7.h, #8192
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	str	q7, [x2, x3]
	sub	z0.h, z0.h, #128
	mul	z6.h, p7/m, z6.h, z31.h
	mla	z6.h, p7/m, z4.h, z30.h
	mla	z6.h, p7/m, z2.h, z29.h
	mla	z6.h, p7/m, z0.h, z28.h
	add	z6.h, z6.h, #8192
	sqrshrunb	z6.b, z6.h, #6
	uzp1	z6.b, z6.b, z6.b
	str	q6, [x5, 16]
	ld1b	z24.h, p7/z, [x4, x8]
	add	x8, x5, x3
	sub	z17.h, z17.h, #128
	mul	z5.h, p7/m, z5.h, z31.h
	add	x0, x0, x1, lsl 1
	mla	z5.h, p7/m, z3.h, z30.h
	ld1b	z25.h, p7/z, [x1, x0]
	mla	z5.h, p7/m, z1.h, z29.h
	mla	z5.h, p7/m, z17.h, z28.h
	add	z5.h, z5.h, #8192
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	str	q5, [x5, x3]
	add	x9, x1, x0
	sub	z16.h, z16.h, #128
	mul	z4.h, p7/m, z4.h, z31.h
	mla	z4.h, p7/m, z2.h, z30.h
	mla	z4.h, p7/m, z0.h, z29.h
	mla	z4.h, p7/m, z16.h, z28.h
	add	z4.h, z4.h, #8192
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	str	q4, [x10, 16]
	sub	z27.h, z27.h, #128
	ld1b	z23.h, p7/z, [x1, x9]
	mul	z3.h, p7/m, z3.h, z31.h
	add	x9, x7, 16
	mla	z3.h, p7/m, z1.h, z30.h
	ld1b	z22.h, p7/z, [x4, x9]
	mla	z3.h, p7/m, z17.h, z29.h
	mla	z3.h, p7/m, z27.h, z28.h
	add	z3.h, z3.h, #8192
	sqrshrunb	z3.b, z3.h, #6
	uzp1	z3.b, z3.b, z3.b
	str	q3, [x3, x8]
	add	x8, x3, x3, lsl 1
	sub	z26.h, z26.h, #128
	add	x9, x2, x8
	mul	z2.h, p7/m, z2.h, z31.h
	mla	z2.h, p7/m, z0.h, z30.h
	add	x7, x7, x1
	add	x0, x0, x1, lsl 1
	mla	z2.h, p7/m, z16.h, z29.h
	add	x5, x5, x3, lsl 1
	add	x7, x7, 16
	mla	z2.h, p7/m, z26.h, z28.h
	add	z2.h, z2.h, #8192
	sqrshrunb	z2.b, z2.h, #6
	uzp1	z2.b, z2.b, z2.b
	str	q2, [x9, 16]
	add	x9, x1, x0
	ld1b	z21.h, p7/z, [x1, x0]
	ld1b	z20.h, p7/z, [x4, x7]
	add	x0, x3, x5
	sub	z25.h, z25.h, #128
	add	x7, x2, x3, lsl 2
	mul	z1.h, p7/m, z1.h, z31.h
	lsl	x6, x6, 1
	mla	z1.h, p7/m, z17.h, z30.h
	mla	z1.h, p7/m, z27.h, z29.h
	mla	z1.h, p7/m, z25.h, z28.h
	add	z1.h, z1.h, #8192
	sqrshrunb	z1.b, z1.h, #6
	uzp1	z1.b, z1.b, z1.b
	str	q1, [x3, x5]
	sub	z24.h, z24.h, #128
	sub	z23.h, z23.h, #128
	add	x6, x6, 16
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
	str	q0, [x7, 16]
	ld1b	z19.h, p7/z, [x1, x9]
	ld1b	z18.h, p7/z, [x4, x6]
	add	x5, x5, x3, lsl 1
	sub	z22.h, z22.h, #128
	mul	z16.h, p7/m, z16.h, z31.h
	str	q17, [x3, x0]
	add	x0, x3, x3, lsl 2
	mla	z16.h, p7/m, z26.h, z30.h
	add	x0, x2, x0
	mla	z16.h, p7/m, z24.h, z29.h
	mla	z16.h, p7/m, z22.h, z28.h
	add	x8, x2, x8, lsl 1
	add	z16.h, z16.h, #8192
	add	x2, x2, x3, lsl 3
	sqrshrunb	z16.b, z16.h, #6
	uzp1	z16.b, z16.b, z16.b
	sub	z21.h, z21.h, #128
	str	q16, [x0, 16]
	add	x0, x3, x5
	mul	z27.h, p7/m, z27.h, z31.h
	sub	x2, x2, x3
	mla	z27.h, p7/m, z25.h, z30.h
	mla	z27.h, p7/m, z23.h, z29.h
	mla	z27.h, p7/m, z21.h, z28.h
	add	z27.h, z27.h, #8192
	sqrshrunb	z27.b, z27.h, #6
	uzp1	z27.b, z27.b, z27.b
	str	q27, [x3, x5]
	sub	z20.h, z20.h, #128
	mul	z26.h, p7/m, z26.h, z31.h
	mla	z26.h, p7/m, z24.h, z30.h
	mla	z26.h, p7/m, z22.h, z29.h
	mla	z26.h, p7/m, z20.h, z28.h
	add	z26.h, z26.h, #8192
	sqrshrunb	z26.b, z26.h, #6
	uzp1	z26.b, z26.b, z26.b
	str	q26, [x8, 16]
	mul	z25.h, p7/m, z25.h, z31.h
	sub	z19.h, z19.h, #128
	mla	z25.h, p7/m, z23.h, z30.h
	mla	z25.h, p7/m, z21.h, z29.h
	mla	z25.h, p7/m, z19.h, z28.h
	add	z25.h, z25.h, #8192
	sqrshrunb	z25.b, z25.h, #6
	uzp1	z25.b, z25.b, z25.b
	str	q25, [x3, x0]
	mul	z24.h, p7/m, z24.h, z31.h
	sub	z18.h, z18.h, #128
	mla	z24.h, p7/m, z22.h, z30.h
	mla	z24.h, p7/m, z20.h, z29.h
	mla	z24.h, p7/m, z18.h, z28.h
	add	z24.h, z24.h, #8192
	sqrshrunb	z24.b, z24.h, #6
	uzp1	z24.b, z24.b, z24.b
	str	q24, [x2, 16]
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_interp4_32x8_sve2_vpp, .-dynopt_interp4_32x8_sve2_vpp
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
