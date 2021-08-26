all: a.out

a.out: analisadorLexico.c
	gcc analisadorLexico.c

analisadorLexico.c: analisador.l
	flex analisador.l
clean:
	rm -rf *.out *.yy.c