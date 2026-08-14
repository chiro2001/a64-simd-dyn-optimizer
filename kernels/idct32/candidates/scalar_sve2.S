	.arch armv8.2-a+crc+sve2
	.file	"scalar.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB4:
	.cfi_startproc
	addvl	sp, sp, #-31
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x22
	ptrue	p7.b, all
	mov	z27.s, #78
	sub	sp, sp, #3136
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x23,0xc0,0x18,0x22
	mov	z26.s, #90
	mov	z1.s, #88
	addvl	x3, sp, #15
	mov	z0.s, #67
	addvl	x6, sp, #31
	add	x3, x3, 64
	add	x6, x6, 1088
	stp	d8, d9, [sp]
	mov	x8, x6
	mov	x7, 0
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	mov	z12.s, #46
	mov	z13.s, #4
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1sh	z31.s, p7/z, [x0]
	mov	z14.s, #31
	str	z31, [x3]
	add	x3, x0, 64
	ld1sh	z3.s, p7/z, [x3]
	add	x3, x0, 128
	ld1sh	z11.s, p7/z, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	str	z11, [x3]
	mov	z11.s, #-31
	add	x3, x0, 192
	ld1sh	z4.s, p7/z, [x3]
	add	x3, x0, 256
	ld1sh	z18.s, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 320
	ld1sh	z5.s, p7/z, [x3]
	add	x3, x0, 384
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z9, [x3]
	mov	z9.s, #-88
	add	x3, x0, 448
	ld1sh	z6.s, p7/z, [x3]
	add	x3, x0, 512
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 576
	ld1sh	z7.s, p7/z, [x3]
	add	x3, x0, 640
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z8, [x3]
	mov	z8.s, #-13
	add	x3, x0, 704
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 768
	ld1sh	z17.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z17, [x3]
	add	x3, x0, 832
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 896
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 960
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1024
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, x0, 1088
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1152
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, z30.s, #90
	add	x3, x0, 1216
	ld1sh	z20.s, p7/z, [x3]
	movprfx	z31, z30
	mla	z31.s, p7/m, z4.s, z26.s
	add	x3, x0, 1280
	ld1sh	z29.s, p7/z, [x3]
	mla	z31.s, p7/m, z5.s, z1.s
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 1344
	ld1sh	z21.s, p7/z, [x3]
	add	x3, x0, 1408
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	str	z29, [x3]
	mov	z29.s, #82
	add	x3, x0, 1472
	ld1sh	z22.s, p7/z, [x3]
	mla	z30.s, p7/m, z4.s, z29.s
	add	x3, x0, 1536
	ld1sh	z28.s, p7/z, [x3]
	mla	z30.s, p7/m, z5.s, z0.s
	addvl	x3, sp, #27
	mla	z30.s, p7/m, z6.s, z12.s
	add	x3, x3, 64
	str	z28, [x3]
	add	x3, x0, 1600
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1664
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z28, [x3]
	mov	z28.s, #85
	add	x3, x0, 1728
	ld1sh	z24.s, p7/z, [x3]
	mla	z31.s, p7/m, z6.s, z28.s
	add	x3, x0, 1792
	ld1sh	z15.s, p7/z, [x3]
	mla	z31.s, p7/m, z7.s, z29.s
	addvl	x3, sp, #29
	mla	z31.s, p7/m, z16.s, z27.s
	mov	z27.s, #61
	add	x3, x3, 64
	str	z15, [x3]
	mov	z28.s, #73
	add	x3, x0, 1856
	ld1sh	z25.s, p7/z, [x3]
	mov	z15.s, #54
	add	x3, x0, 1920
	ld1sh	z10.s, p7/z, [x3]
	mla	z31.s, p7/m, z17.s, z28.s
	addvl	x3, sp, #30
	mla	z31.s, p7/m, z18.s, z0.s
	mla	z31.s, p7/m, z19.s, z27.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z20.s, z15.s
	mov	z27.s, #13
	mla	z31.s, p7/m, z21.s, z12.s
	mov	z12.s, #-85
	str	z10, [x3]
	add	x3, x0, 1984
	mov	z10.s, #22
	ld1sh	z2.s, p7/z, [x3]
	mov	z29.s, #-4
	mov	z28.s, #38
	mla	z30.s, p7/m, z7.s, z10.s
	mla	z31.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z16.s, z29.s
	mla	z31.s, p7/m, z23.s, z14.s
	mla	z30.s, p7/m, z17.s, z11.s
	mla	z31.s, p7/m, z24.s, z10.s
	add	x3, sp, 64
	mla	z31.s, p7/m, z25.s, z27.s
	mov	z27.s, #-73
	mla	z31.s, p7/m, z2.s, z13.s
	mov	z13.s, #-54
	mla	z30.s, p7/m, z18.s, z13.s
	mla	z30.s, p7/m, z19.s, z27.s
	mla	z30.s, p7/m, z20.s, z12.s
	mov	z12.s, #-61
	mov	z27.s, #-90
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z9.s
	mov	z9.d, z12.d
	str	z31, [x3]
	mov	z31.s, #-78
	addvl	x3, sp, #1
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z12.s
	mov	z12.s, #-38
	mla	z30.s, p7/m, z25.s, z12.s
	mla	z30.s, p7/m, z2.s, z8.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, p7/m, z30.s, z1.s
	mla	z30.s, p7/m, z4.s, z0.s
	mla	z30.s, p7/m, z5.s, z14.s
	mla	z30.s, p7/m, z6.s, z8.s
	mla	z30.s, p7/m, z7.s, z13.s
	mov	z13.s, #-82
	mla	z30.s, p7/m, z16.s, z13.s
	mla	z30.s, p7/m, z17.s, z27.s
	mov	z13.s, #-46
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z13.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #85
	mla	z30.s, p7/m, z23.s, z26.s
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #61
	addvl	x3, sp, #2
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z2.s, z10.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, z30.s, #85
	mla	z30.s, p7/m, z4.s, z28.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z5.s, z8.s
	mla	z30.s, p7/m, z6.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z7.s, z27.s
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #38
	addvl	x3, sp, #3
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z1.s
	mla	z30.s, p7/m, z21.s, z15.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z9.s
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z2.s, z11.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, p7/m, z30.s, z28.s
	mov	z28.s, #-54
	mla	z30.s, p7/m, z4.s, z10.s
	mla	z30.s, p7/m, z5.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z6.s, z27.s
	mla	z30.s, p7/m, z7.s, z9.s
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #85
	mov	z9.d, z28.d
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z14.s
	mla	z30.s, p7/m, z20.s, z13.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #38
	mla	z30.s, p7/m, z25.s, z1.s
	addvl	x3, sp, #4
	mla	z30.s, p7/m, z2.s, z28.s
	mov	z28.s, #-82
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z4.s, z29.s
	mla	z30.s, p7/m, z5.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z6.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z7.s, z28.s
	mla	z30.s, p7/m, z16.s, z9.s
	mov	z9.s, #-88
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z1.s, #-22
	addvl	x3, sp, #5
	mla	z30.s, p7/m, z18.s, z1.s
	mla	z30.s, p7/m, z19.s, z9.s
	mov	z9.s, #-61
	mla	z30.s, p7/m, z20.s, z9.s
	mla	z30.s, p7/m, z21.s, z14.s
	mov	z14.s, #78
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z15.s
	mla	z30.s, p7/m, z24.s, z12.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z2.s, z13.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z4.s, z11.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z6.s, z1.s
	mla	z30.s, p7/m, z7.s, z14.s
	mov	z14.s, #82
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z1.s, #-88
	mla	z30.s, p7/m, z17.s, z12.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z8.s
	mla	z30.s, p7/m, z20.s, z14.s
	mov	z14.s, #61
	addvl	x3, sp, #6
	mla	z30.s, p7/m, z21.s, z14.s
	mov	z14.s, #85
	mla	z30.s, p7/m, z22.s, z13.s
	mla	z30.s, p7/m, z23.s, z1.s
	mov	z1.s, #-54
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z14.s
	mla	z30.s, p7/m, z2.s, z15.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z3
	mul	z30.s, p7/m, z30.s, z0.s
	mla	z30.s, p7/m, z4.s, z1.s
	mov	z1.s, #38
	mla	z30.s, p7/m, z5.s, z31.s
	mla	z30.s, p7/m, z6.s, z1.s
	mov	z1.s, #-22
	mla	z30.s, p7/m, z7.s, z14.s
	mov	z14.s, #4
	mla	z30.s, p7/m, z16.s, z1.s
	mov	z1.s, #-88
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z14.s
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z14.d, z28.d
	mla	z30.s, p7/m, z22.s, z11.s
	mov	z1.s, #46
	mla	z30.s, p7/m, z23.s, z28.s
	addvl	x3, sp, #7
	mla	z30.s, p7/m, z24.s, z1.s
	mov	z28.s, #-73
	add	x3, x3, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z28.s
	movprfx	z30, z3
	mul	z30.s, z30.s, #61
	mla	z1.s, p7/m, z2.s, z9.s
	mla	z30.s, p7/m, z4.s, z28.s
	mov	z28.s, #85
	mla	z30.s, p7/m, z5.s, z13.s
	mla	z30.s, p7/m, z6.s, z14.s
	mov	z14.s, #31
	mla	z30.s, p7/m, z7.s, z14.s
	str	z1, [x3]
	mov	z1.s, #-88
	addvl	x3, sp, #8
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z10.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z23.s, z12.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z12, z30
	mla	z12.s, p7/m, z25.s, z15.s
	mla	z12.s, p7/m, z2.s, z0.s
	movprfx	z30, z3
	mul	z30.s, p7/m, z30.s, z15.s
	add	x3, x3, 64
	mov	z1.s, #88
	str	z12, [x3]
	mov	z12.s, #-85
	mla	z30.s, p7/m, z4.s, z12.s
	mla	z30.s, p7/m, z5.s, z29.s
	mla	z30.s, p7/m, z6.s, z1.s
	mla	z30.s, p7/m, z7.s, z13.s
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #38
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z1.s, #-22
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z21.s, z0.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z26.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z11.s
	mla	z1.s, p7/m, z2.s, z28.s
	mov	z28.s, #38
	movprfx	z30, z3
	mul	z30.s, z30.s, #46
	addvl	x3, sp, #9
	mla	z30.s, p7/m, z4.s, z27.s
	mla	z30.s, p7/m, z5.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z27.s
	mla	z30.s, p7/m, z16.s, z14.s
	mov	z14.s, #61
	add	x3, x3, 64
	mla	z30.s, p7/m, z17.s, z14.s
	mov	z14.s, #4
	str	z1, [x3]
	mov	z1.s, #-88
	mla	z30.s, p7/m, z18.s, z1.s
	mla	z30.s, p7/m, z19.s, z10.s
	mla	z30.s, p7/m, z20.s, z0.s
	mla	z30.s, p7/m, z21.s, z12.s
	mov	z12.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z12.s
	mla	z30.s, p7/m, z25.s, z14.s
	mov	z1.d, z14.d
	addvl	x3, sp, #10
	mov	z14.d, z30.d
	mov	z30.s, #78
	mla	z14.s, p7/m, z2.s, z30.s
	add	x3, x3, 64
	mov	z12.s, #-88
	str	z14, [x3]
	mov	z14.s, #-67
	movprfx	z30, z3
	mul	z30.s, z30.s, #38
	addvl	x3, sp, #11
	mla	z30.s, p7/m, z4.s, z12.s
	mov	z12.s, #13
	mla	z30.s, p7/m, z5.s, z28.s
	mla	z30.s, p7/m, z6.s, z29.s
	mla	z30.s, p7/m, z7.s, z14.s
	mov	z14.s, #85
	mla	z30.s, p7/m, z16.s, z26.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z17.s, z13.s
	mla	z30.s, p7/m, z18.s, z11.s
	mla	z30.s, p7/m, z19.s, z14.s
	mov	z14.s, #61
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z12.s
	mov	z12.s, #-82
	mla	z30.s, p7/m, z22.s, z14.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z15.s
	movprfx	z14, z30
	mla	z14.s, p7/m, z25.s, z10.s
	movprfx	z30, z3
	mul	z30.s, z30.s, #31
	mla	z14.s, p7/m, z2.s, z12.s
	mla	z30.s, p7/m, z4.s, z31.s
	mov	z12.s, #-88
	mla	z30.s, p7/m, z5.s, z26.s
	mla	z30.s, p7/m, z6.s, z9.s
	mla	z30.s, p7/m, z7.s, z1.s
	mov	z1.s, #82
	str	z14, [x3]
	addvl	x3, sp, #12
	mla	z30.s, p7/m, z16.s, z15.s
	mla	z30.s, p7/m, z17.s, z12.s
	add	x3, x3, 64
	mov	z12.s, #-38
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #-22
	mla	z30.s, p7/m, z19.s, z12.s
	mla	z30.s, p7/m, z20.s, z1.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z8.s
	mov	z14.s, #85
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z13.s
	movprfx	z30, z3
	mul	z30.s, p7/m, z30.s, z10.s
	mla	z1.s, p7/m, z2.s, z14.s
	mla	z30.s, p7/m, z4.s, z9.s
	mla	z30.s, p7/m, z5.s, z14.s
	mla	z30.s, p7/m, z6.s, z27.s
	mla	z30.s, p7/m, z7.s, z28.s
	mla	z30.s, p7/m, z16.s, z12.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	str	z1, [x3]
	addvl	x3, sp, #13
	mla	z30.s, p7/m, z18.s, z29.s
	add	x3, x3, 64
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z15.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z11.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z0.s
	mov	z30.s, #-88
	mla	z28.s, p7/m, z2.s, z30.s
	str	z28, [x3]
	addvl	x3, sp, #14
	movprfx	z30, z3
	mul	z30.s, z30.s, #13
	mov	z14.s, #61
	mla	z30.s, p7/m, z4.s, z12.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z5.s, z14.s
	mov	z28.s, #85
	mad	z31.s, p7/m, z6.s, z30.s
	mov	z1.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z7.s, z1.s
	mov	z14.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z28.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z15.s
	mla	z31.s, p7/m, z20.s, z11.s
	mla	z31.s, p7/m, z21.s, z14.s
	mla	z31.s, p7/m, z22.s, z10.s
	mla	z31.s, p7/m, z23.s, z13.s
	mla	z31.s, p7/m, z24.s, z0.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z2.s, z26.s
	str	z31, [x3]
	addvl	x3, sp, #16
	lsl	z3.s, z3.s, #2
	mad	z4.s, p7/m, z8.s, z3.s
	add	x3, x3, 64
	mad	z5.s, p7/m, z10.s, z4.s
	mad	z6.s, p7/m, z11.s, z5.s
	ldr	z11, [x3]
	addvl	x3, sp, #18
	mov	z31.s, #38
	add	x3, x3, 64
	mad	z7.s, p7/m, z31.s, z6.s
	mad	z16.s, p7/m, z13.s, z7.s
	mad	z17.s, p7/m, z15.s, z16.s
	mad	z18.s, p7/m, z9.s, z17.s
	ldr	z9, [x3]
	addvl	x3, sp, #20
	mad	z19.s, p7/m, z0.s, z18.s
	mov	z14.s, #78
	add	x3, x3, 64
	ldr	z8, [x3]
	mad	z20.s, p7/m, z30.s, z19.s
	addvl	x3, sp, #22
	mad	z21.s, p7/m, z14.s, z20.s
	mov	z31.s, #-88
	add	x3, x3, 64
	ldr	z7, [x3]
	mad	z22.s, p7/m, z29.s, z21.s
	addvl	x3, sp, #24
	mad	z23.s, p7/m, z28.s, z22.s
	mov	z19.s, #70
	add	x3, x3, 64
	ldr	z6, [x3]
	mov	z22.s, #43
	addvl	x3, sp, #26
	mov	z17.s, #87
	mad	z24.s, p7/m, z31.s, z23.s
	add	x3, x3, 64
	ldr	z5, [x3]
	mov	z23.s, #57
	addvl	x3, sp, #28
	mad	z25.s, p7/m, z26.s, z24.s
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	add	x3, x3, 64
	ldr	z4, [x3]
	mla	z31.s, p7/m, z9.s, z17.s
	mov	z20.s, #25
	mov	z30.s, #80
	addvl	x3, sp, #30
	mla	z31.s, p7/m, z8.s, z30.s
	mla	z31.s, p7/m, z7.s, z19.s
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	mla	z31.s, p7/m, z4.s, z20.s
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z2.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x3, x3, 64
	ldr	z10, [x3]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x3, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x3]
	addvl	x3, sp, #21
	mov	z16.s, #-57
	add	x3, x3, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z8.s, z22.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x3]
	addvl	x3, sp, #25
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	add	x3, x3, 64
	ldr	z16, [x3]
	mla	z30.s, p7/m, z10.s, z22.s
	addvl	x3, sp, #29
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x3, x3, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x3]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x3, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z18, [x3]
	mla	z21.s, p7/m, z15.s, z22.s
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x3, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z17, [x3]
	lsl	z18.s, z22.s, #6
	add	x3, sp, 64
	mov	z22.s, #64
	mov	z11.s, #-64
	mad	z22.s, p7/m, z17.s, z18.s
	mad	z11.s, p7/m, z17.s, z18.s
	add	z16.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z22.s, z22.s, z19.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x3]
	addvl	x3, sp, #1
	add	z19.s, z11.s, z23.s
	add	x3, x3, 64
	add	z9.s, z19.s, z30.s
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x3]
	addvl	x3, sp, #2
	add	z17.s, z16.s, z26.s
	add	x3, x3, 64
	sub	z23.s, z11.s, z23.s
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x3]
	addvl	x3, sp, #3
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	x3, x3, 64
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x3]
	addvl	x3, sp, #4
	add	z11.s, z26.s, z27.s
	add	x3, x3, 64
	sub	z26.s, z26.s, z27.s
	ldr	z27, [x3]
	addvl	x3, sp, #5
	sub	z22.s, z22.s, z21.s
	add	z21.s, z22.s, z25.s
	add	x3, x3, 64
	sub	z22.s, z22.s, z25.s
	ldr	z25, [x3]
	addvl	x3, sp, #6
	add	z8.s, z18.s, z14.s
	sub	z18.s, z18.s, z14.s
	add	x3, x3, 64
	ldr	z14, [x3]
	add	z7.s, z17.s, z13.s
	addvl	x3, sp, #7
	sub	z17.s, z17.s, z13.s
	add	z14.s, z15.s, z14.s
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z13.s, z11.s, z1.s
	addvl	x3, sp, #15
	add	z25.s, z16.s, z25.s
	add	z27.s, z21.s, z27.s
	add	x3, x3, 64
	str	z13, [x3]
	add	z13.s, z17.s, z12.s
	addvl	x3, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z28.s, z10.s, z28.s
	add	x3, x3, 64
	ldr	z6, [x3]
	add	z6.s, z26.s, z6.s
	addvl	x3, sp, #9
	add	z29.s, z9.s, z29.s
	add	z30.s, z8.s, z30.s
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z5.s, z24.s, z5.s
	addvl	x3, sp, #10
	add	z31.s, z7.s, z31.s
	sqrshrnb	z31.h, z31.s, #7
	add	x3, x3, 64
	ldr	z4, [x3]
	add	z4.s, z23.s, z4.s
	addvl	x3, sp, #11
	uzp1	z31.h, z31.h, z31.h
	sqrshrnb	z30.h, z30.s, #7
	add	x3, x3, 64
	ldr	z3, [x3]
	add	z3.s, z22.s, z3.s
	addvl	x3, sp, #12
	uzp1	z30.h, z30.h, z30.h
	sqrshrnb	z29.h, z29.s, #7
	add	x3, x3, 64
	ldr	z2, [x3]
	add	z2.s, z20.s, z2.s
	addvl	x3, sp, #13
	uzp1	z29.h, z29.h, z29.h
	sqrshrnb	z28.h, z28.s, #7
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z1.s, z19.s, z0.s
	addvl	x3, sp, #14
	uzp1	z28.h, z28.h, z28.h
	sqrshrnb	z27.h, z27.s, #7
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z0.s, z18.s, z0.s
	addvl	x3, sp, #16
	uzp1	z27.h, z27.h, z27.h
	sqrshrnb	z25.h, z25.s, #7
	add	x3, x3, 64
	str	z13, [x3]
	uzp1	z25.h, z25.h, z25.h
	addvl	x3, sp, #14
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z18.s, z18.s, z12.s
	addvl	x3, sp, #13
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z19.s, z19.s, z12.s
	addvl	x3, sp, #12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z20.s, z20.s, z12.s
	addvl	x3, sp, #11
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z22.s, z22.s, z12.s
	addvl	x3, sp, #10
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z23.s, z23.s, z12.s
	addvl	x3, sp, #9
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z24.s, z24.s, z12.s
	addvl	x3, sp, #8
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z26.s, z26.s, z12.s
	addvl	x3, sp, #7
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z11.s, z11.s, z12.s
	addvl	x3, sp, #6
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z15.s, z15.s, z12.s
	addvl	x3, sp, #5
	sqrshrnb	z18.h, z18.s, #7
	uzp1	z18.h, z18.h, z18.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z16.s, z16.s, z12.s
	addvl	x3, sp, #4
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z21.s, z21.s, z12.s
	addvl	x3, sp, #3
	sqrshrnb	z20.h, z20.s, #7
	uzp1	z20.h, z20.h, z20.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z10.s, z10.s, z12.s
	addvl	x3, sp, #2
	sqrshrnb	z22.h, z22.s, #7
	uzp1	z22.h, z22.h, z22.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z9.s, z9.s, z12.s
	addvl	x3, sp, #1
	sqrshrnb	z23.h, z23.s, #7
	uzp1	z23.h, z23.h, z23.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z8.s, z8.s, z12.s
	add	x3, sp, 64
	ldr	z12, [x3]
	sqrshrnb	z24.h, z24.s, #7
	addvl	x3, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sqrshrnb	z26.h, z26.s, #7
	add	x3, x3, 64
	uzp1	z26.h, z26.h, z26.h
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	str	q31, [x3]
	addvl	x3, sp, #31
	sqrshrnb	z16.h, z16.s, #7
	add	x3, x3, 96
	uzp1	z16.h, z16.h, z16.h
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	str	q30, [x3]
	addvl	x3, sp, #31
	sqrshrnb	z9.h, z9.s, #7
	add	x3, x3, 128
	uzp1	z9.h, z9.h, z9.h
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 160
	str	q28, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 192
	str	q27, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 224
	str	q25, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 256
	str	q14, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z13.h, z31.s, #7
	addvl	x3, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 288
	str	q13, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 320
	str	q6, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 352
	str	q5, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 384
	str	q4, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 416
	str	q3, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 448
	str	q2, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 480
	str	q1, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 512
	str	q0, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z13, [x3]
	sqrshrnb	z31.h, z13.s, #7
	addvl	x3, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 544
	str	q31, [x3]
	addvl	x3, sp, #31
	sqrshrnb	z31.h, z12.s, #7
	add	x3, x3, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 608
	str	q18, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 640
	str	q19, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 672
	str	q20, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 704
	str	q22, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 736
	str	q23, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 768
	str	q24, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 800
	str	q26, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 832
	str	q11, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 864
	str	q15, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 896
	str	q16, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 928
	str	q21, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 960
	str	q10, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 992
	str	q9, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1024
	str	q8, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1056
	str	q31, [x3]
	.p2align 5,,15
