/* list.c                  
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP4
 *
 * Purpose: File containing functions that manipulate two-way linked lists passed to them 
 * and return certain values depending on the operation. All functions here are used 
 * indirectly by lab3.c through the intermediate file to complete the commands 
 * described in lab3.c. Functions in this file are identical to list.c from MP2, however
 * additional functions for sorting the unsorted list are included.
 *
 * Assumptions: Functions from MP3 all work correctly and provide expected output. 
 *
 * Bugs: No currently known bugs.
 */

/* The interface definition for the two-way linked list ADT is based on one 
 * defined by OPNET, Inc. http://www.opnet.com/
 */
#include <stdlib.h>
#include <assert.h>

#include "datatypes.h"   // defines data_t 
#include "list.h"        // defines public functions for list ADT

/* definitions for private constants used in list.c only */

#define LIST_SORTED    9999
#define LIST_UNSORTED -8888

/* prototypes for private functions used in list.c only */
void list_debug_validate(list_t *L);

/* prototypes for sorting algorithms */
void insertion_sort(list_t *list_ptr);

void recursive_selection_sort(list_t *list_ptr, list_node_t *m, list_node_t *n);
list_node_t *find_min(list_t *list_ptr, list_node_t *m, list_node_t *n);

void iterative_selection_sort(list_t *list_ptr, list_node_t *m, list_node_t *n);

void merge_sort(list_t *list_ptr);
void split_list(list_t *list_ptr, list_t *left_list, list_t *right_list);
void merge_lists(list_t *sorted_list, list_t *left_list, list_t *right_list);

void quick_sort(list_t *list_ptr);
int compare(const void *p_a, const void *p_b);

/* ----- below are the functions  ----- */

/* Obtains a pointer to an element stored in the specified list, at the
 * specified list position
 * 
 * list_ptr: pointer to list-of-interest.  A pointer to an empty list is
 *           obtained from list_construct.
 *
 * pos_index: position of the element to be accessed.  Index starts at 0 at
 *            head of the list, and incremented by one until the tail is
 *            reached.  Can also specify LISTPOS_HEAD and LISTPOS_TAIL
 *
 * return value: pointer to element accessed within the specified list.  A
 * value NULL is returned if the pos_index does not correspond to an element in
 * the list.
 */
data_t * list_access(list_t *list_ptr, int pos_index)
{
    int count = 0;
    list_node_t *L;
 
    // debugging function to verify that the structure of the list is valid
//    list_debug_validate(list_ptr);

    /* handle special cases.
     *   1.  The list is empty
     *   2.  Asking for the head 
     *   3.  Asking for the tail
     *   4.  specifying a position that is out of range.  This is not defined
     *       to be an error in this function, but instead it is assumed the 
     *       calling function correctly specifies the position index
     */
    if (list_entries(list_ptr) == 0) {
        return NULL;  // list is empty
    }
    else if (pos_index == LISTPOS_HEAD || pos_index == 0) {
        return list_ptr->ll_head->data_ptr;
    }
    else if (pos_index == LISTPOS_TAIL || pos_index == list_entries(list_ptr) - 1) {
        return list_ptr->ll_tail->data_ptr;
    }
    else if (pos_index < 0 || pos_index >= list_entries(list_ptr))
        return NULL;   // does not correspond to position in list

    // loop through the list until find correct position index
    L=list_ptr->ll_head;
    while (L != NULL && count != pos_index) {
        L=L->ll_next;
        count++;
    }
    // already verified that pos_index should be valid so L better not be null
    assert(L != NULL);
    assert(L->data_ptr != NULL);
    return L->data_ptr;
}

/* Allocates a new, empty list 
 *
 * By convention, the list is initially assumed to be sorted.  The field sorted
 * can only take values LIST_SORTED or LIST_UNSORTED
 *
 * Use list_destruct to remove and deallocate all elements on a list 
 * and the header block.
 */
list_t * list_construct(void)
{
    list_t *L;
    L = (list_t *) malloc(sizeof(list_t));
    L->ll_head = NULL;
    L->ll_tail = NULL;
    L->ll_entries = 0;
    L->ll_sorted_state = LIST_SORTED;
//    list_debug_validate(L);
    return L;
}

