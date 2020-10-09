#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

typedef struct	s_list
{
	int *data;
	struct s_list *next;
}	t_list;

int		ft_lstsize(t_list *begin_list)
{
	int		count;

	count = 0;
	while (begin_list)
	{
		count++;
		begin_list = begin_list->next;
	}
	return (count);
}

extern int	ft_strlen (char *str);
extern char	*ft_strcpy(char *dst, const char *src); 
extern int	ft_strcmp(const char *s1, const char *s2);
extern size_t	ft_write(int fd, char *s, int byte);
extern size_t	ft_read(int files, void *buf, size_t nbyte); 
extern char	*ft_strdup(const char *s1);
extern char	*ft_strjoin(const char *s1, const char *s2);
extern int	ft_list_size(t_list *begin_list);
extern t_list	*ft_list_push_front(t_list **begin_list, int *data);


int main()
{
	int pinter = 30;
	t_list *t1, *t2, *t3, *t4;
	t1 = (t_list*)malloc(sizeof(t_list));
	t2 = (t_list*)malloc(sizeof(t_list));
	t1->next = t2;	
	*t1->data = 59;

	t3 = ft_list_push_front(&t1, &pinter);
	printf("___%d___", *t3->data);
	//t4 = t3->next;	
	//printf("___%d___", t4->data);
	free(t1);
	free(t2);
	return (0);
	//free(t3);
}
