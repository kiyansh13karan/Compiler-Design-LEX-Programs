/* Design a LEX code to replace white spaces
of "Input.txt" file by a single blank
characters into "Output.txt" file. */


%{
#include<stdio.h>
%}

%%

[ \t\n]+      { fprintf(yyout," "); }

.             { fprintf(yyout,"%s", yytext); }

%%

int main()
{
    FILE *in, *out;

    in = fopen("Input.txt","r");
    out = fopen("Output.txt","w");

    if(in == NULL || out == NULL)
    {
        printf("File error\n");
        return 0;
    }

    yyin = in;
    yyout = out;

    yylex();

    fclose(in);
    fclose(out);

    printf("White spaces replaced successfully.\n");
    return 0;
}

int yywrap()
{
    return 1;
}