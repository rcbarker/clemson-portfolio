/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   mythreads.c
   
   Purpose: Threading library containing numerous functions for creating and
            manipulating concurrent threads in user mode. 
 */

/* Destructor function for list ADT */
void __attribute__ ((destructor)) destruct(void);

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "mythreads.h"

/* Global Constants */
#define TRUE 1
#define FALSE 0

/* Add #define DEBUG below this line to enable debugging printfs */


/* Structures, enums, and typedefs */
enum thread_state { RUNNING, PAUSED, DONE };
typedef struct thread_list_node_tag {
    enum thread_state state;
    int t_id;
    ucontext_t context;
    void *result;
    struct thread_list_node_tag *next;
} thread_list_node_t;

typedef struct condition_var_tag {
    int cond_lock;
    struct thread_list_node_tag *waiting;
} cond_t;

/* Global Variables */
int interruptsAreDisabled = FALSE;
thread_list_node_t *thread_list;
int thread_locks[NUM_LOCKS];
cond_t condition_vars[NUM_LOCKS][CONDITIONS_PER_LOCK];

/* Function Name: interruptDisable
   Input value(s): None.
   Return value(s): None.
   Purpose: Disables interrupts.
 */
static void interruptDisable () 
{
    assert(!interruptsAreDisabled);
    interruptsAreDisabled = TRUE;
}

/* Function Name: interruptEnable
   Input value(s): None.
   Return value(s): None.
   Purpose: Enables interrupts.
 */
static void interruptEnable () 
{
    assert(interruptsAreDisabled);
    interruptsAreDisabled = FALSE;
}

/* Function Name: destruct
   Input value(s): None.
   Return value(s): None.
   Purpose: Destroys thread_list and frees all allocated stacks before library is closed 
            to prevent leaks. 
 */
void destruct(void)
{
    /* Go through linked list and free each entry */
    thread_list_node_t *Rover = thread_list;
    thread_list_node_t *temp = NULL;

    do {
        temp = Rover->next;
        /* Free stack pointers, but don't free main context's stack pointer */
        if(Rover != thread_list) free(Rover->context.uc_stack.ss_sp);
        free(Rover);
        Rover = temp;
    } while(Rover != thread_list);
}

/* Function Name: threadInit
   Input value(s): None.
   Return value(s): None.
   Purpose: Initializes data structures and global variables for thread library. Only meant
            to be called once.
 */ 
void threadInit()
{
    /* Disable interrupts */
    interruptDisable();

    /* Initialize thread list to be circular and include main context with thread id zero */
    thread_list = malloc(sizeof(thread_list_node_t));
    thread_list->t_id = 0;
    thread_list->state = RUNNING;
    if(getcontext(&(thread_list->context)) == -1) perror("getcontext");
    thread_list->result = NULL;
    thread_list->next = thread_list; 
 
    #ifdef DEBUG
        printf("mythreads.c: threadInit - main thread id = %d\n", thread_list->t_id);
    #endif

    /* Synchronization Initializations below */
    int i, j;
    /* Initialize locks and condition variables to unlocked */
    for(i = 0; i < NUM_LOCKS; ++i) {
        thread_locks[i] = FALSE;
        for(j = 0; j < CONDITIONS_PER_LOCK; ++j) {
            condition_vars[i][j].cond_lock = FALSE;
            condition_vars[i][j].waiting = NULL;
        }
    }

    /* Re-enable interrupts */
    interruptEnable();
}

/* ------------------------------- Thread Management Functions ------------------------------- */

/* Function Name: func_handler
   Input value(s): funcPtr, function to be run by thread.
                       argPtr, pointer to arguments for function 
                       to be run by thread.
                   thread, address of the block in the thread
                       list for the thread.
   Return value(s): None.
   Purpose: Function run by each thread. Does two things:
            1.) Runs funcPtr(argPtr) in thread.
            2.) Calls threadExit to destroy thread.
 */ 
void func_handler(thFuncPtr funcPtr, void *argPtr)
{
    #ifdef DEBUG
        /* Find currently running thread */
        thread_list_node_t *thread = thread_list;
        while(thread->state != RUNNING) thread = thread->next;
        assert(thread != thread_list);

        printf("mythreads.c: func_handler - thread %d about to run function\n", thread->t_id);
    #endif

    /* Call thread function and store return in result */
    void *result = funcPtr(argPtr);

    #ifdef DEBUG
        printf("mythreads.c: func_handler - thread %d returned from t1\n", thread->t_id);
    #endif

    /* Thread has finished - Call threadExit */
    threadExit(result);
}

