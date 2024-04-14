// Program's name:  quartocthex.c
// Author's Name:   Ryan Barker
// Course:          ECE 222
// Date:            02-11-2014
// Purpose:         Program that allows for entry and conversion of
//                  quaternary, octal, and hexadecimal values. Conversion
//                  is done purely bitwise.

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define UCHAR unsigned char
#define MAXDIGITS 32 // Change this to allow for any number of digits

/* Function Prototypes */
int Typevalid(UCHAR type, UCHAR data[]);
int Datavalid(UCHAR type, UCHAR data[]);
int Sizevalid(UCHAR data[]);
void ToQuart(UCHAR data[], UCHAR type, int data_size);
void ToOct(UCHAR data[], UCHAR type, int data_size);
void ToHex(UCHAR data[], UCHAR type, int data_size);

int main (void)
{
     /* Declare input variables */
     UCHAR type;
     UCHAR data[MAXDIGITS + 1];
     
     /* Declare variable for correct binary data array */
     UCHAR correctBin[(MAXDIGITS/2) + 1]; 

     /* Declare validity variables */
     int type_valid, data_valid, size_valid;
     char enterread;

     /* Delcare data size variables */
     int entry, data_size = 0;

     /* Declare variable for continue. Assume continue */
     char cont = 'Y';

     /* Initialize data array */
     for(entry = 0; entry < MAXDIGITS + 1; entry++)
     {
          data[entry] = 0;
     }  

     for(entry = 0; entry < (MAXDIGITS / 2) + 1; entry++)
     {
          correctBin[entry] = 0;
     }  

     /* Display Program Header */
     printf("\nThis program will take either a quaternary, octal, or hexadecimal");
     printf(" value and then display the value in the other two bases.\n\n");

     printf("Please enter 'Q' for quaternary, 'O' for octal, or 'H' for hexadecimal");
     printf(" and a number in that base less than 33 digits to begin.\n\n");

     while (cont == 'Y')
     {
          /* Display Entry Text */
          printf("Examples of valid inputs: Q231, O7534, and H123ABC\n");
          printf("Please only use capital letters for hex.\n\n");
          printf("Please enter a valid input to begin or enter 'exit' to quit: ");

          /* Scan in input */
          type = getchar();
          if (type != 'e')
          {
               scanf("%s", data);
               enterread = getchar();
          }

          /* Check validity */
          type_valid = Typevalid(type, data);
          data_valid = Datavalid(type, data);
          size_valid = Sizevalid(data);

          while (type_valid != 1 || data_valid != 1 || size_valid != 1)
          {
               /* Prompt for re-entry */
               printf("\nExamples of valid inputs: Q231, O7534, and H123ABC\n");
               printf("\nPlease re-enter input or enter 'exit' to quit: ");
           
               /* Take new input */    
               type = getchar();
               if (type != 'e')
               {
                    scanf("%s", data);
                    enterread = getchar();
               }

               /* Check new input */
               type_valid = Typevalid(type, data);
               data_valid = Datavalid(type, data);
               size_valid = Sizevalid(data);
          }

          /* Get data size */
          for(entry = 0; data[entry] != '\0'; entry++)
          {
               data_size++;
          }
     
          /* Generate converted data array with correct binary values */
          for(entry = 0; data[entry] != '\0'; entry++)
          {
               if(data[entry] > 47 && data[entry] < 58)
               {
                     correctBin[entry] = data[entry] - 48;
               }
               else if(data[entry] > 64 && data[entry] < 71)
               {
                     correctBin[entry] = data[entry] - 55;
               }
          }

          /* Determine functions to run based off data type */
          if (type == 'Q')
          {
               /* Run nessecary functions */
               ToOct(correctBin, 'Q', data_size);
               ToHex(correctBin, 'Q', data_size);
          }
          else if (type == 'O')
          {
               /* Run nessecary functions */
               ToQuart(correctBin, 'O', data_size);
               ToHex(correctBin, 'O', data_size);
          }
          else
          {
               /* Run nessecary functions */
               ToQuart(correctBin, 'H', data_size);
               ToOct(correctBin, 'H', data_size);    
          }
          
          /* Check if program is going to re-run */
          printf("\nWould you like to run the program again (Y/N)? ");
          cont = getchar();
          enterread = getchar();

          /* Verify valid entry */
          while (cont != 'Y' && cont != 'N')
          {
               /* Prompt for re-entry */
               printf("Invalid entry! Enter 'Y' or 'N': ");
               cont = getchar();

               while(enterread != '\n')
               {
                    scanf("%c", &enterread);
               }
               enterread = '0';
          }

          /* Reset data size */
          data_size = 0;
     }

     return 0;
}


