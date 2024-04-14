/* 
Edited by Ryan Barker
Originally written by Harlan Russell

Test debugging file for list.c.
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "datatypes.h"
#include "list.h"

/* prototype for list debug print */
void list_debug_print(list_t *list_ptr);

int main(void)
{
    data_t *datap;
    list_t *Lptr;
    char input;
    int to_test;
    Lptr = list_construct();

    printf("Enter list sort algorithm number to test: ");
    input = getchar();
    to_test = (int) input - '0';

    // Test 1:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 1\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 1\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;

    printf("\n\n");

    // Test 2:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 2\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 2\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;

    printf("\n\n");

    // Test 3:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 3\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 3\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;


    printf("\n\n");

    // Test 4:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_HEAD);;
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 4\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 4\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;

    printf("\n\n");

    // Test 5:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 5\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 5\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;

    printf("\n\n");

    // Test 6:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 6\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 6\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;


    printf("\n\n");

    // Test 7:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 7\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 7\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;


    printf("\n\n");

    // Test 8:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 8\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 8\n");
    list_debug_print(Lptr);

    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;
    datap = list_remove(Lptr, LISTPOS_TAIL);
    free(datap);
    datap = NULL;


    printf("\n\n");

    // Test 9:
    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 333;
    list_insert(Lptr, datap, LISTPOS_HEAD);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 222;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    datap = (data_t *) malloc(sizeof(data_t));
    datap->socket_id = 111;
    list_insert(Lptr, datap, LISTPOS_TAIL);
    datap = NULL;

    // Print filled list:
    printf("\nInitial List - Test 9\n");
    list_debug_print(Lptr);

    list_sort(Lptr, to_test);

    // Print sorted list:
    printf("\nList Sorted - Test 9\n");
    list_debug_print(Lptr);

    list_destruct(Lptr);

    return 0;
}

/*

Next you will want to write your own list_debug_print function to print a
list.  Then you can do "before and after" testing.  That is, print the list
before a change, and print the list after the change to verify that the change
worked.

Something like
*/

void list_debug_print(list_t *list_ptr) {
    list_node_t *L;
    int count;

    printf("list size: %d\n", list_ptr->ll_entries);
    L = list_ptr->ll_head;
    count = 0;
    while(L != NULL) {
        printf("Pos: %d contains ID: %d\n", count, L->data_ptr->socket_id);
        L = L->ll_next;
        count++;
    }
    if (count != list_ptr->ll_entries)
        printf("\nERROR: the list size is wrong! count is %d\n", count);
}

