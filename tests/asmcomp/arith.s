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
	.globl	_testarith
_testarith:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L164:
	leaq	_R(%rip), %rbx
	leaq	_D(%rip), %rsi
	movq	_X(%rip), %rdi
	movq	_Y(%rip), %r8
	movsd	_F(%rip), %xmm1
	movsd	_G(%rip), %xmm0
	movq	$0, (%rbx)
	movq	$1, 8(%rbx)
	movq	$-1, 16(%rbx)
	movq	$256, 24(%rbx)
	movq	$65536, 32(%rbx)
	movq	$16777216, 40(%rbx)
	movq	$-256, 48(%rbx)
	movq	$-65536, 56(%rbx)
	movq	$-16777216, 64(%rbx)
	movq	%rdi, %rax
	addq	%r8, %rax
	movq	%rax, 72(%rbx)
	movq	%rdi, %rax
	incq	%rax
	movq	%rax, 80(%rbx)
	movq	%rdi, %rax
	decq	%rax
	movq	%rax, 88(%rbx)
	leaq	_R+8(%rip), %rax
	movq	%rax, 96(%rbx)
	movq	%rbx, %rax
	movq	%rax, %rdx
	addq	%r8, %rdx
	movq	%rdx, 104(%rbx)
	movq	%rdi, %rdx
	subq	%r8, %rdx
	movq	%rdx, 112(%rbx)
	movq	%rdi, %rdx
	decq	%rdx
	movq	%rdx, 120(%rbx)
	movq	%rdi, %rdx
	incq	%rdx
	movq	%rdx, 128(%rbx)
	leaq	_R-8(%rip), %rdx
	movq	%rdx, 136(%rbx)
	subq	%r8, %rax
	movq	%rax, 144(%rbx)
	movq	%rdi, %rax
	imulq	$2, %rax
	movq	%rax, 152(%rbx)
	movq	%rax, 160(%rbx)
	movq	%rdi, %rax
	imulq	$16, %rax
	movq	%rax, 168(%rbx)
	movq	%rax, 176(%rbx)
	movq	%rdi, %rax
	imulq	$12345, %rax
	movq	%rax, 184(%rbx)
	movq	%rax, 192(%rbx)
	movq	%rdi, %rax
	imulq	%r8, %rax
	movq	%rax, 200(%rbx)
	movq	$2, %rcx
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rax, 208(%rbx)
	movq	$16, %rcx
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rax, 216(%rbx)
	movq	$7, %rcx
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rax, 224(%rbx)
	testq	%r8, %r8
	je	L163
	movq	%rdi, %rax
	movq	%r8, %rcx
	cqto
	idivq	%rcx
	jmp	L162
	.align	2
L163:
	xorq	%rax, %rax
L162:
	movq	%rax, 232(%rbx)
	movq	$2, %rcx
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rdx, 240(%rbx)
	movq	$16, %rcx
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rdx, 248(%rbx)
	testq	%r8, %r8
	je	L161
	movq	%rdi, %rax
	movq	%r8, %rcx
	cqto
	idivq	%rcx
	jmp	L160
	.align	2
L161:
	xorq	%rdx, %rdx