//
// Function name: Typevalid
// Inputs:        type (UCHAR) and data (UCHAR array)
// Returns:       Valid, whether the user specified a valid type or not or exits if the user
//                specifies that as their desired operation.
// Purpose:       Returns a 'valid' flag to indicate a valid type or exits the
//                program if that is the desired operation.
//
int Typevalid(UCHAR type, UCHAR data[])
{
     /* Declare variables. Assume valid on first pass */
     char exitcheck[5];
     int valid = 1;
                   
     /* Check if user entered "exit" and exit if so */
     if (type == 'e')
     {
          scanf("%s", exitcheck);

          if(strcmp(exitcheck, "xit") == 0)
          {
               exit(0);
          }
     }

     if (type != 'Q' && type != 'O' && type != 'H')
     {
          /* Invalid type */
          valid = 0;

          /* Prompt that type is invalid */
          printf("\nThe data type you specified is not valid.");
     }

     return valid;
}

//
// Function name: Datavalid
// Inputs:        type (UCHAR) and data (UCHAR Array)
// Returns:       Valid, whether the user specified valid data for the type
//                they entered or not.
// Purpose:       This function runs several checks to determine if the user entered
//                the correct type of data for their type and prompts them if invalid
//                data is entered.
//
int Datavalid(UCHAR type, UCHAR data[])
{
     /* Declare variables. Assume valid */
     int entry, valid = 1;
     int exit = 0;

     for(entry = 0; data[entry] != '\0'; entry++)
     {
          
          if ((type == 'Q') && (((data[entry] < 48) || (data[entry] > 51))) && (exit == 0))
          {
               /* Invalid entry */
               valid = 0;
               exit = 1;
        
               /* Prompt user that entry is invalid */
               printf("\nThe value you entered is not quartenary.");
          }
          else if((type == 'O') && ((data[entry] < 48) || (data[entry] > 55)) && (exit == 0))
          {    
               /* Invalid entry */
               valid = 0;
               exit = 1;
                       
               /* Prompt user that entry is invalid */
               printf("\nThe value you entered is not octal.");
          }
          else if(type == 'H')
          {
               if(exit == 0)
               {
                    if((data[entry] < 48 || data[entry] > 57) && (data[entry] < 65 
                         || data[entry] > 70))
                    {
                         /* Invalid entry */
                         valid = 0;
                         exit = 1;
           
                        /* Prompt user that entry is invalid */
                        printf("\nThe value you entered is not hexadecimal.");
                    }
               }
          }
     }

     return valid;
}

//
// Function name: Sizevalid
// Inputs:        data (UCHAR Array)
// Returns:       Valid, whether the size was valid.
// Purpose:       This function checks to see if they number the user entered is
//                greater than 32 digits. It re-prompts them if so.
//
int Sizevalid(UCHAR data[])
{
      /* Declare variables and assume valid */
      int entry, data_size = 0;
      int valid = 1; 

      /* Get number of elements of data */
      for(entry = 0; data[entry] != '\0'; entry++)
      {
          data_size++;
      }

      /* Check data size */
      if(data_size > MAXDIGITS)
      {
          /* Invalid entry */
          valid = 0;

          // Prompt size was too long:
          printf("\nYou entered a value greater than 32 digits.");
      }

      return valid;
}

