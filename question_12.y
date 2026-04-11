%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token NUMBER ID

%%

E : E '+' T
  | E '-' T
  | T
  ;

T : T '*' F
  | T '/' F
  | F
  ;

F : '(' E ')'
  | NUMBER
  | ID
  ;

%%

int main()
{
printf("Enter Arithmetic Expression:\n");
yyparse();
return 0;
}

void yyerror(char *s)
{
printf("Invalid Expression\n");
}
