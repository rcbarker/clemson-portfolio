/* bst.h 
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP5
 *
 * Purpose: File containing data types and function definitions for bst.h.
 *
 * Assumptions: The provided data types are acceptable.
 *
 * Bugs: No bugs currently known.
 */

enum balanceoptions {BST, AVL, TWOTHREET};

typedef void *data_t;
typedef int bst_key_t;

typedef struct bst_node_tag {
    data_t data_ptr;
    bst_key_t key;
    struct bst_node_tag *left; 
    struct bst_node_tag *right;
} bst_node_t;

typedef struct bst_tag {
    bst_node_t *root;
    int tree_policy; // must be an balanceoptions
    int tree_size;
    int num_recent_key_comparisons;
} bst_t;

/* prototype definitions for functions in tree.c */
data_t bst_access(bst_t *, bst_key_t);
bst_t *bst_construct(int);
void bst_destruct(bst_t *);
int bst_insert(bst_t *, bst_key_t, data_t);
data_t bst_remove(bst_t *, bst_key_t);
int bst_size(bst_t *);
int bst_stats(bst_t *);
int bst_int_path_len(bst_t *);
void bst_debug_print_tree(bst_t *T);
void bst_debug_validate(bst_t *);

/* commands specified to vim. ts: tabstop, sts: soft tabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
