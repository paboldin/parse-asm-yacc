
#ifndef PARSE_H_INCLUDED
#define PARSE_H_INCLUDED

#include <stdio.h>

#include "list.h"

static const char *const yytname[];

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

static inline void
printlist(token_t *head)
{
	token_t *h = head;

	do {
		printf("(%p:%d)'%s'\n", h, h->type, h->txt);
		h = list_entry(h->list.next, token_t, list);
	} while (h != head);
}

#define token_next(tkn) list_entry(tkn->list.next, token_t, list)
#define sibling_next(tkn) list_entry(tkn->siblings.next, token_t, siblings)

static inline void
_print_list(token_t *l)
{
	token_t *h = l;

	if (h == NULL)
		return;

	do {
		printf("(%s)%s", yytname[h->type - 255], h->buf);
		h = token_next(h);
	} while (h != l);
}

static inline void
print_list(token_t *l)
{
	printf("print_list: ");
	_print_list(l);
	printf("\n");
}


void print_tokens(token_t *t, const char *prefix);
void print_siblings(list_t *list, const char *prefix);

#endif /* PARSE_H_INCLUDED */
