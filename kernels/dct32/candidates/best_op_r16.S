	.arch armv8.2-a+crc+sve2
	.file	"best_op_r16.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	mov	x13, 71
	cntb	x12
	ptrue	p7.b, all
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	movi	d2, #0
	mul	x12, x12, x13
	add	x11, x3, 96
	add	x5, x2, x2, lsl 1
	add	x7, x2, x2, lsl 2
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x38,0x2,0x1e,0x22
	add	x4, x3, 32
	sub	sp, sp, #112
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x38,0x2,0x1e,0x23,0x70,0x22
	lsl	x8, x2, 4
	sub	x8, x8, x2
	add	x17, x0, x5, lsl 1
	add	x16, x0, x7, lsl 1
	add	x15, x0, x5, lsl 2
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x13, x0, x7, lsl 2
	ld1h	z31.h, p7/z, [x11]
	cntb	x11, all, mul #15
	lsl	x11, x11, 2
	stp	x19, x20, [sp, 16]
	ld1w	z0.s, p7/z, [x4]
	add	x11, sp, x11
	ld1h	z5.h, p7/z, [x3]
	str	x21, [sp, 32]
	add	x11, x11, 112
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	cntb	x21, all, mul #15
	stp	d8, d9, [sp, 48]
	lsl	x21, x21, 2
	stp	d10, d11, [sp, 64]
	lsl	x20, x2, 3
	sub	x9, x20, x2
	stp	d12, d13, [sp, 80]
	add	x10, x20, x2
	add	x4, x3, 64
	ld1h	z1.h, p7/z, [x4]
	stp	d14, d15, [sp, 96]
	.cfi_escape 0x10,0x48,0x2,0x8f,0x30
	.cfi_escape 0x10,0x49,0x2,0x8f,0x38
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xe8,0
	add	x7, x2, x7, lsl 1
	str	z31, [x11]
	add	x11, x3, 128
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, x21, #1
	cntb	x21
	add	x11, x11, 112
	lsl	x21, x21, 6
	add	x11, sp, x11
	str	z31, [x11]
	add	x12, x0, x5, lsl 3
	add	x11, x3, 160
	ld1h	z31.h, p7/z, [x11]
	add	x5, x2, x5, lsl 2
	rdvl	x11, #31
	lsl	x4, x2, 5
	lsl	x11, x11, 1
	add	x30, x0, x2, lsl 1
	add	x11, sp, x11
	add	x18, x0, x2, lsl 2
	add	x11, x11, 112
	str	z31, [x11]
	add	x2, x0, x2, lsl 3
	add	x11, x3, 192
	ld1h	z31.h, p7/z, [x11]
	add	x14, x0, x9, lsl 1
	addvl	x11, x21, #-1
	cntb	x21
	add	x11, x11, 112
	lsl	x21, x21, 6
	add	x11, sp, x11
	str	z31, [x11]
	add	x10, x0, x10, lsl 1
	add	x11, x3, 224
	ld1h	z31.h, p7/z, [x11]
	add	x7, x0, x7, lsl 1
	cntb	x11
	add	x5, x0, x5, lsl 1
	lsl	x11, x11, 6
	add	x9, x0, x9, lsl 2
	add	x11, sp, x11
	add	x8, x0, x8, lsl 1
	add	x11, x11, 112
	str	z31, [x11]
	add	x19, x1, 64
	add	x11, x3, 256
	ld1h	z31.h, p7/z, [x11]
	add	x20, x20, x2
	addvl	x11, x21, #1
	cntb	x21, all, mul #2
	add	x11, x11, 112
	lsl	x21, x21, 5
	add	x11, sp, x11
	str	z31, [x11]
	mov	x6, 0
	add	x11, x3, 288
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, x21, #2
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z31, [x11]
	add	x11, x3, 320
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, x21, #-1
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z31, [x11]
	add	x11, x3, 352
	ld1h	z31.h, p7/z, [x11]
	rdvl	x11, #17
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	str	z31, [x11]
	add	x11, x3, 384
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #2
	lsl	x21, x21, 4
	add	x11, x11, 112
	incb	x21, all, mul #2
	add	x11, sp, x11
	str	z31, [x11]
	add	x11, x3, 416
	ld1h	z31.h, p7/z, [x11]
	lsl	x21, x21, 1
	addvl	x11, x21, #2
	add	x11, x11, 112
	add	x11, sp, x11
	str	z31, [x11]
