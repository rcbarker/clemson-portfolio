/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   recoveredlist.c
   
   Purpose: Contains functions for constructing, destructing, and inserting nodes into a 
              a recovered list data type, which is made up of one recovered_list_header_t
              header block and several recovered_node_t nodes. Used in imagescanner.c.
 */
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* User-defined Header File. */
#include "project4.h"

/* Function Name: recovered_list_construct
   Input value(s): None.
   Return value(s): Pointer to initialized header block.
   Purpose: Constructs and initializes a header block for the recovered list.
 */
recovered_list_header_t *recovered_list_construct(void)
{
    /* Allocate header block, initialize, and return. */
    recovered_list_header_t *files_list = malloc(sizeof(recovered_list_header_t));
    files_list->num_entries = 0;
    files_list->head = NULL;
    files_list->tail = NULL;
    return files_list;
}

/* Function Name: recovered_list_insert
   Input value(s): list_ptr, the pointer to the beginning of the recovered list.
                   header, a pointer to the header of the file being inserted.
                   state, whether the file is a deleted or normal file.
   Return value(s): None.
   Purpose: Inserts file with parameters contained in header into recovered list.
 */
void recovered_list_insert(recovered_list_header_t *list_ptr, file_header_t *header, int state) 
{
    /* Allocate new list node and initialize. */
    recovered_node_t *new_node = malloc(sizeof(recovered_node_t));
    sprintf(new_node->name, "%s", header->name);
    sprintf(new_node->extension, "%s", header->extension);
    new_node->first_cluster = header->first_cluster;
    new_node->size = header->size;
    new_node->state = state;

    /* Insert into linked list. */
    if(!list_ptr->num_entries) {
         /* First entry in linked list. */
         new_node->next = NULL;
         new_node->prev = NULL;
         list_ptr->head = new_node;
         list_ptr->tail = new_node;
    } else {
         /* Insert into front of recovered file list. */
         new_node->next = list_ptr->head;
         new_node->prev = NULL;
         list_ptr->head->prev = new_node;
         list_ptr->head = new_node;
    }

    /* Increment number of entries. */
    list_ptr->num_entries++;
}

/* Function Name: recovered_list_destruct
   Input value(s): list_ptr, the pointer to the beginning of the recovered list.
   Return value(s): NULL (To destroy the dangling pointer to the list).
   Purpose: Destroys recovered list node by node and then frees the header.
 */
void *recovered_list_destruct(recovered_list_header_t *list_ptr)
{
    /* Free each node. */
    recovered_node_t *temp, *rove = list_ptr->head;
    while(rove != NULL) {
        temp = rove->next;
        free(rove);
        rove = temp;
    }
 
    /* Free header block. */
    free(list_ptr); 

    return NULL;
}
