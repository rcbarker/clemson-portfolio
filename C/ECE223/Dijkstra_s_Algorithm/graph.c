/* graph.c                  
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP6 - Adjacency List
 * 
 * Purpose: Functions for use with graph manipulation.
 *
 * Assumptions: File will be compiled with associated makefile.
 *
 * Bugs: No currently known bugs.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "graph.h"        // defines public functions for graph 
#include "heap.h"         // defines public functions for PQ heap

/* Private functions for this file only. */
void graph_add_edge_safe(adj_list_t *G, int src, int dst, int weight);
dist_table_t *graph_shortest_path_heap(adj_list_t *G, int path_src);
dist_table_t *graph_shortest_path_slow(adj_list_t *G, int path_src);
int graph_get_weight(adj_list_t *G, int src, int dst);
void graph_print_matrix(adj_list_t *G);
void graph_print_list(adj_list_t *G);

/* ----- below are the functions  ----- */

/* Constructs an adjacency list for a graph of size num_vertices. All vertices
   are initially set with zero neighbors.
 */
adj_list_t *graph_construct(int num_vertices) 
{ 
    /* Set up list header block and vertice array. */
    adj_list_t *G = malloc(sizeof(adj_list_t));
    G->num_vertices = num_vertices;
    G->array = (adj_list_node_t *) malloc(num_vertices * sizeof(adj_list_node_t));

    /* Initialize each node to no neighbors with a NULL neighbor list pointer. */
    int i;
    for(i = 0; i < num_vertices; i++) {
        G->array[i].num_neighbors = 0;
        G->array[i].list_head = NULL;
    }

    return G;
}

/* Destroys the adjacency list G for all eternity.
   Works by freeing each neighbor list, then freeing the array of vertices,
   and finally freeing the header block.
 */
void graph_destruct(adj_list_t *G) 
{
    int i;
    neighbor_node_t *neighbor_rover, *temp_ptr;

    /* Free all elements in each node's neighbor list. */
    for(i = 0; i < G->num_vertices; i++) {
        neighbor_rover = G->array[i].list_head;
        while(neighbor_rover != NULL) {
            temp_ptr = neighbor_rover;
            
            /* Only free data if not at the end of the list. */
            if(temp_ptr != NULL) {
                neighbor_rover = neighbor_rover->next;
                free(temp_ptr);
            }
        }
    }

    free(G->array);
    free(G);
}

/* Adds the edge from src to dst with the passed weight to the adjacency
   list with header block G. Used for the construction of graphs to run
   Djisktra's on.

   If safe_mode == 0, this function is optimized for efficiency (O(1) time), 
   but verbose outputs are ugly and the function does not handle node replacements.

   If safe_mode == 1, this function is optimized to handle replacements and keep
   each graph sorted by vertice number at the expense of overall efficiency. 
   This version uses an auxiliary function and runs between O(1) and O(n) time, 
   which adds significant overhead to graph consturuction. However, using this 
   option does increase the efficiency of Djisktra's algorithm.
 */
void graph_add_edge(adj_list_t *G, int src, int dst, int weight, int safe_mode) 
{
    if(!safe_mode) {
        /* Optimize for efficiency. This runs in constant time. */ 

        /* Malloc and initialize new edge. */
        neighbor_node_t *new_node = malloc(sizeof(neighbor_node_t));
        new_node->vertice = dst;
        new_node->weight = weight;
        new_node->next = NULL;
  
        /* Add edge to front of neighbor list. */
        new_node->next = G->array[src].list_head;
        G->array[src].list_head = new_node;
        G->array[src].num_neighbors++;
    } else {
        /* Optimize for robustness - WARNING: This version runs between constant
           and O(n) time. */
        graph_add_edge_safe(G, src, dst, weight);
    }
}

/* Auxiliary function for graph_add_edge. Keeps list sorted in ascending order 
   by neighbor vertice. If edge already exists in the list, the weight is updated to 
   the new value.

   Note this function is NOT optimized for efficiency! Best case efficiency is
   O(1), worst case efficiency is O(n), and average case is somewhere between.

   However, this function is more robust and can handle replaces if for some 
   reason the user decided to update the weight of an edge. It also keeps 
   everything sorted, so verbose prints look better.
 */
