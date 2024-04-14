CC= gcc
CFLAGS= -Wall -g

BINS= lab3 listtest
OBJS= lab3.o list.o soc_support.o listtest.o

all: $(BINS) 

lab3: list.o soc_support.o lab3.o
	$(CC) $(CFLAGS) list.o soc_support.o lab3.o -o lab3

list.o: list.c datatypes.h list.h
	$(CC) $(CFLAGS) -c list.c

soc_support.o: soc_support.c datatypes.h list.h soc_support.h
	$(CC) $(CFLAGS) -c soc_support.c

lab3.o: lab3.c datatypes.h list.h soc_support.h
	$(CC) $(CFLAGS) -c lab3.c

listtest: listtest.o list.o soc_support.o
	$(CC) $(CFLAGS) list.o soc_support.o listtest.o -o listtest

listtest.o: listtest.c datatypes.h list.h soc_support.h
	$(CC) $(CFLAGS) -c listtest.c

clean:
	rm -f $(BINS) $(OBJS) core

