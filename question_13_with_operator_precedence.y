%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

S : E { printf("Result = %d\n", $1); }
  ;

E : E '+' E   { $$ = $1 + $3; }
  | E '-' E   { $$ = $1 - $3; }
  | E '*' E   { $$ = $1 * $3; }
  | E '/' E   { $$ = $1 / $3; }
  | '(' E ')' { $$ = $2; }
  | NUMBER    { $$ = $1; }
  ;

%%

int main()
{
printf("Enter Expression: ");
yyparse();
return 0;
}

void yyerror(char *s)
{
printf("Invalid Expression\n");
}