.L2:
	sub	x3, x6, #1024
	mov	x4, x8
	.p2align 5,,15
.L3:
	ldrh	w5, [x3], 32
	strh	w5, [x4], 2
	cmp	x3, x6
	bne	.L3
	add	x7, x7, 32
	add	x8, x8, 64
	add	x6, x3, 2
	cmp	x7, 256
	bne	.L2
	add	x3, x0, 16
	ptrue	p7.b, all
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #15
	mov	z26.s, #90
	mov	z3.s, #88
	add	x3, x3, 64
	str	z31, [x3]
	mov	z2.s, #22
	add	x3, x0, 80
	ld1sh	z11.s, p7/z, [x3]
	mov	z0.s, #31
	add	x3, x0, 144
	ld1sh	z31.s, p7/z, [x3]
	mov	z28.s, #73
	addvl	x3, sp, #16
	mov	z1.s, #46
	mov	z27.s, #4
	add	x3, x3, 64
	str	z31, [x3]
	addvl	x8, sp, #31
	add	x3, x0, 208
	ld1sh	z12.s, p7/z, [x3]
	addvl	x6, sp, #31
	add	x3, x0, 272
	ld1sh	z18.s, p7/z, [x3]
	add	x8, x8, 1600
	addvl	x3, sp, #17
	add	x6, x6, 1088
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 336
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 400
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z9, [x3]
	mov	z9.s, #85
	add	x3, x0, 464
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 528
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 592
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 656
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z8, [x3]
	mov	z8.s, #67
	add	x3, x0, 720
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 784
	ld1sh	z17.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z17, [x3]
	add	x3, x0, 848
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 912
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z7, [x3]
	mov	z7.s, #54
	add	x3, x0, 976
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1040
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, x0, 1104
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1168
	ld1sh	z6.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z6, [x3]
	mov	z6.s, #82
	add	x3, x0, 1232
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1296
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	add	x3, x0, 1360
	ld1sh	z21.s, p7/z, [x3]
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	add	x3, x0, 1424
	ld1sh	z5.s, p7/z, [x3]
	mla	z31.s, p7/m, z13.s, z3.s
	addvl	x3, sp, #26
	mla	z31.s, p7/m, z14.s, z9.s
	mla	z31.s, p7/m, z15.s, z6.s
	add	x3, x3, 64
	str	z5, [x3]
	mla	z30.s, p7/m, z12.s, z6.s
	add	x3, x0, 1488
	ld1sh	z22.s, p7/z, [x3]
	mla	z30.s, p7/m, z13.s, z8.s
	add	x3, x0, 1552
	ld1sh	z29.s, p7/z, [x3]
	mla	z30.s, p7/m, z14.s, z1.s
	addvl	x3, sp, #27
	mla	z30.s, p7/m, z15.s, z2.s
	mov	z6.s, #-88
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 1616
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1680
	ld1sh	z4.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z4, [x3]
	mov	z4.s, #38
	add	x3, x0, 1744
	ld1sh	z24.s, p7/z, [x3]
	add	x3, x0, 1808
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #29
	add	x3, x3, 64
	str	z29, [x3]
	mov	z29.s, #78
	add	x3, x0, 1872
	ld1sh	z25.s, p7/z, [x3]
	mla	z31.s, p7/m, z16.s, z29.s
	add	x3, x0, 1936
	ld1sh	z10.s, p7/z, [x3]
	mov	z29.s, #61
	addvl	x3, sp, #30
	mla	z31.s, p7/m, z17.s, z28.s
	mla	z31.s, p7/m, z18.s, z8.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z19.s, z29.s
	mov	z29.s, #13
	mla	z31.s, p7/m, z20.s, z7.s
	mla	z31.s, p7/m, z21.s, z1.s
	mla	z31.s, p7/m, z22.s, z4.s
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	mla	z31.s, p7/m, z25.s, z29.s
	str	z10, [x3]
	add	x3, x0, 2000
	ld1sh	z10.s, p7/z, [x3]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x3, sp, 64
	str	z31, [x3]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x3, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x3, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x3, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x3, x3, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x3, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x3, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x3, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x3, x3, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x3, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x3, x3, 64
	str	z3, [x3]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x3, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x3, x3, 64
	str	z1, [x3]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x3, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x3, x3, 64
	mov	z28.s, #13
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x3, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x3, x3, 64
	mov	z1.s, #-31
	str	z0, [x3]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x3, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x3, x3, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x3, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x3]
	addvl	x3, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x3, x3, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x3]
	addvl	x3, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x3, x3, 64
	ldr	z8, [x3]
	mov	z19.s, #70
	addvl	x3, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x3, x3, 64
	ldr	z7, [x3]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x3, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x3, x3, 64
	ldr	z6, [x3]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x3, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x3, x3, 64
	ldr	z5, [x3]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x3, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x3, x3, 64
	ldr	z4, [x3]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x3, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x3, x3, 64
	ldr	z10, [x3]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x3, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x3]
	addvl	x3, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x3]
	addvl	x3, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x3, x3, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x3]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x3, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x3]
	addvl	x3, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x3, x3, 64
	ldr	z18, [x3]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x3, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x3]
	addvl	x3, sp, #23
	lsl	z18.s, z22.s, #6
	add	x3, x3, 64
	ldr	z17, [x3]
	mov	z22.s, #64
	add	x3, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x3]
	addvl	x3, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x3, x3, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x3]
	addvl	x3, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x3, x3, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x3]
	addvl	x3, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x3, x3, 64
	ldr	z27, [x3]
	sub	z22.s, z22.s, z21.s
	addvl	x3, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x3, x3, 64
	ldr	z25, [x3]
	add	z8.s, z18.s, z14.s
	addvl	x3, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x3, x3, 64
	ldr	z14, [x3]
	sub	z17.s, z17.s, z13.s
	addvl	x3, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x3, x3, 64
	ldr	z3, [x3]
	add	z13.s, z11.s, z3.s
	addvl	x3, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x3, x3, 64
	str	z13, [x3]
	add	z13.s, z17.s, z12.s
	addvl	x3, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z6.s, z26.s, z1.s
	addvl	x3, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z5.s, z24.s, z5.s
	addvl	x3, sp, #10
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z4.s, z23.s, z0.s
	addvl	x3, sp, #11
	sqrshrnb	z30.h, z30.s, #7
	uzp1	z30.h, z30.h, z30.h
	add	x3, x3, 64
	ldr	z2, [x3]
	add	z3.s, z22.s, z2.s
	addvl	x3, sp, #12
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 64
	ldr	z2, [x3]
	add	z2.s, z20.s, z2.s
	addvl	x3, sp, #13
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z1.s, z19.s, z1.s
	addvl	x3, sp, #14
	sqrshrnb	z27.h, z27.s, #7
	uzp1	z27.h, z27.h, z27.h
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z0.s, z18.s, z0.s
	addvl	x3, sp, #16
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z25.h, z25.h, z25.h
	add	x3, x3, 64
	str	z13, [x3]
	sqrshrnb	z14.h, z14.s, #7
	addvl	x3, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z18.s, z18.s, z12.s
	addvl	x3, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z19.s, z19.s, z12.s
	addvl	x3, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z20.s, z20.s, z12.s
	addvl	x3, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z22.s, z22.s, z12.s
	addvl	x3, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z23.s, z23.s, z12.s
	addvl	x3, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z24.s, z24.s, z12.s
	addvl	x3, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z26.s, z26.s, z12.s
	addvl	x3, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z11.s, z11.s, z12.s
	addvl	x3, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z15.s, z15.s, z12.s
	addvl	x3, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z16.s, z16.s, z12.s
	addvl	x3, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z21.s, z21.s, z12.s
	addvl	x3, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z10.s, z10.s, z12.s
	addvl	x3, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z9.s, z9.s, z12.s
	addvl	x3, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z8.s, z8.s, z12.s
	add	x3, sp, 64
	ldr	z12, [x3]
	uzp1	z24.h, z24.h, z24.h
	addvl	x3, sp, #31
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	add	x3, x3, 64
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #7
	str	q31, [x3]
	addvl	x3, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 96
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #7
	str	q30, [x3]
	addvl	x3, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x3, x3, 128
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 160
	str	q28, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 192
	str	q27, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 224
	str	q25, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 256
	str	q14, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z13.h, z31.s, #7
	addvl	x3, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 288
	str	q13, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 320
	str	q6, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 352
	str	q5, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 384
	str	q4, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 416
	str	q3, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 448
	str	q2, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 480
	str	q1, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 512
	str	q0, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z13, [x3]
	sqrshrnb	z31.h, z13.s, #7
	addvl	x3, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 544
	str	q31, [x3]
	addvl	x3, sp, #31
	sqrshrnb	z31.h, z12.s, #7
	add	x3, x3, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 608
	str	q18, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 640
	str	q19, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 672
	str	q20, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 704
	str	q22, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 736
	str	q23, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 768
	str	q24, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 800
	str	q26, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 832
	str	q11, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 864
	str	q15, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 896
	str	q16, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 928
	str	q21, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 960
	str	q10, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 992
	str	q9, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1024
	str	q8, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1056
	str	q31, [x3]
	.p2align 5,,15
