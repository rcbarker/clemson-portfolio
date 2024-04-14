/* Test driver for bst.c */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "bst.h"

#define NUMELEMENTS 25

int main(void)
{
    bst_t *T = bst_construct(0);
    int *data_p;
    int i, insert, key;
    int *remove;
    int key_arr[NUMELEMENTS];

    printf("About to insert %d random elements into a BST...\n", NUMELEMENTS);

    /* Test Insert */
    for(i = 0; i < NUMELEMENTS; i++) {
        key = rand() % 100;
        key_arr[i] = key;
        data_p = (int *) malloc(sizeof(int));
        *data_p = i;
        insert = bst_insert(T, key, data_p);

        if(insert)
            printf("Record %d inserted. Data = %d.\n", key, i);
        else
            printf("Record %d updated. New data = %d.\n", key, i);
    }

    /* Print tree and run debug function */
    printf("\nPrinting Tree:\n");
    bst_debug_print_tree(T);
    bst_debug_validate(T);

    /* Print Stats */
    printf("\nPrinting Stats:\n");
    int size = bst_size(T);
    int comp = bst_stats(T);
    int IPL = bst_int_path_len(T);
    printf("Tree is %d nodes. There were last %d comparisons. ", size, comp);
    printf("The IPL of the tree is %d.\n\n", IPL);

    /* Test Remove for valid functions */
    for(i = 0; i < (NUMELEMENTS-5); i++) {
        remove = bst_remove(T, key_arr[i]);
  
        if(remove != NULL) {
            printf("Record %d removed. Data removed = %d.\n", key_arr[i], *remove);
            free(remove);
        } else
            printf("Record %d not in list!\n", key_arr[i]);
    }
     
    /* Attempt to remove value not in list */
    remove = bst_remove(T, 99999);

     if(remove != NULL) {
         printf("Record %d removed. Data removed = %d.\n", key_arr[i], *remove);
         free(remove);
     } else
         printf("Record %d not in list!\n", 99999);

    /* Print tree and run debug function */
    printf("\nPrinting Tree:\n");

    /* Debugging print below. Uncomment for more details concerning header block */
//    printf("T->root = %p, First node = %d, T->size = %d\n", T->root, T->root->key, T->tree_size);
    /* Debugging print above. Uncomment for more details concerning header block */

    bst_debug_print_tree(T);
    bst_debug_validate(T);

    /* Print Stats */
    printf("\nPrinting Stats:\n");
    size = bst_size(T);
    comp = bst_stats(T);
    IPL = bst_int_path_len(T);
    printf("Tree is %d node(s). There was last %d comparison(s). ", size, comp);
    printf("The IPL of the tree is %d.\n", IPL);

    /* Free tree */
    bst_destruct(T);

    return 0;
}
