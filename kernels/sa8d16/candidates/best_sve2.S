	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l, %function
_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l:
.LFB3896:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	add	x13, x0, x1, lsl 1
	add	x12, x2, x3, lsl 1
	mov	x29, sp
	add	x7, x13, x1, lsl 1
	add	x6, x12, x3, lsl 1
	add	x15, x0, x1
	add	x14, x2, x3
	add	x9, x7, x1, lsl 1
	add	x8, x6, x3, lsl 1
	add	x18, x3, x12
	add	x17, x7, x1
	add	x16, x6, x3
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	add	x19, x13, x1
	add	x5, x1, x1, lsl 1
	stp	d10, d11, [sp, 32]
	add	x20, x0, x1, lsl 1
	lsl	x11, x1, 3
	stp	d12, d13, [sp, 48]
	lsl	x10, x3, 3
	add	x4, x3, x3, lsl 1
	stp	d14, d15, [sp, 64]
	.cfi_offset 74, -48
	.cfi_offset 75, -40
	.cfi_offset 76, -32
	.cfi_offset 77, -24
	.cfi_offset 78, -16
	.cfi_offset 79, -8
	sub	x30, x11, x1
	ldr	d14, [x0, x1]
	ldp	d30, d22, [x0]
	ldp	d19, d6, [x2]
	ldr	d20, [x2, x3]
	ldr	d17, [x15, x1]
	ldr	d21, [x14, x3]
	ldr	d15, [x13, x1]
	sub	x13, x10, x3
	ldr	d23, [x3, x12]
	add	x12, x2, x3, lsl 1
	ldr	d27, [x19, x1]
	add	x19, x2, x3, lsl 2
	ldr	d24, [x18, x3]
	add	x18, x0, x5
	ldr	d16, [x7, x1]
	add	x7, x1, x1, lsl 2
	ldr	d26, [x17, x1]
	add	x17, x2, x4
	ldr	d29, [x16, x3]
	add	x16, x2, x4, lsl 1
	ldr	d28, [x9, x1]
	usubl	v1.8h, v14.8b, v20.8b
	ldr	d31, [x8, x3]
	usubl	v4.8h, v15.8b, v23.8b
	ldr	d25, [x6, x3]
	usubl	v0.8h, v30.8b, v19.8b
	ldr	d7, [x14, 8]
	usubl	v12.8h, v28.8b, v31.8b
	ldr	d18, [x15, 8]
	usubl	v15.8h, v16.8b, v25.8b
	ldr	d13, [x12, 8]
	usubl	v3.8h, v17.8b, v21.8b
	ldr	d14, [x20, 8]
	usubl	v5.8h, v27.8b, v24.8b
	add	x6, x3, x3, lsl 2
	usubl	v11.8h, v26.8b, v29.8b
	ldr	d10, [x18, 8]
	add	x14, x0, x7
	add	x15, x0, x1, lsl 2
	add	x18, x2, x6
	add	x20, x0, x30
	add	x12, x2, x13
	ldr	d2, [x17, 8]
	usubl	v27.8h, v22.8b, v6.8b
	ldr	d25, [x15, 8]
	usubl	v16.8h, v18.8b, v7.8b
	ldr	d29, [x14, 8]
	add	v31.8h, v0.8h, v1.8h
	ldr	d17, [x12, 8]
	sub	v30.8h, v0.8h, v1.8h
	ldr	d21, [x20, 8]
	add	v0.8h, v12.8h, v11.8h
	ldr	d19, [x18, 8]
	sub	v26.8h, v11.8h, v12.8h
	add	x17, x0, x5, lsl 1
	usubl	v23.8h, v14.8b, v13.8b
	ldr	d28, [x16, 8]
	add	v22.8h, v3.8h, v4.8h
	ldr	d11, [x19, 8]
	sub	v3.8h, v3.8h, v4.8h
	ldr	d24, [x17, 8]
	add	v13.8h, v5.8h, v15.8h
	add	x16, x8, x3, lsl 1
	sub	v5.8h, v5.8h, v15.8h
	add	x17, x9, x1, lsl 1
	usubl	v20.8h, v10.8b, v2.8b
	add	x9, x9, x1
	add	v4.8h, v31.8h, v22.8h
	add	x15, x16, x3, lsl 1
	usubl	v18.8h, v29.8b, v19.8b
	add	x18, x17, x1, lsl 1
	sub	v29.8h, v13.8h, v0.8h
	add	x30, x0, x30, lsl 1
	usubl	v6.8h, v21.8b, v17.8b
	add	x8, x8, x3
	sub	v7.8h, v31.8h, v22.8h
	add	x14, x18, x1, lsl 1
	add	v31.8h, v5.8h, v26.8h
	ldr	d2, [x30, 8]
	add	v12.8h, v27.8h, v16.8h
	add	x20, x17, x1
	sub	v10.8h, v27.8h, v16.8h
	add	x30, x18, x1
	add	v16.8h, v30.8h, v3.8h
	add	x12, x14, x1, lsl 1
	sub	v21.8h, v30.8h, v3.8h
	add	x19, x16, x3
	add	v15.8h, v13.8h, v0.8h
	add	x13, x2, x13, lsl 1
	sub	v27.8h, v5.8h, v26.8h
	usubl	v1.8h, v24.8b, v28.8b
	add	v14.8h, v16.8h, v31.8h
	sub	v0.8h, v4.8h, v15.8h
	sub	v24.8h, v16.8h, v31.8h
	add	v26.8h, v21.8h, v27.8h
	sub	v30.8h, v21.8h, v27.8h
	add	v17.8h, v4.8h, v15.8h
	add	v28.8h, v7.8h, v29.8h
	sub	v22.8h, v7.8h, v29.8h
	trn1	v5.8h, v0.8h, v24.8h
	trn1	v3.8h, v17.8h, v14.8h
	trn2	v4.8h, v17.8h, v14.8h
	trn1	v7.8h, v28.8h, v26.8h
	trn2	v19.8h, v28.8h, v26.8h
	trn2	v21.8h, v0.8h, v24.8h
	trn1	v16.8h, v22.8h, v30.8h
	trn2	v29.8h, v22.8h, v30.8h
	add	v17.8h, v7.8h, v19.8h
	add	v27.8h, v5.8h, v21.8h
	usubl	v25.8h, v25.8b, v11.8b
	add	v15.8h, v16.8h, v29.8h
	add	v11.8h, v3.8h, v4.8h
	sub	v0.8h, v7.8h, v19.8h
	sub	v31.8h, v16.8h, v29.8h
	sub	v13.8h, v3.8h, v4.8h
	sub	v28.8h, v5.8h, v21.8h
	trn1	v24.4s, v11.4s, v17.4s
	trn2	v22.4s, v11.4s, v17.4s
	trn1	v4.4s, v27.4s, v15.4s
	trn2	v7.4s, v27.4s, v15.4s
	trn1	v14.4s, v28.4s, v31.4s
	trn2	v5.4s, v28.4s, v31.4s
	sub	v29.8h, v25.8h, v18.8h
	add	v19.8h, v6.8h, v1.8h
	trn1	v3.4s, v13.4s, v0.4s
	trn2	v30.4s, v13.4s, v0.4s
	sub	v6.8h, v1.8h, v6.8h
	add	v13.8h, v23.8h, v20.8h
	sub	v23.8h, v23.8h, v20.8h
	add	v20.8h, v25.8h, v18.8h
	add	v21.8h, v22.8h, v24.8h
	add	v27.8h, v7.8h, v4.8h
	sabd	v17.8h, v7.8h, v4.8h
	add	v25.8h, v12.8h, v13.8h
	add	v31.8h, v10.8h, v23.8h
	add	v4.8h, v29.8h, v6.8h
	sub	v7.8h, v29.8h, v6.8h
	add	v11.8h, v30.8h, v3.8h
	sabd	v26.8h, v22.8h, v24.8h
	sabd	v0.8h, v30.8h, v3.8h
	sabd	v24.8h, v5.8h, v14.8h
	add	v22.8h, v20.8h, v19.8h
	sub	v3.8h, v20.8h, v19.8h
	sub	v12.8h, v12.8h, v13.8h
	sub	v10.8h, v10.8h, v23.8h
	add	v1.8h, v5.8h, v14.8h
	abs	v28.8h, v21.8h
	abs	v15.8h, v27.8h
	add	v13.8h, v31.8h, v4.8h
	add	v14.8h, v10.8h, v7.8h
	zip1	v27.2d, v26.2d, v17.2d
	zip2	v30.2d, v0.2d, v24.2d
	add	v6.8h, v12.8h, v3.8h
	zip2	v26.2d, v26.2d, v17.2d
	zip1	v17.2d, v0.2d, v24.2d
	add	v0.8h, v25.8h, v22.8h
	abs	v16.8h, v1.8h
	zip1	v5.2d, v28.2d, v15.2d
	sub	v1.8h, v12.8h, v3.8h
	sub	v29.8h, v25.8h, v22.8h
	sub	v21.8h, v31.8h, v4.8h
	abs	v18.8h, v11.8h
	zip2	v11.2d, v28.2d, v15.2d
	sub	v15.8h, v10.8h, v7.8h
	trn1	v12.8h, v0.8h, v13.8h
	trn2	v10.8h, v0.8h, v13.8h
	trn1	v3.8h, v6.8h, v14.8h
	trn2	v24.8h, v6.8h, v14.8h
	trn1	v4.8h, v29.8h, v21.8h
	trn2	v25.8h, v29.8h, v21.8h
	ldr	d21, [x14, x1]
	trn1	v7.8h, v1.8h, v15.8h
	trn2	v31.8h, v1.8h, v15.8h
	ldr	d15, [x16, x3]
	zip1	v20.2d, v18.2d, v16.2d
	umax	v19.8h, v5.8h, v11.8h
	zip2	v18.2d, v18.2d, v16.2d
	add	v5.8h, v3.8h, v24.8h
	add	v16.8h, v12.8h, v10.8h
	sub	v11.8h, v12.8h, v10.8h
	ldr	d10, [x9, x1]
	sub	v0.8h, v7.8h, v31.8h
	add	x9, x15, x3, lsl 1
	umax	v23.8h, v27.8h, v26.8h
	add	x16, x9, x3
	sub	v27.8h, v3.8h, v24.8h
	ldr	d12, [x19, x3]
	umax	v28.8h, v17.8h, v30.8h
	add	x19, x1, x5, lsl 2
	sub	v30.8h, v4.8h, v25.8h
	add	x5, x0, x5, lsl 2
	trn1	v13.4s, v16.4s, v5.4s
	trn2	v1.4s, v16.4s, v5.4s
	ldr	d16, [x15, x3]
	umax	v22.8h, v20.8h, v18.8h
	ldr	d20, [x18, x1]
	add	v26.8h, v4.8h, v25.8h
	ldr	d4, [x8, x3]
	ldr	d25, [x17, x1]
	add	x18, x15, x3
	add	x8, x14, x1
	add	x17, x9, x3, lsl 1
	add	v17.8h, v7.8h, v31.8h
	ldr	d7, [x20, x1]
	ldr	d31, [x30, x1]
	add	x20, x11, x1
	ldr	d24, [x1, x8]
	add	x15, x10, x3
	ldr	d14, [x18, x3]
	add	x14, x1, x7, lsl 1
	trn1	v6.4s, v11.4s, v27.4s
	add	x30, x3, x6, lsl 1
	trn1	v3.4s, v30.4s, v0.4s
	add	x11, x0, x11
	trn2	v29.4s, v30.4s, v0.4s
	ldr	d0, [x9, x3]
	usubl	v30.8h, v10.8b, v4.8b
	add	x10, x2, x10
	usubl	v10.8h, v20.8b, v16.8b
	ldr	d20, [x17, x3]
	trn2	v27.4s, v11.4s, v27.4s
	ldr	d11, [x1, x12]
	add	v28.8h, v23.8h, v28.8h
	ldr	d23, [x16, x3]
	trn1	v18.4s, v26.4s, v17.4s
	add	x16, x0, x20
	trn2	v26.4s, v26.4s, v17.4s
	add	x17, x2, x15
	usubl	v5.8h, v24.8b, v23.8b
	add	x20, x0, x14
	usubl	v24.8h, v21.8b, v0.8b
	add	x12, x2, x30
	usubl	v23.8h, v11.8b, v20.8b
	add	x7, x0, x7, lsl 1
	usubl	v17.8h, v25.8b, v15.8b
	add	x6, x2, x6, lsl 1
	usubl	v25.8h, v31.8b, v14.8b
	ldr	d21, [x10, 8]
	add	v19.8h, v19.8h, v22.8h
	add	x18, x3, x4, lsl 2
	usubl	v22.8h, v7.8b, v12.8b
	ldr	d0, [x6, 8]
	sub	v12.8h, v5.8h, v23.8h
	add	x9, x0, x1, lsl 4
	sub	v7.8h, v25.8h, v24.8h
	add	x8, x2, x3, lsl 4
	add	v15.8h, v17.8h, v30.8h
	add	x4, x2, x4, lsl 2
	add	v14.8h, v10.8h, v22.8h
	add	x0, x0, x19
	sub	v11.8h, v30.8h, v17.8h
	add	x2, x2, x18
	sub	v30.8h, v22.8h, v10.8h
	ldr	d22, [x17, 8]
	add	v17.8h, v23.8h, v5.8h
	ldr	d23, [x16, 8]
	add	v4.8h, v24.8h, v25.8h
	ldr	d5, [x11, 8]
	sub	v31.8h, v7.8h, v12.8h
	ldr	d10, [x20, 8]
	sabd	v25.8h, v1.8h, v13.8h
	sub	x1, x9, x1
	add	v16.8h, v1.8h, v13.8h
	ldr	d1, [x7, 8]
	add	v13.8h, v7.8h, v12.8h
	sub	x3, x8, x3
	add	v12.8h, v15.8h, v14.8h
	sub	v15.8h, v15.8h, v14.8h
	add	v14.8h, v11.8h, v30.8h
	usubl	v7.8h, v23.8b, v22.8b
	add	v22.8h, v4.8h, v17.8h
	sub	v4.8h, v4.8h, v17.8h
	ldr	d17, [x12, 8]
	usubl	v24.8h, v1.8b, v0.8b
	sub	v11.8h, v11.8h, v30.8h
	add	v0.8h, v14.8h, v13.8h
	sub	v14.8h, v14.8h, v13.8h
	usubl	v13.8h, v10.8b, v17.8b
	ldr	d10, [x0, 8]
	add	v1.8h, v11.8h, v31.8h
	usubl	v20.8h, v5.8b, v21.8b
	ldr	d21, [x4, 8]
	sub	v30.8h, v11.8h, v31.8h
	ldr	d5, [x5, 8]
	add	v31.8h, v13.8h, v24.8h
	sub	v23.8h, v24.8h, v13.8h
	ldr	d24, [x2, 8]
	usubl	v11.8h, v5.8b, v21.8b
	ldr	d13, [x13, 8]
	abs	v16.8h, v16.8h
	ldr	d21, [x3, 8]
	usubl	v17.8h, v10.8b, v24.8b
	ldr	d24, [x1, 8]
	usubl	v2.8h, v2.8b, v13.8b
	ldp	x19, x20, [sp, 16]
	add	v10.8h, v17.8h, v11.8h
	sub	v5.8h, v11.8h, v17.8h
	usubl	v11.8h, v24.8b, v21.8b
	add	v17.8h, v7.8h, v20.8h
	sub	v20.8h, v20.8h, v7.8h
	add	v7.8h, v12.8h, v22.8h
	add	v21.8h, v11.8h, v2.8h
	sub	v12.8h, v12.8h, v22.8h
	sub	v22.8h, v2.8h, v11.8h
	add	v11.8h, v15.8h, v4.8h
	add	v2.8h, v10.8h, v21.8h
	sub	v15.8h, v15.8h, v4.8h
	add	v24.8h, v17.8h, v31.8h
	sub	v10.8h, v10.8h, v21.8h
	trn1	v4.8h, v11.8h, v1.8h
	trn2	v21.8h, v11.8h, v1.8h
	sub	v13.8h, v17.8h, v31.8h
	add	v1.8h, v5.8h, v22.8h
	add	v17.8h, v20.8h, v23.8h
	trn1	v31.8h, v7.8h, v0.8h
	sub	v5.8h, v5.8h, v22.8h
	trn2	v7.8h, v7.8h, v0.8h
	sub	v20.8h, v20.8h, v23.8h
	trn1	v0.8h, v15.8h, v30.8h
	trn1	v23.8h, v12.8h, v14.8h
	trn2	v30.8h, v15.8h, v30.8h
	trn2	v12.8h, v12.8h, v14.8h
	add	v14.8h, v24.8h, v2.8h
	sub	v24.8h, v24.8h, v2.8h
	add	v2.8h, v4.8h, v21.8h
	sub	v4.8h, v4.8h, v21.8h
	add	v21.8h, v27.8h, v6.8h
	sabd	v27.8h, v27.8h, v6.8h
	add	v6.8h, v26.8h, v18.8h
	add	v11.8h, v0.8h, v30.8h
	add	v15.8h, v20.8h, v5.8h
	add	v22.8h, v31.8h, v7.8h
	sub	v30.8h, v0.8h, v30.8h
	sub	v20.8h, v20.8h, v5.8h
	sub	v31.8h, v31.8h, v7.8h
	abs	v6.8h, v6.8h
	add	v7.8h, v13.8h, v10.8h
	sub	v13.8h, v13.8h, v10.8h
	add	v10.8h, v23.8h, v12.8h
	sub	v23.8h, v23.8h, v12.8h
	add	v12.8h, v17.8h, v1.8h
	sub	v17.8h, v17.8h, v1.8h
	sabd	v18.8h, v26.8h, v18.8h
	trn1	v1.4s, v22.4s, v2.4s
	add	v26.8h, v29.8h, v3.8h
	trn2	v22.4s, v22.4s, v2.4s
	sabd	v29.8h, v29.8h, v3.8h
	trn1	v2.4s, v31.4s, v4.4s
	trn1	v3.4s, v10.4s, v11.4s
	trn2	v31.4s, v31.4s, v4.4s
	trn2	v10.4s, v10.4s, v11.4s
	trn1	v4.4s, v23.4s, v30.4s
	trn1	v11.8h, v14.8h, v12.8h
	trn2	v23.4s, v23.4s, v30.4s
	trn2	v30.8h, v14.8h, v12.8h
	trn1	v14.8h, v24.8h, v17.8h
	trn1	v12.8h, v7.8h, v15.8h
	trn2	v24.8h, v24.8h, v17.8h
	trn2	v7.8h, v7.8h, v15.8h
	trn2	v17.8h, v13.8h, v20.8h
	trn1	v15.8h, v13.8h, v20.8h
	zip1	v13.2d, v16.2d, v6.2d
	zip2	v16.2d, v16.2d, v6.2d
	abs	v0.8h, v26.8h
	abs	v5.8h, v21.8h
	add	v26.8h, v14.8h, v24.8h
	umax	v20.8h, v13.8h, v16.8h
	add	v6.8h, v12.8h, v7.8h
	add	v13.8h, v31.8h, v2.8h
	sub	v12.8h, v12.8h, v7.8h
	add	v21.8h, v19.8h, v20.8h
	add	v19.8h, v11.8h, v30.8h
	sub	v30.8h, v11.8h, v30.8h
	zip1	v11.2d, v5.2d, v0.2d
	zip2	v5.2d, v5.2d, v0.2d
	sub	v20.8h, v14.8h, v24.8h
	zip1	v24.2d, v27.2d, v29.2d
	zip2	v27.2d, v27.2d, v29.2d
	umax	v0.8h, v11.8h, v5.8h
	add	v7.8h, v15.8h, v17.8h
	add	v16.8h, v10.8h, v3.8h
	umax	v29.8h, v24.8h, v27.8h
	sub	v17.8h, v15.8h, v17.8h
	zip1	v14.2d, v25.2d, v18.2d
	add	v15.8h, v22.8h, v1.8h
	add	v11.8h, v23.8h, v4.8h
	sabd	v1.8h, v22.8h, v1.8h
	add	v28.8h, v28.8h, v0.8h
	sabd	v22.8h, v10.8h, v3.8h
	zip2	v25.2d, v25.2d, v18.2d
	sabd	v2.8h, v31.8h, v2.8h
	abs	v3.8h, v15.8h
	sabd	v31.8h, v23.8h, v4.8h
	umax	v18.8h, v14.8h, v25.8h
	abs	v4.8h, v16.8h
	abs	v23.8h, v11.8h
	zip2	v15.2d, v1.2d, v22.2d
	trn1	v11.4s, v30.4s, v12.4s
	add	v0.8h, v28.8h, v29.8h
	trn2	v30.4s, v30.4s, v12.4s
	zip1	v28.2d, v1.2d, v22.2d
	trn1	v12.4s, v26.4s, v7.4s
	trn1	v1.4s, v19.4s, v6.4s
	trn2	v26.4s, v26.4s, v7.4s
	trn2	v6.4s, v19.4s, v6.4s
	trn1	v7.4s, v20.4s, v17.4s
	abs	v10.8h, v13.8h
	trn2	v17.4s, v20.4s, v17.4s
	zip1	v14.2d, v2.2d, v31.2d
	zip1	v25.2d, v3.2d, v4.2d
	zip2	v24.2d, v3.2d, v4.2d
	zip2	v13.2d, v10.2d, v23.2d
	add	v16.8h, v6.8h, v1.8h
	add	v22.8h, v26.8h, v12.8h
	add	v20.8h, v17.8h, v7.8h
	add	v5.8h, v21.8h, v18.8h
	zip2	v21.2d, v2.2d, v31.2d
	zip1	v18.2d, v10.2d, v23.2d
	add	v2.8h, v30.8h, v11.8h
	umax	v19.8h, v25.8h, v24.8h
	umax	v4.8h, v28.8h, v15.8h
	umax	v31.8h, v18.8h, v13.8h
	umax	v15.8h, v14.8h, v21.8h
	abs	v25.8h, v2.8h
	abs	v14.8h, v16.8h
	abs	v24.8h, v22.8h
	abs	v23.8h, v20.8h
	sabd	v29.8h, v6.8h, v1.8h
	sabd	v3.8h, v30.8h, v11.8h
	sabd	v10.8h, v26.8h, v12.8h
	sabd	v27.8h, v17.8h, v7.8h
	zip1	v11.2d, v14.2d, v24.2d
	add	v5.8h, v5.8h, v19.8h
	add	v0.8h, v0.8h, v31.8h
	zip2	v30.2d, v14.2d, v24.2d
	zip1	v12.2d, v25.2d, v23.2d
	zip2	v7.2d, v25.2d, v23.2d
	zip1	v21.2d, v29.2d, v10.2d
	zip2	v18.2d, v29.2d, v10.2d
	zip1	v13.2d, v3.2d, v27.2d
	add	v6.8h, v5.8h, v4.8h
	add	v28.8h, v0.8h, v15.8h
	umax	v26.8h, v11.8h, v30.8h
	umax	v5.8h, v12.8h, v7.8h
	zip2	v1.2d, v3.2d, v27.2d
	umax	v17.8h, v21.8h, v18.8h
	add	v16.8h, v6.8h, v26.8h
	add	v2.8h, v28.8h, v5.8h
	umax	v19.8h, v13.8h, v1.8h
	ldp	d10, d11, [sp, 32]
	add	v22.8h, v16.8h, v17.8h
	add	v20.8h, v2.8h, v19.8h
	ldp	d12, d13, [sp, 48]
	ldp	d14, d15, [sp, 64]
	add	v31.8h, v22.8h, v20.8h
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_def_cfa_offset 0
	uaddlv	s29, v31.8h
	fmov	w13, s29
	add	w15, w13, 1
	lsr	w0, w15, 1
	ret
	.cfi_endproc