.L5:
	sub	x3, x6, #1024
	mov	x4, x8
	.p2align 5,,15
.L6:
	ldrh	w5, [x3], 32
	strh	w5, [x4], 2
	cmp	x3, x6
	bne	.L6
	add	x7, x7, 32
	add	x8, x8, 64
	add	x6, x3, 2
	cmp	x7, 512
	bne	.L5
	add	x3, x0, 32
	ptrue	p7.b, all
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #15
	mov	z26.s, #90
	mov	z3.s, #88
	add	x3, x3, 64
	str	z31, [x3]
	mov	z2.s, #22
	add	x3, x0, 96
	ld1sh	z11.s, p7/z, [x3]
	mov	z0.s, #31
	add	x3, x0, 160
	ld1sh	z31.s, p7/z, [x3]
	mov	z28.s, #73
	addvl	x3, sp, #16
	mov	z1.s, #46
	mov	z27.s, #4
	add	x3, x3, 64
	str	z31, [x3]
	addvl	x8, sp, #31
	add	x3, x0, 224
	ld1sh	z12.s, p7/z, [x3]
	addvl	x6, sp, #31
	add	x3, x0, 288
	ld1sh	z18.s, p7/z, [x3]
	add	x8, x8, 2112
	addvl	x3, sp, #17
	add	x6, x6, 1088
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 352
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 416
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z9, [x3]
	mov	z9.s, #85
	add	x3, x0, 480
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 544
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 608
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 672
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z8, [x3]
	mov	z8.s, #67
	add	x3, x0, 736
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 800
	ld1sh	z17.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z17, [x3]
	add	x3, x0, 864
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 928
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z7, [x3]
	mov	z7.s, #54
	add	x3, x0, 992
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1056
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, x0, 1120
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1184
	ld1sh	z6.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z6, [x3]
	mov	z6.s, #82
	add	x3, x0, 1248
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1312
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	add	x3, x0, 1376
	ld1sh	z21.s, p7/z, [x3]
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	add	x3, x0, 1440
	ld1sh	z5.s, p7/z, [x3]
	mla	z31.s, p7/m, z13.s, z3.s
	addvl	x3, sp, #26
	mla	z31.s, p7/m, z14.s, z9.s
	mla	z31.s, p7/m, z15.s, z6.s
	add	x3, x3, 64
	str	z5, [x3]
	mla	z30.s, p7/m, z12.s, z6.s
	add	x3, x0, 1504
	ld1sh	z22.s, p7/z, [x3]
	mla	z30.s, p7/m, z13.s, z8.s
	add	x3, x0, 1568
	ld1sh	z29.s, p7/z, [x3]
	mla	z30.s, p7/m, z14.s, z1.s
	addvl	x3, sp, #27
	mla	z30.s, p7/m, z15.s, z2.s
	mov	z6.s, #-88
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 1632
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1696
	ld1sh	z4.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z4, [x3]
	mov	z4.s, #38
	add	x3, x0, 1760
	ld1sh	z24.s, p7/z, [x3]
	add	x3, x0, 1824
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #29
	add	x3, x3, 64
	str	z29, [x3]
	mov	z29.s, #78
	add	x3, x0, 1888
	ld1sh	z25.s, p7/z, [x3]
	mla	z31.s, p7/m, z16.s, z29.s
	add	x3, x0, 1952
	ld1sh	z10.s, p7/z, [x3]
	mov	z29.s, #61
	addvl	x3, sp, #30
	mla	z31.s, p7/m, z17.s, z28.s
	mla	z31.s, p7/m, z18.s, z8.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z19.s, z29.s
	mov	z29.s, #13
	mla	z31.s, p7/m, z20.s, z7.s
	mla	z31.s, p7/m, z21.s, z1.s
	mla	z31.s, p7/m, z22.s, z4.s
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	mla	z31.s, p7/m, z25.s, z29.s
	str	z10, [x3]
	add	x3, x0, 2016
	ld1sh	z10.s, p7/z, [x3]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x3, sp, 64
	str	z31, [x3]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x3, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x3, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x3, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x3, x3, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x3, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x3, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x3, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x3, x3, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x3, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x3, x3, 64
	str	z3, [x3]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x3, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x3, x3, 64
	str	z1, [x3]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x3, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x3, x3, 64
	mov	z28.s, #13
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x3, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x3, x3, 64
	mov	z1.s, #-31
	str	z0, [x3]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x3, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x3, x3, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x3, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x3]
	addvl	x3, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x3, x3, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x3]
	addvl	x3, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x3, x3, 64
	ldr	z8, [x3]
	mov	z19.s, #70
	addvl	x3, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x3, x3, 64
	ldr	z7, [x3]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x3, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x3, x3, 64
	ldr	z6, [x3]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x3, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x3, x3, 64
	ldr	z5, [x3]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x3, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x3, x3, 64
	ldr	z4, [x3]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x3, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x3, x3, 64
	ldr	z10, [x3]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x3, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x3]
	addvl	x3, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x3]
	addvl	x3, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x3, x3, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x3]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x3, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x3]
	addvl	x3, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x3, x3, 64
	ldr	z18, [x3]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x3, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x3, x3, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x3]
	addvl	x3, sp, #23
	lsl	z18.s, z22.s, #6
	add	x3, x3, 64
	ldr	z17, [x3]
	mov	z22.s, #64
	add	x3, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x3]
	addvl	x3, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x3, x3, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x3]
	addvl	x3, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x3, x3, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x3]
	addvl	x3, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x3, x3, 64
	ldr	z27, [x3]
	sub	z22.s, z22.s, z21.s
	addvl	x3, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x3, x3, 64
	ldr	z25, [x3]
	add	z8.s, z18.s, z14.s
	addvl	x3, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x3, x3, 64
	ldr	z14, [x3]
	sub	z17.s, z17.s, z13.s
	addvl	x3, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x3, x3, 64
	ldr	z3, [x3]
	add	z13.s, z11.s, z3.s
	addvl	x3, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x3, x3, 64
	str	z13, [x3]
	add	z13.s, z17.s, z12.s
	addvl	x3, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z6.s, z26.s, z1.s
	addvl	x3, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z5.s, z24.s, z5.s
	addvl	x3, sp, #10
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z4.s, z23.s, z0.s
	addvl	x3, sp, #11
	sqrshrnb	z30.h, z30.s, #7
	uzp1	z30.h, z30.h, z30.h
	add	x3, x3, 64
	ldr	z2, [x3]
	add	z3.s, z22.s, z2.s
	addvl	x3, sp, #12
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 64
	ldr	z2, [x3]
	add	z2.s, z20.s, z2.s
	addvl	x3, sp, #13
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z1.s, z19.s, z1.s
	addvl	x3, sp, #14
	sqrshrnb	z27.h, z27.s, #7
	uzp1	z27.h, z27.h, z27.h
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z0.s, z18.s, z0.s
	addvl	x3, sp, #16
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z25.h, z25.h, z25.h
	add	x3, x3, 64
	str	z13, [x3]
	sqrshrnb	z14.h, z14.s, #7
	addvl	x3, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z18.s, z18.s, z12.s
	addvl	x3, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z19.s, z19.s, z12.s
	addvl	x3, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z20.s, z20.s, z12.s
	addvl	x3, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z22.s, z22.s, z12.s
	addvl	x3, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z23.s, z23.s, z12.s
	addvl	x3, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z24.s, z24.s, z12.s
	addvl	x3, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z26.s, z26.s, z12.s
	addvl	x3, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z11.s, z11.s, z12.s
	addvl	x3, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z15.s, z15.s, z12.s
	addvl	x3, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z16.s, z16.s, z12.s
	addvl	x3, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z21.s, z21.s, z12.s
	addvl	x3, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z10.s, z10.s, z12.s
	addvl	x3, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z9.s, z9.s, z12.s
	addvl	x3, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z8.s, z8.s, z12.s
	add	x3, sp, 64
	ldr	z12, [x3]
	uzp1	z24.h, z24.h, z24.h
	addvl	x3, sp, #31
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	add	x3, x3, 64
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #7
	str	q31, [x3]
	addvl	x3, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 96
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #7
	str	q30, [x3]
	addvl	x3, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x3, x3, 128
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 160
	str	q28, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 192
	str	q27, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 224
	str	q25, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 256
	str	q14, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z13.h, z31.s, #7
	addvl	x3, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 288
	str	q13, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 320
	str	q6, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 352
	str	q5, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 384
	str	q4, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 416
	str	q3, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 448
	str	q2, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 480
	str	q1, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 512
	str	q0, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z13, [x3]
	sqrshrnb	z31.h, z13.s, #7
	addvl	x3, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 544
	str	q31, [x3]
	addvl	x3, sp, #31
	sqrshrnb	z31.h, z12.s, #7
	add	x3, x3, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 608
	str	q18, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 640
	str	q19, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 672
	str	q20, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 704
	str	q22, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 736
	str	q23, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 768
	str	q24, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 800
	str	q26, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 832
	str	q11, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 864
	str	q15, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 896
	str	q16, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 928
	str	q21, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 960
	str	q10, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 992
	str	q9, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1024
	str	q8, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 1056
	str	q31, [x3]
	.p2align 5,,15
