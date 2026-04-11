%{
#include "question_13_with_operator_precedence.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }

"+" return '+';
"-" return '-';
"*" return '*';
"/" return '/';
"(" return '(';
")" return ')';

[ \t\n] ;

. return yytext[0];

%%

int yywrap()
{
return 1;
}