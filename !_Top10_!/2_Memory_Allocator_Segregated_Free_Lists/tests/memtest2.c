/* Ryan Barker
   CPSC 3220
   memtest2.c

   Purpose: Second test driver for allocator library. Mallocs and Callocs objects
            of all possible object sizes for the segregated lists.
 */

#include "allocator.h"
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

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

int main(void)
{
    /* Malloc Each Object Size. */
    uint8_t *a = malloc(2);
    uint8_t *b = malloc(4);
    uint8_t *c = malloc(8);
    uint8_t *d = malloc(16);
    uint8_t *e = malloc(32);
    uint8_t *f = malloc(64);
    uint8_t *g = malloc(128);
    uint8_t *h = malloc(256);
    uint8_t *i = malloc(512);
    uint8_t *j = malloc(1024);
    uint8_t *k = malloc(2048);

    /* Print pointers to stdout. */
    printptr(a);
    printptr(b);
    printptr(c);
    printptr(d);
    printptr(e);
    printptr(f);
    printptr(g);
    printptr(h);
    printptr(i);
    printptr(j);
    printptr(k);

    /* Free in opposite order. */
    free(k);
    free(j);
    free(i);
    free(h);
    free(g);
    free(f);
    free(e);
    free(d);
    free(c);
    free(b);
    free(a);

    /* Calloc Each Object Size. */
    a = calloc(2, 1);
    b = calloc(4, 1);
    c = calloc(8, 1);
    d = calloc(16, 1);
    e = calloc(32, 1);
    f = calloc(64, 1);
    g = calloc(128, 1);
    h = calloc(256, 1);
    i = calloc(512, 1);
    j = calloc(1024, 1);
    k = calloc(2048, 1);

    /* Print pointers to stdout. */
    printptr(a);
    printptr(b);
    printptr(c);
    printptr(d);
    printptr(e);
    printptr(f);
    printptr(g);
    printptr(h);
    printptr(i);
    printptr(j);
    printptr(k);

    /* Free in opposite order. */
    free(k);
    free(j);
    free(i);
    free(h);
    free(g);
    free(f);
    free(e);
    free(d);
    free(c);
    free(b);
    free(a);


    return 0;
}
