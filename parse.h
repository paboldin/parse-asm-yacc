
#ifndef _PARSE_H_INCLUDED_
#define _PARSE_H_INCLUDED_

#define YYSTYPE_IS_DECLARED	1

struct yystype {
	struct yystype *next, *prev;

	int type;
	int length, spclength;
	int lineno;
	char *txt;
	char buf[];
};

typedef struct yystype *YYSTYPE;

static inline void
printlist(YYSTYPE head)
{
	YYSTYPE h = head;

	do {
		printf("(%p:%d)'%s'\n", h, h->type, h->txt);
		h = h->next;
	} while (h != head);
}

static inline void
append(YYSTYPE head, YYSTYPE new)
{
	YYSTYPE head_prev = head->prev;

	new->prev->next = head;
	head->prev->next = new;
	head->prev = new->prev;
	new->prev = head_prev;
}

#endif /* _PARSE_H_INCLUDED_ */
