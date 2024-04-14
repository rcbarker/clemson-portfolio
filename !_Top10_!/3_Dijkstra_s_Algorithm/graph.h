/* graph.h 
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP6 - Adjacency List
 *
 * Purpose: File containing data types and function definitions for graph.c.
 *
 * Assumptions: The provided data types are acceptable.
 *
 * Bugs: No bugs currently known.
 */

/* header files used in MP6 */
#include <limits.h>

/* constants for MP6 */
#define INF INT_MAX
#define TRUE 1
#define FALSE 0

/* data types used in MP6 */
#define graph_t adj_list_t

typedef struct neighbor_node_tag {
   int vertice;
   int weight;
   struct neighbor_node_tag *next;
} neighbor_node_t;

typedef struct adj_list_node_tag {
   int num_neighbors;
   neighbor_node_t *list_head;
} adj_list_node_t;

typedef struct adj_list_tag {
   int num_vertices;
   adj_list_node_t *array;
} adj_list_t;

typedef struct dist_table_tag {
   int vertice;
   int weight;
   int predecessor;
} dist_table_t;

/* prototype definitions for functions in graph.c */
adj_list_t *graph_construct(int num_vertices);
void graph_destruct(adj_list_t *G);
void graph_add_edge(adj_list_t *G, int src, int dst, int weight, int safe_mode);
dist_table_t *graph_shortest_path(adj_list_t *G, int path_src, int heap);
void graph_print_shortest_path(dist_table_t *path_table, int num_vertices, int path_src, 
                         int path_dest, int graph_op);
void graph_stats(adj_list_t *G);
void graph_debug_print(adj_list_t *G, char Print_Type);
void graph_shortest_path_debug_print(dist_table_t *dist_table, int num_vertices);

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
