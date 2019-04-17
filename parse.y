%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <elf.h>

#include "parse.h"
#include "document.h"

static const char *const yytname[];

extern FILE* yyin;

int yylex(void);

extern int yylineno;
void yyerror(const char *msg)
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


extern struct document_tree *document;

void
print_statements(struct document_tree *tree)
{
	struct statement *stmt;

	list_for_each_entry(struct statement, stmt, &tree->statements, list) {
		print_siblings(&stmt->tokens, NULL);
	}
}

static struct statement *
find_statement(token_t *tkn)
{
	token_t *sbl = tkn, *nxt = tkn;

	do {
		sbl = sibling_next(sbl);
		nxt = token_next(nxt);
	} while (sbl == nxt);

	return list_entry(&sbl->siblings, struct statement, tokens);
}

%}

%expect 1
%token LABEL LLABEL TOKEN SPACE NEWLINE SEMICOLON COMMA

%token DIRECTIVE_SECTION DIRECTIVE_PUSHSECTION DIRECTIVE_POPSECTION DIRECTIVE_SUBSECTION DIRECTIVE_PREVIOUS
%token DIRECTIVE_TEXT DIRECTIVE_DATA DIRECTIVE_BSS

%token DIRECTIVE_ALIGN DIRECTIVE_TYPE DIRECTIVE_COMM DIRECTIVE_WEAK DIRECTIVE_SIZE
%token DIRECTIVE_GLOBL DIRECTIVE_LOCAL DIRECTIVE_HIDDEN DIRECTIVE_PROTECTED DIRECTIVE_INTERNAL DIRECTIVE_SET
%token DIRECTIVE_FILE DIRECTIVE_LOC_IGNORED DIRECTIVE_CFI_IGNORED
%token DIRECTIVE_DATA_DEF DIRECTIVE_STRING DIRECTIVE_IDENT
%token COMMENT STATEMENT

%start file

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
		DIRECTIVE_PREVIOUS { previoussection(); }
	|	DIRECTIVE_POPSECTION	{ popsection(); };

directive_section_args:
		tokens_comma;

directive_section:
		DIRECTIVE_SECTION directive_section_args {
			APPEND(2);
			setsection($directive_section_args->txt);
		}
	|	DIRECTIVE_TEXT { setsection(".text"); }
	|	DIRECTIVE_DATA { setsection(".data"); }
	|	DIRECTIVE_BSS  { setsection(".bss"); }
	|	DIRECTIVE_PUSHSECTION directive_section_args {
			APPEND(2);
			setsection($directive_section_args->txt);
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
		getsymbol($symbol->txt)->weak = $$;
	}
      |  DIRECTIVE_SET	TOKEN COMMA TOKEN {
		APPEND(4);
	}

      |  DIRECTIVE_GLOBL TOKEN[symbol] {
		APPEND(2);
		getsymbol($symbol->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_LOCAL TOKEN[symbol] {
		APPEND(2);
		getsymbol($symbol->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_HIDDEN TOKEN[symbol] {
		APPEND(2);
		getsymbol($symbol->txt)->hidden = $$;
	}
      |  DIRECTIVE_PROTECTED TOKEN[symbol] {
		APPEND(2);
		getsymbol($symbol->txt)->protected = $$;
	}
      |  DIRECTIVE_INTERNAL TOKEN[symbol] {
		APPEND(2);
		getsymbol($symbol->txt)->internal = $$;
	}

      |  DIRECTIVE_TYPE TOKEN[symbol] COMMA TOKEN[type] {
		struct symbol *s;
		APPEND(4);
		s = getsymbol($symbol->txt);
		s->type = $$;
		s->symbol_type = strcmp($type->txt, "@function") == 0 ? STT_FUNC : STT_OBJECT;
	}
      |  DIRECTIVE_SIZE TOKEN[symbol] COMMA TOKEN[size] {
		APPEND(4);
		getsymbol($symbol->txt)->size = $size;
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
			new_statement($statement);

			$$ = $head;

			APPEND(3);
		}
	|	statement SEMICOLON[semicolon] {
			new_statement($statement);

			$$ = $statement;

			APPEND(2);
		}
	|	statement { $$ = $statement; new_statement($statement); };

line:
		statements COMMENT[comment] NEWLINE[newline] {
			$$ = $statements;

			APPEND(3);
		}
	|	statements NEWLINE[newline] {
			$$ = $statements;

			APPEND(2);
		}
	|	COMMENT[comment] NEWLINE[newline] {
			$$ = $1;

			APPEND(2);
		};

lines:
	lines line {
		$$ = $1;
		list_append(&$1->list, &$2->list); }
     |  line;

file:
    lines { print_dbgfilter($$); }

%%


void
print_siblings(list_t *list, const char *prefix)
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

void
print_tokens(token_t *t, const char *prefix)
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

void
print_symbol(struct symbol *s)
{
	printf("symbol: name = %s, type = %d\n", s->name, s->symbol_type);
	if (s->section)
		printf("symbol: section = %s\n", s->section->name);
	print_tokens(s->label, "symbol: label = ");
	print_tokens(s->type, "symbol: type = ");
	print_tokens(s->globl_or_local, "symbol: globl_or_local = ");
	print_tokens(s->weak, "symbol: weak = ");
	print_tokens(s->hidden, "symbol: hidden = ");
	print_tokens(s->protected, "symbol: protected = ");
	print_tokens(s->internal, "symbol: internal = ");
	print_tokens(s->size, "symbol: size = ");
}

void
print_symbols(struct symbol *h)
{
	while (h) {
		print_symbol(h);
		h = h->next;
	}
}

void
print_dbgfilter(token_t *l)
{
	token_t *h = l;
	int newline = 1, dbgsection = 0;

	do {
		if (h->type == DIRECTIVE_SECTION ||
		    h->type == DIRECTIVE_PUSHSECTION) {
			/* FIXME(pboldin) account for POPSECTION */
			dbgsection = !strncmp(
				token_next(h)->txt,
				".debug", 6);
		}
		if (newline && h->type != DIRECTIVE_IDENT &&
		    (h->type == DIRECTIVE_CFI_IGNORED ||
		     h->type == DIRECTIVE_LOC_IGNORED ||
		     dbgsection)) {
			printf("# ");
		}
		if (h->type == LABEL || h->type == LLABEL)
			printf("%s:", h->buf);
		else
			printf("%s", h->buf);
		newline = h->type == NEWLINE;
		h = token_next(h);
	} while (h != l);
}

void
_print_list(YYSTYPE l)
{
	YYSTYPE h = l;

	if (h == NULL)
		return;

	do {
		printf("(%s)%s", yytname[h->type - 255], h->buf);
		h = token_next(h);
	} while (h != l);
}

void
print_list(YYSTYPE l)
{
	printf("print_list: ");
	_print_list(l);
	printf("\n");
}

struct document_tree *document;

int main(int argc, char **argv) {
  int i;
#if YYDEBUG
  yydebug = 1;
#endif
  for (i = 1; i < argc; i++) {

    yylineno = 1;

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
      perror("fopen");
      abort();
    }

    document = new_document();
    if (!yyparse()) {
      print_statements(document);
      print_symbols(document->symbols);
    }

    fclose(yyin);
  }
}
