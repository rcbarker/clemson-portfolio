/* table.c                  
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP7
 * 
 * Purpose: Contains functions for manipulating a hash table. Operations include inserts,
 * removes, retrievals, and rehashing. Also keeps track of various statistics for the table
 * and stores them in the table's header block.
 *
 * Assumptions: 
 * 1. Double hashing needs to be run with table sizes that are prime numbers to work. The 
 *    program will return -1 for inserts or NULL for retreivals and deletes if -m is specified
 *    otherwise.
 * 2. Quadratic hashing needs to be run with table sizes that are powers of two to work. The
 *    program will return -1 for inserts or NULL for retreivals and deletes if -m is specified 
 *    otherwise.
 *
 * Bugs: No currently known bugs.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>

#include "table.h"        // defines public functions for hash tables

/* Private functions for this file only */
int table_key_hash(hashkey_t K, int M);
int table_probe_value(hashkey_t K, int current_probe, int probe_type, int M);
table_entry_t *table_search(table_t *T, hashkey_t K); 
int table_is_prime(table_t *T);
int table_power_two(table_t *T);

/* ----- below are the functions  ----- */

/*  The empty table is created.  The table must be dynamically allocated and
 *  have a total size of table_size.  The maximum number of (K, I) entries
 *  that can be stored in the table is table_size-1.  For open addressing, 
 *  the table is filled with a special empty key distinct from all other 
 *  nonempty keys.  
 *
 *  the probe_type must be one of {LINEAR, DOUBLE, QUAD}
 *
 *  Do not "correct" the table_size or probe decrement if there is a chance
 *  that the combinaion of table size or probe decrement will not cover
 *  all entries in the table.  Instead we will experiment to determine under
 *  what conditions an incorrect choice of table size and probe decrement
 *  results in poor performance.
 */
table_t *table_construct(int table_size, int probe_type)
{
    /* Set up table */
    table_t *T = (table_t *) malloc(sizeof(table_t));
    T->table_size = table_size;
    T->probe_type = probe_type;
    T->num_keys = 0;
    T->deleted_keys = 0;
    T->num_recent_probes = 0;
    T->OA = (table_entry_t *) malloc(table_size * sizeof(table_entry_t));

    /* NULL SC pointer since I'm not using it */
    T->SC = NULL;

    /* Initialize entries in Open Addressing Hash Table */
    int entry;
    for(entry = 0; entry < table_size; entry++) {
        T->OA[entry].key = EMPTY_KEY;
        T->OA[entry].data_ptr = NULL;
        T->OA[entry].deleted = FALSE;
    }

    return T;
} 

/* Sequentially remove each table entry (K, I) and insert into a new
 * empty table with size new_table_size.  Free the memory for the old table
 * and return the pointer to the new table.  The probe type should remain
 * the same.
 *
 * Do not rehash the table during an insert or delete function call.  Instead
 * use drivers to verify under what conditions rehashing is required, and
 * call the rehash function in the driver to show how the performance
 * can be improved.
 */
table_t *table_rehash(table_t *T, int new_table_size)
{
    /* Assert new size is big enough to rehash */
    assert(new_table_size >= T->num_keys + 1);

    /* Set up new table */
    table_t *new_table = table_construct(new_table_size, T->probe_type);

    /* Rehash by removing all non-empty keys and inserting them into the empty table
       in order */
    int entry;
    hashkey_t K;
    data_t I;
    for(entry = 0; entry < T->table_size; entry++) {
        if(T->OA[entry].key != EMPTY_KEY) {
            K = T->OA[entry].key;
            I = table_delete(T, K);
            table_insert(new_table, K, I);
        }
    }

    /* Free old table */
    table_destruct(T);

    return new_table;
}

/* returns number of entries in the table */
int table_entries(table_t *T)
{
    return T->num_keys;
}

/* returns 1 if table is full and 0 if not full. */
int table_full(table_t *T)
{
    return (T->num_keys == T->table_size - 1) ? 1 : 0;
}

/* returns the number of table entries marked as deleted */
int table_deletekeys(table_t *T)
{
    return T->deleted_keys;
}

/* Generates hash value for key K for table of size M.
 */ 
int table_key_hash(hashkey_t K, int M) 
{
    return K % M;
}

/* Calculates probe decrement value for Key K given the probe type, table_size,
 * and current probe decrement value (for use with quadratic probing).
 */