/* Finds an element in a list and returns a pointer to it.
 *
 * list_ptr: pointer to list-of-interest.  
 *
 * elem_ptr: element against which other elements in the list are compared.
 *           Note: uses the compare function defined in datatypes.h
 *
 * NOTICE: pos_index is returned and is not an input value!
 *
 * pos_index : integer value that is returned with the list index position.
 *
 *   Match is found
 *       return value: pointer to matching data_t element 
 *       pos_index: integer position of matching element
 *
 *   Match is not found
 *       return value: NULL
 *       pos_index:  -1
 */
data_t * list_elem_find(list_t *list_ptr, data_t *elem_ptr, int *pos_index)
{
//    list_debug_validate(list_ptr);

    list_node_t *list_rover = list_ptr->ll_head;
    int compare, count = 0;

    while(count < list_ptr->ll_entries) {
         compare = comp_proc(elem_ptr, list_rover->data_ptr);
 
         if (compare == 0) {
             *pos_index = count;
             return list_rover->data_ptr;
         }
         else {
             list_rover = list_rover->ll_next;
             count++;
         }
    }    

    /* If we hit this point, no match was found */
    *pos_index = -1;
    return NULL;
}

/* Deallocates the contents of the specified list, releasing associated memory
 * resources for other purposes.
 */
void list_destruct(list_t *list_ptr)
{
//    list_debug_validate(list_ptr);

    list_node_t *list_rover = list_ptr->ll_head;
    list_node_t *list_next = NULL;
    int count = 0;

    /* Free data_ptrs, then their blocks in the list, and finally the list header */
    while (count < list_ptr->ll_entries) {
        free(list_rover->data_ptr);
        list_next = list_rover->ll_next;
        free(list_rover);
        list_rover = list_next;
        count++;
    }

    free(list_ptr);
}

/* Inserts the specified data element into the specified list at the specified
 * position.
 *
 * list_ptr: pointer to list-of-interest.  
 *
 * elem_ptr: pointer to the element to be inserted into list.
 *
 * pos_index: numeric position index of the element to be inserted into the 
 *            list.  Index starts at 0 at head of the list, and incremented by 
 *            one until the tail is reached.  Can also specify LISTPOS_HEAD and
 *            LISTPOS_TAIL
 *
 * If pos_index is greater than the number of elements currently in the list, 
 * the element is simply appended to the end of the list (no additional elements
 * are inserted).
 *
 * Note that use of this function results in the list to be marked as unsorted,
 * even if the element has been inserted in the correct position.  That is, on
 * completion of this subroutine the list_ptr->ll_sorted_state must be equal 
 * to LIST_UNSORTED.
 */
void list_insert(list_t *list_ptr, data_t *elem_ptr, int pos_index)
{
    assert(list_ptr != NULL);

    list_node_t *node = (list_node_t *) malloc(sizeof(list_node_t));
    node->data_ptr = elem_ptr;

    list_node_t *list_rover = list_ptr->ll_head;
    list_node_t *list_prev = NULL;
    int count = 0;

    /* Checks where in list the new entry should be added and inserts it there */
    if (list_ptr->ll_entries == 0) {
        node->ll_next = NULL;  // This is the first entry of the list
        node->ll_prev = NULL;
        list_ptr->ll_head = node;
        list_ptr->ll_tail = node;
    }
    else if (pos_index == LISTPOS_HEAD || pos_index == 0) {
        node->ll_next = list_ptr->ll_head;  // Entry to be added to beginning of list
        node->ll_prev = NULL;
        list_ptr->ll_head->ll_prev = node;
        list_ptr->ll_head = node;
    }
    else if (pos_index == LISTPOS_TAIL || pos_index >= list_entries(list_ptr)) {
        node->ll_prev = list_ptr->ll_tail;  // Entry to be added to the end of the list
        node->ll_next = NULL;
        list_ptr->ll_tail->ll_next = node;
        list_ptr->ll_tail = node;
    }
    else {
        /* If neither of the above true, entry to be added to the middle of the list */
        while (count != pos_index) { 
            list_prev = list_rover;
            list_rover = list_rover->ll_next;
            count++;
        }
       
        node->ll_next = list_rover;
        node->ll_prev = list_prev;
        list_rover->ll_prev = node;
        list_prev->ll_next = node;
    }

    /* Updates the header block stat for one new entry */
    list_ptr->ll_entries++;

    /* the last three lines of this function must be the following */
    if (list_ptr->ll_sorted_state == LIST_SORTED) 
        list_ptr->ll_sorted_state = LIST_UNSORTED;
//    list_debug_validate(list_ptr);
}

