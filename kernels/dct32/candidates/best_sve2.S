	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_Z11pass32_implILi4EEvPKsPsl, %function
_Z11pass32_implILi4EEvPKsPsl:
.LFB8:
	.cfi_startproc
	addvl	sp, sp, #-18
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x90,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #80
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0x90,0x1e,0x23,0x50,0x22
	add	x3, x3, :lo12:.LANCHOR0
	add	x4, x3, 32
	add	x8, x0, 32
	add	x10, x1, 64
	add	x9, x2, x2, lsl 1
	stp	d8, d9, [sp]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	ld1h	z8.h, p7/z, [x4]
	add	x4, x3, 64
	ld1h	z0.h, p7/z, [x4]
	add	x4, x3, 96
	ld1h	z1.h, p7/z, [x4]
	add	x4, x3, 128
	ld1h	z6.h, p7/z, [x4]
	stp	d10, d11, [sp, 16]
	add	x4, x3, 160
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	ld1h	z10.h, p7/z, [x4]
	ld1w	z9.s, p7/z, [x3]
	add	x4, x3, 192
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	ld1h	z13.h, p7/z, [x4]
	add	x4, x3, 224
	ld1h	z12.h, p7/z, [x4]
	add	x4, x3, 256
	ld1h	z7.h, p7/z, [x4]
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	add	x4, x3, 288
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 320
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 352
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 384
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 416
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #10
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 448
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 480
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 512
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 544
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 576
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 608
	ld1h	z31.h, p7/z, [x4]
	ldr	q11, [x3, 2496]
	addvl	x4, sp, #16
	add	x4, x4, 64
	str	z31, [x4]
	add	x4, x3, 640
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #17
	add	x4, x4, 64
	str	z31, [x4]
	.p2align 5,,15
