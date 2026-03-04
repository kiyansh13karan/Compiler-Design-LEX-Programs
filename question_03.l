/* Design a LEX code to identify and print
integer and float value in given input
pattern. */


%{
#include<stdio.h>
%}

digit   [0-9]

%%

{digit}+            { printf("Integer: %s\n", yytext); }

{digit}+"."{digit}+ { printf("Float: %s\n", yytext); }

[ \t\n]+            ;   /* ignore spaces, tabs, newline */

.                   ;   /* ignore other characters */

%%

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}