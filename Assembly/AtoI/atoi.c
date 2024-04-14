/* begin C driver */

#include <stdio.h>

char input[10];
int output;
char *ascii;
int *intptr;
int sign, multiplier, i;

int main(int argc, char **argv)
{
    printf("Enter a number: ");
    fgets(input, 10, stdin);
    ascii = input;
    intptr = &output;
    
    /* this is the function we will write in assembly */
    AtoI();
    
    printf("\nASCII is (printed with %%s): %s\nInteger is (printed with %%d): %d\n", 
           input,output);
    
    return 0;
}

/* end C driver */