//
// Function name: ToQuart
// Inputs:        data (UCHAR array) = Input data in converted int format (1 byte / digit)
//                type (UCHAR) = Type of data inputted (O = Octal and H = Hex)
//                data_size (int) =  Number of digits of the inputted number
// Returns:       None
// Purpose:       This function processes correct binary input and converts it into
//                Quartenary and prints it to the console. 
//
void ToQuart(UCHAR data[], UCHAR type, int data_size)
{
     /* Declare variables */
     int bitcount;
     int byte = 0;
     int digit;
     UCHAR ToPrint = '\0';
     UCHAR temp = '\0';

     UCHAR conv_table[5] = { 0x00, 0x01, 0x02, 0x03 };

     /* Print initial statement */
     printf("\nThe equivalent quarternary value is: Q");

     /* Print actual number - method dependent on type of input */
     if(type == 'O')
     {
          /* Set variable for bit number to 3 (Since type is Octal) */
          int bit = 3;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 3); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when nessecary */
               if(bit < 1)
               {
                   byte++;
                   bit = 3;
               }
           
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if(data_size % 2 != 0)
               {
                   /* If data size is not divisible by 2, the first bit must be printed 
                      independently as the least significant bit in a set */
                   if(bitcount == 1)
                   {
                        /* Will be least significant bit */
                        ToPrint = ToPrint | temp;

                        /* Prints first bit */
                        for(digit = 0; digit < 4; digit++)
                        {
                            /* Checks for matching value in conversion table and prints 
                               matches to screen */
                            if(conv_table[digit] == ToPrint)
                            {
                                 printf("%d", digit);    /* This is where the value is actually 
                                                            printed */
                            }
                        }

                        /* Clear ToPrint to ready it for the next set of bits */
                        ToPrint = '\0';
                   }
                   else if((bitcount - 1) % 2 != 0)
                   {
                        /* If bitcount - 1 not divisible by 2, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount - 1 divisible by 2, first bit in a set */
                        ToPrint = ToPrint | temp;
                   
                        /* It is also time to print */
                        for(digit = 0; digit < 4; digit++)
                        {
                             /* Checks for matching value in conversion table and prints 
                                matches to screen */
                             if(conv_table[digit] == ToPrint)
                             {
                                  printf("%d", digit);    /* This is where the value is 
                                                             actually printed */
                             }
                        }

                        /* Clear ToPrint to ready it for the next set of bits */
                        ToPrint = '\0';
                   }
               }
               else
               {
                   if (bitcount % 2 != 0)
                   {
                        /* If bit count not divisible by two, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {  
                        /* If bit count divisible by two, first bit in this set */
                        ToPrint = ToPrint | temp;

                        /* If bit count divisible by two, it is time to print data to screen */
                        for(digit = 0; digit < 4; digit++)
                        {
                            /* Checks for matching value in conversion table and prints 
                               matches to screen */
                            if(conv_table[digit] == ToPrint)
                            {
                                 printf("%d", digit);    /* This is where the value is actually 
                                                            printed */
                            }
                        }

                        /* Clear ToPrint to ready it for the next set of bits */
                        ToPrint = '\0';
                   }
               }
          /* Decrement bit number */
          bit--;
          }
     }
     else
     {
          /* Set variable for bit number to 4 (Since type is hex) */
          int bit = 4;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 4); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when necessary */
               if(bit < 1)
               {
                   byte++;
                   bit = 4;
               }
           
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if (bitcount % 2 != 0)
               {
                   /* If bit count not divisible by two, second bit in a set */
                   ToPrint = ToPrint | (temp << 1);
               }
               else
               {  
                   /* If bit count divisible by two, first bit in this set */
                   ToPrint = ToPrint | temp;

                   /* If bit count divisible by two, it is time to print data to screen */
                   for(digit = 0; digit < 4; digit++)
                   {
                        /* Checks for matching value in conversion table and prints 
                           matches to screen */
                        if(conv_table[digit] == ToPrint)
                        {
                            printf("%d", digit);    /* This is where the value is actually 
                                                       printed */
                        }
                   }

                   /* Clear ToPrint to ready it for the next set of bits */
                   ToPrint = '\0';
               }

          /* Decrement bit number */
          bit--;
          }
     }
}