/* Inserts the element into the specified sorted list at the proper position,
 * as defined by the compare_proc.
 *
 * list_ptr: pointer to list-of-interest.  
 *
 * elem_ptr: pointer to the element to be inserted into list.
 *
 * If you use list_insert_sorted, the list preserves its sorted nature.
 *
 * If you use list_insert, the list will be considered to be unsorted, even
 * if the element has been inserted in the correct position.
 *
 * If the list is not sorted and you call list_insert_sorted, this subroutine
 * should generate a system error and the program should immediately stop.
 *
 * The comparison procedure must accept two arguments (A and B) which are both
 * pointers to elements of type data_t.  The comparison procedure returns an
 * integer code which indicates the precedence relationship between the two
 * elements.  The integer code takes on the following values:
 *    1: A should be closer to the list head than B
 *   -1: B should be closer to the list head than A
 *    0: A and B are equal in rank
 *
 * Note: if the element to be inserted is equal in rank to an element already
 *       in the list, the newly inserted element will be placed after all the 
 *       elements of equal rank that are already in the list.
 */
void list_insert_sorted(list_t *list_ptr, data_t *elem_ptr)
{
    assert(list_ptr != NULL);
    assert(list_ptr->ll_sorted_state == LIST_SORTED);

    list_node_t *new_node = (list_node_t *) malloc(sizeof(list_node_t));
    new_node->data_ptr = elem_ptr;

    list_node_t *list_rover = list_ptr->ll_head;
    list_node_t *list_prev = NULL;
    int done_searching = 0;
    int sort, new_index = 0;

    /* If first entry, place in only position of list. 
       Else, use sorting algorithm to find where entry should be */
    if (list_ptr->ll_entries == 0) {
        new_node->ll_next = NULL;
        new_node->ll_prev = NULL;
        list_ptr->ll_head = new_node;
        list_ptr->ll_tail = new_node;
    }
    else {
        /* Searches list for index where new_node should be inserted. 
           Stops searching as soon as it is found */
        while (done_searching != 1) {
            sort = comp_proc(new_node->data_ptr, list_rover->data_ptr);

            if (sort == 0 || sort == -1) {
                list_prev = list_rover;
                list_rover = list_rover->ll_next;
 
                new_index++;

                /* Checks to see if all entries were less than new_node */
                if (new_index == list_ptr->ll_entries) {
                    done_searching = 1;  // If new index equals the size of the list, new node 
                                         // is greater than all entries in the list and needs to 
                }                        // be placed at the end.
            }
            else {
                done_searching = 1;  // If sort = 1, new_node needs to be before that point in 
            }                        // the list, so we are done searching.
        } 

        /* Point new record is actually inserted */
        if (new_index == 0) {
            new_node->ll_next = list_ptr->ll_head;  // Entry to be added to beginning of list
            new_node->ll_prev = NULL;
            list_ptr->ll_head->ll_prev = new_node;
            list_ptr->ll_head = new_node;
        }
        else if (new_index == list_ptr->ll_entries) {
            new_node->ll_prev = list_ptr->ll_tail;  // Entry to be added to the end of the list
            new_node->ll_next = NULL;
            list_ptr->ll_tail->ll_next = new_node;
            list_ptr->ll_tail = new_node;
        } 
        else {
            new_node->ll_next = list_rover;
            new_node->ll_prev = list_prev;
            list_rover->ll_prev = new_node;
            list_prev->ll_next = new_node;
        }
    }

    /* Updates the header block stat for one new entry */
    list_ptr->ll_entries++;

    /* the last line checks if the new list is correct */
//    list_debug_validate(list_ptr);
}

