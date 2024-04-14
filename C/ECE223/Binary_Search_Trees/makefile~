# makefile for MP5
# Version: 1
#
# -lm is used to link in the math library
#
# -Wall turns on all warning messages 
#
# add the library malloc and include malloc.h so we can call mallinfo
#
comp = gcc
comp_flags = -g -Wall 
comp_libs = -lm  
#comp = cc

all: lab5 bsttest

lab5 : bst.o lab5.o
	$(comp) $(comp_flags) bst.o lab5.o -o lab5 $(comp_libs)

bsttest : bst.o bsttest.o
	$(comp) $(comp_flags) bst.o bsttest.o -o bsttest $(comp_libs)

bst.o : bst.c bst.h
	$(comp) $(comp_flags) -c bst.c

lab5.o : lab5.c bst.h
	$(comp) $(comp_flags) -c lab5.c

bsttest.o : bsttest.c bst.h
	$(comp) $(comp_flags) -c bsttest.c

clean :
	rm -f *.o lab5 bsttest core