//
// Function name: ToOct
// Inputs:        data (UCHAR array) = Input data in converted int format (1 byte / digit)
//                type (UCHAR) = Type of data inputted (O = Octal and H = Hex)
//                data_size (int) =  Number of digits of the inputted number
// Returns:       None
// Purpose:       This function takes correct binary input and converts it into Octal. 
//                It then prints the octal value to the console.
//
void ToOct(UCHAR data[], UCHAR type, int data_size)
{
     /* Declare variables */
     int bitcount;
     int byte = 0;
     UCHAR ToPrint = '\0';
     UCHAR temp = '\0';

     /* Print initial statement */
     printf("\nThe equivalent octal value is: O");

     /* Print actual number - method dependent on type of input */
     if(type == 'Q')
     {
          /* Set variable for bit number to 2 (Since type is Quartenary) */
          int bit = 2;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 2); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when necessary */
               if(bit < 1)
               {
                   byte++;
                   bit = 2;
               }
           
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if(data_size % 3 == 1)
               {
                   /* If data size % 3 == 1, the first two bits must be printed 
                      independently as the least two significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;
 
                        /* Time to print first two bits */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 3 == 0)
                   {
                        /* If bitcount divisible by 3, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 1)
                   {
                        /* If bitcount % 3 = 1, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 3 = 2, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else if (data_size % 3 == 2)
               {
                   /* If data size % 3 == 2, the first bit must be printed 
                      independently as the least significant bit in a set */
                   if(bitcount == 1)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Need to print first set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next data set */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 3 == 2)
                   {
                        /* If bitcount % 3 = 2, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 0)
                   {
                        /* If bitcount % 3 = 0, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);                        
                   }
                   else
                   {
                        /* If bitcount % 3 = 1, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else
               {
                   /* If data size % 3 == 0, every 3 bits will be printed */
                   if(bitcount % 3 == 1)
                   {
                        /* If bitcount % 3 = 1, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 2)
                   {
                        /* If bitcount % 3 = 2, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);                        
                   }
                   else
                   {
                        /* If bitcount % 3 = 0, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }


          /* Decrement bit number */
          bit--;
          }              
     }
     else
     {
          /* Set variable for bit number to 4 (Since type is Hex) */
          int bit = 4;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 4); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when nessecary */
               if(bit < 1)
               {
                   byte++;
                   bit = 4;
               }
           
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if(data_size % 3 == 1)
               {
                   /* If data size % 3 == 1, the first bit must be printed 
                      independently as the least significant bit in a set */
                   if(bitcount == 1)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Time to print first bit */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 3 == 2)
                   {
                        /* If bitcount % 3 = 2, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 0)
                   {
                        /* If bitcount divisible by 3, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 3 = 1, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else if (data_size % 3 == 2)
               {
                   /* If data size % 3 == 2, the first two bits must be printed 
                      independently as the least significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Need to print first set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next data set */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 3 == 0)
                   {
                        /* If bitcount divisible by 3, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 1)
                   {
                        /* If bitcount % 3 = 1, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);                        
                   }
                   else
                   {
                        /* If bitcount % 3 = 2, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else
               {
                   /* If data size % 3 == 0, every 3 bits will be printed */
                   if(bitcount % 3 == 1)
                   {
                        /* If bitcount % 3 = 1, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 3 == 2)
                   {
                        /* If bitcount % 3 = 2, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);                        
                   }
                   else
                   {
                        /* If bitcount % 3 = 0, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%o", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }


          /* Decrement bit number */
          bit--;
          }              
     }
}

