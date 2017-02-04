%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parse.h"
#include <elf.h>

struct symbol {
	const char *name;
	int symbol_type;
	YYSTYPE type;
	YYSTYPE label;
	YYSTYPE globl_or_local;
	YYSTYPE weak, hidden, protected, internal;
	YYSTYPE size;

	struct symbol *section;
	struct symbol *next;
};

static struct symbol *section;

/* LRU with symbols */
static struct symbol *symbols;

static struct symbol *
getsymbol(const char *name)
{
	struct symbol *h = symbols, *p = NULL;

	while (h != NULL) {
		if (!strcmp(h->name, name)) {
			if (p)
				p->next = h->next;
			goto link;
		}

		p = h;
		h = h->next;
	}

	h = (struct symbol *)malloc(sizeof(*h));
	if (h == NULL)
		abort();

	memset((void *)h, 0, sizeof(*h));

	h->name = strdup(name);
	if (h->name == NULL)
		abort();

	h->section = section;
link:
	if (h != symbols)
		h->next = symbols;
	symbols = h;

	return symbols;
}

static struct symbol *
getsection(const char *name)
{
	struct symbol *s;
	s = getsymbol(name);
	s->section = NULL;
	s->symbol_type = STT_SECTION;
	return s;
}

static const char *const yytname[];

void
_print_list(YYSTYPE l)
{
	YYSTYPE h = l;

	if (h == NULL)
		return;

	do {
		printf("(%s)%s", yytname[h->type - 255], h->buf);
		if (h->next->prev != h || h->prev->next != h)
			abort();
		h = h->next;
	} while (h != l);
}

void
print_list(YYSTYPE l)
{
	printf("print_list: ");
	_print_list(l);
	printf("\n");
}

static void print_dbgfilter(YYSTYPE l);

void
print_tokens(YYSTYPE l, const char *prefix)
{
	int len;

	if (l == NULL)
		return;

	len = l->length;

	printf("%s(l%d)", prefix, l->lineno);

	while (len-- > 0) {
		printf("(%s)%s", yytname[l->type - 255], l->txt);
		l = l->next;
	}
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

extern FILE* yyin;

int yylex(void);

extern int yylineno;
void yyerror(const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

/* TODO(pboldin) We need a proper AST.
 * * Collapse DIRECTIVE*s into a parent with tokens as children.
 * * Collapse statements into a parent with tokens as children.
 */
#define APPEND(n) do {						\
	int i;							\
	yyval = yyvsp[1-n];					\
	yyval->length = n;					\
	for (i = n - 2; i >= 0; i--)	{			\
		append(yyval, yyvsp[-i]);			\
	}							\
	/*print_list(yyval);*/					\
} while (0)

%}

%token LABEL LLABEL TOKEN SPACE NEWLINE SEMICOLON COMMA

%token DIRECTIVE_SECTION DIRECTIVE_PUSHSECTION DIRECTIVE_POPSECTION DIRECTIVE_SUBSECTION DIRECTIVE_PREVIOUS
%token DIRECTIVE_TEXT DIRECTIVE_DATA DIRECTIVE_BSS
%token DIRECTIVE_ALIGN DIRECTIVE_TYPE DIRECTIVE_COMM DIRECTIVE_WEAK DIRECTIVE_SIZE
%token DIRECTIVE_GLOBL DIRECTIVE_LOCAL DIRECTIVE_HIDDEN DIRECTIVE_PROTECTED DIRECTIVE_INTERNAL DIRECTIVE_SET
%token DIRECTIVE_FILE DIRECTIVE_LOC_IGNORED DIRECTIVE_CFI_IGNORED
%token DIRECTIVE_DATA_DEF COMMENT

%start file

%%

directive_pop_stack:
		DIRECTIVE_PREVIOUS { abort(); }
	|	DIRECTIVE_POPSECTION	{
			struct symbol *s = section->next;
			while (s && s->symbol_type != STT_SECTION)
				s = s->next;
			section = s;
		};

directive_section_args:
		TOKEN
	|	TOKEN COMMA TOKEN COMMA TOKEN { APPEND(5); }
	|	TOKEN COMMA TOKEN COMMA TOKEN COMMA TOKEN { APPEND(7); };

