/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   imagescanner.c

   Purpose: This file contains source code to scan FAT12 disk images and recover files from them.
              It starts by mapping in the disk image with path specified by the first argument 
              of the command line, and then converting that image's FAT table to an indexable 
              array of twelve bit FAT entries. The program then moves into the root directory of 
              of the disk image, and recursively searches for files and subdirectories using the
              indexable FAT table. It prints each file found, including deleted files, which are
              appended with a '_' as their first character. Lastly, the program fully recovers
              any files that are not deleted on the disk, does its best to recover any deleted
              file from the disk, and writes all of the files to the directory specified by the
              second command line argument.

            Deleted files are recovered by starting at the sector corresponding to their first
              logical cluster and recovering subsequent sectors until a sector's logical cluster
              in the indexable FAT table is not 0x000. If a new file has been placed over a 
              deleted file, it will be recovered, but its contents will be empty.

            Files are recovered in the order they are reported to std_out.
 */

#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

/* User-defined Header File. */
#include "project4.h"

/* Add #define DEBUG to enable debugging outputs. Output is very verbose (a portion prints the
   entire indexable FAT table), so I recommend piping it to a text file. */


/* Global Variable Definitions. */
uint8_t *image = NULL;
uint16_t FAT_Table[TABLE_SIZE];
recovered_list_header_t *recovered_files_list = NULL;

int main(int argc, char *argv[]) 
{
    /* Check for proper usage. */
    if(argc != 3) {
        fprintf(stderr, "usage: specify input image and directory to store recovered files.\n");
        exit(-1);
    }
 
    /* Map specified file into memory. */
    int fd = open(argv[1], O_RDWR, S_IRUSR | S_IWUSR);
    if(fd == -1) {
        fprintf(stderr, "error: couldn't get file descriptor.\n");
        exit(-1);
    }
    struct stat sb;
    if (fstat(fd,&sb) == -1) { 
        fprintf(stderr, "error: couldn't get file size.\n");
        exit(-1);
    }
    image = mmap(NULL, sb.st_size, 
                 PROT_READ | PROT_WRITE, 
                 MAP_SHARED, fd, 0);

    #ifdef DEBUG
       printf("DEBUG: About to copy image FAT table into indexable memory...\n");
    #endif

    /* Copy FAT Table. */
    copyFAT();

    /* Initialize recovered files list to empty. */
    recovered_files_list = recovered_list_construct();

    #ifdef DEBUG
       printf("\nDEBUG: About to search image root directory for files and subdirectories...\n");
    #endif

    /* Get data from image and print file names in image. */
    processFiles(image + 19*SECTOR_SIZE, "");

    #ifdef DEBUG
       printf("\nDEBUG: About to write out recovered files...\n");
    #endif

    /* Write files to directory from command line. */
    writeFiles(argv[2]);

    /* Clean up. */
    munmap(image, sb.st_size);
    close(fd);
    recovered_files_list = recovered_list_destruct(recovered_files_list);

    return 0;
}

/* Function Name: getSector
   Input value(s): fat_entry, the index in the FAT table.
   Return value(s): A pointer to the beginning of the sector corresponding to fat_entry.
   Purpose: Finds the beginning of the sector corresponding to fat_entry.
 */
uint8_t *getSector(uint16_t fat_entry)
{
    /* Compute sector number, index into image, and return. */
    int sector_num = 33 + fat_entry - 2;
    return image + (sector_num * SECTOR_SIZE);
}

/* Function Name: copyFAT
   Input value(s): None.
   Return value(s): None.
   Purpose: Copies the FAT table from the disk image into the global variable FAT_Table. 
              This allows for index-based access of the program's FAT Table.
 */
void copyFAT(void) 
{
    /* Get pointer to the front of the first FAT table. */
    uint8_t *memory_table = image + SECTOR_SIZE;
    uint8_t first_nibble = 0x00, second_nibble = 0x00;
    uint16_t entry = 0x0000;
    int fat_index, mem_index;

    /* Copy FAT into local global variable. */
    for(fat_index = 0, mem_index = 0; fat_index < TABLE_SIZE; fat_index += 2, mem_index += 3) {
        /* Find nibbles for first entry. */
        first_nibble  = memory_table[mem_index + 1] & 0x0F;
        second_nibble = memory_table[mem_index] & 0xFF;

        /* Concatenate nibbles and insert into local FAT Table. */
        entry = (((uint16_t) first_nibble) << 8) | second_nibble;
        FAT_Table[fat_index] = entry;

        /* Find nibbles for second entry. */
        first_nibble  = (memory_table[mem_index + 2] >> 4) & 0x0F;
        second_nibble = (memory_table[mem_index + 2] << 4) & 0xF0;
        second_nibble |= ((memory_table[mem_index + 1] >> 4) & 0x0F);
        
        /* Concatenate nibbles and insert into local FAT Table. */
        entry = (((uint16_t) first_nibble) << 8) | second_nibble;
        FAT_Table[fat_index + 1] = entry;
    }

    #ifdef DEBUG
        int i;
        printf("\nFAT Table\n");
        printf("Index\tEntry\n");
        for(i = 0; i < TABLE_SIZE; ++i)
            printf("%d\t%X\n", i, FAT_Table[i]);
    #endif
}