/* Removes an element from the specified list, at the specified list position,
 * and returns a pointer to the element.
 *
 * list_ptr: pointer to list-of-interest.  
 *
 * pos_index: position of the element to be removed.  Index starts at 0 at
 *            head of the list, and incremented by one until the tail is
 *            reached.  Can also specify LISTPOS_HEAD and LISTPOS_TAIL
 *
 * Attempting to remove an element at a position index that is not contained in
 * the list will result in no element being removed, and a NULL pointer will be
 * returned.
 */
data_t * list_remove(list_t *list_ptr, int pos_index)
{
//    list_debug_validate(list_ptr);

    data_t *data_ptr = NULL;

    list_node_t *list_rover = list_ptr->ll_head;
    list_node_t *list_prev = NULL; 
    list_node_t *list_next = NULL;
    int count = 0;

    /* Check if invalid position and return NULL if so. Otherwise, remove entry */
    if ((pos_index < 0 || pos_index > list_entries(list_ptr) - 1) && 
         pos_index != LISTPOS_HEAD && pos_index != LISTPOS_TAIL) {
        return NULL;
    }
    else {
        if (list_ptr->ll_entries == 1) {
            data_ptr = list_ptr->ll_head->data_ptr; // Deleting only entry in list
            free(list_ptr->ll_head);

            list_ptr->ll_head = NULL;
            list_ptr->ll_tail = NULL;

            list_ptr->ll_entries--;
            return data_ptr;
        }
        else if (pos_index == 0 || pos_index == LISTPOS_HEAD) {
            data_ptr = list_ptr->ll_head->data_ptr;  // Removing list head
            list_next = list_ptr->ll_head->ll_next;            

            free(list_ptr->ll_head);

            list_ptr->ll_head = list_next;
            list_ptr->ll_head->ll_prev = NULL;  // Line 
          
            list_ptr->ll_entries--;
            return data_ptr;
        }
        else if (pos_index == list_entries(list_ptr) - 1 || pos_index == LISTPOS_TAIL) {
            data_ptr = list_ptr->ll_tail->data_ptr;  // Removing list tail
            list_prev = list_ptr->ll_tail->ll_prev;
            
            free(list_ptr->ll_tail);
            
            list_ptr->ll_tail = list_prev;
            list_ptr->ll_tail->ll_next = NULL;
          
            list_ptr->ll_entries--;
            return data_ptr;
        }
        else {
            while (count != pos_index) {  // Removing entry in the middle of the list
                list_rover = list_rover->ll_next;
                count++;
            }

            data_ptr = list_rover->data_ptr;
            list_next = list_rover->ll_next;
            list_prev = list_rover->ll_prev;

            free(list_rover);

            list_next->ll_prev = list_prev;
            list_prev->ll_next = list_next;

            list_ptr->ll_entries--;
            return data_ptr; 
        }
    } 
}

/* Obtains the length of the specified list, that is, the number of elements
 * that the list contains.
 *
 * list_ptr: pointer to list-of-interest.  
 *
 * Returns an integer equal to the number of elements stored in the list.  An
 * empty list has a size of zero.
 */
int list_entries(list_t *list_ptr)
{
    assert(list_ptr != NULL);
    assert(list_ptr->ll_entries >= 0);
    return list_ptr->ll_entries;
}

/* Determines the sort algorithm on the list passed to it and executes that 
 * algorithm on that list. Also changes the list's state to SORTED.
 *
 * list_ptr: pointer to list to be sorted.  
 *
 * sort_type: Integer specifying a sort type. Valid sorts are -
 * 1 = Insertion Sort
 * 2 = Recursive Selection Sort
 * 3 = Iterative Selection Sort
 * 4 = Merge Sort
 * 5 = Quick Sort
 *
 */
void list_sort(list_t *list_ptr, int sort_type)
{
    switch(sort_type) {
        case 1:
            insertion_sort(list_ptr);
            break;
        case 2:
            recursive_selection_sort(list_ptr, list_ptr->ll_head, list_ptr->ll_tail);
            break;
        case 3:
            iterative_selection_sort(list_ptr, list_ptr->ll_head, list_ptr->ll_tail);
            break;
        case 4:
            merge_sort(list_ptr);
            break;
        case 5:
            quick_sort(list_ptr);
            break;
    }

    /* Do not change the function below this line! */
    list_ptr->ll_sorted_state = LIST_SORTED;
//    list_debug_validate(list_ptr);
}

