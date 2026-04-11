%{
#include "question_13_without_operator_precedence.tab.h"
#include <stdlib.h>
extern int yylval;
%}

%%
[0-9]+  { yylval = atoi(yytext); return NUMBER; } /* convert Number to Integer and sends to YACC */
[\t ]   { /* ignore spaces */ }
\n      { return 0; } /* gives output on pressing enter */
.       { return yytext[0]; }
%%

int yywrap() {
    return 1;
}