.L8:
	sub	x3, x6, #1024
	mov	x4, x8
	.p2align 5,,15
.L9:
	ldrh	w5, [x3], 32
	strh	w5, [x4], 2
	cmp	x3, x6
	bne	.L9
	add	x7, x7, 32
	add	x8, x8, 64
	add	x6, x3, 2
	cmp	x7, 768
	bne	.L8
	add	x3, x0, 48
	ptrue	p7.b, all
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #15
	mov	z26.s, #90
	mov	z3.s, #88
	add	x3, x3, 64
	str	z31, [x3]
	mov	z2.s, #22
	add	x3, x0, 112
	ld1sh	z11.s, p7/z, [x3]
	mov	z0.s, #31
	add	x3, x0, 176
	ld1sh	z31.s, p7/z, [x3]
	mov	z28.s, #73
	addvl	x3, sp, #16
	mov	z1.s, #46
	mov	z27.s, #4
	add	x3, x3, 64
	str	z31, [x3]
	addvl	x6, sp, #31
	add	x3, x0, 240
	ld1sh	z12.s, p7/z, [x3]
	addvl	x5, sp, #31
	add	x3, x0, 304
	ld1sh	z18.s, p7/z, [x3]
	add	x6, x6, 2624
	addvl	x3, sp, #17
	add	x5, x5, 1088
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 368
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 432
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z9, [x3]
	mov	z9.s, #85
	add	x3, x0, 496
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 560
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 624
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 688
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z8, [x3]
	mov	z8.s, #67
	add	x3, x0, 752
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 816
	ld1sh	z17.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z17, [x3]
	add	x3, x0, 880
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 944
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z7, [x3]
	mov	z7.s, #54
	add	x3, x0, 1008
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1072
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, x0, 1136
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1200
	ld1sh	z6.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z6, [x3]
	mov	z6.s, #82
	add	x3, x0, 1264
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1328
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	add	x3, x0, 1392
	ld1sh	z21.s, p7/z, [x3]
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	add	x3, x0, 1456
	ld1sh	z5.s, p7/z, [x3]
	mla	z31.s, p7/m, z13.s, z3.s
	addvl	x3, sp, #26
	mla	z31.s, p7/m, z14.s, z9.s
	mla	z31.s, p7/m, z15.s, z6.s
	add	x3, x3, 64
	str	z5, [x3]
	mla	z30.s, p7/m, z12.s, z6.s
	add	x3, x0, 1520
	ld1sh	z22.s, p7/z, [x3]
	mla	z30.s, p7/m, z13.s, z8.s
	add	x3, x0, 1584
	ld1sh	z29.s, p7/z, [x3]
	mla	z30.s, p7/m, z14.s, z1.s
	addvl	x3, sp, #27
	mla	z30.s, p7/m, z15.s, z2.s
	mov	z6.s, #-88
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 1648
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1712
	ld1sh	z4.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z4, [x3]
	mov	z4.s, #38
	add	x3, x0, 1776
	ld1sh	z24.s, p7/z, [x3]
	add	x3, x0, 1840
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #29
	add	x3, x3, 64
	str	z29, [x3]
	mov	z29.s, #78
	add	x3, x0, 1904
	ld1sh	z25.s, p7/z, [x3]
	mla	z31.s, p7/m, z16.s, z29.s
	add	x3, x0, 1968
	mov	z29.s, #61
	ld1sh	z10.s, p7/z, [x3]
	addvl	x3, sp, #30
	mla	z31.s, p7/m, z17.s, z28.s
	add	x0, x0, 2032
	mla	z31.s, p7/m, z18.s, z8.s
	add	x3, x3, 64
	mla	z31.s, p7/m, z19.s, z29.s
	mov	z29.s, #13
	mla	z31.s, p7/m, z20.s, z7.s
	mla	z31.s, p7/m, z21.s, z1.s
	mla	z31.s, p7/m, z22.s, z4.s
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	mla	z31.s, p7/m, z25.s, z29.s
	str	z10, [x3]
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x0, sp, 64
	str	z31, [x0]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x0, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x0, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x0, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x0, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x0, x0, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x0, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x0, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x0, x0, 64
	str	z1, [x0]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x0, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x0, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	mov	z1.s, #-31
	str	z0, [x0]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x0, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x0, x0, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x0, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x0, x0, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x0]
	addvl	x0, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x0]
	addvl	x0, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z19.s, #70
	addvl	x0, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x0, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x0, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x0, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z31.s, p7/m, z4.s, z20.s
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	ldr	z10, [x3]
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	mov	z31.s, #-43
	mla	z15.s, p7/m, z8.s, z18.s
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z15.s, p7/m, z7.s, z26.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x0, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x0, x0, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #21
	mov	z16.s, #-57
	add	x0, x0, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z8.s, z22.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #25
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	add	x0, x0, 64
	ldr	z16, [x0]
	mla	z30.s, p7/m, z10.s, z22.s
	addvl	x0, sp, #29
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x0, x0, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x0]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z18, [x0]
	mla	z21.s, p7/m, z15.s, z22.s
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z17, [x0]
	lsl	z18.s, z22.s, #6
	add	x0, sp, 64
	mov	z22.s, #64
	mov	z11.s, #-64
	mad	z22.s, p7/m, z17.s, z18.s
	mad	z11.s, p7/m, z17.s, z18.s
	add	z16.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z22.s, z22.s, z19.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	z19.s, z11.s, z23.s
	add	x0, x0, 64
	add	z9.s, z19.s, z30.s
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #2
	add	z17.s, z16.s, z26.s
	add	x0, x0, 64
	sub	z23.s, z11.s, z23.s
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #3
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	x0, x0, 64
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #4
	add	z11.s, z26.s, z27.s
	add	x0, x0, 64
	sub	z26.s, z26.s, z27.s
	ldr	z27, [x0]
	addvl	x0, sp, #5
	sub	z22.s, z22.s, z21.s
	add	z21.s, z22.s, z25.s
	add	x0, x0, 64
	sub	z22.s, z22.s, z25.s
	ldr	z25, [x0]
	addvl	x0, sp, #6
	add	z8.s, z18.s, z14.s
	sub	z18.s, z18.s, z14.s
	add	x0, x0, 64
	ldr	z14, [x0]
	add	z7.s, z17.s, z13.s
	addvl	x0, sp, #7
	sub	z17.s, z17.s, z13.s
	add	z14.s, z15.s, z14.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z13.s, z11.s, z3.s
	addvl	x0, sp, #15
	add	z25.s, z16.s, z25.s
	add	z27.s, z21.s, z27.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z13.s, z17.s, z12.s
	addvl	x0, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z28.s, z10.s, z28.s
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z6.s, z26.s, z1.s
	addvl	x0, sp, #9
	add	z29.s, z9.s, z29.s
	add	z30.s, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z24.s, z5.s
	addvl	x0, sp, #10
	add	z31.s, z7.s, z31.s
	sqrshrnb	z31.h, z31.s, #7
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z4.s, z23.s, z0.s
	addvl	x0, sp, #11
	uzp1	z31.h, z31.h, z31.h
	sqrshrnb	z30.h, z30.s, #7
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z3.s, z22.s, z2.s
	addvl	x0, sp, #12
	uzp1	z30.h, z30.h, z30.h
	sqrshrnb	z29.h, z29.s, #7
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z20.s, z2.s
	addvl	x0, sp, #13
	uzp1	z29.h, z29.h, z29.h
	sqrshrnb	z28.h, z28.s, #7
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z1.s, z19.s, z1.s
	addvl	x0, sp, #14
	uzp1	z28.h, z28.h, z28.h
	sqrshrnb	z27.h, z27.s, #7
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z0.s, z18.s, z0.s
	addvl	x0, sp, #16
	uzp1	z27.h, z27.h, z27.h
	sqrshrnb	z25.h, z25.s, #7
	add	x0, x0, 64
	str	z13, [x0]
	uzp1	z25.h, z25.h, z25.h
	addvl	x0, sp, #14
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z18.s, z18.s, z12.s
	addvl	x0, sp, #13
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z19.s, z19.s, z12.s
	addvl	x0, sp, #12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z20.s, z20.s, z12.s
	addvl	x0, sp, #11
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z22.s, z22.s, z12.s
	addvl	x0, sp, #10
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z23.s, z23.s, z12.s
	addvl	x0, sp, #9
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z24.s, z24.s, z12.s
	addvl	x0, sp, #8
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z26.s, z26.s, z12.s
	addvl	x0, sp, #7
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z11.s, z11.s, z12.s
	addvl	x0, sp, #6
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z15.s, z15.s, z12.s
	addvl	x0, sp, #5
	sqrshrnb	z18.h, z18.s, #7
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z16.s, z16.s, z12.s
	addvl	x0, sp, #4
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z21.s, z21.s, z12.s
	addvl	x0, sp, #3
	sqrshrnb	z20.h, z20.s, #7
	uzp1	z20.h, z20.h, z20.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z10.s, z10.s, z12.s
	addvl	x0, sp, #2
	sqrshrnb	z22.h, z22.s, #7
	uzp1	z22.h, z22.h, z22.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z9.s, z9.s, z12.s
	addvl	x0, sp, #1
	sqrshrnb	z23.h, z23.s, #7
	uzp1	z23.h, z23.h, z23.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z8.s, z8.s, z12.s
	add	x0, sp, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z24.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sqrshrnb	z26.h, z26.s, #7
	add	x0, x0, 64
	uzp1	z26.h, z26.h, z26.h
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z16.h, z16.s, #7
	add	x0, x0, 96
	uzp1	z16.h, z16.h, z16.h
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	str	q30, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z9.h, z9.s, #7
	add	x0, x0, 128
	uzp1	z9.h, z9.h, z9.h
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	str	q28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	str	q27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	str	q25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	str	q14, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z13.h, z31.s, #7
	addvl	x0, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 288
	str	q13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	str	q6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	str	q5, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	str	q4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	str	q3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	str	q2, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	str	q1, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	str	q0, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z31.h, z13.s, #7
	addvl	x0, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 544
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z31.h, z12.s, #7
	add	x0, x0, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	str	q18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	str	q19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	str	q20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	str	q22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	str	q23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 768
	str	q24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	str	q26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 832
	str	q11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	str	q15, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	str	q16, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	str	q21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	str	q10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	str	q9, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	str	q8, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	str	q31, [x0]
	.p2align 5,,15
