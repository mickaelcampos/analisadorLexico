all: a.out

a.out: lex.yy.c
	gcc lex.yy.c

lex.yy.c: analisador.l
	flex analisador.l
clean:
	rm -rf *.out *.yy.c