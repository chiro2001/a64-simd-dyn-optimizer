	.arch armv8.2-a+crc+sve2
	.file	"best_op_mca.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB3897:
	.cfi_startproc
	add	x5, x0, x2, lsl 2
	ptrue	p7.b, all
	lsl	x3, x2, 1
	ld1h	z31.h, p7/z, [x0]
	ld1h	z0.h, p7/z, [x0, x2, lsl 1]
	ld1h	z29.h, p7/z, [x5]
	ld1h	z28.h, p7/z, [x5, x2, lsl 1]
	zip1	z27.d, z31.d, z29.d
	zip1	z26.d, z0.d, z28.d
	zip2	z29.d, z31.d, z29.d
	zip2	z28.d, z0.d, z28.d
	zip1	z25.d, z27.d, z26.d
	add	x4, x5, x2, lsl 1
	zip2	z26.d, z27.d, z26.d
	zip1	z24.d, z29.d, z28.d
	ptrue	p6.d, all
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z29.d, z28.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	sub	z23.h, z25.h, z28.h
	sub	z22.h, z26.h, z24.h
	add	z28.h, z28.h, z25.h
	add	z24.h, z24.h, z26.h
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	add	x2, x4, x3, lsl 1
	add	x5, x3, x4
	ld1h	z19.h, p7/z, [x2]
	ld1h	z20.h, p7/z, [x5]
	ld1h	z17.h, p7/z, [x2, x3, lsl 1]
	add	x4, x3, x2
	zip1	z7.d, z19.d, z17.d
	ld1h	z18.h, p7/z, [x4]
	add	z21.h, z28.h, z24.h
	zip1	z16.d, z20.d, z18.d
	zip2	z17.d, z19.d, z17.d
	zip2	z18.d, z20.d, z18.d
	zip1	z6.d, z16.d, z7.d
	sub	z24.h, z28.h, z24.h
	add	x0, x2, x3, lsl 1
	zip2	z7.d, z16.d, z7.d
	zip1	z5.d, z18.d, z17.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z5.d, p6/m, z5.d
// 0 "" 2
#NO_APP
	zip2	z17.d, z18.d, z17.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	sub	z4.h, z6.h, z17.h
	sub	z3.h, z7.h, z5.h
	add	z17.h, z17.h, z6.h
	add	z5.h, z5.h, z7.h
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z5.d, p6/m, z5.d
// 0 "" 2
#NO_APP
	add	x5, x3, x0
	add	x0, x0, x3, lsl 1
	ld1h	z1.h, p7/z, [x5]
	ld1h	z31.h, p7/z, [x0]
	ld1h	z0.h, p7/z, [x0, x3, lsl 1]
	add	x4, x3, x0
	zip1	z25.d, z31.d, z0.d
	ld1h	z30.h, p7/z, [x4]
	add	z2.h, z17.h, z5.h
	zip1	z29.d, z1.d, z30.d
	zip2	z0.d, z31.d, z0.d
	zip2	z30.d, z1.d, z30.d
	zip1	z26.d, z29.d, z25.d
	sub	z5.h, z17.h, z5.h
	add	x2, x0, x3, lsl 1
	zip2	z25.d, z29.d, z25.d
	zip1	z28.d, z30.d, z0.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip2	z0.d, z30.d, z0.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z0.d, p6/m, z0.d