.L2:
	add	x11, x0, x6
	ld1h	z30.h, p7/z, [x11]
	cntb	x21
	add	x11, x11, 32
	ld1h	z23.h, p7/z, [x11]
	rev	z31.h, z23.h
	addvl	x11, sp, #1
	sub	z21.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x11, x11, 112
	str	z23, [x11]
	lsl	x21, x21, 5
	add	x11, sp, 112
	str	z30, [x11]
	rev	z30.h, z31.h
	addvl	x11, sp, #28
	sub	z10.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x11, x11, 112
	str	z10, [x11]
	tbl	z30.h, {z31.h}, z1.h
	addvl	x11, sp, #29
	sub	z31.h, z31.h, z30.h
	ptrue	p6.d, all
	add	x11, x11, 112
	str	z31, [x11]
	add	x11, x30, x6
	ld1h	z29.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z22.h, p7/z, [x11]
	rev	z31.h, z22.h
	addvl	x11, sp, #3
	sub	z20.h, z29.h, z31.h
	add	z31.h, z29.h, z31.h
	add	x11, x11, 112
	str	z22, [x11]
	rev	z30.h, z31.h
	addvl	x11, sp, #2
	sub	z28.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x11, x11, 112
	str	z29, [x11]
	tbl	z30.h, {z31.h}, z1.h
	addvl	x11, sp, #30
	sub	z27.h, z31.h, z30.h
	add	x11, x11, 112
	str	z28, [x11]
	ld1h	z28.h, p7/z, [x17]
	addvl	x11, sp, #31
	add	x11, x11, 112
	str	z27, [x11]
	add	x11, x18, x6
	ld1h	z30.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, sp, #4
	add	x11, x11, 112
	str	z31, [x11]
	rev	z31.h, z31.h
	cntb	x11
	sub	z8.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	lsl	x11, x11, 5
	rev	z29.h, z31.h
	sub	z27.h, z31.h, z29.h
	add	x11, sp, x11
	add	z31.h, z31.h, z29.h
	tbl	z29.h, {z31.h}, z1.h
	add	x11, x11, 112
	str	z27, [x11]
	sub	z24.h, z31.h, z29.h
	addvl	x11, x21, #1
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 1
	add	x11, sp, x11
	str	z24, [x11]
	add	x11, x17, 32
	ld1h	z27.h, p7/z, [x11]
	rev	z31.h, z27.h
	addvl	x11, sp, #5
	sub	z9.h, z28.h, z31.h
	add	z31.h, z28.h, z31.h
	add	x11, x11, 112
	str	z27, [x11]
	rev	z29.h, z31.h
	rdvl	x11, #17
	sub	z24.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	lsl	x11, x11, 1
	tbl	z29.h, {z31.h}, z1.h
	sub	z19.h, z31.h, z29.h
	add	x11, sp, x11
	add	x11, x11, 112
	str	z24, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #9
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z19, [x11]
	add	x11, x2, x6
	ld1h	z27.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z31.h, z24.h
	addvl	x11, sp, #7
	sub	z23.h, z27.h, z31.h
	add	z31.h, z27.h, z31.h
	add	x11, x11, 112
	str	z24, [x11]
	rev	z29.h, z31.h
	addvl	x11, sp, #6
	sub	z19.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	add	x11, x11, 112
	str	z27, [x11]
	tbl	z29.h, {z31.h}, z1.h
	cntb	x11, all, mul #9
	sub	z18.h, z31.h, z29.h
	ld1h	z24.h, p7/z, [x16]
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	str	z19, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #5
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	str	z18, [x11]
	add	x11, x16, 32
	ld1h	z13.h, p7/z, [x11]
	rev	z31.h, z13.h
	addvl	x11, sp, #9
	sub	z22.h, z24.h, z31.h
	add	z31.h, z24.h, z31.h
	add	x11, x11, 112
	str	z13, [x11]
	rev	z29.h, z31.h
	addvl	x11, sp, #8
	sub	z18.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	add	x11, x11, 112
	str	z24, [x11]
	tbl	z29.h, {z31.h}, z1.h
	rdvl	x11, #19
	sub	z17.h, z31.h, z29.h
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z18, [x11]
	ld1h	z31.h, p7/z, [x15]
	addvl	x11, x21, #-1
	cntb	x21, all, mul #5
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	str	z17, [x11]
	add	x11, x15, 32
	ld1h	z12.h, p7/z, [x11]
	rev	z29.h, z12.h
	addvl	x11, sp, #10
	sub	z10.h, z31.h, z29.h
	add	z29.h, z31.h, z29.h
	add	x11, x11, 112
	str	z12, [x11]
	rev	z27.h, z29.h
	cntb	x11, all, mul #5
	sub	z17.h, z29.h, z27.h
	add	z29.h, z29.h, z27.h
	lsl	x11, x11, 3
	tbl	z27.h, {z29.h}, z1.h
	sub	z16.h, z29.h, z27.h
	add	x11, sp, x11
	ld1h	z29.h, p7/z, [x14]
	add	x11, x11, 112
	str	z17, [x11]
	ld1h	z17.h, p7/z, [x10]
	addvl	x11, x21, #1
	rdvl	x21, #21
	add	x11, x11, 112
	lsl	x21, x21, 1
	add	x11, sp, x11
	str	z16, [x11]
	add	x11, x14, 32
	ld1h	z18.h, p7/z, [x11]
	rev	z27.h, z18.h
	addvl	x11, sp, #11
	sub	z11.h, z29.h, z27.h
	add	z27.h, z29.h, z27.h
	add	x11, x11, 112
	str	z18, [x11]
	rev	z26.h, z27.h
	rdvl	x11, #21
	sub	z16.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	lsl	x11, x11, 1
	tbl	z26.h, {z27.h}, z1.h
	sub	z15.h, z27.h, z26.h
	add	x11, sp, x11
	add	x11, x11, 112
	str	z16, [x11]
	addvl	x11, x21, #1
	add	x11, x11, 112
	add	x11, sp, x11
	str	z15, [x11]
	add	x11, x20, x6
	ld1h	z18.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z15.h, p7/z, [x11]
	rev	z27.h, z15.h
	addvl	x11, sp, #13
	sub	z25.h, z18.h, z27.h
	add	z27.h, z18.h, z27.h
	add	x11, x11, 112
	str	z15, [x11]
	rev	z26.h, z27.h
	addvl	x11, sp, #12
	sub	z14.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x11, x11, 112
	str	z18, [x11]
	tbl	z26.h, {z27.h}, z1.h
	cntb	x11, all, mul #11
	sub	z7.h, z27.h, z26.h
	ld1h	z15.h, p7/z, [x13]
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	str	z14, [x11]
	cntb	x11, all, mul #3
	lsl	x21, x11, 4
	sub	x11, x21, x11
	cntb	x21, all, mul #3
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	str	z7, [x11]
	add	x11, x10, 32
	ld1h	z16.h, p7/z, [x11]
	rev	z27.h, z16.h
	addvl	x11, sp, #15
	sub	z24.h, z17.h, z27.h
	add	z27.h, z17.h, z27.h
	add	x11, x11, 112
	str	z16, [x11]
	rev	z26.h, z27.h
	addvl	x11, sp, #14
	sub	z7.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x11, x11, 112
	str	z17, [x11]
	tbl	z26.h, {z27.h}, z1.h
	rdvl	x11, #23
	sub	z6.h, z27.h, z26.h
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z7, [x11]
	addvl	x11, x21, #-1
	cntb	x21, all, mul #3
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	str	z6, [x11]
	add	x11, x13, 32
	ld1h	z14.h, p7/z, [x11]
	rev	z27.h, z14.h
	addvl	x11, sp, #17
	sub	z12.h, z15.h, z27.h
	add	z27.h, z15.h, z27.h
	add	x11, x11, 112
	str	z14, [x11]
	rev	z26.h, z27.h
	addvl	x11, sp, #16
	sub	z6.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x11, x11, 112
	str	z15, [x11]
	tbl	z26.h, {z27.h}, z1.h
	cntb	x11, all, mul #3
	sub	z4.h, z27.h, z26.h
	ld1h	z14.h, p7/z, [x7]
	lsl	x11, x11, 4
	add	x11, sp, x11
	add	x11, x11, 112
	str	z6, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #13
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z4, [x11]
	add	x11, x7, 32
	ld1h	z7.h, p7/z, [x11]
	rev	z27.h, z7.h
	addvl	x11, sp, #19
	sub	z13.h, z14.h, z27.h
	add	z27.h, z14.h, z27.h
	add	x11, x11, 112
	str	z7, [x11]
	rev	z26.h, z27.h
	addvl	x11, sp, #18
	sub	z4.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x11, x11, 112
	str	z14, [x11]
	tbl	z26.h, {z27.h}, z1.h
	rdvl	x11, #25
	sub	z3.h, z27.h, z26.h
	ld1h	z7.h, p7/z, [x12]
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z4, [x11]
	cntb	x11, all, mul #3
	add	x11, x11, x11, lsl 4
	add	x11, x11, 112
	add	x11, sp, x11
	str	z3, [x11]
	add	x11, x12, 32
	ld1h	z6.h, p7/z, [x11]
	rev	z26.h, z6.h
	addvl	x11, sp, #21
	sub	z27.h, z7.h, z26.h
	add	z26.h, z7.h, z26.h
	add	x11, x11, 112
	str	z6, [x11]
	rev	z15.h, z26.h
	addvl	x11, sp, #20
	sub	z3.h, z26.h, z15.h
	add	z26.h, z26.h, z15.h
	add	x11, x11, 112
	str	z7, [x11]
	tbl	z15.h, {z26.h}, z1.h
	cntb	x11, all, mul #13
	sub	z4.h, z26.h, z15.h
	ld1h	z6.h, p7/z, [x5]
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	str	z3, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #7
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	str	z4, [x11]
	add	x11, x5, 32
	ld1h	z4.h, p7/z, [x11]
	rev	z15.h, z4.h
	addvl	x11, sp, #23
	sub	z26.h, z6.h, z15.h
	add	z15.h, z6.h, z15.h
	add	x11, x11, 112
	str	z4, [x11]
	rev	z14.h, z15.h
	addvl	x11, sp, #22
	sub	z3.h, z15.h, z14.h
	add	z15.h, z15.h, z14.h
	add	x11, x11, 112
	str	z6, [x11]
	tbl	z14.h, {z15.h}, z1.h
	rdvl	x11, #27
	sub	z19.h, z15.h, z14.h
	ld1h	z4.h, p7/z, [x9]
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z3, [x11]
	cntb	x11, all, mul #11
	add	x11, x11, x11, lsl 2
	add	x11, x11, 112
	add	x11, sp, x11
	str	z19, [x11]
	add	x11, x9, 32
	ld1h	z3.h, p7/z, [x11]
	rev	z15.h, z3.h
	addvl	x11, sp, #25
	sub	z14.h, z4.h, z15.h
	add	z15.h, z4.h, z15.h
	add	x11, x11, 112
	str	z3, [x11]
	rev	z7.h, z15.h
	addvl	x11, sp, #24
	sub	z19.h, z15.h, z7.h
	add	z15.h, z15.h, z7.h
	add	x11, x11, 112
	str	z4, [x11]
	tbl	z7.h, {z15.h}, z1.h
	cntb	x11, all, mul #7
	sub	z17.h, z15.h, z7.h
	ld1h	z3.h, p7/z, [x8]
	lsl	x11, x11, 3
	zip1	z4.d, z21.d, z8.d
	add	x11, sp, x11
	add	x11, x11, 112
	str	z19, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #15
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z17, [x11]
	add	x11, x8, 32
	ld1h	z19.h, p7/z, [x11]
	rev	z7.h, z19.h
	addvl	x11, sp, #27
	sub	z15.h, z3.h, z7.h
	add	z7.h, z3.h, z7.h
	add	x11, x11, 112
	str	z19, [x11]
	rev	z6.h, z7.h
	addvl	x11, sp, #26
	sub	z17.h, z7.h, z6.h
	add	z7.h, z7.h, z6.h
	add	x11, x11, 112
	str	z3, [x11]
	tbl	z6.h, {z7.h}, z1.h
	rdvl	x11, #29
	sub	z16.h, z7.h, z6.h
	trn2	z7.d, z21.d, z8.d
	lsl	x11, x11, 1
	trn1	z21.d, z21.d, z8.d
	trn2	z6.d, z20.d, z9.d
	add	x11, sp, x11
	zip1	z3.d, z20.d, z9.d
	trn1	z20.d, z20.d, z9.d
	add	x11, x11, 112
	str	z17, [x11]
	zip1	z9.d, z23.d, z10.d
	addvl	x11, x21, #-1
	cntb	x21, all, mul #15
	zip1	z8.d, z22.d, z11.d
	add	x11, x11, 112
	lsl	x21, x21, 2
	zip1	z3.d, z4.d, z3.d
	add	x11, sp, x11
	str	z16, [x11]
	zip2	z16.d, z21.d, z20.d
	addvl	x11, x21, #1
	trn2	z21.d, z23.d, z10.d
	trn1	z23.d, z23.d, z10.d
	trn2	z20.d, z22.d, z11.d
	add	x11, x11, 112
	trn1	z22.d, z22.d, z11.d
	zip2	z11.d, z23.d, z22.d
	trn2	z23.d, z25.d, z12.d
	zip1	z4.d, z7.d, z6.d
	zip2	z10.d, z21.d, z20.d
	zip2	z7.d, z7.d, z6.d
	zip1	z8.d, z9.d, z8.d
	trn2	z22.d, z24.d, z13.d
	zip1	z9.d, z21.d, z20.d
	zip1	z6.d, z23.d, z22.d
	zip1	z21.d, z25.d, z12.d
	add	x11, sp, x11
	trn1	z25.d, z25.d, z12.d
	zip2	z12.d, z23.d, z22.d
	zip1	z23.d, z27.d, z14.d
	zip1	z22.d, z26.d, z15.d
	zip1	z19.d, z23.d, z22.d
	ldr	z23, [x11]
	cntb	x11, all, mul #15
	lsl	x11, x11, 2
	cntb	x21
	zip1	z20.d, z24.d, z13.d
	add	x11, sp, x11
	lsl	x21, x21, 6
	zip1	z17.d, z21.d, z20.d
	add	x11, x11, 112
	ldr	z22, [x11]
	trn1	z24.d, z24.d, z13.d
	rdvl	x11, #31
	zip2	z13.d, z25.d, z24.d
	trn2	z24.d, z26.d, z15.d
	lsl	x11, x11, 1
	trn2	z25.d, z27.d, z14.d
	trn1	z26.d, z26.d, z15.d
	add	x11, sp, x11
	zip1	z18.d, z25.d, z24.d
	trn1	z27.d, z27.d, z14.d
	add	x11, x11, 112
	ldr	z21, [x11]
	zip2	z15.d, z27.d, z26.d
	addvl	x11, x21, #-1
	cntb	x21
	zip2	z14.d, z25.d, z24.d
	add	x11, x11, 112
	movprfx	z24, z2
	sdot	z24.d, z9.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z23.h
	add	x11, sp, x11
	ldr	z20, [x11]
	sdot	z24.d, z8.h, z22.h
	add	x11, x1, 64
	sdot	z24.d, z11.h, z21.h
	sdot	z25.d, z19.h, z22.h
	sdot	z24.d, z10.h, z20.h
	sdot	z25.d, z15.h, z21.h
	lsl	x21, x21, 6
	sdot	z25.d, z14.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z4.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z6.h, z23.h
	sdot	z27.d, z3.h, z22.h
	sdot	z26.d, z17.h, z22.h
	sdot	z27.d, z16.h, z21.h
	sdot	z26.d, z13.h, z21.h
	sdot	z27.d, z7.h, z20.h
	sdot	z26.d, z12.h, z20.h
	uzp1	z27.s, z27.s, z24.s
	uzp1	z26.s, z26.s, z25.s
	rshrnb	z24.h, z27.s, #4
	rshrnb	z25.h, z26.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #2
	add	x11, x11, 112
	lsl	x21, x21, 5
	add	x11, sp, x11
	ldr	z23, [x11]
	movprfx	z24, z2
	sdot	z24.d, z9.h, z23.h
	cntb	x11
	movprfx	z25, z2
	sdot	z25.d, z18.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z4.h, z23.h
	lsl	x11, x11, 6
	movprfx	z27, z2
	sdot	z27.d, z6.h, z23.h
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z22, [x11]
	sdot	z24.d, z8.h, z22.h
	addvl	x11, x21, #2
	rdvl	x21, #17
	sdot	z25.d, z19.h, z22.h
	add	x11, x11, 112
	lsl	x21, x21, 2
	sdot	z26.d, z3.h, z22.h
	add	x11, sp, x11
	ldr	z21, [x11]
	sdot	z24.d, z11.h, z21.h
	addvl	x11, x21, #-1
	sdot	z25.d, z15.h, z21.h
	rdvl	x21, #17
	add	x11, x11, 112
	sdot	z26.d, z16.h, z21.h
	sdot	z27.d, z17.h, z22.h
	add	x11, sp, x11
	ldr	z20, [x11]
	sdot	z24.d, z10.h, z20.h
	sdot	z25.d, z14.h, z20.h
	add	x11, x1, 192
	sdot	z26.d, z7.h, z20.h
	sdot	z27.d, z13.h, z21.h
	lsl	x21, x21, 2
	sdot	z27.d, z12.h, z20.h
	uzp1	z26.s, z26.s, z24.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 448
	ld1h	z23.h, p7/z, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #2
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	ldr	z22, [x11]
	incb	x21, all, mul #2
	rdvl	x11, #17
	movprfx	z24, z2
	sdot	z24.d, z4.h, z22.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z22.h
	lsl	x11, x11, 2
	lsl	x21, x21, 1
	movprfx	z26, z2
	sdot	z26.d, z9.h, z22.h
	add	x11, sp, x11
	movprfx	z27, z2
	sdot	z27.d, z6.h, z22.h
	add	x11, x11, 112
	ldr	z21, [x11]
	sdot	z24.d, z3.h, z21.h
	addvl	x11, x21, #2
	sdot	z25.d, z19.h, z21.h
	sdot	z26.d, z8.h, z21.h
	add	x11, x11, 112
	sdot	z27.d, z17.h, z21.h
	cntb	x21
	add	x11, sp, x11
	ldr	z20, [x11]
	sdot	z24.d, z16.h, z20.h
	add	x11, x1, 320
	sdot	z24.d, z7.h, z23.h
	sdot	z25.d, z15.h, z20.h
	sdot	z25.d, z14.h, z23.h
	sdot	z26.d, z11.h, z20.h
	sdot	z27.d, z13.h, z20.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 480
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 512
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 544
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 576
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 448
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 608
	ld1h	z21.h, p7/z, [x11]
	lsl	x21, x21, 5
	add	x11, x3, 640
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 672
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 704
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 576
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 736
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 768
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 800
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 832
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 704
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 864
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 896
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 928
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 960
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 832
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 992
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1024
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 1056
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1088
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 960
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1120
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1152
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1184
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 1216
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 1088
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1248
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1280
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 1312
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1344
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 1216
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1376
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1408
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1440
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 1472
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 1344
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1504
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1536
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 1568
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1600
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 1472
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1632
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1664
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1696
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 1728
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 1600
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1760
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1792
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 1824
	ld1h	z22.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1856
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x11]
	sdot	z24.d, z16.h, z22.h
	add	x11, x1, 1728
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 1888
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 1920
	ld1h	z20.h, p7/z, [x11]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x11, x3, 1952
	ld1h	z22.h, p7/z, [x11]
	sdot	z24.d, z3.h, z21.h
	add	x11, x3, 1984
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x11]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x11, x1, 1856
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #4
	rshrnb	z25.h, z27.s, #4
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x11]
	add	x11, x3, 2016
	ld1h	z24.h, p7/z, [x11]
	add	x11, x3, 2048
	ld1h	z23.h, p7/z, [x11]
	add	x11, x3, 2080
	ld1h	z25.h, p7/z, [x11]
	movprfx	z27, z2
	sdot	z27.d, z4.h, z23.h
	add	x11, x3, 2112
	sdot	z27.d, z3.h, z24.h
	ld1h	z26.h, p7/z, [x11]
	sdot	z27.d, z16.h, z25.h
	add	x11, x1, 1984
	sdot	z27.d, z7.h, z26.h
	movprfx	z22, z2
	sdot	z22.d, z9.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z6.h, z23.h
	sdot	z22.d, z8.h, z24.h
	sdot	z21.d, z17.h, z24.h
	sdot	z22.d, z11.h, z25.h
	sdot	z21.d, z13.h, z25.h
	sdot	z22.d, z10.h, z26.h
	sdot	z21.d, z12.h, z26.h
	movprfx	z20, z2
	sdot	z20.d, z18.h, z23.h
	uzp1	z22.s, z27.s, z22.s
	sdot	z20.d, z19.h, z24.h
	sdot	z20.d, z15.h, z25.h
	sdot	z20.d, z14.h, z26.h
	rshrnb	z26.h, z22.s, #4
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z27.h, z21.s, #4
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x11]
	addvl	x11, sp, #28
	add	x11, x11, 112
	ldr	z10, [x11]
	cntb	x11
	lsl	x11, x11, 5
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z25, [x11]
	zip1	z20.d, z10.d, z25.d
	addvl	x11, sp, #30
	trn2	z24.d, z10.d, z25.d
	add	x11, x11, 112
	ldr	z26, [x11]
	rdvl	x11, #17
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z11, [x11]
	ldr	z21, [x11]
	cntb	x11, all, mul #9
	zip1	z27.d, z26.d, z11.d
	zip1	z20.d, z20.d, z27.d
	lsl	x11, x11, 2
	trn2	z27.d, z26.d, z21.d
	zip1	z24.d, z24.d, z27.d
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z10, [x11]
	cntb	x11, all, mul #5
	lsl	x11, x11, 3
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z25, [x11]
	zip1	z21.d, z10.d, z25.d
	rdvl	x11, #19
	trn2	z25.d, z10.d, z25.d
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z26, [x11]
	rdvl	x11, #21
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z8, [x11]
	ldr	z10, [x11]
	cntb	x11, all, mul #11
	zip1	z27.d, z26.d, z8.d
	zip1	z21.d, z21.d, z27.d
	lsl	x11, x11, 2
	trn2	z27.d, z26.d, z10.d
	zip1	z25.d, z25.d, z27.d
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z10, [x11]
	cntb	x11, all, mul #3
	lsl	x11, x11, 4
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z26, [x11]
	zip1	z22.d, z10.d, z26.d
	rdvl	x11, #23
	trn2	z26.d, z10.d, z26.d
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z9, [x11]
	mov	z10.d, z9.d
	rdvl	x11, #25
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z23, [x11]
	zip1	z27.d, z9.d, z23.d
	ldr	z9, [x11]
	cntb	x11, all, mul #13
	zip1	z22.d, z22.d, z27.d
	lsl	x11, x11, 2
	trn2	z27.d, z10.d, z9.d
	zip1	z26.d, z26.d, z27.d
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z10, [x11]
	cntb	x11, all, mul #7
	lsl	x11, x11, 3
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z8, [x11]
	zip1	z23.d, z10.d, z8.d
	rdvl	x11, #27
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z9, [x11]
	rdvl	x11, #29
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z17, [x11]
	zip1	z27.d, z9.d, z17.d
	zip1	z23.d, z23.d, z27.d
	trn2	z27.d, z10.d, z8.d
	mov	z10.d, z9.d
	ldr	z9, [x11]
	add	x11, x3, 2144
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2176
	trn2	z15.d, z10.d, z9.d
	ld1h	z12.h, p7/z, [x11]
	add	x11, x1, 128
	zip1	z27.d, z27.d, z15.d
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2208
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2240
	ld1h	z12.h, p7/z, [x11]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x11, x1, 384
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2272
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2304
	ld1h	z12.h, p7/z, [x11]
	add	x11, x1, 640
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2336
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2368
	ld1h	z12.h, p7/z, [x11]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x11, x1, 896
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2400
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2432
	ld1h	z12.h, p7/z, [x11]
	add	x11, x1, 1152
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2464
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2496
	ld1h	z12.h, p7/z, [x11]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x11, x1, 1408
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2528
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 2560
	ld1h	z12.h, p7/z, [x11]
	add	x11, x1, 1664
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #4
	rshrnb	z13.h, z15.s, #4
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x11]
	add	x11, x3, 2592
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 2624
	ld1h	z14.h, p7/z, [x11]
	movprfx	z13, z2
	sdot	z13.d, z24.h, z14.h
	add	x11, x1, 1920
	movprfx	z24, z2
	sdot	z24.d, z25.h, z14.h
	movprfx	z25, z2
	sdot	z25.d, z26.h, z14.h
	movprfx	z26, z2
	sdot	z26.d, z27.h, z14.h
	sdot	z26.d, z23.h, z15.h
	sdot	z13.d, z20.h, z15.h
	sdot	z24.d, z21.h, z15.h
	sdot	z25.d, z22.h, z15.h
	uzp1	z24.s, z13.s, z24.s
	uzp1	z25.s, z25.s, z26.s
	rshrnb	z26.h, z24.s, #4
	rshrnb	z27.h, z25.s, #4
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x11]
	addvl	x11, sp, #29
	add	x11, x11, 112
	ldr	z10, [x11]
	addvl	x11, x21, #1
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 1
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z24.d, z10.d, z26.d
	addvl	x11, sp, #31
	add	x11, x11, 112
	ldr	z10, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #9
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z27.d, z10.d, z26.d
	addvl	x11, x21, #1
	cntb	x21, all, mul #5
	zip1	z24.d, z24.d, z27.d
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	ldr	z10, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #5
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z25.d, z10.d, z26.d
	addvl	x11, x21, #-1
	rdvl	x21, #21
	add	x11, x11, 112
	lsl	x21, x21, 1
	add	x11, sp, x11
	ldr	z10, [x11]
	addvl	x11, x21, #1
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z27.d, z10.d, z26.d
	cntb	x11, all, mul #3
	zip1	z25.d, z25.d, z27.d
	lsl	x21, x11, 4
	sub	x11, x21, x11
	cntb	x21, all, mul #3
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	ldr	z10, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #3
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z26.d, z10.d, z26.d
	addvl	x11, x21, #-1
	cntb	x21, all, mul #13
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	ldr	z10, [x11]
	cntb	x11, all, mul #3
	add	x11, x11, x11, lsl 4
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z20, [x11]
	zip1	z27.d, z10.d, z20.d
	addvl	x11, x21, #1
	cntb	x21, all, mul #7
	zip1	z26.d, z26.d, z27.d
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	ldr	z10, [x11]
	addvl	x11, x21, #1
	cntb	x21, all, mul #15
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	ldr	z20, [x11]
	zip1	z27.d, z10.d, z20.d
	cntb	x11, all, mul #11
	add	x11, x11, x11, lsl 2
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z10, [x11]
	addvl	x11, x21, #-1
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z20, [x11]
	zip1	z23.d, z10.d, z20.d
	add	x11, x3, 2656
	zip1	z27.d, z27.d, z23.d
	ld1h	z23.h, p7/z, [x11]
	add	x11, x1, 256
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #4
	rshrnb	z15.h, z22.s, #4
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 2688
	ld1h	z23.h, p7/z, [x11]
	add	x11, x1, 768
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #4
	rshrnb	z15.h, z22.s, #4
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 2720
	ld1h	z23.h, p7/z, [x11]
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	add	x11, x1, 1280
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #4
	rshrnb	z15.h, z22.s, #4
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 2752
	ld1h	z23.h, p7/z, [x11]
	add	x11, x1, 1792
	movprfx	z22, z2
	sdot	z22.d, z24.h, z23.h
	movprfx	z24, z2
	sdot	z24.d, z25.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z26.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z27.h, z23.h
	uzp1	z24.s, z22.s, z24.s
	uzp1	z25.s, z25.s, z26.s
	rshrnb	z26.h, z24.s, #4
	rshrnb	z27.h, z25.s, #4
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x11]
	add	x11, sp, 112
	ldr	z26, [x11]
	addvl	x11, sp, #2
	zip1	z27.d, z26.d, z30.d
	add	x11, x11, 112
	ldr	z25, [x11]
	zip2	z30.d, z26.d, z30.d
	zip1	z26.d, z25.d, z28.d
	zip2	z28.d, z25.d, z28.d
	zip1	z25.d, z27.d, z26.d
	zip2	z26.d, z27.d, z26.d
	zip1	z27.d, z30.d, z28.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z28.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z23, [x11]
	addvl	x11, sp, #4
	add	x11, x11, 112
	ldr	z28, [x11]
	ldr	z10, [x11]
	addvl	x11, sp, #3
	zip1	z24.d, z23.d, z28.d
	zip2	z28.d, z23.d, z10.d
	add	x11, x11, 112
	ldr	z22, [x11]
	addvl	x11, sp, #5
	add	x11, x11, 112
	ldr	z21, [x11]
	zip1	z23.d, z22.d, z21.d
	zip2	z21.d, z22.d, z21.d
	zip1	z22.d, z24.d, z23.d
	zip2	z23.d, z24.d, z23.d
	zip1	z24.d, z28.d, z21.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z21.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z21.s, z25.h, z28.h
	saddlb	z20.s, z30.h, z22.h
	saddlt	z28.s, z25.h, z28.h
	saddlt	z30.s, z30.h, z22.h
	add	z21.s, z21.s, z20.s
	add	z25.s, z28.s, z30.s
	saddlb	z30.s, z26.h, z24.h
	saddlb	z28.s, z27.h, z23.h
	saddlt	z26.s, z26.h, z24.h
	saddlt	z27.s, z27.h, z23.h
	add	z30.s, z30.s, z28.s
	add	z27.s, z26.s, z27.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z27.s, z30.s
	zip1	z28.s, z21.s, z25.s
	zip2	z27.s, z27.s, z30.s
	add	z28.s, z28.s, z26.s
	zip2	z21.s, z21.s, z25.s
	add	z27.s, z21.s, z27.s
	uzp2	z26.d, z28.d, z27.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z28.d, z28.d, z27.d
	add	x11, x3, 2784
	add	z25.s, z26.s, z28.s
	sub	z30.s, z28.s, z26.s
	ld1w	z26.s, p7/z, [x11]
	movprfx	z23, z25
	mul	z23.s, p7/m, z23.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	add	x11, x3, 2816
	ld1w	z27.s, p7/z, [x11]
	movprfx	z24, z30
	mul	z24.s, p7/m, z24.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	add	x11, x3, 2848
	ld1w	z21.s, p7/z, [x11]
	mul	z25.s, p7/m, z25.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	add	x11, x3, 2880
	ld1w	z22.s, p7/z, [x11]
	mul	z30.s, p7/m, z30.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #6
	add	x11, x11, 112
	ldr	z20, [x11]
	zip1	z28.d, z20.d, z31.d
	addvl	x11, sp, #8
	zip2	z31.d, z20.d, z31.d
	add	x11, x11, 112
	ldr	z20, [x11]
	ldr	z10, [x11]
	zip1	z20.d, z20.d, z29.d
	zip2	z29.d, z10.d, z29.d
	zip1	z19.d, z28.d, z20.d
	zip2	z20.d, z28.d, z20.d
	zip1	z28.d, z31.d, z29.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z29.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #7
	add	x11, x11, 112
	ldr	z29, [x11]
	addvl	x11, sp, #10
	add	x11, x11, 112
	ldr	z9, [x11]
	ldr	z10, [x11]
	addvl	x11, sp, #9
	zip1	z18.d, z29.d, z9.d
	zip2	z29.d, z29.d, z10.d
	add	x11, x11, 112
	ldr	z10, [x11]
	addvl	x11, sp, #11
	add	x11, x11, 112
	ldr	z9, [x11]
	ldr	z13, [x11]
	zip1	z17.d, z10.d, z9.d
	zip2	z15.d, z10.d, z13.d
	zip1	z16.d, z18.d, z17.d
	zip2	z17.d, z18.d, z17.d
	zip1	z18.d, z29.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	saddlb	z15.s, z19.h, z29.h
	saddlt	z19.s, z19.h, z29.h
	saddlb	z14.s, z31.h, z16.h
	saddlb	z29.s, z20.h, z18.h
	saddlt	z31.s, z31.h, z16.h
	saddlt	z20.s, z20.h, z18.h
	add	z31.s, z19.s, z31.s
	add	z15.s, z15.s, z14.s
	saddlb	z19.s, z28.h, z17.h
	saddlt	z28.s, z28.h, z17.h
	add	z29.s, z29.s, z19.s
	add	z28.s, z20.s, z28.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip1	z19.s, z28.s, z29.s
	zip1	z20.s, z15.s, z31.s
	zip2	z28.s, z28.s, z29.s
	add	z20.s, z20.s, z19.s
	zip2	z15.s, z15.s, z31.s
	add	z28.s, z15.s, z28.s
	uzp2	z29.d, z20.d, z28.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z20.d, z28.d
	add	z20.s, z29.s, z31.s
	sub	z31.s, z31.s, z29.s
	movprfx	z18, z20
	mul	z18.s, p7/m, z18.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	movprfx	z19, z31
	mul	z19.s, p7/m, z19.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	mul	z20.s, p7/m, z20.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	mul	z31.s, p7/m, z31.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #12
	add	x11, x11, 112
	ldr	z28, [x11]
	addvl	x11, sp, #16
	add	x11, x11, 112
	ldr	z10, [x11]
	zip1	z29.d, z28.d, z10.d
	addvl	x11, sp, #14
	zip2	z28.d, z28.d, z10.d
	add	x11, x11, 112
	ldr	z16, [x11]
	addvl	x11, sp, #18
	add	x11, x11, 112
	ldr	z10, [x11]
	ldr	z13, [x11]
	zip1	z17.d, z16.d, z10.d
	zip2	z15.d, z16.d, z13.d
	zip1	z16.d, z29.d, z17.d
	zip2	z17.d, z29.d, z17.d
	zip1	z29.d, z28.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #13
	add	x11, x11, 112
	ldr	z15, [x11]
	addvl	x11, sp, #17
	add	x11, x11, 112
	ldr	z13, [x11]
	zip1	z14.d, z15.d, z13.d
	addvl	x11, sp, #15
	zip2	z15.d, z15.d, z13.d
	add	x11, x11, 112
	ldr	z12, [x11]
	addvl	x11, sp, #19
	add	x11, x11, 112
	ldr	z10, [x11]
	zip1	z13.d, z12.d, z10.d
	zip2	z11.d, z12.d, z10.d
	zip1	z12.d, z14.d, z13.d
	zip2	z13.d, z14.d, z13.d
	zip1	z14.d, z15.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z14.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	zip2	z15.d, z15.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	saddlb	z11.s, z16.h, z15.h
	saddlt	z16.s, z16.h, z15.h
	saddlb	z10.s, z28.h, z12.h
	saddlb	z15.s, z29.h, z13.h
	saddlt	z28.s, z28.h, z12.h
	saddlt	z29.s, z29.h, z13.h
	add	z28.s, z16.s, z28.s
	add	z11.s, z11.s, z10.s
	saddlb	z16.s, z17.h, z14.h
	saddlt	z17.s, z17.h, z14.h
	add	z16.s, z16.s, z15.s
	add	z29.s, z17.s, z29.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z17.s, z11.s, z28.s
	zip1	z15.s, z29.s, z16.s
	zip2	z11.s, z11.s, z28.s
	add	z17.s, z17.s, z15.s
	zip2	z29.s, z29.s, z16.s
	add	z29.s, z11.s, z29.s
	uzp2	z28.d, z17.d, z29.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	uzp1	z17.d, z17.d, z29.d
	add	z16.s, z28.s, z17.s
	sub	z29.s, z17.s, z28.s
	movprfx	z14, z16
	mul	z14.s, p7/m, z14.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z14.s, p5/m, z14.s, z14.s
