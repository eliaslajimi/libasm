#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

typedef struct	s_list
{
	void *data;
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


int main()
{
	t_list *t1, *t2, *t3;
	t1 = (t_list*)malloc(sizeof(t_list));
	t2 = (t_list*)malloc(sizeof(t_list));
	t3 = (t_list*)malloc(sizeof(t_list));
	t1->next = t2;	
	t2->next = t3;	
	t3->next = NULL;	
	printf("__%d__\n", ft_lstsize(t1));	
	printf("__%d__\n", ft_list_size(t1));	
	free(t1);
	free(t2);
	free(t3);
	return (0);
}