// 0 "" 2
#NO_APP
	sub	z20.h, z26.h, z0.h
	sub	z19.h, z25.h, z28.h
	add	z0.h, z0.h, z26.h
	add	z28.h, z28.h, z25.h
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	add	x0, x2, x3, lsl 1
	add	x4, x3, x2
	ld1h	z6.h, p7/z, [x0]
	add	x2, x3, x0
	ld1h	z18.h, p7/z, [x4]
	ld1h	z7.h, p7/z, [x2]
	add	x3, x3, x2
	zip1	z1.d, z18.d, z7.d
	ld1h	z17.h, p7/z, [x3]
	add	z16.h, z0.h, z28.h
	zip1	z31.d, z6.d, z17.d
	zip2	z7.d, z18.d, z7.d
	zip2	z17.d, z6.d, z17.d
	zip1	z29.d, z1.d, z31.d
	sub	z28.h, z0.h, z28.h
	zip2	z31.d, z1.d, z31.d
	zip1	z30.d, z7.d, z17.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip2	z17.d, z7.d, z17.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	sub	z26.h, z29.h, z17.h
	sub	z25.h, z31.h, z30.h
	add	z17.h, z17.h, z29.h
	add	z30.h, z30.h, z31.h
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	movi	d6, #0
	add	x2, x0, 128
	ld1h	z0.h, p7/z, [x0]
	add	z27.h, z17.h, z30.h
	movprfx	z29, z6
	sdot	z29.d, z16.h, z0.h
	sub	z30.h, z17.h, z30.h
	movprfx	z31, z6
	sdot	z31.d, z27.h, z0.h
	ld1h	z17.h, p7/z, [x2]
	uzp1	z31.s, z29.s, z31.s
	add	x2, x0, 256
	sqrshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	movprfx	z1, z6
	sdot	z1.d, z21.h, z0.h
	movprfx	z18, z6
	sdot	z18.d, z21.h, z17.h
	movprfx	z29, z6
	sdot	z29.d, z16.h, z17.h
	movprfx	z7, z6
	sdot	z7.d, z2.h, z0.h
	movprfx	z0, z6
	sdot	z0.d, z2.h, z17.h
	uzp1	z7.s, z1.s, z7.s
	uzp1	z0.s, z18.s, z0.s
	sqrshrnb	z7.h, z7.s, #3
	sqrshrnb	z0.h, z0.s, #3
	uzp1	z7.h, z7.h, z7.h
	uzp1	z0.h, z0.h, z0.h
	stp	q7, q31, [x1]
	ld1h	z31.h, p7/z, [x2]
	add	x2, x0, 384
	movprfx	z7, z6
	sdot	z7.d, z27.h, z17.h
	movprfx	z18, z6
	sdot	z18.d, z2.h, z31.h
	movprfx	z17, z6
	sdot	z17.d, z21.h, z31.h
	movprfx	z1, z6
	sdot	z1.d, z27.h, z31.h
	uzp1	z7.s, z29.s, z7.s
	uzp1	z18.s, z17.s, z18.s
	movprfx	z29, z6
	sdot	z29.d, z16.h, z31.h
	sqrshrnb	z7.h, z7.s, #3
	uzp1	z1.s, z29.s, z1.s
	uzp1	z7.h, z7.h, z7.h
	sqrshrnb	z18.h, z18.s, #3
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z18.h, z18.h, z18.h
	uzp1	z1.h, z1.h, z1.h
	stp	q0, q7, [x1, 128]
	ld1h	z0.h, p7/z, [x2]
	add	x2, x0, 64
	movprfx	z29, z6
	sdot	z29.d, z16.h, z0.h
	movprfx	z31, z6
	sdot	z31.d, z21.h, z0.h
	movprfx	z17, z6
	sdot	z17.d, z2.h, z0.h
	stp	q18, q1, [x1, 256]
	ld1h	z1.h, p7/z, [x2]
	movprfx	z18, z6
	sdot	z18.d, z27.h, z0.h
	add	x2, x0, 192
	uzp1	z18.s, z29.s, z18.s
	sqrshrnb	z18.h, z18.s, #3
	uzp1	z18.h, z18.h, z18.h
	movprfx	z7, z6
	sdot	z7.d, z24.h, z1.h
	movprfx	z29, z6
	sdot	z29.d, z28.h, z1.h
	movprfx	z0, z6
	sdot	z0.d, z5.h, z1.h
	uzp1	z17.s, z31.s, z17.s
	uzp1	z0.s, z7.s, z0.s
	sqrshrnb	z17.h, z17.s, #3
	sqrshrnb	z0.h, z0.s, #3
	uzp1	z17.h, z17.h, z17.h
	uzp1	z0.h, z0.h, z0.h
	stp	q17, q18, [x1, 384]
	ld1h	z18.h, p7/z, [x2]
	add	x2, x0, 320
	movprfx	z17, z6
	sdot	z17.d, z30.h, z1.h
	movprfx	z7, z6
	sdot	z7.d, z5.h, z18.h
	movprfx	z1, z6
	sdot	z1.d, z24.h, z18.h
	movprfx	z31, z6
	sdot	z31.d, z30.h, z18.h
	uzp1	z17.s, z29.s, z17.s
	uzp1	z7.s, z1.s, z7.s
	movprfx	z29, z6
	sdot	z29.d, z28.h, z18.h
	sqrshrnb	z17.h, z17.s, #3
	uzp1	z31.s, z29.s, z31.s
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z7.h, z7.s, #3
	sqrshrnb	z31.h, z31.s, #3
	uzp1	z7.h, z7.h, z7.h
	uzp1	z31.h, z31.h, z31.h
	stp	q0, q17, [x1, 64]
	ld1h	z0.h, p7/z, [x2]
	add	x2, x0, 448
	movprfx	z29, z6
	sdot	z29.d, z28.h, z0.h
	movprfx	z18, z6
	sdot	z18.d, z24.h, z0.h
	movprfx	z1, z6
	sdot	z1.d, z5.h, z0.h
	stp	q7, q31, [x1, 192]
	ld1h	z31.h, p7/z, [x2]
	movprfx	z7, z6
	sdot	z7.d, z30.h, z0.h
	add	x2, x0, 32
	uzp1	z7.s, z29.s, z7.s
	sqrshrnb	z7.h, z7.s, #3
	uzp1	z7.h, z7.h, z7.h
	uzp1	z1.s, z18.s, z1.s
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z1.h, z1.h, z1.h
	stp	q1, q7, [x1, 320]
	ld1h	z7.h, p7/z, [x2]
	add	x2, x0, 544
	movprfx	z17, z6
	sdot	z17.d, z24.h, z31.h
	movprfx	z29, z6
	sdot	z29.d, z28.h, z31.h
	movprfx	z0, z6
	sdot	z0.d, z5.h, z31.h
	movprfx	z1, z6
	sdot	z1.d, z30.h, z31.h
	uzp1	z0.s, z17.s, z0.s
	ld1h	z31.h, p7/z, [x2]
	sqrshrnb	z0.h, z0.s, #3
	add	x2, x0, 96
	uzp1	z0.h, z0.h, z0.h
	movprfx	z17, z6
	sdot	z17.d, z23.h, z7.h
	movprfx	z18, z6
	sdot	z18.d, z20.h, z7.h
	uzp1	z1.s, z29.s, z1.s
	movprfx	z29, z6
	sdot	z29.d, z4.h, z7.h
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z1.h, z1.h, z1.h
	stp	q0, q1, [x1, 448]
	movprfx	z0, z6
	sdot	z0.d, z26.h, z7.h
	ld1h	z7.h, p7/z, [x2]
	add	x2, x0, 608
	sdot	z17.d, z22.h, z31.h
	sdot	z18.d, z19.h, z31.h
	sdot	z29.d, z3.h, z31.h
	sdot	z0.d, z25.h, z31.h
	ld1h	z31.h, p7/z, [x2]
	uzp1	z0.s, z18.s, z0.s
	add	x2, x0, 160
	sqrshrnb	z0.h, z0.s, #3
	uzp1	z0.h, z0.h, z0.h
	uzp1	z29.s, z17.s, z29.s
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	stp	q29, q0, [x1, 32]
	ld1h	z0.h, p7/z, [x2]
	add	x2, x0, 672
	movprfx	z17, z6
	sdot	z17.d, z23.h, z7.h
	movprfx	z18, z6
	sdot	z18.d, z4.h, z7.h
	sdot	z17.d, z22.h, z31.h
	movprfx	z29, z6
	sdot	z29.d, z20.h, z7.h
	movprfx	z1, z6
	sdot	z1.d, z26.h, z7.h
	sdot	z29.d, z19.h, z31.h
	sdot	z18.d, z3.h, z31.h
	sdot	z1.d, z25.h, z31.h
	ld1h	z31.h, p7/z, [x2]
	add	x2, x0, 224
	uzp1	z18.s, z17.s, z18.s
	ld1h	z7.h, p7/z, [x2]
	uzp1	z1.s, z29.s, z1.s
	add	x2, x0, 736
	sqrshrnb	z18.h, z18.s, #3
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z18.h, z18.h, z18.h
	uzp1	z1.h, z1.h, z1.h
	movprfx	z17, z6
	sdot	z17.d, z23.h, z0.h
	movprfx	z29, z6
	sdot	z29.d, z4.h, z0.h
	sdot	z17.d, z22.h, z31.h
	sdot	z29.d, z3.h, z31.h
	uzp1	z29.s, z17.s, z29.s
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	stp	q18, q1, [x1, 96]
	movprfx	z18, z6
	sdot	z18.d, z20.h, z0.h
	movprfx	z1, z6
	sdot	z1.d, z26.h, z0.h
	sdot	z18.d, z19.h, z31.h
	ld1h	z0.h, p7/z, [x2]
	sdot	z1.d, z25.h, z31.h
	add	x2, x0, 288
	uzp1	z1.s, z18.s, z1.s
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z1.h, z1.h, z1.h
	movprfx	z17, z6
	sdot	z17.d, z23.h, z7.h
	movprfx	z18, z6
	sdot	z18.d, z4.h, z7.h
	stp	q29, q1, [x1, 160]
	movprfx	z29, z6
	sdot	z29.d, z20.h, z7.h
	movprfx	z1, z6
	sdot	z1.d, z26.h, z7.h
	ld1h	z7.h, p7/z, [x2]
	add	x2, x0, 800
	sdot	z17.d, z22.h, z0.h
	ld1h	z31.h, p7/z, [x2]
	sdot	z29.d, z19.h, z0.h
	add	x2, x0, 352
	sdot	z18.d, z3.h, z0.h
	sdot	z1.d, z25.h, z0.h
	uzp1	z18.s, z17.s, z18.s
	uzp1	z1.s, z29.s, z1.s
	sqrshrnb	z18.h, z18.s, #3
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z18.h, z18.h, z18.h
	uzp1	z1.h, z1.h, z1.h
	movprfx	z0, z6
	sdot	z0.d, z23.h, z7.h
	movprfx	z29, z6
	sdot	z29.d, z4.h, z7.h
	sdot	z0.d, z22.h, z31.h
	sdot	z29.d, z3.h, z31.h
	uzp1	z29.s, z0.s, z29.s
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	stp	q18, q1, [x1, 224]
	movprfx	z18, z6
	sdot	z18.d, z20.h, z7.h
	movprfx	z1, z6
	sdot	z1.d, z26.h, z7.h
	ld1h	z7.h, p7/z, [x2]
	add	x2, x0, 864
	sdot	z18.d, z19.h, z31.h
	movprfx	z17, z6
	sdot	z17.d, z23.h, z7.h
	sdot	z1.d, z25.h, z31.h
	uzp1	z1.s, z18.s, z1.s
	sqrshrnb	z1.h, z1.s, #3
	uzp1	z1.h, z1.h, z1.h
	stp	q29, q1, [x1, 288]
	ld1h	z31.h, p7/z, [x2]
	movprfx	z29, z6
	sdot	z29.d, z20.h, z7.h
	sdot	z17.d, z22.h, z31.h
	sdot	z29.d, z19.h, z31.h
	add	x2, x0, 416
	movprfx	z0, z6
	sdot	z0.d, z4.h, z7.h
	movprfx	z1, z6
	sdot	z1.d, z26.h, z7.h
	sdot	z0.d, z3.h, z31.h
	ld1h	z7.h, p7/z, [x2]
	sdot	z1.d, z25.h, z31.h
	add	x2, x0, 928
	movprfx	z18, z6
	sdot	z18.d, z20.h, z7.h
	ld1h	z31.h, p7/z, [x2]
	uzp1	z0.s, z17.s, z0.s
	sdot	z18.d, z19.h, z31.h
	movprfx	z17, z6
	sdot	z17.d, z23.h, z7.h
	uzp1	z1.s, z29.s, z1.s
	sdot	z17.d, z22.h, z31.h
	movprfx	z29, z6
	sdot	z29.d, z4.h, z7.h
	sqrshrnb	z0.h, z0.s, #3
	sdot	z29.d, z3.h, z31.h
	uzp1	z0.h, z0.h, z0.h
	uzp1	z29.s, z17.s, z29.s
	sqrshrnb	z1.h, z1.s, #3
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z1.h, z1.h, z1.h
	uzp1	z29.h, z29.h, z29.h
	add	x2, x0, 480
	add	x0, x0, 992
	ld1h	z17.h, p7/z, [x0]
	stp	q0, q1, [x1, 352]
	movprfx	z0, z6
	sdot	z0.d, z26.h, z7.h
	sdot	z0.d, z25.h, z31.h
	ld1h	z31.h, p7/z, [x2]
	uzp1	z0.s, z18.s, z0.s
	movprfx	z1, z6
	sdot	z1.d, z20.h, z31.h
	movprfx	z18, z6
	sdot	z18.d, z23.h, z31.h
	sdot	z1.d, z19.h, z17.h
	sdot	z18.d, z22.h, z17.h
	sqrshrnb	z0.h, z0.s, #3
	uzp1	z0.h, z0.h, z0.h
	stp	q29, q0, [x1, 416]
	movprfx	z29, z6
	sdot	z29.d, z4.h, z31.h
	sdot	z6.d, z26.h, z31.h
	sdot	z29.d, z3.h, z17.h
	sdot	z6.d, z25.h, z17.h
	uzp1	z29.s, z18.s, z29.s
	uzp1	z6.s, z1.s, z6.s
	sqrshrnb	z29.h, z29.s, #3
	sqrshrnb	z6.h, z6.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z6.h, z6.h, z6.h
	stp	q29, q6, [x1, 480]
	ret
	.cfi_endproc
