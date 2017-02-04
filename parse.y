%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parse.h"

#define STT_FUNC	10
#define	STT_OBJECT	20

struct symbol {
	const char *name;
	int symbol_type;
	YYSTYPE type;
	YYSTYPE label;
	YYSTYPE globl_or_local;
	YYSTYPE weak, hidden, protected, internal;
	YYSTYPE size;

	struct symbol *next;
};

struct symbol *symbols = NULL;

static struct symbol *
getsymbol(const char *name)
{
	struct symbol *h;

	for (h = symbols; h; h = h->next) {
		if (!strcmp(h->name, name))
			return h;
	}


	h = (struct symbol *)malloc(sizeof(*h));
	if (h == NULL)
		abort();

	memset((void *)h, 0, sizeof(*h));

	h->name = strdup(name);
	if (h->name == NULL)
		abort();

	h->next = symbols;
	symbols = h;

	return symbols;
}

void
append(YYSTYPE head, YYSTYPE new)
{
	new->prev->next = head;
	head->prev->next = new;
	head->prev = new->prev;
}

static const char *const yytname[];

void
print_list(YYSTYPE l)
{
	YYSTYPE h = l;

	if (h == NULL)
		return;

	printf("print_list: ");
	do {
		printf("(%s)%s", yytname[h->type - 255], h->txt);
		h = h->next;
	} while (h != l);
	printf("\n");
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
		l = l->next;
	}
	printf("\n");
}

void
print_symbol(struct symbol *s)
{
	printf("symbol: name = %s, type = %d\n", s->name, s->symbol_type);
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

#define APPEND(n) do {						\
	int i;							\
	yyval = yyvsp[1-n];					\
	yyval->length = n;					\
	for (i = n - 2; i >= 0; i--)				\
		append(yyvsp[1-n], yyvsp[-i]);			\
	/*print_list(yyval);*/					\
} while (0)

%}

%token LABEL LLABEL TOKEN SPACE NEWLINE SEMICOLON COMMA

%token DIRECTIVE_SECTION DIRECTIVE_PUSHSECTION DIRECTIVE_POPSECTION DIRECTIVE_SUBSECTION DIRECTIVE_PREVIOUS
%token DIRECTIVE_TEXT DIRECTIVE_DATA DIRECTIVE_BSS
%token DIRECTIVE_ALIGN DIRECTIVE_TYPE DIRECTIVE_COMM DIRECTIVE_WEAK DIRECTIVE_SIZE
%token DIRECTIVE_GLOBL DIRECTIVE_LOCAL DIRECTIVE_HIDDEN DIRECTIVE_PROTECTED DIRECTIVE_INTERNAL DIRECTIVE_SET
%token DIRECTIVE_FILE DIRECTIVE_LOC_IGNORED DIRECTIVE_CFI_IGNORED
%token DIRECTIVE_DATA_DEF

%start file

%%


directive_section:
		DIRECTIVE_SECTION SPACE TOKEN { APPEND(3); }
	|	DIRECTIVE_SECTION SPACE TOKEN COMMA TOKEN COMMA TOKEN { APPEND(7); }
	|	DIRECTIVE_SECTION SPACE TOKEN COMMA TOKEN COMMA TOKEN COMMA TOKEN { APPEND(9); };

directive:
         DIRECTIVE_FILE SPACE TOKEN { APPEND(3); }
      |  DIRECTIVE_FILE SPACE TOKEN SPACE TOKEN { APPEND(5); }


      |  directive_section
      |  DIRECTIVE_COMM SPACE TOKEN COMMA TOKEN COMMA TOKEN { APPEND(7); }

      |  DIRECTIVE_ALIGN SPACE TOKEN { APPEND(3); }

      |  DIRECTIVE_GLOBL SPACE TOKEN {
		APPEND(3);
		getsymbol($3->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_LOCAL SPACE TOKEN {
		APPEND(3);
		getsymbol($3->txt)->globl_or_local = $$;
	}
      |  DIRECTIVE_HIDDEN SPACE TOKEN {
		APPEND(3);
		getsymbol($3->txt)->hidden = $$;
	}
      |  DIRECTIVE_PROTECTED SPACE TOKEN {
		APPEND(3);
		getsymbol($3->txt)->protected = $$;
	}
      |  DIRECTIVE_INTERNAL SPACE TOKEN {
		APPEND(3);
		getsymbol($3->txt)->internal = $$;
	}

      |  DIRECTIVE_TYPE SPACE TOKEN COMMA TOKEN {
		struct symbol *s;
		APPEND(5);
		s = getsymbol($3->txt);
		s->type = $$;
		s->symbol_type = strcmp($5->txt, "@function") == 0 ? STT_FUNC : STT_OBJECT;
	}
      |  DIRECTIVE_SIZE SPACE TOKEN COMMA TOKEN {
		APPEND(5);
		getsymbol($3->txt)->size = $$;
	}
      |  DIRECTIVE_DATA_DEF SPACE TOKEN { APPEND(3); }
      |  DIRECTIVE_TEXT
      |  DIRECTIVE_DATA
      |  DIRECTIVE_BSS
      |  DIRECTIVE_CFI_IGNORED
      |  DIRECTIVE_LOC_IGNORED;

tokens:
		tokens SPACE TOKEN { APPEND(3); }
	|	tokens COMMA TOKEN { APPEND(3); }
	|	TOKEN;

statement:
		LABEL	{ $$ = $1; getsymbol($1->txt)->label = $$; }
	|	LABEL SPACE statement { APPEND(3); getsymbol($1->txt)->label = $$; }
	|	LLABEL
	|	LLABEL SPACE statement { APPEND(3); }
	|	SPACE statement { APPEND(2); }
	|	directive
	|	tokens;

statements:
	  statements SEMICOLON statement {
			APPEND(3);
		}
	| statement;

lines:
	lines statements NEWLINE { APPEND(3); }
     |  statements NEWLINE { APPEND(2); }
     |  statements;

file:
    lines { print_symbols(symbols); }

%%


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
  return yyparse();
}
