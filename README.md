# analisadorLexico

Programa construido para a disciplina INE5622 - Introdução a Compiladores

@nunesgean
@NicolasMaso

## Instalação:


- Ferramenta FLEX (Analisador Lexico)
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
