global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup: 
	xor	rax, rax
	xor	rsi, rsi 
	cmp	rdi, 0
	je	_return
	push	rdi 
	call	_ft_strlen
	inc	rax
	mov 	rdi, rax
	call	_malloc
	cmp	rax, 0
	je  	error
	pop 	rsi
	mov 	rdi, rax
	;mov 	rcx, rdi
	;mov 	rdi, rax
	;mov 	rsi, rcx
	call	_ft_strcpy
	ret		
error:
	pop	rdi
	mov	rax, -1
_return:
	ret