.LFE3897:
	.size	_ZL9op_pass_4PKsPsl, .-_ZL9op_pass_4PKsPsl
	.align	2
	.p2align 5,,15
	.type	_ZL10op_pass_11PKsPs, %function
_ZL10op_pass_11PKsPs:
.LFB3898:
	.cfi_startproc
	add	x2, x0, 32
	ptrue	p7.b, all
	ld1h	z30.h, p7/z, [x2]
	add	x2, x0, 64
	ld1h	z31.h, p7/z, [x0]
	ld1h	z29.h, p7/z, [x2]
	ptrue	p6.d, all
	zip1	z0.d, z31.d, z29.d
	add	x2, x0, 96
	zip2	z29.d, z31.d, z29.d
	ld1h	z28.h, p7/z, [x2]
	zip1	z26.d, z30.d, z28.d
	zip2	z28.d, z30.d, z28.d
	zip1	z25.d, z0.d, z26.d
	zip1	z24.d, z29.d, z28.d
	zip2	z26.d, z0.d, z26.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z29.d, z28.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z21.s, z25.h, z28.h
	sub	z23.h, z25.h, z28.h
	sub	z22.h, z26.h, z24.h
	saddlt	z28.s, z25.h, z28.h
	saddlb	z20.s, z26.h, z24.h
	zip1	z19.s, z21.s, z28.s
	saddlt	z24.s, z26.h, z24.h
	zip2	z28.s, z21.s, z28.s
