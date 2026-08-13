	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_Z11pass32_implILi4EEvPKsPsl, %function
_Z11pass32_implILi4EEvPKsPsl:
.LFB8:
	.cfi_startproc
	addvl	sp, sp, #-20
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #80
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x23,0x50,0x22
	add	x3, x3, :lo12:.LANCHOR0
	add	x4, x3, 32
	add	x7, x0, 32
	add	x10, x1, 64
	add	x9, x2, x2, lsl 1
	stp	d10, d11, [sp, 16]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	ld1h	z10.h, p7/z, [x4]
	add	x4, x3, 64
	ld1h	z11.h, p7/z, [x4]
	add	x4, x3, 96
	ld1h	z2.h, p7/z, [x4]
	add	x4, x3, 128
	ld1h	z5.h, p7/z, [x4]
	stp	d14, d15, [sp, 48]
	add	x4, x3, 160
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1h	z15.h, p7/z, [x4]
	add	x4, x3, 192
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	ld1h	z12.h, p7/z, [x4]
	add	x4, x3, 224
	ld1h	z13.h, p7/z, [x4]
	add	x4, x3, 256
	ld1h	z3.h, p7/z, [x4]
	stp	d8, d9, [sp]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	add	x4, x3, 288
	ld1h	z4.h, p7/z, [x4]
	ld1w	z9.s, p7/z, [x3]
	add	x4, x3, 320
	ld1h	z0.h, p7/z, [x4]
	add	x4, x3, 352
	ld1h	z7.h, p7/z, [x4]
	add	x4, x3, 384
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 416
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 448
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 480
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 512
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #10
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 544
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 576
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 608
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 640
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 672
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 704
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #16
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 736
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #17
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 768
	ld1h	z31.h, p7/z, [x4]
	ldr	q17, [x3, 2912]
	addvl	x4, sp, #18
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 800
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #19
	add	x4, x4, 64
	str	z31, [x4]
	.p2align 5,,15
