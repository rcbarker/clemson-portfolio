/* lab1.c
 * Ryan Barker
 * ECE 223 Fall 2014
 * MP1
 *
 * Purpose: lab1.c emulates a TCP/IP Socket list used by a typical computer to track the number of
 * available TCP/IP sockets. It takes input and displays formatted output depending on the 
 * command. The functions that perform commands and the list itself are found in socketlist.c. 
 * 
 * Commands available:
 * - insert x: Takes input for a new socket and places that socket in position x of the list. 
 * - replace x: Deletes record at position x in the list, takes input for a new socket, and places
 *   that socket at position x in the list.
 * - pushback: Takes input for a new socket and places that socket in the back of the list.
 * - erase x: Deletes the socket at position x in the list and moves all sockets afterward one 
 *   position forward in the list.
 * - popback: Deletes the socket at the end of the list.
 * - at x: Prints the socket information at position x in the list. 
 * - front: Prints the socket information for the first socket in the list.
 * - back: Prints the socket information for the last socket in the list.
 * - print: Prints socket information for all sockets in the list.
 * - quit: Frees all memory blocks storing socket information, frees the block storing the list, 
 *   and ends the program. 
 * 
 * Assumptions: Project specifies information hiding, so this program will never directly access 
 * the socket list and will instead use functions found in socketlist.c to grab information from
 * the socket list. The functions both take a pointer to a specific set of socket information and 
 * do not return anything. 
 *
 * Bugs: No currently known bugs.
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "socketlist.h"

#define MAXLINE 256

// function prototypes for lab1.c
void fill_socket_record(struct socket_info_t *new);
void print_socket_rec(struct socket_info_t *rec);

int main(int argc, char *argv[])
{
    char line[MAXLINE];
    char command[MAXLINE];
    char junk[MAXLINE];
    int num_items;
    int list_position;
    int i;
    struct socketlist_t *soc_ptr = socketlist_construct();  // Pointer to the list
    struct socket_info_t *rec_ptr = NULL; // Pointer to socket info

    if (argc != 1) {
        printf("Usage: ./lab1 \n");
        exit(1);
    }
    printf("Welcome to MP1: TCP/IP Socket List Manager via Vectors\n");

    /* Remember fgets includes newline \n unless line too long */
    while (fgets(line, MAXLINE, stdin) != NULL) {
        num_items = sscanf(line, "%s%d%s", command, &list_position, junk);
        if (num_items == 2 && strcmp(command, "insert") == 0) {
            rec_ptr = (struct socket_info_t *) malloc(sizeof(struct socket_info_t));
            fill_socket_record(rec_ptr);

            // Call socketlist_add to insert new record into socket list:
            int added_return = socketlist_add(soc_ptr, list_position, rec_ptr);

            if (added_return == 0) {
                printf("Inserted: %d into position %d\n", 
                        rec_ptr->socket_id, list_position);
            } else if (added_return == -1) {
                printf("Rejected: %d invalid position %d\n", 
                        rec_ptr->socket_id, list_position);
                free(rec_ptr);
            } else {
                printf("Error with return value! Your code must be fixed\n");
                free(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "replace") == 0) {
            rec_ptr = (struct socket_info_t *) malloc(sizeof(struct socket_info_t));
            fill_socket_record(rec_ptr);

            // Call socketlist_replace to replace the block at list position
            // and gain the pointer to the old record.
            struct socket_info_t *old_rec_ptr = socketlist_replace(soc_ptr, list_position,  
                                                                   rec_ptr);

            if (old_rec_ptr == NULL) {
                printf("Did not replace: %d invalid position %d\n", 
                        rec_ptr->socket_id, list_position);
                free(rec_ptr);
            } else {
                printf("Replaced: %d with %d into position %d\n", 
                        old_rec_ptr->socket_id, rec_ptr->socket_id, 
                        list_position);
                free(old_rec_ptr); // Frees the information being replaced.
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "pushback") == 0) {
            rec_ptr = (struct socket_info_t *) malloc(sizeof(struct socket_info_t));
            fill_socket_record(rec_ptr);

            // Call socketlist_add to add entry to the end of the list:
            socketlist_add(soc_ptr, socketlist_number_entries(soc_ptr),
                                              rec_ptr);

            printf("Pushed: %d into position %d\n", rec_ptr->socket_id, 
                    socketlist_number_entries(soc_ptr) - 1);
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "erase") == 0) {
            rec_ptr = socketlist_remove(soc_ptr, list_position);
            if (rec_ptr == NULL) {
                printf("Did not remove: invalid position %d\n", list_position);
            } else {
                printf("Erased: %d from position %d\n", rec_ptr->socket_id, 
                        list_position);
                free(rec_ptr); // Frees the block of information being erased.
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "popback") == 0) {
            rec_ptr = socketlist_remove(soc_ptr, socketlist_number_entries(soc_ptr) - 1);
            if (rec_ptr == NULL) {
                printf("Did not pop: list is empty\n");
            } else {
                printf("Poped: %d from position %d\n", rec_ptr->socket_id, 
                    socketlist_number_entries(soc_ptr));
                free(rec_ptr); // Frees the block of information being erased.
            }
            rec_ptr = NULL;
        } else if (num_items == 2 && strcmp(command, "at") == 0) {
            rec_ptr = socketlist_access(soc_ptr, list_position);
            if (rec_ptr == NULL) {
                printf("Did not print: invalid position %d\n", list_position);
            } else {
                printf("Record at position: %d\n", list_position);
                print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "front") == 0) {
            rec_ptr = socketlist_access(soc_ptr, 0);
            if (rec_ptr == NULL) {
                printf("Did not print front: list is empty\n");
            } else {
                printf("Record at front:\n");
                print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "back") == 0) {
            rec_ptr = socketlist_access(soc_ptr, socketlist_number_entries(soc_ptr) - 1);
            if (rec_ptr == NULL) {
                printf("Did not print back: list is empty\n");
            } else {
                printf("Record at back:\n");
                print_socket_rec(rec_ptr);
            }
            rec_ptr = NULL;
        } else if (num_items == 1 && strcmp(command, "print") == 0) {
            int num_in_list = socketlist_number_entries(soc_ptr);
            if (num_in_list == 0) {
                printf("List empty\n");
            } else {
                printf("%d records\n", num_in_list);
                for (i = 0; i < num_in_list; i++) {
                    printf("%d: ", i+1);
                    // Change rec_ptr to the current point in the list and print with provided
                    // function:
                    rec_ptr = socketlist_access(soc_ptr, i);
                    print_socket_rec(rec_ptr);
                }
            }
        } else if (num_items == 1 && strcmp(command, "stats") == 0) {
            // Get the number in list and size of the list:
            int num_in_list = socketlist_number_entries(soc_ptr);
            int size_of_list = socketlist_capacity(soc_ptr);
            printf("Number records: %d, Current capacity: %d\n", 
                    num_in_list, size_of_list);
        } else if (num_items == 1 && strcmp(command, "quit") == 0) {
            printf("Goodbye\n");
            socketlist_destruct(soc_ptr);
            break;
        } else {
            printf("# %s", line);
        }
    }
    exit(0);
}

