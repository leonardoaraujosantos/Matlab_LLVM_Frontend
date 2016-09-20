/*
  Simplest version of calculator
  compiling:
  bison -d calculator.y
  flex calculator.l
  gcc -o calculator.o calculator.tab.c lex.yy.c -lfl
*/
%{
#include <stdio.h>
%}
/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%%
calclist: /* nothing */

| calclist exp EOL { printf("= %d\n", $1); }
;
exp: factor
| exp ADD factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }
;
factor: term
| factor MUL term { $$ = $1 * $3; }
| factor DIV term { $$ = $1 / $3; }
;
term: NUMBER
| ABS term { $$ = $2 >= 0? $2 : - $2; }
;
%%
main(int argc, char **argv){
  yyparse();
}
yyerror(char *s){
  fprintf(stderr, "error: %s\n", s);
}
