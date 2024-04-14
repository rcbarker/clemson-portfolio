/* soc_support.c
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014 
 * MP3
 *
 * Purpose: Intermediate file for manipulating TCP/IP sockets in two way linked lists. Identical
 * to the file from MP2, though I have added the ability to specify LISTPOS_HEAD and LISTPOS_TAIL
 * to functions when applicable (Something I forgot to implement in MP2).
 *
 * Assumptions: All functions for MP3 must be exactly the same as MP2. Note that the call to
 * fill_soc_record in get_socket_id is commented out to optimize the code during efficiency 
 * testing.
 *
 * Bugs: No currently known bugs.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "datatypes.h"
#include "list.h"
#include "soc_support.h"

#define MAXLINE 256

/* soc_compare is required by the list ADT for sorted lists. 
 *
 * This function returns 
 *     1 if rec_a should be closer to the head than rec_b,
 *    -1 if rec_b is to be considered closer to the head, and 
 *     0 if the records are equal.
 *
 * For the socket data we want to sort from lowest ID up, so
 * closer to the front means a smaller ID.
 *
 * The function expects pointers to two record structures, and it is an error
 * if either is NULL
 *
 * THIS FUNCTION SHOULD NOT BE CHANGED
 */
int soc_compare(socket_t *soc_a, socket_t *soc_b)
{
    assert(soc_a != NULL && soc_b != NULL);
    if (soc_a->socket_id < soc_b->socket_id)
	return 1;
    else if (soc_a->socket_id > soc_b->socket_id)
	return -1;
    else
	return 0;
}

/* This creates a list and it can be either a sorted or unsorted list
 */
list_t *soc_create()
{
    return list_construct();
}

/* This function frees the memory for either a sorted or unsorted list.
 */
void soc_cleanup(list_t *list_ptr)
{
    list_destruct(list_ptr);
}

/* Return the number of items in the list.  A list and it can be either 
 * a sorted or unsorted list
 */
int soc_number_entries(list_t *list_ptr)
{
    return list_entries(list_ptr);
}

/* This function adds the structure to the list in the position
 * pos_index. Or, if pos_index is invalid, the function returns
 * -1 and does not insert the record.
 */
int soc_insert(list_t *list_ptr, socket_t *socket, int pos_index)
{   
    if ((pos_index < 0 || pos_index > list_entries(list_ptr)) 
        && pos_index != LISTPOS_HEAD && pos_index != LISTPOS_TAIL)
        return -1;
    else {
        list_insert(list_ptr, socket, pos_index);
        return 0;
    }
}

/* This function adds the structure to the list in sorted order.
 * If the new structure has the same socket_id as an
 * element in the list, then the new structure is placed after 
 * all sockets with the same id.
 */
void soc_sorted_insert(list_t *list_ptr, socket_t *socket)
{   
    list_insert_sorted(list_ptr, socket);
}

/* This function looks for the structure at position
 * pos_index in the list pointed to by list_ptr. Or, null is 
 * returned if the pos_index is invalid.
 */
socket_t *soc_lookup(list_t *list_ptr, int pos_index)
{    if ((pos_index < 0 || pos_index > list_entries(list_ptr)) 
         && pos_index != LISTPOS_HEAD && pos_index != LISTPOS_TAIL)
         return NULL;
     else
         return list_access(list_ptr, pos_index);
}

/* This function looks for the first structure with the matching socket_id 
 * in the sorted list.  Or, null is returned if the element is not found 
 * in the list.
 */
socket_t *soc_sorted_lookup(list_t *list_ptr, int id)
{
    int placeholder;
    socket_t *temp_socket = malloc(sizeof(socket_t));
    temp_socket->socket_id = id;    

    socket_t *found_socket = list_elem_find(list_ptr, temp_socket, &placeholder);
    free(temp_socket);

    return found_socket;
}

/* This function removes the structure in pos_index of the unsorted list and 
 * returns a pointer to the removed data. Or, if pos_index is invalid, it returns
 * NULL and no records are removed.
 */
socket_t *soc_remove(list_t *list_ptr, int pos_index)
{    if ((pos_index < 0 || pos_index > list_entries(list_ptr)) 
     && pos_index != LISTPOS_HEAD && pos_index != LISTPOS_TAIL)
         return NULL;
     else
         return list_remove(list_ptr, pos_index);
}

/* This function removes the first structure from the sorted list with the 
 * matching socket_id
 */
socket_t *soc_sorted_remove(list_t *list_ptr, int id)
{
    int position;
    socket_t *temp_socket = malloc(sizeof(socket_t));
    temp_socket->socket_id = id;    

    list_elem_find(list_ptr, temp_socket, &position);
    free(temp_socket);

    return list_remove(list_ptr, position);
}

/* This function replaces the structure from the unsorted list in the position
 * pos_index with the structure passed to it. Or, if pos_index is invalid, the
 * function returns NULL and nothing is replaced.
 */
socket_t *soc_update(list_t *list_ptr, socket_t *socket, int pos_index)
{   
    if(pos_index < 0 || pos_index > list_entries(list_ptr) - 1)
        return NULL;
    else {
        list_insert(list_ptr, socket, pos_index);
        return list_remove(list_ptr, pos_index + 1); 
    }
}

/* This function replaces the structure from the sorted list with the matching
 * socket_id.  If there are multiple records with the same socket_id, 
 * the first record is the one updated with the new information.
 */
socket_t *soc_sorted_update(list_t *list_ptr, socket_t *new_socket)
{   
    socket_t *to_update, *old_data;
    int pos_index;

    old_data = (socket_t *) malloc(sizeof(socket_t));

    to_update = list_elem_find(list_ptr, new_socket, &pos_index);

    if(to_update != NULL) {
        *old_data = *to_update;  // Update if data is found
        *to_update = *new_socket;
        free(new_socket);
    }
    else {
        free(old_data);  // Don't update if data is not found
        old_data = NULL;
    }

    return old_data;
}

/* Prompts user for socket ID and then calls another function
 * to fill in the remaining details of the record.
 *
 * The input to the function assumes that the structure has already been
 * created.  
 *
 * There is no output.
 */
void soc_get_socket_id(socket_t *new)
{
    char line[MAXLINE];
    assert(new != NULL);

    printf("Socket ID:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->socket_id);

    soc_fill_record(new);
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
void soc_fill_record(socket_t *new)
{
    char line[MAXLINE];
    assert(new != NULL);

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
    printf("Protocol (TCP|UDP|SSL|RTP):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->protocol);
    printf("Address family (IPv4|IPv6):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->address_family);
    printf("State (EST|CLOSE_WAIT|CLOSED):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->state);
    printf("Data rate:");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%f", &new->data_rate);
    printf("Time received (int):");
    fgets(line, MAXLINE, stdin);
    sscanf(line, "%d", &new->time_received);
    printf("\n");
}

/* print the information for a particular Socket record 
 *
 * Input is a pointer to a record, and no entries are changed.
 *
 */
void soc_print_socket_rec(socket_t *socket)
{
    assert(socket != NULL);
    printf("Socket id: %d", socket->socket_id);
    printf(" Dest: %d, Src: %d, Dport: %d,", socket->dest_ip_addr, 
            socket->src_ip_addr, socket->dest_port_num);
    printf(" Src: %d,", socket->src_port_num); 
    printf(" Prot: %d, Fam: %d, St: %d", socket->protocol, 
            socket->address_family, socket->state);
    printf(" Rt: %g", socket->data_rate);
    printf(" Tm: %d\n", socket->time_received);
}

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
