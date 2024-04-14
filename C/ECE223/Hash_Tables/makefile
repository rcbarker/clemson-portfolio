# makefile for MP7
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

all : lab7 tabletest

lab7 : table.o lab7.o
	$(comp) $(comp_flags) table.o lab7.o -o lab7 $(comp_libs)

tabletest : table.o tabletest.o
	$(comp) $(comp_flags) table.o tabletest.o -o tabletest $(comp_libs)

table.o : table.c table.h
	$(comp) $(comp_flags) -c table.c

lab7.o : lab7.c table.h
	$(comp) $(comp_flags) -c lab7.c

tabletest.o : tabletest.c table.h
	$(comp) $(comp_flags) -c tabletest.c

clean :
	rm -f *.o lab7 tabletest core