//
// Function name: ToHex
// Inputs:        data (UCHAR array) = Input data in converted int format (1 byte / digit)
//                type (UCHAR) = Type of data inputted (O = Octal and H = Hex)
//                data_size (int) =  Number of digits of the inputted number
// Returns:       None
// Purpose:       This function takes correct binary input and converts it into Hex. It
//                then prints the resulting hex value to the console.
//
void ToHex(UCHAR data[], UCHAR type, int data_size)
{
     /* Declare variables */
     int bitcount;
     int byte = 0;
     UCHAR ToPrint = '\0';
     UCHAR temp = '\0';

     /* Print initial statement */
     printf("\nThe equivalent hex value is: H");

     /* Print actual number - method dependent on type of input */
     if(type == 'Q')
     {
          /* Set variable for bit number to 2 (Since type is Quaternary) */
          int bit = 2;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 2); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when nessecary */
               if(bit < 1)
               {
                   byte++;
                   bit = 2;
               }
            
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if(data_size % 2 == 1)
               {
                   /* If data size % 2 == 1, the first two bits must be printed 
                      independently as the least two significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;
 
                        /* Time to print first two bits */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 4 == 3)
                   {
                        /* If bitcount % 4 = 3, fourth bit in a set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if (bitcount % 4 == 0)
                   {
                        /* If bitcount % 4 = 0, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 4 == 1)
                   {
                        /* If bitcount % 4 = 1, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 4 = 2, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else
               {
                   /* If data divisible by 2, every four bits are printed */
                   if(bitcount % 4 == 1)
                   {
                        /* Will be fourth bit in set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if(bitcount % 4 == 2)
                   {
                        /* If bitcount % 4 = 2, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 4 == 3)
                   {
                        /* If bitcount % 4 = 3, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);                        
                   }
                   else
                   {
                        /* If bitcount divisible by four, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }

          /* Decrement bit number */
          bit--;
          }              
     }
     else
     {
          /* Set variable for bit number to 3 (Since type is Octal) */
          int bit = 3;

          /* Loop through for each bit stored */
          for(bitcount = 1; bitcount <= (data_size * 3); bitcount++)
          {
               /* Increment byte operated on and reset bit to zero when nessecary */
               if(bit < 1)
               {
                   byte++;
                   bit = 3;
               }
           
               /* Set up a placeholder for the current bit */
               temp = (data[byte] >> (bit - 1)) &~ 0xFE;

               if(data_size % 4 == 1)
               {
                   /* If data size % 4 == 1, the first three bits must be printed 
                      independently as the least significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be third bit in set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 3)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Time to print first set */
                        printf("%X", ToPrint);
 
                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 4 == 0)
                   {
                        /* If bitcount divisible by four, fourth bit in a set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if (bitcount % 4 == 1)
                   {
                        /* If bitcount % 4 = 1, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);
                   }
                   else if (bitcount % 4 == 2)
                   {
                        /* If bitcount % 4 = 2, second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 4 = 3, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else if (data_size % 4 == 2)
               {
                   /* If data size % 4 == 2, the first two bits must be printed 
                      independently as the least significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Need to print first set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next data set */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 4 == 3)
                   {
                        /* If bitcount % 4 == 3, fourth bit in a set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if (bitcount % 4 == 0)
                   {
                        /* If bitcount divisible by four, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);                        
                   }
                   else if (bitcount % 4 == 1)
                   {
                        /* If bitcount % 4 = 1, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 4 = 2, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else if (data_size % 4 == 2)
               {
                   /* If data size % 4 == 2, the first two bits must be printed 
                      independently as the least significant bits in a set */
                   if(bitcount == 1)
                   {
                        /* Will be second bit in set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else if(bitcount == 2)
                   {
                        /* Will be first bit in set */
                        ToPrint = ToPrint | temp;

                        /* Need to print first set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next data set */
                        ToPrint = '\0';
                   }
                   else if(bitcount % 4 == 3)
                   {
                        /* If bitcount % 4 == 3, fourth bit in a set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if (bitcount % 4 == 0)
                   {
                        /* If bitcount divisible by four, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);                        
                   }
                   else if (bitcount % 4 == 1)
                   {
                        /* If bitcount % 4 = 1, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 4 = 2, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else if (data_size % 4 == 3)
               {
                   /* If data size % 4 == 3, the first bit must be printed 
                      independently as the least significant bit in a set */
                   if(bitcount == 1)
                   {
                        /* Will be the first bit in a set */
                        ToPrint = ToPrint | temp;
                     
                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
                   if(bitcount % 4 == 2)
                   {
                        /* If bitcount % 4 = 2, fourth bit in a set */
                        ToPrint = ToPrint | (temp << 3);
                   }
                   else if (bitcount % 4 == 3)
                   {
                        /* If bitcount % 4 = 3, third bit in a set */
                        ToPrint = ToPrint | (temp << 2);                        
                   }
                   else if (bitcount % 4 == 0)
                   {
                        /* If bitcount divisble by four, second bit in a set */
                        ToPrint = ToPrint | (temp << 1);
                   }
                   else
                   {
                        /* If bitcount % 4 = 1, first bit in a set */
                        ToPrint = ToPrint | temp;

                        /* Also, time to print this set */
                        printf("%X", ToPrint);

                        /* Clear ToPrint for next values */
                        ToPrint = '\0';
                   }
               }
               else
               {
                    /* If data size divisible by 4, every four bits will be printed */
                    if (bitcount % 4 == 1)
                    {
                         /* If bitcount % 4 = 1, fourth bit in a set */
                         ToPrint = ToPrint | (temp << 3);
                    }
                    else if(bitcount % 4 == 2)
                    {
                         /* If bitcount % 4 = 2, third bit in a set */
                         ToPrint = ToPrint | (temp << 2);
                    }
                    else if(bitcount % 4 == 3)
                    {
                         /* If bitcount % 4 = 3, second bit in a set */
                         ToPrint = ToPrint | (temp << 1);
                    }
                    else
                    {
                         /* If bitcount divisible by four, first bit in a set */
                         ToPrint = ToPrint | temp;

                         /* Also, time to print this set */
                         printf("%X", ToPrint);

                         /* Clear ToPrint for next values */
                         ToPrint = '\0';
                    }
               }
          /* Decrement bit number */
          bit--;
          }              
     }
}
