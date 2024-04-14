/* NAME:    Ryan Barker
   COURSE:  ECE 2730
   SECTION: 005
   DATE:    03-26-2014
   FILE:    fibonacci.s
   PURPOSE: Fibonacci Sequence Generator Function
*/

/* begin assembly stub */

.globl Fib
.type Fib,@function

Fib:
     /* prolog */
     pushl %ebp # Push base pointer to stack to prep function Fib
     pushl %ebx # Push reg B to stack to prep function Fib
     movl %esp, %ebp # Move the current position in the stack to the SBP
     subl $8, %esp # Make room in the stack for 2 integer local variables
     
     /* put code here */
     movl global_var, %eax # Store global_var in reg A
     movl %eax, -4(%ebp) # Move reg A into the first local variable, local_var

     cmpl $0, -4(%ebp) # Compare local_var and 0
     je return # return if = 0

     cmpl $1, -4(%ebp) # Compare local_var and 1
     je return # return if = 1

     movl -4(%ebp), %eax # Move local_var to reg A
     subl $1, %eax # Decrement reg A by one
     movl %eax, global_var # Move local_var - 1 into global_var

     call Fib # Recursively call Fib

     movl global_var, %eax # Store global_var in reg A
     movl %eax, -8(%ebp) # Store global_ar into second local variable, temp_var

     movl -4(%ebp), %eax # Move local_var to reg A
     subl $2, %eax # Decrement reg A by two
     movl %eax, global_var # Move local_var - 2 into global_var

     call Fib # Recusively call Fib

     movl global_var, %eax # Move global_var into reg A
     movl -8(%ebp), %ebx # Move temp_var into reg B
     addl %ebx, %eax # Move global_var + temp_var to reg A
     movl %eax, global_var # Move global_var + temp_var into global_var
     jmp return # End code

     return:
  
     /* epilog */
     movl %ebp, %esp # Move the stack pointer back to base for function end
     popl %ebx # Pop reg B to stack for function end
     popl %ebp # Pop the base pointer for function end
     ret

/* end assembly stub */