/* Sort algorithm that works by using list_remove to remove each entry from the
 * list and then list_insert_sorted to store the items back into a temporary list
 * pointer, sorted_list_ptr. The items in sorted_list_ptr are sorted by the sorting
 * algorithm in list_insert_sorted. After all of the entries are moved into 
 * sorted_list_ptr, the algorithm updates the information at list_ptr for the new 
 * head and tail and frees the temporary pointer.
 *
 * list_ptr: pointer to list to be sorted.
 *
 */
void insertion_sort(list_t *list_ptr)
{
    int count = 0, init_entries = list_entries(list_ptr);
    data_t *data_ptr;
    list_t *sorted_list_ptr = list_construct();

    while(count < init_entries) {
        data_ptr = list_remove(list_ptr, LISTPOS_HEAD);
        list_insert_sorted(sorted_list_ptr, data_ptr);

        count++;
    }

    /* Update list_ptr */
    list_ptr->ll_head = sorted_list_ptr->ll_head;
    list_ptr->ll_tail = sorted_list_ptr->ll_tail;
    list_ptr->ll_entries = sorted_list_ptr->ll_entries;
    list_ptr->ll_sorted_state = sorted_list_ptr->ll_sorted_state;

    free(sorted_list_ptr); // Free temporary memory
}

/* Sort algorithm that works by recursively comparing the element at each position in 
 * the list to the minimum of all the values after it. If the current value is less, it
 * is moved to the front of the list. Else, the minimum of the rest of the list is moved
 * to the front of the list. Takes advantage of an auxiliary function, find_min, to obtain
 * the minimum of every value after the current value in the list. 
 *
 * list_ptr: pointer to list to be sorted.
 * m: Position in list begin tested (starts at LISTPOS_HEAD)
 * n: Last position in the list (LISTPOS_TAIL) 
 *
 */
void recursive_selection_sort(list_t *list_ptr, list_node_t *m, list_node_t *n)
{    
    list_node_t *min_position;
    data_t *temp;

    if(m != n) { 
        min_position = find_min(list_ptr, m, n);

        temp = m->data_ptr;
        m->data_ptr = min_position->data_ptr;
        min_position->data_ptr = temp;

        recursive_selection_sort(list_ptr, m->ll_next, n);
    }
}

/* Auxiliary function for recursive_selection_sort that finds the minimum of the list after a
 * given position in the list. Works by assuming the position being tested is the minimum 
 * value (j) and iteratively testing each position after it against it. If it finds a value less
 * than m, it becomes the new minimum and is tested against every value after it. When the
 * iterative rove reaches the end of the list, j is the minimum value in the list.
 *
 * list_ptr: pointer to list to be sorted.
 * m: Position in list begin tested
 * n: Last position in the list (LISTPOS_TAIL) 
 *
 */
list_node_t *find_min(list_t *list_ptr, list_node_t *m, list_node_t *n)
{  
    list_node_t *i = m;
    list_node_t *j = m;

    do { 
        i = i->ll_next;
        if(comp_proc(i->data_ptr, j->data_ptr) == 1) {
            j = i;
        }
    } while(i != n);

    return j;
}

/* Iterative variant of recursive_selection_sort. Sorts list using the exact same logic as
 * recursive_selection_sort. Note that it does not need an auxiliary function to find the 
 * absolute minimum in the list after m, since it is iterative, not recursive.
 *
 * list_ptr: pointer to list to be sorted.
 * m: Position in list begin tested (starts at LISTPOS_HEAD)
 * n: Last position in the list (LISTPOS_TAIL) 
 *
 */
void iterative_selection_sort(list_t *list_ptr, list_node_t *m, list_node_t *n)
{
    list_node_t *min_position, *i;
    data_t *temp;

    while(m != n) { 
        i = m;
        min_position = m;

        do { 
            i = i->ll_next;
            if(comp_proc(i->data_ptr, min_position->data_ptr) == 1) {
                min_position = i;
            }
        } while(i != n);

        temp = m->data_ptr;
        m->data_ptr = min_position->data_ptr;
        min_position->data_ptr = temp;

        m = m->ll_next;
    }
}

