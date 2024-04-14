CC=gcc
CFLAGS=-Wall -g
BINS= ID3 debug

all: ID3 debug

ID3: ID3.c ID3.h ID3test.c
	$(CC) $(CFLAGS) ID3.c ID3.h ID3test.c -lm -o ID3

debug: ID3.c ID3.h ID3debug.c 
	$(CC) $(CFLAGS) ID3.c ID3.h ID3debug.c -lm -o debug

clean:
	rm -f $(BINS) core
