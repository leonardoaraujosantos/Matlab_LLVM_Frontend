%{
#  include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL

%%

calclist: /* nothing */
 | calclist expression EOL { printf("= %d\n> ", $2); }
 | calclist EOL { printf("> "); } /* blank line or a comment */
 ;

expression: factor
 | expression ADD expression { $$ = $1 + $3; }
 | expression SUB factor { $$ = $1 - $3; }
 | expression ABS factor { $$ = $1 | $3; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
 | OP expression CP { $$ = $2; }
 ;
%%
main()
{
  printf("> ");
  yyparse();
}
yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