.L2:
	ld1h	z20.h, p7/z, [x0]
	ld1h	z31.h, p7/z, [x7]
	sunpklo	z29.s, z20.h
	rev	z31.h, z31.h
	addvl	x4, sp, #4
	sunpklo	z30.s, z31.h
	add	z29.s, z29.s, z30.s
	sub	z8.h, z20.h, z31.h
	sunpkhi	z28.s, z31.h
	add	x4, x4, 64
	sunpkhi	z30.s, z20.h
	add	z20.h, z20.h, z31.h
	add	z30.s, z30.s, z28.s
	rev	z31.h, z20.h
	rev	z30.s, z30.s
	add	z30.s, z29.s, z30.s
	rev	z29.s, z30.s
	sub	z20.h, z20.h, z31.h
	add	z31.s, z30.s, z29.s
	sub	z30.s, z30.s, z29.s
	tbl	z29.s, {z31.s}, z9.s
	add	z28.s, z31.s, z29.s
	str	z28, [x4]
	addvl	x4, sp, #5
	sub	z27.s, z31.s, z29.s
	add	x4, x4, 64
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	ld1h	z28.h, p7/z, [x7, x2, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z26.s, z28.h
	str	z27, [x4]
	sunpklo	z27.s, z29.h
	addvl	x4, sp, #2
	add	z27.s, z27.s, z26.s
	sub	z31.h, z29.h, z28.h
	sunpkhi	z26.s, z28.h
	add	x4, x4, 64
	sunpkhi	z24.s, z29.h
	add	z29.h, z29.h, z28.h
	add	z24.s, z24.s, z26.s
	rev	z28.h, z29.h
	rev	z24.s, z24.s
	add	z24.s, z27.s, z24.s
	rev	z27.s, z24.s
	sub	z29.h, z29.h, z28.h
	add	z28.s, z24.s, z27.s
	sub	z24.s, z24.s, z27.s
	tbl	z27.s, {z28.s}, z9.s
	add	z26.s, z28.s, z27.s
	str	z26, [x4]
	addvl	x4, sp, #3
	add	x4, x4, 64
	sub	z25.s, z28.s, z27.s
	str	z25, [x4]
	add	x4, x0, x2, lsl 2
	ld1h	z21.h, p7/z, [x4]
	sunpklo	z27.s, z21.h
	add	x4, x7, x2, lsl 2
	ld1h	z28.h, p7/z, [x4]
	rev	z28.h, z28.h
	sunpklo	z26.s, z28.h
	sub	z14.h, z21.h, z28.h
	add	z27.s, z27.s, z26.s
	sunpkhi	z25.s, z21.h
	sunpkhi	z26.s, z28.h
	add	z21.h, z21.h, z28.h
	rev	z28.h, z21.h
	add	x4, sp, 64
	sub	z21.h, z21.h, z28.h
	add	z25.s, z25.s, z26.s
	rev	z25.s, z25.s
	add	z25.s, z27.s, z25.s
	rev	z27.s, z25.s
	add	z28.s, z25.s, z27.s
	sub	z25.s, z25.s, z27.s
	tbl	z27.s, {z28.s}, z9.s
	add	z23.s, z28.s, z27.s
	sub	z22.s, z28.s, z27.s
	ld1h	z28.h, p7/z, [x7, x9, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z26.s, z28.h
	str	z23, [x4]
	addvl	x4, sp, #1
	ld1h	z23.h, p7/z, [x0, x9, lsl 1]
	add	x4, x4, 64
	sub	z18.h, z23.h, z28.h
	sunpklo	z27.s, z23.h
	add	z27.s, z27.s, z26.s
	sunpkhi	z26.s, z28.h
	str	z22, [x4]
	sunpkhi	z22.s, z23.h
	add	z23.h, z23.h, z28.h
	rev	z28.h, z23.h
	add	z22.s, z22.s, z26.s
	sub	z23.h, z23.h, z28.h
	rev	z22.s, z22.s
	add	z22.s, z27.s, z22.s
	rev	z28.s, z22.s
	add	z19.s, z22.s, z28.s
	sub	z22.s, z22.s, z28.s
	tbl	z28.s, {z19.s}, z9.s
	add	z16.s, z19.s, z28.s
	sub	z19.s, z19.s, z28.s
	tbl	z28.h, {z31.h}, z12.h
	tbl	z27.h, {z14.h}, z10.h
	tbl	z26.h, {z8.h}, z10.h
	orr	z26.d, z26.d, z28.d
	tbl	z28.h, {z18.h}, z12.h
	orr	z28.d, z27.d, z28.d
	tbl	z28.h, {z28.h}, z0.h
	tbl	z26.h, {z26.h}, z15.h
	orr	z26.d, z26.d, z28.d
	tbl	z28.h, {z31.h}, z13.h
	tbl	z6.h, {z14.h}, z11.h
	tbl	z27.h, {z8.h}, z11.h
	orr	z27.d, z27.d, z28.d
	tbl	z28.h, {z18.h}, z13.h
	orr	z28.d, z6.d, z28.d
	tbl	z28.h, {z28.h}, z0.h
	tbl	z1.h, {z14.h}, z2.h
	addvl	x4, sp, #6
	tbl	z14.h, {z14.h}, z5.h
	tbl	z27.h, {z27.h}, z15.h
	orr	z27.d, z27.d, z28.d
	tbl	z28.h, {z31.h}, z3.h
	add	x4, x4, 64
	tbl	z6.h, {z8.h}, z2.h
	orr	z6.d, z6.d, z28.d
	tbl	z28.h, {z18.h}, z3.h
	tbl	z18.h, {z18.h}, z4.h
	orr	z18.d, z14.d, z18.d
	tbl	z14.h, {z20.h}, z10.h
	tbl	z18.h, {z18.h}, z0.h
	tbl	z20.h, {z20.h}, z11.h
	tbl	z8.h, {z8.h}, z5.h
	tbl	z31.h, {z31.h}, z4.h
	orr	z31.d, z8.d, z31.d
	tbl	z31.h, {z31.h}, z15.h
	orr	z31.d, z31.d, z18.d
	tbl	z18.h, {z29.h}, z12.h
	tbl	z29.h, {z29.h}, z13.h
	orr	z29.d, z20.d, z29.d
	ldr	z20, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	orr	z14.d, z14.d, z18.d
	tbl	z8.h, {z21.h}, z10.h
	tbl	z18.h, {z23.h}, z12.h
	tbl	z21.h, {z21.h}, z11.h
	tbl	z23.h, {z23.h}, z13.h
	orr	z23.d, z21.d, z23.d
	tbl	z23.h, {z23.h}, z0.h
	tbl	z29.h, {z29.h}, z15.h
	orr	z29.d, z29.d, z23.d
	movi	d23, #0
	movprfx	z21, z23
	sdot	z21.d, z26.h, z7.h
	sdot	z21.d, z27.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 64
	orr	z28.d, z1.d, z28.d
	tbl	z6.h, {z6.h}, z15.h
	tbl	z28.h, {z28.h}, z0.h
	orr	z28.d, z6.d, z28.d
	sdot	z21.d, z28.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #9
	sdot	z21.d, z31.h, z20.h
	add	x4, x4, 64
	ldr	z20, [x4]
	uzp1	z21.s, z21.s, z21.s
	addvl	x4, sp, #10
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	add	x4, x4, 64
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 64]
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	sdot	z21.d, z27.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #12
	sdot	z21.d, z28.h, z20.h
	orr	z18.d, z8.d, z18.d
	add	x4, x4, 64
	ldr	z20, [x4]
	sdot	z21.d, z31.h, z20.h
	addvl	x4, sp, #13
	uzp1	z21.s, z21.s, z21.s
	add	z21.s, z21.s, #8
	add	x4, x4, 64
	ldr	z20, [x4]
	asr	z21.s, z21.s, #4
	addvl	x4, sp, #14
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 192]
	add	x4, x4, 64
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #15
	sdot	z21.d, z27.h, z20.h
	tbl	z14.h, {z14.h}, z15.h
	add	x4, x4, 64
	ldr	z20, [x4]
	sdot	z21.d, z28.h, z20.h
	addvl	x4, sp, #16
	tbl	z18.h, {z18.h}, z0.h
	orr	z18.d, z14.d, z18.d
	add	x4, x4, 64
	ldr	z20, [x4]
	sdot	z21.d, z31.h, z20.h
	addvl	x4, sp, #17
	uzp1	z21.s, z21.s, z21.s
	add	z21.s, z21.s, #8
	add	x4, x4, 64
	ldr	z20, [x4]
	asr	z21.s, z21.s, #4
	addvl	x4, sp, #18
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 320]
	add	x4, x4, 64
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ldr	z20, [x4]
	addvl	x4, sp, #19
	sdot	z21.d, z27.h, z20.h
	ptrue	p6.s, vl4
	add	x4, x4, 64
	ldr	z20, [x4]
	sdot	z21.d, z28.h, z20.h
	add	x4, x3, 832
	ld1h	z20.h, p7/z, [x4]
	sdot	z21.d, z31.h, z20.h
	add	x4, x3, 864
	uzp1	z21.s, z21.s, z21.s
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 448]
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 896
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 928
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 960
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 992
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1024
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 576]
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1056
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1088
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1120
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1152
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 704]
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1184
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1216
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1248
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1280
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 832]
	addvl	x6, sp, #3
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1312
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1344
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1376
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1408
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 960]
	add	x6, x6, 64
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1440
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1472
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1504
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1536
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1088]
	addvl	x5, sp, #5
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1568
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1600
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1632
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1664
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1216]
	add	x5, x5, 64
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1696
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1728
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1760
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1792
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1344]
	addvl	x8, sp, #20
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1824
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1856
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1888
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 1920
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1472]
	add	x8, x8, 64
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1952
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 1984
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2016
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 2048
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1600]
	add	x1, x1, 8
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2080
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2112
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2144
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 2176
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1720]
	add	x0, x0, x2, lsl 3
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2208
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2240
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	add	x4, x3, 2272
	sdot	z21.d, z31.h, z20.h
	ld1h	z20.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z21.s
	add	x4, x3, 2304
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1848]
	add	x7, x7, x2, lsl 3
	movprfx	z21, z23
	sdot	z21.d, z26.h, z20.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x3, 2336
	sdot	z21.d, z27.h, z26.h
	ld1h	z27.h, p7/z, [x4]
	add	x4, x3, 2368
	sdot	z21.d, z28.h, z27.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2400
	sdot	z21.d, z31.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2432
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2464
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2496
	uzp1	z21.s, z21.s, z21.s
	add	z21.s, z21.s, #8
	asr	z21.s, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	d31, [x1, 120]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	str	d21, [x1, 1976]
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2528
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2560
	str	d31, [x1, 376]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2592
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2624
	str	d31, [x1, 632]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2656
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2688
	str	d31, [x1, 888]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2720
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2752
	str	d31, [x1, 1144]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	add	x4, x3, 2784
	sdot	z31.d, z29.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2816
	str	d31, [x1, 1400]
	movprfx	z31, z23
	sdot	z31.d, z18.h, z28.h
	ld1h	z28.h, p7/z, [x4]
	sdot	z31.d, z29.h, z28.h
	uzp1	z31.s, z31.s, z31.s
	add	z31.s, z31.s, #8
	asr	z31.s, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x4, x3, 2848
	str	d31, [x1, 1656]
	ld1h	z31.h, p7/z, [x4]
	add	x4, x3, 2880
	sdot	z23.d, z18.h, z31.h
	ld1h	z31.h, p7/z, [x4]
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z17.s
	sdot	z23.d, z29.h, z31.h
	saddv	d27, p6, z27.s
	movprfx	z28, z24
	mul	z28.s, p7/m, z28.s, z17.s
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z17.s
	saddv	d28, p6, z28.s
	movprfx	z29, z22
	mul	z29.s, p7/m, z29.s, z17.s
	saddv	d31, p6, z31.s
	saddv	d29, p6, z29.s
	uzp1	v31.2s, v31.2s, v28.2s
	addvl	x4, sp, #4
	uzp1	z23.s, z23.s, z23.s
	uzp1	v29.2d, v27.2d, v29.2d
	add	x4, x4, 64
	add	z23.s, z23.s, #8
	movi	v27.4s, 0x8
	asr	z23.s, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1912]
	xtn2	v31.4s, v29.2d
	ldr	q29, [x3, 2928]
	movprfx	z26, z24
	mul	z26.s, p7/m, z26.s, z29.s
	movprfx	z28, z25
	mul	z28.s, p7/m, z28.s, z29.s
	saddv	d26, p6, z26.s
	saddv	d28, p6, z28.s
	add	v31.4s, v31.4s, v27.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 248]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z29.s
	mul	z29.s, p7/m, z29.s, z22.s
	saddv	d31, p6, z31.s
	saddv	d29, p6, z29.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v28.2d, v28.2d, v29.2d
	ldr	q29, [x3, 2944]
	movprfx	z26, z24
	mul	z26.s, p7/m, z26.s, z29.s
	saddv	d26, p6, z26.s
	xtn2	v31.4s, v28.2d
	movprfx	z28, z25
	mul	z28.s, p7/m, z28.s, z29.s
	saddv	d28, p6, z28.s
	add	v31.4s, v31.4s, v27.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 760]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z29.s
	mul	z29.s, p7/m, z29.s, z22.s
	saddv	d31, p6, z31.s
	saddv	d29, p6, z29.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v28.2d, v28.2d, v29.2d
	ldr	z26, [x6]
	fmov	x6, d26
	xtn2	v31.4s, v28.2d
	lsr	x13, x6, 32
	add	x6, sp, 64
	ldr	z28, [x6]
	fmov	x6, d28
	add	v31.4s, v31.4s, v27.4s
	lsr	x16, x6, 32
	addvl	x6, sp, #1
	add	x6, x6, 64
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 1272]
	ldr	q31, [x3, 2960]
	mul	z30.s, p7/m, z30.s, z31.s
	mul	z24.s, p7/m, z24.s, z31.s
	mul	z25.s, p7/m, z25.s, z31.s
	saddv	d30, p6, z30.s
	mul	z31.s, p7/m, z31.s, z22.s
	saddv	d24, p6, z24.s
	saddv	d31, p6, z31.s
	uzp1	v30.2s, v30.2s, v24.2s
	saddv	d25, p6, z25.s
	uzp1	v25.2d, v25.2d, v31.2d
	xtn2	v30.4s, v25.2d
	add	v30.4s, v30.4s, v27.4s
	ldr	z27, [x5]
	fmov	x5, d27
	shrn	v30.4h, v30.4s, 4
	lsr	x14, x5, 32
	addvl	x5, sp, #2
	add	x5, x5, 64
	ldr	z29, [x5]
	fmov	x5, d29
	str	d30, [x1, 1784]
	ldr	z30, [x4]
	ldr	z25, [x6]
	str	d16, [x8]
	fmov	x8, d19
	fmov	x4, d30
	fmov	x6, d25
	lsr	x5, x5, 32
	lsr	x11, x8, 32
	addvl	x8, sp, #20
	add	x8, x8, 72
	lsr	x4, x4, 32
	lsr	x12, x6, 32
	fmov	x6, d16
	str	d19, [x8]
	fmov	x8, d30
	lsr	x6, x6, 32
	add	x18, x4, x8
	fmov	x8, d29
	ubfiz	x18, x18, 2, 58
	fmov	d31, x18
	add	x17, x5, x8
	fmov	x8, d28
	sbfiz	x17, x17, 2, 58
	add	x15, x16, x8
	ins	v31.h[1], w17
	fmov	x8, d16
	fmov	w17, s30
	sbfiz	x15, x15, 2, 58
	ins	v31.h[2], w15
	mov	w15, -64
	add	x8, x6, x8
	smull	x4, w4, w15
	sbfiz	x8, x8, 2, 58
	smull	x5, w5, w15
	smull	x16, w16, w15
	ins	v31.h[3], w8
	mov	w8, 64
	smull	x6, w6, w15
	fmov	w15, s26
	smaddl	x4, w17, w8, x4
	fmov	w17, s29
	str	d31, [x1, -8]
	ubfx	x4, x4, 4, 16
	smaddl	x5, w17, w8, x5
	fmov	d31, x5
	fmov	w5, s28
	sshr	d30, d31, 4
	smaddl	x5, w5, w8, x16
	fmov	d31, x5
	fmov	w5, s16
	sshr	d29, d31, 4
	smaddl	x5, w5, w8, x6
	fmov	w8, s27
	fmov	d31, x5
	mov	w6, 36
	sshr	d28, d31, 4
	fmov	d31, x4
	mov	w4, 83
	smull	x5, w14, w6
	ins	v31.h[1], v30.h[0]
	smaddl	x5, w8, w4, x5
	smull	x8, w13, w6
	smaddl	x8, w15, w4, x8
	fmov	w15, s25
	ins	v31.h[2], v29.h[0]
	add	x5, x5, 8
	add	x8, x8, 8
	ins	v31.h[3], v28.h[0]
	str	d31, [x1, 1016]
	fmov	d31, x8
	smull	x8, w12, w6
	smaddl	x8, w15, w4, x8
	fmov	w15, s19
	sshr	d28, d31, 4
	add	x8, x8, 8
	fmov	d31, x8
	smull	x8, w11, w6
	smaddl	x4, w15, w4, x8
	sshr	d29, d31, 4
	mov	w8, -83
	add	x4, x4, 8
	fmov	d31, x4
	smull	x13, w13, w8
	fmov	w4, s27
	sshr	d30, d31, 4
	fmov	d31, x5
	fmov	w5, s26
	smull	x12, w12, w8
	ushr	d31, d31, 4
	smull	x11, w11, w8
	smull	x14, w14, w8
	smaddl	x4, w4, w6, x14
	smaddl	x5, w5, w6, x13
	ins	v31.h[1], v28.h[0]
	add	x4, x4, 8
	add	x5, x5, 8
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 504]
	fmov	d31, x5
	fmov	w5, s25
	sshr	d29, d31, 4
	smaddl	x5, w5, w6, x12
	add	x5, x5, 8
	fmov	d31, x5
	smaddl	x5, w15, w6, x11
	sshr	d28, d31, 4
	add	x5, x5, 8
	fmov	d31, x5
	sshr	d30, d31, 4
	fmov	d31, x4
	ushr	d31, d31, 4
	ins	v31.h[1], v29.h[0]
	ins	v31.h[2], v28.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 1528]
	cmp	x10, x1
	bne	.L2
	ldp	d8, d9, [sp]
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
	addvl	sp, sp, #20
	.cfi_def_cfa_offset 80
	add	sp, sp, 80
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	_Z11pass32_implILi4EEvPKsPsl, .-_Z11pass32_implILi4EEvPKsPsl
	.align	2
	.p2align 5,,15
	.type	_Z11pass32_implILi11EEvPKsPsl.constprop.0, %function
