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

extern FILE* yyin;

int yylex(void);

extern int yylineno;
void yyerror(document_t *document, const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

#define JOINTOKENS(n) do {							\
	int i = n - 1;								\
	yyval.token = yyvsp[-i].token;						\
	for (i--; i >= 0; i--)	{						\
		list_append(&yyval.token->siblings, &yyvsp[-i].token->siblings);\
	}									\
} while (0)

%}

%union {
	token_t *token;
	statement_t *statement;
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

%type <token> tokens_comma tokens_space tokens directive_pop_stack 
%type <token> directive_section directive directive_or_tokens
%type <token> statement_tokens labels label semicolons_or_comment_or_newline
%type <token> comment_or_newline

%type <statement> statement statements line lines file aux_directive

%start file

%parse-param {document_t *document}

%%


tokens_comma:
		tokens_comma COMMA TOKEN { JOINTOKENS(3); }
	|	TOKEN
	;

tokens_space:
		tokens_space TOKEN { JOINTOKENS(2); }
	|	TOKEN
	;

tokens:
		tokens COMMA TOKEN { JOINTOKENS(3); }
	|	tokens TOKEN { JOINTOKENS(2); }
	|	TOKEN
	;

directive_pop_stack:
		DIRECTIVE_PREVIOUS { PREVIOUSSECTION($$); }
	|	DIRECTIVE_POPSECTION	{ POPSECTION($$); }
	;

directive_section:
		DIRECTIVE_SECTION tokens_comma[args] {
			JOINTOKENS(2);
			SETSECTION($args->txt, $$);
		}
	|	DIRECTIVE_TEXT { SETSECTION(".text", $$); }
	|	DIRECTIVE_DATA { SETSECTION(".data", $$); }
	|	DIRECTIVE_BSS  { SETSECTION(".bss", $$); }
	|	DIRECTIVE_PUSHSECTION tokens_comma[args] {
			JOINTOKENS(2);
			SETSECTION($args->txt, $$);
		}
	|	DIRECTIVE_SUBSECTION TOKEN {
			JOINTOKENS(2);
		}
	|	directive_pop_stack
	;

directive:
		DIRECTIVE_FILE tokens_space { JOINTOKENS(2); }


	|	directive_section
	|	DIRECTIVE_COMM tokens_comma { JOINTOKENS(2); }

	|	DIRECTIVE_ALIGN
	|	DIRECTIVE_SET	TOKEN COMMA tokens {
			JOINTOKENS(4);
		}

	|	DIRECTIVE_DATA_DEF
	|	DIRECTIVE_CFI_IGNORED
	|	DIRECTIVE_LOC_IGNORED
	|	DIRECTIVE_STRING TOKEN { JOINTOKENS(2); }
	|	DIRECTIVE_IDENT TOKEN { JOINTOKENS(2); }
	;

aux_directive:
		DIRECTIVE_WEAK	TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolweak(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_GLOBL TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolglobl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_LOCAL TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolglobl_or_local(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_HIDDEN TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolhidden(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_PROTECTED TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolprotected(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_INTERNAL TOKEN[symbol] {
			JOINTOKENS(2);
			$$ = statement_new(document, $1);
			setsymbolinternal(document, $symbol->txt, $$);
		}
	|	DIRECTIVE_TYPE[directive] TOKEN[symbol] COMMA TOKEN[type] {
			JOINTOKENS(4);
			$$ = statement_new(document, $1);
			setsymboltype(document, $symbol->txt, $$, $type);
		}
	|	DIRECTIVE_SIZE TOKEN[symbol] COMMA TOKEN {
			JOINTOKENS(4);
			$$ = statement_new(document, $1);
			setsymbolsize(document, $symbol->txt, $$);
		}
	;


label:
		LABEL
	|	LLABEL
	;

directive_or_tokens:
		directive
	|	tokens
	;

labels:
		labels label { JOINTOKENS(2); }
	|	label
	;

statement_tokens:
		directive_or_tokens
	|	labels directive_or_tokens { JOINTOKENS(2); }
	|	labels
	;

statement:
		statement_tokens {
			$$ = statement_new(document, $statement_tokens);
		}
	|	aux_directive
	;

semicolons:
		SEMICOLON
	|	semicolons SEMICOLON { JOINTOKENS(2); }
	;

statements:
		statements[head] semicolons statement {
			list_append(&$head->list, &$statement->list);

			//JOINTOKENSLINK(3);
		}
	|	statement { $$ = $statement; }
	;

comment_or_newline:
		COMMENT
	|	NEWLINE
	|	COMMENT NEWLINE { JOINTOKENS(2); }
	;

semicolons_or_comment_or_newline:
		semicolons comment_or_newline { JOINTOKENS(2); }
	|	comment_or_newline
	;

line:
		statements semicolons_or_comment_or_newline {
			//JOINTOKENSLINK(2);
			//list_append(&document->statements, &$statements->statements);
		}
	|	semicolons_or_comment_or_newline {}
	;

lines:
		lines line {
			//JOINTOKENSLINK(2);
		}
	|	line
	;

file:
		lines {
			//list_append(&document->tokens, &$lines->list);

			SETSECTION(NULL, NULL);
		}
	;

%%

int main(int argc, char **argv) {
  int i;
#if YYDEBUG
  yydebug = 1;
#endif
  for (i = 1; i < argc; i++) {
    document_t *document;

    yylineno = 1;

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
      perror("fopen");
      abort();
    }

    document = document_new();
    if (!yyparse(document)) {
      print_statements(document);
      print_symbols(document);
      print_dbgfilter(document);
    }

    fclose(yyin);
  }
}

void print_siblings(list_t *list, const char *prefix)
{
       token_t *token;

       if (list->next == list)
               return;

       list_for_each_entry(token, list, siblings) {
               if (prefix != NULL) {
                       printf("%s(l%d)", prefix, token->lineno);
                       prefix = NULL;
               }
               printf("(%s)%s", yytname[token->type - 255], token->buf);
       }
       printf("\n");
}

void print_tokens(token_t *t, const char *prefix)
{
       token_t *nsbl = t, *ntkn = t;
       if (t == NULL)
               return;

       if (prefix != NULL)
               printf("%s(l%d)", prefix, t->lineno);

       do {
               printf("(%s)%s", yytname[ntkn->type - 255], ntkn->buf);

               nsbl = sibling_next(nsbl);
               ntkn = token_next(ntkn);
       } while (nsbl == ntkn);
       printf("\n");
}
