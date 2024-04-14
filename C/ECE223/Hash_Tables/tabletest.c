/* Test driver for table.c */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "table.h"

int main(void)
{   
    /* Read in table size */
    int size;
    printf("Enter size of hash table to generate: ");
    scanf("%d", &size);
    while(size < 1) {
         printf("Invalid table size! Must be at least one (Preferrably greater). Re-enter: ");
         scanf("%d", &size);
    }
    int p_type;
    printf("Enter probe type (1 -> linear | 2 -> double | 3 -> quad): ");
    scanf("%d", &p_type);
    while(p_type != 1 && p_type != 2 && p_type != 3) {
        printf("Invalid probe type! Re-enter: ");
        scanf("%d", &p_type);
    }
    int verbose;
    printf("Verbose output (0 | 1)? ");
    scanf("%d", &verbose);
    while(verbose != 0 && verbose != 1) {
        printf("Invalid verbose flag! Re-enter: ");
        scanf("%d", &verbose);
    }
    
    /* Figure out probe type */
    int probe_type;
    switch(p_type) {
         case 1: probe_type = LINEAR; break;
         case 2: probe_type = DOUBLE; break;
         case 3: probe_type = QUAD; break;
    }

    /* Constuct tables */
    table_t *T = table_construct(size, probe_type);

    /* Insert and replace keys */
    int insert, i;
    hashkey_t key = 0;
    int *data_ptr = NULL;
    for(i = 0; i < 2*size; i++) {
        key = (rand() % 1000) + 1;
        data_ptr = malloc(sizeof(int));
        *data_ptr = rand() % 1000;
        insert = table_insert(T, key, data_ptr);
        if(verbose) {
            if(insert == 0) printf("Key %d inserted!\n", key);
            else if(insert == 1) printf("Key %d replaced!\n", key);
            else {
                printf("Key %d not inserted!\n", (int) key);
                free(data_ptr);
            }
        } else {
            if(insert == -1) free(data_ptr);
        }
    }

    /* Print table */
    if(verbose) table_debug_print(T);

    /* Attempt to find keys */
    int *search = NULL;
    for(i = 0; i < 2*size; i++) {
        key = (rand() % size) + 1;
        search = table_retrieve(T, key);
        if(verbose) {
            if(search == NULL) printf("Key %d not in table.\n", key);
            else {
                printf("Key %d in table. Data = %d\n", (int) key, *search);
            }
        }
    }

    /* Attempt removes */
    int *old = NULL;
    for(i = 0; i < 2*size; i++) {
        key = (rand() % size) + 1;
        old = table_delete(T, key);
        if(verbose) {
            if(old == NULL) printf("Key %d not removed!\n", key);
            else {
                printf("Key %d removed. Old data: %d\n", key, *old);
                free(old);
            } 
        } else free(old);
    }

    /* Print table again */
    if(verbose) table_debug_print(T);

    /* Destroy table */
    table_destruct(T);

    return 0;
}
