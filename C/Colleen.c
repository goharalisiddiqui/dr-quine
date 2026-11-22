/*
	Comment outside program
*/
#include <stdio.h>

void print_source(char *s)
{
	int i;
	int j;
	for (i = 0; s[i]; i++)
	{
		if (s[i] == 64)
		{
			putchar(34);
			for (j = 0; s[j]; j++)
			{
				if (s[j] == 10)
					printf("%cn", 92);
				else if (s[j] == 34 || s[j] == 92)
					printf("%c%c", 92, s[j]);
				else
					putchar(s[j]);
			}
			putchar(34);
		}
		else
			putchar(s[i]);
	}
}

int main(void)
{
	/*
		Comment inside main
	*/
	char *s = "/*\n	Comment outside program\n*/\n#include <stdio.h>\n\nvoid print_source(char *s)\n{\n	int i;\n	int j;\n	for (i = 0; s[i]; i++)\n	{\n		if (s[i] == 64)\n		{\n			putchar(34);\n			for (j = 0; s[j]; j++)\n			{\n				if (s[j] == 10)\n					printf(\"%cn\", 92);\n				else if (s[j] == 34 || s[j] == 92)\n					printf(\"%c%c\", 92, s[j]);\n				else\n					putchar(s[j]);\n			}\n			putchar(34);\n		}\n		else\n			putchar(s[i]);\n	}\n}\n\nint main(void)\n{\n	/*\n		Comment inside main\n	*/\n	char *s = @;\n	print_source(s);\n	return (0);\n}\n";
	print_source(s);
	return (0);
}
