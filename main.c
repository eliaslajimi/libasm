#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

#include <limits.h>
#include <stdio.h>

//===================

int get_base_length(char *base)
{
	int	base_length;
	int	j;

	base_length = 0;
	while (base[base_length])
	{
		if (base[base_length] == '-' || base[base_length] == '+')
			return (0);
		j = base_length + 1;
		while (base[j])
		{
			if (base[base_length] == base[j])
				return (0);
			++j;
		}
		++base_length;
	}
	if (base_length < 2)
		return (0);
	return (base_length);
}

int	check_errors(char *str, char *base)
{
	int	i;
	int	j;
	int	start;

	start = 0;
	while (str[start] != '\0' && (str[start] == ' ' || str[start] == '\t' ||
		str[start] == '\r' || str[start] == '\n' || str[start] == '\v' ||
		str[start] == '\f'))
		start++;
	i = start;
	while (str[i])
	{
		j = 0;
		while (base[j] && (str[i] != base[j] ||
				(str[i] == '-' || str[i] == '+')))
			++j;
		if (str[i] != base[j] && str[i] != '-' && str[i] != '+')
			return (0);
		i++;
	}
	if (i == 0)
		return (0);
	return (1);
}

int	get_nb(char c, char *base)
{
	int	i;

	i = 0;
	while (base[i] && base[i] != c)
		i++;
	return (i);
}

int	ft_atoi_based(char *str, char *base)
{
	int	s;
	int	i;
	int	res;
	int	negative;
	int	base_length;

	if (!(base_length = get_base_length(base)) || !check_errors(str, base))
		return (0);
	s = 0;
	while (str[s] != '\0' && (str[s] == ' ' || str[s] == '\t' || str[s] == '\r'
			|| str[s] == '\n' || str[s] == '\v' || str[s] == '\f'))
		s++;
	i = s - 1;
	res = 0;
	negative = 1;
	while (str[++i] && (((str[i] == '-' || str[i] == '+') && i == s) ||
			(str[i] != '-' && str[i] != '+')))
	{
		if (str[i] == '-')
			negative = -1;
		else if (str[i] != '+')
			res = (res * base_length) + (get_nb(str[i], base));
	}
	return (res * negative);
}
//===================
int write_number(int d)
{
	printf("\nnumber is: __%d__\n", d);
	return (d);
}

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
		printf("[___%d___]", *((int*)list->data));
		list = list->next;
	}
	printf("\n");
}



/*utils*/
extern int	ft_isspace(char c);
extern void	ft_list_swap(t_list *t1, t_list *t2);
extern int	ft_cmp(char a, char b);
extern int	ft_strchr(char *str, char c);
extern int	multi(int a, int b);
/*main*/
extern char	*ft_strjoin(const char *s1, const char *s2);
extern int	ft_strlen (char *str);
extern char	*ft_strcpy(char *dst, const char *src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern size_t	ft_write(int fd, char *s, int byte);
extern size_t	ft_read(int files, void *buf, size_t nbyte);
extern char	*ft_strdup(const char *s1);
/*bonus*/
extern int	ft_list_size(t_list *begin_list);
extern void	ft_list_push_front(t_list **begin_list, void *data);
extern void	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
extern int  ft_atoi_base(char *str, char *base);


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

/**ft_atoi_base*/
	char c = 'i';
	char *str = "1 43+076";
	char *base = "0 123456789";
	printf("atoi_based: __[%d]__\n", ft_atoi_based(str, base));
	printf("atoi_base: __[%d]__", ft_atoi_base(str, base));
/*******/
	free(t1);
	return (0);
}
