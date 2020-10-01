global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy
_ft_strdup: 
			call _ft_strlen
			push rdi 
			mov rdi, rax
			call _malloc
			pop rdi
			mov rcx, rdi
			mov rdi, rax
			mov rsi, rcx
			call _ft_strcpy
		
_return:	ret			