/* Function Name: threadCreate
   Input value(s): funcPtr, function to be run by new thread.
                   argPtr, pointer to arguments for function to be 
                       run by new thread.
   Return value(s): thread_id, the identifier for the new thread.
   Purpose: Creates a new thread with stack size STACK_SIZE that runs funcPtr
            with arguments pointed to by argPtr and runs it. 
            
            Also inserts the new thread's information into the threadlist 
            for future reference in other functions.
 */ 
int threadCreate(thFuncPtr funcPtr, void *argPtr)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Find currently running thread */
    thread_list_node_t *current_thread = thread_list;
    while(current_thread->state != RUNNING) current_thread = current_thread->next; 

    /* Update state of current thread - About to start running new thread after it is
       created */
    current_thread->state = PAUSED;

    /* Increment thread_id to be assigned */
    static int thread_id = 0;
    thread_id++;

    /* Make context for new thread by using current context as a starting point */
    ucontext_t new_thread;
    if(getcontext(&new_thread) == -1) perror("getcontext");
    new_thread.uc_stack.ss_sp = malloc(STACK_SIZE);
    new_thread.uc_stack.ss_size = STACK_SIZE;    
    new_thread.uc_stack.ss_flags = 0;

    makecontext(&new_thread, (void (*) (void)) func_handler, 2, funcPtr, argPtr);

    /* Make and initialize new node for thread list */
    thread_list_node_t *new_node = malloc(sizeof(thread_list_node_t));
    new_node->t_id = thread_id;
    new_node->state = RUNNING;
    new_node->context = new_thread;
    new_node->result = NULL;
    new_node->next = thread_list;

    /* Insert new node into back of thread list */
    thread_list_node_t *Rover = thread_list;
    while(Rover->next != thread_list) Rover = Rover->next;
    Rover->next = new_node;

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();

    #ifdef DEBUG
        printf("mythreads.c: threadCreate - new thread id = %d\n", thread_id);
    #endif

    /* Swap into new context */
    swapcontext(&(current_thread->context), &(new_node->context));

    return thread_id;
}

/* Function Name: threadYield
   Input value(s): None.
   Return value(s): None.
   Purpose: Yields currently running thread to the next paused thread.
 */ 
void threadYield()
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Find currently running thread */
    thread_list_node_t *thread = thread_list;
    while(thread->state != RUNNING) thread = thread->next; 


    /* Find next thread to run */
    thread_list_node_t *next_thread = thread;
    do {
        next_thread = next_thread->next;
    } while(next_thread->state == DONE);

    /* Update states */
    thread->state = PAUSED;
    next_thread->state = RUNNING;

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();

    #ifdef DEBUG
        printf("mythreads.c: threadYield - about to swap out of thread %d into thread %d\n", 
                thread->t_id, next_thread->t_id);
    #endif
    
    /* Swap to next thread */
    swapcontext(&(thread->context), &(next_thread->context));
}

/* Function Name: threadJoin
   Input value(s): thread_id, the id of the thread for the calling thread to wait on.
                   result, the address of the pointer to place the results of the thread
                       being waited on once it finishes. 
   Return value(s): None.
   Purpose: Blocks the calling thread until the specified thread finishes.
 */ 
void threadJoin(int thread_id, void **result)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Find thread to wait on */
    thread_list_node_t *thread_to_wait = thread_list;
    while(thread_to_wait->t_id != thread_id) thread_to_wait = thread_to_wait->next;

    /* Block until thread is done */
    while(thread_to_wait->state != DONE) threadYield();

    /* If result is non-NULL, fill with thread's result */
    if(result != NULL) *result = thread_to_wait->result;

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();
}

/* Function Name: threadExit
   Input value(s): result, the return of the function run by the thread that is exiting.
   Return value(s): None.
   Purpose: Exits the currently running thread. If this is called on the main thread, the
            program terminates. The next thread to run is the next available paused thread.
 */ 
void threadExit(void *result) 
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Find currently running thread */
    thread_list_node_t *thread = thread_list;
    while(thread->state != RUNNING) thread = thread->next;

    /* Check if calling thread is main process. Exit if so */
    if(thread == thread_list) exit(0);

    /* Find next thread to run */
    thread_list_node_t *next_thread = thread;
    do {
        next_thread = next_thread->next;
    } while(next_thread->state == DONE);

    /* If this was the last running thread, set next thread to main thread */
    if(next_thread == thread) next_thread = thread_list;

    /* Thread is exiting - Set thread state to done and store result. Also, set next thread
       state to running */
    thread->result = result;
    thread->state = DONE;
    next_thread->state = RUNNING;

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();

    #ifdef DEBUG 
        printf("mythreads.c: threadExit - thread %d exiting. Next thread = %d\n", 
                thread->t_id, next_thread->t_id);
    #endif
    
    /* Switch context into next thread */
    setcontext(&(next_thread->context));
}

