/*
Design YACC/LEX code to recognize valid arithmetic expression with operators +, -.* and /.
*/

%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

/* Operator Precedence and Associativity */
%left '+' '-'
%left '*' '/'

%%
/* Grammar Rules */
start: expr { printf("\nResult: Valid Arithmetic Expression!\n"); return 0; }
     ;

expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUMBER
    ;
%%

void yyerror(const char *s) {
    printf("\nResult: Invalid Arithmetic Expression!\n");
}

int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}