L160:
	movq	%rdx, 256(%rbx)
	movq	%rdi, %rax
	andq	%r8, %rax
	movq	%rax, 264(%rbx)
	movq	%rdi, %rax
	andq	$3, %rax
	movq	%rax, 272(%rbx)
	movq	%rax, 280(%rbx)
	movq	%rdi, %rax
	orq	%r8, %rax
	movq	%rax, 288(%rbx)
	movq	%rdi, %rax
	orq	$3, %rax
	movq	%rax, 296(%rbx)
	movq	%rax, 304(%rbx)
	movq	%rdi, %rax
	xorq	%r8, %rax
	movq	%rax, 312(%rbx)
	movq	%rdi, %rax
	xorq	$3, %rax
	movq	%rax, 320(%rbx)
	movq	%rax, 328(%rbx)
	movq	%rdi, %rax
	movq	%r8, %rcx
	salq	%cl, %rax
	movq	%rax, 336(%rbx)
	movq	%rdi, %rax
	salq	$1, %rax
	movq	%rax, 344(%rbx)
	movq	%rdi, %rax
	salq	$8, %rax
	movq	%rax, 352(%rbx)
	movq	%rdi, %rax
	movq	%r8, %rcx
	shrq	%cl, %rax
	movq	%rax, 360(%rbx)
	movq	%rdi, %rax
	shrq	$1, %rax
	movq	%rax, 368(%rbx)
	movq	%rdi, %rax
	shrq	$8, %rax
	movq	%rax, 376(%rbx)
	movq	%rdi, %rax
	movq	%r8, %rcx
	sarq	%cl, %rax
	movq	%rax, 384(%rbx)
	movq	%rdi, %rax
	sarq	$1, %rax
	movq	%rax, 392(%rbx)
	movq	%rdi, %rax
	sarq	$8, %rax
	movq	%rax, 400(%rbx)
	cmpq	%r8, %rdi
	sete	%al
	movzbq	%al, %rax
	movq	%rax, 408(%rbx)
	cmpq	%r8, %rdi
	setne	%al
	movzbq	%al, %rax
	movq	%rax, 416(%rbx)
	cmpq	%r8, %rdi
	setl	%al
	movzbq	%al, %rax
	movq	%rax, 424(%rbx)
	cmpq	%r8, %rdi
	setg	%al
	movzbq	%al, %rax
	movq	%rax, 432(%rbx)
	cmpq	%r8, %rdi
	setle	%al
	movzbq	%al, %rax
	movq	%rax, 440(%rbx)
	cmpq	%r8, %rdi
	setge	%al
	movzbq	%al, %rax
	movq	%rax, 448(%rbx)
	cmpq	$1, %rdi
	sete	%al
	movzbq	%al, %rax
	movq	%rax, 456(%rbx)
	cmpq	$1, %rdi
	setne	%al
	movzbq	%al, %rax
	movq	%rax, 464(%rbx)
	cmpq	$1, %rdi
	setl	%al
	movzbq	%al, %rax
	movq	%rax, 472(%rbx)
	cmpq	$1, %rdi
	setg	%al
	movzbq	%al, %rax
	movq	%rax, 480(%rbx)
	cmpq	$1, %rdi
	setle	%al
	movzbq	%al, %rax
	movq	%rax, 488(%rbx)
	cmpq	$1, %rdi
	setge	%al
	movzbq	%al, %rax
	movq	%rax, 496(%rbx)
	cmpq	%r8, %rdi
	sete	%al
	movzbq	%al, %rax
	movq	%rax, 504(%rbx)
	cmpq	%r8, %rdi
	setne	%al
	movzbq	%al, %rax
	movq	%rax, 512(%rbx)
	cmpq	%r8, %rdi
	setb	%al
	movzbq	%al, %rax
	movq	%rax, 520(%rbx)
	cmpq	%r8, %rdi
	seta	%al
	movzbq	%al, %rax
	movq	%rax, 528(%rbx)
	cmpq	%r8, %rdi
	setbe	%al
	movzbq	%al, %rax
	movq	%rax, 536(%rbx)
	cmpq	%r8, %rdi
	setae	%al
	movzbq	%al, %rax
	movq	%rax, 544(%rbx)
	cmpq	$1, %rdi
	sete	%al
	movzbq	%al, %rax
	movq	%rax, 552(%rbx)
	cmpq	$1, %rdi
	setne	%al
	movzbq	%al, %rax
	movq	%rax, 560(%rbx)
	cmpq	$1, %rdi
	setb	%al
	movzbq	%al, %rax
	movq	%rax, 568(%rbx)
	cmpq	$1, %rdi
	seta	%al
	movzbq	%al, %rax
	movq	%rax, 576(%rbx)
	cmpq	$1, %rdi
	setbe	%al
	movzbq	%al, %rax
	movq	%rax, 584(%rbx)
	cmpq	$1, %rdi
	setae	%al
	movzbq	%al, %rax
	movq	%rax, 592(%rbx)
	leaq	(%rdi,%r8,2), %rax
	movq	%rax, 600(%rbx)
	leaq	(%rdi,%r8,4), %rax
	movq	%rax, 608(%rbx)
	leaq	(%rdi,%r8,8), %rax
	movq	%rax, 616(%rbx)
	movq	%r8, %rax
	salq	$1, %rax
	movq	%rdi, %rdx
	subq	%rax, %rdx
	movq	%rdx, 624(%rbx)
	movq	%r8, %rax
	salq	$2, %rax
	movq	%rdi, %rdx
	subq	%rax, %rdx
	movq	%rdx, 632(%rbx)
	movq	%r8, %rax
	salq	$3, %rax
	movq	%rdi, %rdx
	subq	%rax, %rdx
	movq	%rdx, 640(%rbx)
	xorpd	%xmm2, %xmm2
	movsd	%xmm2, (%rsi)
	movsd	L165(%rip), %xmm2
	movsd	%xmm2, 8(%rsi)
	movsd	L166(%rip), %xmm3
	movsd	%xmm3, 16(%rsi)
	movapd	%xmm1, %xmm3
	addsd	%xmm0, %xmm3
	movsd	%xmm3, 24(%rsi)
	movapd	%xmm1, %xmm3
	subsd	%xmm0, %xmm3
	movsd	%xmm3, 32(%rsi)
	movapd	%xmm1, %xmm3
	mulsd	%xmm0, %xmm3
	movsd	%xmm3, 40(%rsi)
	movapd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	movsd	%xmm3, 48(%rsi)
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm3, %xmm4
	movsd	%xmm4, 56(%rsi)
	movapd	%xmm1, %xmm4
	subsd	%xmm3, %xmm4
	movsd	%xmm4, 64(%rsi)
	movapd	%xmm1, %xmm4
	mulsd	%xmm3, %xmm4
	movsd	%xmm4, 72(%rsi)
	movapd	%xmm1, %xmm4
	divsd	%xmm3, %xmm4
	movsd	%xmm4, 80(%rsi)
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	movapd	%xmm4, %xmm2
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 88(%rsi)
	movapd	%xmm4, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 96(%rsi)
	movapd	%xmm4, %xmm2
	mulsd	%xmm0, %xmm2
	movsd	%xmm2, 104(%rsi)
	movapd	%xmm4, %xmm2
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 112(%rsi)
	movapd	%xmm4, %xmm2
	addsd	%xmm3, %xmm2
	movsd	%xmm2, 120(%rsi)
	movapd	%xmm4, %xmm2
	subsd	%xmm3, %xmm2
	movsd	%xmm2, 128(%rsi)
	movapd	%xmm4, %xmm2
	mulsd	%xmm3, %xmm2
	movsd	%xmm2, 136(%rsi)
	divsd	%xmm3, %xmm4
	movsd	%xmm4, 144(%rsi)
	ucomisd	%xmm0, %xmm1
	jp	L159
	jne	L159
	movq	$1, %rax
	jmp	L158
	.align	2
