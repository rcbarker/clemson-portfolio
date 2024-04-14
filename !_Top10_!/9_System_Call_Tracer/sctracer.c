/* Ryan Barker
   ECE 3220 - Operating Systems
   Spring 2015, Section 2
   sctracer.c
   
   Purpose: This file takes runs a program specified in the command line and
            records the number of system calls it makes to an output file also
            specified in the command line. System calls are intercepted via 
            ptrace.
 */

#include <sys/ptrace.h>
#include <sys/reg.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#define TRUE 1
#define FALSE 0

typedef struct syscall_list_tab {
    int syscall_num;
    int multiplicity;
    struct syscall_list_tab *next;
} syscall_list_node;
int on_call = TRUE;


int syscalls_occur(pid_t child);
void list_insert(syscall_list_node **list_ptr, int syscall_num);
void list_destruct(syscall_list_node *list_ptr);

int main(int argc, char **argv) 
{
    /* Print usage error if no program and/or output file specified */
    if(argc < 3) {
        fprintf(stderr, "Usage: specify program to run and output file.\n");
        exit(1);
    } 

    /* Separate input string by spaces - Determine number of words */
    int chr, num_words = 0;
    for(chr = 0; argv[1][chr] != '\0'; ++chr) 
        if(argv[1][chr] == ' ') num_words++;
   
    /* One more word than the number of spaces */
    num_words++;

    /* Call strok to separate string */
    char *cmd[num_words + 1];
    char *str = strtok(argv[1], " ");
    for(chr = 0; str != NULL; ++chr) {
        cmd[chr] = str;
        str = strtok(NULL, " ");
    }
    cmd[num_words] = NULL;

    /* Fork into two processes */
    pid_t child = fork();
    if (child == 0) {
        /* Child process - Set up to be traced */
        ptrace(PTRACE_TRACEME);

        /* Stop child process to allow parent process to get ready for trace */
        kill(getpid(), SIGSTOP);

        /* Use execvp to execute user-specified process */
        execvp(cmd[0], cmd);

        /* Print error if execvp fails */
        perror("execvp failed");
    } else {
        /* Parent process - Will trace child */
        int status, syscall_num;
        syscall_list_node *syscall_list = NULL;

        /* Wait for child process to stop itself */
        waitpid(child, &status, 0);

        /* Set trace to distinguish normal system calls from traps */
        ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD);

        /* While system calls are occurring, get each syscall number and
           store into a linked list which accounts for multiplicity.
         */
        while(syscalls_occur(child)) {
            if(on_call) {
                syscall_num = ptrace(PTRACE_PEEKUSER, child, 
                                     sizeof(long)*ORIG_RAX, NULL);
                list_insert(&syscall_list, syscall_num);

                on_call = FALSE;
            } else on_call = TRUE;
        }   

        /* Output system calls to specified file */
        FILE *output = fopen(argv[2], "w");
        syscall_list_node *Rover = syscall_list;
        while(Rover != NULL) {
            fprintf(output, "%d\t%d\n", Rover->syscall_num, Rover->multiplicity);
            Rover = Rover->next;
        }

        /* Close output file and destruct linked list */
        fclose(output);
        list_destruct(syscall_list);
    }

    return 0;
}

/* Function Name: syscalls_occur
   Input value(s): child, the process ID of the child process of main.
   Return value(s): TRUE, if a system call in the child process hasn't been 
                    traced yet.
                    FALSE, if all system calls in the child have been traced 
                    and it has exited.
   Purpose: Checks the child process for each system call it makes during
            the ptrace and returns a boolean value to indicate whether a
            system call happened in the child process or not.
 */ 
int syscalls_occur(pid_t child)
{
    int status;
    do{
        /* Set up the trace to interrupt the child at the next system call */
        ptrace(PTRACE_SYSCALL, child, 0, 0);
            
        /* Wait for the child's status to change */
        waitpid(child, &status, 0);

        /* If the child exits, no more system calls. Return false */
        if (WIFEXITED(status)) return FALSE;
    } while(!(WIFSTOPPED(status) && WSTOPSIG(status) & 0x80));

    /* If process stops or bit seven is set in status, a syscall happened.
       Return true */
    return TRUE;
}

/* Function Name: list_insert
   Input value(s): list_ptr, a pointer to the head of the system call list.
                   syscall_num, the number of the system call being inserted 
                   into the system call list.
   Return value(s): none
   Purpose: Inserts the system call syscall_num into the sorted linked list
            of system calls. The list never inserts a system call twice, and
            instead increments a multiplicity stat for repeated calls.
 */ 
void list_insert(syscall_list_node **list_ptr, int syscall_num) 
{
    if(*list_ptr == NULL) {
        /* If empty list, insert as first node */
        syscall_list_node *first_node = malloc(sizeof(syscall_list_node));
        first_node->syscall_num = syscall_num;
        first_node->multiplicity = 1;
        first_node->next = NULL;

        *list_ptr = first_node;
    } else {
        /* General case */
        syscall_list_node *Rover = *list_ptr;
        syscall_list_node *Previous = NULL;

        /* Search list for syscall_num */
        while(Rover != NULL && Rover->syscall_num < syscall_num) {
            Previous = Rover;
            Rover = Rover->next;
        }

        if(Rover != NULL && Rover->syscall_num == syscall_num) {
            /* Already exists in list - increment multiplicity */
            Rover->multiplicity++;
        } else if(Previous == NULL) {
            /* New node goes at the beginning at the list */
            syscall_list_node *new_node = malloc(sizeof(syscall_list_node));
            new_node->syscall_num = syscall_num;
            new_node->multiplicity = 1;

            new_node->next = *list_ptr;
            *list_ptr = new_node;
        } else {
            /* New node goes somewhere else in list */
            syscall_list_node *new_node = malloc(sizeof(syscall_list_node));
            new_node->syscall_num = syscall_num;
            new_node->multiplicity = 1;

            new_node->next = Rover;
            Previous->next = new_node;
        }
    }
}

/* Function Name: list_destruct
   Input value(s): list_ptr, a pointer to the head of the system call list.
   Return value(s): none
   Purpose: Destroys system call list at close of program to prevent memory
            leaks.
 */ 
void list_destruct(syscall_list_node *list_ptr)
{
    /* Go through linked list and free each entry */
    syscall_list_node *Rover = list_ptr;
    syscall_list_node *temp = NULL;

    while(Rover != NULL) {
        temp = Rover->next;
        free(Rover);
        Rover = temp;
    }
}