int table_probe_value(hashkey_t K, int current_probe_dec, int probe_type, int M)
{
    if(probe_type == LINEAR) return 1;
    else if(probe_type == DOUBLE) return fmax(1, (K / M) % M);
    else return current_probe_dec + 1;
}
  
/* Insert a new table entry (K, I) into the table provided the table is not
 * already full.  
 * Return:
 *      0 if (K, I) is inserted, 
 *      1 if an older (K, I) is already in the table (update with the new I), or 
 *     -1 if the (K, I) pair cannot be inserted.
 */
int table_insert(table_t *T, hashkey_t K, data_t I)
{
    /* Check if insert is possible if probe type is DOUBLE or QUAD. 
       Return unable to insert if not possible. */
    if(T->probe_type == DOUBLE && table_is_prime(T) == FALSE) return -1;
    else if(T->probe_type == QUAD && table_power_two(T) == FALSE) return -1;

    /* Reset number of recent probes */
    T->num_recent_probes = 0;

    /* Check if key is empty key - cannot be inserted */
    if(K == EMPTY_KEY) return -1;

    /* Search table for key */
    table_entry_t *search = table_search(T, K);

    /* If found, execute replace */
    if(search != NULL) {
        free(search->data_ptr);
        search->data_ptr = I;
        return 1;
    }

    /* If not found, return -1 if table is full - cannot insert */
    if(table_full(T) == TRUE) return -1;

    /* Reset number of recent probes since we are inserting and not replacing */
    T->num_recent_probes = 0;

    /* Otherwise, have to search again for first empty key. Note at this point,
       the table must contain at least two empty keys */
    int position = table_key_hash(K, T->table_size);
    T->num_recent_probes++;
    int probe_dec = 0;
    hashkey_t probe_key = T->OA[position].key;

   /* Search table for first empty slot */
   if(probe_key != EMPTY_KEY) {
       do {
           /* Get new probe value */
           probe_dec = table_probe_value(K, probe_dec, T->probe_type, T->table_size);

           /* Decrement current position by probe value */
           position -= probe_dec;

           /* Wrap position back around if nessecary */
           while(position < 0) position += T->table_size;

           /* Update probe_key to new value */
           probe_key = T->OA[position].key;
  
           /* Update number of probes for one more probe */
           T->num_recent_probes++;
       } while(probe_key != EMPTY_KEY);
   }

   /* Insert into new position */
   T->OA[position].key = K;
   T->OA[position].data_ptr = I;

   /* Reset deleted flag if set and update delete_keys stat */
   if(T->OA[position].deleted == TRUE) {
       T->deleted_keys--;
       T->OA[position].deleted = FALSE;
   }

   /* Update header for one more key */
   T->num_keys++;

   return 0;
}

/* Delete the table entry (K, I) from the table.  
 * Return:
 *     pointer to I, or
 *     null if (K, I) is not found in the table.  
 *
 * See the note on page 490 in Standish's book about marking table entries for
 * deletions when using open addressing.
 */
data_t table_delete(table_t *T, hashkey_t K)
{
    /* Reset number of recent probes */
    T->num_recent_probes = 0;

    /* Search table for key */
    table_entry_t *search = table_search(T, K);

    /* If key not found, return NULL */
    if(search == NULL) return NULL;

    /* Key found, update data pointer and stats */
    data_t temp = search->data_ptr;
    search->key = EMPTY_KEY;
    search->data_ptr = NULL;
    search->deleted = TRUE;
    T->num_keys--;
    T->deleted_keys++;

    /* Return removed data */
    return temp;
}

/* Given a key, K, retrieve the pointer to the information, I, from the table,
 * but do not remove (K, I) from the table.  Return NULL if the key is not
 * found.
 *
 * E is the pointer to the block in the table where K is contained if K is
 * found in the table. This is used by the insert function.
 */
data_t table_retrieve(table_t *T, hashkey_t K)
{
   /* Reset number of recent probes */
   T->num_recent_probes = 0;

   /* Use search algorithm to find out if entry is in table */
   table_entry_t *search = table_search(T, K);

   /* If found return the data ptr. If not found, return NULL */
   return (search != NULL) ? search->data_ptr : NULL;
}

/* Search algorithm for table_insert, table_delete, and table_retrieve. Returns pointer
 * to block in the table that contains K if K is found in the table, otherwise returns NULL if
 * K is not in the table.
 */