_Z11pass32_implILi11EEvPKsPsl.constprop.0:
.LFB10:
	.cfi_startproc
	addvl	sp, sp, #-20
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x22
	adrp	x2, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #112
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xa0,0x1e,0x23,0x70,0x22
	add	x2, x2, :lo12:.LANCHOR0
	add	x3, x2, 32
	add	x13, x0, 32
	add	x12, x0, 64
	add	x11, x0, 96
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x10, x0, 128
	add	x9, x0, 160
	add	x8, x0, 192
	stp	d8, d9, [sp, 32]
	.cfi_escape 0x10,0x48,0x2,0x8f,0x20
	.cfi_escape 0x10,0x49,0x2,0x8f,0x28
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 64
	add	x7, x0, 224
	stp	d10, d11, [sp, 48]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x38
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 96
	ld1h	z11.h, p7/z, [x3]
	add	x3, x2, 128
	ld1h	z1.h, p7/z, [x3]
	add	x3, x2, 160
	stp	d12, d13, [sp, 64]
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xc8,0
	ld1h	z13.h, p7/z, [x3]
	add	x3, x2, 192
	ld1h	z7.h, p7/z, [x3]
	ld1w	z12.s, p7/z, [x2]
	add	x3, x2, 224
	ld1h	z4.h, p7/z, [x3]
	stp	d14, d15, [sp, 80]
	add	x3, x2, 256
	ld1h	z5.h, p7/z, [x3]
	add	x3, x2, 288
	ld1h	z22.h, p7/z, [x3]
	stp	x19, x20, [sp, 16]
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	add	x3, x2, 320
	ld1h	z14.h, p7/z, [x3]
	add	x3, x2, 352
	ld1h	z3.h, p7/z, [x3]
	mov	x4, 0
	add	x3, x2, 384
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 416
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #7
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 448
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 480
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 512
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #10
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 544
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 576
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #12
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 608
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 640
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 672
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 704
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 736
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 768
	ld1h	z31.h, p7/z, [x3]
	ldr	q15, [x2, 2912]
	addvl	x3, sp, #18
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 800
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 96
	str	z31, [x3]
	.p2align 5,,15
