// SVE2 sdot.d capability probe for 920B (SVE1) vs 920G (SVE2).
	.arch armv8.2-a+sve
	.text
	.global sdot_d_probe
	.type sdot_d_probe, %function
sdot_d_probe:
	ptrue	p0.b
	ld1h	z1.h, p0/z, [x0]
	ld1h	z2.h, p0/z, [x1]
	mov	z0.d, #0
	sdot	z0.d, z1.h, z2.h
	st1h	z0.h, p0, [x2]
	ret
	.size	sdot_d_probe, .-sdot_d_probe
