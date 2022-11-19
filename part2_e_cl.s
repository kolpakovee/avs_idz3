	.file	"part2_e.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0        #параметр функции double x
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L2
.L3:                                        #тело цикла
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -24[rbp]
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1                      #проверка в цикле
	ja	.L3
	movsd	xmm0, QWORD PTR -8[rbp]         #xmn0 := i
	movq	rax, xmm0                       #rax := xmn0
	movq	xmm0, rax
	pop	rbp
	ret                                     #возврат функцией значения i
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248

