// Program's name:  memscanner.c (Memory Scans with Arrays and Strings)
// Author's Name:   Ryan Barker
// Course:          ECE 222
// Date:            03-26-2014
// Purpose:         This program reads an input file into local memory and then prompts the user
//                  with a menu to designate operations.
//                 
//                  Menu Options:
//                  1. Search for a given ASCII character by inputting a decimal value 0 to 255, 
//                     or a hexadecimal value 0x00 to 0xFF.
//                  2. Display the character located at a certain address.
//                  3. Search for a given string (up to 32 characters).
//                  4. Display the sum of characters stored from one address to another.
//                  5. Quit
//
//                  Print format of all data from memory is:
//                                  [Offset from starting address]
//                  [Starting Addr] [Contents in memory]
//                                  [Hex value of each value in memory]
//                  
//                  Offsets printed by least significant digit.
//                                   


/* Libraries */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* Function Prototypes */
int Num_Chars(FILE *file);
int Run_Menu();
void Opt1(char *input_data, int file_size);
void Opt2(char *input_data, int file_size);
void Opt3(char *input_data, int file_size);
void Opt4(char *input_data, int file_size);
void PrintOutput(char *address, char *start, char *end, int carrot_enable);

int main (int argc, char *argv[]) 
{    /* Declare variables */
     char *input_data = NULL;
     int file_size, entry, option_chosen;
     FILE *input_file;

     /* Set loop so file runs unless quit is selected in the menu */
     while (1)
     {    
          /* Verify file was run correctly */
          if (argc != 2 || argv[1] == NULL)
          {    printf("\nThe file was not executed correctly. Please type the correct");
               printf(" executable command ('./memscanner')\nand the name of the data");
               printf(" input file (Default file name: data.txt).\n\n");

               exit(0);
          }
     
          /* Handle data from input file specified */

          /* Open input file */
          input_file = fopen(argv[1], "r");

          /* Check if file opened correctly. Exit if not */
          if (input_file == NULL)
          {    printf("\nThe input file could not be opened correctly. Be");
               printf(" sure the file is saved in the same directory as this");
               printf(" program and the extension is included in the name.\n\n");

               exit(0);
          }

          /* Get file size in terms of chars */
          file_size = Num_Chars(input_file);

          /* Dynamically create array */
          input_data = (char *) malloc(file_size * sizeof(char));

          /* Verify malloc */
          if (input_data == NULL)
          {    printf("\nError: Malloc failed to initialize the array.\n");
               printf("Please ensure there is enough memory on your machine.");
 
               exit(0);
          }
 
          /* Read in entries from file into the array */
          for (entry = 0; entry < file_size; entry++)
          {    fscanf(input_file, "%c", &input_data[entry]);
          }

          /* Print Menu */
          option_chosen = Run_Menu();

          /* Check if useer quit and exit if so */
          if (option_chosen == 5)
          {    exit(0);
          }

          /* Execute instruction chosen */
          if (option_chosen == 1)
          {    Opt1(input_data, file_size);
          }
          else if (option_chosen == 2)
          {    Opt2(input_data, file_size);
          }
          else if (option_chosen == 3)
          {    Opt3(input_data, file_size);
          }
          else 
          {    Opt4(input_data, file_size);
          }

          /* Prompt that program is cycling through again */
          printf("\nThe program will now run again.\n");

          /* Close file */
          fclose(input_file);

          /* Free data array */
          free(input_data);
     }

     return 0;
}

//
// Function name: Num_Chars
// Inputs:        file (FILE Pointer)
// Returns:       size, total number of chars in the file with file pointer file (INT).
// Purpose:       This function finds the total number of chars in the file with file pointer
//                file.
//
int Num_Chars(FILE *file)
{    /* Declare variables */
     int size;
     char read;

     /* Calculate file size */
     for (size = 0; fscanf(file, "%c", &read) == 1; size++)
     {
     }

     /* Decrement one from size (Because size counts up one after last valid read) */
     size--;

     /* Move position in file back to beginning */
     rewind(file);

     return size;
}

