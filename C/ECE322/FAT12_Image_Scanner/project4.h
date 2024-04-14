/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   project4.h
   
   Purpose: Header file containing constants, datatypes, and function prototypes from
              imagescanner.c and recoveredlist.c.
 */

/* Constants used in imagescanner.c. */
#define TABLE_SIZE 3072
#define SECTOR_SIZE 512
#define NAME_LEN 8
#define EXT_LEN 3
#define ATTRIB_LEN 1
#define CLUSTER_LEN 2
#define SIZE_LEN 4
#define FILE_SIZE 32
enum state { NORMAL, DELETED };

/* Datatypes used in imagescanner.c. */
typedef struct file_header_tag {
    char name[NAME_LEN + 1];
    char extension[EXT_LEN + 1];
    uint8_t attributes;
    uint16_t first_cluster;
    uint32_t size;    
} file_header_t;

/* Datatypes used in recoveredlist.c. */
typedef struct recovered_node_tag {
    char name[NAME_LEN + 1];
    char extension[EXT_LEN + 1];
    uint16_t first_cluster;
    uint32_t size;
    enum state state;
    struct recovered_node_tag *next;
    struct recovered_node_tag *prev;
} recovered_node_t;

typedef struct recovered_list_header_tag {
    int num_entries;
    struct recovered_node_tag *head;
    struct recovered_node_tag *tail;
} recovered_list_header_t;

/* Function prototypes for imagescanner.c. */ 
uint8_t *getSector(uint16_t fat_entry);
void copyFAT(void);
file_header_t *getFileHeader(uint8_t *dir_entry);
char *getSubDirName(char *root_name, char *sub_name);
void processFiles(uint8_t *file_start, char *directory);
char *getFilePath(char *output_path, recovered_node_t *file);
void recoverFile(recovered_node_t *list_node, int output_fd);
void writeFiles(char *output_path);

/* Function prototypes for recoveredlist.c. */ 
recovered_list_header_t *recovered_list_construct(void);
void recovered_list_insert(recovered_list_header_t *list_ptr, file_header_t *header, int state);
void *recovered_list_destruct(recovered_list_header_t *list_ptr);
