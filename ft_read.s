extern ___error
global _ft_read

_ft_read: 
			mov		rax, 0x02000003
			syscall
			jc		error
			ret
error:
			push	r12
			mov		r12, rax
			call	___error
			mov		qword[rax], r12
			mov		rax, -1	
			pop		r12
			ret

