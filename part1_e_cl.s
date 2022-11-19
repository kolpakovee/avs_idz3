	.file	"part1_e.c"
	.intel_syntax noprefix
	.text
	.globl	randomValue
	.type	randomValue, @function
randomValue:                                #функция randomValue
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	edi, 0
	call	time@PLT                        #вызов функции time
	mov	edi, eax
	call	srand@PLT                       #вызов функции srand
	call	rand@PLT                        #вызов функции rand
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm2, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret                                     #взоврат значения из функции randomValue
	.size	randomValue, .-randomValue
	.section	.rodata
.LC4:
	.string	"%lf"
.LC5:
	.string	"r"
.LC6:
	.string	"Invalid input!"
.LC12:
	.string	"w"
.LC13:
	.string	"Result: %.50lf\n"
.LC15:
	.string	"Precision: %.20lf%%\n"
.LC16:
	.string	"Time: %lld ns\n"
	.text
	.globl	main
	.type	main, @function
main:                                       #функция main
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	DWORD PTR -116[rbp], edi            #хранение параметра функции int argc
	mov	QWORD PTR -128[rbp], rsi            #хранение парметра функции char** argv
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	cmp	DWORD PTR -116[rbp], 2
	jne	.L4
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 49
	jne	.L4
	mov	eax, 0
	call	randomValue                     #вызов функции randomValue без передачи параметров
	movq	rax, xmm0
	mov	QWORD PTR -104[rbp], rax            #val := randomValue()
	jmp	.L5
.L4:
	cmp	DWORD PTR -116[rbp], 2
	jne	.L6
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 50
	jne	.L6
	lea	rax, -104[rbp]                      #параметр &val для функции scanf
	mov	rsi, rax
	lea	rax, .LC4[rip]                      #строка-формат для вызова функциии scanf
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT              #вызов функции scanf
	jmp	.L5
.L6:
	cmp	DWORD PTR -116[rbp], 4
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 51
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]            #argv[2] для вызова функции fopen(argv[2], "r")
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]                      #строка-формат "r" для вызова функции fopen(argv[2], "r")
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT                      #вызов функции fopen
	mov	QWORD PTR -32[rbp], rax            #FILE *input_file := результат функции fopen
	lea	rdx, -104[rbp]                      #параметр &val для функции fscanf
	mov	rax, QWORD PTR -32[rbp]             #параметр FILE *input_file для вызова функции fscanf
	lea	rcx, .LC4[rip]                      #строка-формат "%lf" для ввода переменной типа double
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT             #вызов функции fscanf
	jmp	.L5
.L7:
	lea	rax, .LC6[rip]                      #строка-формат для вызова функции printf
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                      #вызов функции printf
	mov	eax, 0
	jmp	.L17
.L5:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
	lea	rax, -80[rbp]                       #переменная &start для вызова функции clock_gettime
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT               #вызов функции clock_gettime
	mov	DWORD PTR -20[rbp], 0
	jmp	.L9
.L14:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
.L13:
	movsd	xmm0, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR .LC7[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -136[rbp], xmm0
	mov	rax, QWORD PTR -104[rbp]
	movsd	xmm0, QWORD PTR -16[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -136[rbp]
	movsd	QWORD PTR -136[rbp], xmm3
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	factorial@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -136[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -56[rbp]
	comisd	xmm0, QWORD PTR .LC8[rip]
	ja	.L18
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm1, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	ja	.L13
	jmp	.L12
.L18:
	nop
.L12:
	add	DWORD PTR -20[rbp], 1
.L9:
	cmp	DWORD PTR -20[rbp], 999
	jle	.L14
	lea	rax, -96[rbp]                           #переменная &end для вызова функции clock_gettime
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT                   #вызов функции clock_gettime
	mov	rax, QWORD PTR -96[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR -88[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR -80[rbp]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR -72[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	subsd	xmm0, xmm1
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -40[rbp], rax
	cmp	DWORD PTR -116[rbp], 4
	jne	.L15
	mov	rax, QWORD PTR -128[rbp]            #rax := argv[3] для вызова функции fopen
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]                     #получение строка-формата для вызова функции fopen
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT                       #вызов функции fopen
	mov	QWORD PTR -48[rbp], rax             #FILE *output_file := результат вызова fopen
	mov	rdx, QWORD PTR -8[rbp]              #rdx := result для вызова функции fprintf
	mov	rax, QWORD PTR -48[rbp]             #rax := output_file для вызова функции fprintf
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]                     #получение строки-формата для вызова функции fprintf
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                     #вызов функции fprintf
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, xmm1
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	movapd	xmm4, xmm0
	xorpd	xmm4, xmm1
	movq	rax, xmm4
	movq	xmm0, rax
	call	exp@PLT
	movsd	xmm1, QWORD PTR -136[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movq	rdx, xmm1
	mov	rax, QWORD PTR -48[rbp]             #rax := output_file для вызова функции fprintf
	movq	xmm0, rdx
	lea	rdx, .LC15[rip]                     #получение строки-формата для вызова функции fprintf
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                     #вызов функции fprintf
	mov	rdx, QWORD PTR -40[rbp]             #result_time для функции fprintf
	mov	rax, QWORD PTR -48[rbp]             #rax := output_file для вызова функции fprintf
	lea	rcx, .LC16[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT                     #вызов функции fprintf
	jmp	.L16
.L15:
	mov	rax, QWORD PTR -8[rbp]              #result для вызова функции printf
	movq	xmm0, rax
	lea	rax, .LC13[rip]                     #получение строки-формата для вызова функции printf
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT                      #вызов функции printf
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, xmm1
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	movapd	xmm5, xmm0
	xorpd	xmm5, xmm1
	movq	rax, xmm5
	movq	xmm0, rax
	call	exp@PLT
	movsd	xmm1, QWORD PTR -136[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	lea	rax, .LC15[rip]                     #получение строки-формата для вызова функции printf
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT                      #вызов функции printf
	mov	rax, QWORD PTR -40[rbp]             #result_time для вызова функции printf
	mov	rsi, rax
	lea	rax, .LC16[rip]                     #получение строки-формата для вызова функции printf
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                      #вызов функции printf
.L16:
	mov	eax, 0
.L17:
	leave
	ret                                     #возврат функции main
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 8
.LC1:
	.long	0
	.long	1079820288
	.align 8
.LC2:
	.long	0
	.long	1079574528
	.align 8
.LC7:
	.long	0
	.long	-1074790400
	.align 8
.LC8:
	.long	-1
	.long	2146435071
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.align 16
.LC10:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.align 16
.LC14:
	.long	0
	.long	-2147483648
	.long	0
	.long	0

