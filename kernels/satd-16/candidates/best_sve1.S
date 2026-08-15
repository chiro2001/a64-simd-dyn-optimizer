	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_satd_16x16_sve2
	.type	dynopt_satd_16x16_sve2, %function
dynopt_satd_16x16_sve2:
.LFB3:
	.cfi_startproc
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	ptrue	p7.b, all
	add	x5, x4, 32
	ld1h	z31.h, p7/z, [x4]
	add	x4, x4, 64
	ld1h	z29.h, p7/z, [x4]
	mov	w4, 4
	ld1h	z30.h, p7/z, [x5]
	movi	d28, #0
.L2:
	add	x5, x0, x1
	add	x7, x2, x3
	ld1b	z19.h, p7/z, [x0]
	add	x6, x0, x1, lsl 1
	ld1b	z18.h, p7/z, [x2]
	ld1b	z16.h, p7/z, [x0, x1]
	sub	z18.h, z19.h, z18.h
	ld1b	z7.h, p7/z, [x2, x3]
	ld1b	z5.h, p7/z, [x5, x1]
	sub	z7.h, z16.h, z7.h
	add	x5, x2, x3, lsl 1
	tbl	z17.h, {z18.h}, z29.h
	tbl	z6.h, {z7.h}, z29.h
	mad	z17.h, p7/m, z30.h, z18.h
	mad	z6.h, p7/m, z30.h, z7.h
	tbl	z17.h, {z17.h}, z31.h
	tbl	z6.h, {z6.h}, z31.h
	tbl	z24.h, {z17.h}, z29.h
	tbl	z26.h, {z6.h}, z29.h
	mad	z24.h, p7/m, z30.h, z17.h
	mad	z26.h, p7/m, z30.h, z6.h
	ld1b	z4.h, p7/z, [x7, x3]
	add	z23.h, z24.h, z26.h
	sub	z4.h, z5.h, z4.h
	ld1b	z2.h, p7/z, [x6, x1]
	tbl	z3.h, {z4.h}, z29.h
	ld1b	z1.h, p7/z, [x5, x3]
	mad	z3.h, p7/m, z30.h, z4.h
	sub	z1.h, z2.h, z1.h
	tbl	z3.h, {z3.h}, z31.h
	tbl	z0.h, {z1.h}, z29.h
	tbl	z27.h, {z3.h}, z29.h
	mad	z0.h, p7/m, z30.h, z1.h
	mad	z27.h, p7/m, z30.h, z3.h
	tbl	z0.h, {z0.h}, z31.h
	abs	z23.h, p7/m, z23.h
	tbl	z25.h, {z0.h}, z29.h
	sabd	z26.h, p7/m, z26.h, z24.h
	mad	z25.h, p7/m, z30.h, z0.h
	add	x0, x0, x1, lsl 2
	add	z22.h, z27.h, z25.h
	add	x2, x2, x3, lsl 2
	abs	z22.h, p7/m, z22.h
	sabd	z25.h, p7/m, z25.h, z27.h
	smax	z22.h, p7/m, z22.h, z23.h
	smax	z25.h, p7/m, z25.h, z26.h
	subs	w4, w4, #1
	add	z25.h, z22.h, z25.h
	add	z28.h, z28.h, z25.h
	bne	.L2
	uaddv	d31, p7, z28.h
	fmov	x0, d31
	ret
	.cfi_endproc
.LFE3:
	.size	dynopt_satd_16x16_sve2, .-dynopt_satd_16x16_sve2
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
	.type	_ZL18DYNOPT_CADD_SIGN16, %object
	.size	_ZL18DYNOPT_CADD_SIGN16, 32
_ZL18DYNOPT_CADD_SIGN16:
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.type	_ZL18DYNOPT_CADD_SWAP16, %object
	.size	_ZL18DYNOPT_CADD_SWAP16, 32
_ZL18DYNOPT_CADD_SWAP16:
	.hword	1
	.hword	0
	.hword	3
	.hword	2
	.hword	5
	.hword	4
	.hword	7
	.hword	6
	.hword	9
	.hword	8
	.hword	11
	.hword	10
	.hword	13
	.hword	12
	.hword	15
	.hword	14
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
