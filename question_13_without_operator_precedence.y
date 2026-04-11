%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%
/* Strict Grammar to handle precedence without %left/%right */
start: E { printf("\nResult: %d\n", $1); return 0; }
     ;

E : E '+' T { $$ = $1 + $3; }
  | E '-' T { $$ = $1 - $3; }
  | T       { $$ = $1; }
  ;

T : T '*' F { $$ = $1 * $3; }
  | T '/' F { 
        if($3 == 0) { 
            yyerror("Divide by zero error!"); 
            exit(0); 
        } 
        else { $$ = $1 / $3; } 
    }
  | F       { $$ = $1; }
  ;

F : '(' E ')' { $$ = $2; }
  | NUMBER    { $$ = $1; }
  ;
%%

void yyerror(const char *s) {
    printf("\nError: Invalid Expression\n");
}

int main() {
    printf("Enter Arithmetic Expression (Without Precedence Rules): ");
    yyparse();
    return 0;
}