#APP
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z18.s, z24.s, z20.s
	zip2	z24.s, z24.s, z20.s
	sub	z17.s, z19.s, z18.s
	sub	z16.s, z28.s, z24.s
	add	z18.s, z19.s, z18.s
	add	z24.s, z28.s, z24.s
	uzp1	z16.h, z17.h, z16.h
	uzp2	z7.d, z18.d, z24.d
#APP
// 71 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z7.d, p6/m, z7.d
// 0 "" 2
#NO_APP
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	uzp1	z24.d, z18.d, z24.d
	add	x3, x2, 1024
	ld1w	z5.s, p7/z, [x3]
	add	z6.s, z7.s, z24.s
	add	x3, x2, 1056
	ld1w	z3.s, p7/z, [x3]
	sub	z24.s, z24.s, z7.s
	add	x3, x2, 1088
	movprfx	z4, z6
	mul	z4.s, p7/m, z4.s, z5.s
	ld1w	z1.s, p7/z, [x3]
	movprfx	z2, z24
	mul	z2.s, p7/m, z2.s, z3.s
	add	x3, x2, 1120
	mul	z6.s, p7/m, z6.s, z1.s
	ld1w	z31.s, p7/z, [x3]
	ptrue	p5.s, all
	mul	z24.s, p7/m, z24.s, z31.s
