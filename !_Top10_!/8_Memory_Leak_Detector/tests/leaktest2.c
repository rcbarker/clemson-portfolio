/* Ryan Barker
   CPSC 3220
   leaktest2.c

   Purpose: Second test driver for leakcount program. Meant to test a general, simple 
            leakcount case where all memory is freed out of order.
 */

#include <stdio.h>
#include <stdlib.h>

#define NUM_INTS 600
#define NUM_FLOATS 15
#define NUM_CHARS 275

int main(void) 
{
    printf("test 2: to test leakcount with this file, run:\n\t./leakcount ./leaktest2\n");
    printf("test 2: general mallocing testing\n");
    printf("test 2: mallocing memory...\n");

    int *x = malloc(NUM_INTS*sizeof(int));
    float *y = malloc(NUM_FLOATS*sizeof(float));
    char *z = malloc(NUM_CHARS*sizeof(char));

    printf("test 2: malloced ptrs for %d int(s), %d float(s), and %d char(s).\n", 
            (int) NUM_INTS, (int) NUM_FLOATS, (int) NUM_CHARS);
    printf("test 2: assigning values to int x, float y, and char z in dynamic memory...\n");
    *x = 10;
    *y = 15.09;
    *z = 'z';
    printf("test 2: x = %d, y = %4.2f, and z = %c.\n", *x, *y, *z);

    printf("test 2: freeing x, y, z out of order...\n");  
    free(z);
    free(x);
    free(y);

    printf("test 2: end\n");

    return 0;
}
