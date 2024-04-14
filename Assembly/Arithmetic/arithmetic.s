/*  NAME: Ryan Barker
    COURSE: ECE 273
    SECTION: 005
    DATE: 02-05-2014
    FILE: arithmetic.s
    PURPOSE: Demonstrate use of basic addition, subtraction,
             multiplication, and division operators. 
*/

/* begin assembly stub */
.globl dodiff
.type dodiff, @function
dodiff:
     /* does (digit1)^2 + (digit2)^2 - (digit3)^2 */

     /* prolog */
     pushl %ebp
     pushl %ebx
     movl %esp, %ebp

     /* put code here */
     movl digit1, %eax # move digit 1 to reg A
     mull %eax # (digit1)^2 store in reg A

     movl %eax, %ebx # move (digit1)^2 to reg B
     movl digit2, %eax # move digit2 to reg A
     mull %eax # (digit2)^2 store in reg A

     addl %eax, %ebx # (digit1)^2 + (digit2)^2) store in reg B

     movl digit3, %eax # move digit3 to reg A
     mull %eax # (digit3)^2 store in reg A

     subl %eax, %ebx # (digit1)^2 + (digit2)^2 - (digit3)^2 store in reg B

     movl %ebx, diff # move result to diff

     /* epilog */
     movl %ebp, %esp
     popl %ebx
     popl %ebp
     ret

.globl dosumprod
.type dosumprod, @function

dosumprod:
     /* does digit1 + digit2 + digit3 and digit1 * digit2 * digit3 */

    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /* put code here */
    movl digit1, %eax # move digit1 to reg A

    addl digit2, %eax # digit1 + digit2 store in reg A
    addl digit3, %eax # digit1 + digit2 + digit3 store in reg A

    movl %eax, sum # move result to sum

    movl digit1, %eax # move digit1 to reg A

    mull digit2 # digit1 * digit2 store in reg A
    mull digit3 # digit1 * digit2 * digit3 store in reg A

    movl %eax, product # move result to product

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret


.globl doremainder
.type doremainder, @function
doremainder:
     /* does product/sum */

    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /* put code here */
    movl $0, %edx # clear reg D for division
    movl product, %eax # move product to reg A
    movl sum, %ebx # move sum to reg A

    divl %ebx # product % sum store in reg D

    movl %edx, rmdr # move result to remainder

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/* declare variables here */
.comm digit1,4
.comm digit2,4
.comm digit3,4
.comm diff,4
.comm sum,4
.comm product,4
.comm rmdr,4

/* end assembly stub */