// 0 "" 2
#NO_APP
	movprfx	z15, z29
	mul	z15.s, p7/m, z15.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z15.s, p5/m, z15.s, z15.s
// 0 "" 2
#NO_APP
	mul	z16.s, p7/m, z16.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z16.s, p5/m, z16.s, z16.s
// 0 "" 2
#NO_APP
	mul	z29.s, p7/m, z29.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #20
	add	x11, x11, 112
	ldr	z7, [x11]
	addvl	x11, sp, #24
	add	x11, x11, 112
	ldr	z17, [x11]
	ldr	z13, [x11]
	addvl	x11, sp, #22
	zip1	z28.d, z7.d, z17.d
	zip2	z17.d, z7.d, z13.d
	add	x11, x11, 112
	ldr	z6, [x11]
	addvl	x11, sp, #26
	add	x11, x11, 112
	ldr	z12, [x11]
	ldr	z10, [x11]
	zip1	z13.d, z6.d, z12.d
	zip2	z11.d, z6.d, z10.d
	zip1	z12.d, z28.d, z13.d
	zip2	z13.d, z28.d, z13.d
	zip1	z28.d, z17.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip2	z17.d, z17.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #21
	add	x11, x11, 112
	ldr	z11, [x11]
	addvl	x11, sp, #25
	add	x11, x11, 112
	ldr	z9, [x11]
	zip1	z10.d, z11.d, z9.d
	addvl	x11, sp, #23
	zip2	z11.d, z11.d, z9.d
	add	x11, x11, 112
	ldr	z8, [x11]
	addvl	x11, sp, #27
	add	x11, x11, 112
	ldr	z7, [x11]
	zip1	z9.d, z8.d, z7.d
	zip2	z7.d, z8.d, z7.d
	zip1	z8.d, z10.d, z9.d
	zip2	z9.d, z10.d, z9.d
	zip1	z10.d, z11.d, z7.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z10.d, p6/m, z10.d
