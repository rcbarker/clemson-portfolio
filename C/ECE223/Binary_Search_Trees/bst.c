/* bst.c                  
 * Ryan Barker
 * rcbarke
 * ECE 223 Fall 2014
 * MP5
 * 
 * Purpose: File containing functions that manipulate binary search trees (BSTs) passed
 * to them and return certain values depending on operation. All functions here are used
 * by lab5.c. Note the functions in this file do not support AVLs or Two Three Trees.
 *
 * Assumptions: Provided code works correctly and file will be compiled with bst.h.
 *
 * Bugs: No bugs are currently known.
 */

/* The interface definition for the two-way linked list ADT is based on one 
 * defined by OPNET, Inc. http://www.opnet.com/
 */
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "bst.h"        // defines public functions for tree ADT

/* prototypes for private functions used in bst.c only */
data_t bst_access_rec(bst_node_t *N, bst_key_t key, int *compare);
int bst_insert_rec(bst_node_t *N, bst_key_t key, data_t data_ptr, int *compare);
void bst_destruct_rec(bst_node_t *N);
bst_node_t *bst_remove_rec(bst_node_t *N, bst_node_t *P, bst_node_t **R,  
                           bst_key_t key, int *compare);
int bst_count_level_nums(bst_node_t *N, int level);
void ugly_print(bst_node_t *N, int level);
int bst_debug_validate_rec(bst_node_t *N);
int bst_find_min(bst_node_t *R);
int bst_find_max(bst_node_t *R);

/* ----- below are the functions  ----- */

/* Finds the tree element with the matching key and returns a pointer to the 
   data block that is stored in this node in the tree. If the key is not 
   found in the tree then the function returns NULL.

   T: Header block of the tree to be accessed.
   key: Key to search T for.
 */
data_t bst_access(bst_t *T, bst_key_t key) {
    /* Reset comparisons counter */
    T->num_recent_key_comparisons = 0;    

    if(T == NULL) return NULL;
    
    return bst_access_rec(T->root, key, &(T->num_recent_key_comparisons));
}

/* Recursive auxiliary function that searches the tree passed to bst_access.
   Return values line up with bst_access.

   N: Current node in tree (Initially T->root)
   key: Key to search T for.
   compare: Pointer to T->num_recent_key_comparisons, so it may be updated
   for this call of bst_access.
 */
data_t bst_access_rec(bst_node_t *N, bst_key_t key, int *compare) {
    /* Increment comparisons counter */
    (*compare)++;

    /* If N is NULL, either tree was empty or node was not found */
    if(N == NULL) return NULL;

    /* If N non-NULL, compare key to tree */
    if(key < N->key) {
        /* Transverse left */
        (*compare)++;
        return bst_access_rec(N->left, key, compare);
    } else if (key > N->key) {
        /* Transverse right */
        (*compare)++; 
        return bst_access_rec(N->right, key, compare);
    } else
        /* Node found */
        return N->data_ptr;
}

/* Creates a header block for a tree and returns a pointer to it. 
 
   tree_policy: Type of tree being created. This program supports BSTs only.

   Tree header block structure
   T->root: Pointer to the root node of the tree.
   T->tree_policy: Type of tree this block points to (BST, AVL, or TWOTHREET).
   Note that only BSTs are supported by the functions in this program.
   T->num_recent_key_comparisons: The number of comparisons done in the most 
   recent access, insert, or remove.      
 */
bst_t *bst_construct(int tree_policy) {
    bst_t *T = (bst_t *) malloc(sizeof(bst_t));
    T->root = NULL;
    T->tree_policy = tree_policy;
    T->tree_size = 0;
    T->num_recent_key_comparisons = 0;
    return T;
}


/* Frees all items stored in the tree including the memory block with the data
   and the bst_node_t structure. Also frees the header block. 

   T: Header block of tree to be freed.
 */
void bst_destruct(bst_t *T) {
    if(T == NULL) return;

    bst_destruct_rec(T->root);
    free(T);
}

/* Recursive function used by bst_destruct to free each node in the tree in
   post-order.

   N: Current node of tree (Initially T->root)
 */
void bst_destruct_rec(bst_node_t *N) {
    if(N != NULL) {
        /* Visit tree in post-order */
        bst_destruct_rec(N->left);
        bst_destruct_rec(N->right);

        /* Free data at each node and then each node */
        free(N->data_ptr);
        free(N);
    }
}

/* Inserts the memory block pointed to by data_t into the tree with the associated key. 
   The function returns 0 if the key is already in BST (in which case the data memory 
   block is replaced). The function returns 1 if the key was not already in the BST 
   but was instead added to the tree.

   T: Header block of the tree to have a node inserted into.
   key: Key value (priority) of data to be inserted.
   data_ptr: Pointer to data to be inserted.
 */ 