.L2:
	ld1h	z30.h, p7/z, [x0]
	ld1h	z28.h, p7/z, [x8]
	rev	z28.h, z28.h
	sub	z2.h, z30.h, z28.h
	sunpklo	z29.s, z28.h
	sunpkhi	z28.s, z28.h
	add	x4, sp, 64
	sunpklo	z31.s, z30.h
	add	z31.s, z31.s, z29.s
	sunpkhi	z29.s, z30.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z30.s, z31.s, z29.s
	rev	z28.s, z30.s
	sub	z31.s, z31.s, z29.s
	add	z29.s, z30.s, z28.s
	sub	z30.s, z30.s, z28.s
	tbl	z28.s, {z29.s}, z9.s
	add	z27.s, z29.s, z28.s
	str	z27, [x4]
	addvl	x4, sp, #1
	sub	z29.s, z29.s, z28.s
	add	x4, x4, 64
	ld1h	z28.h, p7/z, [x8, x2, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z27.s, z28.h
	str	z29, [x4]
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	addvl	x4, sp, #2
	sub	z3.h, z29.h, z28.h
	sunpkhi	z28.s, z28.h
	add	x4, x4, 64
	sunpklo	z24.s, z29.h
	sunpkhi	z29.s, z29.h
	add	z24.s, z24.s, z27.s
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z17.s, z24.s, z29.s
	rev	z28.s, z17.s
	sub	z24.s, z24.s, z29.s
	add	z29.s, z17.s, z28.s
	sub	z17.s, z17.s, z28.s
	tbl	z28.s, {z29.s}, z9.s
	add	z26.s, z29.s, z28.s
	str	z26, [x4]
	addvl	x4, sp, #3
	sub	z28.s, z29.s, z28.s
	mov	z21.d, z3.d
	add	x4, x4, 64
	str	z28, [x4]
	mov	z20.d, z2.d
	add	x4, x0, x2, lsl 2
	ld1h	z29.h, p7/z, [x4]
	sunpklo	z27.s, z29.h
	add	x4, x8, x2, lsl 2
	ld1h	z28.h, p7/z, [x4]
	rev	z28.h, z28.h
	addvl	x4, sp, #4
	sub	z4.h, z29.h, z28.h
	sunpklo	z25.s, z28.h
	sunpkhi	z28.s, z28.h
	add	z25.s, z27.s, z25.s
	add	x4, x4, 64
	sunpkhi	z29.s, z29.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z19.s, z25.s, z29.s
	rev	z28.s, z19.s
	sub	z25.s, z25.s, z29.s
	add	z29.s, z19.s, z28.s
	sub	z19.s, z19.s, z28.s
	tbl	z28.s, {z29.s}, z9.s
	add	z23.s, z29.s, z28.s
	str	z23, [x4]
	addvl	x4, sp, #5
	sub	z22.s, z29.s, z28.s
	add	x4, x4, 64
	ld1h	z29.h, p7/z, [x0, x9, lsl 1]
	ld1h	z28.h, p7/z, [x8, x9, lsl 1]
	sunpklo	z27.s, z29.h
	rev	z28.h, z28.h
	sub	z5.h, z29.h, z28.h
	sunpklo	z18.s, z28.h
	sunpkhi	z29.s, z29.h
	sunpkhi	z28.s, z28.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z18.s, z27.s, z18.s
	add	z14.s, z18.s, z29.s
	sub	z18.s, z18.s, z29.s
	rev	z29.s, z14.s
	str	z22, [x4]
	addvl	x4, sp, #6
	mov	z22.d, z4.d
	mov	z23.d, z5.d
	add	z16.s, z14.s, z29.s
	tbl	z27.h, {z22.h - z23.h}, z8.h
	sub	z14.s, z14.s, z29.s
	tbl	z28.h, {z20.h - z21.h}, z0.h
	tbl	z29.s, {z16.s}, z9.s
	add	x4, x4, 64
	add	z15.s, z16.s, z29.s
	tbl	z26.h, {z20.h - z21.h}, z8.h
	sub	z16.s, z16.s, z29.s
	tbl	z26.h, {z26.h - z27.h}, z10.h
	tbl	z29.h, {z22.h - z23.h}, z0.h
	tbl	z4.h, {z20.h - z21.h}, z6.h
	tbl	z27.h, {z28.h - z29.h}, z10.h
	tbl	z28.h, {z20.h - z21.h}, z1.h
	ldr	z21, [x4]
	addvl	x4, sp, #7
	tbl	z29.h, {z22.h - z23.h}, z1.h
	add	x4, x4, 64
	tbl	z28.h, {z28.h - z29.h}, z10.h
	tbl	z5.h, {z22.h - z23.h}, z6.h
	movi	d29, #0
	tbl	z4.h, {z4.h - z5.h}, z10.h
	movprfx	z23, z29
	sdot	z23.d, z26.h, z13.h
	sdot	z23.d, z27.h, z12.h
	sdot	z23.d, z28.h, z7.h
	sdot	z23.d, z4.h, z21.h
	ldr	z21, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 64
	uzp1	z23.s, z23.s, z23.s
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 64]
	ptrue	p6.s, vl4
	movprfx	z23, z29
	sdot	z23.d, z26.h, z21.h
	ldr	z21, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	sdot	z23.d, z27.h, z21.h
	ldr	z21, [x4]
	addvl	x4, sp, #10
	sdot	z23.d, z28.h, z21.h
	add	x1, x1, 8
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z4.h, z21.h
	addvl	x4, sp, #11
	uzp1	z23.s, z23.s, z23.s
	rshrnb	z23.h, z23.s, #4
	add	x4, x4, 64
	ldr	z21, [x4]
	uzp1	z23.h, z23.h, z23.h
	addvl	x4, sp, #12
	str	d23, [x1, 184]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z21.h
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z27.h, z21.h
	addvl	x4, sp, #13
	add	x0, x0, x2, lsl 3
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z28.h, z21.h
	addvl	x4, sp, #14
	add	x8, x8, x2, lsl 3
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z4.h, z21.h
	addvl	x4, sp, #15
	uzp1	z23.s, z23.s, z23.s
	rshrnb	z23.h, z23.s, #4
	add	x4, x4, 64
	ldr	z21, [x4]
	uzp1	z23.h, z23.h, z23.h
	addvl	x4, sp, #16
	str	d23, [x1, 312]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z21.h
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z27.h, z21.h
	addvl	x4, sp, #17
	add	x4, x4, 64
	ldr	z21, [x4]
	sdot	z23.d, z28.h, z21.h
	add	x4, x3, 672
	ld1h	z22.h, p7/z, [x4]
	sdot	z23.d, z4.h, z22.h
	add	x4, x3, 704
	uzp1	z23.s, z23.s, z23.s
	ld1h	z22.h, p7/z, [x4]
	rshrnb	z23.h, z23.s, #4
	add	x4, x3, 736
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 440]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 768
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 800
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 832
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 864
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 568]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 896
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 928
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 960
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 992
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 696]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1024
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1056
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1088
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1120
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 824]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1152
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1184
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1216
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1248
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 952]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1280
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1312
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1344
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1376
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1080]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1408
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1440
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1472
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1504
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1208]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1536
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1568
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1600
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1632
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1336]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1664
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1696
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1728
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1760
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1464]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1792
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1824
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1856
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 1888
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1592]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1920
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1952
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 1984
	sdot	z23.d, z4.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	uzp1	z23.s, z23.s, z23.s
	add	x4, x3, 2016
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1720]
	movprfx	z23, z29
	sdot	z23.d, z26.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 2048
	sdot	z23.d, z27.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 2080
	sdot	z23.d, z28.h, z22.h
	ld1h	z22.h, p7/z, [x4]
	add	x4, x3, 2112
	sdot	z23.d, z4.h, z22.h
	uzp1	z23.s, z23.s, z23.s
	rshrnb	z23.h, z23.s, #4
	uzp1	z23.h, z23.h, z23.h
	str	d23, [x1, 1848]
	ld1h	z23.h, p7/z, [x4]
	add	x4, x3, 2144
	sdot	z29.d, z26.h, z23.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x3, 2176
	sdot	z29.d, z27.h, z26.h
	ld1h	z27.h, p7/z, [x4]
	add	x4, x3, 2208
	sdot	z29.d, z28.h, z27.h
	ld1h	z28.h, p7/z, [x4]
	sdot	z29.d, z4.h, z28.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #4
	uzp1	z29.h, z29.h, z29.h
	add	x4, x3, 2240
	ld1w	z28.s, p7/z, [x4]
	movprfx	z27, z24
	mul	z27.s, p7/m, z27.s, z28.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z28.s
	saddv	d27, p7, z27.s
	saddv	d26, p7, z26.s
	str	d29, [x1, 1976]
	movprfx	z29, z31
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z18.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v27.2s, v29.2s, v27.2s
	add	x4, x3, 2272
	uzp1	v28.2d, v26.2d, v28.2d
	movi	v29.4s, 0x8
	xtn2	v27.4s, v28.2d
	add	v27.4s, v27.4s, v29.4s
	shrn	v27.4h, v27.4s, 4
	str	d27, [x1, 120]
	ld1w	z27.s, p7/z, [x4]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d23, p7, z23.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	saddv	d26, p7, z26.s
	add	x4, x3, 2304
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x4]
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	saddv	d23, p7, z23.s
	add	x4, x3, 2336
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 376]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	uzp1	v26.2d, v26.2d, v27.2d
	xtn2	v28.4s, v26.2d
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 632]
	ld1w	z27.s, p7/z, [x4]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d23, p7, z23.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	saddv	d26, p7, z26.s
	add	x4, x3, 2368
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x4]
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	saddv	d23, p7, z23.s
	add	x4, x3, 2400
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 888]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x4]
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	saddv	d23, p7, z23.s
	add	x4, x3, 2432
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 1144]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x4]
	movprfx	z23, z24
	mul	z23.s, p7/m, z23.s, z27.s
	saddv	d23, p7, z23.s
	add	x4, x3, 2464
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 1400]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z18.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v23.2s
	uzp1	v26.2d, v26.2d, v27.2d
	movprfx	z27, z17
	mul	z27.s, p7/m, z27.s, z11.s
	saddv	d27, p6, z27.s
	xtn2	v28.4s, v26.2d
	movprfx	z26, z14
	mul	z26.s, p7/m, z26.s, z11.s
	saddv	d26, p6, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 4
	str	d28, [x1, 1656]
	ld1w	z28.s, p7/z, [x4]
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z24.s, p7/m, z24.s, z28.s
	mul	z25.s, p7/m, z25.s, z28.s
	saddv	d24, p7, z24.s
	mul	z28.s, p7/m, z28.s, z18.s
	saddv	d31, p7, z31.s
	saddv	d28, p7, z28.s
	uzp1	v31.2s, v31.2s, v24.2s
	saddv	d25, p7, z25.s
	add	x4, sp, 64
	uzp1	v25.2d, v25.2d, v28.2d
	movprfx	z28, z19
	mul	z28.s, p7/m, z28.s, z11.s
	saddv	d28, p6, z28.s
	uzp1	v28.2d, v28.2d, v26.2d
	xtn2	v31.4s, v25.2d
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 1912]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z11.s
	saddv	d31, p6, z31.s
	uzp1	v31.2s, v31.2s, v27.2s
	xtn2	v31.4s, v28.2d
	ldr	q28, [x3, 2512]
	movprfx	z26, z17
	mul	z26.s, p7/m, z26.s, z28.s
	movprfx	z27, z19
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d26, p6, z26.s
	saddv	d27, p6, z27.s
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 248]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z28.s, p7/m, z28.s, z14.s
	saddv	d31, p6, z31.s
	saddv	d28, p6, z28.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v27.2d, v27.2d, v28.2d
	ldr	q28, [x3, 2528]
	movprfx	z26, z17
	mul	z26.s, p7/m, z26.s, z28.s
	saddv	d26, p6, z26.s
	xtn2	v31.4s, v27.2d
	movprfx	z27, z19
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p6, z27.s
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 760]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z28.s, p7/m, z28.s, z14.s
	saddv	d31, p6, z31.s
	saddv	d28, p6, z28.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v27.2d, v27.2d, v28.2d
	xtn2	v31.4s, v27.2d
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 4
	str	d31, [x1, 1272]
	ldr	q31, [x3, 2544]
	mul	z30.s, p7/m, z30.s, z31.s
	mul	z17.s, p7/m, z17.s, z31.s
	mul	z19.s, p7/m, z19.s, z31.s
	saddv	d30, p6, z30.s
	mul	z31.s, p7/m, z31.s, z14.s
	saddv	d17, p6, z17.s
	saddv	d31, p6, z31.s
	uzp1	v30.2s, v30.2s, v17.2s
	saddv	d19, p6, z19.s
	uzp1	v19.2d, v19.2d, v31.2d
	xtn2	v30.4s, v19.2d
	add	v30.4s, v30.4s, v29.4s
	shrn	v30.4h, v30.4s, 4
	str	d30, [x1, 1784]
	ldr	z30, [x4]
	fmov	x4, d30
	lsr	x7, x4, 32
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z27, [x4]
	fmov	x4, d27
	lsr	x14, x4, 32
	addvl	x4, sp, #2
	add	x4, x4, 64
	ldr	z29, [x4]
	fmov	x15, d29
	fmov	x4, d29
	lsr	x5, x4, 32
	addvl	x4, sp, #3
	add	x4, x4, 64
	ldr	z26, [x4]
	add	x18, x5, x15
	fmov	x4, d26
	sbfiz	x18, x18, 2, 58
	lsr	x13, x4, 32
	addvl	x4, sp, #4
	add	x4, x4, 64
	ldr	z25, [x4]
	fmov	x15, d25
	fmov	x4, d25
	lsr	x16, x4, 32
	addvl	x4, sp, #5
	add	x4, x4, 64
	ldr	z24, [x4]
	add	x17, x16, x15
	fmov	x4, d24
	fmov	x15, d15
	sbfiz	x17, x17, 2, 58
	lsr	x12, x4, 32
	fmov	x4, d15
	lsr	x6, x4, 32
	addvl	x4, sp, #18
	add	x4, x4, 64
	add	x15, x6, x15
	str	d15, [x4]
	fmov	x4, d16
	sbfiz	x15, x15, 2, 58
	lsr	x11, x4, 32
	addvl	x4, sp, #18
	add	x4, x4, 72
	str	d16, [x4]
	fmov	x4, d30
	add	x4, x7, x4
	ubfiz	x4, x4, 2, 58
	fmov	d31, x4
	ins	v31.h[1], w18
	ins	v31.h[2], w17
	fmov	w17, s30
	ins	v31.h[3], w15
	mov	w15, -64
	smull	x4, w7, w15
	mov	w7, 64
	smull	x5, w5, w15
	smaddl	x4, w17, w7, x4
	fmov	w17, s29
	str	d31, [x1, -8]
	smull	x16, w16, w15
	smull	x6, w6, w15
	fmov	w15, s26
	ubfx	x4, x4, 4, 16
	smaddl	x5, w17, w7, x5
	fmov	d31, x5
	fmov	w5, s25
	sshr	d28, d31, 4
	smaddl	x5, w5, w7, x16
	fmov	d31, x5
	fmov	w5, s15
	sshr	d29, d31, 4
	smaddl	x5, w5, w7, x6
	fmov	w7, s27
	fmov	d31, x5
	mov	w6, 36
	mov	w5, 83
	sshr	d30, d31, 4
	fmov	d31, x4
	smull	x4, w14, w6
	ins	v31.h[1], v28.h[0]
	smaddl	x4, w7, w5, x4
	smull	x7, w13, w6
	smaddl	x7, w15, w5, x7
	fmov	w15, s24
	add	x4, x4, 8
	ins	v31.h[2], v29.h[0]
	add	x7, x7, 8
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 1016]
	fmov	d31, x7
	smull	x7, w12, w6
	smaddl	x7, w15, w5, x7
	fmov	w15, s16
	sshr	d28, d31, 4
	add	x7, x7, 8
	fmov	d31, x7
	smull	x7, w11, w6
	smaddl	x5, w15, w5, x7
	sshr	d29, d31, 4
	mov	w7, -83
	add	x5, x5, 8
	fmov	d31, x5
	fmov	w5, s26
	smull	x13, w13, w7
	sshr	d30, d31, 4
	fmov	d31, x4
	smull	x12, w12, w7
	fmov	w4, s27
	ushr	d31, d31, 4
	smull	x11, w11, w7
	smaddl	x5, w5, w6, x13
	smull	x14, w14, w7
	add	x5, x5, 8
	smaddl	x4, w4, w6, x14
	ins	v31.h[1], v28.h[0]
	add	x4, x4, 8
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 504]
	fmov	d31, x5
	fmov	w5, s24
	sshr	d28, d31, 4
	smaddl	x5, w5, w6, x12
	add	x5, x5, 8
	fmov	d31, x5
	smaddl	x5, w15, w6, x11
	sshr	d29, d31, 4
	add	x5, x5, 8
	fmov	d31, x5
	sshr	d30, d31, 4
	fmov	d31, x4
	ushr	d31, d31, 4
	ins	v31.h[1], v28.h[0]
	ins	v31.h[2], v29.h[0]
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
	addvl	sp, sp, #18
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
	addvl	sp, sp, #-18
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x90,0x1e,0x22
	adrp	x2, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #112
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0x90,0x1e,0x23,0x70,0x22
	add	x2, x2, :lo12:.LANCHOR0
	add	x3, x2, 32
	add	x12, x0, 32
	add	x11, x0, 64
	add	x10, x0, 96
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x9, x0, 128
	add	x8, x0, 160
	add	x7, x0, 192
	stp	d8, d9, [sp, 32]
	.cfi_escape 0x10,0x48,0x2,0x8f,0x20
	.cfi_escape 0x10,0x49,0x2,0x8f,0x28
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 64
	ld1h	z1.h, p7/z, [x3]
	add	x3, x2, 96
	ld1h	z2.h, p7/z, [x3]
	add	x3, x2, 128
	ld1h	z22.h, p7/z, [x3]
	stp	d10, d11, [sp, 48]
	add	x3, x2, 160
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x38
	ld1h	z10.h, p7/z, [x3]
	ld1w	z9.s, p7/z, [x2]
	add	x3, x2, 192
	stp	d12, d13, [sp, 64]
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xc8,0
	ld1h	z12.h, p7/z, [x3]
	add	x3, x2, 224
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 256
	ld1h	z6.h, p7/z, [x3]
	stp	x19, x20, [sp, 16]
	add	x3, x2, 288
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #6
	stp	d14, d15, [sp, 80]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xd8,0
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 320
	ld1h	z31.h, p7/z, [x3]
	add	x6, x0, 224
	addvl	x3, sp, #7
	mov	x4, 0
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 352
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 384
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 416
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #10
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 448
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 480
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #12
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 512
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 544
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 576
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 608
	ld1h	z31.h, p7/z, [x3]
	ldr	q11, [x2, 2496]
	addvl	x3, sp, #16
	add	x3, x3, 96
	str	z31, [x3]
	add	x3, x2, 640
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 96
	str	z31, [x3]
	.p2align 5,,15
