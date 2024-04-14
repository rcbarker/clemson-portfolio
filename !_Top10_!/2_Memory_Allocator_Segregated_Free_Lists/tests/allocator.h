/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   allocator.h
 */
#include <stdlib.h>

/* Constants for allocator.c */
#define PAGESIZE 4096
#define NUM_LISTS 10

/* Data Types for allocator.c */
typedef struct mem_obj_header_tag {
    struct mem_obj_header_tag *next;
} mem_obj_header_t;

typedef struct mem_page_header_tag {
    size_t size;
    struct mem_obj_header_tag *free_list;
    struct mem_obj_header_tag *alloc_list;
    struct mem_page_header_tag *next_pg;
} mem_page_header_t;

/* Prototype Definitions for functions in allocator.c */
void *malloc(size_t size);
void *calloc(size_t num_members, size_t size);
void *realloc(void *ptr, size_t size);
void free(void *ptr);