#APP
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z4.s, p5/m, z4.s, z6.s
// 0 "" 2
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z2.s, p5/m, z2.s, z24.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z4.s, z2.s
	add	x3, x2, 1152
	sqrshrnb	z30.h, z30.s, #10
	uzp2	z2.s, z4.s, z2.s
	ld1d	z27.d, p7/z, [x3]
	sqrshrnb	z2.h, z2.s, #10
	uzp1	z2.h, z30.h, z2.h
#APP
// 89 "kernels/dct16/candidates/best_op_mca.cpp" 1
	st1d {z2.d}, p6, [x1, z27.d]
// 0 "" 2
#NO_APP
	add	x3, x0, 128
	ld1h	z0.h, p7/z, [x3]
	add	x3, x0, 160
	ld1h	z25.h, p7/z, [x3]
	add	x3, x0, 192
	ld1h	z26.h, p7/z, [x3]
	zip1	z19.d, z0.d, z26.d
	add	x3, x0, 224
	zip2	z26.d, z0.d, z26.d
	ld1h	z21.h, p7/z, [x3]
	zip1	z28.d, z25.d, z21.d
	zip2	z21.d, z25.d, z21.d
	zip1	z20.d, z19.d, z28.d
	zip1	z17.d, z26.d, z21.d
	zip2	z28.d, z19.d, z28.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	zip2	z21.d, z26.d, z21.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	saddlb	z6.s, z20.h, z21.h
	sub	z18.h, z20.h, z21.h
	sub	z7.h, z28.h, z17.h
	saddlt	z21.s, z20.h, z21.h
	saddlb	z24.s, z28.h, z17.h
	zip1	z4.s, z6.s, z21.s
	saddlt	z17.s, z28.h, z17.h
	zip2	z21.s, z6.s, z21.s
#APP
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	zip1	z30.s, z17.s, z24.s
	zip2	z17.s, z17.s, z24.s
	sub	z2.s, z4.s, z30.s
	sub	z29.s, z21.s, z17.s
	add	z30.s, z4.s, z30.s
	add	z17.s, z21.s, z17.s
	uzp1	z29.h, z2.h, z29.h
	uzp2	z0.d, z30.d, z17.d
#APP
// 71 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z0.d, p6/m, z0.d
// 0 "" 2
#NO_APP
	uzp1	z17.d, z30.d, z17.d
	add	z19.s, z0.s, z17.s
	sub	z17.s, z17.s, z0.s
	movprfx	z26, z19
	mul	z26.s, p7/m, z26.s, z5.s
	movprfx	z20, z17
	mul	z20.s, p7/m, z20.s, z3.s
	mul	z19.s, p7/m, z19.s, z1.s
	mul	z17.s, p7/m, z17.s, z31.s
#APP
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z26.s, p5/m, z26.s, z19.s
// 0 "" 2
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z20.s, p5/m, z20.s, z17.s
// 0 "" 2
#NO_APP
	uzp1	z28.s, z26.s, z20.s
	add	x3, x1, 8
	sqrshrnb	z28.h, z28.s, #10
	uzp2	z20.s, z26.s, z20.s
	sqrshrnb	z20.h, z20.s, #10
	uzp1	z20.h, z28.h, z20.h
#APP
// 89 "kernels/dct16/candidates/best_op_mca.cpp" 1
	st1d {z20.d}, p6, [x3, z27.d]
// 0 "" 2
#NO_APP
	add	x3, x0, 256
	ld1h	z6.h, p7/z, [x3]
	add	x3, x0, 288
	ld1h	z4.h, p7/z, [x3]
	add	x3, x0, 320
	ld1h	z21.h, p7/z, [x3]
	zip1	z2.d, z6.d, z21.d
	add	x3, x0, 352
	zip2	z21.d, z6.d, z21.d
	ld1h	z24.h, p7/z, [x3]
	zip1	z30.d, z4.d, z24.d
	zip2	z24.d, z4.d, z24.d
	zip1	z25.d, z2.d, z30.d
	zip1	z0.d, z21.d, z24.d
	zip2	z30.d, z2.d, z30.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z0.d, p6/m, z0.d
// 0 "" 2
#NO_APP
	zip2	z24.d, z21.d, z24.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	saddlb	z28.s, z25.h, z24.h
	sub	z17.h, z25.h, z24.h
	sub	z26.h, z30.h, z0.h
	saddlt	z24.s, z25.h, z24.h
	saddlb	z20.s, z30.h, z0.h
	zip1	z6.s, z28.s, z24.s
	saddlt	z0.s, z30.h, z0.h
	zip2	z24.s, z28.s, z24.s