void graph_add_edge_safe(adj_list_t *G, int src, int dst, int weight)
{
    /* Malloc and initialize new edge. */
    neighbor_node_t *new_node = malloc(sizeof(neighbor_node_t));
    new_node->vertice = dst;
    new_node->weight = weight;
    new_node->next = NULL;
 
    /* Add edge to neighbor list in ascending order by vertice number. */

    /* If no neighbors, add to front of list. */
    if(G->array[src].num_neighbors == 0) {
        G->array[src].list_head = new_node;
        G->array[src].num_neighbors++;
    } else {
        /* Search for appropriate position in list to place node. Stop searching either
           when position found or equal vertice found. */
        neighbor_node_t *neighbor_rover = G->array[src].list_head;
        neighbor_node_t *prev_neighbor = NULL;
        while(neighbor_rover != NULL && neighbor_rover->vertice < dst) {
            /* Move through neighbor list. */
            prev_neighbor = neighbor_rover;
            neighbor_rover = neighbor_rover->next;
        }

        /* Insert new node to list. */
        if(neighbor_rover != NULL && neighbor_rover->vertice == dst) {
            /* If vertice numbers are equal, vertice already in list. Update weight 
               and free new node. */
            neighbor_rover->weight = weight;
            free(new_node);
        } else {
            /* Since vertices were not equal or neighbor_rover was NULL, inserting into
               list. */
            if(prev_neighbor == NULL) {
                new_node->next = G->array[src].list_head;
                G->array[src].list_head = new_node;
            } else {
                new_node->next = neighbor_rover;
                prev_neighbor->next = new_node;
            }

            G->array[src].num_neighbors++;
        }
    }
}

/* Performs Djikstra's algorithm on the graph with adjacency list G starting at path_src. 

   Depending on the state of heap, this function will run the algorithm one of two
   ways. The first utilizes a heap ADT and runs in O(Elog(V)) time. The second
   is the traditional version of Djisktra's algorithm and runs in O(V^2) time.

   Returns a table with each vertice in the first column, its weight from the 
   source in the second column, and the predecessor to each vertice in the 3rd column.
   A vertice's predecessor is set to -1 if it is the path_src. If there is no path from
   a vertice to the source its predecessor will be the path_src.
 */
dist_table_t *graph_shortest_path(adj_list_t *G, int path_src, int heap)
{
    if(heap) return graph_shortest_path_heap(G, path_src);
    else return graph_shortest_path_slow(G, path_src);
}

/* Version of Djisktra's algorithm that utilizes a heap ADT. The basic idea here is to insert
   neighbor vertices into a heap that re-heapifies based on path cost. Utilizing a heap instead
   of doing this iteratively drastically improves performance.

   Best Case Efficiency: Elog(V)
 */
dist_table_t *graph_shortest_path_heap(adj_list_t *G, int path_src) 
{
    /* Use confirmation array W and a heap-based Priority Queue 
       to acheive optimum efficiency. */
    int v, dist_removed, dist_neighbor;
    int *W = malloc(G->num_vertices * sizeof(int));
    dist_table_t *distance_table = malloc(G->num_vertices * sizeof(dist_table_t));
    PriorityQueue *PQ = PQ_Initialize(G->num_vertices);
    PQItem pq_item, removed_item;
    neighbor_node_t *neighbor_rover = NULL;

    /* Initialize values in Distance Table. Assume distance for each node is 
       initially infinity. */
    for(v = 0; v < G->num_vertices; v++) {
        distance_table[v].vertice = v;
        distance_table[v].predecessor = path_src;
        distance_table[v].weight = INF;
        W[v] = FALSE;
    }

    /* Update first node stats and to Priority Queue. */
    distance_table[path_src].weight = 0;
    distance_table[path_src].predecessor = -1;

    /* To add to Priority Queue, create temporary PQ Struct 
       and initialize proper values. */
    pq_item.node = path_src;
    pq_item.weight = 0;
    PQ_Insert(pq_item, PQ);

    /* Loop until Priority Queue is empty. */
    while(!PQ_Empty(PQ)) {
        /* Remove the lowest cost node from the Priority Queue and confirm it. */
        removed_item = PQ_Remove(PQ);
        W[removed_item.node] = TRUE;

        /* Add any nodes that have better cost off of the removed node to the Prority Queue. */
        neighbor_rover = G->array[removed_item.node].list_head;
        dist_removed = distance_table[removed_item.node].weight;
        while(neighbor_rover != NULL) {
            /* Find distance of neighbour from source node. */
            dist_neighbor = distance_table[neighbor_rover->vertice].weight;
            if(!W[neighbor_rover->vertice] && dist_removed != INF && dist_neighbor >
               dist_removed + neighbor_rover->weight) {
                /* Distance better off removed node, so update distance and predecessor. */
                distance_table[neighbor_rover->vertice].weight = dist_removed 
                   + neighbor_rover->weight;
                distance_table[neighbor_rover->vertice].predecessor = removed_item.node;

                /* Add node to Priority Queue. */
                pq_item.node = neighbor_rover->vertice;
                pq_item.weight = distance_table[neighbor_rover->vertice].weight;
                PQ_Insert(pq_item, PQ);
            }

            /* Continue through neighbour list of removed node. */
            neighbor_rover = neighbor_rover->next;
        }
    }
    
    /* Clean up and return. */
    free(W);
    PQ_Destruct(PQ);
    return distance_table;
}

