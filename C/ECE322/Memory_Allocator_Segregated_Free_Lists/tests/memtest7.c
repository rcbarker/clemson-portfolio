/* Ryan Barker
   CPSC 3220
   memtest7.c

   Purpose: Seventh test driver for allocator library. Tests large 
            amounts of reallocs.
 */

#include "allocator.h"
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define OBJECT_SIZE 2
#define NEW_OBJECT_SIZE 4
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
        ptrs[i] = realloc(NULL, OBJECT_SIZE);

        /* Assert memory was allocated. */
        assert(ptrs[i] != NULL);

        /* Print every 1,000th pointer. */
        if(!(i % 1000)) printptr(ptrs[i]);
    }

    /* Resize memory. */
    for(i = 0; i < NUM_PTRS; ++i) {
        ptrs[i] = realloc(ptrs[i], NEW_OBJECT_SIZE);
        assert(ptrs[i] != NULL);
        if(!(i % 1000)) printptr(ptrs[i]);
    }

    /* Free memory. */
    for(i = 0; i < NUM_PTRS; ++i) ptrs[i] = realloc(ptrs[i], 0);

    return 0;
}