#APP
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z0.d, p6/m, z0.d
// 0 "" 2
#NO_APP
	zip1	z4.s, z0.s, z20.s
	zip2	z0.s, z0.s, z20.s
	sub	z2.s, z6.s, z4.s
	sub	z21.s, z24.s, z0.s
	add	z4.s, z6.s, z4.s
	add	z0.s, z24.s, z0.s
	uzp1	z21.h, z2.h, z21.h
	uzp2	z25.d, z4.d, z0.d
#APP
// 71 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	uzp1	z0.d, z4.d, z0.d
	add	z30.s, z25.s, z0.s
	sub	z0.s, z0.s, z25.s
	movprfx	z28, z30
	mul	z28.s, p7/m, z28.s, z5.s
	movprfx	z6, z0
	mul	z6.s, p7/m, z6.s, z3.s
	mul	z30.s, p7/m, z30.s, z1.s
	mul	z0.s, p7/m, z0.s, z31.s
#APP
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z28.s, p5/m, z28.s, z30.s
// 0 "" 2
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z6.s, p5/m, z6.s, z0.s
// 0 "" 2
#NO_APP
	uzp1	z24.s, z28.s, z6.s
	add	x3, x1, 16
	sqrshrnb	z24.h, z24.s, #10
	uzp2	z6.s, z28.s, z6.s
	sqrshrnb	z6.h, z6.s, #10
	uzp1	z6.h, z24.h, z6.h
#APP
// 89 "kernels/dct16/candidates/best_op_mca.cpp" 1
	st1d {z6.d}, p6, [x3, z27.d]
// 0 "" 2
#NO_APP
	add	x3, x0, 384
	ld1h	z20.h, p7/z, [x3]
	add	x3, x0, 416
	ld1h	z2.h, p7/z, [x3]
	add	x3, x0, 448
	add	x0, x0, 480
	ld1h	z4.h, p7/z, [x3]
	ld1h	z25.h, p7/z, [x0]
	zip1	z30.d, z20.d, z4.d
	zip1	z19.d, z2.d, z25.d
	zip2	z4.d, z20.d, z4.d
	zip2	z25.d, z2.d, z25.d
	zip1	z0.d, z30.d, z19.d
	zip1	z24.d, z4.d, z25.d
	zip2	z19.d, z30.d, z19.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z4.d, z25.d
#APP
// 53 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	saddlb	z2.s, z0.h, z25.h
	sub	z6.h, z0.h, z25.h
	sub	z20.h, z19.h, z24.h
	saddlt	z25.s, z0.h, z25.h
	saddlb	z30.s, z19.h, z24.h
	zip1	z4.s, z2.s, z25.s
	saddlt	z24.s, z19.h, z24.h
	zip2	z25.s, z2.s, z25.s
#APP
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
// 62 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z28.s, z24.s, z30.s
	zip2	z24.s, z24.s, z30.s
	sub	z0.s, z4.s, z28.s
	sub	z2.s, z25.s, z24.s
	add	z28.s, z4.s, z28.s
	add	z24.s, z25.s, z24.s
	uzp1	z2.h, z0.h, z2.h
	uzp2	z25.d, z28.d, z24.d
#APP
// 71 "kernels/dct16/candidates/best_op_mca.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	uzp1	z24.d, z28.d, z24.d
	add	z30.s, z25.s, z24.s
	sub	z24.s, z24.s, z25.s
	mul	z5.s, p7/m, z5.s, z30.s
	mul	z3.s, p7/m, z3.s, z24.s
	mul	z30.s, p7/m, z30.s, z1.s
	mul	z24.s, p7/m, z24.s, z31.s
#APP
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z5.s, p5/m, z5.s, z30.s
// 0 "" 2
// 80 "kernels/dct16/candidates/best_op_mca.cpp" 1
	addp z3.s, p5/m, z3.s, z24.s
// 0 "" 2
#NO_APP
	uzp1	z19.s, z5.s, z3.s
	add	x0, x1, 24
	sqrshrnb	z19.h, z19.s, #10
	uzp2	z3.s, z5.s, z3.s
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z19.h, z3.h
#APP
// 89 "kernels/dct16/candidates/best_op_mca.cpp" 1
	st1d {z3.d}, p6, [x0, z27.d]
