	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_16x16_sve2
	.type	dynopt_sa8d_16x16_sve2, %function
dynopt_sa8d_16x16_sve2:
.LFB3:
	.cfi_startproc
	ptrue	p7.b, all
	adrp	x4, .LANCHOR0
	ld1b	z31.h, p7/z, [x2]
	ld1b	z28.h, p7/z, [x0]
	add	x4, x4, :lo12:.LANCHOR0
	sub	z28.h, z28.h, z31.h
	ld1h	z29.h, p7/z, [x4]
	add	x5, x4, 32
	add	x4, x4, 64
	ld1h	z30.h, p7/z, [x5]
	ld1h	z31.h, p7/z, [x4]
	tbl	z27.h, {z28.h}, z31.h
	mad	z27.h, p7/m, z30.h, z28.h
	tbl	z27.h, {z27.h}, z29.h
	tbl	z28.h, {z27.h}, z31.h
	mad	z28.h, p7/m, z30.h, z27.h
	tbl	z28.h, {z28.h}, z29.h
	ld1b	z27.h, p7/z, [x0, x1]
	tbl	z5.h, {z28.h}, z31.h
	mad	z5.h, p7/m, z30.h, z28.h
	ld1b	z28.h, p7/z, [x2, x3]
	sub	z27.h, z27.h, z28.h
	tbl	z28.h, {z27.h}, z31.h
	mad	z28.h, p7/m, z30.h, z27.h
	tbl	z28.h, {z28.h}, z29.h
	tbl	z27.h, {z28.h}, z31.h
	mad	z27.h, p7/m, z30.h, z28.h
	tbl	z27.h, {z27.h}, z29.h
	add	x6, x0, x1
	add	x5, x2, x3
	tbl	z28.h, {z27.h}, z31.h
	ld1b	z26.h, p7/z, [x5, x3]
	mad	z28.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x6, x1]
	sub	z27.h, z27.h, z26.h
	tbl	z26.h, {z27.h}, z31.h
	mad	z26.h, p7/m, z30.h, z27.h
	tbl	z26.h, {z26.h}, z29.h
	tbl	z27.h, {z26.h}, z31.h
	mad	z27.h, p7/m, z30.h, z26.h
	tbl	z27.h, {z27.h}, z29.h
	add	x4, x0, x1, lsl 1
	tbl	z6.h, {z27.h}, z31.h
	add	x0, x2, x3, lsl 1
	mad	z6.h, p7/m, z30.h, z27.h
	ld1b	z26.h, p7/z, [x3, x0]
	ld1b	z27.h, p7/z, [x1, x4]
	sub	z27.h, z27.h, z26.h
	tbl	z26.h, {z27.h}, z31.h
	mad	z26.h, p7/m, z30.h, z27.h
	tbl	z26.h, {z26.h}, z29.h
	tbl	z27.h, {z26.h}, z31.h
	mad	z27.h, p7/m, z30.h, z26.h
	tbl	z27.h, {z27.h}, z29.h
	add	x5, x3, x0
	add	x6, x1, x4
	ld1b	z26.h, p7/z, [x3, x5]
	tbl	z24.h, {z27.h}, z31.h
	mad	z24.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x6]
	sub	z27.h, z27.h, z26.h
	tbl	z26.h, {z27.h}, z31.h
	mad	z26.h, p7/m, z30.h, z27.h
	tbl	z26.h, {z26.h}, z29.h
	tbl	z27.h, {z26.h}, z31.h
	mad	z27.h, p7/m, z30.h, z26.h
	tbl	z27.h, {z27.h}, z29.h
	add	x2, x4, x1, lsl 1
	add	x0, x0, x3, lsl 1
	tbl	z7.h, {z27.h}, z31.h
	ld1b	z26.h, p7/z, [x3, x0]
	mad	z7.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x2]
	sub	z27.h, z27.h, z26.h
	tbl	z26.h, {z27.h}, z31.h
	mad	z26.h, p7/m, z30.h, z27.h
	tbl	z26.h, {z26.h}, z29.h
	tbl	z27.h, {z26.h}, z31.h
	mad	z27.h, p7/m, z30.h, z26.h
	tbl	z27.h, {z27.h}, z29.h
	add	x5, x1, x2
	add	x4, x3, x0
	tbl	z26.h, {z27.h}, z31.h
	ld1b	z25.h, p7/z, [x3, x4]
	mad	z26.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x5]
	sub	z27.h, z27.h, z25.h
	tbl	z25.h, {z27.h}, z31.h
	mad	z25.h, p7/m, z30.h, z27.h
	tbl	z25.h, {z25.h}, z29.h
	tbl	z27.h, {z25.h}, z31.h
	mad	z27.h, p7/m, z30.h, z25.h
	tbl	z27.h, {z27.h}, z29.h
	add	x2, x2, x1, lsl 1
	add	x0, x0, x3, lsl 1
	tbl	z16.h, {z27.h}, z31.h
	ld1b	z25.h, p7/z, [x3, x0]
	mad	z16.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x2]
	sub	z27.h, z27.h, z25.h
	tbl	z25.h, {z27.h}, z31.h
	mad	z25.h, p7/m, z30.h, z27.h
	tbl	z25.h, {z25.h}, z29.h
	tbl	z27.h, {z25.h}, z31.h
	mad	z27.h, p7/m, z30.h, z25.h
	tbl	z27.h, {z27.h}, z29.h
	add	x5, x1, x2
	add	x4, x3, x0
	tbl	z25.h, {z27.h}, z31.h
	ld1b	z23.h, p7/z, [x3, x4]
	mad	z25.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x5]
	sub	z27.h, z27.h, z23.h
	tbl	z23.h, {z27.h}, z31.h
	mad	z23.h, p7/m, z30.h, z27.h
	tbl	z23.h, {z23.h}, z29.h
	tbl	z27.h, {z23.h}, z31.h
	mad	z27.h, p7/m, z30.h, z23.h
	tbl	z27.h, {z27.h}, z29.h
	add	x2, x2, x1, lsl 1
	add	x0, x0, x3, lsl 1
	tbl	z17.h, {z27.h}, z31.h
	ld1b	z23.h, p7/z, [x3, x0]
	mad	z17.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x2]
	sub	z27.h, z27.h, z23.h
	tbl	z23.h, {z27.h}, z31.h
	mad	z23.h, p7/m, z30.h, z27.h
	tbl	z23.h, {z23.h}, z29.h
	tbl	z27.h, {z23.h}, z31.h
	mad	z27.h, p7/m, z30.h, z23.h
	tbl	z27.h, {z27.h}, z29.h
	add	x5, x1, x2
	add	x4, x3, x0
	tbl	z23.h, {z27.h}, z31.h
	ld1b	z22.h, p7/z, [x3, x4]
	mad	z23.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x5]
	sub	z27.h, z27.h, z22.h
	tbl	z22.h, {z27.h}, z31.h
	mad	z22.h, p7/m, z30.h, z27.h
	tbl	z22.h, {z22.h}, z29.h
	tbl	z27.h, {z22.h}, z31.h
	mad	z27.h, p7/m, z30.h, z22.h
	tbl	z27.h, {z27.h}, z29.h
	add	x2, x2, x1, lsl 1
	add	x0, x0, x3, lsl 1
	tbl	z18.h, {z27.h}, z31.h
	ld1b	z22.h, p7/z, [x3, x0]
	mad	z18.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x2]
	sub	z27.h, z27.h, z22.h
	tbl	z22.h, {z27.h}, z31.h
	mad	z22.h, p7/m, z30.h, z27.h
	tbl	z22.h, {z22.h}, z29.h
	tbl	z27.h, {z22.h}, z31.h
	mad	z27.h, p7/m, z30.h, z22.h
	tbl	z27.h, {z27.h}, z29.h
	add	x5, x1, x2
	add	x4, x3, x0
	tbl	z22.h, {z27.h}, z31.h
	ld1b	z21.h, p7/z, [x3, x4]
	mad	z22.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x1, x5]
	sub	z27.h, z27.h, z21.h
	tbl	z21.h, {z27.h}, z31.h
	mad	z21.h, p7/m, z30.h, z27.h
	tbl	z21.h, {z21.h}, z29.h
	tbl	z27.h, {z21.h}, z31.h
	mad	z27.h, p7/m, z30.h, z21.h
	tbl	z27.h, {z27.h}, z29.h
	add	x2, x2, x1, lsl 1
	add	x0, x0, x3, lsl 1
	ld1b	z21.h, p7/z, [x1, x2]
	tbl	z19.h, {z27.h}, z31.h
	mad	z19.h, p7/m, z30.h, z27.h
	ld1b	z27.h, p7/z, [x3, x0]
	sub	z21.h, z21.h, z27.h
	tbl	z27.h, {z21.h}, z31.h
	mad	z27.h, p7/m, z30.h, z21.h
	tbl	z27.h, {z27.h}, z29.h
	tbl	z21.h, {z27.h}, z31.h
	mad	z21.h, p7/m, z30.h, z27.h
	tbl	z21.h, {z21.h}, z29.h
	add	x5, x1, x2
	add	x4, x3, x0
	tbl	z27.h, {z21.h}, z31.h
	mad	z27.h, p7/m, z30.h, z21.h
	ld1b	z21.h, p7/z, [x1, x5]
	ld1b	z20.h, p7/z, [x3, x4]
	sub	z21.h, z21.h, z20.h
	add	x0, x0, x3, lsl 1
	tbl	z20.h, {z21.h}, z31.h
	mad	z20.h, p7/m, z30.h, z21.h
	tbl	z20.h, {z20.h}, z29.h
	tbl	z21.h, {z20.h}, z31.h
	mad	z21.h, p7/m, z30.h, z20.h
	tbl	z21.h, {z21.h}, z29.h
	ld1b	z20.h, p7/z, [x3, x0]
	tbl	z4.h, {z21.h}, z31.h
	add	x2, x2, x1, lsl 1
	mad	z4.h, p7/m, z30.h, z21.h
	ld1b	z21.h, p7/z, [x1, x2]
	sub	z21.h, z21.h, z20.h
	tbl	z20.h, {z21.h}, z31.h
	mad	z20.h, p7/m, z30.h, z21.h
	tbl	z20.h, {z20.h}, z29.h
	tbl	z21.h, {z20.h}, z31.h
	mad	z21.h, p7/m, z30.h, z20.h
	add	z1.h, z5.h, z28.h
	add	z0.h, z6.h, z24.h
	tbl	z29.h, {z21.h}, z29.h
	sub	z2.h, z6.h, z24.h
	add	z21.h, z18.h, z22.h
	sub	z6.h, z16.h, z25.h
	sub	z28.h, z5.h, z28.h
	tbl	z31.h, {z29.h}, z31.h
	add	z5.h, z16.h, z25.h
	mad	z31.h, p7/m, z30.h, z29.h
	add	z25.h, z17.h, z23.h
	sub	z23.h, z17.h, z23.h
	add	z30.h, z25.h, z21.h
	sub	z17.h, z18.h, z22.h
	abs	z30.h, p7/m, z30.h
	add	z18.h, z4.h, z31.h
	sub	z31.h, z4.h, z31.h
	add	z3.h, z7.h, z26.h
	add	z20.h, z19.h, z27.h
	sub	z26.h, z7.h, z26.h
	sub	z27.h, z19.h, z27.h
	add	z24.h, z28.h, z2.h
	add	z16.h, z26.h, z6.h
	sabd	z25.h, p7/m, z25.h, z21.h
	add	z29.h, z1.h, z0.h
	add	z21.h, z23.h, z17.h
	abs	z29.h, p7/m, z29.h
	sabd	z23.h, p7/m, z23.h, z17.h
	movprfx	z22, z1
	sabd	z22.h, p7/m, z22.h, z0.h
	add	z17.h, z20.h, z18.h
	abs	z24.h, p7/m, z24.h
	sabd	z20.h, p7/m, z20.h, z18.h
	sabd	z28.h, p7/m, z28.h, z2.h
	add	z18.h, z27.h, z31.h
	add	z7.h, z3.h, z5.h
	sabd	z27.h, p7/m, z27.h, z31.h
	abs	z7.h, p7/m, z7.h
	movprfx	z19, z3
	sabd	z19.h, p7/m, z19.h, z5.h
	abs	z16.h, p7/m, z16.h
	sabd	z26.h, p7/m, z26.h, z6.h
	abs	z21.h, p7/m, z21.h
	abs	z17.h, p7/m, z17.h
	abs	z18.h, p7/m, z18.h
	movprfx	z31, z30
	smax	z31.h, p7/m, z31.h, z17.h
	smax	z29.h, p7/m, z29.h, z7.h
	smax	z24.h, p7/m, z24.h, z16.h
	smax	z22.h, p7/m, z22.h, z19.h
	smax	z28.h, p7/m, z28.h, z26.h
	smax	z21.h, p7/m, z21.h, z18.h
	smax	z25.h, p7/m, z25.h, z20.h
	smax	z23.h, p7/m, z23.h, z27.h
	add	z30.h, z29.h, z24.h
	add	z28.h, z22.h, z28.h
	add	z31.h, z31.h, z21.h
	add	z25.h, z25.h, z23.h
	add	z30.h, z30.h, z28.h
	add	z31.h, z31.h, z25.h
	saddv	d30, p7, z30.h
	saddv	d31, p7, z31.h
	add	v31.2s, v31.2s, v30.2s
	fmov	w0, s31
	add	w0, w0, 1
	asr	w0, w0, 1
	ret
	.cfi_endproc
.LFE3:
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