/* Recursive sort algorithm that works by being magic. Takes advantage of two 
 * auxiliary functions. merge_sort takes an input list, splits it in halves 
 * (auxiliary function one), sorts the halves (recursive call), and then combines
 * the sorted halves back into one big sorted list (second auxiliary function). It
 * then updates the list pointer for the new head and tail of the sorted list and
 * frees all the temporary memory used to sort the list.
 * 
 * list_ptr: pointer to list to be sorted.
 *
 */
void merge_sort(list_t *list_ptr)
{
    if(list_ptr->ll_head != NULL && list_ptr->ll_entries > 1) {
        list_t *left_list = list_construct();
        list_t *right_list = list_construct();
        list_t *sorted_list = list_construct();

        /* Step 1 - Split list into two halves */
        split_list(list_ptr, left_list, right_list);

        /* Step 2 - Sort left and right halves */
        merge_sort(left_list);
        merge_sort(right_list);

        /* Step 3 - Merge sorted lists back together */
        merge_lists(sorted_list, left_list, right_list);

        /* Step 4 - Update list_ptr */
        list_ptr->ll_head = sorted_list->ll_head;
        list_ptr->ll_tail = sorted_list->ll_tail;

        /* Step 5 - Free temporary memory */
        free(left_list);
        free(right_list);
        free(sorted_list);
    }
}

/* Iterative Auxiliary function that splits a list into two halves at its midpoint.
 * Midpoint is determined by dividing the size of the list by two. The size of the split 
 * lists is then calculated, the split lists are set up, and the link between them is broken 
 * at midpoint. Note that the left list will always have size equal to the midpoint - 1, and 
 * the right list will have size equal to the midpoint - 1 if list size was even or midpoint if 
 * the list was odd.
 * (Ex: For list size = 10, midpoint = 6. Right list size = 5, Left list size = 5. For list 
 * size = 11, midpoint = 6. However, Right list size = 5, Left list size = 6.) 
 * 
 * list_ptr: pointer to list to be sorted.
 * left_list: pointer to left list head. 
 * right_list: pointer to right list head.
 *
 */
void split_list(list_t *list_ptr, list_t *left_list, list_t *right_list)
{
    int i = 0, midpoint = list_ptr->ll_entries / 2;
    list_node_t *break_point = list_ptr->ll_head;

    while(i != midpoint) {
        break_point = break_point->ll_next;
        i++;
    }

    /* break_point is now at the head of the right list */

    /* Fill both list headers */
    left_list->ll_head = list_ptr->ll_head;
    right_list->ll_head = break_point;

    left_list->ll_tail = break_point->ll_prev;
    right_list->ll_tail = list_ptr->ll_tail;

    left_list->ll_entries = list_ptr->ll_entries / 2;
    right_list->ll_entries = list_ptr->ll_entries - left_list->ll_entries;

    /* Break lists */
    (left_list->ll_tail)->ll_next = NULL;
    (right_list->ll_head)->ll_prev = NULL;
} 

/* Iterative Auxiliary function that takes the two sorted left and right lists and 
 * merges them back together into a sorted list. It does so by comparing the first
 * entry in each list, taking the minimum, removing it from the front of its list, 
 * and inserting it into the tail of a sorted list. Once one list is empty, 
 * the entries from the other list are added into the sorted list until both are empty.
 * Once both lists are empty, sorted_list is sorted.
 *
 * sorted_list: pointer to sorted list head.
 * left_list: pointer to left list head. 
 * right_list: pointer to right list head.
 *
 */
void merge_lists(list_t *sorted_list, list_t *left_list, list_t *right_list)
{
    data_t *add_to_sorted;

    while (left_list->ll_head != NULL || right_list->ll_head != NULL) {
        if(right_list->ll_head == NULL) {
            /* Executed when items remaining in left_list but right_list empty */
            add_to_sorted = list_remove(left_list, LISTPOS_HEAD);
            list_insert(sorted_list, add_to_sorted, LISTPOS_TAIL);
        }
        else if(left_list->ll_head == NULL) {
            /* Executed when items remaining in right_list but left_list empty */
            add_to_sorted = list_remove(right_list, LISTPOS_HEAD);
            list_insert(sorted_list, add_to_sorted, LISTPOS_TAIL);
        }
        else if(comp_proc(left_list->ll_head->data_ptr, right_list->ll_head->data_ptr) 
            == 1) {        
            /* Executed when data from left list goes to tail of sorted list */
            add_to_sorted = list_remove(left_list, LISTPOS_HEAD);
            list_insert(sorted_list, add_to_sorted, LISTPOS_TAIL);
        }
        else {
            /* Executed when data from right list goes to tail of sorted list */
            add_to_sorted = list_remove(right_list, LISTPOS_HEAD);
            list_insert(sorted_list, add_to_sorted, LISTPOS_TAIL);
        }
    }    
}

