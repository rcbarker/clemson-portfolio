/* lab3.c
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP3
 *
 * To run: Use ./lab3 SORT_TYPE, where SORT_TYPE is one of the following integers:
 * 1 = insertion_sort
 * 2 = recursive_selection_sort
 * 3 = iterative_selection_sort
 * 4 = merge_sort
 * 5 = quick_sort
 * 
 * This parameter is used by the "sort" command.
 *
 * Purpose: Uses functions from soc_support.c and list.c to manipulate TCP/IP sockets 
 * in one of two two-way linked lists. Commands are identical to MP2, with the inclusion
 * of a new sort command for the unsorted list. 
 *
 * Commands for sorted list:
 * - INSERT x: Takes input for a new socket with socket ID x and places that socket in the
 *   correct position of the list so it is sorted ascended by socket ID.
 * - LOOK x: Prints socket information for the first socket in the list with socket ID x.
 * - REMOVE x: Deletes first socket with socket ID x from the list.
 * - UPDATE x: Deletes first record in the list with socket ID x, takes input for a new socket
 *   with socket ID x, and places that socket in the same position the deleted socket was in.
 * - PRINT x: Prints socket information for all sockets in the list.
 *
 * Commands for unsorted list:
 * - insert x: Takes input for a new socket and places that socket in position x of the list. 
 * - replace x: Deletes record at position x in the list, takes input for a new socket, and 
 *   places that socket at position x in the list.
 * - pushback: Takes input for a new socket and places that socket in the back of the list.
 * - erase x: Deletes the socket at position x in the list and moves all sockets afterward one 
 *   position forward in the list.
 * - popback: Deletes the socket at the end of the list.
 * - at x: Prints the socket information at position x in the list. 
 * - front: Prints the socket information for the first socket in the list.
 * - back: Prints the socket information for the last socket in the list.
 * - print: Prints socket information for all sockets in the list.
 * - sort: Sorts the list with the algorithm specified at execution.
 *
 * Shared commands:
 * - stats: Prints the number of items in each list. 
 * - quit / QUIT: Frees all memory blocks storing socket information, 
 *   frees the link lists themselves, and ends the program.
 * 
 * Assumptions: The I/O scheme from MP2 is the correct scheme to be used in MP3 under
 * normal operation. Note that the welcome message and pushback prompts are commented out 
 * for the purpose of optimizing the code's performance during efficiency testing.
 *
 * Bugs: No currently known bugs.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <time.h>

#include "datatypes.h"
#include "list.h"
#include "soc_support.h"

#define MAXLINE 256

/* Function Prototypes */
void printCommands(void);

