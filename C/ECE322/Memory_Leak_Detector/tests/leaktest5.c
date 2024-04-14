/* Ryan Barker
   CPSC 3220
   leaktest5.c

   Purpose: Fifth test driver for leakcount program. Makes a single free
   call on a null pointer and then returns.
 */

#include <stdlib.h>
#include <stdio.h>

int main(void) 
{
    printf("test 5: to test leakcount with this file, run:\n\t./leakcount ./leaktest5\n");
    printf("test 5: single free testing\n");
    printf("test 5: freeing a single NULL pointer\n");
    free(NULL);
    printf("test 5: end\n");
    return 0;
}
