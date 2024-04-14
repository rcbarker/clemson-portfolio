/* NAME: Ryan Barker
   COURSE: ECE 273
   SECTION: 5
   DATE: 03-12-2014
   FILE: atoi.s
*/

.globl AtoI
.type AtoI,@function
AtoI:
     /* prolog */
     pushl %ebp
     movl %esp, %ebp
     pushl %ebx
     pushl %esi
     pushl %edi

     /* put code here */
     movl $1, sign # Initialize sign to one

while1:
     movl ascii, %eax # move address ascii into reg A
     cmpb $32, (%eax) # compare *ascii to ' '
     jne while1cond2 # check next condition if *ascii != ' '
     addl $1, ascii # increment ascii address by one
     jmp while1 # jump back to beginning of loop

while1cond2:
    movl ascii, %eax # move ascii into reg A
    cmpb $9, (%eax) # compare *ascii to '\t'
    jne breakwhile1 # break loop if *ascii != '\t'
    addl $1, ascii # increment ascii address by one
    jmp while1 # jump back to beginining of loop

breakwhile1:
    movl ascii, %eax # move address ascii into reg A
    cmpb $43, (%eax) # compare reg A to '+'
    jne else1 # jump to else if *ascii != '+'
    addl $1, ascii # increment ascii address by one
    jmp breakif1 # jump outside of if statement 1

else1:
    movl ascii, %eax # move address ascii into reg A
    cmpb $45, (%eax) # compare reg A to '-'
    jne breakif1 # jum pout of if statement if *ascii != '-'
    movl $-1, sign # change sign to negative
    addl $1, ascii # increment ascii address by one
    jmp breakif1 # continue in code

breakif1:
    movl intptr, %eax # move intptr into reg A
    movl $0, (%eax) # move 0 into *intptr
    movl $0, i # set i = 0
    jmp for1 # continue in code

for1:
    movl i, %edi # move i into an index register
    movl ascii, %ebx # move ascii into reg B
    movl $0, %eax # store 0 in reg A

    movb (%ebx, %edi, 1), %al # moves ascii[i] into al
    cmpb $48, %al # compares ascii[i] to '0'
    jl breakfor1 # jump out of for loop if ascii[i] < '0'
    cmpb $57, %al # compares ascii[i] to '9'
    jg breakfor1 # jump out of for loop if ascii[i] > '9'
    addl $1, i # increment i
    jmp for1 # jump to continue for loop 1

breakfor1:
    addl $-1, i # decrement i by one
    movl $1, multiplier # set multiplier = 1
    jmp for2 # continue in code

for2:
    cmp $0, i # compare i to zero
    jl breakfor2 # jump out of loop if i < 0

    movl $0, %ecx # store 0 in reg C
    movl i, %edi # move i into index register
    movl ascii, %ebx # move ascii to reg B
    movl $0, %eax # store 0 in reg A
    movb (%ebx, %edi, 1), %al # move ascii[i] into reg A

    subb $48, %al  # ascii[i] - '0' store in reg A
    mull multiplier # (ascii[i] - '0') * multiplier in reg A
    movl intptr, %ebx # move intptr into reg B
    addl %eax, (%ebx) # increment *intptr by reg A

    movl multiplier, %eax # move multiplier into reg A
    movl $10, %edx # move 10 into reg D
    mull %edx # multiplier * 10 in reg A
    movl %eax, multiplier # store back into multiplier

    addl $-1, i # decrement i by one
    jmp for2 # continue for loop

breakfor2:
    movl intptr, %ebx # move address intptr into reg B
    movl (%ebx), %eax # dereference intptr and move into reg A
    mull sign # multiply *intptr by sign and store in reg A
    movl %eax, (%ebx) # move result into *intptr

    jmp return

return:
     /* epilog */
     popl %edi
     popl %esi
     popl %ebx
     movl %ebp, %esp
     popl %ebp
     ret

/* end assembly stub */