directive_section:
		DIRECTIVE_SECTION directive_section_args {
			APPEND(2);
			section = getsection($2->txt);
		}
	|	DIRECTIVE_TEXT { section = getsection(".text"); }
	|	DIRECTIVE_DATA { section = getsection(".data"); }
	|	DIRECTIVE_BSS  { section = getsection(".bss"); }
	|	DIRECTIVE_PUSHSECTION directive_section_args {
			APPEND(2);
			section = getsection($2->txt);
		}
	|	DIRECTIVE_SUBSECTION TOKEN {
			APPEND(2);
		}
	|	directive_pop_stack;

directive:
         DIRECTIVE_FILE TOKEN { APPEND(2); }
      |  DIRECTIVE_FILE TOKEN TOKEN { APPEND(3); }


      |  directive_section
      |  DIRECTIVE_COMM TOKEN COMMA TOKEN COMMA TOKEN { APPEND(6); }

      |  DIRECTIVE_ALIGN TOKEN { APPEND(2); }

      |  DIRECTIVE_GLOBL TOKEN {
		APPEND(2);
		getsymbol($2->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_LOCAL TOKEN {
		APPEND(2);
		getsymbol($2->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_HIDDEN TOKEN {
		APPEND(2);
		getsymbol($2->txt)->hidden = $$;
	}
      |  DIRECTIVE_PROTECTED TOKEN {
		APPEND(2);
		getsymbol($2->txt)->protected = $$;
	}
      |  DIRECTIVE_INTERNAL TOKEN {
		APPEND(2);
		getsymbol($2->txt)->internal = $$;
	}

      |  DIRECTIVE_TYPE TOKEN COMMA TOKEN {
		struct symbol *s;
		APPEND(4);
		s = getsymbol($2->txt);
		s->type = $$;
		s->symbol_type = strcmp($4->txt, "@function") == 0 ? STT_FUNC : STT_OBJECT;
	}
      |  DIRECTIVE_SIZE TOKEN COMMA TOKEN {
		APPEND(4);
		getsymbol($2->txt)->size = $$;
	}
      |  DIRECTIVE_DATA_DEF TOKEN { APPEND(2); }
      |  DIRECTIVE_CFI_IGNORED
      |  DIRECTIVE_LOC_IGNORED;

label:
		LABEL
	|	LLABEL;

tokens:
		tokens TOKEN { APPEND(2); }
	|	tokens COMMA TOKEN { APPEND(3); }
	|	TOKEN;

directive_or_tokens:
		directive
	|	tokens;

statement:
		directive_or_tokens
	|	label directive_or_tokens { APPEND(2); }
	|	label;

statements:
		statements SEMICOLON statement {
			APPEND(3);
		}
	|	statement SEMICOLON { APPEND(2); }
	|	statement;

line:
		statements COMMENT NEWLINE { $$ = $1; append($1, $2); append($1, $3); }
	|	statements NEWLINE { $$ = $1; append($1, $2); }
	|	statements
	|	COMMENT	NEWLINE { $$ = $1; append($1, $2); }
	|	NEWLINE;

lines:
	lines line { $$ = $1; append($1, $2); }
     |  line;

file:
    lines { print_dbgfilter($$); }

%%

void
print_dbgfilter(YYSTYPE l)
{
	YYSTYPE h = l;
	int newline = 1, dbgsection = 0;

	do {
		if (h->type == DIRECTIVE_SECTION ||
		    h->type == DIRECTIVE_PUSHSECTION) {
			/* FIXME(pboldin) account for POPSECTION */
			dbgsection = !strncmp(h->next->txt, ".debug", 6);
		}
		if (h->type == DIRECTIVE_POPSECTION)
			abort();
		if (newline &&
		    (h->type == DIRECTIVE_CFI_IGNORED ||
		     h->type == DIRECTIVE_LOC_IGNORED ||
		     dbgsection)) {
			printf("# ");
		}
		if (h->type == LABEL)
			printf("%s:", h->buf);
		else
			printf("%s", h->buf);
		newline = h->type == NEWLINE;
		h = h->next;
	} while (h != l);
}

int main(int argc, char **argv) {
#if YYDEBUG
  yydebug = 1;
#endif
  if (argc == 2) {
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
      perror("fopen");
      abort();
    }
  }
  section = getsymbol(".text");
  return yyparse();
}
