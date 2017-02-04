%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parse.h"

void
append(YYSTYPE head, YYSTYPE new)
{
	new->prev->next = head;
	head->prev->next = new;
	head->prev = new->prev;
}

void
print_list(YYSTYPE l)
{
	YYSTYPE h = l;

	printf("print_list: ");
	do {
		printf("%s",  h->txt);
		h = h->next;
	} while (h != l);
	printf("\n");
}

extern FILE* yyin;

int yylex(void);

extern int yylineno;
void yyerror(char *msg)
{
	fprintf(stderr, "l%d: %s\n", yylineno, msg);
}

#define APPEND(n) do {						\
	int i;							\
	yyval = yyvsp[1-n];					\
	for (i = n - 2; i >= 0; i--)				\
		append(yyvsp[1-n], yyvsp[-i]);			\
	/*print_list(yyval);*/					\
} while (0)

%}

%token LABEL LLABEL TOKEN SPACE NEWLINE_OR_SEMICOLON COMMA

%token DIR_SECTION DIR_PUSHSECTION DIR_POPSECTION DIR_SUBSECTION DIR_PREVIOUS
%token DIR_TEXT DIR_DATA DIR_BSS
%token DIR_ALIGN DIR_TYPE DIR_COMM DIR_WEAK DIR_SIZE
%token DIR_GLOBL DIR_LOCAL DIR_HIDDEN DIR_PROTECTED DIR_INTERNAL DIR_SET
%token DIR_FILE DIR_LOC DIR_CFI_IGNORED

%start file

%%

labeled:
		LABEL
	|	LLABEL
	|	LABEL statement { APPEND(2); }
	|	LLABEL statement { APPEND(2); }

directive:
         DIR_FILE SPACE TOKEN { APPEND(3); }
      |  DIR_FILE SPACE TOKEN SPACE TOKEN { APPEND(5); }


      |  DIR_SECTION SPACE TOKEN { APPEND(3); }
      |  DIR_SECTION SPACE TOKEN COMMA TOKEN COMMA TOKEN { APPEND(7); }
      |  DIR_COMM SPACE TOKEN COMMA TOKEN COMMA TOKEN { APPEND(7); }

      |  DIR_ALIGN SPACE TOKEN { APPEND(3); }

      |  DIR_GLOBL SPACE TOKEN { APPEND(3); }
      |  DIR_LOCAL SPACE TOKEN { APPEND(3); }

      |  DIR_TYPE SPACE TOKEN COMMA TOKEN { APPEND(5); }
      |  DIR_SIZE SPACE TOKEN COMMA TOKEN { APPEND(5); }
      |  DIR_LOC  SPACE TOKEN SPACE TOKEN SPACE TOKEN { APPEND(7); }
      |  DIR_TEXT
      |  DIR_DATA
      |  DIR_BSS
      |  DIR_CFI_IGNORED

statement:
         labeled
      |  SPACE statement { APPEND(2); }
      |  statement SPACE statement { APPEND(3); }
      |  statement COMMA statement { APPEND(3); }
      |  directive
      |  TOKEN

statements:
	  statements statement NEWLINE_OR_SEMICOLON
		{
			APPEND(3);
		}
	| statement NEWLINE_OR_SEMICOLON 
		{
			APPEND(2);
		}

file:
    statements { $$ = $1; print_list($1); };

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
