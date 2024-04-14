/* Ryan Barker
   CPSC 3220
   memtest1.c

   Purpose: First test driver for allocator library. Does basic testing with 
            malloc, calloc, and free.
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
    /* Malloc two integers. */
    int *ptr = malloc(2 * sizeof(int));

    /* Make sure memory was assigned. */
    assert(ptr != NULL);

    /* Print pointer to std_out. */
    printptr(ptr);

    /* Free memory. */
    free(ptr);

    /* Calloc two integers. */
    ptr = calloc(2, sizeof(int));

    /* Make sure memory was assigned. */
    assert(ptr != NULL);

    /* Assert ints are zero. */
    assert(ptr[0] == 0 && ptr[1] == 0);

    /* Print pointer to std_out. */
    printptr(ptr);

    /* Free memory. */
    free(ptr);

    /* Malloc zero. Assert no memory was obtained. Free NULL. */
    ptr = malloc(0);
    printptr(ptr);
    assert(ptr == NULL);
    free(ptr);

    /* Calloc zero. Assert no memory was obtained. Free NULL. */
    ptr = calloc(0, 999);
    printptr(ptr);
    assert(ptr == NULL);
    free(ptr);
   
    ptr = calloc(999, 0);
    printptr(ptr);
    assert(ptr == NULL);
    free(ptr);

    return 0;
}
