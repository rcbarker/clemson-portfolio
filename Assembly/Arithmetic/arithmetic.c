/* begin C driver */

#include <stdio.h>

extern int digit1;
extern int digit2;
extern int digit3;
extern int diff;
extern int sum;
extern int product;
extern int rmdr;

int main(int argc, char **argv)
{
    printf("PT -> (digit1)^2 + (digit2)^2 - (digit3)^2 = 0\n");
    printf("ED -> (product of digits) %% (sum of digits) = 0\n");
    for (digit1 = 0; digit1 < 10; digit1++) {
        for (digit2 = digit1; digit2 < 10; digit2++) {
            for (digit3 = digit2; digit3 < 10; digit3++) {
                dodiff();
                if (diff == 0)
                    printf("%d%d%d PT\n", digit1,digit2,digit3);
                dosumprod();
                if (sum && product) {
                    doremainder();
                    if (rmdr == 0)
                        printf("%d%d%d ED\n", digit1,digit2,digit3);
                }
            }
        }
    }
    return 0;
}
    /* end C driver */