.L11:
	sub	x0, x5, #1024
	mov	x3, x6
	.p2align 5,,15
.L12:
	ldrh	w4, [x0], 32
	strh	w4, [x3], 2
	cmp	x0, x5
	bne	.L12
	add	x7, x7, 32
	add	x6, x6, 64
	add	x5, x0, 2
	cmp	x7, 1024
	bne	.L11
	addvl	x0, sp, #31
	ptrue	p7.b, all
	mov	z26.s, #90
	add	x0, x0, 1088
	ld1sh	z31.s, p7/z, [x0]
	mov	z3.s, #88
	addvl	x0, sp, #15
	mov	z2.s, #22
	mov	z0.s, #31
	add	x0, x0, 64
	str	z31, [x0]
	mov	z28.s, #73
	addvl	x0, sp, #31
	mov	z1.s, #46
	mov	z27.s, #4
	add	x0, x0, 1152
	ld1sh	z11.s, p7/z, [x0]
	addvl	x7, sp, #31
	addvl	x0, sp, #31
	addvl	x6, sp, #31
	add	x0, x0, 1216
	ld1sh	z31.s, p7/z, [x0]
	add	x7, x7, 64
	addvl	x0, sp, #16
	add	x5, x1, 64
	add	x0, x0, 64
	str	z31, [x0]
	add	x6, x6, 80
	addvl	x0, sp, #31
	add	x0, x0, 1280
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1344
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1408
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1472
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z9, [x0]
	mov	z9.s, #85
	addvl	x0, sp, #31
	add	x0, x0, 1536
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1600
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1664
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1728
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #67
	addvl	x0, sp, #31
	add	x0, x0, 1792
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1856
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1920
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1984
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z7, [x0]
	mov	z7.s, #54
	addvl	x0, sp, #31
	add	x0, x0, 2048
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2112
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z30, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2176
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2240
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z6, [x0]
	mov	z6.s, #82
	addvl	x0, sp, #31
	add	x0, x0, 2304
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2368
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	addvl	x0, sp, #31
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	mla	z31.s, p7/m, z13.s, z3.s
	add	x0, x0, 2432
	ld1sh	z21.s, p7/z, [x0]
	mla	z31.s, p7/m, z14.s, z9.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z15.s, z6.s
	mla	z30.s, p7/m, z12.s, z6.s
	add	x0, x0, 2496
	ld1sh	z5.s, p7/z, [x0]
	mla	z30.s, p7/m, z13.s, z8.s
	addvl	x0, sp, #26
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z2.s
	add	x0, x0, 64
	str	z5, [x0]
	mov	z6.s, #-88
	addvl	x0, sp, #31
	add	x0, x0, 2560
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2624
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	str	z29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2688
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2752
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 64
	str	z4, [x0]
	mov	z4.s, #38
	addvl	x0, sp, #31
	add	x0, x0, 2816
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2880
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #29
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #78
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z16.s, z29.s
	mov	z29.s, #61
	add	x0, x0, 2944
	ld1sh	z25.s, p7/z, [x0]
	mla	z31.s, p7/m, z17.s, z28.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z18.s, z8.s
	mla	z31.s, p7/m, z19.s, z29.s
	add	x0, x0, 3008
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z20.s, z7.s
	addvl	x0, sp, #30
	mla	z31.s, p7/m, z21.s, z1.s
	mov	z29.s, #13
	add	x0, x0, 64
	str	z10, [x0]
	mla	z31.s, p7/m, z22.s, z4.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	add	x0, x0, 3072
	mla	z31.s, p7/m, z25.s, z29.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x0, sp, 64
	str	z31, [x0]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x0, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x0, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x0, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x0, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x0, x0, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x0, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x0, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x0, x0, 64
	str	z1, [x0]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x0, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x0, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	mov	z1.s, #-31
	str	z0, [x0]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x0, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x0, x0, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x0, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x0, x0, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x0]
	addvl	x0, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x0]
	addvl	x0, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z19.s, #70
	addvl	x0, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x0, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x0, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x0, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x0, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x0, x0, 64
	ldr	z10, [x0]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x0, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x0, x0, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x0, x0, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x0]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x0, x0, 64
	ldr	z18, [x0]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #23
	lsl	z18.s, z22.s, #6
	add	x0, x0, 64
	ldr	z17, [x0]
	mov	z22.s, #64
	add	x0, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x0, x0, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x0, x0, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x0, x0, 64
	ldr	z27, [x0]
	sub	z22.s, z22.s, z21.s
	addvl	x0, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x0, x0, 64
	ldr	z25, [x0]
	add	z8.s, z18.s, z14.s
	addvl	x0, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z17.s, z17.s, z13.s
	addvl	x0, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z13.s, z11.s, z3.s
	addvl	x0, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z13.s, z17.s, z12.s
	addvl	x0, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z6.s, z26.s, z1.s
	addvl	x0, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z24.s, z5.s
	addvl	x0, sp, #10
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z4.s, z23.s, z0.s
	addvl	x0, sp, #11
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z3.s, z22.s, z2.s
	addvl	x0, sp, #12
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z20.s, z2.s
	addvl	x0, sp, #13
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z1.s, z19.s, z1.s
	addvl	x0, sp, #14
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z0.s, z18.s, z0.s
	addvl	x0, sp, #16
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	str	z13, [x0]
	sqrshrnb	z14.h, z14.s, #12
	addvl	x0, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z18.s, z18.s, z12.s
	addvl	x0, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z19.s, z19.s, z12.s
	addvl	x0, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z20.s, z20.s, z12.s
	addvl	x0, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z22.s, z22.s, z12.s
	addvl	x0, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z23.s, z23.s, z12.s
	addvl	x0, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z24.s, z24.s, z12.s
	addvl	x0, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z26.s, z26.s, z12.s
	addvl	x0, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z11.s, z11.s, z12.s
	addvl	x0, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z15.s, z15.s, z12.s
	addvl	x0, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z16.s, z16.s, z12.s
	addvl	x0, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z21.s, z21.s, z12.s
	addvl	x0, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z10.s, z10.s, z12.s
	addvl	x0, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z9.s, z9.s, z12.s
	addvl	x0, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z8.s, z8.s, z12.s
	add	x0, sp, 64
	ldr	z12, [x0]
	uzp1	z24.h, z24.h, z24.h
	addvl	x0, sp, #31
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #12
	str	q31, [x0]
	addvl	x0, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x0, x0, 96
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #12
	str	q30, [x0]
	addvl	x0, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 128
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	str	q28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	str	q27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	str	q25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	str	q14, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z13.h, z31.s, #12
	addvl	x0, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 288
	str	q13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	str	q6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	str	q5, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	str	q4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	str	q3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	str	q2, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	str	q1, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	str	q0, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z31.h, z13.s, #12
	addvl	x0, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 544
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	str	q18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	str	q19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	str	q20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	str	q22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	str	q23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 768
	str	q24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	str	q26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 832
	str	q11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	str	q15, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	str	q16, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	str	q21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	str	q10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	str	q9, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	str	q8, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	str	q31, [x0]
	.p2align 5,,15