.L7:
	ld1h	z30.h, p7/z, [x0, x4, lsl 1]
	ld1h	z28.h, p7/z, [x12, x4, lsl 1]
	rev	z28.h, z28.h
	sub	z0.h, z30.h, z28.h
	sunpklo	z29.s, z28.h
	sunpkhi	z28.s, z28.h
	add	x3, sp, 96
	sunpklo	z31.s, z30.h
	add	z31.s, z31.s, z29.s
	sunpkhi	z29.s, z30.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z30.s, z31.s, z29.s
	rev	z28.s, z30.s
	sub	z31.s, z31.s, z29.s
	add	z29.s, z30.s, z28.s
	sub	z30.s, z30.s, z28.s
	tbl	z28.s, {z29.s}, z9.s
	add	z27.s, z29.s, z28.s
	str	z27, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 96
	sub	z26.s, z29.s, z28.s
	ld1h	z29.h, p7/z, [x11, x4, lsl 1]
	ld1h	z28.h, p7/z, [x10, x4, lsl 1]
	rev	z28.h, z28.h
	sub	z3.h, z29.h, z28.h
	sunpklo	z27.s, z28.h
	sunpkhi	z28.s, z28.h
	str	z26, [x3]
	addvl	x3, sp, #2
	sunpklo	z24.s, z29.h
	sunpkhi	z29.s, z29.h
	add	z24.s, z24.s, z27.s
	add	x3, x3, 96
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z16.s, z24.s, z29.s
	rev	z28.s, z16.s
	sub	z24.s, z24.s, z29.s
	add	z29.s, z16.s, z28.s
	sub	z16.s, z16.s, z28.s
	tbl	z28.s, {z29.s}, z9.s
	add	z25.s, z29.s, z28.s
	str	z25, [x3]
	addvl	x3, sp, #3
	sub	z29.s, z29.s, z28.s
	ld1h	z28.h, p7/z, [x8, x4, lsl 1]
	add	x3, x3, 96
	rev	z28.h, z28.h
	sunpklo	z25.s, z28.h
	str	z29, [x3]
	ld1h	z29.h, p7/z, [x9, x4, lsl 1]
	addvl	x3, sp, #4
	sub	z4.h, z29.h, z28.h
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
	tbl	z28.s, {z29.s}, z9.s
	add	z21.s, z29.s, z28.s
	sub	z28.s, z29.s, z28.s
	str	z21, [x3]
	addvl	x3, sp, #5
	ld1h	z29.h, p7/z, [x7, x4, lsl 1]
	add	x3, x3, 96
	sunpklo	z27.s, z29.h
	str	z28, [x3]
	ld1h	z28.h, p7/z, [x6, x4, lsl 1]
	rev	z28.h, z28.h
	sub	z5.h, z29.h, z28.h
	sunpklo	z17.s, z28.h
	sunpkhi	z29.s, z29.h
	sunpkhi	z28.s, z28.h
	add	z29.s, z29.s, z28.s
	rev	z29.s, z29.s
	add	z17.s, z27.s, z17.s
	add	z14.s, z17.s, z29.s
	sub	z17.s, z17.s, z29.s
	rev	z29.s, z14.s
	addvl	x3, sp, #6
	add	z15.s, z14.s, z29.s
	sub	z14.s, z14.s, z29.s
	tbl	z29.s, {z15.s}, z9.s
	mov	z20.d, z4.d
	add	z13.s, z15.s, z29.s
	mov	z21.d, z5.d
	sub	z15.s, z15.s, z29.s
	tbl	z27.h, {z20.h - z21.h}, z8.h
	tbl	z29.h, {z20.h - z21.h}, z1.h
	add	x3, x3, 96
	mov	z18.d, z0.d
	mov	z19.d, z3.d
	tbl	z5.h, {z20.h - z21.h}, z22.h
	tbl	z28.h, {z18.h - z19.h}, z1.h
	tbl	z26.h, {z18.h - z19.h}, z8.h
	tbl	z26.h, {z26.h - z27.h}, z10.h
	tbl	z27.h, {z28.h - z29.h}, z10.h
	tbl	z29.h, {z20.h - z21.h}, z2.h
	ldr	z20, [x3]
	addvl	x3, sp, #7
	tbl	z28.h, {z18.h - z19.h}, z2.h
	tbl	z4.h, {z18.h - z19.h}, z22.h
	add	x3, x3, 96
	tbl	z28.h, {z28.h - z29.h}, z10.h
	tbl	z4.h, {z4.h - z5.h}, z10.h
	movi	d29, #0
	movprfx	z21, z29
	sdot	z21.d, z26.h, z12.h
	sdot	z21.d, z27.h, z7.h
	sdot	z21.d, z28.h, z6.h
	sdot	z21.d, z4.h, z20.h
	ldr	z20, [x3]
	addvl	x3, sp, #8
	uzp1	z21.s, z21.s, z21.s
	rshrnb	z21.h, z21.s, #11
	add	x3, x3, 96
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 64]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ldr	z20, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 96
	sdot	z21.d, z27.h, z20.h
	ldr	z20, [x3]
	addvl	x3, sp, #10
	sdot	z21.d, z28.h, z20.h
	ptrue	p6.s, vl4
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z4.h, z20.h
	addvl	x3, sp, #11
	uzp1	z21.s, z21.s, z21.s
	rshrnb	z21.h, z21.s, #11
	add	x3, x3, 96
	ldr	z20, [x3]
	uzp1	z21.h, z21.h, z21.h
	addvl	x3, sp, #12
	str	d21, [x1, 192]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z27.h, z20.h
	addvl	x3, sp, #13
	mov	w20, -64
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z28.h, z20.h
	addvl	x3, sp, #14
	add	x4, x4, 128
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z4.h, z20.h
	addvl	x3, sp, #15
	uzp1	z21.s, z21.s, z21.s
	rshrnb	z21.h, z21.s, #11
	add	x3, x3, 96
	ldr	z20, [x3]
	uzp1	z21.h, z21.h, z21.h
	addvl	x3, sp, #16
	str	d21, [x1, 320]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z27.h, z20.h
	addvl	x3, sp, #17
	add	x1, x1, 8
	add	x3, x3, 96
	ldr	z20, [x3]
	sdot	z21.d, z28.h, z20.h
	add	x3, x2, 672
	ld1h	z20.h, p7/z, [x3]
	sdot	z21.d, z4.h, z20.h
	add	x3, x2, 704
	uzp1	z21.s, z21.s, z21.s
	ld1h	z20.h, p7/z, [x3]
	rshrnb	z21.h, z21.s, #11
	add	x3, x2, 736
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 440]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 768
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 800
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 832
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 864
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 568]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 896
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 928
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 960
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 992
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 696]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1024
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1056
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1088
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1120
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 824]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1152
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1184
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1216
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1248
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 952]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1280
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1312
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1344
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1376
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1080]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1408
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1440
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1472
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1504
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1208]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1536
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1568
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1600
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1632
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1336]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1664
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1696
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1728
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1760
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1464]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1792
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1824
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1856
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 1888
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1592]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1920
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1952
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 1984
	sdot	z21.d, z4.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	uzp1	z21.s, z21.s, z21.s
	add	x3, x2, 2016
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1720]
	movprfx	z21, z29
	sdot	z21.d, z26.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2048
	sdot	z21.d, z27.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2080
	sdot	z21.d, z28.h, z20.h
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2112
	sdot	z21.d, z4.h, z20.h
	uzp1	z21.s, z21.s, z21.s
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	d21, [x1, 1848]
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 2144
	sdot	z29.d, z26.h, z21.h
	ld1h	z26.h, p7/z, [x3]
	add	x3, x2, 2176
	sdot	z29.d, z27.h, z26.h
	ld1h	z27.h, p7/z, [x3]
	add	x3, x2, 2208
	sdot	z29.d, z28.h, z27.h
	ld1h	z28.h, p7/z, [x3]
	sdot	z29.d, z4.h, z28.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #11
	uzp1	z29.h, z29.h, z29.h
	add	x3, x2, 2240
	ld1w	z28.s, p7/z, [x3]
	movprfx	z27, z24
	mul	z27.s, p7/m, z27.s, z28.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z28.s
	saddv	d27, p7, z27.s
	saddv	d26, p7, z26.s
	str	d29, [x1, 1976]
	movprfx	z29, z31
	mul	z29.s, p7/m, z29.s, z28.s
	mul	z28.s, p7/m, z28.s, z17.s
	saddv	d29, p7, z29.s
	saddv	d28, p7, z28.s
	uzp1	v27.2s, v29.2s, v27.2s
	add	x3, x2, 2272
	uzp1	v28.2d, v26.2d, v28.2d
	movi	v29.4s, 0x4, lsl 8
	xtn2	v27.4s, v28.2d
	add	v27.4s, v27.4s, v29.4s
	shrn	v27.4h, v27.4s, 11
	str	d27, [x1, 120]
	ld1w	z27.s, p7/z, [x3]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d21, p7, z21.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	saddv	d26, p7, z26.s
	add	x3, x2, 2304
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x3]
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	saddv	d21, p7, z21.s
	add	x3, x2, 2336
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 376]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	uzp1	v26.2d, v26.2d, v27.2d
	xtn2	v28.4s, v26.2d
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 632]
	ld1w	z27.s, p7/z, [x3]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d21, p7, z21.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	saddv	d26, p7, z26.s
	add	x3, x2, 2368
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x3]
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	saddv	d21, p7, z21.s
	add	x3, x2, 2400
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 888]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x3]
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	saddv	d21, p7, z21.s
	add	x3, x2, 2432
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 1144]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	uzp1	v26.2d, v26.2d, v27.2d
	ld1w	z27.s, p7/z, [x3]
	movprfx	z21, z24
	mul	z21.s, p7/m, z21.s, z27.s
	saddv	d21, p7, z21.s
	add	x3, x2, 2464
	xtn2	v28.4s, v26.2d
	movprfx	z26, z25
	mul	z26.s, p7/m, z26.s, z27.s
	saddv	d26, p7, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 1400]
	movprfx	z28, z31
	mul	z28.s, p7/m, z28.s, z27.s
	mul	z27.s, p7/m, z27.s, z17.s
	saddv	d28, p7, z28.s
	saddv	d27, p7, z27.s
	uzp1	v28.2s, v28.2s, v21.2s
	uzp1	v26.2d, v26.2d, v27.2d
	movprfx	z27, z16
	mul	z27.s, p7/m, z27.s, z11.s
	saddv	d27, p6, z27.s
	xtn2	v28.4s, v26.2d
	movprfx	z26, z14
	mul	z26.s, p7/m, z26.s, z11.s
	saddv	d26, p6, z26.s
	add	v28.4s, v28.4s, v29.4s
	shrn	v28.4h, v28.4s, 11
	str	d28, [x1, 1656]
	ld1w	z28.s, p7/z, [x3]
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z24.s, p7/m, z24.s, z28.s
	mul	z25.s, p7/m, z25.s, z28.s
	saddv	d24, p7, z24.s
	mul	z28.s, p7/m, z28.s, z17.s
	saddv	d31, p7, z31.s
	saddv	d28, p7, z28.s
	uzp1	v31.2s, v31.2s, v24.2s
	saddv	d25, p7, z25.s
	add	x3, sp, 96
	uzp1	v25.2d, v25.2d, v28.2d
	movprfx	z28, z23
	mul	z28.s, p7/m, z28.s, z11.s
	saddv	d28, p6, z28.s
	uzp1	v28.2d, v28.2d, v26.2d
	xtn2	v31.4s, v25.2d
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 11
	str	d31, [x1, 1912]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z11.s
	saddv	d31, p6, z31.s
	uzp1	v31.2s, v31.2s, v27.2s
	xtn2	v31.4s, v28.2d
	ldr	q28, [x2, 2512]
	movprfx	z26, z16
	mul	z26.s, p7/m, z26.s, z28.s
	movprfx	z27, z23
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d26, p6, z26.s
	saddv	d27, p6, z27.s
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 11
	str	d31, [x1, 248]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z28.s, p7/m, z28.s, z14.s
	saddv	d31, p6, z31.s
	saddv	d28, p6, z28.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v27.2d, v27.2d, v28.2d
	ldr	q28, [x2, 2528]
	movprfx	z26, z16
	mul	z26.s, p7/m, z26.s, z28.s
	saddv	d26, p6, z26.s
	xtn2	v31.4s, v27.2d
	movprfx	z27, z23
	mul	z27.s, p7/m, z27.s, z28.s
	saddv	d27, p6, z27.s
	add	v31.4s, v31.4s, v29.4s
	shrn	v31.4h, v31.4s, 11
	str	d31, [x1, 760]
	movprfx	z31, z30
	mul	z31.s, p7/m, z31.s, z28.s
	mul	z28.s, p7/m, z28.s, z14.s
	saddv	d31, p6, z31.s
	saddv	d28, p6, z28.s
	uzp1	v31.2s, v31.2s, v26.2s
	uzp1	v27.2d, v27.2d, v28.2d
	xtn2	v31.4s, v27.2d
	ldr	z27, [x3]
	fmov	x3, d27
	add	v31.4s, v31.4s, v29.4s
	lsr	x19, x3, 32
	addvl	x3, sp, #1
	add	x3, x3, 96
	ldr	z26, [x3]
	fmov	x3, d26
	shrn	v31.4h, v31.4s, 11
	lsr	x17, x3, 32
	addvl	x3, sp, #2
	add	x3, x3, 96
	ldr	z25, [x3]
	str	d31, [x1, 1272]
	fmov	x3, d25
	fmov	x5, d25
	ldr	q31, [x2, 2544]
	mul	z30.s, p7/m, z30.s, z31.s
	mul	z16.s, p7/m, z16.s, z31.s
	mul	z23.s, p7/m, z23.s, z31.s
	saddv	d30, p6, z30.s
	mul	z31.s, p7/m, z31.s, z14.s
	saddv	d16, p6, z16.s
	saddv	d31, p6, z31.s
	uzp1	v30.2s, v30.2s, v16.2s
	lsr	x30, x3, 32
	addvl	x3, sp, #3
	saddv	d23, p6, z23.s
	add	x3, x3, 96
	ldr	z24, [x3]
	add	x5, x30, x5
	fmov	x3, d24
	uzp1	v23.2d, v23.2d, v31.2d
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	smull	x30, w30, w20
	lsr	x15, x3, 32
	addvl	x3, sp, #4
	add	x3, x3, 96
	sshr	d28, d31, 11
	xtn2	v30.4s, v23.2d
	ldr	z23, [x3]
	fmov	x3, d23
	fmov	x5, d23
	add	v30.4s, v30.4s, v29.4s
	lsr	x18, x3, 32
	addvl	x3, sp, #5
	add	x3, x3, 96
	ldr	z21, [x3]
	add	x5, x18, x5
	fmov	x3, d21
	shrn	v30.4h, v30.4s, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	x5, d13
	smull	x18, w18, w20
	lsr	x14, x3, 32
	fmov	x3, d13
	str	d30, [x1, 1784]
	sshr	d29, d31, 11
	lsr	x16, x3, 32
	addvl	x3, sp, #18
	add	x3, x3, 96
	add	x5, x16, x5
	str	d13, [x3]
	fmov	x3, d15
	lsl	x5, x5, 6
	smull	x16, w16, w20
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	w5, s27
	lsr	x13, x3, 32
	addvl	x3, sp, #18
	add	x3, x3, 104
	sshr	d30, d31, 11
	str	d15, [x3]
	fmov	x3, d27
	add	x3, x19, x3
	lsl	x3, x3, 6
	add	x3, x3, 1024
	fmov	d31, x3
	smull	x3, w19, w20
	mov	w19, 64
	ushr	d31, d31, 11
	smaddl	x3, w5, w19, x3
	fmov	w5, s25
	add	x3, x3, 1024
	ins	v31.h[1], v28.h[0]
	smaddl	x5, w5, w19, x30
	add	x5, x5, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, -8]
	fmov	d31, x5
	fmov	w5, s23
	sshr	d28, d31, 11
	smaddl	x5, w5, w19, x18
	fmov	w18, s26
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	w5, s13
	sshr	d29, d31, 11
	smaddl	x5, w5, w19, x16
	mov	w16, 36
	fmov	w19, s24
	add	x5, x5, 1024
	fmov	d31, x5
	mov	w5, 83
	sshr	d30, d31, 11
	fmov	d31, x3
	smull	x3, w17, w16
	ushr	d31, d31, 11
	smaddl	x3, w18, w5, x3
	smull	x18, w15, w16
	smaddl	x18, w19, w5, x18
	fmov	w19, s21
	add	x3, x3, 1024
	ins	v31.h[1], v28.h[0]
	add	x18, x18, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 1016]
	fmov	d31, x18
	smull	x18, w14, w16
	smaddl	x18, w19, w5, x18
	fmov	w19, s15
	sshr	d28, d31, 11
	add	x18, x18, 1024
	fmov	d31, x18
	smull	x18, w13, w16
	smaddl	x5, w19, w5, x18
	sshr	d29, d31, 11
	mov	w18, -83
	add	x5, x5, 1024
	fmov	d31, x5
	fmov	w5, s24
	smull	x15, w15, w18
	sshr	d30, d31, 11
	fmov	d31, x3
	smull	x14, w14, w18
	fmov	w3, s26
	ushr	d31, d31, 11
	smull	x13, w13, w18
	smaddl	x5, w5, w16, x15
	smull	x17, w17, w18
	add	x5, x5, 1024
	smaddl	x3, w3, w16, x17
	ins	v31.h[1], v28.h[0]
	add	x3, x3, 1024
	ins	v31.h[2], v29.h[0]
	ins	v31.h[3], v30.h[0]
	str	d31, [x1, 504]
	fmov	d31, x5
	fmov	w5, s21
	sshr	d28, d31, 11
	smaddl	x5, w5, w16, x14
	add	x5, x5, 1024
	fmov	d31, x5
	smaddl	x5, w19, w16, x13
	sshr	d29, d31, 11
	add	x5, x5, 1024
	fmov	d31, x5
	sshr	d30, d31, 11
	fmov	d31, x3
	ushr	d31, d31, 11
	ins	v31.h[1], v28.h[0]
	ins	v31.h[2], v29.h[0]
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
	addvl	sp, sp, #18
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
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
