#include <stdio.h>
#include <time.h>

int main(void)
{
    printf("sctest: to test sctracer with this file, run:\n\t./sctracer ./sctest\n");

    int i;
    for(i = 0; i < 25; ++i) {
        clock_t t = clock();
        printf("%ld\n",t);
    }

    return 0;
}
