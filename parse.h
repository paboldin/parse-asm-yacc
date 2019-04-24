
#ifndef PARSE_H_INCLUDED
#define PARSE_H_INCLUDED

#include <stdio.h>

#include "list.h"


static inline
const char *get_token_name(int token)
{
	extern const char * const *token_name;
	return token_name[token - 255];
}

typedef struct token {
	/* list of all tokens */
	list_t list;

	/* list of all tokens of the particular statement or directive */
	list_t siblings;

	int type;
	int spclength;
	int lineno;
	char *txt;
	char buf[];
} token_t;

#define token_next(tkn) list_entry(tkn->list.next, token_t, list)
#define token_prev(tkn) list_entry(tkn->list.prev, token_t, list)
#define sibling_next(tkn) list_entry(tkn->siblings.next, token_t, siblings)
#define sibling_prev(tkn) list_entry(tkn->siblings.prev, token_t, siblings)

struct section_args {
	token_t *flags;
	token_t *type;
	token_t *arguments;
};

#define YY_DECL int yylex(document_t *document)

#endif /* PARSE_H_INCLUDED */
