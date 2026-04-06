/*
Design a DFA in LEX code to identify and print Integer &amp ; Float Constants 
and Identfiers.
*/


%{
#include<stdio.h>
%}

digit      [0-9]
letter     [a-zA-Z]
id         {letter}({letter}|{digit})*
integer    {digit}+
float      {digit}+"."{digit}+

%%

{float}      { printf("Float Constant: %s\n", yytext); }

{integer}    { printf("Integer Constant: %s\n", yytext); }

{id}         { printf("Identifier: %s\n", yytext); }

[ \t\n]+     ;  

.            { printf("Invalid: %s\n", yytext); }

%%

int main()
{
    printf("Enter Input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}