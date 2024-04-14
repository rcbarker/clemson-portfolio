/* mem.c 
 * Ryan Barker
 * rcbarke
 * ECE 223, Fall 2014
 * Lab4: Dynamic Memory Allocation
 * Version: 1
 *
 * Purpose: This file contains functions for dynamically allocating and freeing memory based
 * using the system function sbrk. It is contained in a function called morecore, which is
 * referenced by the memory allocation function, Mem_free if nessecary. Mem_free is the freeing
 * function that inserts allocated memory back into the free list.
 *
 * Note that the functions in this file are designed to work with the flags in lab4.c.
 *
 * Assumptions: Provided template code works correctly except when specified otherwise. This 
 * file will be run with lab4.c and use the flags in that files.
 *
 * Bugs: No currently known bugs.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include "mem.h"

// Global variables required in mem.c only
static chunk_t * Head = NULL;
static chunk_t * Rover = NULL;
static int num_sbrk_calls = 0;
static int pages_allocated = 0;

#define PAGESIZE 4096

/* FUNCTION PROVIDED BY INSTRUCTOR  
 *
 * function to request 1 or more pages from the operating system.
 *
 * new_bytes must be the number of bytes that are being requested from
 *           the OS with the sbrk command.  It must be an integer 
 *           multiple of the PAGESIZE
 *
 * returns a pointer to the new memory location.  If the request for
 * new memory fails this function simply returns NULL, and assumes some
 * calling function will handle the error condition.  Since the error
 * condition is catastrophic, nothing can be done but to terminate 
 * the program.
 */
chunk_t *morecore(int new_bytes) 
{
    char *cp;
    chunk_t *new_p;
    assert(new_bytes % PAGESIZE == 0 && new_bytes > 0);
    cp = sbrk(new_bytes);
    if (cp == (char *) -1)  /* no space available */
        return NULL;
    new_p = (chunk_t *) cp;
    num_sbrk_calls++;
    pages_allocated += new_bytes / PAGESIZE;
    return new_p;
}

/* deallocates the space pointed to by return_ptr; it does nothing if
 * return_ptr is NULL.  
 *
 * This function assumes that the Rover pointer has already been 
 * initialized and points to some memory block in the free list.
 */
void Mem_free(void *return_ptr)
{
    if(return_ptr == NULL) return;

    /* Cast return_ptr into the proper type */
    chunk_t *p = (chunk_t *) return_ptr;

    /* Back up to the header block */
    p--;

    /* Check that header block has valid size index */
    assert(p->size > 1);

    if(Coalescing == FALSE) {
        /* Add the new block into the free list */
        p->next = Rover->next;
        Rover->next = p;
    } else {
        /* Coalescing Enabled */
        chunk_t *previous = Head;
        Rover = Head->next;
        chunk_t *end = NULL;
      
        /* Step 1 - Find the position before where p should be inserted in the 
           free list and store in previous. Find position after where p should
           be inserted and store in Rover */
        do {
            if(Rover > p) break;
            
            if(Rover == Head) end = previous;
         
            previous = Rover;
            Rover = Rover->next;         
        } while (Rover != Head->next);

        /* Add p to the free list */
        if(Rover > p) {
            /* p goes at beginning or in the middle of the list */
            p->next = Rover;
            previous->next = p;
            
            /* Step 2 - Coalescate if possible */
            if((p + p->size == Rover) && Rover != Head){
                /* Can coalescate p with block after it */ 
                p->next = Rover->next;
                p->size = p->size + Rover->size;
                Rover->next = NULL;

                /* Move Rover to a valid header block since it was just deleted */
                Rover = Head;
            }

            if(previous + previous->size == p) {
                /* Can coalescate p with block before it */
                previous->next = p->next;
                previous->size = previous->size + p->size;
                p->next = NULL;
            }
        }
        else {
            /* p goes at the end of the list */
            p->next = Head;
            end->next = p;

            /* Step 2 - Coalescate if possible */
            if(end + end->size == p) {
                /* Can coalescate p with block before it */
                end->size = end->size + p->size;
                end->next = p->next;
                p->next = NULL;
                Rover = Head;
            }
        }
    }
}

/* returns a pointer to space for an object of size nbytes, or NULL if the
 * request cannot be satisfied.  The memory is uninitialized.
 * 
 * This function assumes that there is a Rover pointer that points to
 * some item in the free list.  The first time the function is called,
 * Rover is null, and must be initialized with a dummy block whose size
 * is set to zero so this block can never be removed from the list.  After
 * the first call, the Rover can never be null again.
 */