int bst_insert(bst_t *T, bst_key_t key, data_t data_ptr) {
    /* Reset comparisons counter */
    T->num_recent_key_comparisons = 0;

    if(T->root == NULL) {
        /* Inserting into empty tree - Initialize new_node */
        bst_node_t *new_node = (bst_node_t *) malloc(sizeof(bst_node_t));
        new_node->data_ptr = data_ptr;
        new_node->key = key;
        new_node->left = NULL;
        new_node->right = NULL;
       
        /* Insert at tree's root */
        T->tree_size++;
        T->root = new_node;
        return 1;
    } else { 
        /* Inserting into tree with >= 1 entry */
        int insert = bst_insert_rec(T->root, key, data_ptr, 
                              &(T->num_recent_key_comparisons));
        if(insert)
            T->tree_size++;

        return insert;
    }
}

/* Recursively inserts a node into a BST with at least one entry.

   N: Current node (Initially T->root).
   key: Key of data to be inserted.
   data_ptr: Pointer to data to be inserted.
   compare: Pointer to T->num_recent_key_comparisons, so it may be updated for
   this call of bst_insert.
 */
int bst_insert_rec(bst_node_t *N, bst_key_t key, data_t data_ptr, int *compare) {
    /* Increment comparisons */
    (*compare)++;

    if(key < N->key) { 
        if (N->left == NULL) {
            /* Position for new key found - Initialize new_node */
            bst_node_t *new_node = (bst_node_t *) malloc(sizeof(bst_node_t));
            new_node->data_ptr = data_ptr;
            new_node->key = key;
            new_node->left = NULL;
            new_node->right = NULL;
       
            /* Insert at N's left pointer */
            N->left = new_node;
            return 1;
        } else {
            (*compare)++;
            return bst_insert_rec(N->left, key, data_ptr, compare);
        }       
    } else if(key > N->key) {
        if(N->right == NULL) {
            /* Position new key found - Initialize new_node */
            bst_node_t *new_node = (bst_node_t *) malloc(sizeof(bst_node_t));
            new_node->data_ptr = data_ptr;
            new_node->key = key;
            new_node->left = NULL;
            new_node->right = NULL;
        
            /* Insert at N's right pointer */
            N->right = new_node;
            return 1;
        } else {
            (*compare)++; 
            return bst_insert_rec(N->right, key, data_ptr, compare);
        }
    } else {
        /* Key found in tree, update information and free old information */
        data_t old_data = N->data_ptr;
        N->data_ptr = data_ptr;
        free(old_data);
        return 0;
    }
}

/* Removes the item in the tree with the matching key. Returns the pointer 
   to the data memory block and frees the bst_node_t memory block. If the 
   key is not found in the tree, returns NULL. 

   T: Header block of tree to have a block removed from.
   key: Key to remove from T.
 */
data_t bst_remove(bst_t *T, bst_key_t key) {
    if(bst_access(T, key) == NULL) {
        /* Node not in tree, do nothing */
        return NULL;
    } else {
        /* Removing from tree with multiple entries */

        /* Reset comparisons counter */
        T->num_recent_key_comparisons = 0;

        /* Set replacement pointer to NULL and remove node */
        bst_node_t *replacement = NULL;
        bst_node_t *node_removed = bst_remove_rec(T->root, NULL, &replacement, key,
                                                      &(T->num_recent_key_comparisons));

        /* Check if node removed was root. If so, update T->root */
        if(node_removed == T->root)
            T->root = replacement;

        /* Free node data is contained in */
        data_t data_removed = node_removed->data_ptr;
        free(node_removed);
        node_removed = NULL;

        /* Update size to reflect removed entry */
        T->tree_size--;

        return data_removed;
    }
}

/* Recursive function that goes through the tree and removes the node with the matching
   key. It utilizes a previous pointer (P) to do so.

   N: Current node in tree (Initially N)
   P: Previous pointer to N (Initially NULL).
   R: After function call, stores the pointer to the node replacing N.
   key: key of node to remove.
   compare: Pointer to T->num_recent_key_comparisons, so it may be updated for
   this call of bst_insert.
 */
