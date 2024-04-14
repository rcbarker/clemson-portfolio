/* Ryan Barker
   CPSC 3220
   leaktest4.c

   Purpose: Fourth test driver for leakcount program. Meant to test null pointers with
            leakcount (freeing address that wasn't malloced) and further test general leakcount 
            cases.
 */

#include <stdio.h>
#include <stdlib.h>

#define NUM_INTS 1000
#define NUM_FLOATS 450
#define NUM_CHARS 875
#define NUM_DOUBLES 30 
#define NUM_LONGS 1

int main(void) 
{
    printf("test 4: to test leakcount with this file, run:\n\t./leakcount ./leaktest4\n");
    printf("test 4: null pointer and large memory allocation testing\n");
    printf("test 4: declaring null int pointer...\n");
    int *ptr = NULL;
    printf("test 4: declared pointer. contents = %p\n", ptr);
    printf("test 4: freeing pointer...\n");
    free(ptr);

    printf("test 4: mallocing 5 pointers for varying variable types...\n"); 
    int *a = malloc(NUM_INTS*sizeof(int));
    float *b = malloc(NUM_FLOATS*sizeof(float));
    char *c = malloc(NUM_CHARS*sizeof(char));
    double *d = malloc(NUM_DOUBLES*sizeof(double));
    long *e =  malloc(NUM_LONGS*sizeof(long));

    printf("test 4: malloced space for %d int(s), %d float(s), %d char(s), ", 
            (int) NUM_INTS, (int) NUM_FLOATS, (int) NUM_CHARS);
    printf("%d double(s)\n", (int) NUM_DOUBLES);
    printf("test 4: and %d long(s).\n", (int) NUM_LONGS);
    printf("test 4: printing first addresses for each: %p %p %p %p %p\n", a, b, c, d, e);
    printf("test 4: freeing int(s), char(s), and long(s) out of order...\n");  
    free(c);
    free(e);
    free(a);

    printf("test 4: end\n");

    return 0;
}
