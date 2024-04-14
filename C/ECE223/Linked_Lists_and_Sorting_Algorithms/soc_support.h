/* soc_support.h
 * Ryan Barker 
 * rcbarke
 * ECE 223 Fall 2014 
 * MP3
 *
 * Propose: Header file that defines all functions used in soc_support.c so they may be used 
 * across soc_support.c and lab3.c.
 *
 * Assumptions: All header for the provided functions are defined correct. Prototypes in this
 * file are for functions contained in soc_support.c.
 *
 * Bugs: No known bugs.
 */

/* prototype function definitions */

/* Compare Function Prototype */
int soc_compare(socket_t *soc_a, socket_t *soc_b);

/* Create/Destroy and Stats Function Prototypes */
list_t *soc_create();
void soc_cleanup(list_t *);
int soc_number_entries(list_t *);

/* Sorted List Function Prototypes */
void soc_sorted_insert(list_t *, socket_t *);
socket_t *soc_sorted_lookup(list_t *, int);
socket_t *soc_sorted_remove(list_t *, int);
socket_t *soc_sorted_update(list_t *, socket_t *);

/* Unsorted List Function Prototypes */
int soc_insert(list_t *, socket_t *, int);
socket_t *soc_lookup(list_t *, int); 
socket_t *soc_remove(list_t *, int);
socket_t *soc_update(list_t *, socket_t *, int);

/* I/O Function Prototypes */
void soc_get_socket_id(socket_t *);
void soc_fill_record(socket_t *);
void soc_print_socket_rec(socket_t *);

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
