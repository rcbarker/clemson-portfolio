/* Ryan Barker
   CPSC 3220
   leaktest6.c

   Purpose: Sixth test driver for leakcount program. Makes a single malloc
   call and then returns.
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) 
{
    if(argc != 2) {
        printf("error: usage - specify number of ints to malloc\n");
        exit(1);
    }

    printf("test 6: to test leakcount with this file, run:\n\t./leakcount ./leaktest6\n");
    printf("test 6: single malloc testing\n");
    printf("test 6: mallocing specified amount of ints\n");
    int *x = malloc(atoi(argv[1])*sizeof(int));
    printf("test 6: starting address of new memory = %p\n", x);
    printf("test 6: end\n");

    return 0;
}
