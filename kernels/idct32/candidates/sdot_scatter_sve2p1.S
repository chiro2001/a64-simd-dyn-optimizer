	.arch armv9.4-a+crc
	.file	"sdot_scatter_sve2p1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB5:
	.cfi_startproc
	mov	x13, 191
	cntb	x12
	add	x3, x0, 64
	mul	x12, x12, x13
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0xf8,0x5,0x1e,0x22
	sub	sp, sp, #2112
	.cfi_escape 0xf,0xd,0x8f,0,0x92,0x2e,0,0xa,0xf8,0x5,0x1e,0x23,0xc0,0x10,0x22
	add	x4, sp, 64
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
	ldr	z22, [x3]
	add	x3, x0, 192
	ldr	z31, [x3]
	add	x3, x0, 320
	ldr	z23, [x3]
	add	x3, x0, 448
	zip1	z22.h, z22.h, z31.h
	ldr	z31, [x3]
	add	x3, x0, 576
	ldr	z24, [x3]
	zip1	z23.h, z23.h, z31.h
	add	x3, x0, 704
	ldr	z31, [x3]
	zip1	z24.h, z24.h, z31.h
	add	x3, x0, 832
	ldr	z25, [x3]
	add	x3, x0, 960
	ldr	z31, [x3]
	zip1	z25.h, z25.h, z31.h
	add	x3, x0, 1088
	ldr	z26, [x3]
	add	x3, x0, 1216
	ldr	z31, [x3]
	zip1	z26.h, z26.h, z31.h
	add	x3, x0, 1344
	ldr	z27, [x3]
	add	x3, x0, 1472
	ldr	z31, [x3]
	zip1	z27.h, z27.h, z31.h
	add	x3, x0, 1600
	ldr	z28, [x3]
	add	x3, x0, 1728
	ldr	z31, [x3]
	zip1	z28.h, z28.h, z31.h
	add	x3, x0, 1856
	ldr	z29, [x3]
	add	x3, x0, 1984
	ldr	z31, [x3]
	zip1	z29.h, z29.h, z31.h
	adrp	x3, _ZL6CDOT_O
	add	x3, x3, :lo12:_ZL6CDOT_O
	ldr	z31, [x3]
	mov	z21.d, z31.d
	movi	d31, #0
	mov	z30.d, z31.d
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 32
	ldr	z20, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 64
	ldr	z18, [x4]
	addvl	x4, sp, #2
	add	x4, x4, 64
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	add	x4, x3, 96
	ldr	z17, [x4]
	addvl	x4, sp, #3
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 128
	ldr	z16, [x4]
	addvl	x4, sp, #4
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 160
	ldr	z15, [x4]
	addvl	x4, sp, #5
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 192
	ldr	z14, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 224
	ldr	z13, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	add	x4, x3, 256
	ldr	z30, [x4]
	mov	z12.d, z30.d
	addvl	x4, sp, #8
	mov	z30.d, z31.d
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 288
	ldr	z11, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 320
	ldr	z10, [x4]
	addvl	x4, sp, #10
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 352
	ldr	z9, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 384
	ldr	z8, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 416
	ldr	z6, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 448
	ldr	z5, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 64
	str	z5, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z5.h
