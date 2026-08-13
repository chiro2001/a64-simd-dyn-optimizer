// SVE2p3 execution canary: sdot z.h, z.b, z.b (s8 x s8 -> s16).
// Entry: x0 = int8_t* a, x1 = int8_t* b, x2 = int16_t* out (16 lanes).
// Semantics (ARM DDI0602): out.h[i] = a.b[2i]*b.b[2i] + a.b[2i+1]*b.b[2i+1].
// The only reason this file exists is to probe whether the *executor*
// (QEMU/model/silicon) implements FEAT_SVE2p3; the assembler already
// accepts the encoding.
	.arch armv9.5-a+sve2p3
	.text
	.global sve2p3_sdot_h_canary
	.type sve2p3_sdot_h_canary, %function
sve2p3_sdot_h_canary:
	ptrue	p0.b
	ld1b	z0.b, p0/z, [x0]
	ld1b	z1.b, p0/z, [x1]
	mov	z2.d, #0
	sdot	z2.h, z0.b, z1.b
	st1h	z2.h, p0, [x2]
	ret
	.size	sve2p3_sdot_h_canary, .-sve2p3_sdot_h_canary
	.section .note.GNU-stack,"",%progbits
