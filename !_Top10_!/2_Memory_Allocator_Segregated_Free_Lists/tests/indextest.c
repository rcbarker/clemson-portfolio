#include <stdio.h>

int main(void)
{
    int input;
    printf("Enter a number: ");
    scanf("%d", &input);
    int index = -1;
    if(input != 0) {
        if(!(input % 2)) input--;
        while(input != 0) {
            input = input >> 1;
            index++;
        }
    }

    printf("The index is %d.\n", index);

    return 0;
}