//
// Function name: Run_Menu
// Inputs:        None
// Returns:       option_chosen, the selected menu option (INT).
// Purpose:       This function prints the main program menu and returns the
//                user's selection.
//
int Run_Menu()
{    /* Declare variables */
     char option_chosen[] = "1";

     /* Print menu */
     printf("\nProgram Options:");
     printf("\n1. Search for a given ASCII character by inputting a decimal value 0 to 255,");
     printf(" or a hexadecimal value 0x00 to 0xFF.");
     printf("\n2. Display the character located at a certain address.");
     printf("\n3. Search for a given string (up to 32 characters).");
     printf("\n4. Display the sum of characters stored from one address to another.");
     printf("\n5. Quit");

     /* Read in input */
     printf("\n\nPlease enter your selection: ");
     scanf("%s", option_chosen);
 
     /* Check validity */
     while (atoi(option_chosen) < 1 || atoi(option_chosen) > 5)
     {    printf("\nInvalid specification! Please re-enter choice: ");
          scanf("%s", option_chosen);
     }

     return atoi(option_chosen);
}

//
// Function name: Opt1
// Inputs:        input_data (CHAR Pointer) and file_size (INT)
// Returns:       None
// Purpose:       This function searches all of the input data for the first
//                instance of a specified ASCII character and prints it to the
//                screen with a specific formatted output.
//
void Opt1(char *input_data, int file_size)
{
     /* Declare variables */
     char *start, *addr;
     char *end;
     char type[] = "D";
     int entry, match_index, mod16;
     int count = 0, found = 0;
     unsigned int toSearch; 

     /* Initialize array endpoints */
     start = input_data;
     end = input_data + file_size - 1;

     /* Prompt for type of input */
     printf("\nPlease specify a \"D\" to enter a decimal value or an ");
     printf("\"H\" to enter a hexadecimal value: ");
     
     scanf("%s", type);

     /* Check type validity */
     while (strcmp(type, "D") && strcmp(type, "H"))    
     {    printf("\nInvalid input type! Please re-enter: ");

          scanf("%s", type);
     }

     /* Prompt for actual input */
     printf("\nPlease enter the value to search for: ");

     if (!strcmp(type, "D"))
     {    scanf("%d", &toSearch);
          getchar();
     }
     else
     {    scanf("%x", &toSearch);
          getchar();
     }

     /* Check validity */
     while (toSearch < 0x00 || toSearch > 0xFF)
     {    printf("\nInvalid entry. Please re-enter input: ");

          if (strcmp(type, "D"))
          {    scanf("%d", &toSearch);
               getchar();
          }
          else
          {    scanf("%x", &toSearch);
               getchar();
          }
     }

     /* Find first instance of toSearch in data array */
     for (entry = 0; entry < file_size; entry++)
     {    if (*(input_data + entry) == (char) toSearch)
          {     match_index = entry;
                found = 1;
                break;
          }
     }
          
     if (!found)
     {    /* Print character searched for was not found */
          printf("\nThe character specified is not contained in the data.\n\n");
     }
     else
     {    // Character found. Print formatted output:
          printf("\n\n\n            ");

          /* Print modulus numbers: */
          for(entry = 0; entry < 10; entry++)
          {    printf("  %d", entry);
          }
         
          for(entry = 0; entry < 6; entry++)
          {    printf("  %d", entry);
          }
           
          /* Mod address of found value with 16 */
          mod16 = (int) ((intptr_t) (input_data + match_index) % 16);

          /* Print starting address */
          printf("\n[%d] [  ", (int) ((intptr_t) input_data + match_index - mod16));

          /* Print values at each address. Do not print if not printable or outside of address 
             range: */
          for (addr = (input_data + match_index - mod16); count < 16; addr++)
          {   if (addr >= start && addr <= end)
              {    if (*addr >= 0x20 && *addr <= 0x7E)
                   {    printf("%c  ", *addr);
                   }
                   else
                   {    printf("   ");
                   }
              }
              else
              {    printf("   ");
              }   

              count++;
          }

          /* Reset count and print new line */
          count = 0;
          printf("]\n              ");

          /* Print hex values of everything contained at each address */
          for (addr = (input_data + match_index - mod16); count < 16; addr++)
          {
               if (*addr >= 16)
               {    /* If hex character > Decimal 16, print one space */
                    printf("%X ", *addr);
               }
               else
               {    /* If hex character < Decimal 16, print two spaces */
                    printf("%X  ", *addr); 
               }
          
               count++;
          }

          /* Reset count and print new line */
          count = 0;
          printf("\n              ");

          /* Print "^" under every instance of found value. "." if outside address range */
          for (addr = (input_data + match_index - mod16); count < 16; addr++) 
          {   if (addr < start || addr > end)
              {    printf(".  ");
              } 
              else if (*addr == (char) toSearch)
              {    printf("^  ");
              }
              else
              {    printf("   ");
              }

              count++;
          }   

          printf("\n\n");
     }
}

