/* Ryan Barker 
   CPSC/ECE 3520 Spring 2015
   SDE1 - Bison Grammar File
 */

%{
#include <stdio.h>
#include <string.h>
int yylex (void);
int yyerror (char *s);

/* Global variables necessary for operation */
int updown = 0;
int leftright = 0;
int motion = 0;
%}

%union{
int numval;
char *ideptr;
}

%token NEWLINE;
%token ERROR;
%token <ideptr> DIR;
%token <numval> NUM;
%type <ideptr> direction;
%type <numval> number;

%% /* Grammar Rules */

trajectory: motionlist NEWLINE { printf("\n\n***** congratulations *****\n");
                                 printf("***** scan/parse for valid motion path successful "); 
                                 if(motion && !updown && !leftright) printf("AND CLOSED PATH ");
                                 printf("*****\n"); 
                                 return 0; }
;
motionlist: motion | motion motionlist
;
motion: direction { if(!motion && strcmp($1, "n") != 0) motion = 1;
                    if(!strcmp($1, "u")) updown++;
                    else if(!strcmp($1, "d")) updown--;
                    else if(!strcmp($1, "l")) leftright--;
                    else if(!strcmp($1, "r")) leftright++; }
        | direction number { if(!motion && strcmp($1, "n") != 0) motion = 1;
                             if(!strcmp($1, "u")) updown += (int) $2;
                             else if(!strcmp($1, "d")) updown -= (int) $2;
                             else if(!strcmp($1, "l")) leftright -= (int) $2;
                             else if(!strcmp($1, "r")) leftright += (int) $2; }
;
direction: DIR { $$ = $1; }
;
number: NUM { $$ = $1; }
;

%%