.L14:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L15:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x0, x5
	bne	.L15
	add	x7, x7, 2
	add	x5, x0, x2, lsl 1
	cmp	x7, x6
	bne	.L14
	addvl	x0, sp, #31
	ptrue	p7.b, all
	mov	z26.s, #90
	add	x0, x0, 1104
	ld1sh	z31.s, p7/z, [x0]
	mov	z3.s, #88
	addvl	x0, sp, #15
	mov	z2.s, #22
	mov	z0.s, #31
	add	x0, x0, 64
	str	z31, [x0]
	mov	z28.s, #73
	addvl	x0, sp, #31
	mov	z1.s, #46
	mov	z27.s, #4
	add	x0, x0, 1168
	ld1sh	z11.s, p7/z, [x0]
	addvl	x7, sp, #31
	addvl	x0, sp, #31
	add	x5, x1, x2, lsl 4
	add	x0, x0, 1232
	ld1sh	z31.s, p7/z, [x0]
	add	x7, x7, 64
	addvl	x0, sp, #16
	add	x5, x5, 64
	add	x0, x0, 64
	str	z31, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1296
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1360
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1424
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1488
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z9, [x0]
	mov	z9.s, #85
	addvl	x0, sp, #31
	add	x0, x0, 1552
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1616
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1680
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1744
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #67
	addvl	x0, sp, #31
	add	x0, x0, 1808
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1872
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1936
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2000
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z7, [x0]
	mov	z7.s, #54
	addvl	x0, sp, #31
	add	x0, x0, 2064
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2128
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z30, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2192
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2256
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z6, [x0]
	mov	z6.s, #82
	addvl	x0, sp, #31
	add	x0, x0, 2320
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2384
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	addvl	x0, sp, #31
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	mla	z31.s, p7/m, z13.s, z3.s
	add	x0, x0, 2448
	ld1sh	z21.s, p7/z, [x0]
	mla	z31.s, p7/m, z14.s, z9.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z15.s, z6.s
	mla	z30.s, p7/m, z12.s, z6.s
	add	x0, x0, 2512
	ld1sh	z5.s, p7/z, [x0]
	mla	z30.s, p7/m, z13.s, z8.s
	addvl	x0, sp, #26
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z2.s
	add	x0, x0, 64
	str	z5, [x0]
	mov	z6.s, #-88
	addvl	x0, sp, #31
	add	x0, x0, 2576
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2640
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	str	z29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2704
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2768
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 64
	str	z4, [x0]
	mov	z4.s, #38
	addvl	x0, sp, #31
	add	x0, x0, 2832
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2896
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #29
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #78
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z16.s, z29.s
	mov	z29.s, #61
	add	x0, x0, 2960
	ld1sh	z25.s, p7/z, [x0]
	mla	z31.s, p7/m, z17.s, z28.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z18.s, z8.s
	mla	z31.s, p7/m, z19.s, z29.s
	add	x0, x0, 3024
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z20.s, z7.s
	addvl	x0, sp, #30
	mla	z31.s, p7/m, z21.s, z1.s
	mov	z29.s, #13
	add	x0, x0, 64
	str	z10, [x0]
	mla	z31.s, p7/m, z22.s, z4.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	add	x0, x0, 3088
	mla	z31.s, p7/m, z25.s, z29.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x0, sp, 64
	str	z31, [x0]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x0, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x0, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x0, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x0, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x0, x0, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x0, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x0, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x0, x0, 64
	str	z1, [x0]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x0, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x0, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	mov	z1.s, #-31
	str	z0, [x0]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x0, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x0, x0, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x0, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x0, x0, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x0]
	addvl	x0, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x0]
	addvl	x0, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z19.s, #70
	addvl	x0, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x0, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x0, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x0, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x0, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x0, x0, 64
	ldr	z10, [x0]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x0, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x0, x0, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x0, x0, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x0]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x0, x0, 64
	ldr	z18, [x0]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #23
	lsl	z18.s, z22.s, #6
	add	x0, x0, 64
	ldr	z17, [x0]
	mov	z22.s, #64
	add	x0, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x0, x0, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x0, x0, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x0, x0, 64
	ldr	z27, [x0]
	sub	z22.s, z22.s, z21.s
	addvl	x0, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x0, x0, 64
	ldr	z25, [x0]
	add	z8.s, z18.s, z14.s
	addvl	x0, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z17.s, z17.s, z13.s
	addvl	x0, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z13.s, z11.s, z3.s
	addvl	x0, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z13.s, z17.s, z12.s
	addvl	x0, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z6.s, z26.s, z1.s
	addvl	x0, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z24.s, z5.s
	addvl	x0, sp, #10
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z4.s, z23.s, z0.s
	addvl	x0, sp, #11
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z3.s, z22.s, z2.s
	addvl	x0, sp, #12
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z20.s, z2.s
	addvl	x0, sp, #13
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z1.s, z19.s, z1.s
	addvl	x0, sp, #14
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z0.s, z18.s, z0.s
	addvl	x0, sp, #16
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	str	z13, [x0]
	sqrshrnb	z14.h, z14.s, #12
	addvl	x0, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z18.s, z18.s, z12.s
	addvl	x0, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z19.s, z19.s, z12.s
	addvl	x0, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z20.s, z20.s, z12.s
	addvl	x0, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z22.s, z22.s, z12.s
	addvl	x0, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z23.s, z23.s, z12.s
	addvl	x0, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z24.s, z24.s, z12.s
	addvl	x0, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z26.s, z26.s, z12.s
	addvl	x0, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z11.s, z11.s, z12.s
	addvl	x0, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z15.s, z15.s, z12.s
	addvl	x0, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z16.s, z16.s, z12.s
	addvl	x0, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z21.s, z21.s, z12.s
	addvl	x0, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z10.s, z10.s, z12.s
	addvl	x0, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z9.s, z9.s, z12.s
	addvl	x0, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z8.s, z8.s, z12.s
	add	x0, sp, 64
	ldr	z12, [x0]
	uzp1	z24.h, z24.h, z24.h
	addvl	x0, sp, #31
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #12
	str	q31, [x0]
	addvl	x0, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x0, x0, 96
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #12
	str	q30, [x0]
	addvl	x0, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 128
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	str	q28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	str	q27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	str	q25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	str	q14, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z13.h, z31.s, #12
	addvl	x0, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 288
	str	q13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	str	q6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	str	q5, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	str	q4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	str	q3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	str	q2, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	str	q1, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	str	q0, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z31.h, z13.s, #12
	addvl	x0, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 544
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	str	q18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	str	q19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	str	q20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	str	q22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	str	q23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 768
	str	q24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	str	q26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 832
	str	q11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	str	q15, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	str	q16, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	str	q21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	str	q10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	str	q9, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	str	q8, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	str	q31, [x0]
	.p2align 5,,15
.L17:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L18:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x5, x0
	bne	.L18
	add	x7, x7, 2
	add	x5, x5, x2, lsl 1
	cmp	x6, x7
	bne	.L17
	addvl	x0, sp, #31
	ptrue	p7.b, all
	mov	z26.s, #90
	add	x0, x0, 1120
	ld1sh	z31.s, p7/z, [x0]
	mov	z3.s, #88
	addvl	x0, sp, #15
	mov	z2.s, #22
	mov	z0.s, #31
	add	x0, x0, 64
	str	z31, [x0]
	mov	z28.s, #73
	addvl	x0, sp, #31
	mov	z1.s, #46
	mov	z27.s, #4
	add	x0, x0, 1184
	ld1sh	z11.s, p7/z, [x0]
	addvl	x7, sp, #31
	addvl	x0, sp, #31
	add	x5, x1, x2, lsl 5
	add	x0, x0, 1248
	ld1sh	z31.s, p7/z, [x0]
	add	x7, x7, 64
	addvl	x0, sp, #16
	add	x5, x5, 64
	add	x0, x0, 64
	str	z31, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1312
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1376
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1440
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1504
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z9, [x0]
	mov	z9.s, #85
	addvl	x0, sp, #31
	add	x0, x0, 1568
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1632
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1696
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1760
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #67
	addvl	x0, sp, #31
	add	x0, x0, 1824
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1888
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1952
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2016
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z7, [x0]
	mov	z7.s, #54
	addvl	x0, sp, #31
	add	x0, x0, 2080
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2144
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z30, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2208
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2272
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z6, [x0]
	mov	z6.s, #82
	addvl	x0, sp, #31
	add	x0, x0, 2336
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2400
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	addvl	x0, sp, #31
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	mla	z31.s, p7/m, z13.s, z3.s
	add	x0, x0, 2464
	ld1sh	z21.s, p7/z, [x0]
	mla	z31.s, p7/m, z14.s, z9.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z15.s, z6.s
	mla	z30.s, p7/m, z12.s, z6.s
	add	x0, x0, 2528
	ld1sh	z5.s, p7/z, [x0]
	mla	z30.s, p7/m, z13.s, z8.s
	addvl	x0, sp, #26
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z2.s
	add	x0, x0, 64
	str	z5, [x0]
	mov	z6.s, #-88
	addvl	x0, sp, #31
	add	x0, x0, 2592
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2656
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	str	z29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2720
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2784
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 64
	str	z4, [x0]
	mov	z4.s, #38
	addvl	x0, sp, #31
	add	x0, x0, 2848
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2912
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #29
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #78
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z16.s, z29.s
	mov	z29.s, #61
	add	x0, x0, 2976
	ld1sh	z25.s, p7/z, [x0]
	mla	z31.s, p7/m, z17.s, z28.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z18.s, z8.s
	mla	z31.s, p7/m, z19.s, z29.s
	add	x0, x0, 3040
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z20.s, z7.s
	addvl	x0, sp, #30
	mla	z31.s, p7/m, z21.s, z1.s
	mov	z29.s, #13
	add	x0, x0, 64
	str	z10, [x0]
	mla	z31.s, p7/m, z22.s, z4.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	add	x0, x0, 3104
	mla	z31.s, p7/m, z25.s, z29.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x0, sp, 64
	str	z31, [x0]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x0, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x0, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x0, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x0, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x0, x0, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x0, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x0, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x0, x0, 64
	str	z1, [x0]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x0, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x0, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	mov	z1.s, #-31
	str	z0, [x0]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x0, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x0, x0, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x0, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x0, x0, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x0]
	addvl	x0, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x0]
	addvl	x0, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z19.s, #70
	addvl	x0, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x0, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x0, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x0, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x0, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x0, x0, 64
	ldr	z10, [x0]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x0, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x0, x0, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x0, x0, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x0]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x0, x0, 64
	ldr	z18, [x0]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #23
	lsl	z18.s, z22.s, #6
	add	x0, x0, 64
	ldr	z17, [x0]
	mov	z22.s, #64
	add	x0, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x0, x0, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x0, x0, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x0, x0, 64
	ldr	z27, [x0]
	sub	z22.s, z22.s, z21.s
	addvl	x0, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x0, x0, 64
	ldr	z25, [x0]
	add	z8.s, z18.s, z14.s
	addvl	x0, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z17.s, z17.s, z13.s
	addvl	x0, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z13.s, z11.s, z3.s
	addvl	x0, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z13.s, z17.s, z12.s
	addvl	x0, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z6.s, z26.s, z1.s
	addvl	x0, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z24.s, z5.s
	addvl	x0, sp, #10
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z4.s, z23.s, z0.s
	addvl	x0, sp, #11
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z3.s, z22.s, z2.s
	addvl	x0, sp, #12
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z20.s, z2.s
	addvl	x0, sp, #13
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z1.s, z19.s, z1.s
	addvl	x0, sp, #14
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z0.s, z18.s, z0.s
	addvl	x0, sp, #16
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	str	z13, [x0]
	sqrshrnb	z14.h, z14.s, #12
	addvl	x0, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z18.s, z18.s, z12.s
	addvl	x0, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z19.s, z19.s, z12.s
	addvl	x0, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z20.s, z20.s, z12.s
	addvl	x0, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z22.s, z22.s, z12.s
	addvl	x0, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z23.s, z23.s, z12.s
	addvl	x0, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z24.s, z24.s, z12.s
	addvl	x0, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z26.s, z26.s, z12.s
	addvl	x0, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z11.s, z11.s, z12.s
	addvl	x0, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z15.s, z15.s, z12.s
	addvl	x0, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z16.s, z16.s, z12.s
	addvl	x0, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z21.s, z21.s, z12.s
	addvl	x0, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z10.s, z10.s, z12.s
	addvl	x0, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z9.s, z9.s, z12.s
	addvl	x0, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z8.s, z8.s, z12.s
	add	x0, sp, 64
	ldr	z12, [x0]
	uzp1	z24.h, z24.h, z24.h
	addvl	x0, sp, #31
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #12
	str	q31, [x0]
	addvl	x0, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x0, x0, 96
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #12
	str	q30, [x0]
	addvl	x0, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 128
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	str	q28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	str	q27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	str	q25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	str	q14, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z13.h, z31.s, #12
	addvl	x0, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 288
	str	q13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	str	q6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	str	q5, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	str	q4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	str	q3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	str	q2, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	str	q1, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	str	q0, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z31.h, z13.s, #12
	addvl	x0, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 544
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	str	q18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	str	q19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	str	q20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	str	q22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	str	q23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 768
	str	q24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	str	q26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 832
	str	q11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	str	q15, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	str	q16, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	str	q21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	str	q10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	str	q9, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	str	q8, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	str	q31, [x0]
	.p2align 5,,15