/* Prompts user for record input starting with the Socket ID.
 * The input is not checked for errors but will default to an acceptable value
 * if the input is incorrect or missing.
 *
 * The input to the function assumes that the structure has already been
 * created.  The contents of the structure are filled in.
 *
 * There is no output.
 */
void fill_socket_record(struct socket_info_t *new)
{
    char line[MAXLINE];
    assert(new != NULL);

    printf("Socket ID:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->socket_id);


    printf("Dest IP address:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->dest_ip_addr);
    printf("Source IP address:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->src_ip_addr);
    printf("Dest port number:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->dest_port_num);
    printf("Source port number:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->src_port_num);
    printf("protocol (TCP|UDP|SSL|RTP):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->protocol);
    printf("address family (IPv4|IPv6):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->address_family);
    printf("state (EST|CLOSE_WAIT|CLOSED):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->state);
    printf("data rate:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%f", &new->data_rate);
    printf("Time received (int):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->time_received);
    printf("\n");
}

/* Prints the information for a particular WiFi record.
 *
 * Input is a pointer to a record, and no entries are changed.
 *
 */
void print_socket_rec(struct socket_info_t *socket)
{
    assert(socket != NULL);
    printf("Socket id: %d", socket->socket_id);
    printf(" Dest: %d, Src: %d, Dport: %d,", socket->dest_ip_addr, 
            socket->src_ip_addr, socket->dest_port_num);
    printf(" Src: %d,", socket->src_port_num); 
    printf(" Prot: %d, Fam: %d, St: %d", socket->protocol, 
            socket->address_family, socket->state);
    printf(" Rt: %g\n", socket->data_rate);
    printf("Tm: %d\n", socket->time_received);
}

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