// 0 "" 2
#NO_APP
	zip2	z11.d, z11.d, z7.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z11.d, p6/m, z11.d
// 0 "" 2
#NO_APP
	saddlb	z7.s, z12.h, z11.h
	saddlt	z12.s, z12.h, z11.h
	saddlb	z6.s, z17.h, z8.h
	saddlb	z11.s, z28.h, z9.h
	saddlt	z17.s, z17.h, z8.h
	saddlt	z28.s, z28.h, z9.h
	add	z17.s, z12.s, z17.s
	add	z7.s, z7.s, z6.s
	saddlb	z12.s, z13.h, z10.h
	saddlt	z13.s, z13.h, z10.h
	add	z12.s, z12.s, z11.s
	add	z28.s, z13.s, z28.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z12.d, p6/m, z12.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip1	z13.s, z7.s, z17.s
	zip1	z11.s, z28.s, z12.s
	zip2	z7.s, z7.s, z17.s
	add	z13.s, z13.s, z11.s
	zip2	z28.s, z28.s, z12.s
	add	z28.s, z7.s, z28.s
	uzp2	z17.d, z13.d, z28.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	uzp1	z13.d, z13.d, z28.d
	add	z28.s, z17.s, z13.s
	sub	z13.s, z13.s, z17.s
	mul	z26.s, p7/m, z26.s, z28.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	mul	z27.s, p7/m, z27.s, z13.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	mul	z28.s, p7/m, z28.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	mul	z13.s, p7/m, z13.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z13.s, p5/m, z13.s, z13.s
// 0 "" 2
#NO_APP
	uzp1	z10.s, z23.s, z23.s
	uzp1	z23.s, z26.s, z26.s
	uzp1	z22.s, z14.s, z14.s
	uzp1	z26.s, z25.s, z25.s
	tbl	z22.s, {z22.s - z23.s}, z0.s
	uzp1	z23.s, z19.s, z19.s
	uzp1	z19.s, z27.s, z27.s
	uzp1	z27.s, z20.s, z20.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	uzp1	z27.s, z28.s, z28.s
	rshrnb	z22.h, z22.s, #4
	uzp1	z22.h, z22.h, z22.h
	str	q26, [x1, 1024]
	uzp1	z26.s, z16.s, z16.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	uzp1	z11.s, z18.s, z18.s
	uzp1	z27.s, z31.s, z31.s
	tbl	z10.s, {z10.s - z11.s}, z0.s
	uzp1	z18.s, z15.s, z15.s
	rshrnb	z10.h, z10.s, #4
	tbl	z18.s, {z18.s - z19.s}, z0.s
	uzp1	z10.h, z10.h, z10.h
	rshrnb	z18.h, z18.s, #4
	uzp1	z31.s, z13.s, z13.s
	uzp1	z18.h, z18.h, z18.h
	add	x1, x1, 32
	stp	q10, q22, [x1, -32]
	uzp1	z22.s, z24.s, z24.s
	tbl	z22.s, {z22.s - z23.s}, z0.s
	rshrnb	z22.h, z22.s, #4
	uzp1	z22.h, z22.h, z22.h
	add	x17, x17, x4
	stp	q22, q18, [x1, 480]
	add	x16, x16, x4
	add	x15, x15, x4
	str	q26, [x1, 1008]
	uzp1	z26.s, z30.s, z30.s
	uzp1	z30.s, z29.s, z29.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	tbl	z30.s, {z30.s - z31.s}, z0.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z30.h, z30.s, #4
	uzp1	z26.h, z26.h, z26.h
	uzp1	z30.h, z30.h, z30.h
	str	q26, [x1, 1504]
	add	x14, x14, x4
	add	x10, x10, x4
	str	q30, [x1, 1520]
	add	x13, x13, x4
	add	x7, x7, x4
	add	x12, x12, x4
	add	x5, x5, x4
	add	x9, x9, x4
	add	x8, x8, x4
	add	x6, x6, x4
	cmp	x19, x1
	bne	.L2
	mov	x13, 71
	cntb	x12
	ldr	x21, [sp, 32]
	mul	x12, x12, x13
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 48]
	ldp	d10, d11, [sp, 64]
	ldp	d12, d13, [sp, 80]
	ldp	d14, d15, [sp, 96]
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	add	sp, sp, x12
	.cfi_def_cfa_offset 112
	add	sp, sp, 112
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9op_pass_4PKsPsl, .-_ZL9op_pass_4PKsPsl
	.align	2
	.p2align 5,,15
	.type	_ZL10op_pass_11PKsPsl.constprop.0, %function
