// Program's name:  wordswithinwords.c (Dictonary Words Within Words Analyzer)
// Author's Name:   Ryan Barker
// Course:          ECE 222
// Date:            03-03-2014
// Purpose:         Program that analyzes a user-inputted dictionary file to find words 
//                  within words, and outputs them to the console and then to a file called 
//                  "words-within-words.txt". It also displays some statistics about 
//                  the words found to both locations.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* Declare global constants */
#define MAX_NAME_CHARS 32
#define NUM_WORDS 45430
#define MAX_LEN 29

/* Define file name */
char in_f_name[MAX_NAME_CHARS];
char out_f_name[] = "words-within-words.txt"; // Change this to change output file where 
                                              // information is sent

/* Function Prototypes */
void ReadDictionary(char Wordstore[NUM_WORDS][MAX_LEN]);
void ProcessDictionary(char Wordstore[NUM_WORDS][MAX_LEN]);

int main (void) 
{    /* Declare input variables */
     char words[NUM_WORDS][MAX_LEN];
     char def[] = "Y";    
     int row, col;

     /* Initialize words */
     for (row = 0; row < NUM_WORDS; row++)
     {    for (col = 0; col < MAX_LEN; col++)
          {    words[row][col] = '\0';
          }
     }

     /* Prompt User  */
     printf("\nWelcome to the Words within Words Analyzer.\n");

     printf("\nUse default dictionary ('Y' or 'N')? ");
     scanf("%s", def);

     while(strcmp(def, "Y") && strcmp(def,"N")) 
     {
          printf("Invalid option specified!\n\nUse default dictionary ('Y' or 'N')? ");
          scanf("%s", def);
     }

     if(!strcmp(def, "Y")) strcpy(in_f_name, "MyDictionary.txt");
     else
     {
          printf("\nEnter the full name of the ");
          printf("dictionary file (must be less than %d characters; include .txt extension): ",
                  MAX_NAME_CHARS);
          scanf("%s", in_f_name);

          /* Check for valid file name */
          while(strstr(in_f_name, ".txt") == NULL)
          {
          printf("Either invalid file name (no .txt extension) or name longer than ");
          printf("%d characters. Please re-enter full file name: ", MAX_NAME_CHARS);
          scanf("%s", in_f_name);
          }
     }

     /* Read in words */
     ReadDictionary(words);

     /* Process data */
     ProcessDictionary(words);

     return 0;
}


//
// Function name: ReadDictionary
// Inputs:        Wordstore (CHAR array)
// Returns:       None
// Purpose:       This function reads in the words from MyDictionary.txt and
//                stores the values in the input array.
//
void ReadDictionary(char Wordstore[NUM_WORDS][MAX_LEN])
{    /* Declare variables */
     FILE *dictionary;
     char value_in = '0';
     int word_num, entry;

     /* Open file for reading */
     dictionary = fopen(in_f_name, "r");

     /* If unable to open file, exit program */
     if(dictionary == NULL) 
     {
         fprintf(stderr, "\nError: could not find %s in the PWD.\n\n", in_f_name);
         exit(0);
     }

     /* Read in words */
     for(word_num = 0; word_num < NUM_WORDS; word_num++)
     {    for(entry = 0; entry < MAX_LEN; entry++)
          {    /* Read in character from dictionary */
               fscanf(dictionary, "%c", &value_in);

               /* Check if end of word. If end of word, move to next word. Else,
                  place value into array */
               if (value_in == '\n') break;
               else Wordstore[word_num][entry] = value_in;
          }
     }
   
     /* Close input file */
     fclose(dictionary);
}

