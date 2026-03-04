/* Design a LEX code to count and print
the number of total characters, words,
white spaces in given "Input.txt" file. */


%{
#include<stdio.h>

int chars = 0;
int words = 0;
int spaces = 0;
%}

%%

[ \t\n]        { spaces++; chars++; }

[a-zA-Z0-9]+   { words++; chars += yyleng; }

.              { chars++; }

%%

int main()
{
    FILE *fp;
    fp = fopen("Input.txt","r");

    if(fp == NULL)
    {
        printf("File not found\n");
        return 0;
    }

    yyin = fp;
    yylex();

    printf("Total Characters : %d\n", chars);
    printf("Total Words      : %d\n", words);
    printf("White Spaces     : %d\n", spaces);

    fclose(fp);
    return 0;
}

int yywrap()
{
    return 1;
}