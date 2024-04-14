# makefile for MP6
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

all : lab6 graphtest

lab6 : graph.o heap.o lab6.o
	$(comp) $(comp_flags) graph.o heap.o lab6.o -o lab6 $(comp_libs)

graphtest : graph.o heap.o graphtest.o
	$(comp) $(comp_flags) graph.o heap.o graphtest.o -o graphtest $(comp_libs)

graph.o : graph.c graph.h
	$(comp) $(comp_flags) -c graph.c

heap.o : heap.c heap.h
	$(comp) $(comp_flags) -c heap.c

lab6.o : lab6.c graph.h
	$(comp) $(comp_flags) -c lab6.c

graphtest.o : graphtest.c graph.h
	$(comp) $(comp_flags) -c graphtest.c

clean :
	rm -f *.o lab6 graphtest core

