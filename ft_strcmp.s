global _ft_strcmp

_ft_strcmp:	
mov		rax, 0 
mov		rcx, -1

incr:		
inc		rcx

iterate:		
cmp		BYTE[rdi + rcx], 0
je		result	
cmp		BYTE[rsi + rcx], 0
je		result	
mov		dh, BYTE[rdi + rcx]	
cmp		dh, BYTE[rsi + rcx]
je		incr

result:
movzx		rdx, BYTE[rdi + rcx]
movzx		rax, BYTE[rsi + rcx]
sub		rax, rdx
neg		rax

return: 	
ret
