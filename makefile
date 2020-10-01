all: 
	nasm -f macho64 ft_strdup.s
	nasm -f macho64 ft_strcpy.s
	nasm -f macho64 ft_strlen.s
	nasm -f macho64 ft_write.s
	nasm -f macho64 ft_read.s
	nasm -f macho64 ft_strcmp.s
	ar -rcs libasm.a *.o
	#gcc main.c *.o -o debug
fclean:
	rm -rf *.o
	rm *.a

