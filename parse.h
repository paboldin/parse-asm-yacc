
#ifndef _PARSE_H_INCLUDED_
#define _PARSE_H_INCLUDED_

#define YYSTYPE_IS_DECLARED	1

typedef struct list {
	struct list *next, *prev;
} list_t;

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

typedef token_t *YYSTYPE;

#define offsetof(TYPE, MEMBER)	((unsigned long) &((TYPE *)0)->MEMBER)
#define container_of(ptr, type, member)	\
	((type *)(((void *)(ptr)) - offsetof(type, member)))

#define list_entry(ptr, type, member)	\
	container_of(ptr, type, member)

static inline void
list_init(list_t *list)
{
	list->next = list->prev = list;
}

static inline void
list_append(list_t *head, list_t *new)
{
	list_t *head_prev = head->prev;

	new->prev->next = head;
	head->prev->next = new;
	head->prev = new->prev;
	new->prev = head_prev;
}

static inline void
list_del(list_t *list)
{
	list->prev->next = list->next;
	list->next->prev = list->prev;
}

static inline void
printlist(token_t *head)
{
	token_t *h = head;

	do {
		printf("(%p:%d)'%s'\n", h, h->type, h->txt);
		h = list_entry(h->list.next, token_t, list);
	} while (h != head);
}

#endif /* _PARSE_H_INCLUDED_ */
