/* Ryan Barker
   CPSC 3220
   memtest6.c

   Purpose: Sixth test driver for allocator library. Tests large 
            amounts of mallocs, callocs, and frees.
 */

#include "allocator.h"
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define OBJECT_SIZE 2
#define NUM_PTRS 100000

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
    /* Malloc space for pointers. */
    int *ptrs[NUM_PTRS];
    int i;
    for(i = 0; i < NUM_PTRS; ++i) { 
        /* Malloc each pointer. */
        ptrs[i] = malloc(OBJECT_SIZE);

        /* Assert memory was allocated. */
        assert(ptrs[i] != NULL);

        /* Print every 1,000th pointer. */
        if(!(i % 1000)) printptr(ptrs[i]);
    }

    /* Free memory. */
    for(i = 0; i < NUM_PTRS; ++i) free(ptrs[i]);

    /* Calloc space for pointers. */
    for(i = 0; i < NUM_PTRS; ++i) {
        /* Calloc each pointer. */
        ptrs[i] = calloc(OBJECT_SIZE, 1);

        /* Assert memory was allocated. */
        assert(ptrs[i] != NULL);

        /* Print every 1,000th pointer. */
        if(!(i % 1000)) printptr(ptrs[i]);
    }

    /* Free memory. */
    for(i = 0; i < NUM_PTRS; ++i) free(ptrs[i]);

    return 0;
}