L159:
	xorq	%rax, %rax
L158:
	movq	%rax, 648(%rbx)
	ucomisd	%xmm0, %xmm1
	jp	L167
	je	L157
L167:
	movq	$1, %rax
	jmp	L156
	.align	2
L157:
	xorq	%rax, %rax
L156:
	movq	%rax, 656(%rbx)
	comisd	%xmm1, %xmm0
	jbe	L155
	movq	$1, %rax
	jmp	L154
	.align	2
L155:
	xorq	%rax, %rax
L154:
	movq	%rax, 664(%rbx)
	comisd	%xmm0, %xmm1
	jbe	L153
	movq	$1, %rax
	jmp	L152
	.align	2
L153:
	xorq	%rax, %rax
L152:
	movq	%rax, 672(%rbx)
	comisd	%xmm1, %xmm0
	jb	L151
	movq	$1, %rax
	jmp	L150
	.align	2
L151:
	xorq	%rax, %rax
L150:
	movq	%rax, 680(%rbx)
	comisd	%xmm0, %xmm1
	jb	L149
	movq	$1, %rax
	jmp	L148
	.align	2
L149:
	xorq	%rax, %rax
L148:
	movq	%rax, 688(%rbx)
	cvtsi2sdq	%rdi, %xmm2
	movsd	%xmm2, 152(%rsi)
	cvttsd2siq	%xmm1, %rax
	movq	%rax, 696(%rbx)
	cmpq	%r8, %rdi
	setl	%al
	movzbq	%al, %rdx
	cmpq	$0, %rdi
	setge	%al
	movzbq	%al, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	L147
	cmpq	%rdi, %r8
	jbe	L168
	movq	$1, 704(%rbx)
	jmp	L146
	.align	2
