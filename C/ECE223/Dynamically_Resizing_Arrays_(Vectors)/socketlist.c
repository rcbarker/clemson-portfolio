/* socketlist.c
 * Ryan Barker
 * ECE 223 Fall 2014
 * MP1
 *
 * Purpose: Contains all of the functions nessecary to run lab1.c. 
 * 
 * Assumptions: The functions below either have no input or take combinations of the following  
 * values: Pointers to new information to be added to the list, pointers to old information in the
 * list to be deleted, a pointer to the list itself, and an integer position in the list. 
 * Depending on the purpose, function returns are either void, pointers to information in the 
 * list, or integers. Solving the problem will require extensive use of pointer and addressing 
 * manipulation and information hiding so that only this file will be able to index into the list.
 * 
 * Bugs: No currently known bugs.
 *
 */

#include <stdlib.h>

#include "socketlist.h"

#define MINSOCKETS 4

/* Creates socket list to be operated on. 
 *
 * The list initally has capacity MINSOCKETs and no entries.
 *
 * All pointers in the list are intially set to NULL.
 *
 */
struct socketlist_t *socketlist_construct()
{   
    int i;

    struct socketlist_t *list_ptr = (struct socketlist_t *) malloc(sizeof(struct socketlist_t));

    list_ptr->vector_capacity = MINSOCKETS;
    list_ptr->vector_size = 0;
    list_ptr->vector_ptr = (struct socket_info_t **) malloc(MINSOCKETS * 
                                                            sizeof(struct socket_info_t *));

    for(i = 0; i < MINSOCKETS; ++i)
    {
        *(list_ptr->vector_ptr + i) = NULL;
    }

    return list_ptr;
}

/* Frees socket list at the end of the program.
 *
 * Starts by freeing every memory block pointed to by the socketlist vector_ptr array.
 *
 * Then frees the vector_ptr array itself.
 *
 * Finishes by freeing the socketlist structure.
 *
 */
void socketlist_destruct(struct socketlist_t *ptr)
{   
    int i;

    for(i = 0; i < ptr->vector_size; ++i)
    {
        free(*(ptr->vector_ptr + i));
    }

    free(ptr->vector_ptr);

    free(ptr);
}

/* Attempts to insert the information at rec_ptr into the socketlist at the position pos.
 *
 * Starts by checking if pos is a valid position. pos must be greater than or equal to zero 
 * and less than or equal to the curent number of entries in the socketlist. Returns -1 if 
 * pos is invalid.
 *
 * If pos is valid, the function checks to see if the socket list has enough space for another
 * entry. If the list is full, the function doubles the size of the list and updates 
 * list_ptr->vector_capacity accordingly. The new entries are nulled.
 *
 * The function then moves every pointer in the list after pos to one position 
 * greater. If the list is empty or pos is equal to the last spot in the list, this step is 
 * skipped.
 *
 * Finally, the pointer to the new record is then inserted in position pos of the socketlist and
 * the vector_size is incremented to reflect the new entry.
 * 
 */
int socketlist_add(struct socketlist_t *list_ptr, int pos, struct socket_info_t *rec_ptr)
{ 
    if(pos < 0 || pos > list_ptr->vector_size)
    {
        return -1;
    }
    else
    {
        int i;

        // This is where space is realloced if the list is full.
        if(list_ptr->vector_capacity == list_ptr->vector_size)
        {
            list_ptr->vector_capacity = 2 * list_ptr->vector_capacity;
            list_ptr->vector_ptr = (struct socket_info_t **) realloc(list_ptr->vector_ptr,
                                                                      list_ptr->vector_capacity * 
                                                                     sizeof(struct socket_info_t 
                                                                     *));
            for(i = list_ptr->vector_size; i < list_ptr->vector_capacity; ++i)
            {
                *(list_ptr->vector_ptr + i) = NULL;
            }
        }

        // Sorting algorithm to move all entries in the list to one position greater:
        for(i = list_ptr->vector_size; i > pos; --i)
        {
            *(list_ptr->vector_ptr + i) = *(list_ptr->vector_ptr + i - 1); 
        }

        *(list_ptr->vector_ptr + pos) = rec_ptr;
        list_ptr->vector_size++;

        return 0;
    }
}

