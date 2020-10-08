global _ft_list_sort

_ft_list_sort:
	push	r13
	push	r14
	mov		rdx, - 8				;pointer iterator
_inc:
	add		rdx, 8 
_iter:
	mov		r13, QWORD [rdi + rdx]	;moving struct to register 
	cmp		r13, 0
	je		_order					;call to order function
	mov		r14, QWORD [rdi - 8]	;load void data in r14
	


_order:

	pop		r13
	pop		r14
	ret