L147:
	movq	$0, 704(%rbx)
L146:
	cmpq	$0, %r8
	jle	L145
	cmpq	$0, %r8
	jbe	L168
	movq	$1, 712(%rbx)
	jmp	L144
	.align	2
L145:
	movq	$0, 712(%rbx)
L144:
	cmpq	$5, %r8
	jle	L143
	cmpq	$5, %r8
	jbe	L168
	movq	$1, 720(%rbx)
	jmp	L142
	.align	2
L143:
	movq	$0, 720(%rbx)
L142:
	movq	$1, %rax
	ucomisd	%xmm0, %xmm1
	jp	L169
	je	L141
L169:
	xorq	%rax, %rax
L141:
	movq	%rax, 728(%rbx)
	movq	$1, %rax
	ucomisd	%xmm0, %xmm1
	jp	L140
	jne	L140
	xorq	%rax, %rax
L140:
	movq	%rax, 736(%rbx)
	movq	$1, %rax
	comisd	%xmm1, %xmm0
	ja	L139
	xorq	%rax, %rax
L139:
	movq	%rax, 744(%rbx)
	movq	$1, %rax
	comisd	%xmm0, %xmm1
	ja	L138
	xorq	%rax, %rax
L138:
	movq	%rax, 752(%rbx)
	movq	$1, %rax
	comisd	%xmm1, %xmm0
	jae	L137
	xorq	%rax, %rax
L137:
	movq	%rax, 760(%rbx)
	movq	$1, %rax
	comisd	%xmm0, %xmm1
	jae	L136
	xorq	%rax, %rax