/* Traditional Version of Dijkstra's Algorithm. This runs the neighbor node comparison
   iteratively, leading to slower overall performance.

   Efficiency: O(V^2)
 */
dist_table_t *graph_shortest_path_slow(adj_list_t *G, int path_src)
{   
     int u, v;
     int *W = malloc(G->num_vertices * sizeof(int));
     dist_table_t *distance_table = malloc(G->num_vertices * sizeof(dist_table_t));

     /* Initialize values in Distance Table. */
     for(u = 0; u < G->num_vertices; u++) {
         distance_table[u].vertice = u;
         distance_table[u].predecessor = path_src;
         distance_table[u].weight = graph_get_weight(G, path_src, u);
         W[u] = FALSE;
     }

     /* Update weight at starting position and confirm it. */
     distance_table[path_src].weight = 0;
     distance_table[path_src].predecessor = -1;
     W[path_src] = TRUE;

     int w, min_distance;
     int weight, size_W = 1;

     while(size_W != G->num_vertices) {
         /* Find the vertex w in V - W at minimum distance from v1 of unconfirmed nodes. */
         min_distance = INF;

         for(v = 0; v < G->num_vertices; v++) {
             if(!W[v] && distance_table[v].weight < min_distance) {
                     /* Update minimum distance. */
                     min_distance = distance_table[v].weight; 

                     /* Save node */
                     w = v;
             }
         }


         /* If min_distance was never changed by the above loop, there is no more 
            reachable paths - table is done. */
         if(min_distance == INF) {
            free(W);
            return distance_table;
         }

         /* Confirm w and update size. */
         W[w] = TRUE;
         size_W++;

         /* Update and relax weight if necessary. */
         for(u = 0; u < G->num_vertices; u++) {
             weight = graph_get_weight(G, w, u);
             if(!W[u] && distance_table[w].weight != INF && weight != INF) {
                if(distance_table[u].weight > distance_table[w].weight + weight) {
                     /* Update weight. */
                     distance_table[u].weight = distance_table[w].weight + weight;

                     /* Save new predecessor. */
                     distance_table[u].predecessor = w;
                }
             }
         } 
     }
    
     free(W);
     return distance_table;
}

/* Returns the weight from source to the destination in graph with
   adjacency list G.
 */
int graph_get_weight(adj_list_t *G, int src, int dst)
{
    if(src == dst) return 0;

    /* Loop through neighbor list until vertice is either found or the
       end of the neighbor list is reached. */
    neighbor_node_t *neighbor_rover =  G->array[src].list_head;
    while(neighbor_rover != NULL && neighbor_rover->vertice != dst) {
        neighbor_rover = neighbor_rover->next;
    }

    return (neighbor_rover == NULL) ? INF : neighbor_rover->weight;
}

/* Prints the shortest path from path_src to path_dest, given its path_table
   as determined by Dijkstra's Algorithm. If the path table pointer is NULL,
   this function does nothing. Otherwise, the function will either print the
   shortest path if it exists or inform the user that there is no shortest path
   otherwise.
*/ 
void graph_print_shortest_path(dist_table_t *path_table, int num_vertices, int path_src, 
                               int path_dest, int graph_op)
{
    if(path_table == NULL) return;

    /* Check if no path exists or the source equals the destination. */
    if(path_table[path_dest].weight == INF)
        printf("There is no path from vertice %d to %d.\n", path_src, path_dest);
    else {
        /* Find and print the shortest path. */
        int size_arr = 0;
        int *path_arr = malloc(num_vertices * sizeof(int));
        int vertice = path_dest;

        /* Fill path_arr with the shortest path in reverse order using
           predecessors. */
        while(vertice != -1) {
            path_arr[size_arr] = vertice;
            size_arr++;
            vertice = path_table[vertice].predecessor;
        }

        /* Print shortest path by going through path_arr backwards. */
        if(graph_op == 1) {
            printf("The shortest path from %d to %d costs %d and is:\n", 
                    path_src, path_dest, path_table[path_dest].weight);
        } else {
            printf("The network diameter is %d and the path is:\n", 
                    path_table[path_dest].weight);
        }
        for(vertice = size_arr - 1; vertice >= 0; vertice--) {
            printf("%d", path_arr[vertice]);
            if(vertice - 1 >= 0) printf(" -- ");
        }

        /* Print new line after path is printed. */
        printf("\n");
	
        /* Free path array. */
        free(path_arr);
    }
}

