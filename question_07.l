/*
Design a LEX code to remove the comments from any 
C program given at run time and store into 'out.c' file. 
*/


%{
#include <stdio.h>
%}

%x MULTILINE_COMMENT

%%

"//".* { }

"/*"                    { BEGIN(MULTILINE_COMMENT); }
<MULTILINE_COMMENT>"*/" { BEGIN(INITIAL); }
<MULTILINE_COMMENT>.|\n { }

\"(\\.|[^"\\])*\"       { fprintf(yyout, "%s", yytext); }
\'(\\.|[^'\\])*\'       { fprintf(yyout, "%s", yytext); }

.|\n                    { fprintf(yyout, "%s", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            printf("Error: Cannot open input file '%s'\n", argv[1]);
            return 1;
        }
    } else {
        printf("Usage: ./a.out <input_file.c>\n");
        return 1;
    }

    yyout = fopen("out.c", "w");
    if (!yyout) {
        printf("Error: Cannot create 'out.c' file\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    printf("Comments removed successfully! Check 'out.c'.\n");

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}