.L20:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L21:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x5, x0
	bne	.L21
	add	x7, x7, 2
	add	x5, x5, x2, lsl 1
	cmp	x6, x7
	bne	.L20
	addvl	x0, sp, #31
	ptrue	p7.b, all
	mov	z26.s, #90
	add	x0, x0, 1136
	ld1sh	z31.s, p7/z, [x0]
	mov	z3.s, #88
	addvl	x0, sp, #15
	mov	z2.s, #22
	mov	z0.s, #31
	add	x0, x0, 64
	str	z31, [x0]
	mov	z28.s, #73
	addvl	x0, sp, #31
	mov	z1.s, #46
	mov	z27.s, #4
	add	x0, x0, 1200
	ld1sh	z11.s, p7/z, [x0]
	addvl	x5, sp, #31
	addvl	x0, sp, #31
	add	x5, x5, 64
	add	x0, x0, 1264
	ld1sh	z31.s, p7/z, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	str	z31, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1328
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1392
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1456
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1520
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z9, [x0]
	mov	z9.s, #85
	addvl	x0, sp, #31
	add	x0, x0, 1584
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1648
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1712
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1776
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #67
	addvl	x0, sp, #31
	add	x0, x0, 1840
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1904
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1968
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2032
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z7, [x0]
	mov	z7.s, #54
	addvl	x0, sp, #31
	add	x0, x0, 2096
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2160
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z30, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2224
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2288
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z6, [x0]
	mov	z6.s, #82
	addvl	x0, sp, #31
	add	x0, x0, 2352
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2416
	ld1sh	z30.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #90
	addvl	x0, sp, #31
	movprfx	z31, z30
	mla	z31.s, p7/m, z12.s, z26.s
	mla	z31.s, p7/m, z13.s, z3.s
	add	x0, x0, 2480
	ld1sh	z21.s, p7/z, [x0]
	mla	z31.s, p7/m, z14.s, z9.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z15.s, z6.s
	mla	z30.s, p7/m, z12.s, z6.s
	add	x0, x0, 2544
	ld1sh	z5.s, p7/z, [x0]
	mla	z30.s, p7/m, z13.s, z8.s
	addvl	x0, sp, #26
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z2.s
	add	x0, x0, 64
	str	z5, [x0]
	mov	z6.s, #-88
	addvl	x0, sp, #31
	add	x0, x0, 2608
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2672
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	str	z29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2736
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2800
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 64
	str	z4, [x0]
	mov	z4.s, #38
	addvl	x0, sp, #31
	add	x0, x0, 2864
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2928
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #29
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #78
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z16.s, z29.s
	mov	z29.s, #61
	add	x0, x0, 2992
	ld1sh	z25.s, p7/z, [x0]
	mla	z31.s, p7/m, z17.s, z28.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z18.s, z8.s
	mla	z31.s, p7/m, z19.s, z29.s
	add	x0, x0, 3056
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z20.s, z7.s
	addvl	x0, sp, #30
	mla	z31.s, p7/m, z21.s, z1.s
	mov	z29.s, #13
	add	x0, x0, 64
	str	z10, [x0]
	mla	z31.s, p7/m, z22.s, z4.s
	addvl	x0, sp, #31
	mla	z31.s, p7/m, z23.s, z0.s
	mla	z31.s, p7/m, z24.s, z2.s
	add	x0, x0, 3120
	mla	z31.s, p7/m, z25.s, z29.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z31.s, p7/m, z10.s, z27.s
	add	x0, sp, 64
	str	z31, [x0]
	mov	z31.s, #-31
	mov	z29.s, #-4
	mov	z27.s, #-73
	mla	z30.s, p7/m, z16.s, z29.s
	mov	z1.s, #-85
	mla	z30.s, p7/m, z17.s, z31.s
	mov	z4.s, #-61
	mov	z31.s, #-54
	addvl	x0, sp, #1
	mov	z5.d, z31.d
	mla	z30.s, p7/m, z18.s, z31.s
	mov	z31.s, #-78
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-90
	mla	z30.s, p7/m, z20.s, z1.s
	mov	z1.s, #-38
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z6.s
	mla	z30.s, p7/m, z23.s, z31.s
	mla	z30.s, p7/m, z24.s, z4.s
	mov	z4.s, #-13
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z3.s
	mla	z30.s, p7/m, z12.s, z8.s
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z5.s
	mov	z5.s, #-82
	mov	z4.s, #38
	mla	z30.s, p7/m, z16.s, z5.s
	mov	z5.s, #-46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z31.s
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z29.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #61
	mla	z30.s, p7/m, z23.s, z26.s
	addvl	x0, sp, #2
	mla	z30.s, p7/m, z24.s, z9.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #46
	mla	z30.s, p7/m, z10.s, z2.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z9.s
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.s, #-13
	mla	z30.s, p7/m, z13.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #-67
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z16.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-22
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z4.s
	mov	z28.s, #82
	mla	z30.s, p7/m, z19.s, z28.s
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z29.s
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z24.s, z27.s
	mla	z30.s, p7/m, z25.s, z31.s
	mla	z30.s, p7/m, z10.s, z28.s
	mov	z28.s, #-54
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #82
	mla	z30.s, p7/m, z12.s, z2.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z16.s, z28.s
	mov	z28.s, #78
	mla	z30.s, p7/m, z17.s, z28.s
	mla	z30.s, p7/m, z18.s, z9.s
	mov	z28.s, #-67
	mla	z30.s, p7/m, z19.s, z0.s
	mla	z30.s, p7/m, z20.s, z5.s
	mla	z30.s, p7/m, z21.s, z27.s
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #4
	mla	z30.s, p7/m, z23.s, z28.s
	mov	z28.s, #73
	addvl	x0, sp, #4
	mla	z30.s, p7/m, z24.s, z28.s
	mov	z28.s, #-82
	mla	z30.s, p7/m, z25.s, z3.s
	mla	z30.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #78
	mla	z30.s, p7/m, z12.s, z29.s
	mla	z30.s, p7/m, z13.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z14.s, z28.s
	mov	z3.s, #-22
	mov	z28.s, #13
	addvl	x0, sp, #5
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-61
	mla	z30.s, p7/m, z16.s, z9.s
	mla	z30.s, p7/m, z17.s, z8.s
	mla	z30.s, p7/m, z18.s, z3.s
	mla	z30.s, p7/m, z19.s, z6.s
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-31
	mla	z30.s, p7/m, z22.s, z26.s
	mla	z30.s, p7/m, z23.s, z7.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z27.s
	mla	z30.s, p7/m, z10.s, z5.s
	add	x0, x0, 64
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #73
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z13.s, z27.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #78
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #-13
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z1.s
	mla	z30.s, p7/m, z18.s, z27.s
	mla	z30.s, p7/m, z19.s, z3.s
	mla	z30.s, p7/m, z20.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #6
	mla	z30.s, p7/m, z21.s, z0.s
	mov	z0.s, #-54
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z29.s
	mla	z30.s, p7/m, z25.s, z9.s
	mla	z30.s, p7/m, z10.s, z7.s
	add	x0, x0, 64
	mov	z3.s, #-22
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z8.s
	mla	z30.s, p7/m, z12.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z13.s, z31.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z9.s
	mla	z30.s, p7/m, z16.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z17.s, z27.s
	mla	z30.s, p7/m, z18.s, z0.s
	mov	z0.s, #82
	mla	z30.s, p7/m, z19.s, z26.s
	mla	z30.s, p7/m, z20.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z28.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z28.s, #-73
	addvl	x0, sp, #7
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z28.s
	mov	z30.s, #-61
	mla	z3.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #-13
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	addvl	x0, sp, #8
	mla	z30.s, p7/m, z12.s, z28.s
	mov	z28.d, z0.d
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z0.s
	mov	z0.s, #31
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z6.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #88
	mla	z30.s, p7/m, z18.s, z26.s
	mla	z30.s, p7/m, z19.s, z29.s
	mla	z30.s, p7/m, z20.s, z27.s
	mla	z30.s, p7/m, z21.s, z2.s
	mla	z30.s, p7/m, z22.s, z9.s
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z31.s
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z7.s
	mla	z1.s, p7/m, z10.s, z8.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z7.s
	add	x0, x0, 64
	str	z1, [x0]
	mov	z1.s, #-85
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z15.s, z5.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z28.s
	mov	z28.s, #13
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z3.s, #-22
	mla	z30.s, p7/m, z20.s, z4.s
	addvl	x0, sp, #9
	mla	z30.s, p7/m, z21.s, z8.s
	mla	z30.s, p7/m, z22.s, z31.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z26.s
	mla	z30.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z30.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #13
	str	z30, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z12.s, z27.s
	mla	z30.s, p7/m, z13.s, z4.s
	mla	z30.s, p7/m, z14.s, z7.s
	mla	z30.s, p7/m, z15.s, z27.s
	mla	z30.s, p7/m, z16.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z17.s, z0.s
	mov	z0.s, #4
	mla	z30.s, p7/m, z18.s, z6.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z1.s
	mov	z1.s, #-82
	mla	z30.s, p7/m, z22.s, z28.s
	mov	z28.s, #73
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mla	z30.s, p7/m, z25.s, z0.s
	mov	z3.d, z0.d
	addvl	x0, sp, #10
	mov	z0.d, z30.d
	mov	z30.s, #78
	mla	z0.s, p7/m, z10.s, z30.s
	add	x0, x0, 64
	mov	z1.s, #-31
	str	z0, [x0]
	mov	z0.s, #-67
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z4.s
	addvl	x0, sp, #11
	mla	z30.s, p7/m, z12.s, z6.s
	mla	z30.s, p7/m, z13.s, z28.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z0.s
	mov	z0.s, #61
	mla	z30.s, p7/m, z16.s, z26.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z1.s
	mov	z1.s, #13
	mla	z30.s, p7/m, z19.s, z9.s
	mla	z30.s, p7/m, z20.s, z31.s
	mla	z30.s, p7/m, z21.s, z1.s
	mla	z30.s, p7/m, z22.s, z0.s
	mla	z30.s, p7/m, z23.s, z27.s
	mla	z30.s, p7/m, z24.s, z7.s
	add	x0, x0, 64
	movprfx	z1, z30
	mla	z1.s, p7/m, z25.s, z2.s
	mov	z30.s, #-82
	mla	z1.s, p7/m, z10.s, z30.s
	str	z1, [x0]
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mov	z1.s, #-61
	mla	z30.s, p7/m, z12.s, z31.s
	addvl	x0, sp, #12
	mla	z30.s, p7/m, z13.s, z26.s
	mla	z30.s, p7/m, z14.s, z1.s
	mla	z30.s, p7/m, z15.s, z3.s
	mov	z3.s, #82
	mla	z30.s, p7/m, z16.s, z7.s
	add	x0, x0, 64
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z3.s, #-22
	mov	z1.s, #-38
	mov	z0.s, #-13
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z3.s
	mla	z30.s, p7/m, z21.s, z28.s
	mla	z30.s, p7/m, z22.s, z27.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z0.s
	movprfx	z3, z30
	mla	z3.s, p7/m, z25.s, z5.s
	mla	z3.s, p7/m, z10.s, z9.s
	str	z3, [x0]
	addvl	x0, sp, #13
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	mla	z30.s, p7/m, z12.s, z3.s
	mla	z30.s, p7/m, z13.s, z9.s
	mla	z30.s, p7/m, z14.s, z27.s
	mla	z30.s, p7/m, z15.s, z28.s
	mov	z28.s, #-31
	mla	z30.s, p7/m, z16.s, z1.s
	mla	z30.s, p7/m, z17.s, z29.s
	mov	z29.s, #46
	mla	z30.s, p7/m, z18.s, z29.s
	mov	z29.s, #-82
	mla	z30.s, p7/m, z19.s, z31.s
	mla	z30.s, p7/m, z20.s, z26.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z0.s
	mla	z30.s, p7/m, z24.s, z28.s
	movprfx	z28, z30
	mla	z28.s, p7/m, z25.s, z8.s
	mla	z28.s, p7/m, z10.s, z6.s
	str	z28, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z0.s, #61
	mla	z30.s, p7/m, z12.s, z1.s
	mla	z30.s, p7/m, z13.s, z0.s
	mov	z28.s, #-31
	mad	z31.s, p7/m, z14.s, z30.s
	mov	z3.s, #88
	mov	z30.s, #-73
	mla	z31.s, p7/m, z15.s, z3.s
	mov	z0.s, #4
	mla	z31.s, p7/m, z16.s, z27.s
	mla	z31.s, p7/m, z17.s, z9.s
	mla	z31.s, p7/m, z18.s, z30.s
	mla	z31.s, p7/m, z19.s, z7.s
	mla	z31.s, p7/m, z20.s, z28.s
	mla	z31.s, p7/m, z21.s, z0.s
	mla	z31.s, p7/m, z22.s, z2.s
	mla	z31.s, p7/m, z23.s, z5.s
	mla	z31.s, p7/m, z24.s, z8.s
	mla	z31.s, p7/m, z25.s, z29.s
	mla	z31.s, p7/m, z10.s, z26.s
	str	z31, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	lsl	z11.s, z11.s, #2
	mov	z0.s, #-13
	mad	z12.s, p7/m, z0.s, z11.s
	ldr	z11, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	mad	z13.s, p7/m, z2.s, z12.s
	mov	z31.s, #-61
	mad	z14.s, p7/m, z28.s, z13.s
	mov	z28.s, #78
	mad	z15.s, p7/m, z4.s, z14.s
	mad	z16.s, p7/m, z5.s, z15.s
	mad	z17.s, p7/m, z7.s, z16.s
	mad	z18.s, p7/m, z31.s, z17.s
	mad	z19.s, p7/m, z8.s, z18.s
	mad	z20.s, p7/m, z30.s, z19.s
	mad	z21.s, p7/m, z28.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	mad	z23.s, p7/m, z9.s, z22.s
	ldr	z9, [x0]
	addvl	x0, sp, #20
	mad	z24.s, p7/m, z6.s, z23.s
	mov	z22.s, #43
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z19.s, #70
	addvl	x0, sp, #22
	mov	z17.s, #87
	mov	z23.s, #57
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z25.s, p7/m, z26.s, z24.s
	addvl	x0, sp, #24
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z26.s
	mov	z20.s, #25
	add	x0, x0, 64
	ldr	z6, [x0]
	mla	z31.s, p7/m, z9.s, z17.s
	addvl	x0, sp, #26
	mov	z30.s, #80
	mla	z31.s, p7/m, z8.s, z30.s
	add	x0, x0, 64
	ldr	z5, [x0]
	mla	z31.s, p7/m, z7.s, z19.s
	addvl	x0, sp, #28
	mla	z31.s, p7/m, z6.s, z23.s
	mla	z31.s, p7/m, z5.s, z22.s
	add	x0, x0, 64
	ldr	z4, [x0]
	mla	z31.s, p7/m, z4.s, z20.s
	addvl	x0, sp, #30
	mov	z24.s, #-80
	movprfx	z12, z25
	mla	z12.s, p7/m, z10.s, z27.s
	mov	z28.s, #9
	mov	z18.s, #-25
	movprfx	z25, z11
	mul	z25.s, p7/m, z25.s, z19.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z17.s
	mov	z21.s, #-70
	mla	z30.s, p7/m, z9.s, z23.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z23.s
	mla	z30.s, p7/m, z8.s, z28.s
	mla	z15.s, p7/m, z9.s, z24.s
	add	x0, x0, 64
	ldr	z10, [x0]
	mla	z15.s, p7/m, z8.s, z18.s
	movprfx	z13, z31
	mla	z13.s, p7/m, z10.s, z28.s
	mla	z15.s, p7/m, z7.s, z26.s
	mov	z31.s, #-43
	mla	z30.s, p7/m, z7.s, z31.s
	mla	z30.s, p7/m, z6.s, z24.s
	mla	z30.s, p7/m, z5.s, z27.s
	mla	z30.s, p7/m, z4.s, z21.s
	mov	z29.s, #-87
	movprfx	z14, z30
	mla	z14.s, p7/m, z10.s, z18.s
	mad	z31.s, p7/m, z9.s, z25.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #80
	addvl	x0, sp, #17
	mla	z30.s, p7/m, z9.s, z28.s
	mov	z25.s, #-9
	mla	z30.s, p7/m, z8.s, z21.s
	mad	z25.s, p7/m, z6.s, z15.s
	mla	z30.s, p7/m, z7.s, z29.s
	movprfx	z15, z11
	mul	z15.s, p7/m, z15.s, z22.s
	mla	z30.s, p7/m, z6.s, z18.s
	mla	z15.s, p7/m, z9.s, z27.s
	mla	z30.s, p7/m, z5.s, z23.s
	mad	z23.s, p7/m, z8.s, z15.s
	mla	z30.s, p7/m, z4.s, z26.s
	mla	z31.s, p7/m, z8.s, z29.s
	add	x0, x0, 64
	mla	z31.s, p7/m, z7.s, z28.s
	mla	z31.s, p7/m, z6.s, z26.s
	mla	z31.s, p7/m, z5.s, z20.s
	mad	z20.s, p7/m, z7.s, z23.s
	movprfx	z23, z11
	mul	z23.s, z23.s, #25
	mad	z21.s, p7/m, z9.s, z23.s
	mad	z26.s, p7/m, z8.s, z21.s
	mla	z26.s, p7/m, z7.s, z24.s
	mla	z26.s, p7/m, z6.s, z22.s
	mla	z25.s, p7/m, z5.s, z29.s
	mad	z29.s, p7/m, z6.s, z20.s
	mla	z29.s, p7/m, z5.s, z19.s
	mla	z29.s, p7/m, z4.s, z28.s
	mad	z28.s, p7/m, z5.s, z26.s
	movprfx	z26, z11
	mul	z26.s, z26.s, #9
	mla	z26.s, p7/m, z9.s, z18.s
	ldr	z18, [x0]
	addvl	x0, sp, #21
	mov	z16.s, #-57
	mla	z26.s, p7/m, z8.s, z22.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z28.s, p7/m, z10.s, z17.s
	mla	z26.s, p7/m, z6.s, z19.s
	mla	z26.s, p7/m, z5.s, z24.s
	mla	z26.s, p7/m, z4.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	mla	z31.s, p7/m, z4.s, z24.s
	mla	z31.s, p7/m, z10.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #29
	mla	z30.s, p7/m, z10.s, z22.s
	mla	z29.s, p7/m, z10.s, z24.s
	mla	z25.s, p7/m, z4.s, z22.s
	add	x0, x0, 64
	mov	z24.s, #50
	mov	z22.s, #-18
	ldr	z15, [x0]
	mad	z27.s, p7/m, z10.s, z26.s
	mov	z21.s, #75
	movprfx	z26, z18
	mul	z26.s, z26.s, #89
	movprfx	z20, z18
	mul	z20.s, z20.s, #50
	mla	z26.s, p7/m, z17.s, z21.s
	addvl	x0, sp, #19
	mla	z26.s, p7/m, z16.s, z24.s
	movprfx	z24, z18
	mul	z24.s, p7/m, z24.s, z21.s
	mla	z24.s, p7/m, z17.s, z22.s
	mov	z22.s, #-89
	mla	z20.s, p7/m, z17.s, z22.s
	mla	z25.s, p7/m, z10.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #-50
	mov	z23.s, #18
	mla	z26.s, p7/m, z15.s, z23.s
	mad	z23.s, p7/m, z16.s, z20.s
	movprfx	z20, z18
	mul	z20.s, z20.s, #18
	mla	z20.s, p7/m, z17.s, z19.s
	mla	z23.s, p7/m, z15.s, z21.s
	mad	z21.s, p7/m, z16.s, z20.s
	ldr	z20, [x0]
	addvl	x0, sp, #27
	mla	z21.s, p7/m, z15.s, z22.s
	add	x0, x0, 64
	ldr	z18, [x0]
	mla	z24.s, p7/m, z16.s, z22.s
	addvl	x0, sp, #15
	movprfx	z22, z20
	mul	z22.s, z22.s, #83
	mla	z24.s, p7/m, z15.s, z19.s
	add	x0, x0, 64
	mov	z19.s, #36
	mad	z19.s, p7/m, z18.s, z22.s
	movprfx	z22, z20
	mul	z22.s, z22.s, #36
	mov	z20.s, #-83
	mad	z20.s, p7/m, z18.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #23
	lsl	z18.s, z22.s, #6
	add	x0, x0, 64
	ldr	z17, [x0]
	mov	z22.s, #64
	add	x0, sp, 64
	mad	z22.s, p7/m, z17.s, z18.s
	mov	z11.s, #-64
	add	z16.s, z22.s, z19.s
	mad	z11.s, p7/m, z17.s, z18.s
	sub	z22.s, z22.s, z19.s
	add	z15.s, z11.s, z20.s
	sub	z11.s, z11.s, z20.s
	add	z20.s, z22.s, z21.s
	add	z10.s, z20.s, z31.s
	sub	z20.s, z20.s, z31.s
	ldr	z31, [x0]
	addvl	x0, sp, #1
	add	z19.s, z11.s, z23.s
	add	z9.s, z19.s, z30.s
	add	x0, x0, 64
	sub	z19.s, z19.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #2
	add	z17.s, z16.s, z26.s
	sub	z23.s, z11.s, z23.s
	add	x0, x0, 64
	sub	z26.s, z16.s, z26.s
	add	z16.s, z23.s, z29.s
	sub	z23.s, z23.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	add	z18.s, z15.s, z24.s
	sub	z24.s, z15.s, z24.s
	add	z15.s, z24.s, z28.s
	sub	z24.s, z24.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #4
	add	z11.s, z26.s, z27.s
	sub	z26.s, z26.s, z27.s
	add	x0, x0, 64
	ldr	z27, [x0]
	sub	z22.s, z22.s, z21.s
	addvl	x0, sp, #5
	add	z21.s, z22.s, z25.s
	sub	z22.s, z22.s, z25.s
	add	x0, x0, 64
	ldr	z25, [x0]
	add	z8.s, z18.s, z14.s
	addvl	x0, sp, #6
	sub	z18.s, z18.s, z14.s
	add	z7.s, z17.s, z13.s
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z17.s, z17.s, z13.s
	addvl	x0, sp, #7
	add	z14.s, z15.s, z14.s
	add	z25.s, z16.s, z25.s
	add	x0, x0, 64
	ldr	z3, [x0]
	add	z13.s, z11.s, z3.s
	addvl	x0, sp, #15
	add	z27.s, z21.s, z27.s
	add	z28.s, z10.s, z28.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z13.s, z17.s, z12.s
	addvl	x0, sp, #8
	sub	z17.s, z17.s, z12.s
	add	z29.s, z9.s, z29.s
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z6.s, z26.s, z1.s
	addvl	x0, sp, #9
	add	z30.s, z8.s, z30.s
	add	z31.s, z7.s, z31.s
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z24.s, z5.s
	addvl	x0, sp, #10
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z4.s, z23.s, z0.s
	addvl	x0, sp, #11
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z3.s, z22.s, z2.s
	addvl	x0, sp, #12
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z20.s, z2.s
	addvl	x0, sp, #13
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	ldr	z1, [x0]
	add	z1.s, z19.s, z1.s
	addvl	x0, sp, #14
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	ldr	z0, [x0]
	add	z0.s, z18.s, z0.s
	addvl	x0, sp, #16
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	str	z13, [x0]
	sqrshrnb	z14.h, z14.s, #12
	addvl	x0, sp, #14
	uzp1	z14.h, z14.h, z14.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z18.s, z18.s, z12.s
	addvl	x0, sp, #13
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z19.s, z19.s, z12.s
	addvl	x0, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z20.s, z20.s, z12.s
	addvl	x0, sp, #11
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z22.s, z22.s, z12.s
	addvl	x0, sp, #10
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z23.s, z23.s, z12.s
	addvl	x0, sp, #9
	uzp1	z2.h, z2.h, z2.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z24.s, z24.s, z12.s
	addvl	x0, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sqrshrnb	z0.h, z0.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z26.s, z26.s, z12.s
	addvl	x0, sp, #7
	uzp1	z0.h, z0.h, z0.h
	sqrshrnb	z17.h, z17.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z11.s, z11.s, z12.s
	addvl	x0, sp, #6
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z15.s, z15.s, z12.s
	addvl	x0, sp, #5
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z16.s, z16.s, z12.s
	addvl	x0, sp, #4
	uzp1	z19.h, z19.h, z19.h
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z21.s, z21.s, z12.s
	addvl	x0, sp, #3
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z10.s, z10.s, z12.s
	addvl	x0, sp, #2
	uzp1	z22.h, z22.h, z22.h
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z9.s, z9.s, z12.s
	addvl	x0, sp, #1
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z8.s, z8.s, z12.s
	add	x0, sp, 64
	ldr	z12, [x0]
	uzp1	z24.h, z24.h, z24.h
	addvl	x0, sp, #31
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sqrshrnb	z16.h, z16.s, #12
	str	q31, [x0]
	addvl	x0, sp, #31
	uzp1	z16.h, z16.h, z16.h
	add	x0, x0, 96
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sqrshrnb	z9.h, z9.s, #12
	str	q30, [x0]
	addvl	x0, sp, #31
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 128
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sub	z12.s, z7.s, z12.s
	str	q29, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	str	q28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	str	q27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	str	q25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	str	q14, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z13.h, z31.s, #12
	addvl	x0, sp, #31
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 288
	str	q13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	str	q6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	str	q5, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	str	q4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	str	q3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	str	q2, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	str	q1, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	str	q0, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z31.h, z13.s, #12
	addvl	x0, sp, #31
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 544
	str	q31, [x0]
	addvl	x0, sp, #31
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 576
	uzp1	z31.h, z31.h, z31.h
	str	q17, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	str	q18, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	str	q19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	str	q20, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	str	q22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	str	q23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 768
	str	q24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	str	q26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 832
	str	q11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	str	q15, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	str	q16, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	str	q21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	str	q10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	str	q9, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	str	q8, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	str	q31, [x0]
	add	x0, x2, x2, lsl 1
	add	x0, x1, x0, lsl 4
	add	x4, x0, 64
	.p2align 5,,15
.L23:
	sub	x0, x4, #64
	mov	x1, x5
	.p2align 5,,15
.L24:
	ldrh	w3, [x1], 32
	strh	w3, [x0], 2
	cmp	x4, x0
	bne	.L24
	add	x5, x5, 2
	add	x4, x4, x2, lsl 1
	cmp	x6, x5
	bne	.L23
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
	addvl	sp, sp, #31
	.cfi_def_cfa_offset 3136
	add	sp, sp, 3136
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	dynopt_idct32_sve2_shared, .-dynopt_idct32_sve2_shared
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
