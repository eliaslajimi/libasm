#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

#include <limits.h>
#include <stdio.h>

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

int numRef(void *data, void *dataRef)
{
	int ret = 1;
	*((int*)data) < *((int*)dataRef) ? ret = 0 : (void)ret;
	return (ret);
}

void numFree(void *data)
{
	*((int*)data) = 0;
}

void strctPrint(t_list *list)
{
	while(list)
	{
		fflush(stdout);
		printf("[___%d___]", *((int*)list->data));//to be deleted
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
extern void	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int main()
{
	time_t t;
	srand((unsigned) time(&t));
	int number	= (rand() % 100);
	int number2	= (rand() % 100) * -1;
	int number3	= (rand() % 100) * -1;
	int number4	= (rand() % 100);
	int ref		= (rand() % 100);
	
	t_list *t1; 
	t1 = (t_list*)malloc(sizeof(t_list));


	t1->data = &number;
	t1->next = NULL;
	ft_list_push_front(&t1, &number2);
	ft_list_push_front(&t1, &number3);
	ft_list_push_front(&t1, &number4);

/*bonus*/

/**Testing Push_Front*/
	printf("push:%20s", " ");
	strctPrint(t1);	
	fflush(stdout);

/**Test Swap*/
	printf("swap:%20s", " ");
	ft_list_swap(t1, t1->next);
	strctPrint(t1);	
	fflush(stdout);
	
/**ft_list_sort*/
	ft_list_sort(&t1, numCmp);
	printf("sort:%20s", " ");
	strctPrint(t1);	
	fflush(stdout);

/**ft_list_remove_if*/
	ft_list_remove_if(&t1, &ref, numRef, numFree);
	printf("remove [~<%d]:%11s",ref, " ");
	strctPrint(t1);
	fflush(stdout);

	free(t1);
	return (0);
}
