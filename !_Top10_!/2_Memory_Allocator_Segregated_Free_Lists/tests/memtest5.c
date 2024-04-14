/* Ryan Barker
   CPSC 3220
   memtest5.c

   Purpose: Fifth test driver for allocator library. Demonstrates worst-case space efficiency
            of allocator. Will map 100 pages, but will only be using one page at any given
            time.

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

    /* Malloc 200B total, but free each malloc before the next malloc. */
    for(i = 0; i < BIG; ++i) {
        a[i] = malloc(SIZE);
        free(a[i]);
    }

    return 0;
}
