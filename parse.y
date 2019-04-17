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
void yyerror(struct document_tree *document, const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

#define APPEND(n) do {								\
	int i = n - 1;								\
	yyval = yyvsp[-i];							\
	for (i--; i >= 0; i--)	{						\
		list_append(&yyval->list, &yyvsp[-i]->list);			\
		list_append(&yyval->siblings, &yyvsp[-i]->siblings);		\
	}									\
	/*print_list(yyval);*/							\
} while (0)

#define APPENDLINK(n) do {								\
	int i = n - 1;								\
	yyval = yyvsp[-i];							\
	for (i--; i >= 0; i--)	{						\
		list_append(&yyval->list, &yyvsp[-i]->list);			\
	}									\
	/*print_list(yyval);*/							\
} while (0)

%}

%token LABEL LLABEL TOKEN SPACE NEWLINE SEMICOLON COMMA

%token DIRECTIVE_SECTION DIRECTIVE_PUSHSECTION DIRECTIVE_POPSECTION DIRECTIVE_SUBSECTION DIRECTIVE_PREVIOUS
%token DIRECTIVE_TEXT DIRECTIVE_DATA DIRECTIVE_BSS

%token DIRECTIVE_ALIGN DIRECTIVE_TYPE DIRECTIVE_COMM DIRECTIVE_WEAK DIRECTIVE_SIZE
%token DIRECTIVE_GLOBL DIRECTIVE_LOCAL DIRECTIVE_HIDDEN DIRECTIVE_PROTECTED DIRECTIVE_INTERNAL DIRECTIVE_SET
%token DIRECTIVE_FILE DIRECTIVE_LOC_IGNORED DIRECTIVE_CFI_IGNORED
%token DIRECTIVE_DATA_DEF DIRECTIVE_STRING DIRECTIVE_IDENT
%token COMMENT STATEMENT

%start file

%parse-param {struct document_tree *document}

%%


tokens_comma:
		tokens_comma COMMA TOKEN { APPEND(3); }
	|	TOKEN;

tokens_space:
		tokens_space TOKEN { APPEND(2); }
	|	TOKEN;

tokens:
		tokens COMMA TOKEN { APPEND(3); }
	|	tokens TOKEN { APPEND(2); }
	|	TOKEN;

directive_pop_stack:
		DIRECTIVE_PREVIOUS { previoussection(document); }
	|	DIRECTIVE_POPSECTION	{ popsection(document); };

directive_section_args:
		tokens_comma;

directive_section:
		DIRECTIVE_SECTION directive_section_args {
			APPEND(2);
			setsection(document, $directive_section_args->txt);
		}
	|	DIRECTIVE_TEXT { setsection(document, ".text"); }
	|	DIRECTIVE_DATA { setsection(document, ".data"); }
	|	DIRECTIVE_BSS  { setsection(document, ".bss"); }
	|	DIRECTIVE_PUSHSECTION directive_section_args {
			APPEND(2);
			setsection(document, $directive_section_args->txt);
		}
	|	DIRECTIVE_SUBSECTION TOKEN {
			APPEND(2);
		}
	|	directive_pop_stack;

directive:
         DIRECTIVE_FILE tokens_space { APPEND(2); }


      |  directive_section
      |  DIRECTIVE_COMM tokens_comma { APPEND(2); }

      |  DIRECTIVE_ALIGN
      |  DIRECTIVE_WEAK	TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->weak = $$;
	}
      |  DIRECTIVE_SET	TOKEN COMMA TOKEN {
		APPEND(4);
	}

      |  DIRECTIVE_GLOBL TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_LOCAL TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_HIDDEN TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->hidden = $$;
	}
      |  DIRECTIVE_PROTECTED TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->protected = $$;
	}
      |  DIRECTIVE_INTERNAL TOKEN[symbol] {
		APPEND(2);
		getsymbol(document, $symbol->txt)->internal = $$;
	}

      |  DIRECTIVE_TYPE TOKEN[symbol] COMMA TOKEN[type] {
		struct symbol *s;
		APPEND(4);
		s = getsymbol(document, $symbol->txt);
		s->type = $$;
		s->symbol_type = strcmp($type->txt, "@function") == 0 ? STT_FUNC : STT_OBJECT;
	}
      |  DIRECTIVE_SIZE TOKEN[symbol] COMMA TOKEN[size] {
		APPEND(4);
		getsymbol(document, $symbol->txt)->size = $size;
	}
      |  DIRECTIVE_DATA_DEF
      |  DIRECTIVE_CFI_IGNORED
      |  DIRECTIVE_LOC_IGNORED
      |  DIRECTIVE_STRING TOKEN { APPEND(2); }
      |  DIRECTIVE_IDENT TOKEN { APPEND(2); };


label:
		LABEL
	|	LLABEL;

directive_or_tokens:
		directive
	|	tokens;

labels:
		labels label { APPEND(2); }
	|	label;

statement:
		directive_or_tokens
	|	labels directive_or_tokens { APPEND(2); }
	|	labels;

statements:
		statements[head] SEMICOLON[semicolon] statement {
			new_statement(document, $head);

			$$ = $head;

			APPENDLINK(3);
		}
	|	statement SEMICOLON[semicolon] {
			new_statement(document, $statement);

			$$ = $statement;

			APPENDLINK(2);
		}
	|	statement { $$ = $statement; new_statement(document, $statement); };

line:
		statements COMMENT[comment] NEWLINE[newline] {
			$$ = $statements;

			APPENDLINK(3);
		}
	|	statements NEWLINE[newline] {
			$$ = $statements;

			APPENDLINK(2);
		}
	|	COMMENT[comment] NEWLINE[newline] {
			$$ = $1;

			APPENDLINK(2);
		};

lines:
	lines line {
		$$ = $1;
		list_append(&$1->list, &$2->list); }
     |  line;

file:
    lines { print_dbgfilter($$); };

%%

int main(int argc, char **argv) {
  int i;
#if YYDEBUG
  yydebug = 1;
#endif
  for (i = 1; i < argc; i++) {
    struct document_tree *document;

    yylineno = 1;

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
      perror("fopen");
      abort();
    }

    document = new_document();
    if (!yyparse(document)) {
      print_statements(document);
      print_symbols(document);
    }

    fclose(yyin);
  }
}

void print_siblings(list_t *list, const char *prefix)
{
       token_t *token;

       if (list->next == list)
               return;

       list_for_each_entry(token_t, token, list, siblings) {
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