.LFE3896:
	.size	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l, .-_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_16x16_sve2
	.type	dynopt_sa8d_16x16_sve2, %function
dynopt_sa8d_16x16_sve2:
.LFB3897:
	.cfi_startproc
	b	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	.cfi_endproc
.LFE3897:
	.size	dynopt_sa8d_16x16_sve2, .-dynopt_sa8d_16x16_sve2
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_32x32_sve2
	.type	dynopt_sa8d_32x32_sve2, %function
dynopt_sa8d_32x32_sve2:
.LFB3898:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x20, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	mov	x21, x3
	lsl	x22, x1, 4
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	mov	x23, x0
	lsl	x24, x3, 4
	str	x25, [sp, 64]
	.cfi_offset 25, -16
	mov	x25, x2
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	mov	w19, w0
	mov	x3, x21
	add	x2, x25, 16
	mov	x1, x20
	add	x0, x23, 16
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	w19, w19, w0
	add	x2, x25, x21, lsl 4
	mov	x3, x21
	mov	x1, x20
	add	x0, x23, x20, lsl 4
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x22, x22, 16
	add	x2, x24, 16
	mov	x3, x21
	add	w24, w19, w0
	add	x2, x25, x2
	mov	x1, x20
	add	x0, x23, x22
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	w0, w24, w0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3898:
	.size	dynopt_sa8d_32x32_sve2, .-dynopt_sa8d_32x32_sve2
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_64x64_sve2
	.type	dynopt_sa8d_64x64_sve2, %function
