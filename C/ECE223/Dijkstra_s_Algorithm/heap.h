/* heap.h
 * ECE 223 Fall 2014
 * Harlan Russell
 *
 * Based on implementation from Standish's textbook.
 *
 *   The Priority Queue Types Header File "PQTypes.h"
 */

/* data types used in heap.c */
typedef  struct {
    int node;
    int weight;
} PQItem;

typedef  struct {
    int      Size;
    int      Count;
    int      MaxCount;
    int      NumVertices;      // only used in heap2.c
    PQItem   *ItemArray;
    int      *ItemLocation;    // only used in heap2.c
} PriorityQueue;

/* prototype definitions for functions in heap.c */
extern PriorityQueue *PQ_Initialize(int);         /* sets PQ to be empty */
void PQ_Destruct(PriorityQueue *PQ);
extern int PQ_Empty(PriorityQueue *PQ);               /* true if PQ is empty */
extern int PQ_Full(PriorityQueue *PQ);                 /* true if PQ is full */
extern void PQ_Insert(PQItem Item, PriorityQueue *PQ);  /* puts Item into PQ */
extern PQItem PQ_Remove(PriorityQueue *PQ);          /* removes Item from PQ */
