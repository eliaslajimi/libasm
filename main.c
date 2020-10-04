#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
extern int	ft_strlen (char *str);
extern char	*ft_strcpy(char *dst, const char *src); 
extern int	ft_strcmp(const char *s1, const char *s2);
extern size_t	ft_write(int fd, char *s, int byte);
extern size_t	ft_read(int files, void *buf, size_t nbyte); 
extern char	*ft_strdup(const char *s1);
extern char	*ft_strjoin(const char *s1, const char *s2);

int main()
{
//	char *s1 = "Hello World";
//	char *s2 = ft_strdup(s1);
//	printf("%s", s2);
	char *s1 = "Hello World";
	char *s2 = "test";
	printf("_%s_", ft_strjoin(s1, s2));
	return (0);
}
