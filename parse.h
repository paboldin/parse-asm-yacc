
#ifndef PARSE_H_INCLUDED
#define PARSE_H_INCLUDED

#include <stdio.h>

#include "list.h"

static const char *const yytname[];

#define YYSTYPE_IS_DECLARED	1

typedef struct token {
	/* list of all tokens */
	list_t list;

	/* list of all tokens of the particular statement or directive */
	list_t siblings;

	/* list of all first tokens of statements */
	list_t statements;

	int type;
	int spclength;
	int lineno;
	char *txt;
	char buf[];
} token_t;

typedef token_t *YYSTYPE;

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

#define list_for_each_entry(typeof_pos, pos, head, member) \
        for (pos = list_entry((head)->next, typeof_pos, member); \
             &pos->member != (head); \
             pos = list_entry(pos->member.next, typeof_pos, member))

static inline void
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

static inline void
print_list(YYSTYPE l)
{
	printf("print_list: ");
	_print_list(l);
	printf("\n");
}


void print_tokens(token_t *t, const char *prefix);
void print_siblings(list_t *list, const char *prefix);

#endif /* PARSE_H_INCLUDED */
