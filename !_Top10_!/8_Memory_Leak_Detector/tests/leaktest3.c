/* Ryan Barker
   CPSC 3220
   leaktest3.c

   Purpose: Third test driver for leakcount program. Meant to test a general, simple 
            leakcount case.
 */

#include <stdio.h>
#include <stdlib.h>

#define NUM_INTS 500
#define NUM_FLOATS 12
#define NUM_CHARS 85

int main(void) 
{
    printf("test 3: to test leakcount with this file, run:\n\t./leakcount ./leaktest3\n");
    printf("test 3: general mallocing testing\n");
    printf("test 3: mallocing memory...\n");
    int *x = malloc(NUM_INTS*sizeof(int));
    float *y = malloc(NUM_FLOATS*sizeof(float));
    char *z = malloc(NUM_CHARS*sizeof(char));

    printf("test 3: malloced ptrs for %d int(s), %d float(s), and %d char(s).\n", 
            (int) NUM_INTS, (int) NUM_FLOATS, (int) NUM_CHARS);
    printf("test 3: assigning values to int x, float y, and char z in dynamic memory...\n");
    *x = 7;
    *y = 10.52;
    *z = 'c';
    printf("test 3: x = %d, y = %4.2f, and z = %c.\n", *x, *y, *z);

    printf("test 3: freeing y...\n");  
    free(y);

    printf("test 3: end\n");

    return 0;
}
