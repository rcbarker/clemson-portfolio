//threadtest.c

#include <stdio.h>
#include <stdlib.h>
#include "mythreads.h"

void *t1 (void *arg) 
{
        printf("threadtest4.c: thread 1 locking lock zero...\n");
        threadLock(0);

	printf("threadtest4.c: thread 1 about to yeild...\n");
	threadYield();

        printf("threadtest4.c: thread 1 unlocking lock zero...\n");
        threadUnlock(0);

	printf("threadtest.c: thread 1 returning...\n");

	return arg;
}

int main(void)
{
    printf("threadtest4.c: threadLock/threadUnlock testing\n");
 
    int p1;

    p1 = 23;

    /* Initialize the threading library. */
    threadInit();   

    /* Create a threads */
    threadCreate(t1, &p1);
    printf("threadtest4.c: created thread 1.\n");	

    printf("threadtest4.c: main process returning...\n");
    return 0;
}

