%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.h"

#include "y.tab.h"

#define ENLIST(tkn) {							\
	yylval = new_token(yytext, yyleng, yyspclen, tkn);		\
	yyspclen = 0;							\
	return tkn;							\
}

static int yyspclen;

/* TODO(pboldin): Reuse yystate for that, do need for ->type */
YYSTYPE new_token(const char *text, int l, int sl, int type)
{
	YYSTYPE t;
	
	t = malloc(sizeof(*t) + l + sl + 1);
	if (t == NULL) abort();

	t->length = 1;
	t->lineno = yylineno;
	t->type = type;
	list_init(&t->list);

	strncpy(t->buf, text, l);
	t->txt = t->buf + sl;

	return t;
}
%}

%option yylineno

ALNUM	[A-Za-z0-9_]
ALNUMP	[A-Za-z0-9_.]
DIGIT	[0-9]
ALPHA	[A-Za-z_]
HEX	[0-9A-Fa-f]
SPACE	[ \t]*
REST	[ \t]+[^;\n]*

%%



".section"	ENLIST(DIRECTIVE_SECTION)
".pushsection"	ENLIST(DIRECTIVE_PUSHSECTION)
".popsection"	ENLIST(DIRECTIVE_POPSECTION)
".subsection"	ENLIST(DIRECTIVE_SUBSECTION)
".previous"	ENLIST(DIRECTIVE_PREVIOUS)

\.text{REST}	ENLIST(DIRECTIVE_TEXT)
\.data{REST}	ENLIST(DIRECTIVE_DATA)
\.bss{REST}	ENLIST(DIRECTIVE_BSS)

\.(balign|align|p2align){REST} ENLIST(DIRECTIVE_ALIGN)

".type"		ENLIST(DIRECTIVE_TYPE)
".comm"		ENLIST(DIRECTIVE_COMM)
".weak"		ENLIST(DIRECTIVE_WEAK)
".size"		ENLIST(DIRECTIVE_SIZE)

".globl"	ENLIST(DIRECTIVE_GLOBL)
".local"	ENLIST(DIRECTIVE_LOCAL)
".hidden"	ENLIST(DIRECTIVE_HIDDEN)
".protected"	ENLIST(DIRECTIVE_PROTECTED)
".internal"	ENLIST(DIRECTIVE_INTERNAL)
".set"		ENLIST(DIRECTIVE_SET)

".file"		ENLIST(DIRECTIVE_FILE)
\.loc{REST}	ENLIST(DIRECTIVE_LOC_IGNORED)
\.cfi{REST}	ENLIST(DIRECTIVE_CFI_IGNORED)

\.(ascii|asciz|string|byte|word|short|int|long|quad|single){REST} |
\.(float|double|value|zero|uleb128|sleb128|4byte){REST}	ENLIST(DIRECTIVE_DATA_DEF)

#[^\n]*		ENLIST(COMMENT)

{ALPHA}{ALNUMP}*: { yyleng--; ENLIST(LABEL) }

({DIGIT}+|\.{ALPHA}{ALNUM}*):{SPACE} ENLIST(LLABEL)

\"(\\.|[^\\"])*\"	ENLIST(TOKEN)
[^ \t\n;,]+	ENLIST(TOKEN)	

[ \t]+		{ yyspclen = yyleng; yymore(); }

;	ENLIST(SEMICOLON)
{SPACE}\n	ENLIST(NEWLINE)

,	ENLIST(COMMA)

%%