void *Mem_alloc(int nbytes)
{
    chunk_t *p, *previous;
    chunk_t *q;

    /* Precondition */
    assert(nbytes > 0);

    /* Figure out amount of chunks user requested. Start with amount of bytes they
       requested */
    int requested_memory = nbytes + sizeof(chunk_t);
    int requested_chunks;

    /* Now, divide by size of a chunk to find out the number of chunks the user needs.
       Round division up */
    if(requested_memory % sizeof(chunk_t) == 0) {
        requested_chunks = requested_memory / sizeof(chunk_t);
    } else {
        requested_chunks = (requested_memory / sizeof(chunk_t)) + 1;
    }

    /* First call initializations */
    if(Rover == NULL) {
        p = morecore(PAGESIZE);
        if(p == NULL)
            return NULL;  // Return NULL if program isn't allowed memory
        q = p + 1;
        q->size = (PAGESIZE / sizeof(chunk_t)) - 1; 
        p->next = q;
        p->size = 0;
        q->next = p;
        Rover = p;
        Head  = p;
    }

    /* Reset Rover if head flag is specified */
    if(RovingPolicy == HEAD) {
        Rover = Head->next;
        previous = Head;
    }

    /* Check if there is space in the free list for request + a header block */
    previous = Rover;
    Rover = Rover->next;
    chunk_t *search_init = Rover;
    if(SearchPolicy == FIRST_FIT) {
        /* First Fit Algorithm */
        do {
            if(Rover->size >= requested_chunks) break;
   
            previous = Rover;
            Rover = Rover->next;
        } while(Rover != search_init);
    } else {
        /* Best Fit Algorithm */
        chunk_t *best = Head, *best_prev = NULL;
        do {
            if(Rover->size == requested_chunks) break;
            else if(Rover->size > requested_chunks) {
                if((best == Head) || (Rover->size < best->size)) {
                    best_prev = previous;
                    best = Rover;
                }
            }
            previous = Rover;
            Rover = Rover->next;
        } while(Rover != search_init);

        /* Set Rover to best value found if no value equal is found */
        if(Rover->size != requested_chunks) {
            previous = best_prev;
            Rover = best;
        }    
    }

    /* Move p to start of block found or get more system memory */
    if(Rover->size >= requested_chunks) {
        /* p found in list - Move p to the start of block containing memory to be allocated */
        p = Rover;   
    } else {
        /* Not found in list - Need to request memory from system */

        /* Calculate number of pages nessecary if space not found in list. */
        int num_pages;

        if(requested_memory % PAGESIZE == 0) {
            num_pages = requested_memory / PAGESIZE;
        } else {
            num_pages = (requested_memory / PAGESIZE) + 1;
        }

        /* Call morecore for system memory for user's request */
        int new_bytes = PAGESIZE * num_pages;           
        p = morecore(new_bytes);
        if(p == NULL) 
            return NULL;  // Return NULL if out of memory
        p->next = NULL;
        p->size = new_bytes / sizeof(chunk_t);       /* num header-sized units */

        /* Add new memory to the free list */
        q = p + 1;                     /* move to one unit past start of block */
        Mem_free(q);                          /* add new segment to free list */

        /* Allocate portion of new page to user by recursively calling Mem_alloc for
           the same amount of memory. Note that in the recursive call, the searching
           algorithms will find and allocate the chunk that was just created */
        return Mem_alloc(nbytes);
    }


    /* Check for case if memory requested is equal to size. This means a header 
       for an unallocated block is becoming a header for an allocated block. 
       Have to make the unallocated block before this header point to what the changing 
       header is pointing to to avoid including the changing header in the list of 
       free memory */
    if(p->size == requested_chunks) {
        previous->next = p->next;
    }

    /* Allocate the user memory */
    p->size = p->size - requested_chunks;
    Rover = p->next;
    p = p + p->size;
    p->next = NULL;
    p->size = requested_chunks;
    
    /* Set q to the first block of memory for the user */
    q = p + 1; 

    /* DEBUG: Uncomment for temporary line to see the new memory */
//    printf("(Allocated) p=%p, size=%d, end=%p, next=%p\n", 
//            p, p->size, p + p->size, p->next);

    return q;
}

/* prints stats about the current free list
 *
 * number of chunks on list
 * min, max, and average size of each chunk in bytes
 * total memory in list in bytes
 * number of calls to sbrk and number of pages requested
 *
 * A message is printed if all the memory is in the free list
 */
void Mem_stats(void)
{   
    int num_chunks = 0;
    int total_chunk_size = 1;  // Accounts for dummy chunk with size zero
    int chunk_min = Head->next->size, chunk_max = Head->next->size;
    int M;
    chunk_t *p = Head;

    /* Loop through list and calculate statistics */
    do {
        if(p != Head && (p->size < chunk_min)) chunk_min = p->size;
        else if(p->size > chunk_max) chunk_max = p->size;
        
        num_chunks++;
        total_chunk_size += p->size;

        p = p->next;
    } while(p != Head);
   
    /* Scale stats */
    chunk_min *= sizeof(chunk_t);
    chunk_max *= sizeof(chunk_t);

    /* Calculate the total bytes in the free list */ 
    M = total_chunk_size * sizeof(chunk_t);

    /* Subtract the dummy header from num_chunks */
    num_chunks--;

    /* Print statistics */
    printf("%d chunk(s) in free list\n", num_chunks);
    printf("chunk sizes: min = %d, max = %d, avg = %d\n", 
            chunk_min, chunk_max, ((total_chunk_size - 1) / num_chunks)*(int)sizeof(chunk_t));
    printf("%d bytes in free list\n", M);
    printf("sbrk called %d times, %d page(s) requested.\n", 
            num_sbrk_calls, pages_allocated); 

    if(M == pages_allocated * PAGESIZE) {
        printf("all memory is in the heap -- no leaks are possible\n");
    }
}

/* prints table of memory in free list 
 */
void Mem_print(void)
{
    chunk_t *p = Head;

    /* Print the starting address, size, ending address, and next pointer
       of each free block in the list */
    do {
        printf("p=%p, size=%d, end=%p, next=%p\n", 
            p, p->size, p + p->size, p->next);
        p = p->next;
    } while(p != Head);
}

/* vi:set ts=8 sts=4 sw=4 et: */
