	.file	"part2_e.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64
	movsd	xmm1, QWORD PTR .LC0[rip]
	xorps	xmm2, xmm2
	movaps	xmm3, xmm1
.L2:
	comisd	xmm0, xmm2
	jbe	.L5
	mulsd	xmm1, xmm0
	subsd	xmm0, xmm3
	jmp	.L2
.L5:
	movaps	xmm0, xmm1
	ret
	.size	factorial, .-factorial
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
