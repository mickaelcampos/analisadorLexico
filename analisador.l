%option noyywrap

DIGIT[0-9]
LETTER[A-Z,a-z]


%%


def            	     {printf("%s ",yytext);}
break            	     {printf("%s ",yytext);}
class 		  	     {printf("%s ",yytext);}
constructor           	     {printf("%s ",yytext);}
else             	     {printf("%s ",yytext);}
extends           	     {printf("%s ",yytext);}
for            	     {printf("%s ",yytext);}
if 			     {printf("%s ",yytext);}           	    
int             	     {printf("%s ",yytext);}
new             	     {printf("%s ",yytext);}
print                 	     {printf("%s ",yytext);}
read            	     {printf("%s ",yytext);}
return            	     {printf("%s ",yytext);}
string                      {printf("%s ",yytext);}
super             	     {printf("%s ",yytext);}
method             	     {printf("%s ",yytext);}
null             	     {printf("%s ",yytext);}
{LETTER}({LETTER}|{DIGIT})* {printf("ident ");} 



eof             	    {printf("%s, \n",yytext);}



"="             	    {printf("%s ",yytext);}
">"             	    {printf("%s ",yytext);}
"<"             	    {printf("%s ",yytext);}
"=="             	    {printf("%s ",yytext);}
"<="             	    {printf("%s ",yytext);}
">="             	    {printf("%s ",yytext);}
"!="             	    {printf("%s ",yytext);}
"+"             	    {printf("%s ",yytext);}
"-"             	    {printf("%s ",yytext);}
"*"             	    {printf("%s ",yytext);}
"/"             	    {printf("%s ",yytext);}
"%"             	    {printf("%s ",yytext);}
"("             	    {printf("%s ",yytext);}
")"             	    {printf("%s ",yytext);}
"{"             	    {printf("%s ",yytext);}
"}"             	    {printf("%s ",yytext);}
"["             	    {printf("%s ",yytext);}
"]"                        {printf("%s ",yytext);}
";"             	    {printf("%s ",yytext);}
","             	    {printf("%s ",yytext);}
"."             	    {printf("%s ",yytext);}

%%

int main(int argc, char *argv[])
{

      extern FILE *yyin;

      yyin = fopen(argv[1], "r");

      yylex();
      return 0;
}