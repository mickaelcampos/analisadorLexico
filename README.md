# analisadorLexico

Programa desenvolvido para a disciplina INE5622
Alunos:
Gean Carlos Nunes
Matheus Nunes Silva
Nicolas Nascimento Maso
Mickael Rodrigues Campos
 

## Instalação:

- Feramenta FLEX (Analisador Lexico)
`$ sudo apt-get install flex`
- Ferramenta GCC (Compilador C)
`$ sudo apt-get install build-essentials`

## Compilação/execução do programa:

gerar os arquivos com o uso do Makefile usando o seguinte comando:

`$ make all`

ou manualmente com os seguintes comandos:

`$ flex analisador.l`

`$ gcc analisadorLexico.c -o analisadorLexico`

`$ ./analisadorLexico <caminho_arquivo>`

=============================

