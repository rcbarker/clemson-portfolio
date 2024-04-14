CC= gcc
CFLAGS= -Wall -g

OBJS= mythreads.o
LIBS= libmythreads.a
TESTS= threadtest1 threadtest2 threadtest3 threadtest4

all: $(OBJS) $(LIBS) test

mythreads.o: mythreads.c
	$(CC) $(CFLAGS) -c mythreads.c

libmythreads.a: mythreads.o
	ar -cvr libmythreads.a mythreads.o

test: libmythreads.a ./tests/threadtest1.c ./tests/threadtest2.c ./tests/threadtest3.c ./tests/threadtest4.c
	$(CC) $(CFLAGS) -o threadtest1 ./tests/threadtest1.c libmythreads.a
	$(CC) $(CFLAGS) -o threadtest2 ./tests/threadtest2.c libmythreads.a
	$(CC) $(CFLAGS) -o threadtest3 ./tests/threadtest3.c libmythreads.a
	$(CC) $(CFLAGS) -o threadtest4 ./tests/threadtest4.c libmythreads.a

clean:
	rm -f $(OBJS) $(LIBS) $(TESTS) core
 
