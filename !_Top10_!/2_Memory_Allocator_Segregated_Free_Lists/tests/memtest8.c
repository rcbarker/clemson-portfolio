/* Ryan Barker
   CPSC 3220
   memtest8.c

   Purpose: Eighth test driver for allocator library. Meant to simulate
            random behavior for different data types. Tests random mallocs, 
            callocs, reallocs, and frees.
 */

#include <stdio.h>
#include "allocator.h"
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define MAX_INTS 8
#define MAX_FLOATS 2
#define MAX_CHARS 2048
#define MAX_DOUBLES 350
#define MAX_LONGS 50

uint64_t findMaxPowOf10(uint64_t num) {
    uint64_t rval = 1;
    while(num) {
        rval *= 10;
        num /= 10;
    }
    return rval;
}

void printptr(void * p)
{
	uint64_t num = (uint64_t) p;
	uint64_t pow10 = findMaxPowOf10((uint64_t)num);

	while(pow10) {
	    uint64_t digit = num / pow10;
	    char dig_char = digit+'0';
	    write(STDOUT_FILENO, &dig_char,1);
	    num -= digit * pow10;
	    pow10 /= 10;
	}
	write(STDOUT_FILENO, "\n",1);

}

int main(int argc, char **argv) 
{
    if(argc != 2) { 
        fprintf(stderr, "error: usage - specify random number seed\n");
        exit(1);
    }

    /* Seed random number generator. */
    srand(atoi(argv[1]));

    if(rand() % 2) {
        /* Declare NULL int ptr and free. */
        int *ptr = NULL;
        printptr(ptr);
        free(ptr);
    }

    /* Malloc and Calloc random number of pointers for varying types. */
    int *a = NULL, *f = NULL;;
    float *b = NULL, *g = NULL;
    char *c = NULL, *h = NULL;
    double *d = NULL, *i = NULL;
    long *e = NULL, *j = NULL;
    int num_ints, num_floats, num_chars, num_doubles, num_longs;
    int num_intsc, num_floatsc, num_charsc, num_doublesc, num_longsc;

    /* Malloc randomly. */
    if(rand() % 2) { 
        num_ints = rand() % MAX_INTS;
        a = malloc(num_ints*sizeof(int));
        printptr(a);
    }
    if(rand() % 2) {
        num_floats = rand() % MAX_FLOATS;
        b = malloc(num_floats*sizeof(float));
        printptr(b);
    }
    if(rand() % 2) {
        num_chars = rand() % MAX_CHARS;
        c = malloc(num_chars*sizeof(char));
        printptr(c);
    }
    if(rand() % 2) {
        num_doubles = rand() % MAX_DOUBLES;
        d = malloc(num_doubles*sizeof(double));
        printptr(d);
    }
    if(rand() % 2) {
        num_longs = rand() % MAX_LONGS;
        e =  malloc(num_longs*sizeof(long));
        printptr(e);
    }

   /* Calloc randomly. */
    if(rand() % 2) { 
        num_intsc = rand() % MAX_INTS;
        f = calloc(num_intsc, sizeof(int));
        printptr(f);
    }
    if(rand() % 2) {
        num_floatsc = rand() % MAX_FLOATS;
        g = calloc(num_floatsc, sizeof(float));
        printptr(g);
    }
    if(rand() % 2) {
        num_charsc = rand() % MAX_CHARS;
        h = calloc(num_charsc, sizeof(char));
        printptr(h);
    }
    if(rand() % 2) {
        num_doublesc = rand() % MAX_DOUBLES;
        i = calloc(num_doublesc, sizeof(double));
        printptr(i);
    }
    if(rand() % 2) {
        num_longsc = rand() % MAX_LONGS;
        j = calloc(num_longsc, sizeof(long));
        printptr(j);
    }

    /* Realloc pointers randomly. */
    if(rand() % 2) { 
        num_ints = rand() % MAX_INTS;
        a = realloc(a, num_ints*sizeof(int));
        printptr(a);
    }
    if(rand() % 2) {
        num_floats = rand() % MAX_FLOATS;
        b = realloc(b, num_floats*sizeof(float));
        printptr(b);
    }
    if(rand() % 2) {
        num_chars = rand() % MAX_CHARS;
        c = realloc(c, num_chars*sizeof(char));
        printptr(c);
    }
    if(rand() % 2) {
        num_doubles = rand() % MAX_DOUBLES;
        d = realloc(d, num_doubles*sizeof(double));
        printptr(d);
    }
    if(rand() % 2) {
        num_longs = rand() % MAX_LONGS;
        e =  realloc(e, num_longs*sizeof(long));
        printptr(e);
    }
    if(rand() % 2) { 
        num_intsc = rand() % MAX_INTS;
        f = realloc(f, num_intsc*sizeof(int));
        printptr(f);
    }
    if(rand() % 2) {
        num_floatsc = rand() % MAX_FLOATS;
        g = realloc(g, num_floatsc*sizeof(float));
        printptr(g);
    }
    if(rand() % 2) {
        num_charsc = rand() % MAX_CHARS;
        h = realloc(h, num_charsc*sizeof(char));
        printptr(h);
    }
    if(rand() % 2) {
        num_doublesc = rand() % MAX_DOUBLES;
        i = realloc(i, num_doublesc*sizeof(double));
        printptr(i);
    }
    if(rand() % 2) {
        num_longsc = rand() % MAX_LONGS;
        j =  realloc(j, num_longsc*sizeof(long));
        printptr(j);
    }

    /* Free pointers randomly - Printing a pointer signifies it was freed. */
    if(rand() % 2) {
        /* Out of order. */
        if(rand() % 2) {
            printptr(b);
            free(b);
        }        

        if(rand() % 2) {
            printptr(a);
            free(a);
        }

        if(rand() % 2) {
            printptr(d);
            free(d);
        }

        if(rand() % 2) {
            printptr(h);
            free(h);
        }

        if(rand() % 2) {
            printptr(e);
            free(e);
        }

        if(rand() % 2) {
            printptr(g);
            free(g);
        }

        if(rand() % 2) {
            printptr(f);
            free(f);
        }        

        if(rand() % 2) {
            printptr(j);
            free(j);
        }

        if(rand() % 2) {
            printptr(c);
            free(c);
        }

        if(rand() % 2) {
            printptr(i);
            free(i);
        }
    } else {
        /* In order. */
        if(rand() % 2) {
            printptr(a);
            free(a);
        }        

        if(rand() % 2) {
            printptr(b);
            free(b);
        }

        if(rand() % 2) {
            printptr(c);
            free(c);
        }

        if(rand() % 2) {
            printptr(d);
            free(d);
        }

        if(rand() % 2) {
            printptr(e);
            free(e);
        }
        if(rand() % 2) {
            printptr(f);
            free(f);
        }        

        if(rand() % 2) {
            printptr(g);
            free(g);
        }

        if(rand() % 2) {
            printptr(h);
            free(h);
        }

        if(rand() % 2) {
            printptr(i);
            free(i);
        }

        if(rand() % 2) {
            printptr(j);
            free(j);
        }
    }

    return 0;
}
