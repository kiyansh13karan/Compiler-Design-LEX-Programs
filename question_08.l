/*
Design a LEX code to extract all html tags in the given HTML 
file at run time and store into Text file given at run time. 
*/


%{
#include <stdio.h>
%}

%%

"<"[^>]+">" { fprintf(yyout, "%s\n", yytext); }
.|\n        { /* Ignore everything else */ }

%%

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Usage: ./a.out <input.html> <output.txt>\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Cannot open input file '%s'\n", argv[1]);
        return 1;
    }

    yyout = fopen(argv[2], "w");
    if (!yyout) {
        printf("Error: Cannot create output file '%s'\n", argv[2]);
        fclose(yyin);
        return 1;
    }

    yylex();

    printf("HTML tags extracted successfully! Check '%s'.\n", argv[2]);

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}