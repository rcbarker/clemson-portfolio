//threadtest1.c

#include <stdio.h>
#include <stdlib.h>
#include "mythreads.h"

void *t1 (void *arg)
{
	int param = *((int*)arg);
	printf("threadtest1.c: t1 started %d\n", param);

	threadYield();

	int* result = malloc(sizeof(int));
	*result = param + 1;
	printf ("threadtest1.c: added 1! (%d)\n", *result);
	
	threadYield();

	printf("threadtest1.c: t1 - done result=%d\n", *result);
	return result;
}



int main(void)
{
        printf("threadtest1.c: basic cooperative test\n");

	int id1, id2;
	int p1;
	int p2;

	p1 = 23;
	p2 = 2;

	int *result1, *result2;

	//initialize the threading library. DON'T call this more than once!!!
	threadInit();

	id1 = threadCreate(t1,(void*)&p1);
	printf("threadtest1.c: created thread 1.\n");	
	
	id2 = threadCreate(t1,(void*)&p2);
	printf("threadtest1.c: created thread 2.\n");

	threadJoin(id1, (void*)&result1);
	printf("threadtest1.c: joined #1 --> %d.\n",*result1);

	threadJoin(id2, (void*)&result2);
	printf("threadtest1.c: joined #2 --> %d.\n",*result2);

        free(result1);
        free(result2);

        printf("threadtest1.c: main process returning...\n");
        return 0;
}
