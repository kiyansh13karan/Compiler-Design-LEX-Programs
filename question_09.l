/*
Design a DFA in LEX code which accepts string containing even number
of 'a' and even number of 'b' over input alphabet {a,b}.            
*/


%{
#include <stdio.h>
%}

/* Define exclusive states for the DFA */
%x STATE_A
%x STATE_B
%x STATE_C

%%

    /* Transitions from INITIAL State (Even a, Even b) */
<INITIAL>a  { BEGIN STATE_A; }
<INITIAL>b  { BEGIN STATE_B; }
<INITIAL>\n { printf("Result: String ACCEPTED\n\n"); BEGIN INITIAL; }
<INITIAL>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from STATE_A (Odd a, Even b) */
<STATE_A>a  { BEGIN INITIAL; }
<STATE_A>b  { BEGIN STATE_C; }
<STATE_A>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<STATE_A>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from STATE_B (Even a, Odd b) */
<STATE_B>a  { BEGIN STATE_C; }
<STATE_B>b  { BEGIN INITIAL; }
<STATE_B>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<STATE_B>.  { printf("Invalid character: %s\n", yytext); }

    /* Transitions from STATE_C (Odd a, Odd b) */
<STATE_C>a  { BEGIN STATE_B; }
<STATE_C>b  { BEGIN STATE_A; }
<STATE_C>\n { printf("Result: String REJECTED\n\n"); BEGIN INITIAL; }
<STATE_C>.  { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    printf("Enter a string consisting of 'a' and 'b' (Press Enter to evaluate):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}