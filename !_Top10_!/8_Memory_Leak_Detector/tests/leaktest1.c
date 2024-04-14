/* Ryan Barker
   CPSC 3220
   leaktest1.c

   Purpose: First test driver for leakcount program. Meant to test a general, simple 
            leakcount case where all memory is freed in order.
 */

#include <stdio.h>
#include <stdlib.h>

#define NUM_INTS 800
#define NUM_FLOATS 5
#define NUM_CHARS 500

int main(void) 
{
    printf("test 1: to test leakcount with this file, run:\n\t./leakcount ./leaktest1\n");
    printf("test 1: general mallocing testing\n");
    printf("test 1: mallocing memory...\n");
    int *x = malloc(NUM_INTS*sizeof(int));
    float *y = malloc(NUM_FLOATS*sizeof(float));
    char *z = malloc(NUM_CHARS*sizeof(char));

    printf("test 1: malloced ptrs for %d int(s), %d float(s), and %d char(s).\n", 
            (int) NUM_INTS, (int) NUM_FLOATS, (int) NUM_CHARS);
    printf("test 1: assigning values to int x, float y, and char z in dynamic memory...\n");
    *x = 7;
    *y = 10.52;
    *z = 'c';
    printf("test 1: x = %d, y = %4.2f, and z = %c.\n", *x, *y, *z);

    printf("test 1: freeing x, y, z in order...\n");  
    free(x);
    free(y);
    free(z);

    printf("test 1: end\n");

    return 0;
}
