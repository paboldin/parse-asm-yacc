

ifeq ($(NDEBUG),)
CFLAGS := -DYYDEBUG=1
endif
CFLAGS += -DYYERROR_VERBOSE=1 -g
ifneq ($(COVERAGE),)
CFLAGS += --coverage -pg
LDLIBS += -lgcov
endif

all: parser

tests: all
	@for f in $$(find tests -iname \*.s); do \
		echo running $$f; \
		./parser $$f || break; \
	done

parser: y.tab.o y.tab.h lex.yy.o document.o main.o
	gcc -g -o $@ $^ -lfl -ly $(LDFLAGS)

document.o: document.h

y.tab.c y.tab.h: parse.y parse.h
	yacc --verbose -d $<

y.tab.o: document.h

lex.yy.c: parse.l
	flex $^

coverage:
	make clean
	make COVERAGE=1 NDEBUG=1
	make tests
	lcov -t result -o ex_test.info -c -d .
	lcov -r ex_test.info -o ex_test.info '*/lex.yy.c' '*/y.tab.c'
	genhtml -o coverage-report ex_test.info

clean:
	rm -f y.tab.c y.tab.h lex.yy.c parser document.o y.tab.o main.o *.gcno *.gcda
