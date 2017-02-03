%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parse.h"

YYSTYPE link(YYSTYPE p, YYSTYPE list)
{
   p->prev = list->prev;
   p->next = list;
   list->prev = p;
   p->prev->next = p;
   return list;
}

extern FILE* yyin;

int yylex(void);
void yyerror(char *);

%}

%token LABEL LLABEL TOKEN SEMICOLON DELIM

%token DIR_SECTION DIR_PUSHSECTION DIR_SUBSECTION DIR_SIZE DIR_TEXT DIR_DATA
%token DIR_FILE

%start statement

%%

tokens: tokens DELIM TOKEN { $$ = $1; link($2, $1); link($3, $1); }
	| TOKEN { $$ = $1; };

instruction: tokens { $$ = $1; } /* is that a default action? */

instructions: 
	    instructions SEMICOLON instruction { $$ = $1; link($2, $1); link($3, $1); }
	|   instruction { $$ = $1; };

statement:
	LABEL { $$ = $1; }	|
	LABEL instructions	|
	      instructions;
%%


int main(int argc, char **argv) {
  if (argc == 2) {
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
      perror("fopen");
      abort();
    }
  }
  return yyparse();
}
