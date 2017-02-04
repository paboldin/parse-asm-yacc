%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.h"

#include "y.tab.h"

#define ENLIST(tkn) {				\
	yylval = enlist_token(yytext, tkn);	\
	return tkn;				\
}


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

%option yylineno

ALNUM	[A-Za-z0-9_]
DIGIT	[0-9]
ALPHA	[A-Za-z_]
HEX	[0-9A-Fa-f]
SPACE	[ \t]*

%%



".section"	ENLIST(DIR_SECTION)
".pushsection"	ENLIST(DIR_PUSHSECTION)
".popsection"	ENLIST(DIR_POPSECTION)
".subsection"	ENLIST(DIR_SUBSECTION)
".previous"	ENLIST(DIR_PREVIOUS)

".text"		ENLIST(DIR_TEXT)
".data"		ENLIST(DIR_DATA)
".bss"		ENLIST(DIR_BSS)

".align"	ENLIST(DIR_ALIGN)
".type"		ENLIST(DIR_TYPE)
".comm"		ENLIST(DIR_COMM)
".weak"		ENLIST(DIR_WEAK)
".size"		ENLIST(DIR_SIZE)

".globl"	ENLIST(DIR_GLOBL)
".local"	ENLIST(DIR_LOCAL)
".hidden"	ENLIST(DIR_HIDDEN)
".protected"	ENLIST(DIR_PROTECTED)
".internal"	ENLIST(DIR_INTERNAL)
".set"		ENLIST(DIR_SET)

".file"		ENLIST(DIR_FILE)
".loc"		ENLIST(DIR_LOC)
.cfi[^;\n]*	ENLIST(DIR_CFI_IGNORED)

{ALPHA}{ALNUM}*:{SPACE} ENLIST(LABEL)

({DIGIT}+|\.{ALPHA}{ALNUM}*):{SPACE} ENLIST(LLABEL)

\"(\\.|[^\\"])*\"	ENLIST(TOKEN)
[^ \t\n;,]+	ENLIST(TOKEN)	

[ \t]+		ENLIST(SPACE)

;{SPACE}|{SPACE}\n	ENLIST(NEWLINE_OR_SEMICOLON)

,{SPACE}	ENLIST(COMMA)

%%
