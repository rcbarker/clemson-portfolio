/* Ryan Barker
   CPSC 3220
   memtest4.c

   Purpose: Fourth test driver for allocator library. Meant to be 
            run with strace to examine space efficiency of allocator - This 
            entire program should only use one 4KB page of memory, which is
            mapped in the first malloc call of line 28 and unmapped in the 
            last free call in line 33.

            Try me with strace:
                LD_PRELOAD=./libmyalloc.so strace ./memtest4
 */

#include "allocator.h"
#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <stdint.h>

#define BIG 100
#define SIZE 2

int main(int argc, char **argv) 
{
    uint8_t *a[BIG];
    int i;

    /* Malloc 200B all at once (Really allocating 1KB because of 8B Object Headers). */
    for(i = 0; i < BIG; ++i) a[i] = malloc(SIZE);

    /* Free 200B all at once (Really freeing 1KB because of 8B Object Headers). */
    for(i = 0; i < BIG; ++i) free(a[i]);

    return 0;
}
