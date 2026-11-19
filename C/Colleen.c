/*
	Comment outside program
*/
#include <stdio.h>

const char *s[] = {
	"/*",
	"	Comment outside program",
	"*/",
	"#include <stdio.h>",
	"",
	"const char *s[] = {",
	"};",
	"",
	"void print_source(void)",
	"{",
	"	int i;",
	"	for (i = 0; i < 6; i++)",
	"		puts(s[i]);",
	"	for (i = 0; i < 34; i++)",
	"	{",
	"		putchar(9);",
	"		putchar(34);",
	"		fputs(s[i], stdout);",
	"		putchar(34);",
	"		putchar(44);",
	"		putchar(10);",
	"	}",
	"	for (i = 6; i < 34; i++)",
	"		puts(s[i]);",
	"}",
	"",
	"int main(void)",
	"{",
	"	/*",
	"		Comment inside main",
	"	*/",
	"	print_source();",
	"	return (0);",
	"}",
};

void print_source(void)
{
	int i;
	for (i = 0; i < 6; i++)
		puts(s[i]);
	for (i = 0; i < 34; i++)
	{
		putchar(9);
		putchar(34);
		fputs(s[i], stdout);
		putchar(34);
		putchar(44);
		putchar(10);
	}
	for (i = 6; i < 34; i++)
		puts(s[i]);
}

int main(void)
{
	/*
		Comment inside main
	*/
	print_source();
	return (0);
}