_ZL10op_pass_11PKsPsl.constprop.0:
.LFB12:
	.cfi_startproc
	cntb	x12
	mov	x13, 71
	ptrue	p7.b, all
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	movi	d2, #0
	add	x3, x2, 32
	mul	x12, x12, x13
	ld1w	z0.s, p7/z, [x3]
	add	x3, x2, 64
	ld1h	z1.h, p7/z, [x3]
	cntb	x5, all, mul #15
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x38,0x2,0x1e,0x22
	add	x3, x2, 96
	ld1h	z31.h, p7/z, [x3]
	sub	sp, sp, #64
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x38,0x2,0x1e,0x23,0x40,0x22
	cntb	x3, all, mul #15
	ld1h	z5.h, p7/z, [x2]
	lsl	x3, x3, 2
	lsl	x5, x5, 2
	add	x3, sp, x3
	add	x4, x0, 2048
	add	x3, x3, 64
	stp	d8, d9, [sp]
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	str	z31, [x3]
	add	x3, x2, 128
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5
	add	x3, x3, 64
	lsl	x5, x5, 6
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 160
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 192
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #-1
	cntb	x5
	add	x3, x3, 64
	lsl	x5, x5, 6
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 224
	ld1h	z31.h, p7/z, [x3]
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 256
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #2
	add	x3, x3, 64
	lsl	x5, x5, 5
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 288
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #2
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 320
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #-1
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 352
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 384
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	add	x3, x3, 64
	incb	x5, all, mul #2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 416
	ld1h	z31.h, p7/z, [x3]
	lsl	x5, x5, 1
	addvl	x3, x5, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
