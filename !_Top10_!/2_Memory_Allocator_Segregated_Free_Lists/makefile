CC=gcc
CFLAGS= -O2 -DNDEBUG -Wall -fPIC -shared
OBJS= libmyalloc.so

TESTS= indextest memtest1 memtest2 memtest3 memtest4 memtest5 memtest6 memtest7 memtest8 memtest9

all: $(OBJS) test

libmyalloc.so:  allocator.c allocator.h
	$(CC) $(CFLAGS) allocator.c -lm -o libmyalloc.so

test: allocator.c allocator.h ./tests/indextest.c ./tests/memtest1.c ./tests/memtest2.c ./tests/memtest3.c ./tests/memtest4.c ./tests/memtest5.c ./tests/memtest6.c ./tests/memtest7.c ./tests/memtest8.c ./tests/memtest9.c
	$(CC) -Wall -g ./tests/indextest.c -o indextest
	$(CC) -Wall -g allocator.c -lm ./tests/memtest1.c -o memtest1
	$(CC) -Wall -g allocator.c -lm ./tests/memtest2.c -o memtest2
	$(CC) -Wall -g allocator.c -lm ./tests/memtest3.c -o memtest3
	$(CC) -Wall -g allocator.c -lm ./tests/memtest4.c -o memtest4
	$(CC) -Wall -g allocator.c -lm ./tests/memtest5.c -o memtest5
	$(CC) -Wall -g allocator.c -lm ./tests/memtest6.c -o memtest6
	$(CC) -Wall -g allocator.c -lm ./tests/memtest7.c -o memtest7
	$(CC) -Wall -g allocator.c -lm ./tests/memtest8.c -o memtest8
	$(CC) -Wall -g allocator.c -lm ./tests/memtest9.c -o memtest9

clean:
	rm -f $(OBJS) $(TESTS) core
