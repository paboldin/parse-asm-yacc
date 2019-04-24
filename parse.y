%code requires {
#include "list.h"
#include "parse.h"
#include "document.h"
}
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <elf.h>

#include "list.h"
#include "parse.h"
#include "document.h"

YY_DECL;

extern FILE* yyin;

static const char *const yytname[];
const char * const *token_name = yytname;

extern int yylineno;
void yyerror(document_t *document, const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

#define STATEMENT_NEW(tkn)					\
do {								\
	yyval.statement = statement_new(document, tkn,		\
					yychar != YYEMPTY ?	\
					yylval.token : NULL);	\
} while (0)

#define SETSECTION(name)		setsection(document, (name))
#define SETSECTIONWITHARGS(name, args)	setsectionwithargs(document, (name), (args))
#define PREVIOUSSECTION()		previoussection(document)
#define POPSECTION()			popsection(document)
#define	SYMBOL_ADD_STATEMENT(stmt)	symbol_add_statement(document, (stmt))
#define	SECTION_ADD_STATEMENT(stmt)	section_add_statement(document, (stmt))

%}

%union {
	token_t *token;
	statement_t *statement;
	struct section_args section_args;
}

%token <token> LABEL LLABEL TOKEN SPACE NEWLINE SEMICOLON COMMA

%token <token> DIRECTIVE_SECTION DIRECTIVE_PUSHSECTION DIRECTIVE_POPSECTION
%token <token> DIRECTIVE_SUBSECTION DIRECTIVE_PREVIOUS DIRECTIVE_TEXT DIRECTIVE_DATA
%token <token> DIRECTIVE_BSS DIRECTIVE_ALIGN DIRECTIVE_TYPE DIRECTIVE_COMM
%token <token> DIRECTIVE_WEAK DIRECTIVE_SIZE DIRECTIVE_GLOBL DIRECTIVE_LOCAL
%token <token> DIRECTIVE_HIDDEN DIRECTIVE_PROTECTED DIRECTIVE_INTERNAL DIRECTIVE_SET
%token <token> DIRECTIVE_FILE DIRECTIVE_LOC_IGNORED DIRECTIVE_CFI_IGNORED
%token <token> DIRECTIVE_DATA_DEF DIRECTIVE_STRING DIRECTIVE_IDENT

%token <token> COMMENT

%type <token> tokens_comma tokens_space tokens file_directive
%type <token> directive_section directive_sections section_directive symbol_directive
%type <token> symbol_directive_or_tokens labels_tokens label
%type <token> semicolons_or_comment_or_newline comment_or_newline semicolons

%type <section_args> section_args

%type <statement> labels statement_without_label statement_maybe_labels
%type <statement> statement statements aux_directive

%start file

%param {document_t *document}



%%

/* NOTE(pboldin): always use LEFT RECURSION or things will break up */

tokens_comma:
		tokens_comma COMMA TOKEN
	|	TOKEN
	;

tokens_space:
		tokens_space TOKEN
	|	TOKEN
	;

tokens:
		tokens COMMA TOKEN
	|	tokens TOKEN
	|	TOKEN
	;

section_args:
		%empty { memset(&$$, 0, sizeof($$)); }
	|	COMMA TOKEN[flags] COMMA TOKEN[type] COMMA TOKEN[arguments] {
			$$.flags = $flags;
			$$.type = $type;
			$$.arguments = $arguments;
		}
	|	COMMA TOKEN[flags] COMMA TOKEN[type] {
			$$.flags = $flags;
			$$.type = $type;
			$$.arguments = NULL;
		}
	|	COMMA TOKEN[flags] {
			$$.flags = $flags;
			$$.type = NULL;
			$$.arguments = NULL;
		}
	;

directive_section:
		DIRECTIVE_SECTION TOKEN[name] section_args {
			SETSECTIONWITHARGS($name->txt, $section_args);
		}
	|	DIRECTIVE_PUSHSECTION TOKEN[name] section_args {
			SETSECTIONWITHARGS($name->txt, $section_args);
		}
	;

directive_sections:
		directive_section
	|	DIRECTIVE_TEXT { SETSECTION(".text"); }
	|	DIRECTIVE_DATA { SETSECTION(".data"); }
	|	DIRECTIVE_BSS  { SETSECTION(".bss"); }
	|	DIRECTIVE_SUBSECTION TOKEN {
			YYERROR;
		}
	|	DIRECTIVE_PREVIOUS { PREVIOUSSECTION(); }
	|	DIRECTIVE_POPSECTION	{ POPSECTION(); }
	;

file_directive:
		DIRECTIVE_IDENT TOKEN
	;

section_directive:
		DIRECTIVE_FILE tokens_space
	|	directive_sections
	|	DIRECTIVE_ALIGN TOKEN
	;

symbol_directive:
		DIRECTIVE_DATA_DEF
	|	DIRECTIVE_STRING TOKEN
	|	DIRECTIVE_CFI_IGNORED
	|	DIRECTIVE_LOC_IGNORED
	;

aux_directive:
		DIRECTIVE_WEAK	TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolweak(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_GLOBL TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolglobl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_LOCAL TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolglobl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_HIDDEN TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolhidden(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_PROTECTED TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolprotected(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_INTERNAL TOKEN[symbol] {
			STATEMENT_NEW($1);
			setsymbolinternal(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_TYPE[directive] TOKEN[symbol] COMMA TOKEN[type] {
			STATEMENT_NEW($1);
			setsymboltype(document, $symbol->txt, $$, $type);
		}
	|	DIRECTIVE_SIZE TOKEN[symbol] COMMA TOKEN {
			STATEMENT_NEW($1);
			setsymbolsize(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_COMM TOKEN[symbol] COMMA tokens_comma {
			STATEMENT_NEW($1);
			setsymbolcomm(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_SET TOKEN[symbol] COMMA tokens {
			STATEMENT_NEW($1);
			setsymbolset(document, $symbol->txt, $$);
		}
	;


label:
		LABEL
	|	LLABEL
	;

symbol_directive_or_tokens:
		symbol_directive
	|	tokens
	;

statement_without_label:
		symbol_directive_or_tokens {
			STATEMENT_NEW($1);
			SYMBOL_ADD_STATEMENT($$);
		}
	|	section_directive {
			STATEMENT_NEW($1);
			SECTION_ADD_STATEMENT($$);
		}
	|	file_directive {
			STATEMENT_NEW($1);
		}
	|	aux_directive
	;

labels_tokens:
		labels_tokens label
	|	label
	;

labels:
		labels_tokens {
			STATEMENT_NEW($1);
			setsymbollabel(document,
				statement_last_token($$)->txt,
				$$);
		}
	;

statement_maybe_labels:
		statement_without_label
	|	labels statement_without_label
	|	labels
	;

statement:
		statement_maybe_labels;

semicolons:
		SEMICOLON
	|	semicolons SEMICOLON
	;

/* Only use LEFT RECURSION HERE, as `statement`s are linked on creation */
statements:
		statements[head] semicolons statement
	|	statement
	;

comment_or_newline:
		COMMENT
	|	NEWLINE
	|	COMMENT NEWLINE
	;

semicolons_or_comment_or_newline:
		semicolons comment_or_newline
	|	comment_or_newline
	;

line:
		statements semicolons_or_comment_or_newline
	|	semicolons_or_comment_or_newline {}
	;

lines:
		lines line {}
	|	line
	;

file:
		lines {
			SETSECTION(NULL);
		}
	;

%%
