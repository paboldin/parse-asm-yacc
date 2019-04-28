%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.h"
#include "document.h"

#include "y.tab.h"

token_t *new_token(int type, yyscan_t scanner, document_t *document);
#define ENLIST(tkn) {							\
	yylval->token = new_token(tkn, yyscanner, document);		\
	document->spclen = 0;						\
	return tkn;							\
}

/* TODO(pboldin): Reuse yystate for that, do need for ->type */
%}

%option yylineno
%option reentrant
%option header-file="flex.h"

ALNUM	[A-Za-z0-9_]
ALNUMP	[A-Za-z0-9_.]
DIGIT	[0-9]
ALPHA	[A-Za-z_]
HEX	[0-9A-Fa-f]
SPACE	[ \t]*
REST	[ \t]+[^;\n]*
RESTORNOT	[^;\n]*

%%



".section"	ENLIST(DIRECTIVE_SECTION)
".pushsection"	ENLIST(DIRECTIVE_PUSHSECTION)
".popsection"	ENLIST(DIRECTIVE_POPSECTION)
".subsection"	ENLIST(DIRECTIVE_SUBSECTION)
".previous"	ENLIST(DIRECTIVE_PREVIOUS)

".text"		ENLIST(DIRECTIVE_TEXT)
".data"		ENLIST(DIRECTIVE_DATA)
".bss"		ENLIST(DIRECTIVE_BSS)

\.(balign|align|p2align) ENLIST(DIRECTIVE_ALIGN)

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
".ident"	ENLIST(DIRECTIVE_IDENT)

".file"		ENLIST(DIRECTIVE_FILE)
\.loc{REST}		ENLIST(DIRECTIVE_LOC_IGNORED)
\.cfi{RESTORNOT}	ENLIST(DIRECTIVE_CFI_IGNORED)

\.(byte|word|short|int|long|quad|single){REST} |
\.(float|double|value|zero|uleb128|sleb128|4byte){REST}	ENLIST(DIRECTIVE_DATA_DEF)

\.(ascii|asciz|string)	ENLIST(DIRECTIVE_STRING)

^#[^\n]*		ENLIST(COMMENT)

\.?{ALPHA}{ALNUMP}*: { yyleng--; ENLIST(LABEL) }

{DIGIT}+: { yyleng--; ENLIST(LLABEL) }


\"(\\.|[^\\"])*\"	|
"["			|
"]"			|
[^ \[\]\t\n;,]+		ENLIST(TOKEN)


[ \t]+		{ document->spclen = yyleng; yymore(); }

;	ENLIST(SEMICOLON)
{SPACE}\n	ENLIST(NEWLINE)

,	ENLIST(COMMA)

%%

token_t *new_token(int type, yyscan_t scanner, document_t *document)
{
	token_t *t;
	const char *text = yyget_text(scanner);
	int lineno = yyget_lineno(scanner);
	int l = yyget_leng(scanner);
	int sl = document->spclen;

	t = malloc(sizeof(*t) + l + sl + 2);
	if (t == NULL) abort();

	t->lineno = lineno;
	t->type = type;
	list_init(&t->list);
	list_init(&t->siblings);

	list_append(&document->tokens, &t->list);
	link_token(document, t);

	t->buf[l] = '\0';
	strncpy(t->buf, text, l);
	t->txt = t->buf + sl;
	t->offset = document->offset;
	t->length = l;

	document->offset += l;

	return t;
}