.L7:
	add	x3, x0, 32
	ld1h	z23.h, p7/z, [x3]
	ld1h	z30.h, p7/z, [x0]
	addvl	x3, sp, #1
	rev	z31.h, z23.h
	sub	z21.h, z30.h, z31.h
	add	x3, x3, 64
	str	z23, [x3]
	add	z31.h, z30.h, z31.h
	add	x3, sp, 64
	str	z30, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #28
	sub	z10.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z10, [x3]
	tbl	z30.h, {z31.h}, z1.h
	addvl	x3, sp, #29
	sub	z31.h, z31.h, z30.h
	cntb	x5
	add	x3, x3, 64
	str	z31, [x3]
	lsl	x5, x5, 5
	add	x3, x0, 64
	ld1h	z29.h, p7/z, [x3]
	ptrue	p6.d, all
	add	x3, x0, 96
	ld1h	z22.h, p7/z, [x3]
	rev	z31.h, z22.h
	addvl	x3, sp, #3
	sub	z20.h, z29.h, z31.h
	add	z31.h, z29.h, z31.h
	add	x3, x3, 64
	str	z22, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #2
	sub	z28.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z29, [x3]
	tbl	z30.h, {z31.h}, z1.h
	addvl	x3, sp, #30
	sub	z27.h, z31.h, z30.h
	add	x3, x3, 64
	str	z28, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 64
	str	z27, [x3]
	add	x3, x0, 128
	ld1h	z30.h, p7/z, [x3]
	add	x3, x0, 160
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #4
	add	x3, x3, 64
	str	z31, [x3]
	rev	z31.h, z31.h
	cntb	x3
	sub	z8.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	lsl	x3, x3, 5
	rev	z29.h, z31.h
	sub	z27.h, z31.h, z29.h
	add	x3, sp, x3
	add	z31.h, z31.h, z29.h
	tbl	z29.h, {z31.h}, z1.h
	add	x3, x3, 64
	str	z27, [x3]
	sub	z24.h, z31.h, z29.h
	addvl	x3, x5, #1
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	str	z24, [x3]
	add	x3, x0, 192
	ld1h	z28.h, p7/z, [x3]
	add	x3, x0, 224
	ld1h	z27.h, p7/z, [x3]
	rev	z31.h, z27.h
	addvl	x3, sp, #5
	sub	z9.h, z28.h, z31.h
	add	z31.h, z28.h, z31.h
	add	x3, x3, 64
	str	z27, [x3]
	rev	z29.h, z31.h
	rdvl	x3, #17
	sub	z24.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	lsl	x3, x3, 1
	tbl	z29.h, {z31.h}, z1.h
	sub	z19.h, z31.h, z29.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z24, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #9
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z19, [x3]
	add	x3, x0, 256
	ld1h	z27.h, p7/z, [x3]
	add	x3, x0, 288
	ld1h	z24.h, p7/z, [x3]
	rev	z31.h, z24.h
	addvl	x3, sp, #7
	sub	z23.h, z27.h, z31.h
	add	z31.h, z27.h, z31.h
	add	x3, x3, 64
	str	z24, [x3]
	rev	z29.h, z31.h
	addvl	x3, sp, #6
	sub	z19.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	add	x3, x3, 64
	str	z27, [x3]
	tbl	z29.h, {z31.h}, z1.h
	cntb	x3, all, mul #9
	sub	z18.h, z31.h, z29.h
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z19, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	str	z18, [x3]
	add	x3, x0, 320
	ld1h	z24.h, p7/z, [x3]
	add	x3, x0, 352
	ld1h	z13.h, p7/z, [x3]
	rev	z31.h, z13.h
	addvl	x3, sp, #9
	sub	z22.h, z24.h, z31.h
	add	z31.h, z24.h, z31.h
	add	x3, x3, 64
	str	z13, [x3]
	rev	z29.h, z31.h
	addvl	x3, sp, #8
	sub	z18.h, z31.h, z29.h
	add	z31.h, z31.h, z29.h
	add	x3, x3, 64
	str	z24, [x3]
	tbl	z29.h, {z31.h}, z1.h
	rdvl	x3, #19
	sub	z17.h, z31.h, z29.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z18, [x3]
	addvl	x3, x5, #-1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	str	z17, [x3]
	add	x3, x0, 384
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 416
	ld1h	z12.h, p7/z, [x3]
	rev	z29.h, z12.h
	addvl	x3, sp, #10
	sub	z10.h, z31.h, z29.h
	add	z29.h, z31.h, z29.h
	add	x3, x3, 64
	str	z12, [x3]
	rev	z27.h, z29.h
	cntb	x3, all, mul #5
	sub	z17.h, z29.h, z27.h
	add	z29.h, z29.h, z27.h
	lsl	x3, x3, 3
	tbl	z27.h, {z29.h}, z1.h
	sub	z16.h, z29.h, z27.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z17, [x3]
	addvl	x3, x5, #1
	rdvl	x5, #21
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	str	z16, [x3]
	add	x3, x0, 448
	ld1h	z29.h, p7/z, [x3]
	add	x3, x0, 480
	ld1h	z18.h, p7/z, [x3]
	rev	z27.h, z18.h
	addvl	x3, sp, #11
	sub	z11.h, z29.h, z27.h
	add	z27.h, z29.h, z27.h
	add	x3, x3, 64
	str	z18, [x3]
	rev	z26.h, z27.h
	rdvl	x3, #21
	sub	z16.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	lsl	x3, x3, 1
	tbl	z26.h, {z27.h}, z1.h
	sub	z15.h, z27.h, z26.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z16, [x3]
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	add	x3, x0, 512
	ld1h	z18.h, p7/z, [x3]
	add	x3, x0, 544
	ld1h	z15.h, p7/z, [x3]
	rev	z27.h, z15.h
	addvl	x3, sp, #13
	sub	z25.h, z18.h, z27.h
	add	z27.h, z18.h, z27.h
	add	x3, x3, 64
	str	z15, [x3]
	rev	z26.h, z27.h
	addvl	x3, sp, #12
	sub	z14.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x3, x3, 64
	str	z18, [x3]
	tbl	z26.h, {z27.h}, z1.h
	cntb	x3, all, mul #11
	sub	z7.h, z27.h, z26.h
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z14, [x3]
	cntb	x3, all, mul #3
	lsl	x5, x3, 4
	sub	x3, x5, x3
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	str	z7, [x3]
	add	x3, x0, 576
	ld1h	z17.h, p7/z, [x3]
	add	x3, x0, 608
	ld1h	z16.h, p7/z, [x3]
	rev	z27.h, z16.h
	addvl	x3, sp, #15
	sub	z24.h, z17.h, z27.h
	add	z27.h, z17.h, z27.h
	add	x3, x3, 64
	str	z16, [x3]
	rev	z26.h, z27.h
	addvl	x3, sp, #14
	sub	z7.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x3, x3, 64
	str	z17, [x3]
	tbl	z26.h, {z27.h}, z1.h
	rdvl	x3, #23
	sub	z6.h, z27.h, z26.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z7, [x3]
	addvl	x3, x5, #-1
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	str	z6, [x3]
	add	x3, x0, 640
	ld1h	z15.h, p7/z, [x3]
	add	x3, x0, 672
	ld1h	z14.h, p7/z, [x3]
	rev	z27.h, z14.h
	addvl	x3, sp, #17
	sub	z12.h, z15.h, z27.h
	add	z27.h, z15.h, z27.h
	add	x3, x3, 64
	str	z14, [x3]
	rev	z26.h, z27.h
	addvl	x3, sp, #16
	sub	z6.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x3, x3, 64
	str	z15, [x3]
	tbl	z26.h, {z27.h}, z1.h
	cntb	x3, all, mul #3
	sub	z4.h, z27.h, z26.h
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z6, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #13
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z4, [x3]
	add	x3, x0, 704
	ld1h	z14.h, p7/z, [x3]
	add	x3, x0, 736
	ld1h	z7.h, p7/z, [x3]
	rev	z27.h, z7.h
	addvl	x3, sp, #19
	sub	z13.h, z14.h, z27.h
	add	z27.h, z14.h, z27.h
	add	x3, x3, 64
	str	z7, [x3]
	rev	z26.h, z27.h
	addvl	x3, sp, #18
	sub	z4.h, z27.h, z26.h
	add	z27.h, z27.h, z26.h
	add	x3, x3, 64
	str	z14, [x3]
	tbl	z26.h, {z27.h}, z1.h
	rdvl	x3, #25
	sub	z3.h, z27.h, z26.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z4, [x3]
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z3, [x3]
	add	x3, x0, 768
	ld1h	z7.h, p7/z, [x3]
	add	x3, x0, 800
	ld1h	z6.h, p7/z, [x3]
	rev	z26.h, z6.h
	addvl	x3, sp, #21
	sub	z27.h, z7.h, z26.h
	add	z26.h, z7.h, z26.h
	add	x3, x3, 64
	str	z6, [x3]
	rev	z15.h, z26.h
	addvl	x3, sp, #20
	sub	z3.h, z26.h, z15.h
	add	z26.h, z26.h, z15.h
	add	x3, x3, 64
	str	z7, [x3]
	tbl	z15.h, {z26.h}, z1.h
	cntb	x3, all, mul #13
	sub	z4.h, z26.h, z15.h
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z3, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #7
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	str	z4, [x3]
	add	x3, x0, 832
	ld1h	z6.h, p7/z, [x3]
	add	x3, x0, 864
	ld1h	z4.h, p7/z, [x3]
	rev	z15.h, z4.h
	addvl	x3, sp, #23
	sub	z26.h, z6.h, z15.h
	add	z15.h, z6.h, z15.h
	add	x3, x3, 64
	str	z4, [x3]
	rev	z14.h, z15.h
	addvl	x3, sp, #22
	sub	z3.h, z15.h, z14.h
	add	z15.h, z15.h, z14.h
	add	x3, x3, 64
	str	z6, [x3]
	tbl	z14.h, {z15.h}, z1.h
	rdvl	x3, #27
	sub	z19.h, z15.h, z14.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z3, [x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z19, [x3]
	add	x3, x0, 896
	ld1h	z4.h, p7/z, [x3]
	add	x3, x0, 928
	ld1h	z3.h, p7/z, [x3]
	rev	z15.h, z3.h
	addvl	x3, sp, #25
	sub	z14.h, z4.h, z15.h
	add	z15.h, z4.h, z15.h
	add	x3, x3, 64
	str	z3, [x3]
	rev	z7.h, z15.h
	addvl	x3, sp, #24
	sub	z19.h, z15.h, z7.h
	add	z15.h, z15.h, z7.h
	add	x3, x3, 64
	str	z4, [x3]
	tbl	z7.h, {z15.h}, z1.h
	cntb	x3, all, mul #7
	sub	z17.h, z15.h, z7.h
	zip1	z4.d, z21.d, z8.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z19, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #15
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z17, [x3]
	add	x3, x0, 960
	ld1h	z3.h, p7/z, [x3]
	add	x3, x0, 992
	ld1h	z19.h, p7/z, [x3]
	rev	z7.h, z19.h
	addvl	x3, sp, #27
	sub	z15.h, z3.h, z7.h
	add	z7.h, z3.h, z7.h
	add	x3, x3, 64
	str	z19, [x3]
	rev	z6.h, z7.h
	addvl	x3, sp, #26
	sub	z17.h, z7.h, z6.h
	add	z7.h, z7.h, z6.h
	add	x3, x3, 64
	str	z3, [x3]
	tbl	z6.h, {z7.h}, z1.h
	rdvl	x3, #29
	sub	z16.h, z7.h, z6.h
	trn2	z7.d, z21.d, z8.d
	lsl	x3, x3, 1
	trn1	z21.d, z21.d, z8.d
	trn2	z6.d, z20.d, z9.d
	add	x3, sp, x3
	zip1	z3.d, z20.d, z9.d
	trn1	z20.d, z20.d, z9.d
	add	x3, x3, 64
	str	z17, [x3]
	zip1	z9.d, z23.d, z10.d
	addvl	x3, x5, #-1
	cntb	x5, all, mul #15
	zip1	z8.d, z22.d, z11.d
	add	x3, x3, 64
	lsl	x5, x5, 2
	zip1	z3.d, z4.d, z3.d
	add	x3, sp, x3
	str	z16, [x3]
	zip2	z16.d, z21.d, z20.d
	addvl	x3, x5, #1
	trn2	z21.d, z23.d, z10.d
	trn1	z23.d, z23.d, z10.d
	trn2	z20.d, z22.d, z11.d
	add	x3, x3, 64
	trn1	z22.d, z22.d, z11.d
	zip2	z11.d, z23.d, z22.d
	trn2	z23.d, z25.d, z12.d
	zip1	z4.d, z7.d, z6.d
	zip2	z10.d, z21.d, z20.d
	zip2	z7.d, z7.d, z6.d
	zip1	z8.d, z9.d, z8.d
	trn2	z22.d, z24.d, z13.d
	zip1	z9.d, z21.d, z20.d
	zip1	z6.d, z23.d, z22.d
	zip1	z21.d, z25.d, z12.d
	add	x3, sp, x3
	trn1	z25.d, z25.d, z12.d
	zip2	z12.d, z23.d, z22.d
	zip1	z23.d, z27.d, z14.d
	zip1	z22.d, z26.d, z15.d
	zip1	z19.d, z23.d, z22.d
	ldr	z23, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	cntb	x5
	zip1	z20.d, z24.d, z13.d
	add	x3, sp, x3
	lsl	x5, x5, 6
	zip1	z17.d, z21.d, z20.d
	add	x3, x3, 64
	ldr	z22, [x3]
	trn1	z24.d, z24.d, z13.d
	rdvl	x3, #31
	zip2	z13.d, z25.d, z24.d
	trn2	z24.d, z26.d, z15.d
	lsl	x3, x3, 1
	trn2	z25.d, z27.d, z14.d
	trn1	z26.d, z26.d, z15.d
	add	x3, sp, x3
	zip1	z18.d, z25.d, z24.d
	trn1	z27.d, z27.d, z14.d
	add	x3, x3, 64
	ldr	z21, [x3]
	zip2	z15.d, z27.d, z26.d
	addvl	x3, x5, #-1
	cntb	x5
	zip2	z14.d, z25.d, z24.d
	add	x3, x3, 64
	movprfx	z24, z2
	sdot	z24.d, z9.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z23.h
	add	x3, sp, x3
	ldr	z20, [x3]
	sdot	z24.d, z8.h, z22.h
	add	x3, x1, 64
	sdot	z24.d, z11.h, z21.h
	sdot	z25.d, z19.h, z22.h
	sdot	z24.d, z10.h, z20.h
	sdot	z25.d, z15.h, z21.h
	lsl	x5, x5, 6
	sdot	z25.d, z14.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z4.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z6.h, z23.h
	sdot	z27.d, z3.h, z22.h
	sdot	z26.d, z17.h, z22.h
	sdot	z27.d, z16.h, z21.h
	sdot	z26.d, z13.h, z21.h
	sdot	z27.d, z7.h, z20.h
	sdot	z26.d, z12.h, z20.h
	uzp1	z27.s, z27.s, z24.s
	uzp1	z26.s, z26.s, z25.s
	rshrnb	z24.h, z27.s, #11
	rshrnb	z25.h, z26.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #2
	add	x3, x3, 64
	lsl	x5, x5, 5
	add	x3, sp, x3
	ldr	z23, [x3]
	movprfx	z24, z2
	sdot	z24.d, z9.h, z23.h
	cntb	x3
	movprfx	z25, z2
	sdot	z25.d, z18.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z4.h, z23.h
	lsl	x3, x3, 6
	movprfx	z27, z2
	sdot	z27.d, z6.h, z23.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
	sdot	z24.d, z8.h, z22.h
	addvl	x3, x5, #2
	rdvl	x5, #17
	sdot	z25.d, z19.h, z22.h
	add	x3, x3, 64
	lsl	x5, x5, 2
	sdot	z26.d, z3.h, z22.h
	add	x3, sp, x3
	ldr	z21, [x3]
	sdot	z24.d, z11.h, z21.h
	addvl	x3, x5, #-1
	sdot	z25.d, z15.h, z21.h
	rdvl	x5, #17
	add	x3, x3, 64
	sdot	z26.d, z16.h, z21.h
	sdot	z27.d, z17.h, z22.h
	add	x3, sp, x3
	ldr	z20, [x3]
	sdot	z24.d, z10.h, z20.h
	sdot	z25.d, z14.h, z20.h
	add	x3, x1, 192
	sdot	z26.d, z7.h, z20.h
	sdot	z27.d, z13.h, z21.h
	lsl	x5, x5, 2
	sdot	z27.d, z12.h, z20.h
	uzp1	z26.s, z26.s, z24.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 448
	ld1h	z23.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #2
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	ldr	z22, [x3]
	incb	x5, all, mul #2
	rdvl	x3, #17
	movprfx	z24, z2
	sdot	z24.d, z4.h, z22.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z22.h
	lsl	x3, x3, 2
	lsl	x5, x5, 1
	movprfx	z26, z2
	sdot	z26.d, z9.h, z22.h
	add	x3, sp, x3
	movprfx	z27, z2
	sdot	z27.d, z6.h, z22.h
	add	x3, x3, 64
	ldr	z21, [x3]
	sdot	z24.d, z3.h, z21.h
	addvl	x3, x5, #2
	sdot	z25.d, z19.h, z21.h
	sdot	z26.d, z8.h, z21.h
	add	x3, x3, 64
	sdot	z27.d, z17.h, z21.h
	cntb	x5
	add	x3, sp, x3
	ldr	z20, [x3]
	sdot	z24.d, z16.h, z20.h
	add	x3, x1, 320
	sdot	z24.d, z7.h, z23.h
	sdot	z25.d, z15.h, z20.h
	sdot	z25.d, z14.h, z23.h
	sdot	z26.d, z11.h, z20.h
	sdot	z27.d, z13.h, z20.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 480
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 512
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 544
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 576
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 448
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 608
	ld1h	z21.h, p7/z, [x3]
	lsl	x5, x5, 5
	add	x3, x2, 640
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 672
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 704
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 576
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 736
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 768
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 800
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 832
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 704
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 864
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 896
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 928
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 960
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 832
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 992
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1024
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1056
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1088
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 960
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1120
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1152
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1184
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 1216
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 1088
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1248
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1280
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1312
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1344
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 1216
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1376
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1408
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1440
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 1472
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 1344
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1504
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1536
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1568
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1600
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 1472
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1632
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1664
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1696
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 1728
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 1600
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1760
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1792
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1824
	ld1h	z22.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1856
	sdot	z24.d, z3.h, z21.h
	ld1h	z23.h, p7/z, [x3]
	sdot	z24.d, z16.h, z22.h
	add	x3, x1, 1728
	sdot	z24.d, z7.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 1888
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 1920
	ld1h	z20.h, p7/z, [x3]
	movprfx	z24, z2
	sdot	z24.d, z4.h, z20.h
	add	x3, x2, 1952
	ld1h	z22.h, p7/z, [x3]
	sdot	z24.d, z3.h, z21.h
	add	x3, x2, 1984
	sdot	z24.d, z16.h, z22.h
	ld1h	z23.h, p7/z, [x3]
	movprfx	z25, z2
	sdot	z25.d, z18.h, z20.h
	sdot	z24.d, z7.h, z23.h
	add	x3, x1, 1856
	sdot	z25.d, z19.h, z21.h
	sdot	z25.d, z15.h, z22.h
	sdot	z25.d, z14.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z9.h, z20.h
	movprfx	z27, z2
	sdot	z27.d, z6.h, z20.h
	sdot	z26.d, z8.h, z21.h
	sdot	z27.d, z17.h, z21.h
	sdot	z26.d, z11.h, z22.h
	sdot	z27.d, z13.h, z22.h
	sdot	z26.d, z10.h, z23.h
	sdot	z27.d, z12.h, z23.h
	uzp1	z26.s, z24.s, z26.s
	uzp1	z27.s, z27.s, z25.s
	rshrnb	z24.h, z26.s, #11
	rshrnb	z25.h, z27.s, #11
	tbl	z24.h, {z24.h - z25.h}, z5.h
	st1h	z24.h, p7, [x3]
	add	x3, x2, 2016
	ld1h	z24.h, p7/z, [x3]
	add	x3, x2, 2048
	ld1h	z23.h, p7/z, [x3]
	add	x3, x2, 2080
	ld1h	z25.h, p7/z, [x3]
	movprfx	z27, z2
	sdot	z27.d, z4.h, z23.h
	add	x3, x2, 2112
	sdot	z27.d, z3.h, z24.h
	ld1h	z26.h, p7/z, [x3]
	sdot	z27.d, z16.h, z25.h
	add	x3, x1, 1984
	sdot	z27.d, z7.h, z26.h
	movprfx	z22, z2
	sdot	z22.d, z9.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z6.h, z23.h
	sdot	z22.d, z8.h, z24.h
	sdot	z21.d, z17.h, z24.h
	sdot	z22.d, z11.h, z25.h
	sdot	z21.d, z13.h, z25.h
	sdot	z22.d, z10.h, z26.h
	sdot	z21.d, z12.h, z26.h
	movprfx	z20, z2
	sdot	z20.d, z18.h, z23.h
	uzp1	z22.s, z27.s, z22.s
	sdot	z20.d, z19.h, z24.h
	sdot	z20.d, z15.h, z25.h
	sdot	z20.d, z14.h, z26.h
	rshrnb	z26.h, z22.s, #11
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z27.h, z21.s, #11
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z10, [x3]
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
	zip1	z20.d, z10.d, z25.d
	addvl	x3, sp, #30
	trn2	z24.d, z10.d, z25.d
	add	x3, x3, 64
	ldr	z26, [x3]
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	ldr	z21, [x3]
	cntb	x3, all, mul #9
	zip1	z27.d, z26.d, z11.d
	zip1	z20.d, z20.d, z27.d
	lsl	x3, x3, 2
	trn2	z27.d, z26.d, z21.d
	zip1	z24.d, z24.d, z27.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
	zip1	z21.d, z10.d, z25.d
	rdvl	x3, #19
	trn2	z25.d, z10.d, z25.d
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
	ldr	z10, [x3]
	cntb	x3, all, mul #11
	zip1	z27.d, z26.d, z8.d
	zip1	z21.d, z21.d, z27.d
	lsl	x3, x3, 2
	trn2	z27.d, z26.d, z10.d
	zip1	z25.d, z25.d, z27.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
	zip1	z22.d, z10.d, z26.d
	rdvl	x3, #23
	trn2	z26.d, z10.d, z26.d
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	mov	z10.d, z9.d
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
	zip1	z27.d, z9.d, z23.d
	ldr	z9, [x3]
	cntb	x3, all, mul #13
	zip1	z22.d, z22.d, z27.d
	lsl	x3, x3, 2
	trn2	z27.d, z10.d, z9.d
	zip1	z26.d, z26.d, z27.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
	zip1	z23.d, z10.d, z8.d
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
	zip1	z27.d, z9.d, z17.d
	zip1	z23.d, z23.d, z27.d
	trn2	z27.d, z10.d, z8.d
	mov	z10.d, z9.d
	ldr	z9, [x3]
	add	x3, x2, 2144
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2176
	trn2	z15.d, z10.d, z9.d
	ld1h	z12.h, p7/z, [x3]
	add	x3, x1, 128
	zip1	z27.d, z27.d, z15.d
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2208
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2240
	ld1h	z12.h, p7/z, [x3]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x3, x1, 384
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2272
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2304
	ld1h	z12.h, p7/z, [x3]
	add	x3, x1, 640
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2336
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2368
	ld1h	z12.h, p7/z, [x3]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x3, x1, 896
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2400
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2432
	ld1h	z12.h, p7/z, [x3]
	add	x3, x1, 1152
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2464
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2496
	ld1h	z12.h, p7/z, [x3]
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	add	x3, x1, 1408
	sdot	z10.d, z20.h, z13.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2528
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 2560
	ld1h	z12.h, p7/z, [x3]
	add	x3, x1, 1664
	movprfx	z10, z2
	sdot	z10.d, z24.h, z12.h
	movprfx	z14, z2
	sdot	z14.d, z25.h, z12.h
	sdot	z10.d, z20.h, z13.h
	movprfx	z15, z2
	sdot	z15.d, z26.h, z12.h
	movprfx	z11, z2
	sdot	z11.d, z27.h, z12.h
	sdot	z14.d, z21.h, z13.h
	sdot	z11.d, z23.h, z13.h
	sdot	z15.d, z22.h, z13.h
	uzp1	z14.s, z10.s, z14.s
	uzp1	z15.s, z15.s, z11.s
	rshrnb	z12.h, z14.s, #11
	rshrnb	z13.h, z15.s, #11
	tbl	z12.h, {z12.h - z13.h}, z5.h
	st1h	z12.h, p7, [x3]
	add	x3, x2, 2592
	ld1h	z15.h, p7/z, [x3]
	add	x3, x2, 2624
	ld1h	z14.h, p7/z, [x3]
	movprfx	z13, z2
	sdot	z13.d, z24.h, z14.h
	add	x3, x1, 1920
	movprfx	z24, z2
	sdot	z24.d, z25.h, z14.h
	movprfx	z25, z2
	sdot	z25.d, z26.h, z14.h
	movprfx	z26, z2
	sdot	z26.d, z27.h, z14.h
	sdot	z26.d, z23.h, z15.h
	sdot	z13.d, z20.h, z15.h
	sdot	z24.d, z21.h, z15.h
	sdot	z25.d, z22.h, z15.h
	uzp1	z24.s, z13.s, z24.s
	uzp1	z25.s, z25.s, z26.s
	rshrnb	z26.h, z24.s, #11
	rshrnb	z27.h, z25.s, #11
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x3]
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z10, [x3]
	addvl	x3, x5, #1
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z24.d, z10.d, z26.d
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z10, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #9
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z27.d, z10.d, z26.d
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	zip1	z24.d, z24.d, z27.d
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	ldr	z10, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z25.d, z10.d, z26.d
	addvl	x3, x5, #-1
	rdvl	x5, #21
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	ldr	z10, [x3]
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z27.d, z10.d, z26.d
	cntb	x3, all, mul #3
	zip1	z25.d, z25.d, z27.d
	lsl	x5, x3, 4
	sub	x3, x5, x3
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	ldr	z10, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z26.d, z10.d, z26.d
	addvl	x3, x5, #-1
	cntb	x5, all, mul #13
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	ldr	z10, [x3]
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
	zip1	z27.d, z10.d, z20.d
	addvl	x3, x5, #1
	cntb	x5, all, mul #7
	zip1	z26.d, z26.d, z27.d
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	ldr	z10, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #15
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	ldr	z20, [x3]
	zip1	z27.d, z10.d, z20.d
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
	zip1	z23.d, z10.d, z20.d
	add	x3, x2, 2656
	zip1	z27.d, z27.d, z23.d
	ld1h	z23.h, p7/z, [x3]
	add	x3, x1, 256
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #11
	rshrnb	z15.h, z22.s, #11
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 2688
	ld1h	z23.h, p7/z, [x3]
	add	x3, x1, 768
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #11
	rshrnb	z15.h, z22.s, #11
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 2720
	ld1h	z23.h, p7/z, [x3]
	movprfx	z15, z2
	sdot	z15.d, z25.h, z23.h
	add	x3, x1, 1280
	movprfx	z21, z2
	sdot	z21.d, z24.h, z23.h
	movprfx	z22, z2
	sdot	z22.d, z26.h, z23.h
	movprfx	z20, z2
	sdot	z20.d, z27.h, z23.h
	uzp1	z21.s, z21.s, z15.s
	uzp1	z22.s, z22.s, z20.s
	rshrnb	z14.h, z21.s, #11
	rshrnb	z15.h, z22.s, #11
	tbl	z14.h, {z14.h - z15.h}, z5.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 2752
	ld1h	z23.h, p7/z, [x3]
	add	x3, x1, 1792
	movprfx	z22, z2
	sdot	z22.d, z24.h, z23.h
	movprfx	z24, z2
	sdot	z24.d, z25.h, z23.h
	movprfx	z25, z2
	sdot	z25.d, z26.h, z23.h
	movprfx	z26, z2
	sdot	z26.d, z27.h, z23.h
	uzp1	z24.s, z22.s, z24.s
	uzp1	z25.s, z25.s, z26.s
	rshrnb	z26.h, z24.s, #11
	rshrnb	z27.h, z25.s, #11
	tbl	z26.h, {z26.h - z27.h}, z5.h
	st1h	z26.h, p7, [x3]
	add	x3, sp, 64
	ldr	z26, [x3]
	addvl	x3, sp, #2
	zip1	z27.d, z26.d, z30.d
	add	x3, x3, 64
	ldr	z25, [x3]
	zip2	z30.d, z26.d, z30.d
	zip1	z26.d, z25.d, z28.d
	zip2	z28.d, z25.d, z28.d
	zip1	z25.d, z27.d, z26.d
	zip2	z26.d, z27.d, z26.d
	zip1	z27.d, z30.d, z28.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z28.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z23, [x3]
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z28, [x3]
	ldr	z10, [x3]
	addvl	x3, sp, #3
	zip1	z24.d, z23.d, z28.d
	zip2	z28.d, z23.d, z10.d
	add	x3, x3, 64
	ldr	z22, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z21, [x3]
	zip1	z23.d, z22.d, z21.d
	zip2	z21.d, z22.d, z21.d
	zip1	z22.d, z24.d, z23.d
	zip2	z23.d, z24.d, z23.d
	zip1	z24.d, z28.d, z21.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z21.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z21.s, z25.h, z28.h
	saddlb	z20.s, z30.h, z22.h
	saddlt	z28.s, z25.h, z28.h
	saddlt	z30.s, z30.h, z22.h
	add	z21.s, z21.s, z20.s
	add	z25.s, z28.s, z30.s
	saddlb	z30.s, z26.h, z24.h
	saddlb	z28.s, z27.h, z23.h
	saddlt	z26.s, z26.h, z24.h
	saddlt	z27.s, z27.h, z23.h
	add	z30.s, z30.s, z28.s
	add	z27.s, z26.s, z27.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z27.s, z30.s
	zip1	z28.s, z21.s, z25.s
	zip2	z27.s, z27.s, z30.s
	add	z28.s, z28.s, z26.s
	zip2	z21.s, z21.s, z25.s
	add	z27.s, z21.s, z27.s
	uzp2	z26.d, z28.d, z27.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z28.d, z28.d, z27.d
	add	x3, x2, 2784
	add	z25.s, z26.s, z28.s
	sub	z30.s, z28.s, z26.s
	ld1w	z26.s, p7/z, [x3]
	movprfx	z23, z25
	mul	z23.s, p7/m, z23.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	add	x3, x2, 2816
	ld1w	z27.s, p7/z, [x3]
	movprfx	z24, z30
	mul	z24.s, p7/m, z24.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	add	x3, x2, 2848
	ld1w	z21.s, p7/z, [x3]
	mul	z25.s, p7/m, z25.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	add	x3, x2, 2880
	ld1w	z22.s, p7/z, [x3]
	mul	z30.s, p7/m, z30.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z20, [x3]
	zip1	z28.d, z20.d, z31.d
	addvl	x3, sp, #8
	zip2	z31.d, z20.d, z31.d
	add	x3, x3, 64
	ldr	z20, [x3]
	ldr	z10, [x3]
	zip1	z20.d, z20.d, z29.d
	zip2	z29.d, z10.d, z29.d
	zip1	z19.d, z28.d, z20.d
	zip2	z20.d, z28.d, z20.d
	zip1	z28.d, z31.d, z29.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z29.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z29, [x3]
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z9, [x3]
	ldr	z10, [x3]
	addvl	x3, sp, #9
	zip1	z18.d, z29.d, z9.d
	zip2	z29.d, z29.d, z10.d
	add	x3, x3, 64
	ldr	z10, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z9, [x3]
	ldr	z13, [x3]
	zip1	z17.d, z10.d, z9.d
	zip2	z15.d, z10.d, z13.d
	zip1	z16.d, z18.d, z17.d
	zip2	z17.d, z18.d, z17.d
	zip1	z18.d, z29.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	saddlb	z15.s, z19.h, z29.h
	saddlt	z19.s, z19.h, z29.h
	saddlb	z14.s, z31.h, z16.h
	saddlb	z29.s, z20.h, z18.h
	saddlt	z31.s, z31.h, z16.h
	saddlt	z20.s, z20.h, z18.h
	add	z31.s, z19.s, z31.s
	add	z15.s, z15.s, z14.s
	saddlb	z19.s, z28.h, z17.h
	saddlt	z28.s, z28.h, z17.h
	add	z29.s, z29.s, z19.s
	add	z28.s, z20.s, z28.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip1	z19.s, z28.s, z29.s
	zip1	z20.s, z15.s, z31.s
	zip2	z28.s, z28.s, z29.s
	add	z20.s, z20.s, z19.s
	zip2	z15.s, z15.s, z31.s
	add	z28.s, z15.s, z28.s
	uzp2	z29.d, z20.d, z28.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z20.d, z28.d
	add	z20.s, z29.s, z31.s
	sub	z31.s, z31.s, z29.s
	movprfx	z18, z20
	mul	z18.s, p7/m, z18.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	movprfx	z19, z31
	mul	z19.s, p7/m, z19.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	mul	z20.s, p7/m, z20.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	mul	z31.s, p7/m, z31.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z10, [x3]
	zip1	z29.d, z28.d, z10.d
	addvl	x3, sp, #14
	zip2	z28.d, z28.d, z10.d
	add	x3, x3, 64
	ldr	z16, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z10, [x3]
	ldr	z13, [x3]
	zip1	z17.d, z16.d, z10.d
	zip2	z15.d, z16.d, z13.d
	zip1	z16.d, z29.d, z17.d
	zip2	z17.d, z29.d, z17.d
	zip1	z29.d, z28.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z15.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z15, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z13, [x3]
	zip1	z14.d, z15.d, z13.d
	addvl	x3, sp, #15
	zip2	z15.d, z15.d, z13.d
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z10, [x3]
	zip1	z13.d, z12.d, z10.d
	zip2	z11.d, z12.d, z10.d
	zip1	z12.d, z14.d, z13.d
	zip2	z13.d, z14.d, z13.d
	zip1	z14.d, z15.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z14.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	zip2	z15.d, z15.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	saddlb	z11.s, z16.h, z15.h
	saddlt	z16.s, z16.h, z15.h
	saddlb	z10.s, z28.h, z12.h
	saddlb	z15.s, z29.h, z13.h
	saddlt	z28.s, z28.h, z12.h
	saddlt	z29.s, z29.h, z13.h
	add	z28.s, z16.s, z28.s
	add	z11.s, z11.s, z10.s
	saddlb	z16.s, z17.h, z14.h
	saddlt	z17.s, z17.h, z14.h
	add	z16.s, z16.s, z15.s
	add	z29.s, z17.s, z29.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z17.s, z11.s, z28.s
	zip1	z15.s, z29.s, z16.s
	zip2	z11.s, z11.s, z28.s
	add	z17.s, z17.s, z15.s
	zip2	z29.s, z29.s, z16.s
	add	z29.s, z11.s, z29.s
	uzp2	z28.d, z17.d, z29.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	uzp1	z17.d, z17.d, z29.d
	add	z16.s, z28.s, z17.s
	sub	z29.s, z17.s, z28.s
	movprfx	z14, z16
	mul	z14.s, p7/m, z14.s, z26.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z14.s, p5/m, z14.s, z14.s