.L7:
	ld1h	z31.h, p7/z, [x0, x4, lsl 1]
	ld1h	z29.h, p7/z, [x13, x4, lsl 1]
	rev	z29.h, z29.h
	sub	z6.h, z31.h, z29.h
	sunpklo	z28.s, z29.h
	sunpkhi	z29.s, z29.h
	add	x3, sp, 96
	sunpklo	z30.s, z31.h
	sunpkhi	z31.s, z31.h
	add	z30.s, z30.s, z28.s
	add	z31.s, z31.s, z29.s
	rev	z31.s, z31.s
	add	z26.s, z30.s, z31.s
	rev	z29.s, z26.s
	sub	z30.s, z30.s, z31.s
	add	z31.s, z26.s, z29.s
	sub	z26.s, z26.s, z29.s
	tbl	z29.s, {z31.s}, z12.s
	add	z27.s, z31.s, z29.s
	str	z27, [x3]
	addvl	x3, sp, #1
	sub	z31.s, z31.s, z29.s
	add	x3, x3, 96
	ld1h	z29.h, p7/z, [x12, x4, lsl 1]
	ld1h	z28.h, p7/z, [x11, x4, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z24.s, z28.h
	str	z31, [x3]
	sub	z31.h, z29.h, z28.h
	addvl	x3, sp, #2
	sunpkhi	z28.s, z28.h
	sunpklo	z27.s, z29.h
	add	x3, x3, 96
	add	z24.s, z27.s, z24.s
	sunpkhi	z29.s, z29.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z20.s, z24.s, z29.s
	rev	z28.s, z20.s
	sub	z24.s, z24.s, z29.s
	add	z29.s, z20.s, z28.s
	sub	z20.s, z20.s, z28.s
	tbl	z28.s, {z29.s}, z12.s
	add	z25.s, z29.s, z28.s
	str	z25, [x3]
	addvl	x3, sp, #3
	sub	z29.s, z29.s, z28.s
	ld1h	z28.h, p7/z, [x9, x4, lsl 1]
	add	x3, x3, 96
	rev	z28.h, z28.h
	sunpklo	z25.s, z28.h
	str	z29, [x3]
	ld1h	z29.h, p7/z, [x10, x4, lsl 1]
	addvl	x3, sp, #4
	sub	z8.h, z29.h, z28.h
	sunpkhi	z28.s, z28.h
	sunpklo	z27.s, z29.h
	add	x3, x3, 96
	add	z25.s, z27.s, z25.s
	sunpkhi	z29.s, z29.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z23.s, z25.s, z29.s
	rev	z28.s, z23.s
	sub	z25.s, z25.s, z29.s
	add	z29.s, z23.s, z28.s
	sub	z23.s, z23.s, z28.s
	tbl	z28.s, {z29.s}, z12.s
	add	z21.s, z29.s, z28.s
	sub	z28.s, z29.s, z28.s
	str	z21, [x3]
	addvl	x3, sp, #5
	ld1h	z29.h, p7/z, [x8, x4, lsl 1]
	add	x3, x3, 96
	sunpklo	z27.s, z29.h
	str	z28, [x3]
	ld1h	z28.h, p7/z, [x7, x4, lsl 1]
	rev	z28.h, z28.h
	sub	z18.h, z29.h, z28.h
	sunpklo	z21.s, z28.h
	sunpkhi	z29.s, z29.h
	sunpkhi	z28.s, z28.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z21.s, z27.s, z21.s
	add	z17.s, z21.s, z29.s
	sub	z21.s, z21.s, z29.s
	rev	z29.s, z17.s
	add	z19.s, z17.s, z29.s
	sub	z17.s, z17.s, z29.s
	tbl	z29.s, {z19.s}, z12.s
	add	z16.s, z19.s, z29.s
	sub	z19.s, z19.s, z29.s
	tbl	z29.h, {z31.h}, z7.h
	tbl	z28.h, {z8.h}, z9.h
	tbl	z27.h, {z6.h}, z9.h
	orr	z27.d, z27.d, z29.d
	tbl	z29.h, {z18.h}, z7.h
	orr	z29.d, z28.d, z29.d
	tbl	z29.h, {z29.h}, z14.h
	tbl	z2.h, {z8.h}, z10.h
	addvl	x3, sp, #6
	tbl	z27.h, {z27.h}, z13.h
	orr	z27.d, z27.d, z29.d
	tbl	z29.h, {z31.h}, z4.h
	add	x3, x3, 96
	tbl	z28.h, {z6.h}, z10.h
	orr	z28.d, z28.d, z29.d
	tbl	z29.h, {z18.h}, z4.h
	orr	z29.d, z2.d, z29.d
	tbl	z2.h, {z6.h}, z11.h
	tbl	z29.h, {z29.h}, z14.h
	tbl	z6.h, {z6.h}, z1.h
	tbl	z28.h, {z28.h}, z13.h
	orr	z28.d, z28.d, z29.d
	tbl	z29.h, {z31.h}, z5.h
	tbl	z31.h, {z31.h}, z22.h
	orr	z31.d, z6.d, z31.d
	ldr	z6, [x3]
	addvl	x3, sp, #7
	add	x3, x3, 96
	orr	z2.d, z2.d, z29.d
	tbl	z0.h, {z8.h}, z11.h
	tbl	z29.h, {z18.h}, z5.h
	tbl	z8.h, {z8.h}, z1.h
	tbl	z18.h, {z18.h}, z22.h
	orr	z18.d, z8.d, z18.d
	tbl	z18.h, {z18.h}, z14.h
	tbl	z31.h, {z31.h}, z13.h
	orr	z31.d, z31.d, z18.d
	movi	d18, #0
	movprfx	z8, z18
	sdot	z8.d, z27.h, z3.h
	sdot	z8.d, z28.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 96
	orr	z29.d, z0.d, z29.d
	tbl	z2.h, {z2.h}, z13.h
	tbl	z29.h, {z29.h}, z14.h
	orr	z29.d, z2.d, z29.d
	sdot	z8.d, z29.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #9
	sdot	z8.d, z31.h, z6.h
	add	x3, x3, 96
	ldr	z6, [x3]
	uzp1	z8.s, z8.s, z8.s
	addvl	x3, sp, #10
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	add	x3, x3, 96
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 64]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 96
	sdot	z8.d, z28.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #12
	sdot	z8.d, z29.h, z6.h
	add	x5, x2, 2976
	add	x3, x3, 96
	ldr	z6, [x3]
	sdot	z8.d, z31.h, z6.h
	addvl	x3, sp, #13
	uzp1	z8.s, z8.s, z8.s
	add	z8.s, z8.s, #1024
	add	x3, x3, 96
	ldr	z6, [x3]
	asr	z8.s, z8.s, #11
	addvl	x3, sp, #14
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 192]
	add	x3, x3, 96
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #15
	sdot	z8.d, z28.h, z6.h
	ptrue	p6.s, vl4
	add	x3, x3, 96
	ldr	z6, [x3]
	sdot	z8.d, z29.h, z6.h
	addvl	x3, sp, #16
	mov	w20, -64
	add	x3, x3, 96
	ldr	z6, [x3]
	sdot	z8.d, z31.h, z6.h
	addvl	x3, sp, #17
	uzp1	z8.s, z8.s, z8.s
	add	z8.s, z8.s, #1024
	add	x3, x3, 96
	ldr	z6, [x3]
	asr	z8.s, z8.s, #11
	addvl	x3, sp, #18
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 320]
	add	x3, x3, 96
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ldr	z6, [x3]
	addvl	x3, sp, #19
	sdot	z8.d, z28.h, z6.h
	add	x4, x4, 128
	add	x3, x3, 96
	ldr	z6, [x3]
	sdot	z8.d, z29.h, z6.h
	add	x3, x2, 832
	ld1h	z6.h, p7/z, [x3]
	sdot	z8.d, z31.h, z6.h
	add	x3, x2, 864
	uzp1	z8.s, z8.s, z8.s
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 448]
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 896
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 928
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 960
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 992
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1024
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 576]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1056
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1088
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1120
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1152
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 704]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1184
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1216
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1248
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1280
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 832]
	add	x1, x1, 8
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1312
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1344
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1376
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1408
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 952]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1440
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1472
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1504
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1536
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1080]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1568
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1600
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1632
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1664
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1208]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1696
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1728
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1760
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1792
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1336]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1824
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1856
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1888
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 1920
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1464]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1952
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 1984
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2016
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 2048
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1592]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2080
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2112
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2144
	sdot	z8.d, z31.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	uzp1	z8.s, z8.s, z8.s
	add	x3, x2, 2176
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1720]
	movprfx	z8, z18
	sdot	z8.d, z27.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2208
	sdot	z8.d, z28.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2240
	sdot	z8.d, z29.h, z6.h
	ld1h	z6.h, p7/z, [x3]
	add	x3, x2, 2272
	sdot	z8.d, z31.h, z6.h
	uzp1	z8.s, z8.s, z8.s
	add	z8.s, z8.s, #1024
	asr	z8.s, z8.s, #11
	uzp1	z8.h, z8.h, z8.h
	str	d8, [x1, 1848]
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 2304
	sdot	z18.d, z27.h, z8.h
	ld1h	z27.h, p7/z, [x3]
	add	x3, x2, 2336
	sdot	z18.d, z28.h, z27.h
	ld1h	z28.h, p7/z, [x3]
	add	x3, x2, 2368
	sdot	z18.d, z29.h, z28.h
	ld1h	z29.h, p7/z, [x3]
	sdot	z18.d, z31.h, z29.h
	uzp1	z18.s, z18.s, z18.s
	ld1w	z29.s, p7/z, [x5]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z29.s
	movprfx	z28, z24
	mul	z28.s, p7/m, z28.s, z29.s
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z29.s
	saddv	d31, p7, z31.s
	mul	z29.s, p7/m, z29.s, z21.s
	saddv	d27, p7, z27.s
	saddv	d28, p7, z28.s
	saddv	d29, p7, z29.s
	uzp1	v28.2s, v31.2s, v28.2s
	add	z18.s, z18.s, #1024
	asr	z18.s, z18.s, #11
	uzp1	v29.2d, v27.2d, v29.2d
	uzp1	z18.h, z18.h, z18.h
	add	x5, x2, 3008
	movi	v31.4s, 0x4, lsl 8
	str	d18, [x1, 1976]
	add	x3, x2, 3072
	xtn2	v28.4s, v29.2d
	add	v28.4s, v28.4s, v31.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 120]
	ld1w	z28.s, p7/z, [x5]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d18, p7, z18.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	saddv	d27, p7, z27.s
	add	x5, x2, 3040
	uzp1	v27.2d, v27.2d, v28.2d
	xtn2	v29.4s, v27.2d
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 376]
	ld1w	z28.s, p7/z, [x5]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d18, p7, z18.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	saddv	d27, p7, z27.s
	uzp1	v27.2d, v27.2d, v28.2d
	ld1w	z28.s, p7/z, [x3]
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	saddv	d18, p7, z18.s
	add	x3, x2, 3104
	xtn2	v29.4s, v27.2d
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p7, z27.s
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 632]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	uzp1	v27.2d, v27.2d, v28.2d
	ld1w	z28.s, p7/z, [x3]
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	saddv	d18, p7, z18.s
	add	x3, x2, 3136
	xtn2	v29.4s, v27.2d
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p7, z27.s
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 888]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	uzp1	v27.2d, v27.2d, v28.2d
	ld1w	z28.s, p7/z, [x3]
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	saddv	d18, p7, z18.s
	add	x3, x2, 3168
	xtn2	v29.4s, v27.2d
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p7, z27.s
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 1144]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	uzp1	v27.2d, v27.2d, v28.2d
	ld1w	z28.s, p7/z, [x3]
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z28.s
	saddv	d18, p7, z18.s
	add	x3, x2, 3200
	xtn2	v29.4s, v27.2d
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p7, z27.s
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 1400]
	movprfx	z29, z30
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z21.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v29.2s, v29.2s, v18.2s
	uzp1	v27.2d, v27.2d, v28.2d
	movprfx	z28, z20
	mul	z28.s, p7/m, z28.s, z15.s
	saddv	d28, p6, z28.s
	xtn2	v29.4s, v27.2d
	movprfx	z27, z17
	mul	z27.s, p7/m, z27.s, z15.s
	saddv	d27, p6, z27.s
	add	v29.4s, v29.4s, v31.4s
	shrn	v29.4h, v29.4s, 11
	str	d29, [x1, 1656]
	ld1w	z29.s, p7/z, [x3]
	mul	z30.s, p7/m, z30.s, z29.s
	mul	z24.s, p7/m, z24.s, z29.s
	mul	z25.s, p7/m, z25.s, z29.s
	saddv	d24, p7, z24.s
	mul	z29.s, p7/m, z29.s, z21.s
	saddv	d30, p7, z30.s
	saddv	d29, p7, z29.s
	uzp1	v30.2s, v30.2s, v24.2s
	saddv	d25, p7, z25.s
	add	x3, sp, 96
	uzp1	v25.2d, v25.2d, v29.2d
	movprfx	z29, z23
	mul	z29.s, p7/m, z29.s, z15.s
	saddv	d29, p6, z29.s
	uzp1	v29.2d, v29.2d, v27.2d
	xtn2	v30.4s, v25.2d
	add	v30.4s, v30.4s, v31.4s
	shrn	v30.4h, v30.4s, 11
	str	d30, [x1, 1912]
	movprfx	z30, z26
	mul	z30.s, p7/m, z30.s, z15.s
	saddv	d30, p6, z30.s
	uzp1	v30.2s, v30.2s, v28.2s
	xtn2	v30.4s, v29.2d
	ldr	q29, [x2, 2928]
	movprfx	z27, z20
	mul	z27.s, p7/m, z27.s, z29.s
	movprfx	z28, z23
	mul	z28.s, p7/m, z28.s, z29.s
	saddv	d27, p6, z27.s
	saddv	d28, p6, z28.s
	add	v30.4s, v30.4s, v31.4s
	shrn	v30.4h, v30.4s, 11
	str	d30, [x1, 248]
	movprfx	z30, z26
	mul	z30.s, p7/m, z30.s, z29.s
	mul	z29.s, p7/m, z29.s, z17.s
	saddv	d30, p6, z30.s
	saddv	d29, p6, z29.s
	uzp1	v30.2s, v30.2s, v27.2s
	uzp1	v28.2d, v28.2d, v29.2d
	ldr	q29, [x2, 2944]
	movprfx	z27, z20
	mul	z27.s, p7/m, z27.s, z29.s
	saddv	d27, p6, z27.s
	xtn2	v30.4s, v28.2d
	movprfx	z28, z23
	mul	z28.s, p7/m, z28.s, z29.s
	saddv	d28, p6, z28.s
	add	v30.4s, v30.4s, v31.4s
	shrn	v30.4h, v30.4s, 11
	str	d30, [x1, 760]
	movprfx	z30, z26
	mul	z30.s, p7/m, z30.s, z29.s
	mul	z29.s, p7/m, z29.s, z17.s
	saddv	d30, p6, z30.s
	saddv	d29, p6, z29.s
	uzp1	v30.2s, v30.2s, v27.2s
	uzp1	v28.2d, v28.2d, v29.2d
	ldr	z27, [x3]
	fmov	x3, d27
	xtn2	v30.4s, v28.2d
	lsr	x19, x3, 32
	addvl	x3, sp, #1
	add	x3, x3, 96
	add	v30.4s, v30.4s, v31.4s
	shrn	v30.4h, v30.4s, 11
	str	d30, [x1, 1272]
	ldr	q30, [x2, 2960]
	mul	z26.s, p7/m, z26.s, z30.s
	mul	z20.s, p7/m, z20.s, z30.s
	mul	z23.s, p7/m, z23.s, z30.s
	saddv	d26, p6, z26.s
	mul	z30.s, p7/m, z30.s, z17.s
	saddv	d20, p6, z20.s
	saddv	d30, p6, z30.s
	uzp1	v26.2s, v26.2s, v20.2s
	saddv	d23, p6, z23.s
	uzp1	v23.2d, v23.2d, v30.2d
	xtn2	v26.4s, v23.2d
	add	v26.4s, v26.4s, v31.4s
	shrn	v26.4h, v26.4s, 11
	str	d26, [x1, 1784]
	ldr	z26, [x3]
	fmov	x3, d26
	lsr	x17, x3, 32
	addvl	x3, sp, #2
	add	x3, x3, 96
	ldr	z25, [x3]
	fmov	x5, d25
	fmov	x3, d25
	lsr	x30, x3, 32
	addvl	x3, sp, #3
	add	x3, x3, 96
	ldr	z24, [x3]
	add	x5, x30, x5
	fmov	x3, d24
	lsl	x5, x5, 6
	smull	x30, w30, w20
	add	x5, x5, 1024
	fmov	d31, x5
	lsr	x16, x3, 32
	addvl	x3, sp, #4
	add	x3, x3, 96
	ldr	z23, [x3]
	fmov	x5, d23
	fmov	x3, d23
	sshr	d28, d31, 11
	lsr	x18, x3, 32
	addvl	x3, sp, #5
	add	x3, x3, 96
	ldr	z21, [x3]
	add	x5, x18, x5
	fmov	x3, d21
	lsl	x5, x5, 6
	smull	x18, w18, w20
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	x5, d16
	lsr	x15, x3, 32
	fmov	x3, d16
	sshr	d29, d31, 11
	lsr	x6, x3, 32
	addvl	x3, sp, #20
	add	x3, x3, 96
	add	x5, x6, x5
	str	d16, [x3]
	fmov	x3, d19
	lsl	x5, x5, 6
	smull	x6, w6, w20
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	w5, s27
	lsr	x14, x3, 32
	addvl	x3, sp, #20
	add	x3, x3, 104
	sshr	d30, d31, 11
	str	d19, [x3]
	fmov	x3, d27
	add	x3, x19, x3
	lsl	x3, x3, 6
	add	x3, x3, 1024
	fmov	d31, x3
	smull	x3, w19, w20
	mov	w19, 64
	ushr	d31, d31, 11
	smaddl	x5, w5, w19, x3
	fmov	w3, s25
	add	x5, x5, 1024
	ins	v31.h[1], v28.h[0]
	smaddl	x3, w3, w19, x30
	add	x3, x3, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, -8]
	fmov	d31, x3
	fmov	w3, s23
	sshr	d30, d31, 11
	smaddl	x3, w3, w19, x18
	fmov	w18, s26
	add	x3, x3, 1024
	fmov	d31, x3
	fmov	w3, s16
	sshr	d29, d31, 11
	smaddl	x3, w3, w19, x6
	mov	w6, 36
	fmov	w19, s24
	add	x3, x3, 1024
	fmov	d31, x3
	mov	w3, 83
	sshr	d28, d31, 11
	fmov	d31, x5
	smull	x5, w17, w6
	ushr	d31, d31, 11
	smaddl	x5, w18, w3, x5
	smull	x18, w16, w6
	smaddl	x18, w19, w3, x18
	fmov	w19, s21
	add	x5, x5, 1024
	ins	v31.h[1], v30.h[0]
	add	x18, x18, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v28.h[0]
	str	d31, [x1, 1016]
	fmov	d31, x18
	smull	x18, w15, w6
	smaddl	x18, w19, w3, x18
	fmov	w19, s19
	sshr	d28, d31, 11
	add	x18, x18, 1024
	fmov	d31, x18
	smull	x18, w14, w6
	smaddl	x3, w19, w3, x18
	sshr	d29, d31, 11
	mov	w18, -83
	add	x3, x3, 1024
	fmov	d31, x3
	smull	x16, w16, w18
	fmov	w3, s26
	sshr	d30, d31, 11
	fmov	d31, x5
	fmov	w5, s24
	smull	x15, w15, w18
	ushr	d31, d31, 11
	smull	x14, w14, w18
	smull	x17, w17, w18
	smaddl	x3, w3, w6, x17
	smaddl	x5, w5, w6, x16
	ins	v31.h[1], v28.h[0]
	add	x3, x3, 1024
	add	x5, x5, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 504]
	fmov	d31, x5
	fmov	w5, s21
	sshr	d29, d31, 11
	smaddl	x5, w5, w6, x15
	add	x5, x5, 1024
	fmov	d31, x5
	smaddl	x5, w19, w6, x14
	sshr	d28, d31, 11
	add	x5, x5, 1024
	fmov	d31, x5
	sshr	d30, d31, 11
	fmov	d31, x3
	ushr	d31, d31, 11
	ins	v31.h[1], v29.h[0]
	ins	v31.h[2], v28.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 1528]
	cmp	x4, 1024
	bne	.L7
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 32]
	ldp	d10, d11, [sp, 48]
	ldp	d12, d13, [sp, 64]
	ldp	d14, d15, [sp, 80]
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
	addvl	sp, sp, #20
	.cfi_def_cfa_offset 112
	add	sp, sp, 112
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	_Z11pass32_implILi11EEvPKsPsl.constprop.0, .-_Z11pass32_implILi11EEvPKsPsl.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB7:
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
	bl	_Z11pass32_implILi4EEvPKsPsl
	mov	x1, x19
	add	x0, sp, 32
	bl	_Z11pass32_implILi11EEvPKsPsl.constprop.0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	add	sp, sp, 2080
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	dynopt_dct32_sve2_shared, .-dynopt_dct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL9IDX_REV4S, %object
	.size	_ZL9IDX_REV4S, 32