//
// Function name: ProcessDictionary
// Inputs:        Wordstore (CHAR array)
// Returns:       None
// Purpose:       This function handles the data in Wordstore, finding all words
//                within words and printing out requested statistics.
//
void ProcessDictionary(char Wordstore[NUM_WORDS][MAX_LEN])
{    /* Declare variables */
     FILE *output;
     int row, col;
     int word_UT, other_Words;
     int num_words = 0;

     /* Declare indexes for statistics */
     int most_WWWs = 0;
     int longest_WWW = 0;

     int index_most_WWWs = 0;
     int index_longest_WWW = 0;
     int index_contained_in = 0;

     int num_no_match = 0;
    
     /* Change all values in Wordstore to Uppercase */
     for (row = 0; row < NUM_WORDS; row++)
     {    for (col = 0; col < MAX_LEN; col++)
          {    if (Wordstore[row][col] != '\0') 
                    Wordstore[row][col] = toupper(Wordstore[row][col]);
          }
     }

     /* Open output file for writing */
     output = fopen(out_f_name, "w");

     printf("\n");

     /* Search for words within words */
     for (word_UT = 0; word_UT < NUM_WORDS; word_UT++)
     {    
          /* Print word under test */
          printf("%s: ", Wordstore[word_UT]);
          fprintf(output, "%s: ", Wordstore[word_UT]);

          for (other_Words = 0; other_Words < NUM_WORDS; other_Words++)
          {    
               if (strstr(Wordstore[word_UT], Wordstore[other_Words]) 
                   && strcmp(Wordstore[word_UT], Wordstore[other_Words]) != 0)
               {    /* other_Word found in word under test and the two are not equal */

                    /* Print word inside of word */
                    printf("%s ", Wordstore[other_Words]);
                    fprintf(output, "%s ", Wordstore[other_Words]);

                    /* Check if other_Words is the longest word within a word.
                       Save it and the word it is in if so */
                    if (strlen(Wordstore[other_Words]) >= longest_WWW)
                    {    longest_WWW = strlen(Wordstore[other_Words]);
                         index_longest_WWW = other_Words;
                         index_contained_in = word_UT;
                    }

                    /* Increment number of words */
                    num_words++;
               }
          }

          /* This space represents actions to be performed between words */

          /* Check if word had no words inside of it. Increment counter if so */
          if (num_words == 0)
          {    num_no_match++;
          }


          /* If match was found */
          if (num_words != 0)
          {
               /* Check if word has most words within it. Save index if so */
               if (num_words >= most_WWWs) 
               {    most_WWWs = num_words;
                    index_most_WWWs = word_UT;
               }

               /* Print number of words */
               printf("(%d words)", num_words);
               fprintf(output, "(%d words)", num_words);

               /* Reset word number counter */
               num_words = 0;

               /* Print new line for next word */
               printf("\n");
               fprintf(output, "\n");
          }
     }

     /* Print word with most words within word */
     printf("\nThe word \"%s\" had the most words within it.", Wordstore[index_most_WWWs]);
     fprintf(output, "\nThe word \"%s\" had the most words within it.",
          Wordstore[index_most_WWWs]);

     /* Print words within word that contained most words */
     printf("\nIt contained %d words: ", most_WWWs);
     fprintf(output, "\nIt contained %d words: ", most_WWWs);

     for (other_Words = 0; other_Words < NUM_WORDS; other_Words++)
     {   if (strstr(Wordstore[index_most_WWWs], Wordstore[other_Words]) && 
                    strcmp(Wordstore[index_most_WWWs], Wordstore[other_Words]) != 0)
         {    printf("%s ", Wordstore[other_Words]);
              fprintf(output, "%s ", Wordstore[other_Words]);
         }
     }
 
     printf("\n");
     fprintf(output, "\n"); 

     /* Print longest word within a word */
     printf("\nThe longest word within a word was %s. It was contained in %s.\n",
          Wordstore[index_longest_WWW], Wordstore[index_contained_in]);
     fprintf(output, "\nThe longest word within a word was %s. It was contained in %s.\n",
          Wordstore[index_longest_WWW], Wordstore[index_contained_in]);  

     /* Print no match words */
     printf("\nThere were %d words with no words within them.\n\n", num_no_match);
     fprintf(output, "\nThere were %d words with no words within them.", num_no_match);

     /* Close file */
     fclose(output);     
}
