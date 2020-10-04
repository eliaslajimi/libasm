global	_ft_strjoin
extern	_ft_strlen 
extern	_ft_strcpy
extern	_malloc

_ft_strjoin:
	push	rax			
	mov	rax,	0
	push	rbp
	push	rcx
	mov	rbp, rsi
	xor	rdx, rdx
	xor	r8, r8
	mov 	rcx, 0
	mov	r11, 0 
	push	r13	     
	push	rdi	     
	call	_ft_strlen   
	mov	r13, rax
	mov	rdi, rsi
	call	_ft_strlen   
	add	rax, r13
	inc	rax
	mov	r8, rax
	mov	rdi, rax
	call	_malloc

fill_malloc:
	pop	rdi	     
	push	rsi	     
	mov	rsi, rdi
	mov	rdi, rax     
	pop	rax	     
	call	_ft_strcpy
	mov	rdi, rax
	mov	rdx, r13
	mov	r10, 0 
	pop	rsi	     

iterate:
	mov	ch, BYTE[rbp]
	mov	BYTE[rdi + rdx], ch
	inc	rdx
	inc	rbp
	cmp	rdx, r8	
	jne	iterate	
	mov	BYTE[rdi + rdx], 0
	pop r13		
	pop rbp
	pop rcx
	ret