/* Quick sort algorithm that temporarily stores all of the data pointers in 
 * an array, uses a library function called qsort to sort that array according
 * to the comparison function "compare", and inserts the data pointers back into the 
 * list in the order they were sorted in the array.
 *
 * list_ptr: pointer to list to be sorted.
 *
 */
void quick_sort(list_t *list_ptr)
{
    int i, Asize = list_entries(list_ptr);
    data_t ** QsortA = (data_t **) malloc(Asize*sizeof(data_t *));

    for (i = 0; i < Asize; i++) {
        QsortA[i] = list_remove(list_ptr, LISTPOS_HEAD);
    }
    
    qsort(QsortA, Asize, sizeof(data_t *), compare);
  
    for (i = 0; i < Asize; i++) {
        list_insert(list_ptr, QsortA[i], LISTPOS_TAIL);
    }

    free(QsortA);
}

/* Comparison function for quick sort. Uses comp_proc as a
 * comparison guideline.
 *
 * p_a: first element
 * p_b: element to be compared to p_a
 *
 */
int compare(const void *p_a, const void *p_b)
{
    return comp_proc(*(data_t **) p_b, *(data_t **) p_a);
}

/* This function verifies that the pointers for the two-way linked list are
 * valid, and that the list size matches the number of items in the list.
 *
 * If the linked list is sorted it also checks that the elements in the list
 * appear in the proper order.
 *
 * The function produces no output if the two-way linked list is correct.  It
 * causes the program to terminate and print a line beginning with "Assertion
 * failed:" if an error is detected.
 *
 * The checks are not exhaustive, so an error may still exist in the
 * list even if these checks pass.
 *
 * YOU MUST NOT CHANGE THIS FUNCTION.  WE USE IT DURING GRADING TO VERIFY THAT
 * YOUR LIST IS CONSISTENT.
 */
void list_debug_validate(list_t *L)
{
    list_node_t *N;
    int count = 0;
    assert(L != NULL);
    if (L->ll_head == NULL)
        assert(L->ll_tail == NULL && L->ll_entries == 0);
    if (L->ll_tail == NULL)
        assert(L->ll_head == NULL && L->ll_entries == 0);
    if (L->ll_entries == 0)
        assert(L->ll_head == NULL && L->ll_tail == NULL);
    assert(L->ll_sorted_state == LIST_SORTED || L->ll_sorted_state == LIST_UNSORTED);

    if (L->ll_entries == 1) {
        assert(L->ll_head == L->ll_tail && L->ll_head != NULL);
        assert(L->ll_head->ll_next == NULL && L->ll_head->ll_prev == NULL);
        assert(L->ll_head->data_ptr != NULL);
    }
    if (L->ll_head == L->ll_tail && L->ll_head != NULL)
        assert(L->ll_entries == 1);
    if (L->ll_entries > 1) {
        assert(L->ll_head != L->ll_tail && L->ll_head != NULL && L->ll_tail != NULL);
        N = L->ll_head;
        assert(N->ll_prev == NULL);
        while (N != NULL) {
            assert(N->data_ptr != NULL);
            if (N->ll_next != NULL) assert(N->ll_next->ll_prev == N);
            else assert(N == L->ll_tail);
            count++;
            N = N->ll_next;
        }
        assert(count == L->ll_entries);
    }
    if (L->ll_sorted_state == LIST_SORTED && L->ll_head != NULL) {
        N = L->ll_head;
        while (N->ll_next != NULL) {
            assert(comp_proc(N->data_ptr, N->ll_next->data_ptr) != -1);
            N = N->ll_next;
        }
    }
}
/* commands for vim. ts: tabstop, sts: softtabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
