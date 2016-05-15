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
	.globl	_checkbound2
_checkbound2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L100:
	cmpq	%rbx, %rax
	jbe	L101
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
L101:
	call	_caml_ml_array_bound_error
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.text
	.align	4
	.globl	_checkbound1
_checkbound1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L102:
	cmpq	$2, %rax
	jbe	L103
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
L103:
	call	_caml_ml_array_bound_error
	.cfi_adjust_cfa_offset -8
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
	.quad	0