//
// Function name: Opt2
// Inputs:        input_data (CHAR Pointer) and file_size (INT)
// Returns:       None
// Purpose:       This function searches all of the input data for a specified
//                address and prints the range around it with a specific formatted output.
void Opt2(char *input_data, int file_size)
{    /* Declare variables */
     char *start;
     char *end;
     char *address;
     unsigned int read_In;


     /* Initialize Array Endpoints */
     start = input_data;
     end = input_data + file_size - 1;

     /* Prompt for address */
     printf("\n\nPlease enter the address to retrieve a character from.");
     printf("\nThe valid address range is from %d to %d.", (int) ((intptr_t) start), 
          (int) ((intptr_t) end));
     printf("\n\nEnter address: ");

     scanf("%d", &read_In);
     getchar();

     address = (char *) ((intptr_t) read_In);

     /* Check address validity */
     while (address < start || address > end)
     {     printf("\nAddress is outside of range %d to %d. ", (int) ((intptr_t) start),
                 (int) ((intptr_t) end));
           printf("Please re-enter: ");

           scanf("%d", &read_In);
           getchar();

           address = (char *) ((intptr_t) read_In);
     }

     /* Print formatted output */
     PrintOutput(address, start, end, 1);
     printf("\n");
}

//
// Function name: Opt3
// Inputs:        input_data (CHAR Pointer) and file_size (INT)
// Returns:       None
// Purpose:       This function searches all of the input data for the first
//                instance of a specified string and prints it to the
//                screen with a specific formatted output.
//
void Opt3(char *input_data, int file_size)
{    /* Declare variables */
     char *start;
     char *end;
     char string[33];
     char *address;

     /* Initialize Array Endpoints */
     start = input_data;
     end = input_data + file_size - 1;

     /* Prompt for string */
     printf("\n\nPlease enter the string to search for: ");

     scanf("%s", string);

     /* Search for input within data */
     address = strstr(input_data, string);

     /* Check if string not found */
     if (address == NULL)
     {    printf("\nThe string is not contained in the data.\n\n");
     }

     /* Determine how many times to print */
     if (strlen(string) + ((int) ((intptr_t) address)) % 16 < 16 && address != NULL)
     {
          /* If < 16, print once */
          PrintOutput(address, start, end, 1);

          printf("\n");
     }
     else if (address != NULL)
     {
          if (strlen(string) + ((int) ((intptr_t) address)) % 16 < 32)
          {     /* If > 16 && < 32, print twice */
                PrintOutput(address, start, end, 1);
                PrintOutput(address + 15, start, end, 0);

                printf("\n");
          }
          else
          {     /* If > 32, print three times */
                PrintOutput(address, start, end, 1);
                PrintOutput(address + 15, start, end, 0);
                PrintOutput(address + 30, start, end, 0);

                printf("\n");
          }
     }


}

