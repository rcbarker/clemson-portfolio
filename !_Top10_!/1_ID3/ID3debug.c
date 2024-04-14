/* Ryan Barker
   ECE 4420 - Knowledge Engineering
   Fall 2015, Section 1
   ID3debug.c

   Purpose: Debugging script used in the development of ID3.c.
 */

#include <stdlib.h>
#include <stdio.h>

#include "ID3.h"
#include <assert.h>

int main(void)
{    
    int i, j;

    /* TEST 1: ID3_create_node */
    ID3_metadata_t *meta1 = malloc(sizeof(ID3_metadata_t));
    meta1->inputs = 4;
    meta1->input_values = 2;
    meta1->output_values = 2;
    meta1->rows = 4;
    ID3_set_globals(meta1);

    int **data1 = malloc(meta1->rows*sizeof(int *));

    printf("\nTEST1:\ndata address = %p, data1 =\n", &data1);
    for(i = 0; i < meta1->rows; ++i) {
        data1[i] = malloc((meta1->inputs + 1)*sizeof(int));
        for(j = 0; j < meta1->inputs + 1; ++j) {
            data1[i][j] = rand() % 2;
            printf("%d ", data1[i][j]);
        }
	printf("\n");
    }
   
    ID3_data_t *d1 = malloc(sizeof(ID3_data_t));
    d1->rows = meta1->rows;
    d1->table = data1; 
    ID3_node_t *node1 = ID3_create_node(d1);
    ID3_node_t *node2 = ID3_create_node(d1);

    printf("\nTEST1 -> node1:\naddr = %p\nname = %d\ntype = %c\n", node1, 
           node1->name, node1->type);
    for(i = 0; i < meta1->input_values; ++i) printf("child[%d] = %p\n", i, node1->children[i]);
    printf("data->rows = %d\n", node1->data->rows);
    printf("data->table[0][0] = %d\n", node1->data->table[0][0]);
    printf("\nTEST1 -> node2:\naddr = %p\nname = %d\ntype = %c\n", node2, 
           node2->name, node2->type);
    for(i = 0; i < meta1->input_values; ++i) printf("child[%d] = %p\n", i, node2->children[i]);
    printf("data->rows = %d\n", node2->data->rows);
    printf("data->table[0][0] = %d\n", node2->data->table[0][0]);

    /* TEST2: ID3_modify_node_name and ID3_link_nodes */
    ID3_modify_node_name(node1, 1);
    ID3_modify_node_name(node2, 2);
    node1->type = 'I';
    node2->type = 'O';
    ID3_link_nodes(node1, node2, 1);

    printf("\nTEST2 -> node1:\naddr = %p\nname = %d\ntype = %c\n", node1, 
           node1->name, node1->type);
    for(i = 0; i < meta1->input_values; ++i) printf("child[%d] = %p\n", i, node1->children[i]);
    printf("data->rows = %d\n", node1->data->rows);
    printf("data->table[0][0] = %d\n", node1->data->table[0][0]);
    printf("\nTEST2 -> node2:\naddr = %p\nname = %d\ntype = %c\n", node2, 
           node2->name, node2->type);
    for(i = 0; i < meta1->input_values; ++i) printf("child[%d] = %p\n", i, node2->children[i]);
    printf("data->rows = %d\n", node2->data->rows);
    printf("data->table[0][0] = %d\n", node2->data->table[0][0]);

    /* TEST3: ID3_negative_ones */
    int neg1 = ID3_negative_ones(d1);
    int check = ID3_check_outputs(d1);
    assert(neg1 == FALSE);
    assert(check == FALSE);
    printf("\nTEST3: ID3_negative_ones(data1) = %d\n", neg1);
    printf("TEST3: ID3_check_outputs(data1) = %d\n", check);

    ID3_metadata_t *meta2 = malloc(sizeof(ID3_metadata_t));
    meta2->inputs = 5;
    meta2->input_values = 2;
    meta2->output_values = 2;
    meta2->rows = 6;
    ID3_set_globals(meta2);
    int **data2 = malloc(meta2->rows*sizeof(int *));
    printf("\nTEST3:\ndata address = %p, data2 =\n", &data2);
    for(i = 0; i < meta2->rows; ++i) {
        data2[i] = malloc((meta2->inputs + 1)*sizeof(int));
        for(j = 0; j < meta2->inputs + 1; ++j) {
            data2[i][j] = -1;
            printf("%d ", data2[i][j]);
        }
	printf("\n");
    }
   
    ID3_data_t *d2 = malloc(sizeof(ID3_data_t));
    d2->rows = meta2->rows;
    d2->table = data2; 

    neg1 = ID3_negative_ones(d2);
    check = ID3_check_outputs(d2);
    assert(neg1 == TRUE);
    assert(check == TRUE);
    printf("\nTEST3: ID3_negative_ones(data1) = %d\n", neg1);
    printf("TEST3: ID3_check_outputs(data1) = %d\n", check);

    /* TEST4: ID3_most_common_output */
    ID3_set_globals(meta1);
    int most1 = ID3_most_common_output(d1);
    ID3_set_globals(meta2);
    int most2 = ID3_most_common_output(d2);
    assert(most2 == -1);
    printf("\nTEST4: ID3_most_common_output(data1) = %d\n", most1);
    printf("TEST4: ID3_most_common_output(data2) = %d\n", most2);

    /* TEST5: ID3_entropy, ID3_probability, and ID3_average_entropies */
    ID3_metadata_t *meta3 = malloc(sizeof(ID3_metadata_t));
    meta3->inputs = 2;
    meta3->input_values = 2;
    meta3->output_values = 2;
    meta3->rows = 3;

    ID3_data_t *d3 = malloc(sizeof(ID3_data_t));
    d3->rows = meta3->rows;
    ID3_set_globals(meta3);

    int **data3 = malloc(meta3->rows*sizeof(int *));
    for(i = 0; i < meta3->rows; ++i) data3[i] = malloc((meta3->inputs + 1)*sizeof(int));   

    printf("\nTEST5:\ndata address = %p, data3 =\n", &data3);
    for(i = 0; i < meta3->rows; ++i) {
        for(j = 0; j < meta3->inputs + 1; ++j) {
            data3[i][j] = rand() % 2;
            printf("%d ", data3[i][j]);
        }
	printf("\n");
    }
    d3->table = data3;

    float res1 = ID3_probability(d3, 0);
    float res2 = ID3_probability(d3, 1);
    printf("\nTEST6: ID3_probability(data3) == 0: %1.2f\n", res1);
    printf("TEST6: ID3_probability(data3) == 1: %1.2f\n", res2);

    float ent1 = ID3_entropy(res1);
    float ent2 = ID3_entropy(res2);
    printf("\nTEST6: ID3_entropy(res1) = %1.2f\n", ent1);
    printf("TEST6: ID3_entropy(res2) = %1.2f\n", ent2);

    ID3_set_globals(meta1);
    float *ent_ptr1 = ID3_average_entropies(d1);
    ID3_set_globals(meta2);
    float *ent_ptr2 = ID3_average_entropies(d2);
    ID3_set_globals(meta3);
    float *ent_ptr3 = ID3_average_entropies(d3);
    printf("\nTEST6: ID3_average_entropies(data1) = \n");
    for(i = 0; i < meta1->inputs; ++i) printf("%1.2f ", ent_ptr1[i]);
    printf("\n\n");
    printf("TEST6: ID3_average_entropies(data2) = \n");
    for(i = 0; i < meta2->inputs; ++i) printf("%1.2f ", ent_ptr2[i]);
    printf("\n\n");
    printf("TEST6: ID3_average_entropies(data3) = \n");
    for(i = 0; i < meta3->inputs; ++i) printf("%1.2f ", ent_ptr3[i]);
    printf("\n");
   
    /* TEST 7: ID3_find_input */
    ID3_set_globals(meta1);
    int index1 = ID3_find_input(ent_ptr1);
    ID3_set_globals(meta2);
    int index2 = ID3_find_input(ent_ptr2);
    ID3_set_globals(meta3);
    int index3 = ID3_find_input(ent_ptr3);

    printf("\nTEST7: ID3_find_input(entropies1) = %d\n", index1);
    printf("TEST7: ID3_find_input(entropies2) = %d\n", index2);
    printf("TEST7: ID3_find_input(entropies3) = %d\n", index3);

    /* TEST 8: ID3_partition_table */
    ID3_metadata_t *meta4 = malloc(sizeof(ID3_metadata_t));
    meta4->inputs = 10;
    meta4->input_values = 2;
    meta4->output_values = 2;
    meta4->rows = 9;

    int **data4 = malloc(meta4->rows*sizeof(int *));
    printf("\nTEST8:\ndata address = %p, data4 =\n", &data4);
    for(i = 0; i < meta4->rows; ++i) {
        data4[i] = malloc((meta4->inputs + 1)*sizeof(int));
        for(j = 0; j < meta4->inputs + 1; ++j) {
            if(j != 0) data4[i][j] = rand() % 2;
            else if(i % 2) data4[i][j] = 0;
            else data4[i][j] = 1;
            printf("%d ", data4[i][j]);
        }
	printf("\n");
    }
   
    ID3_data_t *d4 = malloc(sizeof(ID3_data_t));
    d4->rows = meta4->rows;
    d4->table = data4; 

    ID3_set_globals(meta4);
    ID3_data_t *p1 = ID3_partition_table(d4, 0, 1);
    ID3_data_t *p2 = ID3_partition_table(d4, 3, 0);    
    ID3_data_t *p3 = ID3_partition_table(p2, 2, 1);

    printf("\nTEST8: data1, input 0 == 1:\n"); 
    for(i = 0; i < p1->rows; ++i) {
        for(j = 0; j < meta4->inputs + 1; ++j)
            printf("%d ", p1->table[i][j]);
        printf("\n");
    }

    printf("\nTEST8: data1, input 3 == 0:\n"); 
    for(i = 0; i < p2->rows; ++i) {
        for(j = 0; j < meta4->inputs + 1; ++j)
            printf("%d ", p2->table[i][j]);
        printf("\n");
    }

    printf("\nTEST8: partition2, input 2 == 1:\n"); 
    for(i = 0; i < p3->rows; ++i) {
        for(j = 0; j < meta4->inputs + 1; ++j)
            printf("%d ", p3->table[i][j]);
        printf("\n");
    }

    /* Test 9: ID3_compute and ID3_print_tree */
    ID3_metadata_t *meta5 = malloc(sizeof(ID3_metadata_t));
    meta5->inputs = 3;
    meta5->input_values = 2;
    meta5->output_values = 2;
    meta5->rows = 8;
    meta5->input_names = malloc(meta5->inputs*sizeof(char *));
    for(i = 0; i < meta5->inputs; ++i) {
        meta5->input_names[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta5->input_names[i], "x%d", i);
    }
    meta5->inputs_key = malloc(meta5->input_values*sizeof(char *));
    for(i = 0; i < meta5->input_values; ++i) {
        meta5->inputs_key[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta5->inputs_key[i], "%d", i);
    }
    meta5->output_name = malloc(BUFF_SIZE*sizeof(char));
    sprintf(meta5->output_name, "out");
    meta5->output_key = malloc(meta5->output_values*sizeof(char *));
    for(i = 0; i < meta5->output_values; ++i) {
        meta5->output_key[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta5->output_key[i], "%d", i);
    }

    int **data5 = malloc(meta5->rows*sizeof(int *));
    printf("\nTEST9:\ndata address = %p, data5 =\n", &data5);
    for(i = 0; i < meta5->rows; ++i) 
        data5[i] = malloc((meta5->inputs + 1)*sizeof(int));
    
    /* 3 input OR */
    data5[0][0] = 0;
    data5[0][1] = 0;
    data5[0][2] = 0;
    data5[0][3] = 0;

    data5[1][0] = 0;
    data5[1][1] = 0;
    data5[1][2] = 1;
    data5[1][3] = 1;

    data5[2][0] = 0;
    data5[2][1] = 1;
    data5[2][2] = 0;
    data5[2][3] = 1;

    data5[3][0] = 0;
    data5[3][1] = 1;
    data5[3][2] = 1;
    data5[3][3] = 1;

    data5[4][0] = 1;
    data5[4][1] = 0;
    data5[4][2] = 0;
    data5[4][3] = 1;

    data5[5][0] = 1;
    data5[5][1] = 0;
    data5[5][2] = 1;
    data5[5][3] = 1;

    data5[6][0] = 1;
    data5[6][1] = 1;
    data5[6][2] = 0;
    data5[6][3] = 1;

    data5[7][0] = 1;
    data5[7][1] = 1;
    data5[7][2] = 1;
    data5[7][3] = 1;

    for(i = 0; i < meta5->rows; ++i) {
        for(j = 0; j < meta5->inputs + 1; ++j)
            printf("%d ", data5[i][j]);
        printf("\n");
    }

    ID3_data_t *d5 = malloc(sizeof(ID3_data_t));
    d5->rows = meta5->rows;
    d5->table = data5; 

    ID3_set_globals(meta5);
    ID3_node_t *node3 = ID3_create_node(d5);
    ID3_compute(node3, d5);
    printf("\nTEST9: data5 ID3_compute success! Printing tree...\n");
    ID3_print_tree(node3, 0);
    ID3_tree_destruct(node3);
   

    ID3_metadata_t *meta6 = malloc(sizeof(ID3_metadata_t));
    meta6->inputs = 3;
    meta6->input_values = 2;
    meta6->output_values = 2;
    meta6->rows = 8;
    meta6->input_names = malloc(meta6->inputs*sizeof(char *));
    for(i = 0; i < meta6->inputs; ++i) {
        meta6->input_names[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta6->input_names[i], "x%d", i);
    }
    meta6->inputs_key = malloc(meta6->input_values*sizeof(char *));
    for(i = 0; i < meta6->input_values; ++i) {
        meta6->inputs_key[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta6->inputs_key[i], "%d", i);
    }
    meta6->output_name = malloc(BUFF_SIZE*sizeof(char));
    sprintf(meta6->output_name, "out");
    meta6->output_key = malloc(meta6->output_values*sizeof(char *));
    for(i = 0; i < meta6->output_values; ++i) {
        meta6->output_key[i] = malloc(BUFF_SIZE*sizeof(char));
        sprintf(meta6->output_key[i], "%d", i);
    }

    int **data6 = malloc(meta6->rows*sizeof(int *));
    printf("\nTEST9:\ndata address = %p, data6 =\n", &data6);
    for(i = 0; i < meta6->rows; ++i) 
        data6[i] = malloc((meta6->inputs + 1)*sizeof(int));
    
    /* 3 input AND */
    data6[0][0] = 0;
    data6[0][1] = 0;
    data6[0][2] = 0;
    data6[0][3] = 0;

    data6[1][0] = 0;
    data6[1][1] = 0;
    data6[1][2] = 1;
    data6[1][3] = 0;

    data6[2][0] = 0;
    data6[2][1] = 1;
    data6[2][2] = 0;
    data6[2][3] = 0;

    data6[3][0] = 0;
    data6[3][1] = 1;
    data6[3][2] = 1;
    data6[3][3] = 0;

    data6[4][0] = 1;
    data6[4][1] = 0;
    data6[4][2] = 0;
    data6[4][3] = 0;

    data6[5][0] = 1;
    data6[5][1] = 0;
    data6[5][2] = 1;
    data6[5][3] = 0;

    data6[6][0] = 1;
    data6[6][1] = 1;
    data6[6][2] = 0;
    data6[6][3] = 0;

    data6[7][0] = 1;
    data6[7][1] = 1;
    data6[7][2] = 1;
    data6[7][3] = 1;

    for(i = 0; i < meta6->rows; ++i) {
        for(j = 0; j < meta6->inputs + 1; ++j)
            printf("%d ", data6[i][j]);
        printf("\n");
    }

    ID3_data_t *d6 = malloc(sizeof(ID3_data_t));
    d6->rows = meta6->rows;
    d6->table = data6; 

    ID3_set_globals(meta6);
    ID3_node_t *node4 = ID3_create_node(d6);
    ID3_compute(node4, d6);
    printf("\nTEST9: data6 ID3_compute success! Printing tree...\n");
    ID3_print_tree(node4, 0);
    ID3_tree_destruct(node4);

    /* Test 10: ID3_encode_data */
    ID3_data_t *encode1 = ID3_encode_data("./data/three_input_or.txt");
    printf("\nTEST10: ID3_encode_data success! encoded data =\n");
    printf("rows =\n%d\ntable =\n", encode1->rows);
    for(i = 0; i < encode1->rows; ++i) {
        for(j = 0; j < 4; ++j) printf("%d ", encode1->table[i][j]);
        printf("\n");
    }
    ID3_node_t *root1 = ID3_create_node(encode1);
    ID3_compute(root1, encode1);
    printf("\nTEST10: encode1 ID3_compute success! Printing tree...\n");
    ID3_print_tree(root1, 0);
    ID3_tree_destruct(root1);

    /* Test 11: ID3 and ID3_tree_validate */
    char *file_name = "./data/three_input_or.txt";
    ID3_node_t *root2 = ID3(file_name);
    printf("\nTEST11: %s ID3 success! Printing tree...\n", file_name);
    ID3_print_tree(root2, 0);
    ID3_tree_validate(root2);
    ID3_tree_destruct(root2);

    char *file_name2 = "./data/four_input_and.txt";
    ID3_node_t *root3 = ID3(file_name2);
    printf("\nTEST11: %s ID3 success! Printing tree...\n", file_name2);
    ID3_print_tree(root3, 0);
    ID3_tree_validate(root3);
    ID3_tree_destruct(root3);

    /* Clean Up */
    free(node1->children);
    free(node1);
    free(node2->children);
    free(node2);
 
    for(i = 0; i < meta1->rows; ++i) free(data1[i]);
    free(data1);
    for(i = 0; i < meta2->rows; ++i) free(data2[i]);
    free(data2);
    for(i = 0; i < meta3->rows; ++i) free(data3[i]);
    free(data3);
    for(i = 0; i < meta4->rows; ++i) free(data4[i]);
    free(data4);

    free(d1);
    free(d2);
    free(d3);
    free(d4);

    free(meta1);
    free(meta2);
    free(meta3);
    free(meta4);
    for(i = 0; i < meta5->inputs; ++i) free(meta5->input_names[i]);
    free(meta5->input_names);
    free(meta5->output_name);
    for(i = 0; i < meta5->input_values; ++i) free(meta5->inputs_key[i]);
    free(meta5->inputs_key);
    for(i = 0; i < meta5->output_values; ++i) free(meta5->output_key[i]);
    free(meta5->output_key);
    free(meta5);
    free(meta6);
    free(ent_ptr1);
    free(ent_ptr2);
    free(ent_ptr3);

    for(i = 0; i < p1->rows; ++i) free(p1->table[i]);
    free(p1->table);
    for(i = 0; i < p2->rows; ++i) free(p2->table[i]);
    free(p2->table);
    for(i = 0; i < p3->rows; ++i) free(p3->table[i]);
    free(p3->table);

    free(p1);
    free(p2);
    free(p3);

    return 0;
}
