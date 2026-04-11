/*
Design a LEX code to extract all html tags in the given HTML 
file at run time and store into Text file given at run time. 
*/


%{
#include<stdio.h>
%}

%%

\<[^>]*\>      { fprintf(yyout,"%s\n",yytext); }

.|\n           ;

%%

int main(int argc,char *argv[])
{
    if(argc!=3)
    {
        printf("Usage: ./a.exe input.html output.txt\n");
        return 0;
    }

    yyin=fopen(argv[1],"r");
    yyout=fopen(argv[2],"w");

    yylex();

    printf("HTML tags extracted successfully\n");

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap()
{
    return 1;
}