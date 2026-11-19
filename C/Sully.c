int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *s[] = {
	"int i = 5;",
	"#include <stdio.h>",
	"#include <stdlib.h>",
	"#include <string.h>",
	"",
	"const char *s[] = {",
	"};",
	"",
	"int main(void)",
	"{",
	"	char *b = strrchr(__FILE__, 47);",
	"	b = b ? b + 1 : (char *)__FILE__;",
	"	if (strncmp(b, (char[]){83,117,108,108,121,95,0}, 6) == 0)",
	"		i--;",
	"	if (i < 0)",
	"		return (0);",
	"	char fn[64];",
	"	char cmd[256];",
	"	snprintf(fn, sizeof(fn), (char[]){83,117,108,108,121,95,37,100,46,99,0}, i);",
	"	FILE *f = fopen(fn, (char[]){119,0});",
	"	if (!f)",
	"		return (1);",
	"	int j;",
	"	fprintf(f, (char[]){105,110,116,32,105,32,61,32,37,100,59,10,0}, i);",
	"	for (j = 1; j < 6; j++)",
	"	{",
	"		fputs(s[j], f);",
	"		fputc(10, f);",
	"	}",
	"	for (j = 0; j < 54; j++)",
	"	{",
	"		fputc(9, f);",
	"		fputc(34, f);",
	"		fputs(s[j], f);",
	"		fputc(34, f);",
	"		fputc(44, f);",
	"		fputc(10, f);",
	"	}",
	"	for (j = 6; j < 54; j++)",
	"	{",
	"		fputs(s[j], f);",
	"		fputc(10, f);",
	"	}",
	"	fclose(f);",
	"	char *cc = system((char[]){119,104,105,99,104,32,99,108,97,110,103,32,62,47,100,101,118,47,110,117,108,108,32,50,62,38,49,0}) == 0 ? (char[]){99,108,97,110,103,0} : (char[]){103,99,99,0};",
	"	snprintf(cmd, sizeof(cmd), (char[]){37,115,32,45,87,97,108,108,32,45,87,101,120,116,114,97,32,45,87,101,114,114,111,114,32,45,111,32,83,117,108,108,121,95,37,100,32,83,117,108,108,121,95,37,100,46,99,0}, cc, i, i);",
	"	system(cmd);",
	"	if (i > 0)",
	"	{",
	"		snprintf(cmd, sizeof(cmd), (char[]){46,47,83,117,108,108,121,95,37,100,0}, i);",
	"		system(cmd);",
	"	}",
	"	return (0);",
	"}",
};

int main(void)
{
	char *b = strrchr(__FILE__, 47);
	b = b ? b + 1 : (char *)__FILE__;
	if (strncmp(b, (char[]){83,117,108,108,121,95,0}, 6) == 0)
		i--;
	if (i < 0)
		return (0);
	char fn[64];
	char cmd[256];
	snprintf(fn, sizeof(fn), (char[]){83,117,108,108,121,95,37,100,46,99,0}, i);
	FILE *f = fopen(fn, (char[]){119,0});
	if (!f)
		return (1);
	int j;
	fprintf(f, (char[]){105,110,116,32,105,32,61,32,37,100,59,10,0}, i);
	for (j = 1; j < 6; j++)
	{
		fputs(s[j], f);
		fputc(10, f);
	}
	for (j = 0; j < 54; j++)
	{
		fputc(9, f);
		fputc(34, f);
		fputs(s[j], f);
		fputc(34, f);
		fputc(44, f);
		fputc(10, f);
	}
	for (j = 6; j < 54; j++)
	{
		fputs(s[j], f);
		fputc(10, f);
	}
	fclose(f);
	char *cc = system((char[]){119,104,105,99,104,32,99,108,97,110,103,32,62,47,100,101,118,47,110,117,108,108,32,50,62,38,49,0}) == 0 ? (char[]){99,108,97,110,103,0} : (char[]){103,99,99,0};
	snprintf(cmd, sizeof(cmd), (char[]){37,115,32,45,87,97,108,108,32,45,87,101,120,116,114,97,32,45,87,101,114,114,111,114,32,45,111,32,83,117,108,108,121,95,37,100,32,83,117,108,108,121,95,37,100,46,99,0}, cc, i, i);
	system(cmd);
	if (i > 0)
	{
		snprintf(cmd, sizeof(cmd), (char[]){46,47,83,117,108,108,121,95,37,100,0}, i);
		system(cmd);
	}
	return (0);
}
