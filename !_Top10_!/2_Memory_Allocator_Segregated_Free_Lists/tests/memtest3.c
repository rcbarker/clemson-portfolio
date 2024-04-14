/* Ryan Barker
   CPSC 3220
   memtest3.c

   Purpose: Third test driver for allocator library. Does basic
            realloc testing.
 */

#include "allocator.h"
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define NUM_FLOATS 1
#define NEW_NUM_FLOATS 10

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
    /* Malloc specified floats. */
    float *ptr = malloc(NUM_FLOATS*sizeof(float));

    /* Make sure memory was assigned. */
    assert(ptr != NULL);

    /* Print pointer to std_out. */
    printptr(ptr);

    /* Realloc memory to identical size and assert nothing changed. */
    float *old_ptr = ptr;
    ptr = realloc(ptr, NUM_FLOATS*sizeof(float));
    printptr(ptr);
    assert(old_ptr == ptr);

    /* Realloc for real. */
    ptr = realloc(ptr, NEW_NUM_FLOATS*sizeof(float));
    old_ptr = NULL; // Destroys dangling pointer.

    /* Make sure memory was assigned. */
    assert(ptr != NULL);

    /* Print new pointer. */
    printptr(ptr);

    /* Realloc with size zero and assert memory was freed. */
    ptr = realloc(ptr, 0);
    assert(ptr == NULL);
    printptr(ptr);

    /* Realloc a NULL pointer. */
    ptr = realloc(NULL, NUM_FLOATS*sizeof(float));
    assert(ptr != NULL);
    printptr(ptr);
    free(ptr);

    return 0;
}