// 0 "" 2
#NO_APP
	add	x0, x2, 32
	ld1h	z0.h, p7/z, [x0]
	movi	d30, #0
	add	x0, x2, 544
	ld1h	z25.h, p7/z, [x0]
	movprfx	z24, z30
	sdot	z24.d, z23.h, z0.h
	add	x0, x1, 32
	sdot	z24.d, z22.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z18.h, z0.h
	movprfx	z19, z30
	sdot	z19.d, z17.h, z0.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z0.h
	sdot	z19.d, z26.h, z25.h
	sdot	z5.d, z7.h, z25.h
	sdot	z3.d, z20.h, z25.h
	uzp1	z5.s, z24.s, z5.s
	uzp1	z3.s, z19.s, z3.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z5.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 96
	ld1h	z28.h, p7/z, [x0]
	add	x0, x2, 608
	ld1h	z0.h, p7/z, [x0]
	add	x0, x1, 96
	movprfx	z24, z30
	sdot	z24.d, z23.h, z28.h
	movprfx	z19, z30
	sdot	z19.d, z18.h, z28.h
	sdot	z24.d, z22.h, z0.h
	movprfx	z5, z30
	sdot	z5.d, z17.h, z28.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z28.h
	sdot	z5.d, z26.h, z0.h
	sdot	z19.d, z7.h, z0.h
	sdot	z3.d, z20.h, z0.h
	uzp1	z19.s, z24.s, z19.s
	uzp1	z3.s, z5.s, z3.s
	sqrshrnb	z19.h, z19.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z19.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 160
	ld1h	z28.h, p7/z, [x0]
	movprfx	z0, z30
	sdot	z0.d, z23.h, z28.h
	add	x0, x2, 672
	ld1h	z25.h, p7/z, [x0]
	movprfx	z5, z30
	sdot	z5.d, z18.h, z28.h
	add	x0, x1, 160
	sdot	z0.d, z22.h, z25.h
	movprfx	z19, z30
	sdot	z19.d, z17.h, z28.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z28.h
	sdot	z19.d, z26.h, z25.h
	sdot	z5.d, z7.h, z25.h
	sdot	z3.d, z20.h, z25.h
	uzp1	z5.s, z0.s, z5.s
	uzp1	z3.s, z19.s, z3.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z5.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 224
	ld1h	z28.h, p7/z, [x0]
	add	x0, x2, 736
	ld1h	z25.h, p7/z, [x0]
	movprfx	z24, z30
	sdot	z24.d, z23.h, z28.h
	add	x0, x1, 224
	sdot	z24.d, z22.h, z25.h
	movprfx	z0, z30
	sdot	z0.d, z18.h, z28.h
	movprfx	z5, z30
	sdot	z5.d, z17.h, z28.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z28.h
	sdot	z5.d, z26.h, z25.h
	sdot	z0.d, z7.h, z25.h
	sdot	z3.d, z20.h, z25.h
	uzp1	z0.s, z24.s, z0.s
	uzp1	z3.s, z5.s, z3.s
	sqrshrnb	z0.h, z0.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z0.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 288
	ld1h	z28.h, p7/z, [x0]
	add	x0, x2, 800
	ld1h	z25.h, p7/z, [x0]
	add	x0, x1, 288
	movprfx	z24, z30
	sdot	z24.d, z23.h, z28.h
	movprfx	z5, z30
	sdot	z5.d, z18.h, z28.h
	sdot	z24.d, z22.h, z25.h
	movprfx	z19, z30
	sdot	z19.d, z17.h, z28.h
	movprfx	z0, z30
	sdot	z0.d, z6.h, z28.h
	sdot	z19.d, z26.h, z25.h
	sdot	z5.d, z7.h, z25.h
	sdot	z0.d, z20.h, z25.h
	uzp1	z5.s, z24.s, z5.s
	uzp1	z0.s, z19.s, z0.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z0.h, z0.s, #10
	uzp1	z0.h, z5.h, z0.h
	st1h	z0.h, p7, [x0]
	add	x0, x2, 352
	ld1h	z28.h, p7/z, [x0]
	movprfx	z24, z30
	sdot	z24.d, z23.h, z28.h
	add	x0, x2, 864
	ld1h	z25.h, p7/z, [x0]
	movprfx	z19, z30
	sdot	z19.d, z18.h, z28.h
	add	x0, x1, 352
	sdot	z24.d, z22.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z17.h, z28.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z28.h
	sdot	z5.d, z26.h, z25.h
	sdot	z19.d, z7.h, z25.h
	sdot	z3.d, z20.h, z25.h
	uzp1	z19.s, z24.s, z19.s
	uzp1	z3.s, z5.s, z3.s
	sqrshrnb	z19.h, z19.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z19.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 416
	ld1h	z0.h, p7/z, [x0]
	add	x0, x2, 928
	ld1h	z25.h, p7/z, [x0]
	movprfx	z24, z30
	sdot	z24.d, z23.h, z0.h
	add	x0, x1, 416
	sdot	z24.d, z22.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z18.h, z0.h
	movprfx	z19, z30
	sdot	z19.d, z17.h, z0.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z0.h
	sdot	z19.d, z26.h, z25.h
	sdot	z5.d, z7.h, z25.h
	sdot	z3.d, z20.h, z25.h
	uzp1	z5.s, z24.s, z5.s
	uzp1	z3.s, z19.s, z3.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z5.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 480
	ld1h	z28.h, p7/z, [x0]
	add	x0, x2, 992
	ld1h	z0.h, p7/z, [x0]
	add	x0, x1, 480
	movprfx	z24, z30
	sdot	z24.d, z23.h, z28.h
	movprfx	z19, z30
	sdot	z19.d, z18.h, z28.h
	sdot	z24.d, z22.h, z0.h
	sdot	z19.d, z7.h, z0.h
	movprfx	z5, z30
	sdot	z5.d, z17.h, z28.h
	movprfx	z3, z30
	sdot	z3.d, z6.h, z28.h
	sdot	z5.d, z26.h, z0.h
	sdot	z3.d, z20.h, z0.h
	uzp1	z19.s, z24.s, z19.s
	uzp1	z3.s, z5.s, z3.s
	sqrshrnb	z19.h, z19.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z19.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 64
	ld1h	z25.h, p7/z, [x0]
	movprfx	z0, z30
	sdot	z0.d, z16.h, z25.h
	add	x0, x1, 64
	movprfx	z19, z30
	sdot	z19.d, z21.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z29.h, z25.h
	movprfx	z3, z30
	sdot	z3.d, z2.h, z25.h
	uzp1	z5.s, z0.s, z5.s
	uzp1	z3.s, z19.s, z3.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z5.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 192
	ld1h	z25.h, p7/z, [x0]
	add	x0, x1, 192
	movprfx	z24, z30
	sdot	z24.d, z16.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z21.h, z25.h
	movprfx	z0, z30
	sdot	z0.d, z29.h, z25.h
	movprfx	z3, z30
	sdot	z3.d, z2.h, z25.h
	uzp1	z0.s, z24.s, z0.s
	uzp1	z3.s, z5.s, z3.s
	sqrshrnb	z0.h, z0.s, #10
	sqrshrnb	z3.h, z3.s, #10
	uzp1	z3.h, z0.h, z3.h
	st1h	z3.h, p7, [x0]
	add	x0, x2, 320
	ld1h	z25.h, p7/z, [x0]
	add	x0, x1, 320
	movprfx	z24, z30
	sdot	z24.d, z16.h, z25.h
	movprfx	z19, z30
	sdot	z19.d, z21.h, z25.h
	movprfx	z5, z30
	sdot	z5.d, z29.h, z25.h
	movprfx	z0, z30
	sdot	z0.d, z2.h, z25.h
	uzp1	z5.s, z24.s, z5.s
	uzp1	z0.s, z19.s, z0.s
	sqrshrnb	z5.h, z5.s, #10
	sqrshrnb	z0.h, z0.s, #10
	uzp1	z0.h, z5.h, z0.h
	st1h	z0.h, p7, [x0]
	add	x2, x2, 448
	add	x1, x1, 448
	ld1h	z24.h, p7/z, [x2]
	movprfx	z19, z30
	sdot	z19.d, z16.h, z24.h
	movprfx	z5, z30
	sdot	z5.d, z29.h, z24.h
	movprfx	z3, z30
	sdot	z3.d, z21.h, z24.h
	uzp1	z5.s, z19.s, z5.s
	sdot	z30.d, z2.h, z24.h
	sqrshrnb	z5.h, z5.s, #10
	uzp1	z30.s, z3.s, z30.s
	sqrshrnb	z30.h, z30.s, #10
	uzp1	z30.h, z5.h, z30.h
	st1h	z30.h, p7, [x1]
	ret
	.cfi_endproc