/* Function Name: getFileHeader
   Input value(s): file_start, beginning of the file header in the image.
   Return value(s): A pointer to the file header block created.
   Purpose: Copies file header at file_start from image into a data structure for easier access. 
 */
file_header_t *getFileHeader(uint8_t *file_start)
{
    /* Malloc space for file header. */
    file_header_t *file_header = (file_header_t *) malloc(sizeof(file_header_t));
    int i;  

    /* Initialize members. Null terminate string members. */
 
    /* Cut padding spaces off of file name. */
    for(i = 0; i < NAME_LEN; ++i) {
        if(file_start[i] == 0x20) {
            file_header->name[i] = '\0';
            break;
        }
        file_header->name[i] = file_start[i];
    }
    file_header->name[NAME_LEN] = '\0';

    /* Memcpy everything else. */
    memcpy(file_header->extension, file_start + 8, EXT_LEN);
    file_header->extension[EXT_LEN] = '\0';
    memcpy(&(file_header->attributes), file_start + 11, ATTRIB_LEN);
    memcpy(&(file_header->first_cluster), file_start + 26, CLUSTER_LEN);
    memcpy(&(file_header->size), file_start + 28, SIZE_LEN);
 
    return file_header;
}

/* Function Name: getSubDirName
   Input value(s): root_name, the name of the root directory.
                   sub_name, the name of the sub directory.
   Return value(s): The file path to the subdirectory, root_name/sub_name.
   Purpose: Concatenates root_name and sub_name together. 
 */
char *getSubDirName(char *root_name, char *sub_name) 
{
    /* Determine total name size. Need two extra characters for extra '/'
       character and NULL termination. */
    int root_name_size = strlen(root_name);
    int sub_name_size = strlen(sub_name);   
    int total_name_size = root_name_size + sub_name_size + 2;
   
    /* Malloc space for full name. */
    char *full_name = malloc(total_name_size * sizeof(char));

    /* Initialize new name. */
    sprintf(full_name, "%s/%s", root_name, sub_name);

    return full_name;
}

/* Function Name: processFiles
   Input value(s): file_start, the start of the file header being analyzed.
                   directory, the name of the current directory.
   Return value(s): None.
   Purpose: Analyzes all files on the disk image, starting with the root directory. 
              Prints all found files (including deleted) to std_out. Names for 
              deleted files start with an '_'. Also saves file information in
              a global linked list for later use.
 */
void processFiles(uint8_t *file_start, char *directory) 
{
    /* Return when the end of the directory is reached. */
    if(*file_start == 0x00) return;

    /* Get file header for current file. */
    file_header_t *file_header = getFileHeader(file_start);

    /* Don't process "." or ".." entries. */
    if(strcmp(file_header->name, ".") != 0 && strcmp(file_header->name, "..") != 0) {
        if(file_header->attributes & 0x10) {
            /* Found a sub-directory. Find start in image. */
            uint8_t *sub_directory_start = getSector(file_header->first_cluster);
  
            if((uint8_t) file_header->name[0] == 0xE5) {
                /* Found a deleted sub-directory. Change name and recover first 
                   cluster only. */
                file_header->name[0] = '_';

                /* Get sub-directory name. */
                char *sub_directory = getSubDirName(directory, file_header->name);

                #ifdef DEBUG
                    printf("DEBUG: About to enter deleted sub-directory %s.\n", sub_directory);
                #endif

                processFiles(sub_directory_start, sub_directory);

                #ifdef DEBUG
                    printf("DEBUG: About to leave sub-directory %s.\n", sub_directory);
                #endif

                /* Clean up sub-directory name. */
                free(sub_directory);
            } else {
                /* Found a regular sub-directory. */
                char *sub_directory = getSubDirName(directory, file_header->name);
                uint16_t fat_entry = file_header->first_cluster;

                /* Recurse through the sub-directory until its end is reached. */
                while(fat_entry < 0xFF0) {
                    #ifdef DEBUG
                        printf("DEBUG: About to enter sub-directory %s.\n", sub_directory);
                    #endif

                    processFiles(sub_directory_start, sub_directory);

                    /* Move to next FAT Table entry. */
                    fat_entry = FAT_Table[fat_entry];

                    /* Update start of sub-directory. */
                    sub_directory_start = getSector(fat_entry);
                }

                #ifdef DEBUG
                    printf("DEBUG: About to leave sub-directory %s.\n", sub_directory);
                #endif

                /* Clean up sub-directory name. */
                free(sub_directory);   
            }
        } else {
            /* Found a file. */
            if((uint8_t) file_header->name[0] == 0xE5) {
                /* Found a deleted file. Replace first character with '_'. */
                file_header->name[0] = '_';
                printf("FILE\tDELETED\t%s/%s.%s\t%d\n", directory, 
                       file_header->name, file_header->extension, file_header->size);

                /* Insert node into the recovered files list. */
                recovered_list_insert (recovered_files_list, file_header, DELETED);
            } else {
                /* Found a normal file. */
                printf("FILE\tNORMAL\t%s/%s.%s\t%d\n", directory, 
                       file_header->name, file_header->extension, file_header->size); 

                /* Insert node into the recovered files list. */
                recovered_list_insert(recovered_files_list, file_header, NORMAL);
            } 
        }
    }

    /* Clean up file header. */
    free(file_header);

    /* Continue recursing through current directory. */
    processFiles(file_start + FILE_SIZE, directory);
}

