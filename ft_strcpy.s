global _ft_strcpy

_ft_strcpy:		xor rax, rax
				jmp txt

incr:			inc rax
				;inc rsi
				;inc rdi

txt:			cmp BYTE[rsi+rax], 0 
				je	O_terminate
				mov bl, BYTE[rsi+rax]
				mov BYTE[rdi+rax], bl 
				jmp incr			

O_terminate:	;inc rax
				mov BYTE[rdi+rax], 0

return:			ret

			
			
