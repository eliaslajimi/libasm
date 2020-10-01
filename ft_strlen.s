global _ft_strlen

_ft_strlen:	mov rax, 0
txt2:		cmp BYTE[RDI + RAX], 0
			je return
incr:		inc rax
			jmp txt2
return:		ret