int main(int argc, char *argv[])
{
    char line[MAXLINE];
    char command[MAXLINE];
    char junk[MAXLINE];
    int command_number;   // number found with command, either a
                          // list position or socket-id
    int num_items;
    int i;
    list_t *unsorted_list = soc_create();  // pointer to unsorted list
    list_t *sorted_list = soc_create();  // pointer to sorted list
    socket_t *rec_ptr = NULL; // pointer to socket info

    int sort_type; // parameter that determines sort 
                                         // used when sort command is specified
    clock_t start, end;
    double elapse_time; /* time in milliseconds */

    if (argc != 2 || (*argv[1] - '0') < 0 ||(*argv[1] - '0')  > 5) {
        printf("Usage: ./lab3. See header in lab3.c\n");
        exit(1);
    }

    printf("\nWelcome to MP3: Sorted/Unsorted Linked TCP/IP Socket List Manager and Sorter.\n\n");
    printCommands();
    printf("\nCommand Input Line:\n");

    /* set sort_type equal to second argument passed in command line */
    sort_type = (int) *argv[1] - '0';

    /* remember fgets includes newline \n unless line too long */
    while (fgets(line, MAXLINE, stdin) != NULL) {
        num_items = sscanf(line, "%s%d%s", command, &command_number, junk);
        if (num_items == 2 && strcmp(command, "insert") == 0) {
            rec_ptr = (socket_t *) malloc(sizeof(socket_t));
            soc_get_socket_id(rec_ptr);

            // Call insert function:
            int added_return = soc_insert(unsorted_list, 
                                          rec_ptr, command_number);

            if (added_return == 0) {
                printf("Inserted: %d into position %d\n", 
                        rec_ptr->socket_id, command_number);
            } else if (added_return == -1) {
                printf("Rejected: %d invalid position %d\n", 
                        rec_ptr->socket_id, command_number);
                free(rec_ptr);
            } else {
                printf("Error with return value!  Your code must be fixed\n");
                free(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "replace") == 0) {
            rec_ptr = (socket_t *) malloc(sizeof(socket_t));
            soc_get_socket_id(rec_ptr);

            // Call update function:
            socket_t *old_rec_ptr = soc_update(unsorted_list, 
                                               rec_ptr, command_number);

            if (old_rec_ptr == NULL) {
                printf("Did not replace: %d invalid position %d\n", 
                        rec_ptr->socket_id, command_number);
                free(rec_ptr);
            } else {
                printf("Replaced: %d with %d into position %d\n", 
                        old_rec_ptr->socket_id, rec_ptr->socket_id, 
                        command_number);
                free(old_rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "pushback") == 0) {
            rec_ptr = (socket_t *) calloc(1,sizeof(socket_t));
            soc_get_socket_id(rec_ptr);

            soc_insert(unsorted_list, rec_ptr, LISTPOS_TAIL);

            printf("Pushed: %d into position %d\n", rec_ptr->socket_id, 
                     soc_number_entries(unsorted_list) - 1);
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "erase") == 0) {
            rec_ptr = soc_remove(unsorted_list, command_number);
            if (rec_ptr == NULL) {
                printf("Did not remove: invalid position %d\n", command_number);
            } else {
                printf("Erased: %d from position %d\n", rec_ptr->socket_id, 
                        command_number);
                free(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "popback") == 0) {
            rec_ptr = soc_remove(unsorted_list, LISTPOS_TAIL);
            if (rec_ptr == NULL) {
                printf("Did not pop: list is empty\n");
            } else {
                printf("Popped: %d from position %d\n", rec_ptr->socket_id, 
                    soc_number_entries(unsorted_list));
                free(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "at") == 0) {
            rec_ptr = soc_lookup(unsorted_list, command_number);
            if (rec_ptr == NULL) {
                printf("Did not print: invalid position %d\n", command_number);
            } else {
                printf("Record at position: %d\n", command_number);
                soc_print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "front") == 0) {
            rec_ptr = soc_lookup(unsorted_list, LISTPOS_HEAD);
            if (rec_ptr == NULL) {
                printf("Did not print front: list is empty\n");
            } else {
                printf("Record at front:\n");
                soc_print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "back") == 0) {
            rec_ptr = soc_lookup(unsorted_list, LISTPOS_TAIL);
            if (rec_ptr == NULL) {
                printf("Did not print back: list is empty\n");
            } else {
                printf("Record at back:\n");
                soc_print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "sort") == 0) {
            int initialsize = list_entries(unsorted_list);
            start = clock();
            list_sort(unsorted_list, sort_type);
            end = clock();
            elapse_time = 1000.0 * ((double) (end - start)) / CLOCKS_PER_SEC;
            assert(list_entries(unsorted_list) == initialsize);
            printf("%d\t%f\t%d\n", initialsize, elapse_time, sort_type);
        } else if (num_items == 2 && strcmp(command, "INSERT") == 0) {
            rec_ptr = (socket_t *) malloc(sizeof(socket_t));
            rec_ptr->socket_id = command_number;
            soc_fill_record(rec_ptr);
            soc_sorted_insert(sorted_list, rec_ptr);
            printf("Added to sorted list: %d\n", command_number);
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "LOOK") == 0) {
            rec_ptr = soc_sorted_lookup(sorted_list, command_number);
            if (rec_ptr == NULL) {
                printf("Did not find in sorted list: %d\n", command_number);
            } else {
                printf("Found in sorted list: %d\n", command_number);
                /* print other items in structure */
                soc_print_socket_rec(rec_ptr);
                assert(rec_ptr->socket_id == command_number);
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "REMOVE") == 0) {
            rec_ptr = soc_sorted_remove(sorted_list, command_number);
            if (rec_ptr == NULL) {
                printf("Did not remove in sorted list: %d\n", command_number);
            } else {
                printf("Removed from sorted list: %d\n",command_number);
                soc_print_socket_rec(rec_ptr);
                assert(rec_ptr->socket_id == command_number);
                free(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "UPDATE") == 0) {
            rec_ptr = (socket_t *) malloc(sizeof(socket_t));
            rec_ptr->socket_id = command_number;
            soc_fill_record(rec_ptr);
            socket_t *old_rec_ptr = soc_sorted_update(sorted_list, rec_ptr);
            if (old_rec_ptr == NULL) {
                printf("Did not update in sorted list: %d\n", command_number);
                free(rec_ptr);
            } else {
                printf("Updated sorted list: %d, old record\n",command_number);
                soc_print_socket_rec(old_rec_ptr);
                assert(old_rec_ptr->socket_id == command_number);
                free(old_rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "print") == 0) {
            int num_in_list = soc_number_entries(unsorted_list);
            if (num_in_list == 0) {
                printf("Unsorted list empty\n");
            } else {
                printf("%d records in unsorted list\n", num_in_list);
                for (i = 0; i < num_in_list; i++) {
                    printf("%d: ", i+1);

                    rec_ptr = soc_lookup(unsorted_list, i);
                    soc_print_socket_rec(rec_ptr);
                }
            }
        } else if (num_items == 1 && strcmp(command, "PRINT") == 0) {
            int num_in_list = soc_number_entries(sorted_list);
            if (num_in_list == 0) {
                printf("Sorted list empty\n");
            } else {
                printf("%d records in sorted list\n", num_in_list);
                for (i = 0; i < num_in_list; i++) {
                    printf("%d: ", i+1);

                    rec_ptr = soc_lookup(sorted_list, i); 
                    soc_print_socket_rec(rec_ptr);
                }
            }
        } else if (num_items == 1 && strcmp(command, "stats") == 0) {
            // Get the number in list and size of the list
            int num_unsorted_list = soc_number_entries(unsorted_list);
            int num_sorted_list = soc_number_entries(sorted_list);
            printf("Unsorted number records: %d, Sorted number records: %d\n", 
                    num_unsorted_list, num_sorted_list);
        } else if (num_items == 1 && 
              (strcmp(command, "quit") == 0 || strcmp(command, "QUIT") == 0)) {
            soc_cleanup(unsorted_list);
            soc_cleanup(sorted_list);
            printf("Goodbye\n");
            break;
        } else {
            printf("# %s", line);
        }
    }
    exit(0);
}

/* Prints all of the commands the program supports to the screen.
 */
void printCommands(void)
{
 printf("This program contains operations for a linked list that is always sorted, and ");
 printf("a list that is initially unsorted, but may be sorted.\n\n");


 printf("Commands for sorted list:\n");
 printf(" - INSERT x: Takes input for a new socket with ID x and places it in a list");
 printf(" sorted by ascending ID.\n");
 printf(" - LOOK x: Prints socket information for the socket with ID x.\n");
 printf(" - REMOVE x: Deletes first socket with socket ID x from the list.\n");
 printf(" - UPDATE x: Updates information for socket with ID x.\n");
 printf(" - PRINT: Prints the sorted list.\n\n");
 printf("Commands for unsorted list:\n");
 printf(" - insert x: Takes input for a new socket and places it in position x.\n");
 printf(" - replace x: Replaces the socket in position x.\n");
 printf(" - pushback: Places a new socket in the back of the unsorted list.\n");
 printf(" - erase x: Deletes the socket at position x.\n");
 printf(" - popback: Deletes the socket in the back of the unsorted list.\n");
 printf(" - at x: Prints the socket information at position x in the list.\n"); 
 printf(" - front: Prints the socket information for the first socket in the list.\n");
 printf(" - back: Prints the socket information for the last socket in the list.\n");
 printf(" - print: Prints the unsorted list.\n");
 printf(" - sort: Sorts the list with the algorithm specified at execution.\n");
 printf("   1 = insertion, 2 = recursive, 3 = iterative, 4 = merge, 5 = quick\n\n");
 printf("Shared commands:\n");
 printf(" - stats: Prints the number of items in each list.\n"); 
 printf(" - quit / QUIT: Frees all memory blocks storing socket information,\n");
 printf("   frees the link lists themselves, and ends the program.\n");
}

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
