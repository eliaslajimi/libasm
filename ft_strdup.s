global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup: 
			xor		rax, rax
			call	_ft_strlen
			push	rdi 
			mov 	rdi, rax
			inc		rdi
			call	_malloc
			jc		error
			mov		BYTE[rax], 0
			pop		rdi
			mov		rcx, rdi
			mov		rdi, rax
			mov		rsi, rcx
			call	_ft_strcpy

_return:	ret			

error:
			push	r12	
			mov		r12, rax
			mov		qword[rax], r12
			mov		rax, -1
			ret
isNull:
			ret
