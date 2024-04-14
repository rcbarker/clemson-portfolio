/* Ryan Barker
   CPSC 3220
   leaktest7.c

   Purpose: Seventh and final test driver for leakcount program. Meant to simulate
            random behavior as efficiently as possible.
 */

#include <stdio.h>
#include <stdlib.h>

#define MAX_INTS 675
#define MAX_FLOATS 75
#define MAX_CHARS 1000
#define MAX_DOUBLES 350
#define MAX_LONGS 20

int main(int argc, char **argv) 
{
    if(argc != 2) { 
        fprintf(stderr, "error: usage - specify random number seed\n");
        exit(1);
    }

    printf("test 7: to test leakcount with this file, run:\n\t./leakcount ./leaktest7\n");
    printf("test 7: random behavior testing\n");
    printf("test 7: seeding random number generator...\n");
    srand(atoi(argv[1]));

    if(rand() % 2) {
        printf("test 7: declaring null int pointer...\n");
        int *ptr = NULL;
        printf("test 7: declared pointer. contents = %p\n", ptr);
        printf("test 7: freeing pointer...\n");
        free(ptr);
    }

    printf("test 7: mallocing a random number of pointers for varying variable types...\n"); 
   
    int *a = NULL;;
    float *b = NULL;
    char *c = NULL;
    double *d = NULL;
    long *e = NULL;
    int num_ints, num_floats, num_chars, num_doubles, num_longs;

    if(rand() % 2) { 
        num_ints = rand() % MAX_INTS + 1;
        a = malloc(num_ints*sizeof(int));
        printf("test 7: malloced space for %d int(s)\n", (int) num_ints);
    }
    if(rand() % 2) {
        num_floats = rand() % MAX_FLOATS + 1;
        b = malloc(num_floats*sizeof(float));
        printf("test 7: malloced space for %d float(s)\n", (int) num_floats);
    }
    if(rand() % 2) {
        num_chars = rand() % MAX_CHARS + 1;
        c = malloc(num_chars*sizeof(char));
        printf("test 7: malloced space for %d char(s)\n", (int) num_chars);
    }
    if(rand() % 2) {
        num_doubles = rand() % MAX_DOUBLES + 1;
        d = malloc(num_doubles*sizeof(double));
        printf("test 7: malloced space for %d double(s)\n", (int) num_doubles);
    }
    if(rand() % 2) {
        num_longs = rand() % MAX_LONGS + 1;
        e =  malloc(num_longs*sizeof(long));
        printf("test 7: malloced space for %d long(s)\n", (int) num_longs);
    }

    printf("test 7: freeing random ptrs from above allocation. ");
    printf("may free null ptrs...\n");  

    if(rand() % 2) {
        printf("test 7: freeing out of order\n");
        printf("test 7: freed - ");

        if(rand() % 2) {
            printf("floats ");
            free(b);
        }
        if(rand() % 2) { 
            printf("ints ");
            free(a);
        }
        if(rand() % 2) {
            printf("doubles ");
            free(d);
        }
        if(rand() % 2) {
            printf("chars ");
            free(c);
        }
        if(rand() % 2) {  
            printf("longs ");
            free(e);
        }
    } else {
        printf("test 7: freeing in order\n");
        printf("test 7: freed - ");

        if(rand() % 2) { 
            printf("ints ");
            free(a);
        }
        if(rand() % 2) {
            printf("floats ");
            free(b);
        }
        if(rand() % 2) {
            printf("chars ");
            free(c);
        }
        if(rand() % 2) {
            printf("doubles ");
            free(d);
        }
        if(rand() % 2) {  
            printf("longs ");
            free(e);
        }
    }

    printf("\ntest 7: end\n");

    return 0;
}