L136:
	movq	%rax, 768(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	ucomisd	%xmm3, %xmm4
	jp	L135
	jne	L135
	movq	$1, %rax
	jmp	L134
	.align	2
L135:
	xorq	%rax, %rax
L134:
	movq	%rax, 776(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	ucomisd	%xmm3, %xmm4
	jp	L170
	je	L133
L170:
	movq	$1, %rax
	jmp	L132
	.align	2
L133:
	xorq	%rax, %rax
L132:
	movq	%rax, 784(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	comisd	%xmm4, %xmm3
	jbe	L131
	movq	$1, %rax
	jmp	L130
	.align	2
L131:
	xorq	%rax, %rax
L130:
	movq	%rax, 792(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	comisd	%xmm3, %xmm4
	jbe	L129
	movq	$1, %rax
	jmp	L128
	.align	2
L129:
	xorq	%rax, %rax
L128:
	movq	%rax, 800(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	comisd	%xmm4, %xmm3
	jb	L127
	movq	$1, %rax
	jmp	L126
	.align	2
L127:
	xorq	%rax, %rax
L126:
	movq	%rax, 808(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	addsd	%xmm2, %xmm4
	comisd	%xmm3, %xmm4
	jb	L125
	movq	$1, %rax
	jmp	L124
	.align	2
L125:
	xorq	%rax, %rax
L124:
	movq	%rax, 816(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	ucomisd	%xmm3, %xmm1
	jp	L123
	jne	L123
	movq	$1, %rax
	jmp	L122
	.align	2
L123:
	xorq	%rax, %rax
L122:
	movq	%rax, 824(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	ucomisd	%xmm3, %xmm1
	jp	L171
	je	L121
L171:
	movq	$1, %rax
	jmp	L120
	.align	2
L121:
	xorq	%rax, %rax
L120:
	movq	%rax, 832(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm1, %xmm3
	jbe	L119
	movq	$1, %rax
	jmp	L118
	.align	2
L119:
	xorq	%rax, %rax
L118:
	movq	%rax, 840(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm3, %xmm1
	jbe	L117
	movq	$1, %rax
	jmp	L116
	.align	2
L117:
	xorq	%rax, %rax
L116:
	movq	%rax, 848(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm1, %xmm3
	jb	L115
	movq	$1, %rax
	jmp	L114
	.align	2
L115:
	xorq	%rax, %rax
L114:
	movq	%rax, 856(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm0, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm3, %xmm1
	jb	L113
	movq	$1, %rax
	jmp	L112
	.align	2
L113:
	xorq	%rax, %rax
L112:
	movq	%rax, 864(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	ucomisd	%xmm0, %xmm3
	jp	L111
	jne	L111
	movq	$1, %rax
	jmp	L110
	.align	2
L111:
	xorq	%rax, %rax
L110:
	movq	%rax, 872(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	ucomisd	%xmm0, %xmm3
	jp	L172
	je	L109
L172:
	movq	$1, %rax
	jmp	L108
	.align	2
L109:
	xorq	%rax, %rax
L108:
	movq	%rax, 880(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm3, %xmm0
	jbe	L107
	movq	$1, %rax
	jmp	L106
	.align	2
L107:
	xorq	%rax, %rax
L106:
	movq	%rax, 888(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm0, %xmm3
	jbe	L105
	movq	$1, %rax
	jmp	L104
	.align	2
L105:
	xorq	%rax, %rax
L104:
	movq	%rax, 896(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm3, %xmm0
	jb	L103
	movq	$1, %rax
	jmp	L102
	.align	2
L103:
	xorq	%rax, %rax
L102:
	movq	%rax, 904(%rbx)
	movsd	L165(%rip), %xmm2
	movapd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	comisd	%xmm0, %xmm3
	jb	L101
	movq	$1, %rax
	jmp	L100
	.align	2
L101:
	xorq	%rax, %rax
L100:
	movq	%rax, 912(%rbx)
	movsd	L165(%rip), %xmm0
	cvtsi2sdq	%rdi, %xmm2
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 160(%rsi)
	movapd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	cvttsd2siq	%xmm2, %rax
	movq	%rax, 920(%rbx)
	movapd	%xmm1, %xmm0
	addsd	_G(%rip), %xmm0
	movsd	%xmm0, 168(%rsi)
	movapd	%xmm1, %xmm0
	addsd	_G(%rip), %xmm0
	movsd	%xmm0, 176(%rsi)
	movapd	%xmm1, %xmm0
	subsd	_G(%rip), %xmm0
	movsd	%xmm0, 184(%rsi)
	movsd	_G(%rip), %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, 192(%rsi)
	movapd	%xmm1, %xmm0
	mulsd	_G(%rip), %xmm0
	movsd	%xmm0, 200(%rsi)
	movapd	%xmm1, %xmm0
	mulsd	_G(%rip), %xmm0
	movsd	%xmm0, 208(%rsi)
	movapd	%xmm1, %xmm0
	divsd	_G(%rip), %xmm0
	movsd	%xmm0, 216(%rsi)
	movsd	_G(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 224(%rsi)
	movsd	L173(%rip), %xmm0
	movapd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm3
	addsd	_G(%rip), %xmm3
	movsd	%xmm3, 232(%rsi)
	movapd	%xmm2, %xmm3
	addsd	_G(%rip), %xmm3
	movsd	%xmm3, 240(%rsi)
	movapd	%xmm2, %xmm3
	subsd	_G(%rip), %xmm3
	movsd	%xmm3, 248(%rsi)
	movsd	_G(%rip), %xmm3
	subsd	%xmm2, %xmm3
	movsd	%xmm3, 256(%rsi)
	movapd	%xmm1, %xmm3
	addsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	mulsd	_G(%rip), %xmm0
	movsd	%xmm0, 264(%rsi)
	mulsd	_G(%rip), %xmm3
	movsd	%xmm3, 272(%rsi)
	movapd	%xmm2, %xmm0
	divsd	_G(%rip), %xmm0
	movsd	%xmm0, 280(%rsi)
	movsd	_G(%rip), %xmm0
	divsd	%xmm2, %xmm0
	movsd	%xmm0, 288(%rsi)
	movapd	%xmm1, %xmm0
	xorpd	_caml_negf_mask(%rip), %xmm0
	movsd	%xmm0, 296(%rsi)
	andpd	_caml_absf_mask(%rip), %xmm1
	movsd	%xmm1, 304(%rsi)
	movq	%rdi, %rax
	imulq	%r8
	movq	%rdx, 928(%rbx)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
L168:
	call	_caml_ml_array_bound_error
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.section __TEXT,__literal8,8byte_literals
L173:
	.quad	0x4000000000000000
L166:
	.quad	0xbff0000000000000
L165:
	.quad	0x3ff0000000000000
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
