/* Design a LEX code to count the number
of lines, space, tab-meta character, and
rest of characters in each Input pattern. */

%{
#include<stdio.h>

int lines = 0;
int spaces = 0;
int tabs = 0;
int chars = 0;
%}

%%

\n      { lines++; }
" "     { spaces++; }
\t      { tabs++; }
.       { chars++; }

%%

int main()
{
    yylex();

    printf("Number of lines: %d\n", lines);
    printf("Number of spaces: %d\n", spaces);
    printf("Number of tabs: %d\n", tabs);
    printf("Number of other characters: %d\n", chars);

    return 0;
}

int yywrap()
{
    return 1;
}