dynopt_sa8d_64x64_sve2:
.LFB3899:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	mov	x20, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x21, x3
	mov	x22, x0
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	mov	x23, x2
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	add	x26, x23, x21, lsl 4
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -32
	.cfi_offset 28, -24
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	mov	x3, x21
	mov	w19, w0
	add	x2, x23, 16
	mov	x1, x20
	add	x0, x22, 16
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	w24, w19, w0
	mov	x3, x21
	add	x2, x23, 32
	mov	x1, x20
	add	x0, x22, 32
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x28, x22, x20, lsl 4
	add	w25, w24, w0
	mov	x3, x21
	add	x2, x23, 48
	mov	x1, x20
	add	x0, x22, 48
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	lsl	x24, x20, 4
	add	w27, w25, w0
	mov	x3, x21
	mov	x2, x26
	mov	x1, x20
	mov	x0, x28
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	lsl	x25, x21, 4
	add	x4, x24, 16
	add	x2, x25, 16
	add	w19, w27, w0
	mov	x3, x21
	add	x0, x22, x4
	add	x2, x23, x2
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x5, x24, 32
	add	x1, x25, 32
	add	x2, x23, x1
	add	w27, w19, w0
	mov	x3, x21
	add	x0, x22, x5
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x7, x24, 48
	add	x6, x25, 48
	add	x2, x23, x6
	add	w19, w27, w0
	mov	x3, x21
	add	x0, x22, x7
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x8, x26, x25
	lsl	x27, x21, 5
	mov	x2, x8
	lsl	x26, x20, 5
	mov	x3, x21
	mov	x1, x20
	add	w19, w19, w0
	add	x0, x28, x24
	str	x8, [sp, 104]
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x9, x27, 16
	add	x10, x26, 16
	add	x2, x23, x9
	mov	x3, x21
	mov	x1, x20
	add	w19, w19, w0
	add	x0, x22, x10
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x11, x27, 32
	add	x12, x26, 32
	add	x2, x23, x11
	add	w19, w19, w0
	mov	x3, x21
	add	x0, x22, x12
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x13, x27, 48
	add	x14, x26, 48
	add	x2, x23, x13
	add	w27, w19, w0
	mov	x3, x21
	add	x0, x22, x14
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x15, x20, x20, lsl 1
	add	x18, x21, x21, lsl 1
	add	w19, w27, w0
	add	x0, x28, x24, lsl 1
	ldr	x28, [sp, 104]
	lsl	x26, x18, 4
	lsl	x24, x15, 4
	mov	x3, x21
	add	x2, x25, x28
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x25, x26, 16
	add	x4, x24, 16
	add	x2, x23, x25
	add	w27, w19, w0
	mov	x3, x21
	add	x0, x22, x4
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	w19, w27, w0
	add	x5, x24, 32
	add	x2, x26, 32
	add	x0, x22, x5
	mov	x3, x21
	add	x2, x23, x2
	mov	x1, x20
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	add	x6, x24, 48
	add	x1, x26, 48
	add	x2, x23, x1
	add	w26, w19, w0
	mov	x3, x21
	mov	x1, x20
	add	x0, x22, x6
	bl	_ZL27dynopt_sa8d_16x16_sve2_implPKhlS0_l
	ldp	x19, x20, [sp, 16]
	add	w0, w26, w0
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3899:
	.size	dynopt_sa8d_64x64_sve2, .-dynopt_sa8d_64x64_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