_ZL9IDX_REV4S:
	.word	3
	.word	2
	.word	1
	.word	0
	.word	7
	.word	6
	.word	5
	.word	4
	.type	_ZL6IDX_04, %object
	.size	_ZL6IDX_04, 32
_ZL6IDX_04:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.type	_ZL6IDX_47, %object
	.size	_ZL6IDX_47, 32
_ZL6IDX_47:
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.type	_ZL6IDX_8B, %object
	.size	_ZL6IDX_8B, 32
_ZL6IDX_8B:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.type	_ZL6IDX_CF, %object
	.size	_ZL6IDX_CF, 32
_ZL6IDX_CF:
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	28
	.hword	29
	.hword	30
	.hword	31
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	28
	.hword	29
	.hword	30
	.hword	31
	.type	_ZL7IDX_LO8, %object
	.size	_ZL7IDX_LO8, 32
_ZL7IDX_LO8:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.type	_ZL7IDX_04B, %object
	.size	_ZL7IDX_04B, 32
_ZL7IDX_04B:
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.type	_ZL7IDX_47B, %object
	.size	_ZL7IDX_47B, 32
_ZL7IDX_47B:
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.type	_ZL7IDX_8BB, %object
	.size	_ZL7IDX_8BB, 32
_ZL7IDX_8BB:
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.type	_ZL7IDX_CFB, %object
	.size	_ZL7IDX_CFB, 32