// 0 "" 2
#NO_APP
	movprfx	z15, z29
	mul	z15.s, p7/m, z15.s, z27.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z15.s, p5/m, z15.s, z15.s
// 0 "" 2
#NO_APP
	mul	z16.s, p7/m, z16.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z16.s, p5/m, z16.s, z16.s
// 0 "" 2
#NO_APP
	mul	z29.s, p7/m, z29.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z7, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z17, [x3]
	ldr	z13, [x3]
	addvl	x3, sp, #22
	zip1	z28.d, z7.d, z17.d
	zip2	z17.d, z7.d, z13.d
	add	x3, x3, 64
	ldr	z6, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z12, [x3]
	ldr	z10, [x3]
	zip1	z13.d, z6.d, z12.d
	zip2	z11.d, z6.d, z10.d
	zip1	z12.d, z28.d, z13.d
	zip2	z13.d, z28.d, z13.d
	zip1	z28.d, z17.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip2	z17.d, z17.d, z11.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z9, [x3]
	zip1	z10.d, z11.d, z9.d
	addvl	x3, sp, #23
	zip2	z11.d, z11.d, z9.d
	add	x3, x3, 64
	ldr	z8, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z7, [x3]
	zip1	z9.d, z8.d, z7.d
	zip2	z7.d, z8.d, z7.d
	zip1	z8.d, z10.d, z9.d
	zip2	z9.d, z10.d, z9.d
	zip1	z10.d, z11.d, z7.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z10.d, p6/m, z10.d