.LFE3898:
	.size	_ZL10op_pass_11PKsPs, .-_ZL10op_pass_11PKsPs
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_sve2_shared
	.type	dynopt_dct16_sve2_shared, %function
dynopt_dct16_sve2_shared:
.LFB3899:
	.cfi_startproc
	sub	sp, sp, #528
	.cfi_def_cfa_offset 528
	mov	x6, x1
	add	x1, sp, 16
	stp	x29, x30, [sp]
	.cfi_offset 29, -528
	.cfi_offset 30, -520
	mov	x29, sp
	bl	_ZL9op_pass_4PKsPsl
	mov	x1, x6
	add	x0, sp, 16
	bl	_ZL10op_pass_11PKsPs
	ldp	x29, x30, [sp]
	add	sp, sp, 528
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3899:
	.size	dynopt_dct16_sve2_shared, .-dynopt_dct16_sve2_shared
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_op_pass1
	.type	dynopt_dct16_op_pass1, %function
dynopt_dct16_op_pass1:
.LFB3900:
	.cfi_startproc
	b	_ZL9op_pass_4PKsPsl
	.cfi_endproc
.LFE3900:
	.size	dynopt_dct16_op_pass1, .-dynopt_dct16_op_pass1
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_op_pass2
	.type	dynopt_dct16_op_pass2, %function
dynopt_dct16_op_pass2:
.LFB3901:
	.cfi_startproc
	b	_ZL10op_pass_11PKsPs
	.cfi_endproc
.LFE3901:
	.size	dynopt_dct16_op_pass2, .-dynopt_dct16_op_pass2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL5CQ_LO, %object
	.size	_ZL5CQ_LO, 512
_ZL5CQ_LO:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.type	_ZL5CQ_HI, %object
	.size	_ZL5CQ_HI, 512
_ZL5CQ_HI:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.type	_ZL4T8E8, %object
	.size	_ZL4T8E8, 128
_ZL4T8E8:
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.type	_ZL9EVEN_OFFS, %object
	.size	_ZL9EVEN_OFFS, 32
_ZL9EVEN_OFFS:
	.xword	0
	.xword	128
	.xword	256
	.xword	384
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
