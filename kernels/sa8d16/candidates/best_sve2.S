	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_16x16_sve2
	.type	dynopt_sa8d_16x16_sve2, %function
dynopt_sa8d_16x16_sve2:
.LFB2:
	.cfi_startproc
	ptrue	p7.b, all
	ld1b	z30.h, p7/z, [x2]
	ld1b	z7.h, p7/z, [x0]
	sub	z7.h, z7.h, z30.h
	ld1b	z30.h, p7/z, [x2, x3]
	add	x5, x2, x3
	ld1b	z29.h, p7/z, [x0, x1]
	adrp	x4, .LANCHOR0
	sub	z29.h, z29.h, z30.h
	add	x4, x4, :lo12:.LANCHOR0
	ld1b	z30.h, p7/z, [x5, x3]
	ld1h	z31.h, p7/z, [x4]
	add	x6, x0, x1
	add	x4, x0, x1, lsl 1
	ld1b	z16.h, p7/z, [x6, x1]
	add	x0, x2, x3, lsl 1
	sub	z16.h, z16.h, z30.h
	ld1b	z30.h, p7/z, [x3, x0]
	add	x5, x3, x0
	ld1b	z22.h, p7/z, [x1, x4]
	sub	z22.h, z22.h, z30.h
	ld1b	z30.h, p7/z, [x3, x5]
	add	x0, x0, x3, lsl 1
	add	x6, x1, x4
	ld1b	z17.h, p7/z, [x1, x6]
	sub	z17.h, z17.h, z30.h
	ld1b	z30.h, p7/z, [x3, x0]
	add	x2, x4, x1, lsl 1
	add	x4, x3, x0
	ld1b	z25.h, p7/z, [x1, x2]
	sub	z25.h, z25.h, z30.h
	ld1b	z30.h, p7/z, [x3, x4]
	add	x5, x1, x2
	add	x0, x0, x3, lsl 1
	ld1b	z18.h, p7/z, [x1, x5]
	sub	z18.h, z18.h, z30.h
	ld1b	z30.h, p7/z, [x3, x0]
	add	x2, x2, x1, lsl 1
	add	x4, x3, x0
	ld1b	z23.h, p7/z, [x1, x2]
	add	x0, x0, x3, lsl 1
	sub	z23.h, z23.h, z30.h
	ld1b	z28.h, p7/z, [x3, x0]
	ld1b	z30.h, p7/z, [x3, x4]
	add	x5, x1, x2
	add	x4, x3, x0
	add	x2, x2, x1, lsl 1
	ld1b	z19.h, p7/z, [x1, x5]
	sub	z19.h, z19.h, z30.h
	ld1b	z30.h, p7/z, [x1, x2]
	sub	z30.h, z30.h, z28.h
	ld1b	z28.h, p7/z, [x3, x4]
	add	x5, x1, x2
	add	x0, x0, x3, lsl 1
	ld1b	z20.h, p7/z, [x1, x5]
	sub	z20.h, z20.h, z28.h
	ld1b	z28.h, p7/z, [x3, x0]
	add	x2, x2, x1, lsl 1
	add	x4, x3, x0
	ld1b	z24.h, p7/z, [x1, x2]
	add	x0, x0, x3, lsl 1
	sub	z24.h, z24.h, z28.h
	ld1b	z27.h, p7/z, [x3, x0]
	ld1b	z28.h, p7/z, [x3, x4]
	add	x5, x1, x2
	add	x4, x3, x0
	add	x2, x2, x1, lsl 1
	ld1b	z21.h, p7/z, [x1, x5]
	sub	z21.h, z21.h, z28.h
	ld1b	z28.h, p7/z, [x1, x2]
	sub	z28.h, z28.h, z27.h
	ld1b	z27.h, p7/z, [x3, x4]
	add	x5, x1, x2
	add	x0, x0, x3, lsl 1
	ld1b	z26.h, p7/z, [x1, x5]
	add	x2, x2, x1, lsl 1
	sub	z26.h, z26.h, z27.h
	cadd	z7.h, z7.h, z7.h, #90
	ld1b	z27.h, p7/z, [x1, x2]
	tbl	z7.h, {z7.h}, z31.h
	ld1b	z6.h, p7/z, [x3, x0]
	cadd	z7.h, z7.h, z7.h, #90
	sub	z27.h, z27.h, z6.h
	tbl	z7.h, {z7.h}, z31.h
	cadd	z16.h, z16.h, z16.h, #90
	cadd	z7.h, z7.h, z7.h, #90
	tbl	z16.h, {z16.h}, z31.h
	cadd	z22.h, z22.h, z22.h, #90
	cadd	z16.h, z16.h, z16.h, #90
	tbl	z22.h, {z22.h}, z31.h
	tbl	z16.h, {z16.h}, z31.h
	cadd	z22.h, z22.h, z22.h, #90
	cadd	z16.h, z16.h, z16.h, #90
	tbl	z22.h, {z22.h}, z31.h
	cadd	z17.h, z17.h, z17.h, #90
	cadd	z22.h, z22.h, z22.h, #90
	tbl	z17.h, {z17.h}, z31.h
	cadd	z18.h, z18.h, z18.h, #90
	cadd	z17.h, z17.h, z17.h, #90
	tbl	z18.h, {z18.h}, z31.h
	tbl	z17.h, {z17.h}, z31.h
	cadd	z18.h, z18.h, z18.h, #90
	cadd	z17.h, z17.h, z17.h, #90
	tbl	z18.h, {z18.h}, z31.h
	cadd	z30.h, z30.h, z30.h, #90
	cadd	z18.h, z18.h, z18.h, #90
	tbl	z30.h, {z30.h}, z31.h
	cadd	z27.h, z27.h, z27.h, #90
	cadd	z30.h, z30.h, z30.h, #90
	tbl	z27.h, {z27.h}, z31.h
	tbl	z30.h, {z30.h}, z31.h
	cadd	z27.h, z27.h, z27.h, #90
	cadd	z30.h, z30.h, z30.h, #90
	add	z3.h, z16.h, z22.h
	cadd	z29.h, z29.h, z29.h, #90
	cadd	z25.h, z25.h, z25.h, #90
	tbl	z29.h, {z29.h}, z31.h
	tbl	z25.h, {z25.h}, z31.h
	cadd	z29.h, z29.h, z29.h, #90
	cadd	z25.h, z25.h, z25.h, #90
	tbl	z29.h, {z29.h}, z31.h
	tbl	z25.h, {z25.h}, z31.h
	cadd	z29.h, z29.h, z29.h, #90
	cadd	z25.h, z25.h, z25.h, #90
	add	z4.h, z7.h, z29.h
	cadd	z23.h, z23.h, z23.h, #90
	sub	z29.h, z7.h, z29.h
	tbl	z23.h, {z23.h}, z31.h
	sub	z7.h, z16.h, z22.h
	cadd	z23.h, z23.h, z23.h, #90
	add	z22.h, z17.h, z25.h
	tbl	z23.h, {z23.h}, z31.h
	sub	z25.h, z17.h, z25.h
	cadd	z23.h, z23.h, z23.h, #90
	cadd	z19.h, z19.h, z19.h, #90
	add	z16.h, z18.h, z23.h
	tbl	z19.h, {z19.h}, z31.h
	sub	z23.h, z18.h, z23.h
	cadd	z19.h, z19.h, z19.h, #90
	cadd	z20.h, z20.h, z20.h, #90
	tbl	z19.h, {z19.h}, z31.h
	tbl	z20.h, {z20.h}, z31.h
	cadd	z19.h, z19.h, z19.h, #90
	cadd	z20.h, z20.h, z20.h, #90
	add	z18.h, z19.h, z30.h
	tbl	z20.h, {z20.h}, z31.h
	sub	z19.h, z19.h, z30.h
	cadd	z20.h, z20.h, z20.h, #90
	cadd	z24.h, z24.h, z24.h, #90
	cadd	z21.h, z21.h, z21.h, #90
	tbl	z24.h, {z24.h}, z31.h
	tbl	z21.h, {z21.h}, z31.h
	cadd	z24.h, z24.h, z24.h, #90
	cadd	z21.h, z21.h, z21.h, #90
	tbl	z24.h, {z24.h}, z31.h
	tbl	z21.h, {z21.h}, z31.h
	cadd	z24.h, z24.h, z24.h, #90
	cadd	z21.h, z21.h, z21.h, #90
	add	z5.h, z20.h, z24.h
	sub	z17.h, z20.h, z24.h
	add	z30.h, z18.h, z5.h
	cadd	z28.h, z28.h, z28.h, #90
	abs	z30.h, p7/m, z30.h
	tbl	z28.h, {z28.h}, z31.h
	cadd	z26.h, z26.h, z26.h, #90
	cadd	z28.h, z28.h, z28.h, #90
	tbl	z26.h, {z26.h}, z31.h
	tbl	z28.h, {z28.h}, z31.h
	cadd	z26.h, z26.h, z26.h, #90
	tbl	z26.h, {z26.h}, z31.h
	tbl	z31.h, {z27.h}, z31.h
	cadd	z26.h, z26.h, z26.h, #90
	cadd	z31.h, z31.h, z31.h, #90
	add	z27.h, z4.h, z3.h
	add	z6.h, z26.h, z31.h
	abs	z27.h, p7/m, z27.h
	sub	z31.h, z26.h, z31.h
	add	z24.h, z29.h, z7.h
	cadd	z28.h, z28.h, z28.h, #90
	sabd	z29.h, p7/m, z29.h, z7.h
	add	z20.h, z21.h, z28.h
	add	z7.h, z22.h, z16.h
	sub	z28.h, z21.h, z28.h
	sabd	z22.h, p7/m, z22.h, z16.h
	add	z21.h, z19.h, z17.h
	add	z16.h, z25.h, z23.h
	sabd	z19.h, p7/m, z19.h, z17.h
	sabd	z25.h, p7/m, z25.h, z23.h
	add	z17.h, z20.h, z6.h
	add	z23.h, z28.h, z31.h
	movprfx	z26, z4
	sabd	z26.h, p7/m, z26.h, z3.h
	sabd	z28.h, p7/m, z28.h, z31.h
	abs	z24.h, p7/m, z24.h
	abs	z7.h, p7/m, z7.h
	abs	z16.h, p7/m, z16.h
	movprfx	z31, z27
	smax	z31.h, p7/m, z31.h, z7.h
	sabd	z18.h, p7/m, z18.h, z5.h
	abs	z21.h, p7/m, z21.h
	abs	z17.h, p7/m, z17.h
	sabd	z20.h, p7/m, z20.h, z6.h
	movprfx	z27, z30
	smax	z27.h, p7/m, z27.h, z17.h
	abs	z23.h, p7/m, z23.h
	smax	z24.h, p7/m, z24.h, z16.h
	smax	z26.h, p7/m, z26.h, z22.h
	smax	z29.h, p7/m, z29.h, z25.h
	movprfx	z30, z21
	smax	z30.h, p7/m, z30.h, z23.h
	add	z29.h, z26.h, z29.h
	smax	z18.h, p7/m, z18.h, z20.h
	smax	z19.h, p7/m, z19.h, z28.h
	add	z31.h, z31.h, z24.h
	add	z30.h, z27.h, z30.h
	add	z18.h, z18.h, z19.h
	add	z31.h, z31.h, z29.h
	add	z30.h, z30.h, z18.h
	add	z31.h, z31.h, z30.h
	mov	z29.h, #1
	movi	d30, #0
	udot	z30.d, z31.h, z29.h
	uaddv	d31, p7, z30.d
	fmov	x0, d31
	add	x0, x0, 1
	ubfx	x0, x0, 1, 32
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_sa8d_16x16_sve2, .-dynopt_sa8d_16x16_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL9HAD_IDX16, %object
	.size	_ZL9HAD_IDX16, 32
_ZL9HAD_IDX16:
	.hword	0
	.hword	2
	.hword	4
	.hword	6
	.hword	1
	.hword	3
	.hword	5
	.hword	7
	.hword	8
	.hword	10
	.hword	12
	.hword	14
	.hword	9
	.hword	11
	.hword	13
	.hword	15
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
