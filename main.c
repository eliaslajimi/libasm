#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

typedef struct	s_list
{
	void *data;
	struct s_list *next;
}	t_list;

extern int	ft_strlen (char *str);
extern char	*ft_strcpy(char *dst, const char *src); 
extern int	ft_strcmp(const char *s1, const char *s2);
extern size_t	ft_write(int fd, char *s, int byte);
extern size_t	ft_read(int files, void *buf, size_t nbyte); 
extern char	*ft_strdup(const char *s1);
extern char	*ft_strjoin(const char *s1, const char *s2);
extern int	ft_list_size(t_list *begin_list);
extern void	ft_list_push_front(t_list **begin_list, void *data);
extern void	ft_list_swap(t_list *t1, t_list *t2);

int main()
{
	int number = 30;
	int number2 = 40;
	int number3 = 50;
	int number4 = 60;
	
	t_list *t1, *t2, *t3;
	t_list *test, *test2;
	t1 = (t_list*)malloc(sizeof(t_list));
	t2 = (t_list*)malloc(sizeof(t_list));
	t3 = (t_list*)malloc(sizeof(t_list));


//Testing Push_Front
	t1->data = &number;
	t1->next = NULL;
	ft_list_push_front(&t1, &number2);
	ft_list_push_front(&t1, &number3);
	ft_list_push_front(&t1, &number4);
	test = t1;

	printf("push_front:");
	while(test)
	{
		fflush(stdout);
		printf("___%d___", *((int*)test->data));
		test = test->next;
	}
	printf("\n");	

//Test Swap
	test = t1;
	test2 = t1->next;
	printf("swap:");
	fflush(stdout);
	printf("t1:___%d___", *((int*)test->data));
	printf("t2:___%d___\n", *((int*)test2->data));
	fflush(stdout);
	ft_list_swap(test, test2);
	printf("t1:___%d___", *((int*)test->data));
	printf("t2:___%d___", *((int*)test2->data));

	printf("\n");	
	
	

	free(t1);
	free(t2);
	free(t3);
	return (0);
}
