/* Design a LEX code to identify and print
valid Identifiers of C/C++ in given
input pattern. */


%{
#include<stdio.h>
%}

identifier [a-zA-Z_][a-zA-Z0-9_]*

%%

{identifier}    { printf("Valid Identifier: %s\n", yytext); }

[ \t\n]+        ;   /* ignore spaces, tabs, new lines */

.               ;   /* ignore other characters */

%%

int main()
{
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}