// 0 "" 2
#NO_APP
	add	x4, x3, 480
	ldr	z4, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 64
	str	z4, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z29.h, z4.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 512
	ldr	z3, [x4]
	addvl	x4, sp, #16
	add	x4, x4, 64
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 544
	ldr	z2, [x4]
	addvl	x4, sp, #17
	add	x4, x4, 64
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	add	x4, x3, 576
	ldr	z1, [x4]
	addvl	x4, sp, #18
	add	x4, x4, 64
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 608
	ldr	z0, [x4]
	addvl	x4, sp, #19
	add	x4, x4, 64
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 640
	ldr	z19, [x4]
	addvl	x4, sp, #20
	add	x4, x4, 64
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x3, 672
	ldr	z20, [x4]
	addvl	x4, sp, #21
	add	x4, x4, 64
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 704
	ldr	z21, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 64
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 736
	ldr	z17, [x4]
	mov	z20.d, z30.d
	addvl	x4, sp, #23
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
	add	x4, x3, 768
	ldr	z30, [x4]
	mov	z16.d, z30.d
	addvl	x4, sp, #24
	mov	z30.d, z31.d
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 800
	ldr	z15, [x4]
	addvl	x4, sp, #25
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 832
	ldr	z14, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 864
	ldr	z13, [x4]
	addvl	x4, sp, #27
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
	ldr	z12, [x4]
	addvl	x4, sp, #28
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 928
	ldr	z11, [x4]
	addvl	x4, sp, #29
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 960
	ldr	z10, [x4]
	addvl	x4, sp, #30
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 992
	ldr	z9, [x4]
	mov	z4.d, z30.d
	addvl	x4, sp, #31
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1024
	ldr	z8, [x4]
	mov	z30.d, z31.d
	cntb	x4
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 1056
	ldr	z2, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1088
	ldr	z1, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 1120
	ldr	z0, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1152
	ldr	z18, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1184
	ldr	z19, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1216
	ldr	z3, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1248
	ldr	z20, [x4]
	lsl	x5, x5, 3
	mov	z3.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1280
	ldr	z30, [x4]
	mov	z17.d, z30.d
	cntb	x4, all, mul #5
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1312
	ldr	z21, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1344
	ldr	z19, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1376
	ldr	z18, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1408
	ldr	z16, [x4]
	cntb	x4, all, mul #11
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1440
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1472
	ldr	z14, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 1504
	ldr	z13, [x4]
	lsl	x5, x5, 4
	mov	z2.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1536
	ldr	z12, [x4]
	mov	z30.d, z31.d
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 1568
	ldr	z11, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1600
	ldr	z10, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1632
	ldr	z1, [x4]
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1664
	ldr	z0, [x4]
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 1696
	ldr	z9, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1728
	ldr	z8, [x4]
	rdvl	x4, #27
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1760
	ldr	z20, [x4]
	mov	z1.d, z30.d
	cntb	x4, all, mul #11
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1792
	ldr	z30, [x4]
	mov	z17.d, z30.d
	cntb	x4, all, mul #7
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 1824
	ldr	z13, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1856
	ldr	z21, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 1888
	ldr	z19, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1920
	ldr	z9, [x4]
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 1952
	ldr	z18, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1984
	ldr	z16, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2016
	ldr	z15, [x4]
	lsl	x5, x5, 6
	mov	z0.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2048
	ldr	z14, [x4]
	mov	z30.d, z31.d
	cntb	x4
	lsl	x4, x4, 6
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2080
	ldr	z11, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2112
	ldr	z10, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2144
	ldr	z12, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2176
	ldr	z8, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2208
	ldr	z20, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2240
	ldr	z15, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 2272
	ldr	z13, [x4]
	lsl	x5, x5, 3
	mov	z21.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z21, [x4]
	add	x4, x3, 2304
	ldr	z21, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 2336
	ldr	z19, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 2368
	ldr	z17, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2400
	ldr	z13, [x4]
	cntb	x4, all, mul #5
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2432
	ldr	z9, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	add	x4, x3, 2464
	ldr	z11, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2496
	ldr	z18, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 2528
	ldr	z10, [x4]
	lsl	x5, x5, 4
	mov	z7.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
	add	x4, x3, 2560
	ldr	z16, [x4]
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2592
	ldr	z14, [x4]
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2624
	ldr	z20, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 2656
	ldr	z8, [x4]
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2688
	ldr	z12, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2720
	ldr	z17, [x4]
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2752
	ldr	z10, [x4]
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 2784
	ldr	z15, [x4]
	lsl	x5, x5, 3
	mov	z19.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
	add	x4, x3, 2816
	ldr	z19, [x4]
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 2848
	ldr	z11, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2880
	ldr	z13, [x4]
	cntb	x4, all, mul #6
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2912
	ldr	z21, [x4]
	cntb	x4, all, mul #13
	lsl	x5, x4, 3
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2944
	ldr	z15, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2976
	ldr	z18, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 5
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3008
	ldr	z9, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3040
	ldr	z16, [x4]
	lsl	x5, x5, 5
	mov	z14.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z14, [x4]
	add	x4, x3, 3072
	ldr	z14, [x4]
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3104
	ldr	z20, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3136
	ldr	z12, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3168
	ldr	z8, [x4]
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3200
	ldr	z17, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	add	x4, x3, 3232
	ldr	z10, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3264
	ldr	z16, [x4]
	cntb	x4, all, mul #6
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3296
	ldr	z19, [x4]
	lsl	x6, x5, 4
	mov	z13.d, z30.d
	add	x5, x5, x6
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z29.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	mov	z30.d, z31.d
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
	add	x4, x3, 3328
	ldr	z13, [x4]
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 3360
	ldr	z21, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	add	x4, x3, 3392
	ldr	z18, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	add	x4, x3, 3424
	ldr	z11, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3456
	ldr	z15, [x4]
	rdvl	x4, #27
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	add	x4, x3, 3488
	ldr	z9, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3520
	ldr	z19, [x4]
	rdvl	x4, #22
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 3552
	ldr	z20, [x4]
	lsl	x5, x5, 4
	mov	z8.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z30.d, z31.d
	lsl	x5, x4, 6
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
	add	x4, x3, 3584
	ldr	z8, [x4]
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 3616
	ldr	z12, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	add	x4, x3, 3648
	ldr	z14, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3680
	ldr	z10, [x4]
	rdvl	x4, #23
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3712
	ldr	z16, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3744
	ldr	z17, [x4]
	cntb	x4, all, mul #13
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 3776
	ldr	z21, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3808
	ldr	z20, [x4]
	mov	z18.d, z30.d
	cntb	x4, all, mul #7
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z30.d, z31.d
	lsl	x6, x5, 4
	sub	x5, x6, x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
	add	x4, x3, 3840
	ldr	z18, [x4]
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 3872
	ldr	z22, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 3904
	ldr	z23, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 3936
	ldr	z24, [x4]
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3968
	ldr	z25, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	add	x4, x3, 4000
	ldr	z26, [x4]
	rdvl	x4, #25
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 4032
	ldr	z27, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	add	x3, x3, 4064
	ldr	z28, [x3]
	lsl	x4, x4, 7
	mov	z6.d, z30.d
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	add	x3, x0, 128
	ldr	z19, [x3]
	cntb	x4
	add	x3, x0, 384
	ldr	z30, [x3]
	zip1	z19.h, z19.h, z30.h
	add	x3, x0, 640
	ldr	z20, [x3]
	lsl	x4, x4, 7
	add	x3, x0, 896
	ldr	z30, [x3]
	zip1	z20.h, z20.h, z30.h
	add	x3, x0, 1152
	ldr	z29, [x3]
	add	x4, sp, x4
	add	x3, x0, 1408
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, x0, 1664
	ldr	z30, [x3]
	add	x4, x4, 64
	add	x3, x0, 1920
	ldr	z28, [x3]
	zip1	z30.h, z30.h, z28.h
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	ldr	z28, [x3]
	mov	z27.d, z28.d
	mov	z28.d, z31.d
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 32
	ldr	z26, [x4]
	lsl	x5, x5, 7
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 64
	ldr	z24, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 96
	ldr	z22, [x4]
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 128
	ldr	z23, [x4]
	lsl	x5, x5, 5
	mov	z27.d, z31.d
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 160
	ldr	z25, [x4]
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 192
	ldr	z26, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 224
	ldr	z24, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 256
	ldr	z22, [x4]
	mov	z26.d, z31.d
	rdvl	x4, #17
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 288
	ldr	z25, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 320
	ldr	z23, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 352
	ldr	z24, [x4]
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 384
	ldr	z25, [x4]
	lsl	x5, x5, 4
	mov	z23.d, z25.d
	mov	z25.d, z31.d
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 416
	ldr	z22, [x4]
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 448
	ldr	z24, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 480
	ldr	z22, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	add	x4, x3, 512
	ldr	z23, [x4]
	mov	z24.d, z31.d
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 544
	ldr	z22, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 576
	ldr	z23, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 608
	ldr	z23, [x4]
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z30.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 640
	ldr	z22, [x4]
	lsl	x5, x5, 3
	mov	z23.d, z31.d
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 672
	ldr	z11, [x4]
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 704
	ldr	z15, [x4]
	cntb	x4, all, mul #10
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	add	x4, x3, 736
	ldr	z13, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 768
	ldr	z9, [x4]
	mov	z22.d, z31.d
	rdvl	x4, #19
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 800
	ldr	z12, [x4]
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 832
	ldr	z10, [x4]
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 864
	ldr	z8, [x4]
	cntb	x4, all, mul #5
	lsl	x5, x4, 5
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z30.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	add	x4, x3, 896
	ldr	z17, [x4]
	lsl	x5, x5, 3
	mov	z21.d, z31.d
	addvl	x4, x5, #-4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 928
	ldr	z19, [x4]
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 960
	ldr	z20, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 992
	ldr	z29, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x4, x0, 256
	ldr	z29, [x4]
	add	x4, x0, 768
	ldr	z30, [x4]
	zip1	z29.h, z29.h, z30.h
	add	x4, x0, 1280
	ldr	z30, [x4]
	add	x4, x0, 1792
	ldr	z20, [x4]
	zip1	z30.h, z30.h, z20.h
	add	x4, x3, 1024
	ldr	z14, [x4]
	mov	z20.d, z31.d
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1056
	ldr	z16, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1088
	ldr	z11, [x4]
	mov	z19.d, z31.d
	rdvl	x4, #18
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1120
	ldr	z15, [x4]
	lsl	x6, x5, 3
	add	x5, x5, x6
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	add	x4, x3, 1152
	ldr	z13, [x4]
	lsl	x5, x5, 3
	mov	z18.d, z31.d
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1184
	ldr	z9, [x4]
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z30.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 1216
	ldr	z8, [x4]
	lsl	x5, x5, 3
	mov	z17.d, z31.d
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1248
	ldr	z29, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x4, x0, 512
	ldr	z30, [x4]
	mov	z15.d, z31.d
	add	x4, x0, 1536
	ldr	z29, [x4]
	zip1	z30.h, z30.h, z29.h
	add	x4, x3, 1280
	ldr	z29, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1312
	ldr	z29, [x4]
	lsl	x5, x5, 3
	mov	z16.d, z31.d
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x4, x0, 1024
	ldr	z30, [x4]
	ldr	z14, [x0]
	add	x4, x3, 1344
	ldr	z29, [x4]
	zip1	z14.h, z14.h, z30.h
	cntb	x4, all, mul #10
	mov	z30.d, z29.d
	mov	z29.d, z31.d
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
	ldr	z30, [x3]
	mov	z12.d, z30.d
	rdvl	x3, #19
	mov	z30.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	add	z13.s, z29.s, z15.s
	add	z8.s, z13.s, z20.s
	lsl	x4, x4, 1
	sub	z13.s, z13.s, z20.s
	add	z20.s, z8.s, z28.s
	incb	x4
	sub	z8.s, z8.s, z28.s
	add	z12.s, z30.s, z16.s
	add	z9.s, z12.s, z19.s
	sub	z12.s, z12.s, z19.s
	add	z19.s, z9.s, z27.s
	lsl	x4, x4, 2
	sub	z30.s, z30.s, z16.s
	sub	z9.s, z9.s, z27.s
	addvl	x3, x4, #1
	add	z10.s, z30.s, z18.s
	sub	z30.s, z30.s, z18.s
	add	x3, x3, 64
	add	z18.s, z10.s, z26.s
	sub	z29.s, z29.s, z15.s
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z7.s, z20.s, z28.s
	rdvl	x3, #26
	add	z11.s, z29.s, z17.s
	sub	z29.s, z29.s, z17.s
	lsl	x4, x3, 3
	add	z17.s, z11.s, z25.s
	add	z16.s, z29.s, z24.s
	sub	x3, x4, x3
	rdvl	x4, #22
	add	z15.s, z30.s, z23.s
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	z14.s, z12.s, z22.s
	add	x3, sp, x3
	str	z7, [x3]
	add	z5.s, z13.s, z21.s
	addvl	x3, x4, #-2
	mov	x4, 183
	sub	z12.s, z12.s, z22.s
	add	x3, x3, 64
	sub	z30.s, z30.s, z23.s
	sub	z13.s, z13.s, z21.s
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z7.s, z19.s, z28.s
	cntb	x3
	sub	z29.s, z29.s, z24.s
	sub	z11.s, z11.s, z25.s
	sub	z10.s, z10.s, z26.s
	add	z21.s, z5.s, z0.s
	sqrshrnb	z21.h, z21.s, #7
	mul	x3, x3, x4
	cntb	x4, all, mul #11
	uzp1	z21.h, z21.h, z21.h
	lsl	x4, x4, 4
	sunpklo	z21.s, z21.h
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	add	z7.s, z16.s, z3.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #9
	sub	z3.s, z16.s, z3.s
	add	x3, x3, 64
	lsl	x4, x4, 2
	sqrshrnb	z3.h, z3.s, #7
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z27.s, z18.s, z28.s
	rdvl	x3, #23
	add	z28.s, z17.s, z4.s
	sub	z4.s, z17.s, z4.s
	lsl	x3, x3, 3
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	add	x3, sp, x3
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	add	x3, x3, 64
	str	z27, [x3]
	add	z27.s, z15.s, z2.s
	addvl	x3, x4, #1
	sub	z2.s, z15.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	sunpklo	z4.s, z4.h
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	add	z28.s, z14.s, z1.s
	cntb	x3, all, mul #6
	sub	z1.s, z14.s, z1.s
	sqrshrnb	z1.h, z1.s, #7
	lsl	x4, x3, 5
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z7, [x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	addvl	x3, x4, #-4
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z28, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z5, [x3]
	add	z5.s, z8.s, z6.s
	cntb	x3, all, mul #11
	sub	z8.s, z8.s, z6.s
	sqrshrnb	z8.h, z8.s, #7
	lsl	x3, x3, 4
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
	add	z22.s, z13.s, z28.s
	addvl	x3, x4, #1
	rdvl	x4, #22
	sqrshrnb	z22.h, z22.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 3
	uzp1	z22.h, z22.h, z22.h
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z23.s, z12.s, z7.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sunpklo	z22.s, z22.h
	lsl	x4, x4, 3
	add	x3, x3, 64
	sqrshrnb	z23.h, z23.s, #7
	incb	x4
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z24.s, z30.s, z27.s
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	lsl	x4, x4, 1
	sqrshrnb	z24.h, z24.s, #7
	uzp1	z24.h, z24.h, z24.h
	addvl	x3, x4, #1
	sunpklo	z24.s, z24.h
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z25.s, z29.s, z7.s
	cntb	x3, all, mul #12
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z25.h, z25.h, z25.h
	lsl	x4, x3, 4
	sunpklo	z25.s, z25.h
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z26.s, z11.s, z28.s
	cntb	x3, all, mul #3
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	lsl	x4, x3, 6
	sunpklo	z26.s, z26.h
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	add	x3, x3, 64
	sub	x4, x5, x4
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z27.s, z10.s, z7.s
	sub	z10.s, z10.s, z7.s
	sqrshrnb	z27.h, z27.s, #7
	lsl	x4, x4, 2
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	addvl	x3, x4, #1
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	add	x3, x3, 64
	sunpklo	z10.s, z10.h
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z28.s, z9.s, z28.s
	cntb	x3, all, mul #3
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	lsl	x4, x3, 6
	sunpklo	z28.s, z28.h
	sub	x3, x4, x3
	addvl	x4, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	lsl	x4, x4, 2
	str	z5, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
	sub	z9.s, z9.s, z6.s
	cntb	x3, all, mul #12
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	lsl	x4, x3, 4
	sunpklo	z9.s, z9.h
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z11.s, z11.s, z7.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	lsl	x4, x4, 1
	sunpklo	z11.s, z11.h
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z29.s, z29.s, z7.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sqrshrnb	z29.h, z29.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 4
	uzp1	z29.h, z29.h, z29.h
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z30.s, z30.s, z7.s
	addvl	x3, x4, #1
	rdvl	x4, #20
	sunpklo	z29.s, z29.h
	add	x3, x3, 64
	lsl	x4, x4, 2
	sqrshrnb	z30.h, z30.s, #7
	add	x3, sp, x3
	ldr	z7, [x3]
	incb	x4, all, mul #4
	cntb	x3, all, mul #11
	sub	z12.s, z12.s, z7.s
	uzp1	z30.h, z30.h, z30.h
	lsl	x3, x3, 4
	lsl	x4, x4, 1
	sunpklo	z30.s, z30.h
	add	x3, sp, x3
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	add	x3, x3, 64
	ldr	z7, [x3]
	sub	z13.s, z13.s, z7.s
	addvl	x3, x4, #4
	cntb	x4, all, mul #11
	sunpklo	z12.s, z12.h
	add	x3, x3, 64
	lsl	x4, x4, 4
	sqrshrnb	z13.h, z13.s, #7
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z0.s, z7.s, z0.s
	addvl	x3, x4, #-1
	rdvl	x4, #22
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 64
	lsl	x4, x4, 3
	sunpklo	z13.s, z13.h
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z5.s, z18.s, z15.s
	addvl	x3, x4, #-2
	rdvl	x4, #21
	sqrshrnb	z0.h, z0.s, #7
	lsl	x4, x4, 1
	add	x3, x3, 64
	uzp1	z0.h, z0.h, z0.h
	incb	x4
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z6.s, z19.s, z15.s
	sunpklo	z0.s, z0.h
	sqrshrnb	z5.h, z5.s, #7
	lsl	x4, x4, 2
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	addvl	x3, x4, #1
	rdvl	x4, #20
	sqrshrnb	z6.h, z6.s, #7
	lsl	x4, x4, 2
	add	x3, x3, 64
	uzp1	z6.h, z6.h, z6.h
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z7.s, z20.s, z15.s
	sunpklo	z6.s, z6.h
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	mov	w3, 8
	whilelo	p6.s, wzr, w3
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z7, [x3]
	sqrshrnb	z14.h, z7.s, #7
	mov	w3, 32
	index	z7.s, #0, w3
	uzp1	z14.h, z14.h, z14.h
	addvl	x3, x4, #-1
	sunpklo	z14.s, z14.h
	mov	x4, 183
	add	x3, x3, 64
	add	x3, sp, x3
	st1h	z14.s, p6, [x3, z7.s, sxtw 1]
	cntb	x3
	mul	x3, x3, x4
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z15.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x3, x3, 66
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z15.s, p6, [x3, z7.s, sxtw 1]
	lsl	x4, x4, 6
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
	sqrshrnb	z16.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #9
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 68
	lsl	x4, x4, 2
	sunpklo	z16.s, z16.h
	add	x3, sp, x3
	st1h	z16.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z17.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x3, 70
	add	x3, sp, x3
	st1h	z17.s, p6, [x3, z7.s, sxtw 1]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z18.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, x3, 72
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z7.s, sxtw 1]
	lsl	x4, x4, 6
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z19.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #12
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 74
	lsl	x4, x4, 4
	sunpklo	z19.s, z19.h
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z20.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z20.h, z20.h, z20.h
	add	x3, x3, 76
	lsl	x4, x4, 6
	sunpklo	z20.s, z20.h
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 78
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 80
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z22.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 82
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z23.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 84
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z24.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 86
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z25.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 88
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z26.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 90
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z27.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	add	x3, x3, 92
	add	x3, sp, x3
	st1h	z28.s, p6, [x3, z7.s, sxtw 1]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z28, [x3]
	sqrshrnb	z28.h, z28.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z28.h, z28.h, z28.h
	add	x3, x3, 94
	lsl	x4, x4, 6
	sunpklo	z28.s, z28.h
	add	x3, sp, x3
	st1h	z28.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 96
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 98
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 100
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z10.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 102
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 104
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z29.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 106
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z30.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 108
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 110
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z13.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 112
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 114
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 116
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 118
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 120
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z4.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 122
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z5.s, p6, [x3, z7.s, sxtw 1]
	addvl	x3, x4, #-1
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 124
	incb	x4, all, mul #4
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z7.s, sxtw 1]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z6, [x3]
	sqrshrnb	z30.h, z6.s, #7
	addvl	x3, x4, #-1
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x3, x3, 126
	add	x3, sp, x3
	st1h	z30.s, p6, [x3, z7.s, sxtw 1]
	add	x3, x0, 80
	ldr	z22, [x3]
	add	x3, x0, 208
	ldr	z30, [x3]
	zip1	z22.h, z22.h, z30.h
	add	x3, x0, 336
	ldr	z23, [x3]
	add	x3, x0, 464
	ldr	z30, [x3]
	zip1	z23.h, z23.h, z30.h
	add	x3, x0, 592
	ldr	z24, [x3]
	add	x3, x0, 720
	ldr	z30, [x3]
	zip1	z24.h, z24.h, z30.h
	add	x3, x0, 848
	ldr	z25, [x3]
	add	x3, x0, 976
	ldr	z30, [x3]
	zip1	z25.h, z25.h, z30.h
	add	x3, x0, 1104
	ldr	z26, [x3]
	add	x3, x0, 1232
	ldr	z30, [x3]
	zip1	z26.h, z26.h, z30.h
	add	x3, x0, 1360
	ldr	z27, [x3]
	add	x3, x0, 1488
	ldr	z30, [x3]
	zip1	z27.h, z27.h, z30.h
	add	x3, x0, 1616
	ldr	z28, [x3]
	add	x3, x0, 1744
	ldr	z30, [x3]
	zip1	z28.h, z28.h, z30.h
	add	x3, x0, 1872
	ldr	z29, [x3]
	add	x3, x0, 2000
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, sp, 64
	ldr	z21, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z15.d, z30.d
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z30.d, z31.d
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z5, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z15.d, z30.d
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z4.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z5.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	mov	z30.d, z31.d
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	mov	z4.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z3.d, z30.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	mov	z2.d, z30.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z1.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z0.d, z30.d
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z30.d, z31.d
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #-1
	mov	z21.d, z30.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z21.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z21, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z18.d, z30.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z18, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z7.d, z30.d
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z10.d, z30.d
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	mov	z19.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #12
	mov	z30.d, z31.d
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z19, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z21.d, z30.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z30.d, z31.d
	lsl	x5, x4, 4
	sub	x4, x5, x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z27.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	add	x3, x0, 144
	ldr	z19, [x3]
	add	x3, x0, 400
	ldr	z30, [x3]
	zip1	z19.h, z19.h, z30.h
	add	x3, x0, 656
	ldr	z20, [x3]
	add	x3, x0, 912
	ldr	z30, [x3]
	zip1	z20.h, z20.h, z30.h
	add	x3, x0, 1168
	ldr	z29, [x3]
	add	x3, x0, 1424
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, x0, 1680
	ldr	z30, [x3]
	add	x3, x0, 1936
	ldr	z28, [x3]
	zip1	z30.h, z30.h, z28.h
	cntb	x3
	mov	z28.d, z31.d
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z27.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z26.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z25.d, z31.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z24.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #1
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z30.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z23.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z22.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z21.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x3, x0, 272
	ldr	z29, [x3]
	add	x3, x0, 784
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, x0, 1296
	ldr	z30, [x3]
	add	x3, x0, 1808
	ldr	z20, [x3]
	zip1	z30.h, z30.h, z20.h
	cntb	x3, all, mul #5
	mov	z20.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z19.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #9
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z18.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z30.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z17.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x3, x0, 528
	ldr	z30, [x3]
	mov	z15.d, z31.d
	add	x3, x0, 1552
	ldr	z29, [x3]
	zip1	z30.h, z30.h, z29.h
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z16.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x3, x0, 16
	ldr	z14, [x3]
	mov	z29.d, z31.d
	add	x3, x0, 1040
	ldr	z30, [x3]
	zip1	z14.h, z14.h, z30.h
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z30.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	add	z13.s, z29.s, z15.s
	add	z8.s, z13.s, z20.s
	lsl	x4, x4, 1
	sub	z13.s, z13.s, z20.s
	add	z20.s, z8.s, z28.s
	incb	x4
	sub	z8.s, z8.s, z28.s
	add	z12.s, z30.s, z16.s
	add	z9.s, z12.s, z19.s
	sub	z12.s, z12.s, z19.s
	add	z19.s, z9.s, z27.s
	lsl	x4, x4, 2
	sub	z30.s, z30.s, z16.s
	add	z10.s, z30.s, z18.s
	addvl	x3, x4, #1
	sub	z30.s, z30.s, z18.s
	add	z18.s, z10.s, z26.s
	add	x3, x3, 64
	sub	z29.s, z29.s, z15.s
	add	z11.s, z29.s, z17.s
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z7.s, z20.s, z7.s
	rdvl	x3, #26
	sub	z29.s, z29.s, z17.s
	add	z17.s, z11.s, z25.s
	lsl	x4, x3, 3
	add	z16.s, z29.s, z24.s
	sub	z9.s, z9.s, z27.s
	sub	x3, x4, x3
	rdvl	x4, #22
	add	z27.s, z16.s, z3.s
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	z15.s, z30.s, z23.s
	add	x3, sp, x3
	str	z7, [x3]
	add	z14.s, z12.s, z22.s
	addvl	x3, x4, #-2
	mov	x4, 183
	add	z6.s, z13.s, z21.s
	add	x3, x3, 64
	sub	z13.s, z13.s, z21.s
	sub	z12.s, z12.s, z22.s
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z7.s, z19.s, z28.s
	cntb	x3
	add	z28.s, z15.s, z2.s
	sub	z30.s, z30.s, z23.s
	sub	z29.s, z29.s, z24.s
	sub	z11.s, z11.s, z25.s
	sub	z10.s, z10.s, z26.s
	mul	x3, x3, x4
	cntb	x4, all, mul #9
	add	z21.s, z6.s, z0.s
	lsl	x4, x4, 2
	sub	z2.s, z15.s, z2.s
	sub	z3.s, z16.s, z3.s
	add	x3, x3, 64
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x3, sp, x3
	str	z7, [x3]
	add	z7.s, z18.s, z5.s
	rdvl	x3, #23
	sub	z5.s, z18.s, z5.s
	sunpklo	z21.s, z21.h
	lsl	x3, x3, 3
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x3, sp, x3
	sunpklo	z2.s, z2.h
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 64
	str	z7, [x3]
	add	z7.s, z17.s, z4.s
	addvl	x3, x4, #1
	sub	z4.s, z17.s, z4.s
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	add	x3, x3, x3, lsl 2
	sunpklo	z4.s, z4.h
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 64
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x3, sp, x3
	str	z7, [x3]
	add	z7.s, z14.s, z1.s
	cntb	x3, all, mul #6
	sub	z1.s, z14.s, z1.s
	sqrshrnb	z1.h, z1.s, #7
	lsl	x4, x3, 5
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z27, [x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	addvl	x3, x4, #-4
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z7, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z6, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z22.s, z13.s, z27.s
	cntb	x3, all, mul #11
	sqrshrnb	z22.h, z22.s, #7
	uzp1	z22.h, z22.h, z22.h
	lsl	x3, x3, 4
	sunpklo	z22.s, z22.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
	add	z23.s, z12.s, z28.s
	addvl	x3, x4, #1
	rdvl	x4, #22
	sqrshrnb	z23.h, z23.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 3
	uzp1	z23.h, z23.h, z23.h
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z24.s, z30.s, z27.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sunpklo	z23.s, z23.h
	lsl	x4, x4, 3
	add	x3, x3, 64
	sqrshrnb	z24.h, z24.s, #7
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z25.s, z29.s, z7.s
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	lsl	x4, x4, 1
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z25.h, z25.h, z25.h
	addvl	x3, x4, #1
	sunpklo	z25.s, z25.h
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z26.s, z11.s, z28.s
	cntb	x3, all, mul #12
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	lsl	x4, x3, 4
	sunpklo	z26.s, z26.h
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	add	x3, x3, 64
	sub	x4, x5, x4
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z27.s, z10.s, z7.s
	sqrshrnb	z27.h, z27.s, #7
	uzp1	z27.h, z27.h, z27.h
	lsl	x4, x4, 2
	sunpklo	z27.s, z27.h
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
	add	z28.s, z9.s, z28.s
	cntb	x3, all, mul #3
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	lsl	x4, x3, 6
	sunpklo	z28.s, z28.h
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z6.s, z8.s, z7.s
	cntb	x3, all, mul #3
	sub	z8.s, z8.s, z7.s
	sqrshrnb	z8.h, z8.s, #7
	lsl	x4, x3, 6
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	sub	x3, x4, x3
	addvl	x4, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	lsl	x4, x4, 2
	str	z6, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z9.s, z9.s, z7.s
	cntb	x3, all, mul #12
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	lsl	x4, x3, 4
	sunpklo	z9.s, z9.h
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z10.s, z10.s, z7.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	lsl	x4, x4, 1
	sunpklo	z10.s, z10.h
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z11.s, z11.s, z7.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sqrshrnb	z11.h, z11.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 4
	uzp1	z11.h, z11.h, z11.h
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z29.s, z29.s, z7.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	sunpklo	z11.s, z11.h
	add	x3, x3, 64
	lsl	x4, x4, 4
	sqrshrnb	z29.h, z29.s, #7
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z6.s, z30.s, z7.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 64
	lsl	x4, x4, 4
	sunpklo	z29.s, z29.h
	add	x3, sp, x3
	str	z6, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z12.s, z12.s, z30.s
	addvl	x3, x4, #-1
	rdvl	x4, #20
	sqrshrnb	z12.h, z12.s, #7
	lsl	x4, x4, 2
	add	x3, x3, 64
	uzp1	z12.h, z12.h, z12.h
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z30, [x3]
	sub	z13.s, z13.s, z30.s
	sunpklo	z12.s, z12.h
	sqrshrnb	z13.h, z13.s, #7
	lsl	x4, x4, 1
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	addvl	x3, x4, #4
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z0.s, z7.s, z0.s
	addvl	x3, x4, #-2
	rdvl	x4, #21
	sqrshrnb	z0.h, z0.s, #7
	lsl	x4, x4, 1
	add	x3, x3, 64
	uzp1	z0.h, z0.h, z0.h
	incb	x4
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z6.s, z19.s, z15.s
	sunpklo	z0.s, z0.h
	sqrshrnb	z6.h, z6.s, #7
	lsl	x4, x4, 2
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z7.s, z20.s, z15.s
	rdvl	x3, #26
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	lsl	x4, x3, 3
	sunpklo	z7.s, z7.h
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z30, [x3]
	sqrshrnb	z14.h, z30.s, #7
	mov	w3, 32
	index	z30.s, #0, w3
	uzp1	z14.h, z14.h, z14.h
	addvl	x3, x4, #-1
	sunpklo	z14.s, z14.h
	mov	x4, 183
	add	x3, x3, 576
	add	x3, sp, x3
	st1h	z14.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3
	mul	x3, x3, x4
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z15.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x3, x3, 578
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z15.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 6
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
	sqrshrnb	z16.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #9
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 580
	lsl	x4, x4, 2
	sunpklo	z16.s, z16.h
	add	x3, sp, x3
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z17.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x3, 582
	add	x3, sp, x3
	st1h	z17.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z18.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, x3, 584
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 6
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z19.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #12
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 586
	lsl	x4, x4, 4
	sunpklo	z19.s, z19.h
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z20.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z20.h, z20.h, z20.h
	add	x3, x3, 588
	lsl	x4, x4, 6
	sunpklo	z20.s, z20.h
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 590
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 592
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z22.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 594
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z23.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 596
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z24.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 598
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z25.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 600
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z26.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 602
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z27.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	add	x3, x3, 604
	add	x3, sp, x3
	st1h	z28.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z27, [x3]
	sqrshrnb	z28.h, z27.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z28.h, z28.h, z28.h
	add	x3, x3, 606
	lsl	x4, x4, 6
	sunpklo	z28.s, z28.h
	add	x3, sp, x3
	st1h	z28.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 608
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 610
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 612
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z10.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 614
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	add	x3, x3, 616
	lsl	x4, x4, 4
	add	x3, sp, x3
	st1h	z29.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z27, [x3]
	sqrshrnb	z29.h, z27.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 618
	lsl	x4, x4, 6
	sunpklo	z29.s, z29.h
	add	x3, sp, x3
	st1h	z29.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 620
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 622
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z13.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 624
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 626
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 628
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 630
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 632
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z4.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 634
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z5.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 636
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	add	x3, x3, 638
	add	x3, sp, x3
	st1h	z7.s, p6, [x3, z30.s, sxtw 1]
	add	x3, x0, 96
	ldr	z22, [x3]
	add	x3, x0, 224
	ldr	z29, [x3]
	zip1	z22.h, z22.h, z29.h
	add	x3, x0, 352
	ldr	z23, [x3]
	add	x3, x0, 480
	ldr	z29, [x3]
	zip1	z23.h, z23.h, z29.h
	add	x3, x0, 608
	ldr	z24, [x3]
	add	x3, x0, 736
	ldr	z29, [x3]
	zip1	z24.h, z24.h, z29.h
	add	x3, x0, 864
	ldr	z25, [x3]
	add	x3, x0, 992
	ldr	z29, [x3]
	zip1	z25.h, z25.h, z29.h
	add	x3, x0, 1120
	ldr	z26, [x3]
	add	x3, x0, 1248
	ldr	z29, [x3]
	zip1	z26.h, z26.h, z29.h
	add	x3, x0, 1376
	ldr	z27, [x3]
	add	x3, x0, 1504
	ldr	z29, [x3]
	zip1	z27.h, z27.h, z29.h
	add	x3, x0, 1632
	ldr	z28, [x3]
	add	x3, x0, 1760
	ldr	z29, [x3]
	zip1	z28.h, z28.h, z29.h
	add	x3, x0, 1888
	ldr	z29, [x3]
	add	x3, x0, 2016
	ldr	z21, [x3]
	zip1	z29.h, z29.h, z21.h
	add	x3, sp, 64
	ldr	z20, [x3]
	mov	z21.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z15.d, z21.d
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z21.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z5, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z15.d, z21.d
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z4.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z21.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z15.d, z21.d
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z21.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	mov	z4.d, z21.d
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z21.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z3.d, z21.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z21.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	mov	z2.d, z21.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z21.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z1.d, z21.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z21.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z0.d, z21.d
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z21.d, z31.d
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #-1
	mov	z18.d, z21.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z21.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z18, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z7.d, z21.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z21.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z19.d, z21.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z21.d, z31.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z19, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	mov	z21.d, z31.d
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z20.d, z21.d
	lsl	x5, x4, 4
	add	x4, x4, x5
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x4, x5, #-3
	mov	z21.d, z31.d
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z20, [x3]
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	mov	z21.d, z31.d
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z26.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x0, 160
	ldr	z18, [x3]
	add	x3, x0, 416
	ldr	z31, [x3]
	zip1	z18.h, z18.h, z31.h
	add	x3, x0, 672
	ldr	z19, [x3]
	add	x3, x0, 928
	ldr	z31, [x3]
	zip1	z19.h, z19.h, z31.h
	add	x3, x0, 1184
	ldr	z28, [x3]
	add	x3, x0, 1440
	ldr	z31, [x3]
	zip1	z28.h, z28.h, z31.h
	add	x3, x0, 1696
	ldr	z29, [x3]
	add	x3, x0, 1952
	ldr	z31, [x3]
	zip1	z29.h, z29.h, z31.h
	cntb	x3
	movi	d31, #0
	mov	z27.d, z31.d
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z26.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z25.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z24.d, z31.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z23.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #1
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z22.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z21.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z20.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	add	x3, x0, 288
	ldr	z28, [x3]
	add	x3, x0, 800
	ldr	z29, [x3]
	zip1	z28.h, z28.h, z29.h
	add	x3, x0, 1312
	ldr	z29, [x3]
	add	x3, x0, 1824
	ldr	z19, [x3]
	zip1	z29.h, z29.h, z19.h
	cntb	x3, all, mul #5
	mov	z19.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z18.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #9
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z17.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z16.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	add	x3, x0, 544
	ldr	z29, [x3]
	mov	z14.d, z31.d
	add	x3, x0, 1568
	ldr	z28, [x3]
	zip1	z29.h, z29.h, z28.h
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z15.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	add	x3, x0, 32
	ldr	z13, [x3]
	mov	z28.d, z31.d
	add	x3, x0, 1056
	ldr	z29, [x3]
	zip1	z13.h, z13.h, z29.h
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z29.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	add	z13.s, z28.s, z14.s
	add	z8.s, z13.s, z19.s
	lsl	x4, x4, 3
	sub	z13.s, z13.s, z19.s
	add	z19.s, z8.s, z27.s
	addvl	x3, x4, #-2
	mov	x4, 183
	add	z5.s, z13.s, z20.s
	add	x3, x3, 64
	sub	z13.s, z13.s, z20.s
	add	z12.s, z29.s, z15.s
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z7.s, z19.s, z7.s
	cntb	x3
	add	z9.s, z12.s, z18.s
	sub	z12.s, z12.s, z18.s
	add	z18.s, z9.s, z26.s
	sub	z29.s, z29.s, z15.s
	add	z10.s, z29.s, z17.s
	mul	x3, x3, x4
	cntb	x4, all, mul #11
	sub	z29.s, z29.s, z17.s
	lsl	x4, x4, 4
	add	z17.s, z10.s, z25.s
	sub	z28.s, z28.s, z14.s
	add	x3, x3, 64
	add	z11.s, z28.s, z16.s
	sub	z28.s, z28.s, z16.s
	add	x3, sp, x3
	str	z7, [x3]
	add	z16.s, z11.s, z24.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #9
	add	z15.s, z28.s, z23.s
	add	x3, x3, 64
	lsl	x4, x4, 2
	sub	z8.s, z8.s, z27.s
	add	x3, sp, x3
	ldr	z20, [x3]
	add	z7.s, z18.s, z20.s
	rdvl	x3, #23
	add	z27.s, z15.s, z3.s
	add	z14.s, z29.s, z22.s
	lsl	x3, x3, 3
	add	z6.s, z12.s, z21.s
	sub	z29.s, z29.s, z22.s
	add	x3, sp, x3
	sub	z12.s, z12.s, z21.s
	sub	z28.s, z28.s, z23.s
	add	x3, x3, 64
	str	z7, [x3]
	sub	z11.s, z11.s, z24.s
	cntb	x3, all, mul #11
	sub	z10.s, z10.s, z25.s
	add	z20.s, z6.s, z1.s
	lsl	x3, x3, 4
	sub	z9.s, z9.s, z26.s
	add	z21.s, z5.s, z0.s
	add	x3, sp, x3
	sub	z3.s, z15.s, z3.s
	sqrshrnb	z20.h, z20.s, #7
	add	x3, x3, 64
	ldr	z7, [x3]
	add	z7.s, z17.s, z7.s
	addvl	x3, x4, #1
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x3, x3, x3, lsl 2
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 64
	sunpklo	z3.s, z3.h
	add	x3, sp, x3
	str	z7, [x3]
	add	z7.s, z16.s, z4.s
	cntb	x3, all, mul #6
	sub	z4.s, z16.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	lsl	x4, x3, 5
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z7, [x3]
	add	z7.s, z14.s, z2.s
	cntb	x3, all, mul #11
	sub	z2.s, z14.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, x3, lsl 4
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	addvl	x3, x4, #-4
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z7, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	rdvl	x4, #21
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z6, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z5, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z22.s, z13.s, z27.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sqrshrnb	z22.h, z22.s, #7
	lsl	x4, x4, 3
	add	x3, x3, 64
	uzp1	z22.h, z22.h, z22.h
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z23.s, z12.s, z7.s
	sunpklo	z22.s, z22.h
	sqrshrnb	z23.h, z23.s, #7
	lsl	x4, x4, 1
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z24.s, z29.s, z27.s
	cntb	x3, all, mul #12
	sqrshrnb	z24.h, z24.s, #7
	uzp1	z24.h, z24.h, z24.h
	lsl	x4, x3, 4
	sunpklo	z24.s, z24.h
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	add	x3, x3, 64
	sub	x4, x5, x4
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z25.s, z28.s, z7.s
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z25.h, z25.h, z25.h
	lsl	x4, x4, 2
	sunpklo	z25.s, z25.h
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
	add	z26.s, z11.s, z27.s
	cntb	x3, all, mul #3
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	lsl	x4, x3, 6
	sunpklo	z26.s, z26.h
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
	add	z27.s, z10.s, z7.s
	rdvl	x3, #26
	sub	z10.s, z10.s, z7.s
	sqrshrnb	z27.h, z27.s, #7
	lsl	x4, x3, 3
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	sub	x3, x4, x3
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	add	x3, x3, 64
	sunpklo	z10.s, z10.h
	add	x3, sp, x3
	ldr	z6, [x3]
	add	z6.s, z9.s, z6.s
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z6, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z6, [x3]
	add	z5.s, z8.s, z6.s
	addvl	x3, x4, #-2
	sub	z8.s, z8.s, z6.s
	sqrshrnb	z8.h, z8.s, #7
	add	x3, x3, 64
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x3, sp, x3
	str	z5, [x3]
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	addvl	x4, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	lsl	x4, x4, 2
	ldr	z6, [x3]
	addvl	x3, x4, #1
	sub	z9.s, z9.s, z6.s
	sqrshrnb	z9.h, z9.s, #7
	add	x3, x3, 64
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z11.s, z11.s, z7.s
	cntb	x3, all, mul #12
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	lsl	x4, x3, 4
	sunpklo	z11.s, z11.h
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z28.s, z28.s, z7.s
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	lsl	x4, x4, 1
	sunpklo	z28.s, z28.h
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z29.s, z29.s, z7.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	sqrshrnb	z29.h, z29.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 4
	uzp1	z29.h, z29.h, z29.h
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z12.s, z12.s, z7.s
	addvl	x3, x4, #1
	rdvl	x4, #21
	sunpklo	z29.s, z29.h
	lsl	x4, x4, 1
	add	x3, x3, 64
	sqrshrnb	z12.h, z12.s, #7
	incb	x4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z13.s, z13.s, z7.s
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	lsl	x4, x4, 2
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	addvl	x3, x4, #1
	rdvl	x4, #20
	sunpklo	z13.s, z13.h
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z0.s, z7.s, z0.s
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	lsl	x4, x4, 1
	sunpklo	z0.s, z0.h
	addvl	x3, x4, #4
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z7, [x3]
	sub	z1.s, z7.s, z1.s
	cntb	x3, all, mul #11
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	lsl	x3, x3, 4
	sunpklo	z1.s, z1.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
	sub	z5.s, z17.s, z15.s
	addvl	x3, x4, #-1
	rdvl	x4, #22
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 64
	lsl	x4, x4, 3
	uzp1	z5.h, z5.h, z5.h
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z6.s, z18.s, z15.s
	addvl	x3, x4, #-2
	mov	x4, 183
	sunpklo	z5.s, z5.h
	add	x3, x3, 64
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z7.s, z19.s, z15.s
	cntb	x3
	sunpklo	z6.s, z6.h
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	mul	x3, x3, x4
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z14.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	add	x3, x3, 1088
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z14.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 6
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
	sqrshrnb	z15.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #9
	uzp1	z15.h, z15.h, z15.h
	add	x3, x3, 1090
	lsl	x4, x4, 2
	sunpklo	z15.s, z15.h
	add	x3, sp, x3
	st1h	z15.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #3
	lsl	x4, x4, 6
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z16.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x3, x3, 1092
	add	x3, sp, x3
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z17.h, z19.s, #7
	addvl	x3, x4, #-1
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x3, 1094
	cntb	x4, all, mul #3
	add	x3, sp, x3
	st1h	z17.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 6
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z18.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #12
	uzp1	z18.h, z18.h, z18.h
	add	x3, x3, 1096
	lsl	x4, x4, 4
	sunpklo	z18.s, z18.h
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z19, [x3]
	sqrshrnb	z19.h, z19.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 1098
	lsl	x4, x4, 6
	sunpklo	z19.s, z19.h
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1100
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1102
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1104
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z22.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1106
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z23.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1108
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z24.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1110
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z25.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1112
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z26.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	add	x3, x3, 1114
	add	x3, sp, x3
	st1h	z27.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z27, [x3]
	sqrshrnb	z27.h, z27.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #6
	uzp1	z27.h, z27.h, z27.h
	add	x3, x3, 1116
	lsl	x4, x4, 5
	sunpklo	z27.s, z27.h
	add	x3, sp, x3
	st1h	z27.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x4, x4, 6
	add	x3, sp, x3
	ldr	z27, [x3]
	sqrshrnb	z27.h, z27.s, #7
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	uzp1	z27.h, z27.h, z27.h
	add	x3, x3, 1118
	lsl	x4, x4, 6
	sunpklo	z27.s, z27.h
	add	x3, sp, x3
	st1h	z27.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1120
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1122
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1124
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z10.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1126
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1128
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z28.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1130
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z29.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1132
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1134
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z13.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1136
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1138
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1140
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1142
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1144
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z4.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1146
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z5.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #3
	add	x3, x3, 1148
	lsl	x4, x4, 6
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	add	x3, x3, 1150
	add	x3, sp, x3
	st1h	z7.s, p6, [x3, z30.s, sxtw 1]
	add	x3, x0, 112
	ldr	z22, [x3]
	add	x3, x0, 240
	ldr	z30, [x3]
	zip1	z22.h, z22.h, z30.h
	add	x3, x0, 368
	ldr	z23, [x3]
	add	x3, x0, 496
	ldr	z30, [x3]
	zip1	z23.h, z23.h, z30.h
	add	x3, x0, 624
	ldr	z24, [x3]
	add	x3, x0, 752
	ldr	z30, [x3]
	zip1	z24.h, z24.h, z30.h
	add	x3, x0, 880
	ldr	z25, [x3]
	add	x3, x0, 1008
	ldr	z30, [x3]
	zip1	z25.h, z25.h, z30.h
	add	x3, x0, 1136
	ldr	z26, [x3]
	add	x3, x0, 1264
	ldr	z30, [x3]
	zip1	z26.h, z26.h, z30.h
	add	x3, x0, 1392
	ldr	z27, [x3]
	add	x3, x0, 1520
	ldr	z30, [x3]
	zip1	z27.h, z27.h, z30.h
	add	x3, x0, 1648
	ldr	z28, [x3]
	add	x3, x0, 1776
	ldr	z30, [x3]
	zip1	z28.h, z28.h, z30.h
	add	x3, x0, 1904
	ldr	z29, [x3]
	add	x3, x0, 2032
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, sp, 64
	ldr	z20, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z15.d, z30.d
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z5, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z6.d, z30.d
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z29.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	mov	z30.d, z31.d
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z5.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	mov	z30.d, z31.d
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	mov	z4.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z3.d, z30.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	mov	z2.d, z30.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z1.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z0.d, z30.d
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z30.d, z31.d
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #-1
	mov	z18.d, z30.d
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z17.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z16.d, z30.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z21.d, z30.d
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z21, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z20.d, z30.d
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z20, [x3]
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	mov	z19.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z19, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z7.d, z30.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z27.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z15.d, z31.d
	lsl	x4, x3, 6
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	add	x3, x0, 176
	ldr	z27, [x3]
	add	x3, x0, 432
	ldr	z30, [x3]
	zip1	z27.h, z27.h, z30.h
	add	x3, x0, 688
	ldr	z28, [x3]
	add	x3, x0, 944
	ldr	z30, [x3]
	zip1	z28.h, z28.h, z30.h
	add	x3, x0, 1200
	ldr	z29, [x3]
	add	x3, x0, 1456
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, x0, 1712
	ldr	z30, [x3]
	add	x3, x0, 1968
	ldr	z26, [x3]
	zip1	z30.h, z30.h, z26.h
	cntb	x3
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z14.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z27.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z13.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z27.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z12.d, z31.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z30.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z11.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #1
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z10.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z28.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z30.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z9.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z30.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z8.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x3, x0, 304
	ldr	z29, [x3]
	mov	z22.d, z31.d
	add	x3, x0, 816
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	add	x3, x0, 1328
	ldr	z30, [x3]
	add	x3, x0, 1840
	ldr	z28, [x3]
	zip1	z30.h, z30.h, z28.h
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z21.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x4, x6, #9
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z20.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z19.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	add	x3, x0, 560
	ldr	z29, [x3]
	add	x3, x0, 1584
	ldr	z30, [x3]
	zip1	z29.h, z29.h, z30.h
	rdvl	x3, #21
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z26.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	add	x3, x0, 48
	add	x0, x0, 1072
	ldr	z29, [x0]
	cntb	x0, all, mul #10
	ldr	z28, [x3]
	zip1	z28.h, z28.h, z29.h
	add	x0, x0, x0, lsl 4
	mov	z29.d, z31.d
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	add	z28.s, z29.s, z30.s
	add	z23.s, z28.s, z22.s
	lsl	x3, x3, 2
	add	z7.s, z23.s, z15.s
	add	z27.s, z31.s, z26.s
	incb	x3, all, mul #4
	add	z24.s, z27.s, z21.s
	sub	z27.s, z27.s, z21.s
	sub	z28.s, z28.s, z22.s
	sub	z23.s, z23.s, z15.s
	add	z22.s, z24.s, z14.s
	lsl	x3, x3, 1
	sub	z29.s, z29.s, z30.s
	sub	z30.s, z31.s, z26.s
	addvl	x0, x3, #4
	rdvl	x3, #22
	add	z25.s, z30.s, z20.s
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	z21.s, z25.s, z13.s
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z27.s, z9.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	add	z26.s, z29.s, z19.s
	add	x0, x0, 64
	lsl	x3, x3, 4
	sub	z30.s, z30.s, z20.s
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z28.s, z8.s
	addvl	x0, x3, #-1
	rdvl	x3, #20
	add	z20.s, z26.s, z12.s
	lsl	x3, x3, 2
	add	x0, x0, 64
	sub	z29.s, z29.s, z19.s
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z7, [x0]
	add	z19.s, z29.s, z11.s
	add	z31.s, z30.s, z10.s
	sub	z24.s, z24.s, z14.s
	lsl	x3, x3, 1
	sub	z25.s, z25.s, z13.s
	sub	z26.s, z26.s, z12.s
	addvl	x0, x3, #4
	sub	z29.s, z29.s, z11.s
	sub	z30.s, z30.s, z10.s
	add	x0, x0, 64
	add	z10.s, z30.s, z16.s
	sub	z30.s, z30.s, z16.s
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z27.s, z27.s, z9.s
	cntb	x0, all, mul #11
	add	z9.s, z27.s, z17.s
	sub	z27.s, z27.s, z17.s
	lsl	x0, x0, 4
	sub	z28.s, z28.s, z8.s
	add	z8.s, z28.s, z18.s
	add	x0, sp, x0
	sub	z28.s, z28.s, z18.s
	sqrshrnb	z8.h, z8.s, #7
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z7.s, z7.s, z15.s
	cntb	x0, all, mul #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	lsl	x3, x0, 4
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	sunpklo	z9.s, z9.h
	lsl	x4, x3, 4
	add	x0, x0, 64
	sqrshrnb	z10.h, z10.s, #7
	sub	x3, x4, x3
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z22.s, z6.s
	sub	z22.s, z22.s, z6.s
	uzp1	z10.h, z10.h, z10.h
	lsl	x3, x3, 2
	sunpklo	z10.s, z10.h
	sqrshrnb	z30.h, z30.s, #7
	addvl	x0, x3, #1
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x0, x0, 64
	sqrshrnb	z27.h, z27.s, #7
	uzp1	z27.h, z27.h, z27.h
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z21.s, z5.s
	rdvl	x0, #26
	sub	z21.s, z21.s, z5.s
	sunpklo	z27.s, z27.h
	lsl	x3, x0, 3
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	sub	x0, x3, x0
	mov	x3, 183
	sunpklo	z28.s, z28.h
	add	x0, x0, 64
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z20.s, z4.s
	cntb	x0
	sub	z20.s, z20.s, z4.s
	sqrshrnb	z20.h, z20.s, #7
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	sunpklo	z21.s, z21.h
	mul	x0, x0, x3
	rdvl	x3, #21
	sqrshrnb	z22.h, z22.s, #7
	lsl	x3, x3, 1
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z19.s, z3.s
	rdvl	x0, #23
	lsl	x3, x3, 2
	sub	z19.s, z19.s, z3.s
	lsl	x0, x0, 3
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x0, sp, x0
	sunpklo	z19.s, z19.h
	add	x0, x0, 64
	str	z7, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #9
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	str	z31, [x0]
	add	z31.s, z31.s, z2.s
	addvl	x0, x3, #1
	rdvl	x3, #22
	lsl	x3, x3, 3
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z31.s, z7.s, z1.s
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z31.s, z7.s, z0.s
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z11.s, z29.s, z14.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sqrshrnb	z11.h, z11.s, #7
	lsl	x3, x3, 3
	add	x0, x0, 64
	uzp1	z11.h, z11.h, z11.h
	incb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z12.s, z26.s, z31.s
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #7
	lsl	x3, x3, 1
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	addvl	x0, x3, #1
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z13, [x0]
	add	z13.s, z25.s, z13.s
	addvl	x0, x3, #-4
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 64
	sunpklo	z13.s, z13.h
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z14.s, z24.s, z7.s
	cntb	x0, all, mul #3
	sub	z24.s, z24.s, z7.s
	sqrshrnb	z14.h, z14.s, #7
	lsl	x3, x0, 6
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	sqrshrnb	z24.h, z24.s, #7
	lsl	x3, x3, 3
	add	x0, x0, 64
	uzp1	z24.h, z24.h, z24.h
	incb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z15.s, z23.s, z31.s
	sub	z23.s, z23.s, z31.s
	sqrshrnb	z15.h, z15.s, #7
	lsl	x3, x3, 1
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	addvl	x0, x3, #1
	rdvl	x3, #22
	sqrshrnb	z23.h, z23.s, #7
	add	x0, x0, 64
	lsl	x3, x3, 3
	uzp1	z23.h, z23.h, z23.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z25.s, z25.s, z7.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sunpklo	z23.s, z23.h
	add	x0, x0, 64
	lsl	x3, x3, 4
	sunpklo	z24.s, z24.h
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z26.s, z26.s, z31.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	sqrshrnb	z25.h, z25.s, #7
	add	x0, x0, 64
	lsl	x3, x3, 4
	uzp1	z25.h, z25.h, z25.h
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z29.s, z29.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #22
	sunpklo	z25.s, z25.h
	add	x0, x0, 64
	lsl	x3, x3, 3
	sqrshrnb	z26.h, z26.s, #7
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z16.s, z7.s, z0.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	uzp1	z26.h, z26.h, z26.h
	lsl	x3, x3, 1
	add	x0, x0, 64
	sunpklo	z26.s, z26.h
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z17.s, z7.s, z1.s
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	lsl	x3, x3, 2
	sunpklo	z29.s, z29.h
	sqrshrnb	z16.h, z16.s, #7
	addvl	x0, x3, #1
	rdvl	x3, #20
	uzp1	z16.h, z16.h, z16.h
	lsl	x3, x3, 2
	add	x0, x0, 64
	sunpklo	z16.s, z16.h
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z18.s, z31.s, z2.s
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	lsl	x3, x3, 1
	sunpklo	z17.s, z17.h
	sqrshrnb	z18.h, z18.s, #7
	addvl	x0, x3, #4
	rdvl	x3, #20
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 64
	lsl	x3, x3, 2
	sunpklo	z18.s, z18.h
	add	x0, sp, x0
	ldr	z7, [x0]
	incb	x3, all, mul #4
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	lsl	x3, x3, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z6.s, z7.s, z31.s
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z6, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z0.h, z7.s, #7
	mov	w0, 32
	index	z31.s, #0, w0
	uzp1	z0.h, z0.h, z0.h
	addvl	x0, x3, #-1
	addvl	x3, x4, #-3
	sunpklo	z0.s, z0.h
	add	x0, x0, 1600
	add	x0, sp, x0
	lsl	x3, x3, 2
	st1h	z0.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z1.h, z7.s, #7
	addvl	x0, x3, #-1
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x0, x0, 1602
	add	x0, sp, x0
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z2.h, z7.s, #7
	addvl	x0, x3, #-1
	uzp1	z2.h, z2.h, z2.h
	mov	x3, 183
	add	x0, x0, 1604
	sunpklo	z2.s, z2.h
	add	x0, sp, x0
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0
	mul	x0, x0, x3
	cntb	x3, all, mul #3
	lsl	x3, x3, 6
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z3.h, z7.s, #7
	addvl	x0, x3, #-1
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	add	x0, x0, 1606
	cntb	x3, all, mul #3
	add	x0, sp, x0
	st1h	z3.s, p6, [x0, z31.s, sxtw 1]
	lsl	x3, x3, 6
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
	sqrshrnb	z4.h, z7.s, #7
	addvl	x0, x3, #-1
	cntb	x3, all, mul #9
	uzp1	z4.h, z4.h, z4.h
	add	x0, x0, 1608
	lsl	x3, x3, 2
	sunpklo	z4.s, z4.h
	add	x0, sp, x0
	st1h	z4.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	cntb	x3, all, mul #3
	lsl	x3, x3, 6
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z5.h, z7.s, #7
	addvl	x0, x3, #-1
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, x0, 1610
	add	x0, sp, x0
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z6.h, z7.s, #7
	addvl	x0, x3, #-1
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x0, x0, 1612
	cntb	x3, all, mul #3
	add	x0, sp, x0
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	lsl	x3, x3, 6
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z7.h, z7.s, #7
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	uzp1	z7.h, z7.h, z7.h
	add	x0, x0, 1614
	lsl	x3, x3, 6
	sunpklo	z7.s, z7.h
	add	x0, sp, x0
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1616
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1618
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1620
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z10.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1622
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1624
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z12.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1626
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z13.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1628
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z14.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1630
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1632
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z23.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1634
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z24.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1636
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z25.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1638
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z26.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1640
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1642
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z30.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1644
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z27.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1646
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z28.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1648
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1650
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z17.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1652
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z18.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1654
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z19.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1656
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z20.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1658
	lsl	x3, x3, 6
	add	x0, sp, x0
	st1h	z21.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 1660
	incb	x3, all, mul #4
	add	x0, sp, x0
	st1h	z22.s, p6, [x0, z31.s, sxtw 1]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z7, [x0]
	sqrshrnb	z30.h, z7.s, #7
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 1662
	lsl	x3, x3, 6
	sunpklo	z30.s, z30.h
	add	x0, sp, x0
	st1h	z30.s, p6, [x0, z31.s, sxtw 1]
	movi	d30, #0
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 128
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z22, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 256
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z22.h, z22.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 384
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z23, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 512
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z23.h, z23.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 640
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z24, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 768
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z24.h, z24.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 896
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z25, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1024
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z25.h, z25.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1152
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z26, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1280
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z26.h, z26.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1408
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1536
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z27.h, z27.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1664
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1792
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z28.h, z28.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1920
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 2048
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z29.h, z29.h, z31.h
	add	x0, sp, 64
	ldr	z20, [x0]
	mov	z31.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	mov	z31.d, z30.d
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z5, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z29.h, z4.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	mov	z31.d, z30.d
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z5.d, z31.d
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	mov	z31.d, z30.d
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z4.d, z31.d
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z31.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z3.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z31.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-1
	mov	z2.d, z31.d
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z31.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z1.d, z31.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z31.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z0.d, z31.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z31.d, z30.d
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-1
	mov	z18.d, z31.d
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z31.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z18, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z18.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z31.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z18, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #9
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z17.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z31.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z17, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z7.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	mov	z31.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z14.d, z31.d
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z31.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z19.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z31.d, z30.d
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z19, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z21.d, z31.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z31.d, z30.d
	lsl	x4, x3, 4
	sub	x3, x4, x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z21, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 192
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z19, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 448
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z19.h, z19.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 704
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z20, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 960
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z20.h, z20.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1216
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1472
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z29.h, z29.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1728
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1984
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z31.h, z31.h, z28.h
	cntb	x0
	mov	z28.d, z30.d
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z31.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z27.d, z30.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z31.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z26.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z31.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z25.d, z30.d
	lsl	x3, x3, 4
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z31.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z24.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #1
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z31.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z23.d, z30.d
	lsl	x3, x3, 3
	incb	x3, all, mul #4
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z31.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z22.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	mov	z21.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 320
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 832
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z29.h, z29.h, z31.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1344
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1856
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z31.h, z31.h, z20.h
	cntb	x0, all, mul #5
	mov	z20.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z31.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z19.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #9
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z31.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	mov	z18.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z31.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	mov	z17.d, z30.d
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z15.d, z30.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 576
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1600
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z31.h, z31.h, z29.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	mov	z16.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z29.d, z30.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1088
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z14.h, z14.h, z31.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z31.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z31.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	add	z13.s, z29.s, z15.s
	add	z8.s, z13.s, z20.s
	lsl	x3, x3, 1
	sub	z13.s, z13.s, z20.s
	add	z20.s, z8.s, z28.s
	incb	x3
	sub	z8.s, z8.s, z28.s
	add	z12.s, z31.s, z16.s
	add	z9.s, z12.s, z19.s
	sub	z12.s, z12.s, z19.s
	add	z19.s, z9.s, z27.s
	lsl	x3, x3, 2
	sub	z31.s, z31.s, z16.s
	add	z10.s, z31.s, z18.s
	addvl	x0, x3, #1
	sub	z31.s, z31.s, z18.s
	add	z18.s, z10.s, z26.s
	add	x0, x0, 64
	sub	z29.s, z29.s, z15.s
	add	z11.s, z29.s, z17.s
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z7.s, z20.s, z7.s
	rdvl	x0, #26
	sub	z29.s, z29.s, z17.s
	add	z17.s, z11.s, z25.s
	lsl	x3, x0, 3
	add	z16.s, z29.s, z24.s
	add	z15.s, z31.s, z23.s
	sub	x0, x3, x0
	rdvl	x3, #22
	add	z14.s, z12.s, z22.s
	add	x0, x0, 64
	lsl	x3, x3, 3
	sub	z9.s, z9.s, z27.s
	add	x0, sp, x0
	str	z7, [x0]
	add	z27.s, z14.s, z1.s
	addvl	x0, x3, #-2
	mov	x3, 183
	add	z6.s, z13.s, z21.s
	add	x0, x0, 64
	sub	z13.s, z13.s, z21.s
	sub	z12.s, z12.s, z22.s
	add	x0, sp, x0
	ldr	z28, [x0]
	add	z7.s, z19.s, z28.s
	cntb	x0
	sub	z31.s, z31.s, z23.s
	sub	z29.s, z29.s, z24.s
	sub	z11.s, z11.s, z25.s
	sub	z10.s, z10.s, z26.s
	add	z21.s, z6.s, z0.s
	mul	x0, x0, x3
	cntb	x3, all, mul #9
	sub	z1.s, z14.s, z1.s
	lsl	x3, x3, 2
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	add	x0, x0, 64
	sunpklo	z21.s, z21.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z18.s, z5.s
	rdvl	x0, #23
	sub	z5.s, z18.s, z5.s
	uzp1	z1.h, z1.h, z1.h
	lsl	x0, x0, 3
	sunpklo	z1.s, z1.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, sp, x0
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, x0, 64
	str	z7, [x0]
	add	z7.s, z17.s, z4.s
	addvl	x0, x3, #1
	sub	z4.s, z17.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z16.s, z3.s
	cntb	x0, all, mul #6
	sub	z3.s, z16.s, z3.s
	sqrshrnb	z3.h, z3.s, #12
	lsl	x3, x0, 5
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	sub	x0, x3, x0
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z15.s, z2.s
	cntb	x0, all, mul #11
	sub	z2.s, z15.s, z2.s
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, x0, lsl 4
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	addvl	x0, x3, #-4
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z27, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z6, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z28, [x0]
	add	z22.s, z13.s, z28.s
	cntb	x0, all, mul #11
	sqrshrnb	z22.h, z22.s, #12
	uzp1	z22.h, z22.h, z22.h
	lsl	x0, x0, 4
	sunpklo	z22.s, z22.h
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
	add	z23.s, z12.s, z27.s
	addvl	x0, x3, #1
	rdvl	x3, #22
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	lsl	x3, x3, 3
	uzp1	z23.h, z23.h, z23.h
	add	x0, sp, x0
	ldr	z28, [x0]
	add	z24.s, z31.s, z28.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sunpklo	z23.s, z23.h
	lsl	x3, x3, 3
	add	x0, x0, 64
	sqrshrnb	z24.h, z24.s, #12
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z25.s, z29.s, z7.s
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	lsl	x3, x3, 1
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	addvl	x0, x3, #1
	sunpklo	z25.s, z25.h
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z26.s, z11.s, z27.s
	cntb	x0, all, mul #12
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	lsl	x3, x0, 4
	sunpklo	z26.s, z26.h
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	add	x0, x0, 64
	sub	x3, x4, x3
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z27.s, z10.s, z7.s
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	lsl	x3, x3, 2
	sunpklo	z27.s, z27.h
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
	add	z28.s, z9.s, z28.s
	cntb	x0, all, mul #3
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	lsl	x3, x0, 6
	sunpklo	z28.s, z28.h
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z6.s, z8.s, z7.s
	cntb	x0, all, mul #3
	sub	z8.s, z8.s, z7.s
	sqrshrnb	z8.h, z8.s, #12
	lsl	x3, x0, 6
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	sub	x0, x3, x0
	addvl	x3, x4, #-3
	add	x0, x0, 64
	add	x0, sp, x0
	lsl	x3, x3, 2
	str	z6, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z9.s, z9.s, z7.s
	cntb	x0, all, mul #12
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	lsl	x3, x0, 4
	sunpklo	z9.s, z9.h
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z10.s, z10.s, z7.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	lsl	x3, x3, 1
	sunpklo	z10.s, z10.h
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z11.s, z11.s, z7.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sqrshrnb	z11.h, z11.s, #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	uzp1	z11.h, z11.h, z11.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z29.s, z29.s, z7.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	sunpklo	z11.s, z11.h
	add	x0, x0, 64
	lsl	x3, x3, 4
	sqrshrnb	z29.h, z29.s, #12
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z6.s, z31.s, z7.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	lsl	x3, x3, 4
	sunpklo	z29.s, z29.h
	add	x0, sp, x0
	str	z6, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z12.s, z12.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #20
	sqrshrnb	z12.h, z12.s, #12
	lsl	x3, x3, 2
	add	x0, x0, 64
	uzp1	z12.h, z12.h, z12.h
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z13.s, z31.s
	sunpklo	z12.s, z12.h
	sqrshrnb	z13.h, z13.s, #12
	lsl	x3, x3, 1
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	addvl	x0, x3, #4
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z0.s, z7.s, z0.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	sqrshrnb	z0.h, z0.s, #12
	lsl	x3, x3, 1
	add	x0, x0, 64
	uzp1	z0.h, z0.h, z0.h
	incb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z6.s, z19.s, z31.s
	sunpklo	z0.s, z0.h
	sqrshrnb	z6.h, z6.s, #12
	lsl	x3, x3, 2
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z7.s, z20.s, z31.s
	rdvl	x0, #26
	index	z31.s, #0, w2
	sqrshrnb	z7.h, z7.s, #12
	lsl	x3, x0, 3
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	sub	x0, x3, x0
	mov	x3, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z14.h, z19.s, #12
	cntb	x0
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x1, z31.s, sxtw 1]
	mul	x0, x0, x3
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z15.h, z19.s, #12
	add	x0, x1, 2
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
	sqrshrnb	z16.h, z19.s, #12
	add	x0, x1, 4
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z17.h, z19.s, #12
	add	x0, x1, 6
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z18.h, z19.s, #12
	add	x0, x1, 8
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	st1h	z18.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z19.h, z19.s, #12
	add	x0, x1, 10
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z20.h, z19.s, #12
	add	x0, x1, 12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 14
	st1h	z21.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 16
	st1h	z22.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 18
	st1h	z23.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 20
	st1h	z24.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 22
	st1h	z25.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 24
	st1h	z26.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 26
	st1h	z27.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 28
	st1h	z28.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z28, [x0]
	sqrshrnb	z28.h, z28.s, #12
	add	x0, x1, 30
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	st1h	z28.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 32
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 34
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 36
	st1h	z10.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 38
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 40
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	sqrshrnb	z29.h, z29.s, #12
	add	x0, x1, 42
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 44
	st1h	z12.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 46
	st1h	z13.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 48
	st1h	z0.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 50
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 52
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 54
	st1h	z3.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 56
	st1h	z4.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 58
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 60
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 62
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 144
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z21, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 272
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z21.h, z21.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 400
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z22, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 528
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z22.h, z22.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 656
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z23, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 784
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z23.h, z23.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 912
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z24, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1040
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z24.h, z24.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1168
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z25, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1296
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z25.h, z25.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1424
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z26, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1552
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z26.h, z26.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1680
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1808
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z27.h, z27.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1936
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 2064
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	add	x0, sp, 64
	ldr	z20, [x0]
	mov	z29.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	mov	z29.d, z30.d
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z5, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z4.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	mov	z29.d, z30.d
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z15.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z29.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z15, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z4.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z29.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z3.d, z29.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z29.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-1
	mov	z2.d, z29.d
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z29.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z1.d, z29.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z29.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z0.d, z29.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z29.d, z30.d
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-1
	mov	z17.d, z29.d
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z29.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z17, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z7.d, z29.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	mov	z29.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #9
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z20.d, z29.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z29.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z20, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z8.d, z29.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z29.d, z30.d
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z8, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z14.d, z29.d
	lsl	x4, x3, 4
	add	x3, x3, x4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, x4, #-3
	mov	z29.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z19.d, z29.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z29.d, z30.d
	lsl	x3, x0, 6
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z19, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z20.d, z29.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #26
	mov	z29.d, z30.d
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z20, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z6.d, z29.d
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x3, x3, 6
	add	x0, sp, x0
	str	z6, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 208
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z18, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 464
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z18.h, z18.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 720
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z19, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 976
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z19.h, z19.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1232
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1488
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1744
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 2000
	add	x0, sp, x0
	ldr	z27, [x0]
	zip1	z29.h, z29.h, z27.h
	cntb	x0
	mov	z27.d, z30.d
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z26.d, z30.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z25.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z24.d, z30.d
	lsl	x3, x3, 4
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z23.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z28.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #1
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z22.d, z30.d
	lsl	x3, x3, 3
	incb	x3, all, mul #4
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z21.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z18.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	mov	z20.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 336
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 848
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 1360
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1872
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z29.h, z29.h, z19.h
	cntb	x0, all, mul #5
	mov	z19.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z18.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z28.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, x6, #9
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	mov	z17.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	mov	z16.d, z30.d
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z14.d, z30.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 592
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1616
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z29.h, z29.h, z28.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	mov	z15.d, z30.d
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z28.d, z30.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	cntb	x3, all, mul #3
	add	x0, x0, 80
	lsl	x3, x3, 6
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-1
	add	x0, x0, 1104
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z13.h, z13.h, z29.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z29.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	z13.s, z28.s, z14.s
	add	z8.s, z13.s, z19.s
	lsl	x3, x3, 3
	sub	z13.s, z13.s, z19.s
	add	z5.s, z13.s, z20.s
	addvl	x0, x3, #-2
	sub	z13.s, z13.s, z20.s
	mov	x3, 183
	add	x0, x0, 64
	add	z19.s, z8.s, z27.s
	add	z12.s, z29.s, z15.s
	add	x0, sp, x0
	ldr	z20, [x0]
	add	z7.s, z19.s, z20.s
	cntb	x0
	add	z9.s, z12.s, z18.s
	sub	z12.s, z12.s, z18.s
	add	z18.s, z9.s, z26.s
	sub	z29.s, z29.s, z15.s
	sub	z8.s, z8.s, z27.s
	mul	x0, x0, x3
	cntb	x3, all, mul #11
	add	z10.s, z29.s, z17.s
	lsl	x3, x3, 4
	sub	z29.s, z29.s, z17.s
	add	z17.s, z10.s, z25.s
	add	x0, x0, 64
	sub	z28.s, z28.s, z14.s
	add	z11.s, z28.s, z16.s
	add	x0, sp, x0
	str	z7, [x0]
	sub	z28.s, z28.s, z16.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #9
	add	z16.s, z11.s, z24.s
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	z15.s, z28.s, z23.s
	add	x0, sp, x0
	ldr	z20, [x0]
	add	z7.s, z18.s, z20.s
	rdvl	x0, #23
	add	z14.s, z29.s, z22.s
	add	z6.s, z12.s, z21.s
	lsl	x0, x0, 3
	sub	z29.s, z29.s, z22.s
	sub	z12.s, z12.s, z21.s
	add	x0, sp, x0
	sub	z28.s, z28.s, z23.s
	sub	z11.s, z11.s, z24.s
	add	x0, x0, 64
	str	z7, [x0]
	sub	z10.s, z10.s, z25.s
	cntb	x0, all, mul #11
	add	z20.s, z6.s, z1.s
	sub	z9.s, z9.s, z26.s
	lsl	x0, x0, 4
	add	z21.s, z5.s, z0.s
	cntb	x6, all, mul #9
	add	x0, sp, x0
	lsl	x6, x6, 2
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	ldr	z7, [x0]
	add	z27.s, z17.s, z7.s
	addvl	x0, x3, #1
	add	z7.s, z16.s, z4.s
	sub	z4.s, z16.s, z4.s
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	sqrshrnb	z21.h, z21.s, #12
	add	x0, x0, x0, lsl 2
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x0, x0, 64
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	add	x0, sp, x0
	str	z27, [x0]
	add	z27.s, z15.s, z3.s
	cntb	x0, all, mul #6
	sub	z3.s, z15.s, z3.s
	sqrshrnb	z3.h, z3.s, #12
	lsl	x3, x0, 5
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	sub	x0, x3, x0
	cntb	x3, all, mul #12
	sunpklo	z4.s, z4.h
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z14.s, z2.s
	cntb	x0, all, mul #11
	sub	z2.s, z14.s, z2.s
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, x0, lsl 4
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x0, x0, 64
	add	x0, sp, x0
	str	z27, [x0]
	addvl	x0, x3, #-4
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z7, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z6, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z5, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z22.s, z13.s, z27.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sqrshrnb	z22.h, z22.s, #12
	lsl	x3, x3, 3
	add	x0, x0, 64
	uzp1	z22.h, z22.h, z22.h
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z23.s, z12.s, z7.s
	sunpklo	z22.s, z22.h
	sqrshrnb	z23.h, z23.s, #12
	lsl	x3, x3, 1
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z24.s, z29.s, z27.s
	cntb	x0, all, mul #12
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	lsl	x3, x0, 4
	sunpklo	z24.s, z24.h
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	add	x0, x0, 64
	sub	x3, x4, x3
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z25.s, z28.s, z7.s
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	lsl	x3, x3, 2
	sunpklo	z25.s, z25.h
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z26.s, z11.s, z27.s
	cntb	x0, all, mul #3
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	lsl	x3, x0, 6
	sunpklo	z26.s, z26.h
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z27.s, z10.s, z7.s
	rdvl	x0, #26
	sub	z10.s, z10.s, z7.s
	sqrshrnb	z27.h, z27.s, #12
	lsl	x3, x0, 3
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	sub	x0, x3, x0
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	add	x0, x0, 64
	sunpklo	z10.s, z10.h
	add	x0, sp, x0
	ldr	z6, [x0]
	add	z6.s, z9.s, z6.s
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z6, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z6, [x0]
	add	z5.s, z8.s, z6.s
	addvl	x0, x3, #-2
	sub	z8.s, z8.s, z6.s
	sqrshrnb	z8.h, z8.s, #12
	add	x0, x0, 64
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x0, sp, x0
	str	z5, [x0]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	addvl	x3, x4, #-3
	add	x0, x0, 64
	add	x4, x1, x2, lsl 4
	add	x0, sp, x0
	lsl	x3, x3, 2
	ldr	z6, [x0]
	addvl	x0, x3, #1
	sub	z9.s, z9.s, z6.s
	sqrshrnb	z9.h, z9.s, #12
	add	x0, x0, 64
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z11.s, z11.s, z7.s
	cntb	x0, all, mul #12
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	lsl	x3, x0, 4
	sunpklo	z11.s, z11.h
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z28.s, z28.s, z7.s
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	lsl	x3, x3, 1
	sunpklo	z28.s, z28.h
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z29.s, z29.s, z7.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	sqrshrnb	z29.h, z29.s, #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	uzp1	z29.h, z29.h, z29.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z12.s, z12.s, z7.s
	addvl	x0, x3, #1
	rdvl	x3, #21
	sunpklo	z29.s, z29.h
	lsl	x3, x3, 1
	add	x0, x0, 64
	sqrshrnb	z12.h, z12.s, #12
	incb	x3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z13.s, z13.s, z7.s
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	lsl	x3, x3, 2
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	addvl	x0, x3, #1
	rdvl	x3, #20
	sunpklo	z13.s, z13.h
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z0.s, z7.s, z0.s
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	lsl	x3, x3, 1
	sunpklo	z0.s, z0.h
	addvl	x0, x3, #4
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z1.s, z7.s, z1.s
	cntb	x0, all, mul #11
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	lsl	x0, x0, 4
	sunpklo	z1.s, z1.h
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	sub	z5.s, z17.s, z15.s
	addvl	x0, x3, #-1
	rdvl	x3, #22
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	lsl	x3, x3, 3
	uzp1	z5.h, z5.h, z5.h
	add	x0, sp, x0
	ldr	z15, [x0]
	sub	z6.s, z18.s, z15.s
	addvl	x0, x3, #-2
	mov	x3, 183
	sunpklo	z5.s, z5.h
	add	x0, x0, 64
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	add	x0, sp, x0
	ldr	z15, [x0]
	sub	z7.s, z19.s, z15.s
	cntb	x0
	sunpklo	z6.s, z6.h
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	mul	x0, x0, x3
	lsl	x3, x2, 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
	sqrshrnb	z14.h, z19.s, #12
	rdvl	x0, #23
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	lsl	x0, x0, 3
	st1h	z14.s, p6, [x4, z31.s, sxtw 1]
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
	sqrshrnb	z15.h, z19.s, #12
	add	x0, x3, 2
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x5, x1, x0
	st1h	z15.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #1
	add	x5, x5, x5, lsl 2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z19, [x5]
	sqrshrnb	z16.h, z19.s, #12
	add	x5, x0, 2
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x5, x1, x5
	st1h	z16.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #6
	lsl	x6, x5, 5
	sub	x5, x6, x5
	cntb	x6, all, mul #12
	add	x5, x5, 64
	lsl	x6, x6, 4
	add	x5, sp, x5
	ldr	z19, [x5]
	sqrshrnb	z17.h, z19.s, #12
	add	x5, x0, 4
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x5, x1, x5
	st1h	z17.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #11
	add	x5, x5, x5, lsl 4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z19, [x5]
	sqrshrnb	z18.h, z19.s, #12
	add	x5, x0, 6
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x5, x1, x5
	st1h	z18.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #-4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z19, [x5]
	sqrshrnb	z19.h, z19.s, #12
	add	x5, x0, 8
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x5, x1, x5
	st1h	z19.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 10
	add	x5, x1, x5
	st1h	z20.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 12
	add	x5, x1, x5
	st1h	z21.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x3, 16
	add	x5, x1, x5
	st1h	z22.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 16
	add	x5, x1, x5
	st1h	z23.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 18
	add	x5, x1, x5
	st1h	z24.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 20
	add	x5, x1, x5
	st1h	z25.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 22
	add	x5, x1, x5
	st1h	z26.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 24
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #3
	lsl	x6, x5, 6
	sub	x5, x6, x5
	cntb	x6, all, mul #6
	add	x5, x5, 64
	lsl	x6, x6, 5
	add	x5, sp, x5
	ldr	z27, [x5]
	sqrshrnb	z27.h, z27.s, #12
	add	x5, x0, 26
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #-2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z27, [x5]
	sqrshrnb	z27.h, z27.s, #12
	add	x5, x0, 28
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x3, 32
	add	x5, x1, x5
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 32
	add	x5, x1, x5
	st1h	z9.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 34
	add	x5, x1, x5
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 36
	add	x5, x1, x5
	st1h	z11.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 38
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 40
	add	x5, x1, x5
	st1h	z29.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 42
	add	x5, x1, x5
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 44
	add	x5, x1, x5
	st1h	z13.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x3, 48
	add	x5, x1, x5
	st1h	z0.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 48
	add	x5, x1, x5
	st1h	z1.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 50
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 52
	add	x5, x1, x5
	st1h	z3.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 54
	add	x5, x1, x5
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 56
	add	x5, x1, x5
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 58
	add	x0, x0, 60
	add	x5, x1, x5
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	add	x0, x1, x0
	cntb	x5, all, mul #3
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 160
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z21, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 288
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z21.h, z21.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 416
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z22, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 544
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z22.h, z22.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 672
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z23, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 800
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z23.h, z23.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 928
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z24, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1056
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z24.h, z24.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1184
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z25, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1312
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z25.h, z25.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1440
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z26, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1568
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z26.h, z26.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1696
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1824
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z27.h, z27.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1952
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 2080
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	add	x0, sp, 64
	ldr	z20, [x0]
	mov	z29.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	mov	z29.d, z30.d
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z5, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z4.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	mov	z29.d, z30.d
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	mov	z29.d, z30.d
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z4.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z29.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z3.d, z29.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z29.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z2.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z29.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z1.d, z29.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z29.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z0.d, z29.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z29.d, z30.d
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 5
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	mov	z19.d, z29.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z29.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z19, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z18.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z29.d, z30.d
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z18, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z17.d, z29.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	mov	z29.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z17, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x5, x0, 3
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z7.d, z29.d
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z29.d, z30.d
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z19.d, z29.d
	add	x5, x5, x5, lsl 4
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z29.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z19, [x0]
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	mov	z18.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #12
	mov	z29.d, z30.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z18, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z17.d, z29.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z29.d, z30.d
	lsl	x6, x5, 4
	sub	x5, x6, x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z17, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z25.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z26.d, z29.d
	lsl	x5, x5, 7
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 5
	addvl	x0, x5, #-2
	cntb	x5, all, mul #3
	add	x0, x0, 64
	lsl	x5, x5, 6
	add	x0, sp, x0
	str	z26, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 224
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z18, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 480
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z18.h, z18.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 736
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z19, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 992
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z19.h, z19.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1248
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1504
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1760
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 2016
	add	x0, sp, x0
	ldr	z27, [x0]
	zip1	z29.h, z29.h, z27.h
	cntb	x0
	mov	z27.d, z30.d
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 7
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z25.d, z30.d
	lsl	x5, x5, 5
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z28.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z24.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	lsl	x5, x5, 4
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d26, #0
	mov	z23.d, z26.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z22.d, z26.d
	lsl	x5, x5, 3
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z21.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z20.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z28.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 352
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 864
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1376
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1888
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z29.h, z29.h, z19.h
	cntb	x0, all, mul #5
	mov	z19.d, z26.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z18.d, z26.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z28.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x5, x5, x5, lsl 3
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z17.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	mov	z16.d, z26.d
	lsl	x5, x5, 3
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z28.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z14.d, z26.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 608
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1632
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z29.h, z29.h, z28.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	mov	z15.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z28.d, z26.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 96
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1120
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z13.h, z13.h, z29.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z29.d, z26.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	add	z12.s, z29.s, z15.s
	add	z9.s, z12.s, z18.s
	lsl	x5, x5, 2
	sub	z12.s, z12.s, z18.s
	add	z7.s, z12.s, z21.s
	incb	x5, all, mul #4
	add	z13.s, z28.s, z14.s
	add	z8.s, z13.s, z19.s
	sub	z13.s, z13.s, z19.s
	add	z19.s, z8.s, z27.s
	sub	z8.s, z8.s, z27.s
	lsl	x5, x5, 1
	sub	z28.s, z28.s, z14.s
	add	z11.s, z28.s, z16.s
	addvl	x0, x5, #4
	rdvl	x5, #22
	sub	z28.s, z28.s, z16.s
	add	x0, x0, 64
	lsl	x5, x5, 3
	add	z16.s, z11.s, z30.s
	add	x0, sp, x0
	str	z7, [x0]
	sub	z11.s, z11.s, z30.s
	addvl	x0, x5, #-2
	add	z18.s, z9.s, z25.s
	sub	z29.s, z29.s, z15.s
	add	x0, x0, 64
	add	z10.s, z29.s, z17.s
	sub	z29.s, z29.s, z17.s
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z30.s, z19.s, z27.s
	rdvl	x0, #26
	add	z17.s, z10.s, z24.s
	add	z15.s, z28.s, z23.s
	lsl	x5, x0, 3
	add	z14.s, z29.s, z22.s
	add	z6.s, z13.s, z20.s
	sub	x0, x5, x0
	cntb	x5, all, mul #11
	sub	z13.s, z13.s, z20.s
	add	x0, x0, 64
	lsl	x5, x5, 4
	sub	z29.s, z29.s, z22.s
	add	x0, sp, x0
	str	z30, [x0]
	sub	z10.s, z10.s, z24.s
	addvl	x0, x5, #-1
	mov	x5, 183
	sub	z12.s, z12.s, z21.s
	add	x0, x0, 64
	sub	z28.s, z28.s, z23.s
	sub	z9.s, z9.s, z25.s
	add	x0, sp, x0
	ldr	z30, [x0]
	add	z7.s, z18.s, z30.s
	cntb	x0
	add	z21.s, z6.s, z0.s
	add	x4, x4, x3
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	mul	x0, x0, x5
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z17.s, z5.s
	rdvl	x0, #23
	sub	z5.s, z17.s, z5.s
	sqrshrnb	z5.h, z5.s, #12
	lsl	x0, x0, 3
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, sp, x0
	add	x0, x0, 64
	str	z7, [x0]
	add	z7.s, z16.s, z4.s
	addvl	x0, x5, #1
	sub	z4.s, z16.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z7, [x0]
	add	z7.s, z15.s, z3.s
	cntb	x0, all, mul #6
	sub	z3.s, z15.s, z3.s
	sqrshrnb	z3.h, z3.s, #12
	lsl	x5, x0, 5
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	sub	x0, x5, x0
	rdvl	x5, #20
	add	x0, x0, 64
	lsl	x5, x5, 2
	add	x0, sp, x0
	str	z7, [x0]
	incb	x5, all, mul #4
	cntb	x0, all, mul #11
	add	z7.s, z14.s, z2.s
	sub	z2.s, z14.s, z2.s
	add	x0, x0, x0, lsl 4
	lsl	x5, x5, 1
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x0, sp, x0
	str	z7, [x0]
	addvl	x0, x5, #4
	rdvl	x5, #21
	lsl	x5, x5, 1
	add	x0, x0, 64
	incb	x5
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z20.s, z7.s, z1.s
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	lsl	x5, x5, 2
	sunpklo	z20.s, z20.h
	addvl	x0, x5, #1
	cntb	x5, all, mul #11
	add	x0, x0, 64
	lsl	x5, x5, 4
	add	x0, sp, x0
	str	z6, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z30, [x0]
	add	z22.s, z13.s, z30.s
	addvl	x0, x5, #1
	rdvl	x5, #22
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	lsl	x5, x5, 3
	uzp1	z22.h, z22.h, z22.h
	add	x0, sp, x0
	ldr	z30, [x0]
	add	z23.s, z12.s, z30.s
	addvl	x0, x5, #2
	cntb	x5, all, mul #11
	sunpklo	z22.s, z22.h
	lsl	x5, x5, 3
	add	x0, x0, 64
	sqrshrnb	z23.h, z23.s, #12
	incb	x5
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z24.s, z29.s, z27.s
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	lsl	x5, x5, 1
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	addvl	x0, x5, #1
	sunpklo	z24.s, z24.h
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z25.s, z28.s, z7.s
	cntb	x0, all, mul #12
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	lsl	x5, x0, 4
	sunpklo	z25.s, z25.h
	sub	x0, x5, x0
	cntb	x5, all, mul #12
	add	x0, x0, 64
	lsl	x5, x5, 4
	add	x0, sp, x0
	ldr	z27, [x0]
	add	z27.s, z11.s, z27.s
	addvl	x0, x5, #-4
	cntb	x5, all, mul #12
	sqrshrnb	z27.h, z27.s, #12
	add	x0, x0, 64
	lsl	x5, x5, 4
	uzp1	z27.h, z27.h, z27.h
	add	x0, sp, x0
	ldr	z30, [x0]
	add	z7.s, z10.s, z30.s
	addvl	x0, x5, #-4
	cntb	x5, all, mul #3
	sub	z10.s, z10.s, z30.s
	lsl	x6, x5, 4
	add	x0, x0, 64
	sunpklo	z27.s, z27.h
	sub	x5, x6, x5
	add	x0, sp, x0
	str	z7, [x0]
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z7.s, z9.s, z7.s
	cntb	x0, all, mul #3
	lsl	x5, x0, 6
	sub	x0, x5, x0
	cntb	x5, all, mul #6
	add	x0, x0, 64
	lsl	x5, x5, 5
	add	x0, sp, x0
	str	z7, [x0]
	addvl	x0, x5, #-2
	cntb	x5, all, mul #6
	add	x0, x0, 64
	lsl	x5, x5, 5
	add	x0, sp, x0
	ldr	z7, [x0]
	add	z6.s, z8.s, z7.s
	addvl	x0, x5, #-2
	addvl	x5, x6, #-3
	sub	z8.s, z8.s, z7.s
	add	x0, x0, 64
	cntb	x6, all, mul #9
	sqrshrnb	z8.h, z8.s, #12
	add	x0, sp, x0
	lsl	x5, x5, 2
	str	z6, [x0]
	addvl	x0, x5, #1
	lsl	x6, x6, 2
	uzp1	z8.h, z8.h, z8.h
	add	x0, x0, 64
	sunpklo	z8.s, z8.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z9.s, z9.s, z7.s
	cntb	x0, all, mul #12
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	lsl	x5, x0, 4
	sunpklo	z9.s, z9.h
	sub	x0, x5, x0
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	add	x0, x0, 64
	incb	x5
	add	x0, sp, x0
	ldr	z30, [x0]
	sub	z11.s, z11.s, z30.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	lsl	x5, x5, 1
	sunpklo	z11.s, z11.h
	addvl	x0, x5, #1
	rdvl	x5, #22
	add	x0, x0, 64
	lsl	x5, x5, 3
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z28.s, z28.s, z7.s
	addvl	x0, x5, #2
	cntb	x5, all, mul #11
	sqrshrnb	z28.h, z28.s, #12
	add	x0, x0, 64
	lsl	x5, x5, 4
	uzp1	z28.h, z28.h, z28.h
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z29.s, z29.s, z7.s
	addvl	x0, x5, #1
	rdvl	x5, #21
	sunpklo	z28.s, z28.h
	add	x0, x0, 64
	lsl	x5, x5, 1
	sqrshrnb	z29.h, z29.s, #12
	add	x0, sp, x0
	ldr	z30, [x0]
	incb	x5
	cntb	x0, all, mul #11
	sub	z12.s, z12.s, z30.s
	uzp1	z29.h, z29.h, z29.h
	lsl	x0, x0, 4
	lsl	x5, x5, 2
	sunpklo	z29.s, z29.h
	add	x0, sp, x0
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	add	x0, x0, 64
	ldr	z30, [x0]
	sub	z13.s, z13.s, z30.s
	addvl	x0, x5, #1
	rdvl	x5, #20
	sunpklo	z12.s, z12.h
	lsl	x5, x5, 2
	add	x0, x0, 64
	sqrshrnb	z13.h, z13.s, #12
	incb	x5, all, mul #4
	add	x0, sp, x0
	ldr	z30, [x0]
	sub	z0.s, z30.s, z0.s
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	lsl	x5, x5, 1
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	addvl	x0, x5, #4
	cntb	x5, all, mul #11
	sunpklo	z0.s, z0.h
	add	x0, x0, 64
	lsl	x5, x5, 4
	add	x0, sp, x0
	ldr	z7, [x0]
	sub	z1.s, z7.s, z1.s
	addvl	x0, x5, #-1
	rdvl	x5, #22
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	lsl	x5, x5, 3
	uzp1	z1.h, z1.h, z1.h
	add	x0, sp, x0
	ldr	z30, [x0]
	sub	z6.s, z18.s, z30.s
	addvl	x0, x5, #-2
	sunpklo	z1.s, z1.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x0, sp, x0
	ldr	z30, [x0]
	sub	z7.s, z19.s, z30.s
	rdvl	x0, #26
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	lsl	x5, x0, 3
	sunpklo	z7.s, z7.h
	sub	x0, x5, x0
	mov	x5, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z14.h, z30.s, #12
	cntb	x0
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z31.s, sxtw 1]
	mul	x0, x0, x5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z15.h, z30.s, #12
	lsl	x0, x2, 5
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x0, x0, 2
	add	x5, x1, x0
	st1h	z15.s, p6, [x5, z31.s, sxtw 1]
	rdvl	x5, #23
	lsl	x5, x5, 3
	add	x5, sp, x5
	add	x5, x5, 64
	ldr	z30, [x5]
	sqrshrnb	z16.h, z30.s, #12
	add	x5, x0, 2
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x5, x1, x5
	st1h	z16.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #1
	add	x5, x5, x5, lsl 2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z17.h, z30.s, #12
	add	x5, x0, 4
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x5, x1, x5
	st1h	z17.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #6
	lsl	x6, x5, 5
	sub	x5, x6, x5
	cntb	x6, all, mul #12
	add	x5, x5, 64
	lsl	x6, x6, 4
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z18.h, z30.s, #12
	add	x5, x0, 6
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x5, x1, x5
	st1h	z18.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #11
	add	x5, x5, x5, lsl 4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z19.h, z30.s, #12
	add	x5, x0, 8
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x5, x1, x5
	st1h	z19.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 10
	add	x5, x1, x5
	st1h	z20.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 12
	add	x5, x1, x5
	st1h	z21.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 14
	add	x5, x1, x5
	st1h	z22.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 16
	add	x5, x1, x5
	st1h	z23.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 18
	add	x5, x1, x5
	st1h	z24.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 20
	add	x5, x1, x5
	st1h	z25.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 22
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #-4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z30.h, z30.s, #12
	add	x5, x0, 24
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x5, x1, x5
	st1h	z30.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #3
	lsl	x6, x5, 6
	sub	x5, x6, x5
	cntb	x6, all, mul #6
	add	x5, x5, 64
	lsl	x6, x6, 5
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z30.h, z30.s, #12
	add	x5, x0, 26
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x5, x1, x5
	st1h	z30.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x6, #-2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z30, [x5]
	sqrshrnb	z30.h, z30.s, #12
	add	x5, x0, 28
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x5, x1, x5
	st1h	z30.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x1, x2, lsl 5
	add	x5, x5, 32
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 32
	add	x5, x1, x5
	st1h	z9.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 34
	add	x5, x1, x5
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 36
	add	x5, x1, x5
	st1h	z11.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 38
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 40
	add	x5, x1, x5
	st1h	z29.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 42
	add	x5, x1, x5
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 44
	add	x5, x1, x5
	st1h	z13.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 46
	add	x5, x1, x5
	st1h	z0.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 48
	add	x5, x1, x5
	st1h	z1.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 50
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 52
	add	x5, x1, x5
	st1h	z3.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 54
	add	x5, x1, x5
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 56
	add	x5, x1, x5
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 58
	add	x0, x0, 60
	add	x5, x1, x5
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	add	x0, x1, x0
	cntb	x5, all, mul #3
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 176
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z22, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 304
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z22.h, z22.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 432
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z23, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 560
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z23.h, z23.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 688
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z24, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 816
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z24.h, z24.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 944
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z25, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1072
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z25.h, z25.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1200
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1328
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z27.h, z27.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1456
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1584
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z28.h, z28.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1712
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1840
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z29.h, z29.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1968
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 2096
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z30.h, z30.h, z21.h
	add	x0, sp, 64
	ldr	z20, [x0]
	mov	z21.d, z26.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z6.d, z21.d
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	mov	z21.d, z26.d
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z5, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	mov	z5.d, z21.d
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z30.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	mov	z21.d, z26.d
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z4.d, z21.d
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	mov	z21.d, z26.d
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z3.d, z21.d
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z21.d, z26.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z2.d, z21.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z21.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z1.d, z21.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z21.d, z26.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z0.d, z21.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z21.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z7.d, z21.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z21.d, z26.d
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 5
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	mov	z18.d, z21.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z21.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z17.d, z21.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z21.d, z26.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z16.d, z21.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z21.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x5, x0, 3
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z12.d, z21.d
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z21.d, z26.d
	add	x0, x0, 64
	str	z12, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z13.d, z21.d
	add	x5, x5, x5, lsl 4
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	mov	z21.d, z26.d
	add	x0, x0, 64
	str	z13, [x0]
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	mov	z8.d, z21.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	mov	z21.d, z26.d
	add	x0, x0, 64
	str	z8, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z13.d, z21.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	mov	z21.d, z26.d
	add	x0, x0, 64
	str	z13, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z24.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z25.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z27.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z20.d, z21.d
	lsl	x5, x5, 7
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	addvl	x0, sp, #17
	mov	z15.d, z26.d
	add	x0, x0, 64
	lsl	x5, x5, 6
	str	z20, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 240
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 496
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z27.h, z27.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 752
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1008
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z28.h, z28.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1264
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1520
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z29.h, z29.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1776
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 2032
	add	x0, sp, x0
	ldr	z25, [x0]
	zip1	z30.h, z30.h, z25.h
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 7
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z14.d, z26.d
	lsl	x5, x5, 5
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z30.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z13.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z27.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z12.d, z26.d
	lsl	x5, x5, 4
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z27.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z11.d, z26.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z27.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z28.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z10.d, z26.d
	lsl	x5, x5, 3
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z27.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z30.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z9.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z8.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z29.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z22.d, z26.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 368
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 880
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z29.h, z29.h, z30.h
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 1392
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1904
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z30.h, z30.h, z28.h
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z21.d, z26.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x5, x5, x5, lsl 3
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z20.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	mov	z19.d, z26.d
	lsl	x5, x5, 3
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 624
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z29, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1648
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z29.h, z29.h, z30.h
	rdvl	x0, #21
	mov	z30.d, z26.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	mov	z25.d, z26.d
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	cntb	x5, all, mul #3
	add	x0, x0, 112
	lsl	x5, x5, 6
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x5, #-1
	add	x0, x0, 1136
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	cntb	x0, all, mul #10
	mov	z29.d, z26.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	add	z28.s, z29.s, z30.s
	add	z23.s, z28.s, z22.s
	sub	z28.s, z28.s, z22.s
	add	z22.s, z23.s, z15.s
	str	z22, [x0]
	addvl	x0, sp, #1
	add	z27.s, z26.s, z25.s
	add	z24.s, z27.s, z21.s
	add	x0, x0, 64
	add	z22.s, z24.s, z14.s
	str	z22, [x0]
	addvl	x0, sp, #2
	sub	z29.s, z29.s, z30.s
	sub	z30.s, z26.s, z25.s
	add	x0, x0, 64
	add	z26.s, z29.s, z19.s
	add	z22.s, z26.s, z12.s
	str	z22, [x0]
	addvl	x0, sp, #4
	add	z25.s, z30.s, z20.s
	add	x0, x0, 64
	sub	z30.s, z30.s, z20.s
	sub	z27.s, z27.s, z21.s
	add	z21.s, z30.s, z10.s
	str	z21, [x0]
	addvl	x0, sp, #5
	add	x0, x0, 64
	add	z21.s, z27.s, z9.s
	str	z21, [x0]
	addvl	x0, sp, #6
	sub	z23.s, z23.s, z15.s
	sub	z24.s, z24.s, z14.s
	add	x0, x0, 64
	str	z23, [x0]
	sub	z29.s, z29.s, z19.s
	add	x0, sp, 64
	ldr	z14, [x0]
	add	z19.s, z28.s, z8.s
	addvl	x0, sp, #9
	sub	z28.s, z28.s, z8.s
	add	z8.s, z14.s, z6.s
	add	x0, x0, 64
	str	z8, [x0]
	add	z22.s, z29.s, z11.s
	addvl	x0, sp, #1
	sub	z30.s, z30.s, z10.s
	sub	z26.s, z26.s, z12.s
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z15.s, z15.s, z5.s
	addvl	x0, sp, #10
	sub	z27.s, z27.s, z9.s
	add	z23.s, z27.s, z17.s
	add	x0, x0, 64
	str	z15, [x0]
	sub	z29.s, z29.s, z11.s
	addvl	x0, sp, #2
	add	z11.s, z22.s, z2.s
	add	z20.s, z25.s, z13.s
	add	x0, x0, 64
	ldr	z21, [x0]
	add	z10.s, z21.s, z3.s
	addvl	x0, sp, #3
	sub	z25.s, z25.s, z13.s
	add	z14.s, z19.s, z7.s
	add	x0, x0, 64
	str	z22, [x0]
	add	z15.s, z28.s, z18.s
	addvl	x0, sp, #4
	sub	z28.s, z28.s, z18.s
	add	x2, x2, x2, lsl 1
	add	x0, x0, 64
	ldr	z21, [x0]
	add	z12.s, z21.s, z1.s
	addvl	x0, sp, #5
	sub	z27.s, z27.s, z17.s
	add	x3, x3, x4
	add	x0, x0, 64
	ldr	z21, [x0]
	str	z19, [x0]
	addvl	x0, sp, #11
	add	z13.s, z21.s, z0.s
	lsl	x2, x2, 3
	add	x0, x0, 64
	str	z23, [x0]
	add	z23.s, z30.s, z16.s
	addvl	x0, sp, #12
	sub	z30.s, z30.s, z16.s
	sub	z16.s, z21.s, z0.s
	add	x0, x0, 64
	str	z23, [x0]
	add	z9.s, z20.s, z4.s
	addvl	x0, sp, #7
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z8.s, z29.s, z23.s
	addvl	x0, sp, #13
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #12
	add	x0, x0, 64
	str	z8, [x0]
	uzp1	z10.h, z10.h, z10.h
	addvl	x0, sp, #14
	sunpklo	z10.s, z10.h
	sqrshrnb	z11.h, z11.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	add	z23.s, z26.s, z22.s
	str	z23, [x0]
	addvl	x0, sp, #8
	sub	z26.s, z26.s, z22.s
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z8.s, z25.s, z23.s
	addvl	x0, sp, #15
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	add	x0, x0, 64
	str	z8, [x0]
	sqrshrnb	z12.h, z12.s, #12
	addvl	x0, sp, #16
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x0, x0, 64
	ldr	z8, [x0]
	add	z23.s, z24.s, z8.s
	str	z23, [x0]
	addvl	x0, sp, #17
	sub	z24.s, z24.s, z8.s
	add	x0, x0, 64
	ldr	z23, [x0]
	sqrshrnb	z13.h, z13.s, #12
	addvl	x0, sp, #6
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	add	x0, x0, 64
	ldr	z19, [x0]
	add	z19.s, z19.s, z23.s
	addvl	x0, sp, #17
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	str	z19, [x0]
	sunpklo	z14.s, z14.h
	addvl	x0, sp, #6
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	add	x0, x0, 64
	ldr	z19, [x0]
	sub	z23.s, z19.s, z23.s
	addvl	x0, sp, #8
	sunpklo	z15.s, z15.h
	sub	z20.s, z20.s, z4.s
	add	x0, x0, 64
	ldr	z8, [x0]
	sub	z25.s, z25.s, z8.s
	addvl	x0, sp, #7
	sqrshrnb	z23.h, z23.s, #12
	uzp1	z23.h, z23.h, z23.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z29.s, z29.s, z22.s
	addvl	x0, sp, #5
	sunpklo	z23.s, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x0, x0, 64
	ldr	z18, [x0]
	sub	z7.s, z18.s, z7.s
	addvl	x0, sp, #4
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 64
	ldr	z21, [x0]
	sub	z17.s, z21.s, z1.s
	addvl	x0, sp, #3
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z18.s, z22.s, z2.s
	addvl	x0, sp, #2
	sunpklo	z25.s, z25.h
	sqrshrnb	z26.h, z26.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z19.s, z22.s, z3.s
	addvl	x0, sp, #1
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z21.s, z22.s, z5.s
	add	x0, sp, 64
	ldr	z22, [x0]
	sub	z22.s, z22.s, z6.s
	addvl	x0, sp, #9
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x0, x0, 64
	ldr	z8, [x0]
	sqrshrnb	z8.h, z8.s, #12
	addvl	x0, sp, #10
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x2, 1
	add	x0, x0, 64
	ldr	z8, [x0]
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	lsl	x0, x3, 1
	add	x3, x1, x3, lsl 1
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 2
	sunpklo	z29.s, z29.h
	add	x3, x1, x3
	st1h	z9.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z30.h, z30.s, #12
	add	x3, x0, 4
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x3, x1, x3
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	add	x2, x1, x2, lsl 1
	add	x3, x0, 6
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x3, x1, x3
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z27.s, z27.h
	add	x3, x0, 8
	add	x2, x2, 48
	sqrshrnb	z28.h, z28.s, #12
	add	x3, x1, x3
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z28.h, z28.h, z28.h
	add	x3, x0, 10
	sunpklo	z28.s, z28.h
	sqrshrnb	z7.h, z7.s, #12
	add	x3, x1, x3
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z7.h, z7.h, z7.h
	add	x3, x0, 12
	sunpklo	z7.s, z7.h
	sqrshrnb	z16.h, z16.s, #12
	add	x3, x1, x3
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z16.h, z16.h, z16.h
	add	x3, x0, 14
	sunpklo	z16.s, z16.h
	sqrshrnb	z17.h, z17.s, #12
	add	x3, x1, x3
	st1h	z15.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z17.h, z17.h, z17.h
	addvl	x3, sp, #11
	sunpklo	z17.s, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z0.h, z15.s, #12
	add	x3, x0, 16
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x3, x1, x3
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z18.h, z18.h, z18.h
	addvl	x3, sp, #12
	sunpklo	z18.s, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z1.h, z15.s, #12
	add	x3, x0, 18
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x3, x1, x3
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z19.h, z19.h, z19.h
	addvl	x3, sp, #13
	sunpklo	z19.s, z19.h
	mov	x13, 191
	add	x3, x3, 64
	ldr	z8, [x3]
	sqrshrnb	z2.h, z8.s, #12
	add	x3, x0, 20
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x3, x1, x3
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	cntb	x12
	addvl	x3, sp, #14
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z3.h, z15.s, #12
	add	x3, x0, 22
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	add	x3, x1, x3
	st1h	z3.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z20.s, z20.h
	addvl	x3, sp, #15
	mul	x12, x12, x13
	sqrshrnb	z21.h, z21.s, #12
	add	x3, x3, 64
	ldr	z8, [x3]
	sqrshrnb	z4.h, z8.s, #12
	add	x3, x0, 24
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x3, x1, x3
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z21.h, z21.h, z21.h
	addvl	x3, sp, #16
	sunpklo	z21.s, z21.h
	sqrshrnb	z22.h, z22.s, #12
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z5.h, z15.s, #12
	add	x3, x0, 26
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x3, x1, x3
	st1h	z5.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z22.h, z22.h, z22.h
	addvl	x3, sp, #17
	sunpklo	z22.s, z22.h
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z6.h, z15.s, #12
	add	x3, x0, 28
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x3, x1, x3
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 30
	add	x3, x1, x3
	st1h	z23.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 32
	add	x3, x1, x3
	st1h	z24.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 34
	add	x3, x1, x3
	st1h	z25.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 36
	add	x3, x1, x3
	st1h	z26.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 38
	add	x3, x1, x3
	st1h	z29.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 40
	add	x3, x1, x3
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 42
	add	x3, x1, x3
	st1h	z27.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 44
	add	x3, x1, x3
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	st1h	z7.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 48
	add	x2, x1, x2
	st1h	z16.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 50
	add	x2, x1, x2
	st1h	z17.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 52
	add	x2, x1, x2
	st1h	z18.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 54
	add	x2, x1, x2
	st1h	z19.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 56
	add	x2, x1, x2
	st1h	z20.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 58
	add	x0, x0, 60
	add	x2, x1, x2
	st1h	z21.s, p6, [x2, z31.s, sxtw 1]
	add	x1, x1, x0
	st1h	z22.s, p6, [x1, z31.s, sxtw 1]
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
	add	sp, sp, x12
	.cfi_def_cfa_offset 2112
	add	sp, sp, 2112
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	dynopt_idct32_sve2_shared, .-dynopt_idct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL7CDOT_EO, %object
	.size	_ZL7CDOT_EO, 1024
_ZL7CDOT_EO:
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.type	_ZL8CDOT_EEO, %object
	.size	_ZL8CDOT_EEO, 256
_ZL8CDOT_EEO:
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.type	_ZL9CDOT_EEEO, %object
	.size	_ZL9CDOT_EEEO, 64
_ZL9CDOT_EEEO:
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.type	_ZL9CDOT_EEEE, %object
	.size	_ZL9CDOT_EEEE, 64
_ZL9CDOT_EEEE:
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
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.type	_ZL6CDOT_O, %object
	.size	_ZL6CDOT_O, 4096
_ZL6CDOT_O:
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
