all: 
	nasm -g -f macho64 ft_strdup.s
	nasm -g -f macho64 ft_strcpy.s
	nasm -g -f macho64 ft_strlen.s
	nasm -g -f macho64 ft_write.s
	nasm -g -f macho64 ft_read.s
	nasm -g -f macho64 ft_strcmp.s
	nasm -g -f macho64 ft_strjoin.s
	ar -rcs libasm.a *.o
	gcc -g main.c *.o -o debug
fclean:
	rm -rf *.o
	rm *.a