/* Function Name: getFilePath
   Input value(s): output_path, the path to the output directory. 
                   file, the recovered list node for the file.
   Return value(s): The path for the output file.
   Purpose: Used by writeFiles() to generate the path string for each output file. These values
              are then passed by writeFiles() to an fopen() call.
 */
char *getFilePath(char *output_path, recovered_node_t *file) 
{
    /* Calculate total size of file path. */
    int total_num_chars = strlen(output_path) + strlen(file->name) + strlen(file->extension) + 3;
    char *file_path = malloc(total_num_chars * sizeof(char));

    /* Build output file path. */
    sprintf(file_path, "%s/%s.%s", output_path, file->name, file->extension);

    /* Return built newly-built path name string. */
    return file_path;
}

/* Function Name: recoverFile
   Input value(s): list_node, the node of the recovered file list containing the start of the
                     file.
                   output_fd, the file descriptor for the output file. 
   Return value(s): None.
   Purpose: Takes the file starting at list_node->first_cluster and writes it to an output file.
              If the file is not deleted, the FAT Table is used to do this. If the file is 
              deleted writing starts at FAT_Table[list_node->first_cluster] and continues as
              long as the FAT Table contains zero in each subsequent entry. 
 */
void recoverFile(recovered_node_t *list_node, int output_fd)
{
    int fat_entry = list_node->first_cluster;
    uint32_t size = list_node->size;
    uint8_t *data = NULL;

    if(list_node->state == NORMAL) {
        /* Recover by following FAT entries. */
        while(fat_entry < 0xFF0 && size > 0) {
            #ifdef DEBUG
               printf("DEBUG: About to get data for FAT index %d.\n", fat_entry);
            #endif

            /* Get data for output file. */
            data = getSector(fat_entry);
             
           /* Write to output file. */
           if(size > SECTOR_SIZE) {
                /* Write entire sector. */
                write(output_fd, data, SECTOR_SIZE);
                size -= SECTOR_SIZE;
            } else {
                /* Write last bit of file. */
                write(output_fd, data, size);
                size = 0;
            }
 
            /* Move to next FAT entry. */
            fat_entry = FAT_Table[fat_entry];
        }
    } else {
        /* Recover by guessing and recovering all sectors corresponding to FAT entries
           with contents 0x000. */
        while(!(FAT_Table[fat_entry]) && size > 0) {
            #ifdef DEBUG
                printf("DEBUG: About to get data for FAT index %d.\n", fat_entry);
            #endif

            /* Get data for output file. */
            data = getSector(fat_entry);
             
            /* Write to output file. */
            if(size > SECTOR_SIZE) {
                /* Write entire sector. */
                write(output_fd, data, SECTOR_SIZE);
                size -= SECTOR_SIZE;
            } else {
                /* Write last bit of file. */
                write(output_fd, data, size);
                size = 0;
            }
 
            /* Move to next FAT entry. */
            fat_entry++;
        }
    }
}

/* Function Name: writeFiles
   Input value(s): output_path, the path to the output directory. 
   Return value(s): None.
   Purpose: Writes the recovered files into the directory given by
     output path. Files are written using several established auxiliary
     functions.
 */
void writeFiles(char *output_path) 
{
    /* Generate output files in specified directories. */
    int output_fd, entry;
    char *file_path;
    recovered_node_t *list_rover = recovered_files_list->tail;

    for(entry = 0; entry < recovered_files_list->num_entries; ++entry)
    {
        /* Generate file path string for output file. */
        file_path = getFilePath(output_path, list_rover);

        #ifdef DEBUG
            printf("DEBUG: Writing file %s. First FAT index = %d\n", 
                   file_path, list_rover->first_cluster);
        #endif

        /* Open file path for writing. */
        output_fd = open(file_path, O_RDWR | O_CREAT, S_IRWXU | S_IRWXG);
        if(output_fd == -1) {
            fprintf(stderr, "error: couldn't open output file with path %s\n", file_path);
            exit(-1);
        }

        /* Recover file. */ 
        recoverFile(list_rover, output_fd);

        /* Close output file. */
        close(output_fd);

        /* Free output path. */
        free(file_path);
        file_path = NULL;

        /* Move list_rover backward. */
        list_rover = list_rover->prev;
    }
}
