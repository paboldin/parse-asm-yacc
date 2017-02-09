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

static struct symbol *section, *prev_section;

/* LRU with symbols */
static struct symbol *symbols;

static const char *const yytname[];

static void
setsection(const char *name);
static void
previoussection(void);
static void
popsection(void);

static struct symbol *
getsymbol(const char *name);
static void
print_list(YYSTYPE l);

static void print_dbgfilter(YYSTYPE l);

extern FILE* yyin;

int yylex(void);

extern int yylineno;
void yyerror(const char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

#define APPEND(n) do {						\
	int i = n - 1;						\
	yyval = yyvsp[-i];					\
	yyval->length = i + 1;					\
	for (i--; i >= 0; i--)	{				\
		list_append(&yyval->list, &yyvsp[-i]->list);	\
	}							\
	/*print_list(yyval);*/					\
} while (0)

#define next_token(tkn) list_entry(tkn->list.next, token_t, list)

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
			setsection($2->txt);
		}
	|	DIRECTIVE_TEXT { setsection(".text"); }
	|	DIRECTIVE_DATA { setsection(".data"); }
	|	DIRECTIVE_BSS  { setsection(".bss"); }
	|	DIRECTIVE_PUSHSECTION directive_section_args {
			APPEND(2);
			setsection($2->txt);
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
      |  DIRECTIVE_WEAK	TOKEN {
		APPEND(2);
		getsymbol($2->txt)->weak = $$;
	}
      |  DIRECTIVE_SET	TOKEN COMMA TOKEN {
		APPEND(4);
		getsymbol($2->txt)->weak = $$;
	}

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
      |  DIRECTIVE_DATA_DEF
      |  DIRECTIVE_CFI_IGNORED
      |  DIRECTIVE_LOC_IGNORED;

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
		statements SEMICOLON statement {
			APPEND(3);
		}
	|	statement SEMICOLON { APPEND(2); }
	|	statement;

comment_with_newline:
		COMMENT	NEWLINE { $$ = $1; list_append(&$1->list, &$2->list); }
	|	NEWLINE;

line:
		statements comment_with_newline {
			$$ = $1;
			list_append(&$1->list, &$2->list);
		}
	|	statements
	|	comment_with_newline;

lines:
	lines line {
		$$ = $1;
		list_append(&$1->list, &$2->list); }
     |  line;

file:
    lines { print_list($$); }

%%

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

static void
setsection(const char *name)
{
	struct symbol *s;

	s = getsymbol(name);
	s->section = NULL;
	s->symbol_type = STT_SECTION;
	prev_section = section;
	section = s;
}

static void
popsection()
{
	struct symbol *s = section->next;

	while (s && s->symbol_type != STT_SECTION)
		s = s->next;
	section = s;
}

static void
previoussection()
{
	struct symbol *s = section;

	section = getsymbol(prev_section->name);
	prev_section = s;
}

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
		l = next_token(l);
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

void
print_dbgfilter(YYSTYPE l)
{
	YYSTYPE h = l;
	int newline = 1, dbgsection = 0;

	do {
		if (h->type == DIRECTIVE_SECTION ||
		    h->type == DIRECTIVE_PUSHSECTION) {
			/* FIXME(pboldin) account for POPSECTION */
			dbgsection = !strncmp(
				next_token(h)->txt,
				".debug", 6);
		}
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
		h = next_token(h);
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
		h = next_token(h);
	} while (h != l);
}

void
print_list(YYSTYPE l)
{
	printf("print_list: ");
	_print_list(l);
	printf("\n");
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
