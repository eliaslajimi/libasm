global _ft_list_size

_ft_list_size:

	mov	rax, 0

_iterate:	
	cmp	rdi, 0
	je	_result	
	inc	eax
	mov	rdi, QWORD [rdi + 8]
	jmp	_iterate

_result:
	ret