bst_node_t *bst_remove_rec(bst_node_t *N, bst_node_t *P, bst_node_t **R, 
                           bst_key_t key, int *compare) {
    /* Increment comparisons */    
    (*compare)++;

    if(key < N->key) {
        /* Transverse left */
        (*compare)++;
        return bst_remove_rec(N->left, N, R, key, compare);
    } else if (key > N->key) {
        /* Transverse right */
        (*compare)++;
        return bst_remove_rec(N->right, N, R, key, compare);
    } else {
        /* Node found */

        if(N->left != NULL && N->right != NULL) { 
            /* Node being removed has two children */  
          
            /* Find node's successor and its parent */
            bst_node_t *parent = N;
            bst_node_t *successor = N->right;

            while(successor->left != NULL) {
                parent = successor;
                successor = successor->left;
            }

            /* Swap key and data in N and N's successor */
            bst_key_t temp_key = N->key;
            data_t temp_data = N->data_ptr;

            N->key = successor->key;
            N->data_ptr = successor->data_ptr;
          
            successor->key = temp_key;
            successor->data_ptr = temp_data;          

            /* Change N to point to the successor since it is supposed to be 
               the node being deleted */
            N = successor;

            /* Break successor from list */
            if(parent->left == N) 
                parent->left = N->right;
            else
                parent->right = N->right;

            /* R not needed in this case, since no nodes were moved - Data pointers
               and keys were swapped instead */
        } else if(N->left != NULL) {
            /* Node being removed has a left subtree */
            if(P != NULL) {
                if(P->left == N)
                    P->left = N->left;
                else
                    P->right = N->left;
            }

            /* Replacement node is N->left */
            *R = N->left;
        } else if(N->right != NULL) {
            /* Node being removed has a right subtree*/
            if(P != NULL) {
                if(P->left == N)
                    P->left = N->right;
                else
                    P->right = N->right;
            }

            /* Replacement node is N->right*/
            *R = N->right;
        } else {
            /* Node being removed has no children */
            if(P != NULL) {
                if(P->left == N)
                    P->left = NULL;
                else
                    P->right = NULL;
            }
            
            /* No node replacing deleted node */
            *R = NULL;
        }

        return N;
    }
}

/* Returns the number of keys in the BST. 

   T: Header block of tree.
*/
int bst_size(bst_t *T) {
    return T->tree_size;
}

/* Returns num_recent_key_comparisons, the number of key comparisons for the most recent call 
   to bst_access, bst_insert, or bst_remove.

   T: Header block of tree. 
 */
int bst_stats(bst_t *T) {
    return T->num_recent_key_comparisons;
} 

/* Returns the internal path length of the tree.

   T: Header block of tree. 
 */
int bst_int_path_len(bst_t *T) {
    return bst_count_level_nums(T->root, 0);
}

/* Recursive function that sums the level numbers of each node of the input tree to find the IPL.

   N: Current node (Initially T->root).
   level: Level number of N.
 */
int bst_count_level_nums(bst_node_t *N, int level) {
    if(N == NULL) return 0;  // Base Case

    /* Add level numbers */
    return level + bst_count_level_nums(N->left, level + 1) + 
                   bst_count_level_nums(N->right, level + 1); 
}

/* Debug function that prints the input tree.
 
   T: Header block of tree to be printed.
 */
void bst_debug_print_tree(bst_t *T) {
    ugly_print(T->root, 0);
}

/* Recursively prints each node of the input tree.

   N: Current node in tree (Initially T->root).
   level: Level number of N.
 */
void ugly_print(bst_node_t *N, int level) {
    if (N == NULL) return;
    int i;
    ugly_print(N->right, level+1) ;
    for (i=0; i<level; i++) printf("     "); /* 5 spaces */
    printf("%5d\n", N->key);                 /* field width is 5 */
    ugly_print(N->left, level+1);}



/* Debugging function that verifies the tree is a valid BST.

   T: Header block of tree to be debugged.
 */
void bst_debug_validate(bst_t *T)
{
    int size;
    size = bst_debug_validate_rec(T->root);
    assert(size == T->tree_size);
}

/* Recursive Debugging function that verifies the tree is a valid BST.

   N: Current node of tree being debugged (Initially T->root).
 */
int bst_debug_validate_rec(bst_node_t *N)
{
    if (N == NULL) return 0;
    if (N->left != NULL)
        /* assert that maximum key in left subtree is less than N's key */
        assert(bst_find_max(N->left) < N->key);
    if (N->right != NULL)
        /* assert that minimum key in right subtree is greater than N's key */
        assert(bst_find_min(N->right) > N->key); 
    assert(N->data_ptr != NULL);
    return 1 + bst_debug_validate_rec(N->left) +
        bst_debug_validate_rec(N->right);
}

/* Finds minimum key in tree with root R given R != NULL */
int bst_find_min(bst_node_t *R) {
    int min_key = R->key;

    /* Check left subtree for min if it exists */
    if(R->left != NULL) {
        int left_key = bst_find_min(R->left);
        if(left_key < min_key) 
            min_key = left_key;
    }
 
    /* Check right subtree for min if it exists */
    if(R->right != NULL) {
        int right_key = bst_find_min(R->right);
        if(right_key < min_key)
            min_key = right_key;
    }

    return min_key;
}

/* Finds maximum key in tree with root R given R != NULL */
int bst_find_max(bst_node_t *R) {
    int max_key = R->key;

    /* Check left subtree for max if it exists */
    if(R->left != NULL) {
        int left_key = bst_find_max(R->left);
        if(left_key > max_key) 
            max_key = left_key;
    }

    /* Check right subtree for max if it exists */
    if(R->right != NULL) {
        int right_key = bst_find_max(R->right);
        if(right_key > max_key)
            max_key = right_key;
    }

    return max_key;
}

/* commands for vim. ts: tabstop, sts: softtabstop sw: shiftwidth */
/* vi:set ts=8 sts=4 sw=4 et: */
