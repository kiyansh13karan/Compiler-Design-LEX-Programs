/* Design a LEX code for Tokenizing
(Identify and print OPERATORS,
SEPARATORS, KEYWORDS,
IDENTIFIERS) in the C-fragment. */


%{
#include <stdio.h>
%}

/* Regular definitions */
letter      [a-zA-Z_]
digit       [0-9]
id          {letter}({letter}|{digit})*
number      {digit}+(\.{digit}+)?

%%

    /* 1. KEYWORDS */
"int"|"float"|"char"|"double"|"void"|"if"|"else"|"while"|"for"|"do"|"return"|"break"|"continue" {
    printf("KEYWORD    : %s\n", yytext);
}

    /* 2. IDENTIFIERS */
{id} {
    printf("IDENTIFIER : %s\n", yytext);
}

    /* 3. OPERATORS */
"+"|"-"|"*"|"/"|"%"|"="|"=="|"!="|"<"|">"|"<="|">="|"++"|"--"|"&&"|"||"|"!"|"&"|"|" {
    printf("OPERATOR   : %s\n", yytext);
}

    /* 4. SEPARATORS (Delimiters) */
"("|")"|"{"|"}"|"["|"]"|";"|"," {
    printf("SEPARATOR  : %s\n", yytext);
}

    /* NUMBERS */
{number} {
    printf("NUMBER     : %s\n", yytext);
}

    /* Ignore Whitespace, Tabs, and Newlines */
[ \t\n\r]+ {
    /* Do nothing */
}

    /* Ignore Comments */
"//".* {
    /* Ignore single-line comments */
}
"/*"([^*]|\*+[^*/])*\*+"/" {
    /* Ignore multi-line comments */
}

    /* Catch-all for anything else */
. {
    printf("UNKNOWN    : %s\n", yytext);
}

%%

/* Required function that Lex calls at end of input */
int yywrap() {
    return 1;
}

/* Main function - strictly interactive */
int main() {
    printf("--- Lexical Analyzer ---\n");
    printf("Enter your C code below.\n");
    printf("To finish input, press Ctrl+D (Mac/Linux) or Ctrl+Z (Windows) then Enter:\n");
    printf("-----------------------------------------------------------------------\n\n");
    
    // yylex() automatically reads from standard input (your keyboard)
    yylex();
    
    printf("\n--- Lexical Analysis Finished ---\n");
    return 0;
}