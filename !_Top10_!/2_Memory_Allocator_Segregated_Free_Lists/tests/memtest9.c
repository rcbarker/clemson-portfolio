/* Ryan Barker
   CPSC 3220
   memtest9.c

   Purpose: Nineth and final test driver for allocator library. Meant to simulate
            BRUTAL random behavior for each segment size. Tests random mallocs, callocs,
            reallocs, and frees.
 */

#include "allocator.h"
#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define MAX_SEG1 100
#define MAX_SEG2 30
#define MAX_SEG3 25
#define MAX_SEG4 19
#define MAX_SEG5 17
#define MAX_SEG6 13
#define MAX_SEG7 12
#define MAX_SEG8 9
#define MAX_SEG9 4
#define MAX_SEG10 2
#define MAX_LARGE 2

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

    /* Start with simple, unique cases. */
    int *ptr;
    if(rand() % 2) {
        /* Malloc size 0 and assert. */
        ptr = malloc(0);
        printptr(ptr);
        assert(ptr == NULL);
    }

    if(rand() % 2) {
        /* Calloc size 0 and assert. */
        ptr = calloc(8675309, 0);
        printptr(ptr);
        assert(ptr == NULL);

        /* Calloc size 0 and assert. */
        ptr = calloc(0, 8675309);
        printptr(ptr);
        assert(ptr == NULL);
    }

    if(rand() % 2) {
        /* Free NULL. */
        ptr = NULL;
        printptr(ptr);
        free(ptr);
    }

    if(rand() % 2) {
        /* Realloc NULL pointer and free with realloc. */
        ptr = NULL;
        ptr = realloc(ptr, 2);
        printptr(ptr);
        ptr = realloc(ptr, 0);
    }

    /* Malloc and calloc a random number of pointers for objects of varying sizes. */
    int num_seg1, num_seg2, num_seg3, num_seg4, num_seg5, num_seg6, num_seg7;
    int num_seg8, num_seg9, num_seg10, num_large;
    int num_seg1c, num_seg2c, num_seg3c, num_seg4c, num_seg5c, num_seg6c, num_seg7c;
    int num_seg8c, num_seg9c, num_seg10c, num_largec;
    uint8_t **a = NULL, **b = NULL, **c = NULL, **d = NULL, **e = NULL, **f = NULL, **g = NULL;
    uint8_t **h = NULL, **j = NULL, **k = NULL, **l = NULL;
    uint8_t **a2 = NULL, **b2 = NULL, **c2 = NULL, **d2 = NULL, **e2 = NULL, **f2 = NULL; 
    uint8_t **g2 = NULL, **h2 = NULL, **j2 = NULL, **k2 = NULL, **l2 = NULL;
    int i;

    /* Malloc randomly. */
    if(rand() % 2) { 
        num_seg1 = rand() % MAX_SEG1;
        a = malloc(num_seg1*sizeof(uint8_t *));
        for(i = 0; i < num_seg1; ++i) a[i] = malloc(2);
        printptr(a);
    }
    if(rand() % 2) {
        num_seg2 = rand() % MAX_SEG2;
        b = malloc(num_seg2*sizeof(uint8_t *));
        for(i = 0; i < num_seg2; ++i) b[i] = malloc(4);
        printptr(b);
    }
    if(rand() % 2) {
        num_seg3 = rand() % MAX_SEG3;
        c = malloc(num_seg3*sizeof(uint8_t *));
        for(i = 0; i < num_seg3; ++i) c[i] = malloc(8);
        printptr(c);
    }
    if(rand() % 2) {
        num_seg4 = rand() % MAX_SEG4;
        d = malloc(num_seg4*sizeof(uint8_t *));
        for(i = 0; i < num_seg4; ++i) d[i] = malloc(16);
        printptr(d);
    }
    if(rand() % 2) {
        num_seg5 = rand() % MAX_SEG5;
        e = malloc(num_seg5*sizeof(uint8_t *));
        for(i = 0; i < num_seg5; ++i) e[i] = malloc(32);
        printptr(e);
    }
    if(rand() % 2) {
        num_seg6 = rand() % MAX_SEG6;
        f = malloc(num_seg6*sizeof(uint8_t *));
        for(i = 0; i < num_seg6; ++i) f[i] = malloc(64);
        printptr(f);
    }
    if(rand() % 2) {
        num_seg7 = rand() % MAX_SEG7;
        g = malloc(num_seg7*sizeof(uint8_t *));
        for(i = 0; i < num_seg7; ++i) g[i] = malloc(128);
        printptr(g);
    }
    if(rand() % 2) {
        num_seg8 = rand() % MAX_SEG8;
        h = malloc(num_seg8*sizeof(uint8_t *));
        for(i = 0; i < num_seg8; ++i) h[i] = malloc(256);
        printptr(h);
    }
    if(rand() % 2) {
        num_seg9 = rand() % MAX_SEG9;
        j = malloc(num_seg9*sizeof(uint8_t *));
        for(i = 0; i < num_seg9; ++i) j[i] = malloc(512);
        printptr(j);
    }
    if(rand() % 2) {
        num_seg10 = rand() % MAX_SEG10;
        k = malloc(num_seg10*sizeof(uint8_t *));
        for(i = 0; i < num_seg10; ++i) k[i] = malloc(1024);
        printptr(k);
    }
    if(rand() % 2) {
        num_large = rand() % MAX_LARGE;
        l = malloc(num_large*sizeof(uint8_t *));
        for(i = 0; i < num_large; ++i) l[i] = malloc(1025);
        printptr(l);
    }
	
    /* Calloc Randomly. */
    if(rand() % 2) { 
        num_seg1c = rand() % MAX_SEG1;
        a2 = calloc(num_seg1c, sizeof(uint8_t *));
        for(i = 0; i < num_seg1c; ++i) a2[i] = calloc(2, 1);
        printptr(a2);
    }
    if(rand() % 2) {
        num_seg2c = rand() % MAX_SEG2;
        b2 = calloc(num_seg2c, sizeof(uint8_t *));
        for(i = 0; i < num_seg2c; ++i) b2[i] = calloc(1, 4);
        printptr(b2);
    }
    if(rand() % 2) {
        num_seg3c = rand() % MAX_SEG3;
        c2 = calloc(num_seg3c, sizeof(uint8_t *));
        for(i = 0; i < num_seg3c; ++i) c2[i] = calloc(8, 1);
        printptr(c2);
    }
    if(rand() % 2) {
        num_seg4c = rand() % MAX_SEG4;
        d2 = calloc(num_seg4c, sizeof(uint8_t *));
        for(i = 0; i < num_seg4c; ++i) d2[i] = calloc(1, 16);
        printptr(d2);
    }
    if(rand() % 2) {
        num_seg5c = rand() % MAX_SEG5;
        e2 = calloc(num_seg5c, sizeof(uint8_t *));
        for(i = 0; i < num_seg5c; ++i) e2[i] = calloc(32, 1);
        printptr(e2);
    }
    if(rand() % 2) {
        num_seg6c = rand() % MAX_SEG6;
        f2 = calloc(num_seg6c, sizeof(uint8_t *));
        for(i = 0; i < num_seg6c; ++i) f2[i] = calloc(1, 64);
        printptr(f2);
    }
    if(rand() % 2) {
        num_seg7c = rand() % MAX_SEG7;
        g2 = calloc(num_seg7c, sizeof(uint8_t *));
        for(i = 0; i < num_seg7c; ++i) g2[i] = calloc(128, 1);
        printptr(g2);
    }
    if(rand() % 2) {
        num_seg8c = rand() % MAX_SEG8;
        h2 = calloc(num_seg8c, sizeof(uint8_t *));
        for(i = 0; i < num_seg8c; ++i) h2[i] = calloc(1, 256);
        printptr(h2);
    }
    if(rand() % 2) {
        num_seg9c = rand() % MAX_SEG9;
        j2 = calloc(num_seg9c, sizeof(uint8_t *));
        for(i = 0; i < num_seg9c; ++i) j2[i] = calloc(512, 1);
        printptr(j2);
    }
    if(rand() % 2) {
        num_seg10c = rand() % MAX_SEG10;
        k2 = calloc(num_seg10c, sizeof(uint8_t *));
        for(i = 0; i < num_seg10c; ++i) k2[i] = calloc(1, 1024);
        printptr(k2);
    }
    if(rand() % 2) {
        num_largec = rand() % MAX_LARGE;
        l2 = calloc(num_largec, sizeof(uint8_t *));
        for(i = 0; i < num_largec; ++i) l2[i] = calloc(1025, 1);
        printptr(l2);
    }


    /* Realloc pointers randomly - Skip if top level pointers NULL. */
    if(rand() % 2) {
        num_seg1 = num_seg1 / 2;
        if(a != NULL) for(i = 0; i < num_seg1; ++i) a[i] = realloc(a[i], (rand() % 2) + 1);
        printptr(a);
    }
    if(rand() % 2) {
        num_seg2 = num_seg2 / 2;
        if(b != NULL) for(i = 0; i < num_seg2; ++i) b[i] = realloc(b[i], (rand() % 2) + 1);
        printptr(b);
    }
    if(rand() % 2) {
        num_seg3 = num_seg3 / 2;
        if(c != NULL) for(i = 0; i < num_seg3; ++i) c[i] = realloc(c[i], (rand() % 2) + 1);
        printptr(c);
    }
    if(rand() % 2) {
        num_seg4 = num_seg4 / 2;
        if(d != NULL) for(i = 0; i < num_seg4; ++i) d[i] = realloc(d[i], (rand() % 2) + 1);
        printptr(d);
    }
    if(rand() % 2) {
        num_seg5 = num_seg5 / 2;
        if(e != NULL) for(i = 0; i < num_seg5; ++i) e[i] = realloc(e[i], (rand() % 2) + 1);
        printptr(e);
    }
    if(rand() % 2) {
        num_seg6 = num_seg6 / 2;
        if(f != NULL) for(i = 0; i < num_seg6; ++i) f[i] = realloc(f[i], (rand() % 2) + 1);
        printptr(f);
    }
    if(rand() % 2) {
        num_seg7 = num_seg7 / 2;
        if(g != NULL) for(i = 0; i < num_seg7; ++i) g[i] = realloc(g[i], (rand() % 2) + 1);
        printptr(g);
    }
    if(rand() % 2) {
        num_seg8 = num_seg8 / 2;
        if(h != NULL) for(i = 0; i < num_seg8; ++i) h[i] = realloc(h[i], (rand() % 2) + 1);
        printptr(h);
    }
    if(rand() % 2) {
        num_seg9 = num_seg9 / 2;
        if(j != NULL) for(i = 0; i < num_seg9; ++i) j[i] = realloc(j[i], (rand() % 2) + 1);
        printptr(j);
    }
    if(rand() % 2) {
        num_seg10 = num_seg10 / 2;
        if(k != NULL) for(i = 0; i < num_seg10; ++i) k[i] = realloc(k[i], (rand() % 2) + 1);
        printptr(k);
    }
    if(rand() % 2) {
        num_large = num_large / 2;
        if(l != NULL) for(i = 0; i < num_large; ++i) l[i] = realloc(l[i], (rand() % 2) + 1);
        printptr(l);
    }

    /* Realloc's for calloc's. */
    if(rand() % 2) {
        num_seg1c = num_seg1c / 2;
        if(a2 != NULL) for(i = 0; i < num_seg1c; ++i) a2[i] = realloc(a2[i], (rand() % 2) + 1);
        printptr(a2);
    }
    if(rand() % 2) {
        num_seg2c = num_seg2c / 2;
        if(b2 != NULL) for(i = 0; i < num_seg2c; ++i) b2[i] = realloc(b2[i], (rand() % 2) + 1);
        printptr(b2);
    }
    if(rand() % 2) {
        num_seg3c = num_seg3c / 2;
        if(c2 != NULL) for(i = 0; i < num_seg3c; ++i) c2[i] = realloc(c2[i], (rand() % 2) + 1);
        printptr(c2);
    }
    if(rand() % 2) {
        num_seg4c = num_seg4c / 2;
        if(d2 != NULL) for(i = 0; i < num_seg4c; ++i) d2[i] = realloc(d2[i], (rand() % 2) + 1);
        printptr(d2);
    }
    if(rand() % 2) {
        num_seg5c = num_seg5c / 2;
        if(e2 != NULL) for(i = 0; i < num_seg5c; ++i) e2[i] = realloc(e2[i], (rand() % 2) + 1);
        printptr(e2);
    }
    if(rand() % 2) {
        num_seg6c = num_seg6c / 2;
        if(f2 != NULL) for(i = 0; i < num_seg6c; ++i) f2[i] = realloc(f2[i], (rand() % 2) + 1);
        printptr(f2);
    }
    if(rand() % 2) {
        num_seg7c = num_seg7c / 2;
        if(g2 != NULL) for(i = 0; i < num_seg7c; ++i) g2[i] = realloc(g2[i], (rand() % 2) + 1);
        printptr(g2);
    }
    if(rand() % 2) {
        num_seg8c = num_seg8c / 2;
        if(h2 != NULL) for(i = 0; i < num_seg8c; ++i) h2[i] = realloc(h2[i], (rand() % 2) + 1);
        printptr(h2);
    }
    if(rand() % 2) {
        num_seg9c = num_seg9c / 2;
        if(j2 != NULL) for(i = 0; i < num_seg9c; ++i) j2[i] = realloc(j2[i], (rand() % 2) + 1);
        printptr(j2);
    }
    if(rand() % 2) {
        num_seg10c = num_seg10c / 2;
        if(k2 != NULL) for(i = 0; i < num_seg10c; ++i) k2[i] = realloc(k2[i], (rand() % 2) + 1);
        printptr(k2);
    }
    if(rand() % 2) {
        num_largec = num_largec / 2;
        if(l2 != NULL) for(i = 0; i < num_largec; ++i) l2[i] = realloc(l2[i], (rand() % 2) + 1);
        printptr(l2);
    }

    /* Free pointers randomly - Printing a pointer signifies it was freed. */
    if(rand() % 2) {
        printptr(a);
        if(a != NULL) for(i = 0; i < num_seg1; ++i) free(a[i]);
        free(a);
    }
    if(rand() % 2) {
        printptr(b);
        if(b != NULL) for(i = 0; i < num_seg2; ++i) free(b[i]);
        free(b);
    }
    if(rand() % 2) {
        printptr(c);
        if(c != NULL) for(i = 0; i < num_seg3; ++i) free(c[i]);
        free(c);
    }
    if(rand() % 2) {
        printptr(d);
        if(d != NULL) for(i = 0; i < num_seg4; ++i) free(d[i]);
        free(d);
    }
    if(rand() % 2) {
        printptr(e);
        if(e != NULL) for(i = 0; i < num_seg5; ++i) free(e[i]);
        free(e);
    }
    if(rand() % 2) {
        printptr(f);
        if(f != NULL) for(i = 0; i < num_seg6; ++i) free(f[i]);
        free(f);
    }
    if(rand() % 2) {
        printptr(g);
        if(g != NULL) for(i = 0; i < num_seg7; ++i) free(g[i]);
        free(g);
    }
    if(rand() % 2) {
        printptr(h);
        if(h != NULL) for(i = 0; i < num_seg8; ++i) free(h[i]);
        free(h);
    }
    if(rand() % 2) {
        printptr(j);
        if(j != NULL) for(i = 0; i < num_seg9; ++i) free(j[i]);
        free(j);
    }
    if(rand() % 2) {
        printptr(k);
        if(k != NULL) for(i = 0; i < num_seg10; ++i) free(k[i]);
        free(k);
    }
    if(rand() % 2) {
        printptr(l);
        if(l != NULL) for(i = 0; i < num_large; ++i) free(l[i]);
        free(l);
    }

    /* Free's for calloc's */
    if(rand() % 2) {
        printptr(a2);
        if(a2 != NULL) for(i = 0; i < num_seg1c; ++i) free(a2[i]);
        free(a2);
    }
    if(rand() % 2) {
        printptr(b2);
        if(b2 != NULL) for(i = 0; i < num_seg2c; ++i) free(b2[i]);
        free(b2);
    }
    if(rand() % 2) {
        printptr(c2);
        if(c2 != NULL) for(i = 0; i < num_seg3c; ++i) free(c2[i]);
        free(c2);
    }
    if(rand() % 2) {
        printptr(d2);
        if(d2 != NULL) for(i = 0; i < num_seg4c; ++i) free(d2[i]);
        free(d2);
    }
    if(rand() % 2) {
        printptr(e2);
        if(e2 != NULL) for(i = 0; i < num_seg5c; ++i) free(e2[i]);
        free(e2);
    }
    if(rand() % 2) {
        printptr(f2);
        if(f2 != NULL) for(i = 0; i < num_seg6c; ++i) free(f2[i]);
        free(f2);
    }
    if(rand() % 2) {
        printptr(g2);
        if(g2 != NULL) for(i = 0; i < num_seg7c; ++i) free(g2[i]);
        free(g2);
    }
    if(rand() % 2) {
        printptr(h2);
        if(h2 != NULL) for(i = 0; i < num_seg8c; ++i) free(h2[i]);
        free(h2);
    }
    if(rand() % 2) {
        printptr(j2);
        if(j2 != NULL) for(i = 0; i < num_seg9c; ++i) free(j2[i]);
        free(j2);
    }
    if(rand() % 2) {
        printptr(k2);
        if(k2 != NULL) for(i = 0; i < num_seg10c; ++i) free(k2[i]);
        free(k2);
    }
    if(rand() % 2) {
        printptr(l2);
        if(l2 != NULL) for(i = 0; i < num_largec; ++i) free(l2[i]);
        free(l2);
    }

    return 0;
}
