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
#include "y.tab.h"
#include "document.h"
#include "flex.h"

YY_DECL;

extern FILE* yyin;

static const char *const yytname[];
const char * const *token_name = yytname;

void yyerror(yyscan_t yyscanner, document_t *document, const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yyget_lineno(yyscanner), msg);
}

#define STATEMENT_NEW(tkn)					\
do {								\
	yyval.statement = statement_new(document, tkn,		\
					yychar != YYEMPTY ?	\
					yylval.token : NULL);	\
} while (0)

#define SETSECTION(name)		document_set_section(document, (name))
#define SETSECTIONWITHARGS(name, args)	document_set_section_with_args(document, (name), (args))
#define PREVIOUSSECTION()		document_previous_section(document)
#define POPSECTION()			document_pop_section(document)
#define	SYMBOL_ADD_STATEMENT(stmt)	document_symbol_add_statement(document, (stmt))
#define	SECTION_ADD_STATEMENT(stmt)	document_section_add_statement(document, (stmt))

%}

%define api.pure full

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

%type <token> tokens_comma tokens_space tokens
%type <token> file_part_directive
%type <token> change_section_directive section_part_directive symbol_part_directive
%type <token> symbol_directive_or_tokens labels_tokens label

%type <section_args> section_args

%type <statement> labels statement_without_label statement_maybe_labels
%type <statement> statement statements symbol_info_directive

%start file

%param {yyscan_t yyscanner}
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

change_section_directive:
		DIRECTIVE_TEXT { SETSECTION(".text"); }
	|	DIRECTIVE_DATA { SETSECTION(".data"); }
	|	DIRECTIVE_BSS  { SETSECTION(".bss"); }
	|	DIRECTIVE_SECTION TOKEN[name] section_args {
			SETSECTIONWITHARGS($name->txt, $section_args);
		}
	|	DIRECTIVE_PUSHSECTION TOKEN[name] section_args {
			SETSECTIONWITHARGS($name->txt, $section_args);
		}
	|	DIRECTIVE_SUBSECTION TOKEN {
			YYERROR;
		}
	|	DIRECTIVE_PREVIOUS { PREVIOUSSECTION(); }
	|	DIRECTIVE_POPSECTION	{ POPSECTION(); }
	;

file_part_directive:
		DIRECTIVE_IDENT TOKEN
	;

section_part_directive:
		DIRECTIVE_FILE tokens_space
	|	change_section_directive
	|	DIRECTIVE_ALIGN TOKEN
	;

symbol_part_directive:
		DIRECTIVE_DATA_DEF
	|	DIRECTIVE_STRING TOKEN
	|	DIRECTIVE_CFI_IGNORED
	|	DIRECTIVE_LOC_IGNORED
	;

symbol_info_directive:
		DIRECTIVE_WEAK	TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_weak(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_GLOBL TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_globl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_LOCAL TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_globl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_HIDDEN TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_hidden(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_PROTECTED TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_protected(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_INTERNAL TOKEN[symbol] {
			STATEMENT_NEW($1);
			symbol_set_internal(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_TYPE[directive] TOKEN[symbol] COMMA TOKEN[type] {
			STATEMENT_NEW($1);
			symbol_set_type(document, $symbol->txt, $$, $type);
		}
	|	DIRECTIVE_SIZE TOKEN[symbol] COMMA TOKEN {
			STATEMENT_NEW($1);
			symbol_set_size(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_COMM TOKEN[symbol] COMMA tokens_comma {
			STATEMENT_NEW($1);
			symbol_set_comm(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_SET TOKEN[symbol] COMMA tokens {
			STATEMENT_NEW($1);
			symbol_set_set(document, $symbol->txt, $$);
		}
	;


symbol_directive_or_tokens:
		symbol_part_directive
	|	tokens
	;

statement_without_label:
		symbol_directive_or_tokens {
			STATEMENT_NEW($1);
			SYMBOL_ADD_STATEMENT($$);
		}
	|	section_part_directive {
			STATEMENT_NEW($1);
			SECTION_ADD_STATEMENT($$);
		}
	|	file_part_directive {
			STATEMENT_NEW($1);
		}
	|	symbol_info_directive
	;

label:
		LABEL
	|	LLABEL
	;

labels_tokens:
		labels_tokens label
	|	label
	;

labels:
		labels_tokens {
			STATEMENT_NEW($1);
			symbol_set_label(document,
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

single_end_of_statement:
		SEMICOLON
	|	NEWLINE
	|	COMMENT NEWLINE
	;

end_of_statement:
		single_end_of_statement
	|	end_of_statement single_end_of_statement;

/* Only use LEFT RECURSION HERE, as `statement`s are linked on creation */
statements:
		statements[head] statement end_of_statement
	|	statement end_of_statement
	;

file:
		statements {
			SETSECTION(NULL);
		}
	;

%%
