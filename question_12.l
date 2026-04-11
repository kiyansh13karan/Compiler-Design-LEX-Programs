%{
#include "question_12.tab.h"
%}

%%

[0-9]+      { return NUMBER; }

[a-zA-Z]+   { return ID; }

"+"         { return '+'; }

"-"         { return '-'; }

"*"         { return '*'; }

"/"         { return '/'; }

"("         { return '('; }

")"         { return ')'; }

[ \t\n]     ;

.           { printf("Invalid Character\n"); }

%%

int yywrap()
{
return 1;
}