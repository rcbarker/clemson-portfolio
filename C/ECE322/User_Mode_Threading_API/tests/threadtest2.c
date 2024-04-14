//threadtest.c

#include <stdio.h>
#include <stdlib.h>
#include "mythreads.h"

void *t1 (void *arg) 
{
	printf("threadtest2.c: thread 1 about to yeild...\n");
	threadYield();

        printf("threadtest2.c: thread 1 signaling lock zero for main process...\n");
        threadSignal(0, 0);

	printf("threadtest2.c: thread 1 returning...\n");

	return arg;
}

int main(void)
{
    printf("threadtest2.c: threadWait/threadSignal testing\n");

    int p1;

    p1 = 23;

    /* Initialize the threading library. */
    threadInit();   

    /* Create a threads */
    threadCreate(t1, &p1);

    /* Wait for threadCreate thread to signal condition variable */
    printf("threadtest2.c: locking lock zero...\n");
    threadLock(0);
    printf("threadtest2.c: about to wait on lock zero...\n");
    threadWait(0, 0);

    printf("threadtest2.c: main process returning...\n");
    return 0;
}