/* Calculates and prints the min, max, and average neighbor weights of the graph with
   adjacency list G. Used for random graphs in lab6.c. No return value.
 */
void graph_stats(adj_list_t *G)
{
    int vertice;
    int max_neighbors = 0, min_neighbors = INF;
    int total_neighbors = 0;

    /* Calculate parameters relevant to min, max, and average. */
    for(vertice = 0; vertice < G->num_vertices; vertice++) {
       if(G->array[vertice].num_neighbors < min_neighbors) 
           min_neighbors = G->array[vertice].num_neighbors;
       else if(G->array[vertice].num_neighbors > max_neighbors) 
           max_neighbors = G->array[vertice].num_neighbors;

       total_neighbors += G->array[vertice].num_neighbors;
    }

    /* Print stats. */
    printf("Graph Type Random -- Printing Neighbor Stats\n");
    printf("Min Number of Neighbors = %d  Max Number of Neighbors = %d\n", 
            min_neighbors, max_neighbors);
    printf("Average Number of Neighbors = %3.2f\n\n", (float) total_neighbors / G->num_vertices);
}

/* Debug function that prints either the adjacency list or adjencency
   matrix for the graph with adjacency list G depending on the state of
   PrintType.

   PrintType States:
   - 'l' | 'L': Print Adjacency List
   - 'm' | 'M': Print Adjacency Matrix
 */
void graph_debug_print(adj_list_t *G, char Print_Type)
{
    if(Print_Type == 'l' || Print_Type == 'L') graph_print_list(G);
    else graph_print_matrix(G);
}

/* Prints graph with adjacency list G as an adjacency list.
 */
void graph_print_list(adj_list_t *G) 
{
    if(G == NULL) return;

    int vertice;
    neighbor_node_t *neighbor_rover = NULL;

    printf("Graph Built -- Printing Adjacency List\n");
    printf("Vert | Deg     Neighbor | Weight\n");

    for(vertice = 0; vertice < G->num_vertices; vertice++) {
        printf(" %3d | %3d  -> ", vertice, G->array[vertice].num_neighbors);
        neighbor_rover = G->array[vertice].list_head;

        /* If neighbor rover NULL, no neighbors. */
        if(G->array[vertice].num_neighbors == 0) printf("No Neighbors");

        /* Otherwise, print neighbors. */
        while(neighbor_rover != NULL) {
            printf("%3d | %3d  ", neighbor_rover->vertice, neighbor_rover->weight);
          
            neighbor_rover = neighbor_rover->next;

            if(neighbor_rover == NULL) printf("END");
        }
        printf("\n");
    }     
}

/* Prints graph with adjacency matrix G as an adjacency matrix.
 */
void graph_print_matrix(adj_list_t *G) 
{
    int v1, v2;
    int W;
    printf("Graph Built -- Printing Adjacency Matrix\n");

    for(v1 = 0; v1 < G->num_vertices; v1++) {
        for(v2 = 0; v2 < G->num_vertices; v2++) {
            W = graph_get_weight(G, v1, v2); 

            if(W == INF) printf(" INF ");
            else printf("%4d ", W);
        }
        printf("\n");
    }
}

/* Debug function that prints the table output by graph_shortest_path. First
   column is each vertice, second column is that vertice's weight from the source, 
   and the third column is that vertice's predecessor along the shortest path to
   the source.

   Requires the number of vertices in the table to be passed to function correctly.

   The function prints INF if the weight is INT_MAX or OVR if the weight is < 0 
   (Meaning there was a weight overflow error).
 */
void graph_shortest_path_debug_print(dist_table_t *dist_table, int num_vertices) 
{
    if(dist_table == NULL) return;

    int i;

    printf("Vert  Dist  Pred\n");
    for(i = 0; i < num_vertices; i++) {
        printf("%4d   ", dist_table[i].vertice);
        if(dist_table[i].weight == INF) printf("INF   ");
        else if(dist_table[i].weight < 0) printf("OVR   ");
        else printf("%3d   ", dist_table[i].weight);
        printf("%3d\n", dist_table[i].predecessor);
    }
}

/* commands for vim. ts: tabstop, sts: softtabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
