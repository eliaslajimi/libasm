all: 
	nasm  -f macho64 ft_strdup.s
	nasm  -f macho64 ft_strcpy.s
	nasm  -f macho64 ft_strlen.s
	nasm  -f macho64 ft_write.s
	nasm  -f macho64 ft_read.s
	nasm  -f macho64 ft_strcmp.s
	nasm  -f macho64 ft_strjoin.s
	nasm  -f macho64 ft_list_size.s
	nasm  -f macho64 ft_list_push_front.s
	nasm  -f macho64 ft_list_swap.s
	nasm  -f macho64 ft_list_sort.s
	ar -rcs libasm.a *.o
	gcc -g main.c *.o -o debug
fclean:
	rm -rf *.o
	rm *.a
	rm debug
