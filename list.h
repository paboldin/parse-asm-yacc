
#ifndef LIST_H_INCLUDED
#define LIST_H_INCLUDED

/* Some of this code shamelessly taken from kernel */

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

#define list_last_entry(ptr, type, member) \
	list_entry((ptr)->prev, type, member)

static inline void
list_init(list_t *list)
{
	list->next = list->prev = list;
}

static inline int
list_empty(list_t *list)
{
	return list->next == list;
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
	list_init(list);
}

#define __container_of(ptr, sample, member)                             \
    (void *)container_of((ptr), typeof(*(sample)), member)

#define list_for_each_entry(pos, head, member)                          \
    for (pos = __container_of((head)->next, pos, member);               \
         &pos->member != (head);                                        \
         pos = __container_of(pos->member.next, pos, member))

#define list_for_each_entry_safe(pos, tmp, head, member)                \
    for (pos = __container_of((head)->next, pos, member),               \
         tmp = __container_of(pos->member.next, pos, member);           \
         &pos->member != (head);                                        \
         pos = tmp, tmp = __container_of(pos->member.next, tmp, member))

#endif /* LIST_H_INCLUDED */
