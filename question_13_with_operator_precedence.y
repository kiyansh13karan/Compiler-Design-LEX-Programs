%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

/* Operator Precedence Define kar rahe hain */
%left '+' '-'
%left '*' '/'   /* Ye neeche hai, isliye iski priority zyada hai */

%%
/* Simple Ambiguous Grammar */
start: E { printf("\nResult: %d\n", $1); return 0; }
     ;

E : E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { 
        if($3 == 0) { 
            yyerror("Divide by zero error!"); 
            exit(0); 
        } 
        else { $$ = $1 / $3; } 
    }
  | '(' E ')' { $$ = $2; }
  | NUMBER    { $$ = $1; }
  ;
%%

void yyerror(const char *s) {
    printf("\nError: Invalid Expression\n");
}

int main() {
    printf("Enter Arithmetic Expression (With Precedence Rules): ");
    yyparse();
    return 0;
}