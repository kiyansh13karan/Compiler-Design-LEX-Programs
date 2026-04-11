/*
Design YACC/LEX code to evaluate arithmetic expression involving operators +, -, * and / without operator precedence
grammar &amp; with operator precedence grammar.
*/


%{
#include "question_13_with_operator_precedence.tab.h"
#include <stdlib.h>
extern int yylval;
%}

%%
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[\t ]   { /* ignore spaces */ }
\n      { return 0; }
.       { return yytext[0]; }
%%

int yywrap() {
    return 1;
}