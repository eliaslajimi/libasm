global _ft_list_sort

_ft_list_sort:
	mov		rdx, -8	;pointer iterator
_inc:
	add		rdx, 8
_swap:
	mov		r13, QWORD [rdi] ;struct
	cmp		r13, 0
	je		_order
	mov		r14, QWORD [rdi+rdx];from pointer to pointer

	pop		r13
	pop		r14
	ret
