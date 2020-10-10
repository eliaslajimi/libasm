#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

typedef struct	s_list
{
	void *data;
	struct s_list *next;
}	t_list;

int numCmp(void *data, void *data2)
{
	int ret = 0;
	*((int*)data) > *((int*)data2) ? ret = 1 : (void)ret;
	*((int*)data) < *((int*)data2) ? ret = -1 : (void)ret;
	return (ret);
}

void strctPrint(t_list *list)
{
	while(list)
	{
		fflush(stdout);
		printf("[___%d___]", *((int*)list->data));
		list = list->next;
	}
	printf("\n");
}

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
extern int ft_list_sort(t_list **begin_list, int (*cmp)());

int main()
{
	int number = 101;
	int number2 = 21;
	int number3 = 51;
	int number4 = 40;
	
	t_list *t1, *t2;
	t1 = (t_list*)malloc(sizeof(t_list));
	t2 = (t_list*)malloc(sizeof(t_list));


	t1->data = &number;
	t1->next = NULL;
	ft_list_push_front(&t1, &number2);
	ft_list_push_front(&t1, &number3);
	ft_list_push_front(&t1, &number4);

/*Testing Push_Front*/
	printf("push:%8s", " ");
	strctPrint(t1);	
	fflush(stdout);

/*Test Swap*/
	printf("swap:%8s", " ");
	ft_list_swap(t1, t1->next);
	ft_list_swap(t1->next->next, t1);
	strctPrint(t1);	
	fflush(stdout);
	
/*ft_list_sort*/
	ft_list_sort(&t1, numCmp);
	printf("sort:%8s", " ");
	strctPrint(t1);	
	fflush(stdout);

	free(t1);
	free(t2);
	return (0);
}
