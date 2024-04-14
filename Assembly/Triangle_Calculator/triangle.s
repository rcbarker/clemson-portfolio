/* NAME:    Ryan Barker
   COURSE:  ECE 273
   SECTION: 005
   DATE:    02-19-2014
   FILE:    triangle.s
   PURPOSE: Classifies triangles as not a triangle,
            scalene traingle, isosceles triangle, or
            equilateral triangle using if statements.
*/

/* begin assembly stub */
.globl classify
.type classify,@function
classify:
     /* prolog */
     pushl %ebp
     pushl %ebx
     movl %esp, %ebp

     /* put code here */

     # Header: if (i == 0 || j == 0 || k == 0):
     movl i, %eax # move i to reg a
     cmpl $0, %eax # compare i and 0
     jne continue # jump if i ~= 0
     movl  $0, tri_type # set tri_type = 0
     jmp return

continue:
     movl j, %eax # move j to reg a
     cmpl $0, %eax # compare j and 0
     jne continue2 # jump if j ~= 0
     movl $0, tri_type # set tri_type = 0
     jmp return

continue2:
     movl k, %eax # move k to reg a
     cmpl $0, %eax # compare k and 0
     jne continue3 # jump if k ~= 0
     movl $0, tri_type # set tri_type = 0
     jmp return

continue3:
     movl $0, match # set match = 0

     # Header: if (i == j):
     movl i, %eax # move i to reg a
     cmpl j, %eax # compare i and j
     jne continue4 # jump if i ~= j
     movl match, %eax # move match to reg a
     addl $1, %eax # adds match and 1 and stores in reg a
     movl %eax, match # move match + 1 to match
     jmp continue4 # move to continue code

continue4:
     # Header: if (i == k):
     movl i, %eax # move i to reg a
     cmpl k, %eax # compare i and k
     jne continue5 # jump if i ~= k
     movl match, %eax # move match to reg a
     addl $2, %eax # adds match and 2 and stores in reg a
     movl %eax, match # move match + 2 to match
     jmp continue5 # move to continue code

continue5:
     # Header: if (j == k):
     movl j, %eax # move j to reg a
     cmpl k, %eax # compare j to k
     jne continue6 # jump if j ~= k
     movl match, %eax # move match to reg a
     addl $3, %eax # adds match and 3 and stores in reg a
     movl %eax, match # move match + 3 to match
     jmp continue6 # move to continue code

continue6:
     # Header: if(match):
     movl match, %eax # move match to reg a
     cmpl $0, %eax # compare match and 0
     je breaknested # jump if match = 0

     # Header: if(match == 1):
     movl match, %eax # move match to reg a
     cmpl $1, %eax # compare match and 1
     jne match1else # jump if match ~= 1

     # Header: if((i+j) <= k):
     movl i, %eax # move i into reg a
     addl j, %eax # i + j in reg a
     cmpl k, %eax # compare i + j and k
     jg match1else # jump if (i + j) > k
     movl $0, tri_type # set tri type to 0
     jmp return

match1else:
     # Header: if(match != 2):
     movl match, %eax # move match to reg a
     cmpl $2, %eax # compare match to 2
     je matchne2else # jump if match equal 2

     # Header: if(match == 6):
     movl match, %eax # move match to reg a
     cmpl $6, %eax # compare match to 6
     jne match6else # jump if match not eqaul to 6
     movl $1, tri_type # set tri type to 1
     jmp return

match6else:
     # Header: if((j+k) <= i):
     movl j, %eax # move j into reg a
     addl k, %eax # j + k in reg a
     cmpl i, %eax # compare j + k and i
     jg matchne2else # jump if (j + k) > i
     movl $0, tri_type # set tri type to 0
     jmp return

matchne2else:
     # Header: if((i+k) < = j)
     movl i, %eax # move i into reg a
     addl k, %eax # add i + k in reg a
     cmpl j, %eax # compare (i+k) and j
     jg matchexist # jump if (i+k) > j
     movl $0, tri_type # set tri type to 0
     jmp return

matchexist:
     movl $2, tri_type # set tri type to 2
     jmp return

breaknested:
     # Header: if((i+j) <= k || (j+k) <= i || (i+k) <= j)
     movl i, %eax # move i into reg a
     addl j, %eax # i + j in reg a
     cmpl k, %eax # compare (i + j) and k
     jg continue7 # jump if (i + j) > k
     movl $0, tri_type # set tri type to zero
     jmp return

continue7:
     movl j, %eax # move j into reg a
     addl k, %eax # j + k in reg a
     cmpl i, %eax # compare (j + k) and i
     jg continue8 # jump if (j + k) > i
     movl $0, tri_type # set tri type to zero
     jmp return

continue8:
     movl i, %eax # move i into reg a
     addl k, %eax # i + k in reg a
     cmpl j, %eax # compare (i + k) and j
     jg continue9 # jump if (i + k) > j
     movl $0, tri_type # set tri type to zero
     jmp return

continue9:
     movl $3, tri_type # set tri type to 3
     jmp return

return:
     /* epilog */
     movl %ebp, %esp
     popl %ebx
     popl %ebp
     ret

/* declare variables here */
.comm match, 4

/* end assembly stub */