/* Attempts to replace the information at old_rec_ptr with the information at new_rec_ptr 
 * located at position id in the socketlist.
 *
 * Starts by checking if id is a valid position for replace. id must be greater than or 
 * equal to zero and less than the current number of entries in the socketlist. Additionally, 
 * the list size must be greater than zero. Returns NULL if any of these conditions are 
 * violated.
 *
 * If the above conditions are met, the function saves the pointer to the old information
 * in old_rec_ptr, updates the replaces old_rec_ptr with new_rec_ptr in the position id of
 * the list, and returns old_rec_ptr.
 *
 */
struct socket_info_t *socketlist_replace(struct socketlist_t *list_ptr, int id, struct socket_info_t *new_rec_ptr)
{
    if(id < 0 || id >= list_ptr->vector_size || list_ptr->vector_size == 0)
    {
        return NULL;
    }
    else
    {
        struct socket_info_t *old_rec_ptr = *(list_ptr->vector_ptr + id);

        *(list_ptr->vector_ptr + id) = new_rec_ptr;

        return old_rec_ptr;
    }
}

/* Attempts to return the pointer to the information currently stored at position pos in the
 * socketlist.
 *
 * Starts by checking if pos is a valid position in the list. pos must be greater than or 
 * equal to zero and less than the current number of entries in the socketlist. Additionally, 
 * a list size must be greater than zero. Returns NULL if any of these conditions are 
 * violated.
 *
 * If the above conditions are satisified, the function returns the pointer to the information 
 * at that point in the socket list.
 *
 */
struct socket_info_t *socketlist_access(struct socketlist_t *list_ptr, int pos)
{
    if(pos < 0 || pos >= list_ptr->vector_size || list_ptr->vector_size == 0)
    {
        return NULL;
    }
    else
    {
        return *(list_ptr->vector_ptr + pos);
    }
}

/* Attempts to remove the information at position pos in the socketlist and move all records
 * afterward to one position greater.
 *
 * Starts by checking if pos is a valid position in the list for a remove. pos must be 
 * greater than or equal to zero and less than the current number of entries in the socketlist. 
 * Additionally, the list size must be greater than zero. Returns NULL if any of these conditions 
 * are violated.
 *
 * If the above conditions are satisified, the function starts by saving the pointer to the 
 * information to be removed. It then moves all records starting at pos to one position less, 
 * overwriting pos. It also NULLs the last spot in the list, since it is no longer being used, 
 * and updates the stat for the size of the list to be one less.
 *
 * The function then checks if the current size of the list is one fourth of its capacity. If 
 * this is true, the function resizes the list to half of its capacity or MINSOCKETs, whichever
 * is greater. 
 *
 * Finally, the function will return the pointer to the old record that was removed. Note that 
 * the memory block pointed to by the pointer is not freed inside of the function. This is so it 
 * may be referenced in lab1.c in an output message. The memory block is freed after the message 
 * in lab1.c. 
 * 
 */
struct socket_info_t *socketlist_remove(struct socketlist_t *list_ptr, int pos)
{
    if(pos < 0 || pos >= list_ptr->vector_size || list_ptr->vector_size == 0)
    {
        return NULL;
    }
    else
    {
        int i;
        struct socket_info_t *old_rec_ptr = *(list_ptr->vector_ptr + pos);

        // Sorting algorithm for removing pointer to record:
        for(i = pos; i < list_ptr->vector_size; ++i)
        {
            *(list_ptr->vector_ptr + i) = *(list_ptr->vector_ptr + i + 1);
        }

        *(list_ptr->vector_ptr + list_ptr->vector_size - 1) = NULL; 
        list_ptr->vector_size--;

        // This is where space is realloced if the list becomes too large:
        if(list_ptr->vector_size < (list_ptr->vector_capacity / 4))
        {
            if((list_ptr->vector_capacity / 2) > MINSOCKETS)
            {
                list_ptr->vector_capacity = (list_ptr->vector_capacity / 2);
            }
            else
            {
                list_ptr->vector_capacity = MINSOCKETS;
            }

            list_ptr->vector_ptr = (struct socket_info_t **) realloc(list_ptr->vector_ptr,
                                    list_ptr->vector_capacity * sizeof(struct socket_info_t *));
        }

        return old_rec_ptr;
    }
}

/* Simply accesses and returns the current capacity of the socket list.
 */
int socketlist_capacity(struct socketlist_t *list_ptr)
{
    return list_ptr->vector_capacity;
}

/* Simply accesses and returns the current size of the socket list.
 */
int socketlist_number_entries(struct socketlist_t *list_ptr)
{
    return list_ptr->vector_size;
}
