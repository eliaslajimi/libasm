;;==list_swap==
;;typedef struct s_list
;;{
;;void *data;
;;struct s_list *next;
;;} t_list;
;;
;;Recieves t_list A and B, swaps them.
;;============


global _ft_list_swap

_ft_list_swap:
	
	mov r11, [rsi]
	mov r10, [rdi]

	mov [rdi], r11
	mov [rsi], r10

	ret
