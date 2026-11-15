/*
	This comment is outside the program.
*/
#include <stdio.h>

void print_source(char *s)
{
	printf(s, 10, 34, s);
}

int main(void)
{
	/*
		This comment is inside the main function.
	*/
	char *s = "/*%1$c	This comment is outside the program.%1$c*/%1$c#include <stdio.h>%1$c%1$cvoid print_source(char *s)%1$c{%1$c	printf(s, 10, 34, s);%1$c}%1$c%1$cint main(void)%1$c{%1$c	/*%1$c		This comment is inside the main function.%1$c	*/%1$c	char *s = %2$c%3$s%2$c;%1$c	print_source(s);%1$c	return (0);%1$c}%1$c";
	print_source(s);
	return (0);
}