_ZL7IDX_CFB:
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.type	_ZL8IDX_LO8B, %object
	.size	_ZL8IDX_LO8B, 32
_ZL8IDX_LO8B:
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	16
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
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
	.type	_ZL2K4, %object
	.size	_ZL2K4, 64
_ZL2K4:
	.word	89
	.word	75
	.word	50
	.word	18
	.word	75
	.word	-18
	.word	-89
	.word	-50
	.word	50
	.word	-89
	.word	18
	.word	75
	.word	18
	.word	-50
	.word	75
	.word	-89
	.type	_ZL2K2, %object
	.size	_ZL2K2, 256
_ZL2K2:
	.word	90
	.word	87
	.word	80
	.word	70
	.word	57
	.word	43
	.word	25
	.word	9
	.word	87
	.word	57
	.word	9
	.word	-43
	.word	-80
	.word	-90
	.word	-70
	.word	-25
	.word	80
	.word	9
	.word	-70
	.word	-87
	.word	-25
	.word	57
	.word	90
	.word	43
	.word	70
	.word	-43
	.word	-87
	.word	9
	.word	90
	.word	25
	.word	-80
	.word	-57
	.word	57
	.word	-80
	.word	-25
	.word	90
	.word	-9
	.word	-87
	.word	43
	.word	70
	.word	43
	.word	-90
	.word	57
	.word	25
	.word	-87
	.word	70
	.word	9
	.word	-80
	.word	25
	.word	-70
	.word	90
	.word	-80
	.word	43
	.word	9
	.word	-57
	.word	87
	.word	9
	.word	-25
	.word	43
	.word	-57
	.word	70
	.word	-80
	.word	87
	.word	-90
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
