/* Ryan Barker
   ECE 4420 - Knowledge Engineering
   Fall 2015, Section 1
   ID3test.c

   Purpose: Test script used to show functionality of ID3 library. Almost all of the formatted
            text files were pulled from Chapter 16 of Intelligent Systems: Principles, Paradigms,
            and Pragmatics. See readme.txt for specifics on each file, including the pages they
            were pulled from.
 */

#include <stdlib.h>
#include <stdio.h>

#include "ID3.h"

int main(void)
{
    /* block.txt */
    char file1[] = "./data/block.txt";
    printf("Loading file %s into ID3...\n", file1);
    ID3_print_file_data(file1);
    ID3_node_t *node1 = ID3(file1);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node1, 0);
    ID3_tree_validate(node1);
    ID3_tree_destruct(node1);
    node1 = NULL;
    printf("\n");

    /* chords.txt */
    char file2[] = "./data/chords.txt";
    printf("Loading file %s into ID3...\n", file2);
    ID3_print_file_data(file2);
    ID3_node_t *node2 = ID3(file2);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node2, 0);
    ID3_tree_validate(node2);
    ID3_tree_destruct(node2);
    node2 = NULL;
    printf("\n");

    /* chords_extended2.txt */
    char file3[] = "./data/chords_extended2.txt";
    printf("Loading file %s into ID3...\n", file3);
    ID3_print_file_data(file3);
    ID3_node_t *node3 = ID3(file3);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node3, 0);
    ID3_tree_validate(node3);
    ID3_tree_destruct(node3);
    node3 = NULL;
    printf("\n");

    /* chords_extended3.txt */
    char file4[] = "./data/chords_extended3.txt";
    printf("Loading file %s into ID3...\n", file4);
    ID3_print_file_data(file4);
    ID3_node_t *node4 = ID3(file4);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node4, 0);
    ID3_tree_validate(node4);
    ID3_tree_destruct(node4);
    node4 = NULL;
    printf("\n");

    /* chords_extended4.txt */
    char file5[] = "./data/chords_extended4.txt";
    printf("Loading file %s into ID3...\n", file5);
    ID3_print_file_data(file5);
    ID3_node_t *node5 = ID3(file5);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node5, 0);
    ID3_tree_validate(node5);
    ID3_tree_destruct(node5);
    node5 = NULL;
    printf("\n");

    /* four_class_three_attribute.txt */
    char file6[] = "./data/four_class_three_attribute.txt";
    printf("Loading file %s into ID3...\n", file6);
    ID3_print_file_data(file6);
    ID3_node_t *node6 = ID3(file6);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node6, 0);
    ID3_tree_validate(node6);
    ID3_tree_destruct(node6);
    node6 = NULL;
    printf("\n");

    /* four_input_and.txt */
    char file7[] = "./data/four_input_and.txt";
    printf("Loading file %s into ID3...\n", file7);
    ID3_print_file_data(file7);
    ID3_node_t *node7 = ID3(file7);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node7, 0);
    ID3_tree_validate(node7);
    ID3_tree_destruct(node7);
    node7 = NULL;
    printf("\n");

    /* three_input_or.txt */
    char file8[] = "./data/three_input_or.txt";
    printf("Loading file %s into ID3...\n", file8);
    ID3_print_file_data(file8); 
    ID3_node_t *node8 = ID3(file8);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node8, 0);
    ID3_tree_validate(node8);
    ID3_tree_destruct(node8);
    node8 = NULL;
    printf("\n");

    /* tsand_reduced.txt */
    char file9[] = "./data/tsand_reduced.txt";
    printf("Loading file %s into ID3...\n", file9);
    ID3_print_file_data(file9);
    ID3_node_t *node9 = ID3(file9);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node9, 0);
    ID3_tree_validate(node9);
    ID3_tree_destruct(node9);
    node9 = NULL;
    printf("\n");

    /* tsand_reduced.txt */
    char file10[] = "./data/conflicting_data.txt";
    printf("Loading file %s into ID3...\n", file10);
    ID3_print_file_data(file10);
    ID3_node_t *node10 = ID3(file10);
    printf("ID3 returned successfully. Printing tree...\n");
    ID3_print_tree(node10, 0);
    ID3_tree_validate(node10);
    ID3_tree_destruct(node10);
    node10 = NULL;

    return 0;
}
