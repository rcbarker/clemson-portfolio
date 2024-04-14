CC= gcc
CFLAGS= -Wall -g

BINS= sctracer
TESTS= sctest

all: $(BINS) test

sctracer: sctracer.c
	$(CC) $(CFLAGS) -o sctracer sctracer.c

test: ./tests/sctest.c 
	$(CC) $(CFLAGS) -o sctest ./tests/sctest.c

clean:
	rm -f $(BINS) $(TESTS) core
 
