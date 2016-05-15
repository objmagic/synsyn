	.file ""
	.data
	.globl	_camltest__data_begin
_camltest__data_begin:
	.text
	.globl	_camltest__code_begin
_camltest__code_begin:
	nop
	.text
	.align	4
	.globl	_quicksort
_quicksort:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
L106:
	movq	%rbx, %rsi
	cmpq	%rsi, %rax
	jge	L100
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rax, %rbx
	movq	%rbx, (%rsp)
	movq	%rsi, %rdx
	movq	(%rdi,%rsi,8), %rcx
L102:
	cmpq	%rdx, %rbx
	jge	L101
L105:
	cmpq	%rsi, %rbx
	jge	L104
	movq	(%rdi,%rbx,8), %r8
	cmpq	%rcx, %r8
	jg	L104
	incq	%rbx
	movq	%rbx, (%rsp)
	jmp	L105
	.align	2
L104:
	cmpq	%rax, %rdx
	jle	L103
	movq	(%rdi,%rdx,8), %r8
	cmpq	%rcx, %r8
	jl	L103
	decq	%rdx
	jmp	L104
	.align	2
L103:
	cmpq	%rdx, %rbx
	jge	L102
	movq	(%rdi,%rbx,8), %r8
	movq	(%rdi,%rdx,8), %r9
	movq	%r9, (%rdi,%rbx,8)
	movq	%r8, (%rdi,%rdx,8)
	jmp	L102
	.align	2
L101:
	movq	(%rdi,%rbx,8), %rdx
	movq	(%rdi,%rsi,8), %rcx
	movq	%rcx, (%rdi,%rbx,8)
	movq	%rdx, (%rdi,%rsi,8)
	decq	%rbx
	call	_quicksort
L107:
	movq	(%rsp), %rax
	incq	%rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	jmp	L106
	.align	2
L100:
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.text
	nop
	.globl	_camltest__code_end
_camltest__code_end:
	.data
				/* relocation table start */
	.align	3
				/* relocation table end */
	.data
	.globl	_camltest__data_end
_camltest__data_end:
	.long	0
	.globl	_camltest__frametable
_camltest__frametable:
	.quad	1
	.quad	L107
	.word	32
	.word	1
	.word	16
	.align	3