table_entry_t *table_search(table_t *T, hashkey_t K) 
{
    /* Check if search is possible if probe type is DOUBLE or QUAD. 
       Return not in table if not possible. */
    if(T->probe_type == DOUBLE && table_is_prime(T) == FALSE) return NULL;
    else if(T->probe_type == QUAD && table_power_two(T) == FALSE) return NULL;

    /* Initialize values nessecary for searching */
    int position = table_key_hash(K, T->table_size);
    int init_position = position;
    T->num_recent_probes++;
    int probe_dec = 0;
    hashkey_t probe_key = T->OA[position].key;

    /* Search table for key. Stop at first empty slot that is not a delete */
    do {
        /* Check if key found or if key is not in table */
        if(probe_key == K || (probe_key == EMPTY_KEY && T->OA[position].deleted == FALSE)) break;

        /* Get new probe value */
        probe_dec = table_probe_value(K, probe_dec, T->probe_type, T->table_size);
 
        /* Decrement current position by probe value */
        position -= probe_dec;

        /* Wrap position back around if nessecary */
        while(position < 0) position += T->table_size;

        /* Update probe_key to new value */
        probe_key = T->OA[position].key;
  
        /* Update number of probes for one more probe */
        T->num_recent_probes++;
   } while(position != init_position);
  

   /* If found, return table block. otherwise, return NULL */
   return (T->OA[position].key == K) ? (T->OA + position) : NULL;
}

/* Boolean function that checks if the size of the table with header block T is prime.
 *
 * Returns true if prime or false if not prime. Useful for checking for valid Double Probing. 
 */
int table_is_prime(table_t *T) 
{
    /* If 0 or 1, not prime */
    if(T->table_size <= 1) return FALSE;   

    /* If divisible by any factors up to sqrt(T->table_size), not prime */    
    int i;
    for(i = 2; i*i <= T->table_size; i++) {
        if(T->table_size % i == 0) return FALSE;
    }

    /* Otherwise, prime */
    return TRUE;
}

/* Boolean function that checks if the size of the table with header block T is a power of two.
 *
 * Returns true if power of two and false otherwise. Useful for checking for valid Quad Probing.
 */
int table_power_two(table_t *T) 
{
    /* If 0, not power of two */
    if(T->table_size == 0) return FALSE;

    /* If any factors of T->table_size % 2 != 0, not power of two */
    int size = T->table_size;
    while(size != 1) {
        if(size % 2 != 0) return FALSE;
        size = size / 2;
    }
   
    /* Otherwise, power of two */
    return TRUE;
}

/* Free all information in the table, the table itself, and any additional
 * headers or other supporting data structures.  
 */
void table_destruct(table_t *T)
{
    /* Free data pointers */
    int entry;
    for(entry = 0; entry < T->table_size; entry++) {
        if(T->OA[entry].data_ptr != NULL) free(T->OA[entry].data_ptr);
    }

    /* Free table and table header */
    free(T->OA);
    free(T);
}

/* The number of probes for the most recent call to table_retrieve,
 * table_insert, or table_delete 
 */
int table_stats(table_t *T)
{
    return T->num_recent_probes;
}

/* This function is for testing purposes only.  Given an index position into
 * the hash table return the value of the key if data is stored in this 
 * index position.  If the index position does not contain data, then the
 * return value must be zero.  Make the first
 * lines of this function 
 *       assert(0 <= index && index < table_size); 
 */
hashkey_t table_peek(table_t *T, int index)
{
    assert(0 <= index && index < T->table_size);
    return (T->OA[index].data_ptr != NULL) ? T->OA[index].key : 0;
} 

/* Print the table position and keys in a easily readable and compact format.
 * Only useful when the table is small.
 *
 * Remember to change this before submission to kill all extra prints.
 */
void table_debug_print(table_t *T)
{
    int entry;
    printf("Entry | Key Value\n");
    for(entry = 0; entry < T->table_size; entry++) {
        if(T->OA[entry].key == EMPTY_KEY) printf("%5d | Empty", entry);
        else printf("%5d | %5d", entry, T->OA[entry].key);

        if(T->OA[entry].deleted == TRUE) printf(" (D)\n");
        else printf("\n");
    }
}

/* commands for vim. ts: tabstop, sts: softtabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