// 0 "" 2
#NO_APP
	zip2	z11.d, z11.d, z7.d
#APP
// 28 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z11.d, p6/m, z11.d
// 0 "" 2
#NO_APP
	saddlb	z7.s, z12.h, z11.h
	saddlt	z12.s, z12.h, z11.h
	saddlb	z6.s, z17.h, z8.h
	saddlb	z11.s, z28.h, z9.h
	saddlt	z17.s, z17.h, z8.h
	saddlt	z28.s, z28.h, z9.h
	add	z17.s, z12.s, z17.s
	add	z7.s, z7.s, z6.s
	saddlb	z12.s, z13.h, z10.h
	saddlt	z13.s, z13.h, z10.h
	add	z12.s, z12.s, z11.s
	add	z28.s, z13.s, z28.s
#APP
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z12.d, p6/m, z12.d
// 0 "" 2
// 37 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip1	z13.s, z7.s, z17.s
	zip1	z11.s, z28.s, z12.s
	zip2	z7.s, z7.s, z17.s
	add	z13.s, z13.s, z11.s
	zip2	z28.s, z28.s, z12.s
	add	z28.s, z7.s, z28.s
	uzp2	z17.d, z13.d, z28.d
#APP
// 46 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	uzp1	z13.d, z13.d, z28.d
	add	z28.s, z17.s, z13.s
	sub	z13.s, z13.s, z17.s
	mul	z26.s, p7/m, z26.s, z28.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	mul	z27.s, p7/m, z27.s, z13.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	mul	z28.s, p7/m, z28.s, z21.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	mul	z13.s, p7/m, z13.s, z22.s
#APP
// 55 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z13.s, p5/m, z13.s, z13.s
// 0 "" 2
#NO_APP
	uzp1	z10.s, z23.s, z23.s
	uzp1	z23.s, z26.s, z26.s
	uzp1	z22.s, z14.s, z14.s
	uzp1	z26.s, z25.s, z25.s
	tbl	z22.s, {z22.s - z23.s}, z0.s
	uzp1	z23.s, z19.s, z19.s
	uzp1	z19.s, z27.s, z27.s
	uzp1	z27.s, z20.s, z20.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z26.h, z26.h, z26.h
	uzp1	z27.s, z28.s, z28.s
	rshrnb	z22.h, z22.s, #11
	uzp1	z22.h, z22.h, z22.h
	str	q26, [x1, 1024]
	uzp1	z26.s, z16.s, z16.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z26.h, z26.h, z26.h
	uzp1	z11.s, z18.s, z18.s
	uzp1	z27.s, z31.s, z31.s
	tbl	z10.s, {z10.s - z11.s}, z0.s
	uzp1	z18.s, z15.s, z15.s
	rshrnb	z10.h, z10.s, #11
	tbl	z18.s, {z18.s - z19.s}, z0.s
	uzp1	z10.h, z10.h, z10.h
	rshrnb	z18.h, z18.s, #11
	uzp1	z31.s, z13.s, z13.s
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 1024
	stp	q10, q22, [x1]
	uzp1	z22.s, z24.s, z24.s
	tbl	z22.s, {z22.s - z23.s}, z0.s
	rshrnb	z22.h, z22.s, #11
	uzp1	z22.h, z22.h, z22.h
	add	x1, x1, 32
	stp	q22, q18, [x1, 480]
	str	q26, [x1, 1008]
	uzp1	z26.s, z30.s, z30.s
	uzp1	z30.s, z29.s, z29.s
	tbl	z26.s, {z26.s - z27.s}, z0.s
	tbl	z30.s, {z30.s - z31.s}, z0.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z30.h, z30.s, #11
	uzp1	z26.h, z26.h, z26.h
	uzp1	z30.h, z30.h, z30.h
	str	q26, [x1, 1504]
	str	q30, [x1, 1520]
	cmp	x4, x0
	bne	.L7
	mov	x13, 71
	cntb	x12
	ldp	d8, d9, [sp]
	mul	x12, x12, x13
	ldp	d10, d11, [sp, 16]
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	add	sp, sp, x12
	.cfi_def_cfa_offset 64
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL10op_pass_11PKsPsl.constprop.0, .-_ZL10op_pass_11PKsPsl.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB11:
	.cfi_startproc
	sub	sp, sp, #2080
	.cfi_def_cfa_offset 2080
	stp	x29, x30, [sp]
	.cfi_offset 29, -2080
	.cfi_offset 30, -2072
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -2064
	mov	x19, x1
	add	x1, sp, 32
	bl	_ZL9op_pass_4PKsPsl
	mov	x1, x19
	add	x0, sp, 32
	bl	_ZL10op_pass_11PKsPsl.constprop.0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	add	sp, sp, 2080
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	dynopt_dct32_sve2_shared, .-dynopt_dct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL10IDX_EVEN16, %object
	.size	_ZL10IDX_EVEN16, 32
_ZL10IDX_EVEN16:
	.hword	0
	.hword	2
	.hword	4
	.hword	6
	.hword	8
	.hword	10
	.hword	12
	.hword	14
	.hword	16
	.hword	18
	.hword	20
	.hword	22
	.hword	24
	.hword	26
	.hword	28
	.hword	30
	.type	_ZL6IDX_S8, %object
	.size	_ZL6IDX_S8, 32
_ZL6IDX_S8:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	10
	.word	11
	.type	_ZL8IDX_REV8, %object
	.size	_ZL8IDX_REV8, 32
_ZL8IDX_REV8:
	.hword	7
	.hword	6
	.hword	5
	.hword	4
	.hword	3
	.hword	2
	.hword	1
	.hword	0
	.hword	15
	.hword	14
	.hword	13
	.hword	12
	.hword	11
	.hword	10
	.hword	9
	.hword	8
	.type	_ZL4CODD, %object
	.size	_ZL4CODD, 2048
_ZL4CODD:
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.type	_ZL3K2S, %object
	.size	_ZL3K2S, 512
_ZL3K2S:
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
	.type	_ZL3K4S, %object
	.size	_ZL3K4S, 128
_ZL3K4S:
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
	.type	_ZL6K0EVEN, %object
	.size	_ZL6K0EVEN, 128
_ZL6K0EVEN:
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
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
