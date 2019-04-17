
#ifndef LIST_H_INCLUDED
#define LIST_H_INCLUDED

#define offsetof(TYPE, MEMBER)	((unsigned long) &((TYPE *)0)->MEMBER)
#define container_of(ptr, type, member)	\
	((type *)(((void *)(ptr)) - offsetof(type, member)))


typedef struct list {
	struct list *next, *prev;
} list_t;

#define list_entry(ptr, type, member)	\
	container_of(ptr, type, member)

#define list_first_entry(ptr, type, member) \
	list_entry((ptr)->next, type, member)

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

#endif /* LIST_H_INCLUDED */
