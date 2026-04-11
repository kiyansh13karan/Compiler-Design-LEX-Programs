/*
Design YACC/LEX code to recognize valid arithmetic expression 
with opertors +,-,* and /.
*/

%{
#include "question_12.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?       { return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { return NUMBER; }  /* Ye line add ki hai alphabets ke liye */
[\t ]                   { ; }
\n                      { return 0; }
.                       { return yytext[0]; }
%%

int yywrap() { return 1; }