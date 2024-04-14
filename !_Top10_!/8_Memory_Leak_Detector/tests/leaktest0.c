#include <stdlib.h>
#include <stdio.h>

int main(void) {
   int *p0, *p1, *p2;
   printf("test 0: to test leakcount with this file, run:\n\t./leakcount ./leaktest0\n");
   printf("test 0: mallocing p0...\n");
   p0 = malloc(5);
   printf("test 0: p0 = %p\n", p0);
   printf("test 0: freeing p0...\n");
   free(p0);
   printf("test 0: mallocing p1 and p2\n");
   p1 = malloc(13);
   p2 = malloc(2);
   printf("test 0: p1 = %p, p2 = %p\n", p1, p2);
   printf("test 0: freeing p1 and p2...\n");
   free(p1);
   free(p2);

   return 0;
}
