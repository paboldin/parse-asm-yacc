

CFLAGS += -DYYDEBUG -DYYERROR_VERBOSE=1 -g
ifneq ($(COVERAGE),)
CFLAGS += --coverage -pg
LDLIBS += -lgcov
endif

LDLIBS += -lfl -ly

all: parser gensrc

COMMON_OBJS := y.tab.o lex.yy.o document.o rbtree.o

tests: all
	./tests/runtests.sh

parser: parser.o $(COMMON_OBJS)
	$(LINK.o) $^ $(LDLIBS) -o $@

gensrc: gensrc.o $(COMMON_OBJS)
	$(LINK.o) $^ $(LDLIBS) -o $@

parser.o: y.tab.h

document.o: document.h parse.h

y.tab.c y.tab.h: asm.y
	yacc --verbose -d $<

y.tab.o: document.h parse.h

lex.yy.c: asm.l
	flex $^

coverage:
	make clean
	make COVERAGE=1 NDEBUG=1
	make tests
	lcov -t result -o ex_test.info -c -d .
	lcov -r ex_test.info -o ex_test.info '*/lex.yy.c' '*/y.tab.c'
	genhtml -o coverage-report ex_test.info

clean:
	rm -f y.tab.c y.tab.h lex.yy.c parser document.o y.tab.o parser.o *.gcno *.gcda
