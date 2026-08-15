	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_scale2d_64to32_sve2      // -- Begin function dynopt_scale2d_64to32_sve2
	.p2align	2
	.type	dynopt_scale2d_64to32_sve2,@function
dynopt_scale2d_64to32_sve2:             // @dynopt_scale2d_64to32_sve2
	.cfi_startproc
// %bb.0:
	lsl	x8, x2, #1
	add	x9, x0, #16
	add	x10, x1, #48
	mov	x11, #-2                        // =0xfffffffffffffffe
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	add	x12, x10, x2
	ldp	q2, q3, [x10, #-48]
	ldp	q0, q1, [x12, #-48]
	add	x11, x11, #2
	cmp	x11, #62
	uaddlp	v0.8h, v0.16b
	uaddlp	v1.8h, v1.16b
	uadalp	v0.8h, v2.16b
	uadalp	v1.8h, v3.16b
	uqrshrn	v0.8b, v0.8h, #2
	uqrshrn2	v0.16b, v1.8h, #2
	stur	q0, [x9, #-16]
	ldp	q0, q1, [x12, #-16]
	ldp	q2, q3, [x10, #-16]
	add	x10, x10, x8
	uaddlp	v0.8h, v0.16b
	uaddlp	v1.8h, v1.16b
	uadalp	v0.8h, v2.16b
	uadalp	v1.8h, v3.16b
	uqrshrn	v0.8b, v0.8h, #2
	uqrshrn2	v0.16b, v1.8h, #2
	str	q0, [x9], #32
	b.lo	.LBB0_1
// %bb.2:
	ret
.Lfunc_end0:
	.size	dynopt_scale2d_64to32_sve2, .Lfunc_end0-dynopt_scale2d_64to32_sve2
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
