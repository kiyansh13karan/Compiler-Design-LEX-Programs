%{
#include <stdio.h>
%}

/* Define the 7 exclusive states (INITIAL acts as the 8th state: BBB) */
%x BBA
%x BAB
%x BAA
%x ABB
%x ABA
%x AAB
%x AAA

%%

    /* Transitions from INITIAL (History: ...bbb) */
<INITIAL>a  { BEGIN BBA; }
<INITIAL>b  { /* Stay in INITIAL */ }
<INITIAL>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<INITIAL>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from BBA (History: ...bba) */
<BBA>a  { BEGIN BAA; }
<BBA>b  { BEGIN BAB; }
<BBA>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<BBA>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from BAB (History: ...bab) */
<BAB>a  { BEGIN ABA; }
<BAB>b  { BEGIN ABB; }
<BAB>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<BAB>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from BAA (History: ...baa) */
<BAA>a  { BEGIN AAA; }
<BAA>b  { BEGIN AAB; }
<BAA>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<BAA>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from ABB (History: ...abb) */
<ABB>a  { BEGIN BBA; }
<ABB>b  { BEGIN INITIAL; } /* Back to BBB */
<ABB>\n { printf("Result: String ACCEPTED\n\n"); BEGIN INITIAL; }
<ABB>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from ABA (History: ...aba) */
<ABA>a  { BEGIN BAA; }
<ABA>b  { BEGIN BAB; }
<ABA>\n { printf("Result: String ACCEPTED\n\n"); BEGIN INITIAL; }
<ABA>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from AAB (History: ...aab) */
<AAB>a  { BEGIN ABA; }
<AAB>b  { BEGIN ABB; }
<AAB>\n { printf("Result: String ACCEPTED\n\n"); BEGIN INITIAL; }
<AAB>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from AAA (History: ...aaa) */
<AAA>a  { BEGIN AAA; }
<AAA>b  { BEGIN AAB; }
<AAA>\n { printf("Result: String ACCEPTED\n\n"); BEGIN INITIAL; }
<AAA>.  { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    printf("Enter a string consisting of 'a' and 'b' (Press Enter to evaluate):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}