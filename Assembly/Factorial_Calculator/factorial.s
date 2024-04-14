/* NAME:    Ryan Barker
   COURSE:  ECE 2730
   SECTION: 005
   DATE:    04-02-2014
   FILE:    factorial.s
   PURPOSE: Factorial function that takes in a number n and returns n!.
/*

/* begin assembly stub */

.globl Factorial
.type Factorial, @function

/* put assembler directives here */
Factorial:
     /* prolog */
     pushl %ebp # Push base pointer to stack to prep function Fib
     pushl %ebx # Push reg B to stack to prep function Fib
     movl %esp, %ebp # Move the current position in the stack to the SBP
     subl $4, %esp # Allocate space for one integer local variable

     /* put code here */
     movl 12(%ebp), %ecx # Store input value for function in register C

     cmpl $0, %ecx # Compare input to 0
     jne If1Or # Jump if n != 0
     movl $1, %eax # Store return value of 1
     jmp return

If1Or:
     cmpl $1, %ecx # Compare input to 1
     jne If1Else # Jump if n != 1
     movl $1,  %eax # Store return value of 1
     jmp return

If1Else:
     movl %ecx, -4(%ebp) # Store input locally for next function call
     subl $1, %ecx # Decrement Reg C by one
     pushl %ecx # Push reg C so Factorial may be called with it
     call Factorial # Call factorial function with n-1
     movl -4(%ebp), %ecx # Place original input back in reg C
     mull %ecx # Multiply the return of Factorial (Was stored in reg A) by input

     jmp return

     return:
     /* epilog */
     movl %ebp, %esp # Move the stack pointer back to base for function end
     popl %ebx # Pop reg B to stack for function end
     popl %ebp # Pop the base pointer for function end
     ret

/* end assembly stub */