/* -------------------------------- Synchronization Functions -------------------------------- */

/* Function Name: threadLock
   Input value(s): lockNum, the lock number to be locked (Not the lock itself).
   Return value(s): None.
   Purpose: Causes calling thread to block until it can acquire the lock specified by
            lockNum and allows the thread to then take it. Beware: This function does not 
            protect against deadlock.
 */ 
void threadLock(int lockNum)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Block until specified lock is open */
    while(thread_locks[lockNum]) threadYield();

    /* Lock the lock */
    thread_locks[lockNum] = TRUE;

    #ifdef DEBUG
        printf("mythreads.c: threadLock - locked lock %d\n", lockNum);
    #endif

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();
}

/* Function Name: threadUnlock
   Input value(s): lockNum, the lock number to be unlocked (Not the lock itself).
   Return value(s): None.
   Purpose: Causes the calling thread to unlock the specified lock. If the lock is already
            unlocked, nothing happens.
 */ 
void threadUnlock(int lockNum)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Unlock the lock */
    thread_locks[lockNum] = FALSE;

    #ifdef DEBUG
        printf("mythreads.c: threadUnlock - unlocked lock %d\n", lockNum);
    #endif

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();
}

/* Function Name: threadWait
   Input value(s): lockNum, the lock number associated with the condition variable.
                   conditionNum, the condition variable number to be waited on.
   Return value(s): None.
   Purpose: Assuming that the lock specified is locked, the calling thread waits on the
            specified condition variable to be signalled. If the lock is unlocked, 
            an error is printed and the program stops.
 */ 
void threadWait(int lockNum, int conditionNum)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable(); 

    /* Ensure lock is locked */
    if(!thread_locks[lockNum]) {
        fprintf(stderr, "error: condition variable %d called for unlocked lock %d\n",
                conditionNum, lockNum);
        exit(0);
    }

    /* Find currently running thread */
    thread_list_node_t *thread = thread_list;
    while(thread->state != RUNNING) thread = thread->next;

    /* Unlock the lock and initialize the condition variable */
    thread_locks[lockNum] = FALSE;
    condition_vars[lockNum][conditionNum].cond_lock = FALSE;
    condition_vars[lockNum][conditionNum].waiting = thread; 

    #ifdef DEBUG
        printf("mythreads.c: threadWait - thread %d about to wait on condition variable %d for "
               "lock %d\n", thread->t_id, conditionNum, lockNum);
    #endif

    /* Block until condition variable is signalled for lock */
    while(!condition_vars[lockNum][conditionNum].cond_lock) threadYield();

    /* Reset condition variable */
    condition_vars[lockNum][conditionNum].cond_lock = FALSE;
    condition_vars[lockNum][conditionNum].waiting = NULL; 

    /* Reacquire lock */
    thread_locks[lockNum] = TRUE;

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();
}

/* Function Name: threadSignal
   Input value(s): lockNum, the lock number associated with the condition variable.
                   conditionNum, the condition variable number to be signalled.
   Return value(s): None.
   Purpose: Signals the condition variable specified for the lock specified. If nothing is
            waiting on this condition variable, nothing occurs.
 */ 
void threadSignal(int lockNum, int conditionNum)
{
    /* Disable interrupts if not already disabled */
    if(!interruptsAreDisabled) interruptDisable();

    /* Only do anything if a thread is waiting on this condition variable */
    if(condition_vars[lockNum][conditionNum].waiting != NULL) {
        /* Signal the condition variable */
        condition_vars[lockNum][conditionNum].cond_lock = TRUE;

        /* Find currently running thread */
        thread_list_node_t *thread = thread_list;
        while(thread->state != RUNNING) thread = thread->next;

        #ifdef DEBUG
            printf("mythreads.c: threadSignal - thread %d signalled condition variable %d for "
                   "thread %d\n", thread->t_id, conditionNum, 
                   condition_vars[lockNum][conditionNum].waiting->t_id);
        #endif

        /* Swap into thread waiting on condition variable */
        thread->state = PAUSED;
        condition_vars[lockNum][conditionNum].waiting->state = RUNNING;

        swapcontext(&(thread->context), 
                    &(condition_vars[lockNum][conditionNum].waiting->context));
    }

    /* Re-enable interrupts if not already enabled */
    if(interruptsAreDisabled) interruptEnable();
}
