/* Ryan Barker
   ECE 4420 - Knowledge Engineering
   Fall 2015, Section 1
   ID3.h
   
   Purpose: Header file containing constants, ADTs, and function prototypes for ID3.c.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <string.h>

/* Constants used in ID3.c. */
#define BUFF_SIZE 256
#define TRUE 1
#define FALSE 0

/* ADTs used in ID3.c. */
typedef struct ID3_node_tag {
    int name;                       // Unique identified to match encoded data table.
    char type;                      // Possible values: 'I' = Input, 'O' = Output.
    struct ID3_node_tag **children; // Vector of children pointers input_values long.
    struct ID3_data_tag *data;      // Pointer to data for this step.
} ID3_node_t;

typedef struct ID3_data_tag {
    int rows;    // Rows in data table. Used in manipulation.
    int **table; // Pointer to data table used at this step in algorithm. 
                 // rows by Num_inputs + Num_Output dimensions.
} ID3_data_t;

/* ADTs for ID3debug.c. */
typedef struct ID3_metadata_tag {
    int inputs;         // Number of inputs in data set.
    int input_values;   // Number of possible input values.
    int output_values;  // Number of possible output values in data set.
    int rows;           // Number of rows of data in data set.
    char **input_names; // Array of Input Names.
    char *output_name;  // Output name string.
    char **inputs_key;  // Array of Input Values.
    char **output_key;  // Array of Output Values.
} ID3_metadata_t;

/* Function prototypes for ID3.c. */ 
ID3_node_t *ID3(char *file_name);
void ID3_tree_destruct(ID3_node_t *node);
int ID3_row_validate(ID3_node_t *node, int *row);
int ID3_tree_validate(ID3_node_t *root_node);
void ID3_print_tree(ID3_node_t *root_node, int num_spaces);
void ID3_destruct(void);
void ID3_set_globals(ID3_metadata_t *metadata);
ID3_node_t *ID3_create_node(ID3_data_t *data);
void ID3_modify_node_name(ID3_node_t *node, int new_name);
void ID3_link_nodes(ID3_node_t *parent, ID3_node_t *child, int index);
int ID3_negative_ones(ID3_data_t *data);
int ID3_check_outputs(ID3_data_t *data);
int ID3_most_common_output(ID3_data_t *data);
float ID3_entropy(float p);
float ID3_probability(ID3_data_t *data, int output_val);
float *ID3_average_entropies(ID3_data_t *data);
int ID3_find_input(float *entropies);
ID3_data_t *ID3_partition_table(ID3_data_t *data, int input, int input_val);
void ID3_compute(ID3_node_t *node, ID3_data_t *data);
ID3_data_t *ID3_encode_data(char *file_name);
void ID3_print_file_data(char *file_name);
