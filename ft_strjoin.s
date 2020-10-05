global	_ft_strjoin
extern	_ft_strlen 
extern	_ft_strcpy
extern	_malloc

_ft_strjoin:
	push	rdi
	xor	r15, r15
	xor	r14, r14
	xor	r13, r13
	mov	r15, rsi
	call	_ft_strlen
	mov	r14, rax
	mov	rdi, rsi
	call	_ft_strlen
	inc	rax
	add	rax, r14
	mov	r13, rax
	mov	rdi, rax	
	call	_malloc
	cmp	rax, 0
	je	_error
	pop	rsi	
	mov	rdi, rax	
	mov	rax, r14
	call	_ft_strcpy

_iterate:
	mov	r8b, BYTE[r15]
	mov	BYTE[rax + r14], r8b
	inc	r14
	inc	r15
	cmp	r14, r13
	jl	_iterate
	ret

_error:
	pop rdi
	ret
