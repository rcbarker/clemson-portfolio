/* Ryan Barker 
   CPSC/ECE 3520 Spring 2015
   SDE 1 - C File
 */

#include "motion.tab.c"
#include "lex.yy.c"
#include "yyerror.c"
#define YY_ERROR_VERBOSE

int main(void)
{
  printf("\n Motion Trajectory Checker(Scanner/Parser)\n");
  printf(" CPSC/ECE 3520 Spring 2015\n"); 

  if(yyparse() == -1) printf("syntax error\n");

  return(1);
}
