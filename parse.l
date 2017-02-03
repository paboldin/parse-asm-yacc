%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.h"

#include "y.tab.h"

YYSTYPE enlist_token(const char *text, int type)
{
	size_t s;
	YYSTYPE t;
	
	s = strlen(text);
	t = malloc(sizeof(*t) + s + 1);
	if (t == NULL) abort();

	t->type = type;
	strcpy(t->txt, text);
	t->prev = t->next = t;

	return t;
}
%}

ALNUM	[A-Za-z0-9_]
DIGIT	[0-9]
ALPHA	[A-Za-z_]
HEX	[0-9A-Fa-f]

%%

{ALPHA}{ALNUM}*: {
	yytext[yyleng - 1] = 0;
	yylval = enlist_token(yytext, LABEL);
	return LABEL;
}

({DIGIT}+|\.{ALPHA}{ALNUM}*): {
	yytext[yyleng - 1] = 0;
	yylval = enlist_token(yytext, LLABEL);
	return LLABEL;
}

".section"	return DIR_SECTION;
".pushsection"	return DIR_PUSHSECTION;
".subsection"	return DIR_SUBSECTION;
".size"		return DIR_SIZE;
".text"		return DIR_TEXT;
".data"		return DIR_DATA;
".file"		return DIR_FILE;

[^ \t\n;,]+ {
	yylval = enlist_token(yytext, TOKEN);
	return TOKEN;
}

" "|"\t"	;

;[ \t\n]*	{
	yylval = enlist_token(yytext, SEMICOLON);
	return SEMICOLON;
}

,[ \t\n]*	{
	yylval = enlist_token(yytext, DELIM);
	return DELIM;
}

%%