//
// Function name: Opt4
// Inputs:        input_data (CHAR Pointer) and file_size (INT)
// Returns:       None
// Purpose:       This function sums all of the hex values stored at a
//                specified address range in the input data and prints
//                the total to the screen.
//
void Opt4(char *input_data, int file_size)
{    /* Declare variables */
     char *start;
     char *end;
     char *addr1, *addr2;
     unsigned int read_In1, read_In2, total = 0;
     char *addr;

     /* Initialize Array Endpoints */
     start = input_data;
     end = input_data + file_size - 1;

     /* Prompt for address */
     printf("\n\nPlease enter the first address in the range.");
     printf("\nThe valid address range is from %d to %d.", (int) ((intptr_t) start), 
          (int) ((intptr_t) end));
     printf("\n\nEnter starting address: ");

     scanf("%d", &read_In1);
     getchar();
     addr1 = (char *) ((intptr_t) read_In1);

     printf("\nPlease enter the second address in the range.");
     printf("\nThe valid address range is from %d to %d.", (int) ((intptr_t) start), 
          (int) ((intptr_t) end));
     printf("\n\nEnter ending address: ");

     scanf("%d", &read_In2);
     getchar();
     addr2 = (char *) ((intptr_t) read_In2);


     /* Check address validity */
     while (addr1 < start || addr1 > end || addr2 < start || addr2 > end || addr2 <= addr1)
     {    printf("\nAn address specified was outside of range %d to %d ", 
              (int) ((intptr_t) start), (int) ((intptr_t) end));
          printf("or the ending address was less than or equal to the starting address.");
          printf("\nPlease re-enter starting address: ");

          scanf("%d", &read_In1);
          getchar();
          addr1 = (char *) ((intptr_t) read_In1);

          printf("\nPlease re-enter ending address: ");

          scanf("%d", &read_In2);
          getchar();
          addr2 = (char *) ((intptr_t) read_In2);
     }

     /* Calculate sum of values in address range */
     for (addr = addr1; addr <= addr2; addr++)
     {    total += *addr;
     }

     /* Print sum */
     printf("\nThe hex sum of all of the ASCII characters from %d to %d is %X.\n\n", 
          (int) ((intptr_t) start), (int) ((intptr_t) end), total);
}

//
// Function name: PrintOutput
// Inputs:        address (CHAR Pointer), start (CHAR Pointer), end (CHAR Pointer), and 
//                carrot_enable (INT)
// Returns:       None
// Purpose:       This function prints the formatted input specified for menu options 2 and 3.
//
void PrintOutput(char *address, char *start, char *end, int carrot_enable)
{
     char *addr;
     int entry, mod16, count = 0;

     /* Print formatted output */
     printf("\n            ");

     /* Print modulus numbers */
     for(entry = 0; entry < 10; entry++)
     {    printf("  %d", entry);
     }
         
     for(entry = 0; entry < 6; entry++)
     {    printf("  %d", entry);
     }
          
     /* Mod address of found value with 16 */
     mod16 = (int) ((intptr_t) address) % 16;

     /* Print starting address */
     printf("\n[%d] [  ", (int) ((intptr_t) address) - mod16);

     /* Print values at each address. Do not print if not printable or outside of address 
        range */
     for (addr = (address - mod16); count < 16; addr++)
     {   if (addr >= start && addr <= end)
         {    if (*addr >= 0x20 && *addr <= 0x7E)
              {    printf("%c  ", *addr);
              }
              else
              {    printf("   ");
              }
         }
         else
         {    printf("   ");
         }   

         count++;
     }

     /* Reset count and new line */
     count = 0;
     printf("]\n              ");

     /* Print hex values of everything contained at each address */
     for (addr = (address - mod16); count < 16; addr++)
     {
          if (*addr >= 16)
          {    /* If hex character > Decimal 16, print one space */
               printf("%X ", *addr);
          }
          else
          {    /* If hex character < Decimal 16, print two spaces */
               printf("%X  ", *addr); 
          }

          count++;
     }

     /* Reset count and new line */
     count = 0;
     printf("\n              ");

     /* Print "^" under every instance of found value. "." if outside address range */
     for (addr = (address - mod16); count < 16; addr++) 
     {   if (addr < start || addr > end)
         {    printf(".  ");
         } 
         else if (addr == address && carrot_enable == 1)
         {    printf("^  ");
         }
         else
         {    printf("   ");
         }

         count++;
     }   

     printf("\n");
}
