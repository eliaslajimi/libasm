global _ft_list_size

;;Need to find a viable way to tell
;;the size of my pointer to be able to 
;;move to the next if it doesnt point
;;to a structure

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

